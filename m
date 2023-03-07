Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37B6AD96A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 09:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCGImj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 03:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCGImh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 03:42:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6434652F4F
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 00:42:36 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id x3so49106987edb.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678178555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unqTYip/nZX7WkFVVubRKmL0WM29EpJsVS8P0OsOpaE=;
        b=Eusd+XKKTE+5SuOXFhD4Jk4H8VMkJJ50GMAWk0gBxQei4r0OxVLwrd1mTkzNzFUiz2
         1wRs9FOXpNIKdrkWQ9ERJnKiotHtLrwu3n36DYL0+5ZEar49+NINtEXWHqwwPn4xNR5Y
         NWljxAdz10RbCv0R1G1rinKUjT/kKAIOf5kcs1qSA2HLqZOvfrvwYmskUjaxcuvWxnCb
         zUJc9Vg627t75Taw73EldUXKGTig9uECMUp/+1TqHVlAbwxt/hVAtt+0sJLByiKzYXlk
         2wdDyyfHBsKcrLjieYpPG1bgTCGHX706/B2Yj2HQG34z5CtkFsHDt0eU1lxIyKGotnaD
         uaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678178555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unqTYip/nZX7WkFVVubRKmL0WM29EpJsVS8P0OsOpaE=;
        b=aapJ+Wx78hMv3Ic0I/rrnWW4V6n1HKOM3UqLedS9Zjt3cpz/p8INH6gTZSS1i6UJRP
         R+wi4MLquqkk9qoQtv11k7K6RAFVOy+1M8PAV65Vua0kvpu4ogFH4NTZ5wTK7mVkYsPx
         7Odf5b8awVWyNEv6iDAOKaNHl788DGmgR2IWRnZpK0858zG92UD+nLOpPcqA6xuopqG5
         06speAOxgKd54nXEfpRUGUMwmpNEdUG0R6Coq7tDfvSCge/ojyIHsc1XLvPuytS9pdPn
         I97XvUadvVAUE7yA5J8iNVx6CxhaL0ZrzWOjSBYkki2/2VSEqerahmzMkPPBM5ReOJku
         VOrg==
X-Gm-Message-State: AO0yUKXJVwojJVWNT/klom56cRI4+5ARVEq+WPgt/IGklxF/xIUrAYiu
        8Wtn6yp7aKQMNI7zx37wgSQWJg==
X-Google-Smtp-Source: AK7set8Rs3NbWr/+syYwZkWacBKqzhW8dHm3qaImZJYpVxvN4EL2d7wEi9d0aVvqf+tbGrSHBr3kZA==
X-Received: by 2002:a17:907:7f09:b0:8b1:7e21:f0e9 with SMTP id qf9-20020a1709077f0900b008b17e21f0e9mr16867174ejc.18.1678178554921;
        Tue, 07 Mar 2023 00:42:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id r17-20020a50aad1000000b004bfa4f747d2sm6301772edc.54.2023.03.07.00.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:42:34 -0800 (PST)
Message-ID: <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
Date:   Tue, 7 Mar 2023 09:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
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

On 06/03/2023 20:15, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v10:
> - New
> 
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 137 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt

https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com/

https://lore.kernel.org/all/9bc9349d6e13d81c6200b0cd8fa20c76263043f6.1462543458.git.chunkeey@googlemail.com/



Best regards,
Krzysztof

