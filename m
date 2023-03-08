Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114006B01F0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 09:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjCHIsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 03:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCHIsa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 03:48:30 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665BA9438D
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 00:48:28 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id da10so62720665edb.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 00:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678265307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IW/RS0aLSSxBgB22OqTCxBSr+YdxHtk+0LFWe36vG8=;
        b=fWi10K1WTyMK+4gDA9j0bPprPuyGTBeu+XpocgR0cj+w9BYHj8UpNgU5t7v3PylQf4
         wY74bZ0VgPsmZ8GVnLZyawG4vExQk4VcpD8Sy0ZZgjLsoHTB/p4JGasSRwFQVP8ViAYf
         WHpwv0Mg5L+yjUF3WBMF54f2a2kM7teDdMKvcEZ8x1/hxlvMOJa3ayKvTtSdw6XnOinN
         42qPZITrCQ9SggMQB/mIKJWFKZbdt8OCZwawYh2mDlhPjzhsD2B27DiZmPzywHUBFkmE
         JZqgDm/dydu/Ju6adDOlnoDIvWPGAZEA9meFjPpRMZWO92uiHM2/um7Ka996PE42nENe
         VcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IW/RS0aLSSxBgB22OqTCxBSr+YdxHtk+0LFWe36vG8=;
        b=BqiRHVeTX6hB/lOMj/3tEPpaIm0VLA65c6HUpdZdmaSk6qp7hbAk+Ad+eb8ucBsCJ1
         ADUB5L9tm13j3KHIu079iyK/DbCjnf14WQqAl7IxcS0NL+TEEKjkSV/a4O0QFErqDRqM
         Kd6KyvVz/Dxxw07Z+aBLSNU2sZoNjv27GWob7ZB0A+Bb7Un6hQCtfyFyhDIsq4UEdU6G
         1E6B/y0WOPg2DNSH7n2Ih4UT7PhbG38cwTQ+gKJeQRg/hiSA1ACheWXCQ44A2YXJ44u/
         0FsgMtUj/dp9+PlfIRVBwNt4DKUjE/Mja/0Xu/AfwW261CMheix+WBdiIHR3r6OrSkAt
         LJSA==
X-Gm-Message-State: AO0yUKUC7JPdVboikyUhh1x2dL7oKQgYHpHm3u9JaZZ8q9YwYkRtMrCH
        kaLvn+jVzUsxvC+0QLVRgGYvQXALM1k9yOhZFPw=
X-Google-Smtp-Source: AK7set+/a5vYatHyXTm+A6Q49AO+MfL5eXvY6zaULzOwyp5e47XvyDA35K8uivkmDjkP8sa9O9411w==
X-Received: by 2002:a17:906:1846:b0:8b8:c06e:52d8 with SMTP id w6-20020a170906184600b008b8c06e52d8mr16121027eje.36.1678265306937;
        Wed, 08 Mar 2023 00:48:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090682c400b008d4b6f086c9sm7141528ejy.185.2023.03.08.00.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:48:26 -0800 (PST)
Message-ID: <0013ce4d-d4a8-2a82-c72b-042dd4d9779c@linaro.org>
Date:   Wed, 8 Mar 2023 09:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org, Niall Leonard <nl250060@ncr.com>
Cc:     Madalin Bucur <madalin.bucur@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/03/2023 16:35, Sean Anderson wrote:
> Hi Krzysztof,
> 
> On 3/7/23 03:42, Krzysztof Kozlowski wrote:
>> On 06/03/2023 20:15, Sean Anderson wrote:
>>> This is a generic binding for simple MMIO GPIO controllers. Although we
>>> have a single driver for these controllers, they were previously spread
>>> over several files. Consolidate them. The register descriptions are
>>> adapted from the comments in the source. There is no set order for the
>>> registers, so I have not specified one.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>>
>>> Changes in v10:
>>> - New
>>>
>>>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>>  4 files changed, 137 insertions(+), 91 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>>
>> https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com/
> 
> Thanks for linking to that.
> 
> I believe this patch should be applied instead of that one because
> 
> - It documents all the registers, which were previously only documented
>   in the driver
> - It handles the endianness properties.
> - It consolidates the various descriptions of this binding into one
>   schema.

Sure, sounds reasonable. You can just quickly check if my other comments
apply here as well (but seems not):
https://lore.kernel.org/all/4df3ec7a-e4af-89bc-9eda-21150395a935@linaro.org/

Best regards,
Krzysztof

