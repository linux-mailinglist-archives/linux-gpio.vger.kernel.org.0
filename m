Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5BC560841
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 20:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiF2SCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 14:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiF2SCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 14:02:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3473A18E
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 11:02:05 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c13so23269951eds.10
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Vy6YZpnkzYfP1Q8nBBgWLbumgUQv6/LinbPlxyazuoo=;
        b=UCWvk7H+g0XiRFlK9hdJh9sPXIDO8O/ApGthzVO9MKQVTyKIFNiYrcYH4J7FI2vgQR
         o8XmheSJxow3U7EVL9L23lr0fJZp+oU88zYGvq1ItRE3F0tcnjDCthkdGXi66xrrzVUt
         Ydtua9WSucxWaQxzLmDaPxJ7/SpSUQoozGq7kUN4wYtrD408iEmlWQOsNm5imiuzoWwb
         gLBWtosNGa2k2nSxi1pcht1Nn/xNnZnPnI9SAU1FVtVv5RiXoSV7lC8j0Lb+P550mvAg
         WSmXXvNdeX6myqBugyWKQXSkH60/vsqBcq2JM46POrRpXbUFsP/JGBCn3xhPph8rL09n
         e3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Vy6YZpnkzYfP1Q8nBBgWLbumgUQv6/LinbPlxyazuoo=;
        b=NdL9i5eV5+4IIQ2bjq+X8zWmyhO9R+lqtEU24rMyk2sKLMA9uJMgm0jp2kyqbvbCkt
         ZOCfOW6l+Iy05ONwhuMSu2VTPYTc8GGLlV/wlclaeOrqEwe5mkOwgZMDnKjSqXpRVQsj
         ++kmxvH7XFv3tOklSZUH3ifdcwJa79PyJtoXzlu2Wj5b78dV1fv5LmFiHnzwRMKY7LlD
         fjrsYdStGnG1bw9JYWNhZm1+2M5N479GJvONOBEOKA3F+7Evbpo22hAmuORLKIm9VAU+
         6vuUFro7uRsRwhwqQt/O+PYH2NbOAb1bYmu8sU3YNheZQJg+GccRBas9+dwRO0evkRmf
         UArg==
X-Gm-Message-State: AJIora+QfbIIu03UBSnrGVqB4fxCvLyKYU0eMJXo9x4EhoLj9MH93eaI
        mn+aC01mA09cIhr6NAyCzZMaMw==
X-Google-Smtp-Source: AGRyM1tMjPgShNrBmV+R7vaqyVYgBWJyRtjHKG3YppCjb+zLtBpcofZ9J/j3kYUUSJryx95/wur18Q==
X-Received: by 2002:a05:6402:f1f:b0:437:6c2d:677a with SMTP id i31-20020a0564020f1f00b004376c2d677amr5969545eda.269.1656525724486;
        Wed, 29 Jun 2022 11:02:04 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906825300b0071160715917sm7944933ejx.223.2022.06.29.11.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:02:03 -0700 (PDT)
Message-ID: <7fbb2d33-2dab-4350-0ec4-ca8c88896523@linaro.org>
Date:   Wed, 29 Jun 2022 20:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 09/14] dt-bindings: firmware: Add fsl,scu yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-10-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-10-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch adds the
> fsl,scu.yaml in the firmware bindings folder. This one is only for
> the main SCU node. The old txt file will be removed only after all
> the child nodes have been properly switch to yaml.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/firmware/fsl,scu.yaml | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> 

This depends on all other previous patches, so it cannot go
independently. Therefore I expect that everything will be going through
one tree thus removal of TXT hunks should happen gradually.

Best regards,
Krzysztof
