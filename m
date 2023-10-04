Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6327B8DC5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 22:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbjJDUAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 16:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243977AbjJDUAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 16:00:30 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3E0DD
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 13:00:27 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-668e4fd13a3so828076d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696449626; x=1697054426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glw2eflXaWyZcVCXjzXx5plNNuZGimWl7Idf1GSBlgM=;
        b=SFrQJfcvMz0t3C94c9cwbZHkV8FelVNOTCNhkQgGkwZkw8Q/hbaZXlokolCpAlEVEN
         xMLZRDH/Ik8UEG7N9pYuu17myPQJBoNf3BeNX23SbLXrOtL6Yf/eT2E1suPjhQ7k5M10
         EbwPqyqQYiV4SDQvVoNM0V5H5tVXGozMyX9WXXXXfFwYM1nqaSIz/us2IuXLvTAKiSwv
         2jW4IFugox0rc6tliXOaItTKHSSKFeO733tzH3+V42QOOAGDT2yXALI61WcbduBniP2i
         XOo1yleSp1XxjIUgMwNAOTlWhtDfWQkePtULxrEwFUg0cOOnHkVX4rZ/hfFcrXB+QsG+
         Om8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696449626; x=1697054426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glw2eflXaWyZcVCXjzXx5plNNuZGimWl7Idf1GSBlgM=;
        b=NdvXUMGtcFF5syrUA78zl9sdGo1kK5wfuLzq1mAUugCDcWaAz3U3Q7dGhm8Om8IeBt
         5MxJoqwixxDnFBzBSjanTTFNzf/oEc8vBheYHQaNZ6yu5kwVkcOrRN1jxDXZJnjDnr8U
         hi+uLn4lKW2g8PK6RzbAnBg6qaXrDGUiIjLpdX5iJsQAybImK5L0vWVVZHf49NT3yjk2
         M2MwPzkYiVgOIWtUMMpG/pozHG+wJJynRrHdeHZRm2oltYC7xB6/2oOzbABGH2uZg3df
         3hipt2lConl9YiAgYxYcYSp70NIzpAD6WZAVvuLb+3lqUxNXvbN/ygKsNx+mhh0N0Gr4
         LyYg==
X-Gm-Message-State: AOJu0YyZcDBtuv5bnah9hoXyRDptz7juKzxn0k9EQcPd/A8lsSz9u1kZ
        ocKGyuwbIG3froKxF6vzM1fvpA==
X-Google-Smtp-Source: AGHT+IF0w9RIq7iWk6yVTsSNe4IEuVRRJFeWTzPEC9v/OSfZEAP33bpqfgtug+p8jjGC81hwrVmgRA==
X-Received: by 2002:a0c:f24a:0:b0:656:1af7:e9f9 with SMTP id z10-20020a0cf24a000000b006561af7e9f9mr3192156qvl.0.1696449626077;
        Wed, 04 Oct 2023 13:00:26 -0700 (PDT)
Received: from maple.home ([174.94.49.189])
        by smtp.gmail.com with ESMTPSA id v4-20020a0c8e04000000b006648514e276sm1579095qvb.78.2023.10.04.13.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 13:00:25 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] pinctrl: renesas: rzn1: enable PINMUX
Date:   Wed,  4 Oct 2023 16:00:08 -0400
Message-Id: <20231004200008.1306798-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable pin muxing (eg. programmable function), so that the RZN1 GPIO
pins will be configured as specified by the pinmux in the DTS.

This used to be enabled implicitly via CONFIG_GENERIC_PINMUX_FUNCTIONS,
however that was removed in 308fb4e4eae14e6189dece3b7cf5b5f453c5d02
since the rzn1 driver does not call any of the generic pinmux functions.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/pinctrl/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 77730dc548ed..0ad8e14ccc52 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -234,6 +234,7 @@ config PINCTRL_RZN1
 	bool "pin control support for RZ/N1"
 	depends on OF
 	depends on ARCH_RZN1 || COMPILE_TEST
+	select PINMUX
 	select GENERIC_PINCONF
 	help
 	  This selects pinctrl driver for Renesas RZ/N1 devices.
-- 
2.25.1

