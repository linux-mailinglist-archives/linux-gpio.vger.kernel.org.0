Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4741F41BB4D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 01:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243458AbhI1X6j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 19:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243437AbhI1X6i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 19:58:38 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1368BC061762
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:56:58 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id z7-20020a63c047000000b0026b13e40309so605042pgi.19
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=A8qNzCNapMxw2jtmX47pKK84lMS41znzFOgk5hTsT4g=;
        b=rEo7ZDk5e74TCZBbSEUciWvSKxRQt3AIRdoY/S4aknlZO6vJvuU71n003Fc6U8WYth
         0kHrD/+d368nV17Q41I0GkP3xTCrlv8locgEp+y/zMuLznOMvYWEN+PPQznKHGoR1qwW
         5ud0uIR1ymaCY67XvJWUyz4g6h/cV3RcVB5tL1z/9Fg24KaHkZ25ldxkUJcT2SmvXUY+
         kZzVFsAcvtCEQAq6Vpjq5TdtIUyJh6TM6caJoAuvOJ7N2eOxGyi6a69qKunyA9Q98+EP
         pgCavuUeDMhoN70PAK08NwPgPm6cuBogJkWbzdO+vzmo9n3wqNgV7No4YROJsrnwFxYo
         O1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=A8qNzCNapMxw2jtmX47pKK84lMS41znzFOgk5hTsT4g=;
        b=wFVjQewL3S9T5YIbqS9c80W0E9R7T3dabZw5Cw5ogB/bg8ilVP99ylkU1WZYrbezBP
         PKTgXH41PqEE2y7R6GLBcWd6ZOCMERK6KwMlHzY8jT1uBFzKOoSYdBpRWiyrpqG1GG4f
         4Vu31WIoqmb1dut9/jzQA6e+74RzsIgauNwFqdbXzuRbVOsyC0yIhpNZrLykKg5tU9pI
         rX6/9F2B8cn2CvqaPhw1sW83yHnQVglivv63J4XUSrIE3Y2t+kgJHNa6bU/4jL85a5yZ
         ndhZ6a0ib9dKaA5nq+MG3nrCMcBI7ueVUb7LkBF8+HVpEA9jNuyaKzvYjKbEK3jmHgdN
         q7SA==
X-Gm-Message-State: AOAM533M73QlLXV0Dy3RgDS7blFzZDTR48p4B5daSOe7ioc0e6UmO9di
        GO1UpsXKmLcUqdMa6s6nwZvqP1xZlj8dpi6XTQo=
X-Google-Smtp-Source: ABdhPJwRgu3AvnXGjTVwA8JT01BkJv7hKMCFR0qy8+4P5LRuXfn4cDD3Trc0z1P2c4Oy7QYgSjVQOIaQWfZ46jPwhNE=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:7e05:b0:13d:e01a:be5f with
 SMTP id b5-20020a1709027e0500b0013de01abe5fmr243419plm.56.1632873417456; Tue,
 28 Sep 2021 16:56:57 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:20 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-4-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 03/12] clk: samsung: add support for CPU clocks
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds 'struct samsung_cpu_clock' and correpsonding code to the samsung
common clk driver. This allows drivers to register their CPU clocks with
the samsung_cmu_register_one() API.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-cpu.c | 26 ++++++++++++++++++++++++++
 drivers/clk/samsung/clk.c     |  2 ++
 drivers/clk/samsung/clk.h     | 26 ++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 00ef4d1b0888..b5017934fc41 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -469,3 +469,29 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	kfree(cpuclk);
 	return ret;
 }
+
+void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+		const struct samsung_cpu_clock *list, unsigned int nr_clk)
+{
+	unsigned int idx;
+	unsigned int num_cfgs;
+	struct clk *parent_clk, *alt_parent_clk;
+	const struct clk_hw *parent_clk_hw = NULL;
+	const struct clk_hw *alt_parent_clk_hw = NULL;
+
+	for (idx = 0; idx < nr_clk; idx++, list++) {
+		/* find count of configuration rates in cfg */
+		for (num_cfgs = 0; list->cfg[num_cfgs].prate != 0; )
+			num_cfgs++;
+
+		parent_clk = __clk_lookup(list->parent_name);
+		if (parent_clk)
+			parent_clk_hw = __clk_get_hw(parent_clk);
+		alt_parent_clk = __clk_lookup(list->alt_parent_name);
+		if (alt_parent_clk)
+			alt_parent_clk_hw = __clk_get_hw(alt_parent_clk);
+
+		exynos_register_cpu_clock(ctx, list->id, list->name, parent_clk_hw,
+				alt_parent_clk_hw, list->offset, list->cfg, num_cfgs, list->flags);
+	}
+}
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 1949ae7851b2..336243c6f120 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -378,6 +378,8 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 		samsung_clk_extended_sleep_init(reg_base,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
+	if (cmu->cpu_clks)
+		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 
 	samsung_clk_of_add_provider(np, ctx);
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index c1e1a6b2f499..a52a38cc1740 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -271,6 +271,27 @@ struct samsung_pll_clock {
 	__PLL(_typ, _id, _name, _pname, CLK_GET_RATE_NOCACHE, _lock,	\
 	      _con, _rtable)
 
+struct samsung_cpu_clock {
+	unsigned int		id;
+	const char		*name;
+	const char		*parent_name;
+	const char		*alt_parent_name;
+	unsigned long		flags;
+	int			offset;
+	const struct exynos_cpuclk_cfg_data *cfg;
+};
+
+#define CPU_CLK(_id, _name, _pname, _apname, _flags, _offset, _cfg) \
+	{							    \
+		.id		  = _id,			    \
+		.name		  = _name,			    \
+		.parent_name	  = _pname,			    \
+		.alt_parent_name  = _apname,			    \
+		.flags		  = _flags,			    \
+		.offset		  = _offset,			    \
+		.cfg		  = _cfg,			    \
+	}
+
 struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
@@ -301,6 +322,9 @@ struct samsung_cmu_info {
 	unsigned int nr_fixed_factor_clks;
 	/* total number of clocks with IDs assigned*/
 	unsigned int nr_clk_ids;
+	/* list of cpu clocks and respective count */
+	const struct samsung_cpu_clock *cpu_clks;
+	unsigned int nr_cpu_clks;
 
 	/* list and number of clocks registers */
 	const unsigned long *clk_regs;
@@ -350,6 +374,8 @@ extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
+extern void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
 extern struct samsung_clk_provider __init *samsung_cmu_register_one(
 			struct device_node *,
-- 
2.33.0.685.g46640cef36-goog

