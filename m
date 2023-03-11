Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12896B5AD3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 12:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjCKLNh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 06:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjCKLNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 06:13:21 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123881165F
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:15 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id k10so30631196edk.13
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC9LP4Mz3ZehLFvi2CSx22bsql7JNCcQ0viTq1wmSCc=;
        b=O4S33oHNUCZoaXa1/QENkscGWzkVC5vXemfIKwaGTgV94h9Skey96TbQiRRLkCDmBP
         xRoabFrs2wASqubivqfcgL4ZsVoG/abE12Fgx86eMPRytCmEtI0Dp3mts5s+NnTbS3TN
         SnhU523+D2+a25wrW3xsy+knBpl6l8eDUY1F36c6Nr61tOouSC7iBtl5356TiCC76BG+
         ZTBnnJcXcdo2WoHDxL9iyQG0JeMNpnfRQdaCCxfJtjgiy5o6xNvnGPWAdzuk5Ui44u5U
         zQyFJXKE4jtrQ8KFv9mpx2N0fNcURBaoMTVMTLkTAeIXssbN8Zs+Zqpu48Oc/p5fkBc4
         sC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC9LP4Mz3ZehLFvi2CSx22bsql7JNCcQ0viTq1wmSCc=;
        b=CLGKfIqU8mgcx69piuLstxSAnmqbgYhFIl3pRH4DdH05cdHgnv8UZD/xbwoRyGKKoM
         yAw1s925dZKa0YikcvPRlLTnpqOiTLI0bSBuNWBE1+wHeOsCKowxRuSDvfPnRUg9No5H
         zpcq9TVuKU21WgN/uIhEMwPy4s2kDpZpDRlY8W+M/B1IS4dpQsWHoZIolAjrZj/S3Yc/
         AKY+Tpw8Y2JRbsLWMz6TBDkak/GasFhUY6lCC/YpdNbWOu5mebhMfPPOkvYXf+iH62dV
         IEYU+1df4mAhvZuRvbfWchaNwy82lBO4ACz2iOrpZpj4Nzgm5PHDRGsJMBWL9ZBYToSp
         gLfg==
X-Gm-Message-State: AO0yUKUOwfREYqUNoB/cVF4F6+zNYSQ9mjA1vVfEfRLzvQWMGsmO007r
        +e4MP7xfpN7knVJDvZ5Pepx1YQ==
X-Google-Smtp-Source: AK7set8NY+cOflW1Wg/2w/XINECjCWqtchHoBTmqix4SLXg+4znExK1iEYJu1Qx4UfVb7s6bex1nUg==
X-Received: by 2002:a17:906:4f94:b0:8ed:e8d6:42c4 with SMTP id o20-20020a1709064f9400b008ede8d642c4mr27839053eju.12.1678533194223;
        Sat, 11 Mar 2023 03:13:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] gpio: sifive: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 12:13:04 +0100
Message-Id: <20230311111307.251123-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/gpio/gpio-sifive.c:263:34: error: ‘sifive_gpio_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index bc5660f61c57..98939cd4a71e 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -270,7 +270,7 @@ static struct platform_driver sifive_gpio_driver = {
 	.probe		= sifive_gpio_probe,
 	.driver = {
 		.name	= "sifive_gpio",
-		.of_match_table = of_match_ptr(sifive_gpio_match),
+		.of_match_table = sifive_gpio_match,
 	},
 };
 builtin_platform_driver(sifive_gpio_driver)
-- 
2.34.1

