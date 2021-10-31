Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0C44116A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 00:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhJaXT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 19:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhJaXT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 19:19:59 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C9CC061714;
        Sun, 31 Oct 2021 16:17:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w15so58705635edc.9;
        Sun, 31 Oct 2021 16:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z7zm4v+bWIoT6uH6gIqot3vADKrXgOQGICghzSDhu8o=;
        b=ZPnljjslyg9IxAZfEbD/0v+JxviUPMjgZi9LdEKOHF0iTPYI1yPhLaGUrt17B9NYec
         zGS9zerJn7n4NSgnruwVV1LUPbQbAK1FX9LFV1NU5HRKyaQ3FJuYGp5wh4Q6tLlLo24d
         Ub5fuQKIJZZR8+YxcSJa2N272zl5S1jW5ie9y9XeaK0f7vONX3mcfP84EfkNo3XVTgse
         tM3TKsYL06IDxrowC8xRpCv/j66JyqfLVfHdf+oJrfkVXi03v82q3zyyWqAwcbbcDa4L
         4sWg/clHgKvZMPZtCkc34GhamdLWqaqV0vltggDsjmSaXwo/uBCcf/wkORIRIYFZdpFj
         Evzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z7zm4v+bWIoT6uH6gIqot3vADKrXgOQGICghzSDhu8o=;
        b=3am4rGX3msfu3lrMsigj0kQh7A2/3mtu93+cpi0QUxTZs5+dClKbH7/kzGNrGbqY/k
         0e/MQg0EWHyA35l6CkkdqDONNoT+5oa/52bkmgSyQzcmLaJOXYtpl11S9IqxPPKNpARS
         tFdhRqAT94MSLZ/o/ihcuf5UJL0G4fylxGt4Zxxe6QiUVOnfzsjQ5tiQyLRXWJbLt91M
         96BhVXQKsFkcpsZLb+2e1cBgrPuj8JSBeiaVNkxDAXIOllaZhw+YdJNHlajQAu00Hbz7
         rMaiMsgS2fj241A/qEWPsBr35wWXniTHvAEBsi6jhDwEprwcSVQ26O150uZLzl1K5K/3
         PiQg==
X-Gm-Message-State: AOAM532MmLCBQIefT2ieZgM6nbv5d3eSR9pki3kfUG/yvShle4Ntk5oi
        5Pi5Ar0c78ir5bqV5a0lVwA=
X-Google-Smtp-Source: ABdhPJyWY5X0zQ8n6VF0lk4svCSEgfqtA8/966onbPsX9YxXA1AKdeqkpRfHTBqHG9qpag0TDJphUw==
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr4495954ejc.141.1635722245179;
        Sun, 31 Oct 2021 16:17:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id u9sm8165503edf.47.2021.10.31.16.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 16:17:24 -0700 (PDT)
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
Subject: [PATCH v2 2/2] pinctrl: samsung: Add Exynos7885 SoC specific data
Date:   Mon,  1 Nov 2021 00:17:19 +0100
Message-Id: <20211031231720.46994-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211031231511.46856-1-virag.david003@gmail.com>
References: <20211031231511.46856-1-virag.david003@gmail.com>
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
Changes in v2:
  - Added missing initconsts
  - Fixed a double space in the first comment

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 81 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 3 files changed, 84 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 6b77fd24571e..645371d9866f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -441,6 +441,87 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
 	.num_ctrl	= ARRAY_SIZE(exynos7_pin_ctrl),
 };
 
+/* pin banks of exynos7885 pin-controller 0 (ALIVE) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
+	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
+	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa0", 0x00),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa1", 0x04),
+	EXYNOS850_PIN_BANK_EINTW(8, 0x080, "gpa2", 0x08),
+	EXYNOS850_PIN_BANK_EINTW(5, 0x0a0, "gpq0", 0x0c),
+};
+
+/* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08),
+};
+
+/* pin banks of exynos7885 pin-controller 2 (FSYS) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __initconst = {
+	EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+	EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf2", 0x04),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x040, "gpf3", 0x08),
+	EXYNOS850_PIN_BANK_EINTG(6, 0x060, "gpf4", 0x0c),
+};
+
+/* pin banks of exynos7885 pin-controller 3 (TOP) */
+static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __initconst = {
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
+const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
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

