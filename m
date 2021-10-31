Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68E2440F3B
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 16:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhJaPxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 11:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhJaPxq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 11:53:46 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C8BC061714;
        Sun, 31 Oct 2021 08:51:14 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so55876437edj.1;
        Sun, 31 Oct 2021 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TYlHk3+5Vaq9k4XGas+SLi2wrRD9NKItjItDKAFIV3k=;
        b=RU8uSMZCVOYT4ZSFbiRuuAVZnxSvAGMZj9IyhyJ3HJ1oh494GcIr3QwPOFPYofEYGC
         RqrHsHLcRi8UouMoPVsJkLTqcNxe/hAFlrhUbijN1OGEg/hqb8uT9QvxzULTW7H9YttT
         WJhGxqHwlvFm9MQID4o4m4Z6d4OLrv1VA5dzOTtX66TZgcTVh+HkzbZQCTKpgNhZi0Hi
         +Hj2Tk4PDUw5DURO3YS9hQ/evjUXrlrq6BRJyrcz8jiC7fci2UwtUlQ7lGND49ukQIIc
         Iemdg02q3Y9eMiXExYh7Z/rOit+0jzThhd0XEl+diSVKl0I8xHNvxFicuKFFmr7CuLYo
         1lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TYlHk3+5Vaq9k4XGas+SLi2wrRD9NKItjItDKAFIV3k=;
        b=R7ftrdXWqff8c4aa5EhCwnT8IxJNbOohMRlL76lg/mNf2Vd4jeAQ8JEulmlGqGw4OF
         28rNfhAdrsLqexiE2JlB6VaB73UEzy87eH8MTXrU3I5ob8Nx1ZNmt5OcdwW3InmhPcpV
         +g4JqRfnTRjSqewRDD6yKzfeQJbkrGDS3HeCHrisPvcRIdsJ507BN3IBkaGm83eCp8Ja
         OOCh6s60TSt6k+yFdQ0PosE2u3Ie1BfNG0j7O6aZEpum1jQhZSvyvKrpCD9d1xISeudj
         hCl+uzRs3LJ4EpqCKnLRB+JmvdxeDD+EEwbvJz3dwIqU/SMJ7XQ8Iwpt4KV8GotnPMBl
         9mZA==
X-Gm-Message-State: AOAM532ztYeiTdP5iaett/OTB9w/Qeli74/6oSOc+vIaK5Ff0Okgs/AC
        rxjvQfOqyytCv6062ZvP+2vdrsfc4tLb5wJqitw=
X-Google-Smtp-Source: ABdhPJxJJra0AL3tUnHaQdx9pJmeh5sDUZcesdKrH+mjqmzErZD4phEhurGYGS1QJbf4/vn2zqpxOw==
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr3495235edh.318.1635695473511;
        Sun, 31 Oct 2021 08:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id z2sm5915171ejb.41.2021.10.31.08.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:51:13 -0700 (PDT)
From:   David Virag <virag.david003@gmail.com>
Cc:     David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: samsung: Add Exynos7885 SoC specific data
Date:   Sun, 31 Oct 2021 16:51:02 +0100
Message-Id: <20211031155102.20225-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211031154851.20103-1-virag.david003@gmail.com>
References: <20211031154851.20103-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add Samsung Exynos7885 SoC specific data to enable pinctrl support for
all platforms based on Exynos7885.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 81 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 3 files changed, 84 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 6b77fd24571e..8bad82e709d3 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -441,6 +441,87 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
 
+/* pin banks of exynos7885  pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks0[] = {
+	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
+	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(5, 0x0a0, "gpq0", 0x0c),
+};
+
+/* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks1[] = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08),
+};
+
+/* pin banks of exynos7885 pin-controller 2 (FSYS) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks2[] = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf2", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x040, "gpf3", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x060, "gpf4", 0x0c),
+};
+
+/* pin banks of exynos7885 pin-controller 3 (TOP) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks3[] = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpp0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x020, "gpg0", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0c),
+	EXYNOS850_PIN_BANK_EINTG(3, 0x080, "gpp3", 0x10),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x0a0, "gpp4", 0x14),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x0c0, "gpp5", 0x18),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x0e0, "gpp6", 0x1c),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x100, "gpp7", 0x20),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp8", 0x24),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x140, "gpg1", 0x28),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x160, "gpg2", 0x2c),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x180, "gpg3", 0x30),
+	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpg4", 0x34),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpc0", 0x38),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x1e0, "gpc1", 0x3c),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x200, "gpc2", 0x40),
+};
+
+const struct samsung_pin_ctrl exynos7885_pin_ctrl[] = {
+	{
+		/* pin-controller instance 0 Alive data */
+		.pin_banks	= exynos7885_pin_banks0,
+		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 DISPAUD data */
+		.pin_banks	= exynos7885_pin_banks1,
+		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks1),
+	}, {
+		/* pin-controller instance 2 FSYS data */
+		.pin_banks	= exynos7885_pin_banks2,
+		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 TOP data */
+		.pin_banks	= exynos7885_pin_banks3,
+		.nr_banks	= ARRAY_SIZE(exynos7885_pin_banks3),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data exynos7885_of_data __initconst = {
+	.ctrl		= exynos7885_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(exynos7885_pin_ctrl),
+};
+
 /* pin banks of exynos850 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 23f355ae9ca0..8941f658e7f1 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1264,6 +1264,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynos5433_of_data },
 	{ .compatible = "samsung,exynos7-pinctrl",
 		.data = &exynos7_of_data },
+	{ .compatible = "samsung,exynos7885-pinctrl",
+		.data = &exynos7885_of_data },
 	{ .compatible = "samsung,exynos850-pinctrl",
 		.data = &exynos850_of_data },
 	{ .compatible = "samsung,exynosautov9-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 547968a31aed..1f8d30ba05af 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -339,6 +339,7 @@ extern const struct samsung_pinctrl_of_match_data exynos5410_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5420_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos5433_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
-- 
2.33.1

