Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EE75A0EBE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Aug 2022 13:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241308AbiHYLK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 07:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240967AbiHYLKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 07:10:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6343397528
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:10:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z6so27733569lfu.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TeFvcw/6IdsOusNCl9n7pDR9ukoMvAj+lFQVR4XnUbc=;
        b=MIpYXDJNY+ShXDSfOa3TQKDK7aCcqReWHSqfgpQCLd4EvtBbg+pH99VyxZB4PLczXX
         CNlop6VSuGicScuum7IBHT/hV4cx4iEZyr/SPB2qM0lOy4RdWCmOW97a2J5nj2/EcrBr
         Tpo6yXvb+83a2uZCbobMC4krRKcmvaj2F4JCnd+eFGArXOpvrzX7E6cdNq87PhszvQD5
         G0LTbDnzc86otQG9Kw3UrYBUvdsTaBg6wrc6B2A6uQ++VBnbxR5pFi78opn0ChmgErU0
         nmjovPQ8RjugWiaotFnwL8N3zjeUrRNl5Vi8MOauEwHSOWJ5WJiDUiflXaKdSqOrwEsl
         +D+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TeFvcw/6IdsOusNCl9n7pDR9ukoMvAj+lFQVR4XnUbc=;
        b=oALpSSP8a9rlBhTtvOSXghtT6n6J45cPkeJRSoGow6kle0omLev9uAaw6JWIdnwmPY
         9QewzUBw351DmC+FNp+KF+r5o9+sRfC7/JlD7Ccc6ABp7dnGynyclgqQ50MpVXi9CPcC
         dErhsVPQickjRzX8Az/rEcNQzRrY3Kz51Iqvp2Kb2qmJa3SdK1TSWj4Y5wzdBER9aOJy
         L27FxxRJrL7O0srfv7/c4XdiwxrLqe1jo6+KRjGFSI2iTdmS02tDnq0G4VRG7261q+2h
         QgviNCZ6TVl2osH7gZFw6xqetMEuyaI5m38bcDGKk9FN2Vaybv1wzLpiB4C7cRYTbPQ4
         rmhg==
X-Gm-Message-State: ACgBeo0j8Ff1udVWAEapy3AxQSxF75NQSnQuYtQyU87U1nNWQ6AybWOF
        igIUVvMGRm2wtD7tFfGGECgqkg==
X-Google-Smtp-Source: AA6agR40s26AqR4oTbnYAh3g4eHAduWY6waQtKrOGrMB9fZonpVRdeuwigS5+rGWIVurAjNU7bKUIg==
X-Received: by 2002:ac2:5f57:0:b0:493:774:675c with SMTP id 23-20020ac25f57000000b004930774675cmr1068956lfz.433.1661425822661;
        Thu, 25 Aug 2022 04:10:22 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id s10-20020a05651c048a00b00261e2aab7c2sm494950ljc.58.2022.08.25.04.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 04:10:21 -0700 (PDT)
Message-ID: <4a2a5eeb-aa65-2b33-e7ff-c1d318a9b76f@linaro.org>
Date:   Thu, 25 Aug 2022 14:10:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-binding: gpio: publish binding IDs under dual license
Content-Language: en-US
To:     Etienne Carriere <etienne.carriere@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Warren <swarren@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825104505.79718-1-etienne.carriere@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825104505.79718-1-etienne.carriere@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/08/2022 13:45, Etienne Carriere wrote:
> Changes gpio.h DT binding header file to be published under GPLv2 or
> BSD-3-Clause license terms. This change allows these GPIO generic
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to gpio.h file in copy.
> 
> Cc: Stephen Warren <swarren@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  include/dt-bindings/gpio/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
> index 5566e58196a2..f8df7511b8b4 100644
> --- a/include/dt-bindings/gpio/gpio.h
> +++ b/include/dt-bindings/gpio/gpio.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */

Why BSD-3 clause? Bindings are expected to be "OR BSD-2-Clause".

Best regards,
Krzysztof
