Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C539D170F83
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2020 05:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgB0EOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 23:14:01 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38593 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbgB0EOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 23:14:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id p7so588345pli.5;
        Wed, 26 Feb 2020 20:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=LsMXCWACkUWIrwvKhNNStRrc79JfYRemXqBazXS0Xzo=;
        b=daLjtbmv6Hc8AWRsib89to0NgXTXkBdXPUKjD57eppxXLiWjpJjnp13uhv08bTsgmU
         UuQqjCS2NlpMA9RNPjLuCo1JXbkb3R3VsH8XjxKPl+MQw7yT6cvpO/sgoguvSGvG8JFn
         8af7H44RlD6aKI2nioN04GXnQJfZNM2wHbq5Px2cOl/OZrOmHZwk4P/TdXbmZuqP99T0
         uuI6KE4eFrj7qpfAHWLkw/QF3mwvWDHPYJ0F4imCsaTvz8dgWy++IujHldQ8hzp8Br9/
         p9fVbR3o6+pIqhsGY00TxduX0SLqysytDDgswAxB5jMstoPeIhqyHfE/sQk2dPc7ZuIL
         hJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=LsMXCWACkUWIrwvKhNNStRrc79JfYRemXqBazXS0Xzo=;
        b=cU0xaFdEHS7z0YFVPIokxNHPFAlYFOQXAE4mbv2cIqXDsYWAkb4yA7BnF00hTHkc9Z
         6/Mhi967lCjhAMOSY/Gt8Hy1PapXS7NE7OU+DiD6mC3x7+FvEXznLVu63wAPDqFWR4hX
         qkk/mBJDtxsEoI/NYLzz2TdZiPJXbWSGjg5946kpDGS6VqPTuwJF9KrnMYHHVJEJRD9e
         WtR5RTJlc52UJGS4ofmcdo+TjpflBBCFou3q5R5ZUwC+zy2q3y+AKiMW058ao05mqjgK
         b89mYkAepoakLhEU+qh6rIOyz7DDWg5VQfN8pjYo5J4j9Zp58y8B9pd774o8SvZU96cf
         UJSw==
X-Gm-Message-State: APjAAAWkuuaVhvgfM+t6hZ3TVpEzcmjBKa1IlY7vRTFjPLU9lSrucANx
        mFO3Jni947Zs3ZLM0R9/aG8=
X-Google-Smtp-Source: APXvYqzr3AM20IzMXCB/RqSK+rstOp/4GkgNYHJer6wufkv5VPTxgZOHJqsFQ6RADWNTagCOqHphUg==
X-Received: by 2002:a17:90b:11d0:: with SMTP id gv16mr2728133pjb.109.1582776840072;
        Wed, 26 Feb 2020 20:14:00 -0800 (PST)
Received: from sh03840pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id c1sm4729856pfa.51.2020.02.26.20.13.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 20:13:59 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sprd: Allow the SPRD pinctrl driver building into a module
Date:   Thu, 27 Feb 2020 12:13:47 +0800
Message-Id: <d7239f3c7379e402f665fc8927f635ac56691380.1582776447.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
References: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
In-Reply-To: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
References: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change the config to 'tristate' and export some symbols needed by modules
to allow the Spreadtrum pinctrl driver building into a module.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/pinctrl/sprd/Kconfig        | 6 +++---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
index b6c5479..c9e7f0b 100644
--- a/drivers/pinctrl/sprd/Kconfig
+++ b/drivers/pinctrl/sprd/Kconfig
@@ -4,7 +4,7 @@
 #
 
 config PINCTRL_SPRD
-	bool "Spreadtrum pinctrl driver"
+	tristate "Spreadtrum pinctrl driver"
 	depends on OF
 	depends on ARCH_SPRD || COMPILE_TEST
 	select PINMUX
@@ -15,7 +15,7 @@ config PINCTRL_SPRD
 	  Say Y here to enable Spreadtrum pinctrl driver
 
 config PINCTRL_SPRD_SC9860
-	bool "Spreadtrum SC9860 pinctrl driver"
-	depends on PINCTRL_SPRD
+	tristate "Spreadtrum SC9860 pinctrl driver"
+	select PINCTRL_SPRD
 	help
 	  Say Y here to enable Spreadtrum SC9860 pinctrl driver
diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 157712ab..ea04bac 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -1090,6 +1090,7 @@ int sprd_pinctrl_core_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sprd_pinctrl_core_probe);
 
 int sprd_pinctrl_remove(struct platform_device *pdev)
 {
@@ -1098,6 +1099,7 @@ int sprd_pinctrl_remove(struct platform_device *pdev)
 	pinctrl_unregister(sprd_pctl->pctl);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sprd_pinctrl_remove);
 
 void sprd_pinctrl_shutdown(struct platform_device *pdev)
 {
@@ -1112,6 +1114,7 @@ void sprd_pinctrl_shutdown(struct platform_device *pdev)
 		return;
 	pinctrl_select_state(pinctl, state);
 }
+EXPORT_SYMBOL_GPL(sprd_pinctrl_shutdown);
 
 MODULE_DESCRIPTION("SPREADTRUM Pin Controller Driver");
 MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");
-- 
1.9.1

