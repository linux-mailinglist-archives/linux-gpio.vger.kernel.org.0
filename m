Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E247BC0E5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 23:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjJFVE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 17:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjJFVEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 17:04:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6130FBE
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 14:04:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5043a01ee20so3141396e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696626260; x=1697231060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gRhdNWLww8131tERKBK6Gq4NzqQdVzbadH36wOuOqU=;
        b=RgBAllhPuvHE58VeOKyCwaNQW5hKHzU/LPdJHzzP4qqdRCVJqwV79dM4qVdknEfFx7
         O3NM7kdoyYEHaWVOjy++fhDkxDATtWSIiFCAqvTPFEX77QMtvdNqj5itnbbNhCCy7pRb
         1ADezwecAXAqMP45ptzJgXh4L+afEJxp4ATByy+C3pKFt5Mveddvt7xtWttTdHbsGgBX
         Krs/jFZE3KMsLMKVqSsyIHvYYp8HcRrAMB1FbAARa8Mzou09scZpgmnKp36CMejDqfeP
         lR6TK22bqOK7losMKUfMmoHFkSvOvq6iPaRB3d7czlwGVfKVWoH8c6inlFU/rJw0GvzE
         L5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626260; x=1697231060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gRhdNWLww8131tERKBK6Gq4NzqQdVzbadH36wOuOqU=;
        b=iy3uaoqszKKU1dDWgs/HdDvXBKfEHG+kOnUYk5ylm0DQFIRVZVwaOUvwd0Q5HzyPUu
         k4s7Nb3u03VFQJZucCT3Vc4V4Mt1XeGtQyzriKVp/ZQJEZGlrlP9Aw50DrqmorIpyWGa
         Hv+HXSANmNO+2fu+kmu2Nf46RE8KFvDk9BXysd4Hb7nVUVHmdCZUt0KxJ+RveLsMBeS5
         L7SAt+0NdOf9HMys8Q34iIIL67au/SQgACwrqmbE9ewW+yBPZiXcJavPyMuznXi383JE
         VlQGYtz1KHwb1XMo+83FbsEGooASSIQax3A9PhcQnCaMl7HQ8gP/1FFBTzKmvpH6qCli
         fGxg==
X-Gm-Message-State: AOJu0YyV2u6QVwHPrkqqSvDxe1qY+apF3/GP3KFMoZO2TsCNCvE+QRLZ
        jG71XCQBv9yHXi/LdHzYfychxQ==
X-Google-Smtp-Source: AGHT+IHAHSU/SOXoSXqQoUXlQQg8d6dV6TJJPSYmw5MDjOvNiYR2Ft9+pS+KX5nSELtBl+NFq7cQ3g==
X-Received: by 2002:a05:6512:3494:b0:500:c348:7efd with SMTP id v20-20020a056512349400b00500c3487efdmr8154629lfr.59.1696626260055;
        Fri, 06 Oct 2023 14:04:20 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b00501ce28db76sm432993lfn.291.2023.10.06.14.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 14:04:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Oct 2023 23:04:18 +0200
Subject: [PATCH 1/2] pinctrl: realtek: Tag unused pins as __maybe_unused
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-fix-realtek-warnings-v1-1-09af253312ba@linaro.org>
References: <20231006-fix-realtek-warnings-v1-0-09af253312ba@linaro.org>
In-Reply-To: <20231006-fix-realtek-warnings-v1-0-09af253312ba@linaro.org>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tzuyi Chang <tychang@realtek.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These pin definitions are helpful to have when working with the
driver in the future, so they are in a sense a bit like
documentation. They could be commented out as well, but why.

This should fix these build warnings:

drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
'rtd1315e_boot_sel_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
'rtd1315e_reset_n_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
'rtd1315e_scan_switch_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
'rtd1315e_testmode_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
'rtd1315e_wd_rset_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
'rtd1319d_boot_sel_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
'rtd1319d_reset_n_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
'rtd1319d_scan_switch_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
'rtd1319d_testmode_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning:
'rtd1319d_wd_rset_pins' defined but not used [-Wunused-const-variable=]

Cc: Tzuyi Chang <tychang@realtek.com>
Link: https://lore.kernel.org/oe-kbuild-all/202309270313.mBEc9o1A-lkp@intel.com/
Link: https://lore.kernel.org/oe-kbuild-all/202309270448.7Aen3Sgx-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c | 3 ++-
 drivers/pinctrl/realtek/pinctrl-rtd1319d.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1315e.c b/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
index 5ab35d73e6f4..10afc736a52b 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1315e.c
@@ -227,8 +227,9 @@ static const struct pinctrl_pin_desc rtd1315e_iso_pins[] = {
 	PINCTRL_PIN(RTD1315E_ISO_TESTMODE, "testmode"),
 };
 
+/* Tagged as __maybe_unused since there are pins we may use in the future */
 #define DECLARE_RTD1315E_PIN(_pin, _name) \
-	static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
+	static const unsigned int rtd1315e_## _name ##_pins[] __maybe_unused = { _pin }
 
 DECLARE_RTD1315E_PIN(RTD1315E_ISO_GPIO_0, gpio_0);
 DECLARE_RTD1315E_PIN(RTD1315E_ISO_GPIO_1, gpio_1);
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1319d.c b/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
index 838a447776ba..b1a654ac30dc 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1319d.c
@@ -233,8 +233,9 @@ static const struct pinctrl_pin_desc rtd1319d_iso_pins[] = {
 	PINCTRL_PIN(RTD1319D_ISO_TESTMODE, "testmode"),
 };
 
+/* Tagged as __maybe_unused since there are pins we may use in the future */
 #define DECLARE_RTD1319D_PIN(_pin, _name) \
-	static const unsigned int rtd1319d_## _name ##_pins[] = { _pin }
+	static const unsigned int rtd1319d_## _name ##_pins[] __maybe_unused = { _pin }
 
 DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_0, gpio_0);
 DECLARE_RTD1319D_PIN(RTD1319D_ISO_GPIO_1, gpio_1);

-- 
2.34.1

