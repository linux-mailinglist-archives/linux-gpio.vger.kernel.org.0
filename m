Return-Path: <linux-gpio+bounces-25809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C6B4AAE1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0B9C7A691B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 10:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25612D1913;
	Tue,  9 Sep 2025 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gun9NEwL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935872749E2;
	Tue,  9 Sep 2025 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757414573; cv=none; b=NYSJvoIEv8+R+BAs2EkrmiiBZFj8tIEC4Kk7yhq1IhymLLavjC2bxK+K+m1V/a8IHhFble98RDNyAe1Pz5u+IYtNIMb5tdAaKOcC9kc3ujezoIb5y74inne8XtEZTTlgwQEjgF9wgdcQg0PDrG0f1qYoZO4qFXGexUUoRlobVp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757414573; c=relaxed/simple;
	bh=OmjSehNn7erBpvi0zosL7YlZzfaNRjX4KmOvOrUFn5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+zMwIkQ07q4fUAoSeW0/Xj36lfTEcadO3uUiM9apmgpm5diPNbDohxU36BIfAnD1pUK7ZxHYNj4nBMkMSovKHGoDP8iEB9bQw5PfZZs1fEDGXNo7Glniv5vZMb/eUuZy2qpa5m48tXUkGqY8KS7yCQTx/Vr1IZQux9zijKkstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gun9NEwL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de6490e74so18951105e9.2;
        Tue, 09 Sep 2025 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757414570; x=1758019370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PtVBJUdObJJIpLH+F+6ZRgKDnXKtJwhSlNz3Z/GfiA=;
        b=Gun9NEwLfIfecOJXNW1LB6ousKtJ/rNa2ldtGcWlNK8HmF4YxBquyK0U5qlSxOQJpw
         xDX+yjEeuNqGpWOgDnKEmwAsBzy+5PIVr//tVMDgR3gl7JtXBI6OpFH8L/NCKpdQlLj1
         AIktql1XUhdM6Tip9RJHd1p4SFC26yC7/I6qAUHXzaS7bQGInzcNBOIL3HxtLqqUBA9d
         1j8yGNlDFRcjAsC92WeL1AB5hny/d5ooV/R1bgGSjRefoSjmi/hyHP1itVX/u7M6D+fg
         0dW7VrPG2t2pAVr9bxo8zJ3QtHm+7emHCdaG9ek6bb8a5+sXRmqDEc3/ap8bI2XsNxyu
         8sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757414570; x=1758019370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PtVBJUdObJJIpLH+F+6ZRgKDnXKtJwhSlNz3Z/GfiA=;
        b=Ler+Udegu6pGdM0h4IQ9IQynbveDslFcK1sJJDbVTVKJs3Rsa38jpFomrhBMq+JW2R
         WJFS46zzCHP3IwV/1K1Ikicljl+wdNIVKCeiwnrGeZngg92xqQeMDoO3xmfi2Ohq/ER5
         XlY2i334ljtVz7iFmP7i2D923MxYe7rjC7qpGn0XhBIQS+aF3gGMeHegioFs60v3cqJQ
         OiIlEuzI/zVLq55ZZ80CM1nuG3B/Z/1XOqC7gl2ehSUV4b821SLbrhvwIDc8+9fLpXK3
         aOEU03rg2lv9a9y1kLf8M2wpYPurYc7NtjJd5JgJAXQCSDEQvjqoGsayFyqff2hA2sQa
         RUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP0Ow8QzrP7gH1uiEtDaSQ2tuHmR7zeXctE+nzmxS8tcnMjgpgUkYx+r6opOQlKv3aFWm5Bam3oZki@vger.kernel.org, AJvYcCUiBZF0dWlatbsRoT9oJYqMhu57WosAvXCsiVv3rF+Yznx4v3plIazIk/d4JOBi3A5b5l6o/8UF1RD/ejvuIvktjfE=@vger.kernel.org, AJvYcCXtJ00faoyDW4cNbGlCXaxJpgiDYEuufIB2fZkOaa7R9KQ4jQSyzmuf3pS0CYg6CnxuI0Y+osgHJ9tGtuzY@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6yM+1m34fTtMdDKf8q90pEwf4+hd465lB0xfeQ+R87mbZtYP
	qBOj8a5b24mKUfAtmL+p7bADvWHnJIdHQ0QhPsTzqa4wa44TiaSwFLWK
X-Gm-Gg: ASbGncvmvgsoIVhj4lYdo+gH04t/9fugaXPP8rQZi5JPSvtPq3IoaBhihH0dA0P1mwg
	u2JF/JC+0n0/l/7EuktStICyzB07FYYY16rPmML77u2DaRt2+QiqEi1IQ3lrO+D4Rk91zzcpNyE
	L06x//ABxOMyPj+QS4Qc+3QTScKar+q/ALhKB+VS/SIL+3d978Xm3aFLOFeKn8t/p+krvr+F6VD
	7YkX1/pt33ZsZFyhe2/qiiPOj2cnhTCrMuyO9nR9IDBMEGDNNFAzBPLiqsrrJfzRd88uynojbux
	aYdGbsGTHGQvQSrWWxHgjfEaC0UIcBHBkr2Fny6yaHN4Pr4KEMntTYP5C3vsT8DAxME/dJAxuyK
	KFU7CvAMBnfsWn85xQDiy5vK11OpiMjUNSF1Nggv9enD6cU4phMx0TeNw4VvcpVPQ6evArwU9M9
	XWRg==
X-Google-Smtp-Source: AGHT+IHeuEQn28kCIYU8gWVJoj3GISootcJAUteMoQ3nWTZPv/W9yyaxYuJwHORuQNEn7xnu/jlS0w==
X-Received: by 2002:a05:600c:1390:b0:45a:236a:23ba with SMTP id 5b1f17b1804b1-45ddded76a6mr91247765e9.22.1757414569402;
        Tue, 09 Sep 2025 03:42:49 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75215c51csm2137411f8f.0.2025.09.09.03.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:42:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
Date: Tue,  9 Sep 2025 11:42:44 +0100
Message-ID: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

There is no need to reconfigure the pin if the pin's configuration values
are same as the reset values. E.g.: PS0 pin configuration for NMI function
is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
code is first setting it to GPIO HI-Z state and then again reconfiguring
to NMI function leading to spurious IRQ. Drop the unnecessary pin
configurations from the driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped extra space before the == operator.
 * Moved spinlock acquire before reading pfc value.
 * Make sure it is configured for function in PMC register for
   skipping GPIO switch.
v1->v2:
 * Updated commit header and description.
 * Added check in rzg2l_pinctrl_set_pfc_mode() to avoid unnecessary
   configuration
 * Updated rzg2l_pinctrl_pm_setup_pfc() to make changes minimal
 Logs:
 
 STR using SLEEP button:
 root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
129:          0          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~# [  103.459191] PM: suspend entry (deep)
[  103.462898] Filesystems sync: 0.000 seconds
[  103.468988] Freezing user space processes
[  103.474815] Freezing user space processes completed (elapsed 0.001 seconds)
[  103.481817] OOM killer disabled.
[  103.485056] Freezing remaining freezable tasks
[  103.490977] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  103.498387] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[  103.556250] renesas-gbeth 15c30000.ethernet end0: Link is Down
[  103.568430] Disabling non-boot CPUs ...
[  103.573306] psci: CPU3 killed (polled 0 ms)
[  103.579244] psci: CPU2 killed (polled 4 ms)
[  103.585717] psci: CPU1 killed (polled 0 ms)
[  103.590320] Enabling non-boot CPUs ...
[  103.590529] Detected VIPT I-cache on CPU1
[  103.590577] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[  103.590616] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  103.591462] CPU1 is up
[  103.591560] Detected VIPT I-cache on CPU2
[  103.591583] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[  103.591605] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  103.592176] CPU2 is up
[  103.592275] Detected VIPT I-cache on CPU3
[  103.592298] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[  103.592319] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  103.593020] CPU3 is up
[  103.607003] dwmac4: Master AXI performs fixed burst length
[  103.607903] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[  103.607923] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[  103.611435] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[  103.626991] dwmac4: Master AXI performs fixed burst length
[  103.627881] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[  103.627896] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[  103.631423] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[  103.824301] OOM killer enabled.
[  103.827439] Restarting tasks: Starting
[  103.831759] Restarting tasks: Done
[  103.835223] random: crng reseeded on system resumption
[  103.840452] PM: suspend exit

root@smarc-rzg3e:~# [  106.180406] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx

root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
129:          1          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~#

STR using cmdline:
root@smarc-rzg3e:~# echo deep > /sys/power/mem_sleep
echo mem > /sys/power/stateroot@smarc-rzg3e:~# echo mem > /sys/power/state
[ 1196.663529] PM: suspend entry (deep)
[ 1196.667543] Filesystems sync: 0.000 seconds
[ 1196.673064] Freezing user space processes
[ 1196.679409] Freezing user space processes completed (elapsed 0.002 seconds)
[ 1196.686556] OOM killer disabled.
[ 1196.689910] Freezing remaining freezable tasks
[ 1196.696144] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[ 1196.703737] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[ 1196.747763] renesas-gbeth 15c30000.ethernet end0: Link is Down
[ 1196.760273] Disabling non-boot CPUs ...
[ 1196.764975] psci: CPU3 killed (polled 0 ms)
[ 1196.771159] psci: CPU2 killed (polled 4 ms)
[ 1196.777676] psci: CPU1 killed (polled 0 ms)
[ 1196.780129] Enabling non-boot CPUs ...
[ 1196.780343] Detected VIPT I-cache on CPU1
[ 1196.780391] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[ 1196.780430] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[ 1196.781219] CPU1 is up
[ 1196.781315] Detected VIPT I-cache on CPU2
[ 1196.781337] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[ 1196.781358] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[ 1196.781867] CPU2 is up
[ 1196.781966] Detected VIPT I-cache on CPU3
[ 1196.781988] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[ 1196.782010] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[ 1196.782643] CPU3 is up
[ 1196.798955] dwmac4: Master AXI performs fixed burst length
[ 1196.799861] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[ 1196.799881] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[ 1196.803386] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[ 1196.818938] dwmac4: Master AXI performs fixed burst length
[ 1196.819832] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[ 1196.819848] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[ 1196.823391] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[ 1197.020126] OOM killer enabled.
[ 1197.023265] Restarting tasks: Starting
[ 1197.027513] Restarting tasks: Done
[ 1197.030980] random: crng reseeded on system resumption
[ 1197.036203] PM: suspend exit
root@smarc-rzg3e:~# echo deep > /sys/power/mem_sleep[ 1199.390705] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
129:          1          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~#
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f524af6f586f..c7eb5566b340 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -541,9 +541,16 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
 	unsigned long flags;
-	u32 reg;
+	u32 reg, pfc;
 
+	/* Switching to GPIO is not required if reset value is same as func */
+	reg = readb(pctrl->base + PMC(off));
 	spin_lock_irqsave(&pctrl->lock, flags);
+	pfc = readl(pctrl->base + PFC(off));
+	if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		return;
+	}
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg = readw(pctrl->base + PM(off));
@@ -557,9 +564,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
 
 	/* Select Pin function mode with PFC register */
-	reg = readl(pctrl->base + PFC(off));
-	reg &= ~(PFC_MASK << (pin * 4));
-	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
+	pfc &= ~(PFC_MASK << (pin * 4));
+	writel(pfc | (func << (pin * 4)), pctrl->base + PFC(off));
 
 	/* Switch to Peripheral pin function with PMC register */
 	reg = readb(pctrl->base + PMC(off));
@@ -3113,11 +3119,18 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 		pm = readw(pctrl->base + PM(off));
 		for_each_set_bit(pin, &pinmap, max_pin) {
 			struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+			u32 pfc_val, pfc_mask;
 
 			/* Nothing to do if PFC was not configured before. */
 			if (!(cache->pmc[port] & BIT(pin)))
 				continue;
 
+			pfc_val = readl(pctrl->base + PFC(off));
+			pfc_mask = PFC_MASK << (pin * 4);
+			/* Nothing to do if reset value of the pin is same as cached value */
+			if ((cache->pfc[port] & pfc_mask) == (pfc_val & pfc_mask))
+				continue;
+
 			/* Set pin to 'Non-use (Hi-Z input protection)' */
 			pm &= ~(PM_MASK << (pin * 2));
 			writew(pm, pctrl->base + PM(off));
@@ -3127,8 +3140,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 			writeb(pmc, pctrl->base + PMC(off));
 
 			/* Select Pin function mode. */
-			pfc &= ~(PFC_MASK << (pin * 4));
-			pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
+			pfc &= ~pfc_mask;
+			pfc |= (cache->pfc[port] & pfc_mask);
 			writel(pfc, pctrl->base + PFC(off));
 
 			/* Switch to Peripheral pin function. */
-- 
2.43.0


