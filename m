Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22F77485D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 21:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbjHHTbz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 15:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbjHHTbi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 15:31:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732D6769A
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 10:27:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso21993545e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Aug 2023 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515667; x=1692120467;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRMNIql4h6i50DoW9rO+SQKBVq3u6OMyHVjggvsaHiY=;
        b=rEmXX/yBFxCI+QQpZaTNK4qDhcqUhjVgq5DwkxzN+ep8pcnkBZYMoNQxUL8LbrrBgh
         4W3A4hULgP+MHh+meul/EKYclweepPF53uB8LzvoIIQlNyGU5NaqRzYVnK1StrDzoT24
         tHO2mzQdVkycALFDPM/lQVMF7PgnLBVNlP5HNa58hG4LbAEt2BbQfAvj0pjeYtZh3JbX
         9uWU2L9ZmEq1rCdHKzvw/S+SM77cThnrfxFLBcHNF/XvQRUxARUJmR0RCDy+bs3Ez5hd
         HOjJn+cdlPf4csiFlSOmpplqkUC9W+gKkCpL6FXZJqO2QvBYDj33v9bdsHOlrLBhTvJV
         LfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515667; x=1692120467;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRMNIql4h6i50DoW9rO+SQKBVq3u6OMyHVjggvsaHiY=;
        b=GptYFtGuw/wBOJ0rdpDuqbHTo4mA2dbcDKW02Nw0G3mVRdxwg+XMRV2TsrDUkBVgOx
         D8Dko3IXm6PliVrG0SNT0OR//neBgioTZoahgJck4hM6FN71NYrVVDFaWMPEbrOrjxA0
         ELErM5ry3FNRgEUw/Byq0Oxfsk0LBf7RtyMOzCvnvraULUztRov6z3D2GUPOEvfzlM6Z
         Y436aI/x4htpzIyUAZW7I7ebMF+MQcU2rSkwCXQe4n7LbScpM/qxyvlDb9K4cYRXLgVz
         3ZqEDcxFIHxsyg/0Fm892dCGlZipMVItGDbbt6w8EAjyyFCw6gpBEl7KtSVvDCOBMUaU
         +Lhg==
X-Gm-Message-State: AOJu0YzUMJABM160rirZeIn+icWePnnk0nlufRHcz93Cy4FTGKSrVX0p
        2LELjdqLYKBuPWFYnKcY3OBYS1060VQu6iaTfOA=
X-Google-Smtp-Source: AGHT+IG+xa/G0KUFOC99116SrrI42b1Qeto1ZUGnZKL3zxEPkqVqherNWGnAP7AYkTuw2scsVZ/Dtg==
X-Received: by 2002:a1c:f216:0:b0:3fe:1fdb:cf5 with SMTP id s22-20020a1cf216000000b003fe1fdb0cf5mr9645023wmc.1.1691483293856;
        Tue, 08 Aug 2023 01:28:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c261400b003fe2ebf479fsm12982952wma.36.2023.08.08.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:28:13 -0700 (PDT)
Date:   Tue, 8 Aug 2023 11:28:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
Cc:     "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] misc: microchip: pci1xxxx: Fix some NULL vs IS_ERR() bugs
Message-ID: <043df330-222b-4c2c-ae19-ed2f731bfe0b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The devm_nvmem_register() function returns error pointers.  It never
returns NULL.  Update the checks accordingly.

Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 3d3d1578119a..16695cb5e69c 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -379,8 +379,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 		priv->nvmem_eeprom = devm_nvmem_register(&aux_dev->dev,
 							 &priv->nvmem_config_eeprom);
-		if (!priv->nvmem_eeprom)
-			return -ENOMEM;
+		if (IS_ERR(priv->nvmem_eeprom))
+			return PTR_ERR(priv->nvmem_eeprom);
 	}
 
 	release_sys_lock(priv);
@@ -398,8 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct auxiliary_device *aux_dev,
 
 	priv->nvmem_otp = devm_nvmem_register(&aux_dev->dev,
 					      &priv->nvmem_config_otp);
-	if (!priv->nvmem_otp)
-		return -ENOMEM;
+	if (IS_ERR(priv->nvmem_otp))
+		return PTR_ERR(priv->nvmem_otp);
 
 	return ret;
 }
-- 
2.39.2

