Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B3C3DBB17
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbhG3Otf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239408AbhG3Otd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:49:33 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C15AC0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y7so11302588eda.5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oucSWqd2Upc6KKkyfWV0IJp2NLgthdYtxzWx2GWfir8=;
        b=ulgq632Fd0xqLz2p5My2oHtSSQL4OLQMHAGE8TmwfTD94GLvD/4YhRyZ9pdhC/VSHT
         Xc8+XMqEdBjT4juSTCCpO5yjhUwb6bxDtunDCRSxNkPlFAIy27ILB/dzZcbU72XrDU+k
         jOrX/iKfq5oc03OWSBDnx0WfCB/TvxSCsIvNdT3AgV5cFMkkktTWDWfITS7F9xKuVGK2
         kER7SxW/ZNgLsFhQrVlOl4zqWgvH5AlW10fIkRcC5/PVSXwrVQExGVDmjwVnwOK8mCLI
         OF8dLnqOgjsNE6sYpZMFNBaXUzqOZXRQyZQCzvCPCpfXlhanTI5Z0CyJz722fMcPMj70
         /wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oucSWqd2Upc6KKkyfWV0IJp2NLgthdYtxzWx2GWfir8=;
        b=Teu5wb0d+L4KLyST9DRL9Y/lLtjhBKK0Zb5WFSa2myzapTcifNGZEw3KjJ6dhjRyAb
         hz6NA2SLGK1uvSFrp6hSj7N3lO0bMbqB2Ko9K58GwCONdVrY9/tx7k/n5VTjMemOD5GP
         MJwcHeEmgw3kNBC+fNNAWynAzaVZ0h/2OrJ0fY41/o56bNPWII4w94i+5Vu0BiBFFySL
         IKizyg+uVK9yIqxPyRdONOCXeSkkRW0+IFbX4A8ndGSdOusrjB9yA3bJZSoMsp8axzSU
         Ms3lsL79BJiIjMl70kGdOvyzilE6CqWpQC2fsPJcLIzHb4jVufxvmu+IvI6XhDQRLAJZ
         5D9Q==
X-Gm-Message-State: AOAM531Fj9pfoW5+5M3EuVogzpVfQKrepg1FRUmkLIDagHT8vr5l/e+r
        nWKWcBRNblc7LQYRBEadOSy/sw==
X-Google-Smtp-Source: ABdhPJwZTETnRV0IX+0aMy2qAfILeZcsfcOkPVodGlMMgJV084A1VQPSFg0SA4w45tClKJiGH6eJcw==
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr3436761edb.252.1627656567043;
        Fri, 30 Jul 2021 07:49:27 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g23sm634979ejm.26.2021.07.30.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:26 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 02/12] pinctrl: samsung: Add Exynos850 SoC specific data
Date:   Fri, 30 Jul 2021 17:49:12 +0300
Message-Id: <20210730144922.29111-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Samsung Exynos850 SoC specific data to enable pinctrl support for
all platforms based on Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 129 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 161 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b6e56422a700..9c71ff84ba7e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -40,6 +40,24 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
 };
 
+/*
+ * Bank type for non-alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
+ */
+static struct samsung_pin_bank_type exynos850_bank_type_off  = {
+	.fld_width = { 4, 1, 4, 4, 2, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+/*
+ * Bank type for alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4
+ */
+static struct samsung_pin_bank_type exynos850_bank_type_alive = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
@@ -422,3 +440,114 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 	.ctrl		= exynos7_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
+
+/* pin banks of exynos850 pin-controller 0 (ALIVE) */
+static struct samsung_pin_bank_data exynos850_pin_banks0[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
+	EXYNOS9_PIN_BANK_EINTN(3, 0x0A0, "gpq0"),
+};
+
+/* pin banks of exynos850 pin-controller 1 (CMGP) */
+static struct samsung_pin_bank_data exynos850_pin_banks1[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+	EXYNOS9_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+};
+
+/* pin banks of exynos850 pin-controller 2 (AUD) */
+static struct samsung_pin_bank_data exynos850_pin_banks2[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
+};
+
+/* pin banks of exynos850 pin-controller 3 (HSI) */
+static struct samsung_pin_bank_data exynos850_pin_banks3[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
+};
+
+/* pin banks of exynos850 pin-controller 4 (CORE) */
+static struct samsung_pin_bank_data exynos850_pin_banks4[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
+};
+
+/* pin banks of exynos850 pin-controller 5 (PERI) */
+static struct samsung_pin_bank_data exynos850_pin_banks5[] = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS9_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x0A0, "gpg2", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(1, 0x0C0, "gpg3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(3, 0x0E0, "gpc0", 0x1C),
+	EXYNOS9_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
+};
+
+static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos850_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos850_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 AUD data */
+		.pin_banks	= exynos850_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 HSI data */
+		.pin_banks	= exynos850_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 4 CORE data */
+		.pin_banks	= exynos850_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 5 PERI data */
+		.pin_banks	= exynos850_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
+	.ctrl		= exynos850_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index da1ec13697e7..595086f2d5dd 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -108,6 +108,35 @@
 		.pctl_res_idx   = pctl_idx,			\
 	}							\
 
+#define EXYNOS9_PIN_BANK_EINTN(pins, reg, id)			\
+	{							\
+		.type		= &exynos850_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_NONE,		\
+		.name		= id				\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos850_bank_type_off,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_GPIO,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos850_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_WKUP,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 2975b4369f32..2a0fc63516f1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1264,6 +1264,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
 		.data = &exynos7_of_data },
+	{ .compatible = "samsung,exynos850-pinctrl",
+		.data = &exynos850_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index de44f8ec330b..4c2149e9c544 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -339,6 +339,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5410_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5420_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.30.2

