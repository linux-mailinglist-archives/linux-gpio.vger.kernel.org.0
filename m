Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B30D3E8FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 13:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhHKLtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 07:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbhHKLs5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 07:48:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4CBC0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 04:48:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bo19so3258270edb.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IBqAGt7NCaMVSrzsG3nRnZYNyJd2DAvWfClv9tIAhNY=;
        b=mVxpl+IuYEZemEO9SMcLGIFeFZTygH0nPhRboBs3i9UrFGpAX585rQgd7S1Wwffk2D
         oN5Hw6LivDQpleLR8j0iwDtZ6Vuo7oTI3lVyJfi7K/ZJBMuEl9dLbY3zq+e6yhwODeik
         ZcBfJ9W6xGlzVay+icH2gXZL3wHPuj3cWTZDhTpI5+WrxPk9oinNr47AHM3aHchrh3ep
         elj28Ei6F1lCQsKH1iGGq8JMNouG8SqIVaRqcHL+l3XdcyceX6pFmcF4f2rgBbt6ZtfG
         +gUP11opeSelMEkgoh1xo8xjgp7LXQ2GWkD00dujfE1WtUc+8JEKJLjknPwv6f2LjtB9
         efRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBqAGt7NCaMVSrzsG3nRnZYNyJd2DAvWfClv9tIAhNY=;
        b=X6+QvvyCKGZ4GZ3RQgpuAtMXto+MH+efqeSCYSDA/ORRUXJi+BuMam6vMG3iautF3B
         CR9BDMR7DBDJcFd7LMjp/jcW6n7cA80HWoY9aIuP7ENPh/72xTVatBAZjR3rUcpFXaHn
         GpZhVoNX9stDI6Xie2ZJ9sGi1Ki6wAfyiMEsWgvSR+MQ38dnSZVTmmUgZu3E7TV1vfYP
         8UEamwpLRPJaNr4sr5lnxRi/AI0FsgsKh/CR/Ba2Em1yUSMPUHmJdGw83vEsn5uwRZc7
         Z0qn2y5TIkWS7vpjJY4jzwhurxm77UFD/cXtLVsUx7ej2YGQtOhapHOooexypyG4COXo
         q5yA==
X-Gm-Message-State: AOAM532vDmb//iGubGrI1WZUdZ365aO1H7gT3b63daZ1yqsD9OyBIkJx
        1UTcs7ZGB8e505/ix/+HqCzfhg==
X-Google-Smtp-Source: ABdhPJzdhoyd6+igmt9wOLqhLsCfDszAbj6btC4lHbKMB8VJIEE/5787g0YAJPV0GFh9Wd2COZLnVA==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr10658061edu.359.1628682512525;
        Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id n10sm8159766ejk.86.2021.08.11.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
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
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 2/7] pinctrl: samsung: Add Exynos850 SoC specific data
Date:   Wed, 11 Aug 2021 14:48:22 +0300
Message-Id: <20210811114827.27322-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Samsung Exynos850 SoC specific data to enable pinctrl support for
all platforms based on Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Added const qualifier to exynos850_bank_type_* structs
  - Added const and __initconst qualifiers to exynos850_pin_banks*[]
    arrays
  - Renamed EXYNOS9_* mactos to EXYNOS850_*

Changes in v2:
  - Removed .suspend/.resume callbacks, as retention registers are not
    implemented yet for Exynos850
  - Removed .eint_gpio_init for AUD domain, as there are no external
    interrupts available for that domain

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 116 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 4 files changed, 148 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index b6e56422a700..616c7840927f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -40,6 +40,24 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
 	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
 };
 
+/*
+ * Bank type for non-alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
+ */
+static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
+	.fld_width = { 4, 1, 4, 4, 2, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+/*
+ * Bank type for alive type. Bit fields:
+ * CON: 4, DAT: 1, PUD: 4, DRV: 4
+ */
+static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
 /* Pad retention control code for accessing PMU regmap */
 static atomic_t exynos_shared_retention_refcnt;
 
@@ -422,3 +440,101 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 	.ctrl		= exynos7_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
+
+/* pin banks of exynos850 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
+	EXYNOS850_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
+	EXYNOS850_PIN_BANK_EINTN(3, 0x0A0, "gpq0"),
+};
+
+/* pin banks of exynos850 pin-controller 1 (CMGP) */
+static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+	EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+};
+
+/* pin banks of exynos850 pin-controller 2 (AUD) */
+static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
+};
+
+/* pin banks of exynos850 pin-controller 3 (HSI) */
+static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
+};
+
+/* pin banks of exynos850 pin-controller 4 (CORE) */
+static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
+};
+
+/* pin banks of exynos850 pin-controller 5 (PERI) */
+static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
+	/* Must start with EINTG banks, ordered by EINT group number. */
+	EXYNOS850_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0C),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x0A0, "gpg2", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(1, 0x0C0, "gpg3", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x0E0, "gpc0", 0x1C),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
+};
+
+static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
+	{
+		/* pin-controller instance 0 ALIVE data */
+		.pin_banks	= exynos850_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 1 CMGP data */
+		.pin_banks	= exynos850_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+	}, {
+		/* pin-controller instance 2 AUD data */
+		.pin_banks	= exynos850_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks2),
+	}, {
+		/* pin-controller instance 3 HSI data */
+		.pin_banks	= exynos850_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 4 CORE data */
+		.pin_banks	= exynos850_pin_banks4,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks4),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin-controller instance 5 PERI data */
+		.pin_banks	= exynos850_pin_banks5,
+		.nr_banks	= ARRAY_SIZE(exynos850_pin_banks5),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
+	.ctrl		= exynos850_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos850_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index da1ec13697e7..bfad1ced8017 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -108,6 +108,35 @@
 		.pctl_res_idx   = pctl_idx,			\
 	}							\
 
+#define EXYNOS850_PIN_BANK_EINTN(pins, reg, id)			\
+	{							\
+		.type		= &exynos850_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_NONE,		\
+		.name		= id				\
+	}
+
+#define EXYNOS850_PIN_BANK_EINTG(pins, reg, id, offs)		\
+	{							\
+		.type		= &exynos850_bank_type_off,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_GPIO,		\
+		.eint_offset	= offs,				\
+		.name		= id				\
+	}
+
+#define EXYNOS850_PIN_BANK_EINTW(pins, reg, id, offs)		\
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

