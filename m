Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F185663BF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 09:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiGEHAT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 03:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiGEHAQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 03:00:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98C1FD1
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 00:00:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g1so6424767edb.12
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2022 00:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:cc:content-transfer-encoding;
        bh=BgqQheQ/sN10juqUdx99PYHwf10mcfmCfL7dKge3Pwo=;
        b=JHg/URA6sGAkqLJjCSPAOoEsswzmLy6d8sz0+cfPCS7uh9RYf+Fp5rxefIwrlzfKqT
         aSeq5/4q3RIdczPy/9YEXSRRUoAJIlQACp/tbI9aYXusXyPPlkODfQkEZO9hnq5yqQNO
         q3DCCkifleddjmfUEol9VjHp9sf6Dno9PX421FXfwPSxfq/5Tt2ehzqXuq5p6A2n/Avh
         uV9QA45gNEnKFIwSlTarA18JkTnPPNwT+fi3daJK2929DEQSVdWhXizT689ouFD9tL0m
         FSZ3IZ8oWz7U/rX0xzXOl4Mqdo/dC+FTRWPMLQ4J8FJ7bb9SPX5p+YquWhls0nbgAvRq
         r3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:cc:content-transfer-encoding;
        bh=BgqQheQ/sN10juqUdx99PYHwf10mcfmCfL7dKge3Pwo=;
        b=gL2CJiLX7ByxyE/flHEjhsmkdf5uayAq+Q8nfRW5YKW/q2kPgFC78BAFKLrlYat5p/
         LxFqAiorRSYWF1I+CmsRRabIw6aNWpaO8sflavc+R8D3HsbVI1VMXfC99rfIY/1Y3XOu
         QmxDPlop7YFdX7Z4C9HtFmX/9QglsogqaQXUiLwwSGZCNBFqd012tmokr6sZ94FUuIo8
         Vgv3ZlCAysL2vqevvVh9z9IH4cg8E4mtyqEj5n8+LyqGxGnKcTvOUWi/HSdyH6wW1l40
         Oxj90J0S9R9BuYQ4kKgjKwb12IaTIbZ4JodTBoda4waM6XQa2O4uxNXv4jF0k5o1JIvf
         qOAQ==
X-Gm-Message-State: AJIora9EG2Jq//zBDUn0ESlC+DAIgOdpu16vL62N1DVMl8FtrzgZ58Au
        VbGW9mZyejT1enn0fi5iURQijfF061o=
X-Google-Smtp-Source: AGRyM1vBVEybg/Jd9pKasa+7omb0UnyYks7MNC3L5Q1n4RPmbVMI2GpOjo9Ipre86gHZ91tgEbiqRg==
X-Received: by 2002:aa7:da56:0:b0:437:83a8:7dc6 with SMTP id w22-20020aa7da56000000b0043783a87dc6mr43592646eds.324.1657004412738;
        Tue, 05 Jul 2022 00:00:12 -0700 (PDT)
Received: from [192.168.0.104] ([77.126.166.31])
        by smtp.gmail.com with ESMTPSA id kx9-20020a170907774900b0072aebe7b64asm31279ejc.222.2022.07.05.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 00:00:12 -0700 (PDT)
Message-ID: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
Date:   Tue, 5 Jul 2022 10:00:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peng Fan <peng.fan@nxp.com>
From:   Tariq Toukan <ttoukan.linux@gmail.com>
Subject: Compilation failure in gpio-vf610.c
Cc:     Tariq Toukan <tariqt@nvidia.com>,
        Ran Rozenstein <ranro@nvidia.com>, gal@nvidia.com,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Recently we started seeing the compilation error:

drivers/gpio/gpio-vf610.c: In function ‘vf610_gpio_direction_input’:
drivers/gpio/gpio-vf610.c:120:9: error: implicit declaration of function 
‘pinctrl_gpio_direction_input’; did you mean 
‘vf610_gpio_direction_input’? [-Werror=implicit-function-declaration]
   120 |  return pinctrl_gpio_direction_input(chip->base + gpio);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |         vf610_gpio_direction_input


Is it a known issue? Is there a fix we can cherry-pick?

Offending patch:

commit 30a35c07d9e9affaebd557c454df98e5ba269776
Author: Peng Fan <peng.fan@nxp.com>
Date:   Mon Apr 25 19:11:35 2022 +0800

     gpio: vf610: drop the SOC_VF610 dependency for GPIO_VF610

     i.MX7ULP, i.MX8 and i.MX9 use this driver, so drop
     the SOC_VF610 dependcy to make the driver could be built
     for i.MX platform.

     Signed-off-by: Peng Fan <peng.fan@nxp.com>
     Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

This seems to solve the issue.
Is it the proper way for solving this?

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 23cddb265a0d..9db42f6a2043 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -19,6 +19,7 @@
  #include <linux/of.h>
  #include <linux/of_device.h>
  #include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>

  #define VF610_GPIO_PER_PORT            32

Thanks,
Tariq
