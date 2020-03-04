Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2060A179BFD
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 23:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388488AbgCDWyn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 17:54:43 -0500
Received: from muru.com ([72.249.23.125]:58882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388468AbgCDWyn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 17:54:43 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E791D8185;
        Wed,  4 Mar 2020 22:55:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/3] ARM: OMAP2+: Handle errors for cpu_pm
Date:   Wed,  4 Mar 2020 14:54:30 -0800
Message-Id: <20200304225433.37336-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304225433.37336-1-tony@atomide.com>
References: <20200304225433.37336-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to check for errors when calling cpu_pm_enter() and
cpu_cluster_pm_enter(). And we need to bail out on errors as
otherwise we can enter a deeper idle state when not desired.

I'm not aware of the lack of error handling causing issues yet,
but we need this at least for blocking deeper idle states when
a GPIO instance has pending interrupts.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Ladislav Michl <ladis@linux-mips.org>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/cpuidle34xx.c |  9 +++++++--
 arch/arm/mach-omap2/cpuidle44xx.c | 26 +++++++++++++++++---------
 arch/arm/mach-omap2/pm34xx.c      |  8 ++++++--
 3 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap2/cpuidle34xx.c b/arch/arm/mach-omap2/cpuidle34xx.c
--- a/arch/arm/mach-omap2/cpuidle34xx.c
+++ b/arch/arm/mach-omap2/cpuidle34xx.c
@@ -109,6 +109,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 			    int index)
 {
 	struct omap3_idle_statedata *cx = &omap3_idle_data[index];
+	int error;
 
 	if (omap_irq_pending() || need_resched())
 		goto return_sleep_time;
@@ -125,8 +126,11 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 	 * Call idle CPU PM enter notifier chain so that
 	 * VFP context is saved.
 	 */
-	if (cx->mpu_state == PWRDM_POWER_OFF)
-		cpu_pm_enter();
+	if (cx->mpu_state == PWRDM_POWER_OFF) {
+		error = cpu_pm_enter();
+		if (error)
+			goto out_clkdm_set;
+	}
 
 	/* Execute ARM wfi */
 	omap_sram_idle();
@@ -139,6 +143,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
 	    pwrdm_read_prev_pwrst(mpu_pd) == PWRDM_POWER_OFF)
 		cpu_pm_exit();
 
+out_clkdm_set:
 	/* Re-allow idle for C1 */
 	if (cx->flags & OMAP_CPUIDLE_CX_NO_CLKDM_IDLE)
 		clkdm_allow_idle(mpu_pd->pwrdm_clkdms[0]);
diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
--- a/arch/arm/mach-omap2/cpuidle44xx.c
+++ b/arch/arm/mach-omap2/cpuidle44xx.c
@@ -122,6 +122,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 {
 	struct idle_statedata *cx = state_ptr + index;
 	u32 mpuss_can_lose_context = 0;
+	int error;
 
 	/*
 	 * CPU0 has to wait and stay ON until CPU1 is OFF state.
@@ -159,7 +160,9 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 	 * Call idle CPU PM enter notifier chain so that
 	 * VFP and per CPU interrupt context is saved.
 	 */
-	cpu_pm_enter();
+	error = cpu_pm_enter();
+	if (error)
+		goto cpu_pm_out;
 
 	if (dev->cpu == 0) {
 		pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
@@ -169,13 +172,17 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 		 * Call idle CPU cluster PM enter notifier chain
 		 * to save GIC and wakeupgen context.
 		 */
-		if (mpuss_can_lose_context)
-			cpu_cluster_pm_enter();
+		if (mpuss_can_lose_context) {
+			error = cpu_cluster_pm_enter();
+			if (error)
+				goto cpu_cluster_pm_out;
+		}
 	}
 
 	omap4_enter_lowpower(dev->cpu, cx->cpu_state);
 	cpu_done[dev->cpu] = true;
 
+cpu_cluster_pm_out:
 	/* Wakeup CPU1 only if it is not offlined */
 	if (dev->cpu == 0 && cpumask_test_cpu(1, cpu_online_mask)) {
 
@@ -197,12 +204,6 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 		}
 	}
 
-	/*
-	 * Call idle CPU PM exit notifier chain to restore
-	 * VFP and per CPU IRQ context.
-	 */
-	cpu_pm_exit();
-
 	/*
 	 * Call idle CPU cluster PM exit notifier chain
 	 * to restore GIC and wakeupgen context.
@@ -210,6 +211,13 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
 	if (dev->cpu == 0 && mpuss_can_lose_context)
 		cpu_cluster_pm_exit();
 
+	/*
+	 * Call idle CPU PM exit notifier chain to restore
+	 * VFP and per CPU IRQ context.
+	 */
+	cpu_pm_exit();
+
+cpu_pm_out:
 	tick_broadcast_exit();
 
 fail:
diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -191,6 +191,7 @@ void omap_sram_idle(void)
 	int per_next_state = PWRDM_POWER_ON;
 	int core_next_state = PWRDM_POWER_ON;
 	u32 sdrc_pwr = 0;
+	int error;
 
 	mpu_next_state = pwrdm_read_next_pwrst(mpu_pwrdm);
 	switch (mpu_next_state) {
@@ -219,8 +220,11 @@ void omap_sram_idle(void)
 	pwrdm_pre_transition(NULL);
 
 	/* PER */
-	if (per_next_state == PWRDM_POWER_OFF)
-		cpu_cluster_pm_enter();
+	if (per_next_state == PWRDM_POWER_OFF) {
+		error = cpu_cluster_pm_enter();
+		if (error)
+			return;
+	}
 
 	/* CORE */
 	if (core_next_state < PWRDM_POWER_ON) {
-- 
2.25.1
