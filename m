Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719407647FC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 09:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbjG0HK6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 03:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbjG0HKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 03:10:24 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093D43A8B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 00:05:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98df3dea907so74454466b.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441487; x=1691046287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyWOReIaTWogrTqx/H2evhSzZP49XXtaCHT17ykae0k=;
        b=fyD3URrueDIRI8GkTwSzUWSAl2VKP57UmMg+g+vWaW55JaCbnU6j3NkWnnUuk4hsC4
         Gl0gB+rzQO+rzW0KhpxYMwQwLeMq5lzwax9GB2z23bIiuIJOd1t9IB65hbGD+y+C4EII
         5gCAp2dJRS+xJvGtf3qHdCQ0bbmPiNI/1pzU5PhHPrXRICh+qmzo4oDm1rKiZNGVlQc2
         Gn6rbvfCau0T6pXUYyuXfzFwBpaF3Atj71DX709gNGSsgyceQqilmENxpkTMVCrZqmrv
         SjL1hb02ZY9NHY3sHUBY9ekEjNQTI27FBrMRPXEKFrtQNAOReGTan47WuwIM6brqvNMK
         ot0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441487; x=1691046287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyWOReIaTWogrTqx/H2evhSzZP49XXtaCHT17ykae0k=;
        b=QQKq5xmfuVNMEfuRaZeWVMVz12VS9SgX+n9U1+dFaUqf21mCgzANEnp51syw7Xc7KX
         TEB031JiIXD/ccBvtloDK1L3bjJSDi2KrRnMQ5Z/wOYpjsIBxwEZuzPvGWmqjYheJ43s
         xDNNRw2XVFcAwDAD4UMDzWeAO+ktLbius0WxlSLBBN1fknkQ84hWejwZILZTZnkj2TGW
         0LYhGGAXYWLkKaAMCGHeOsIIfzFqCyivkYyFTp9pNcrw6TExzFOGxXc6ClxEJQf2RAnE
         G7h/HvObdttylUXURul0RA/opRuL8H/AW7hs7hJSn08I7t0QyZ2fK6V6OzebndJFqUux
         QSBA==
X-Gm-Message-State: ABy/qLax5xzIO6+7hp9kpOcRDQbKe6B1MoZhdJbUxjxCA3/8Jv0nRKaw
        z6aJzne6LMF9S69+FxxpEqnEqA==
X-Google-Smtp-Source: APBJJlE3xOvEgAUDRzNT5DczncNtwe/1ADISyZxo2Bue81WHffPVZczMcMaOADPGRQ/gUqYjqTWoxw==
X-Received: by 2002:a17:906:295:b0:966:17b2:5b0b with SMTP id 21-20020a170906029500b0096617b25b0bmr1207106ejf.49.1690441487629;
        Thu, 27 Jul 2023 00:04:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm408245ejc.75.2023.07.27.00.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:04:47 -0700 (PDT)
Message-ID: <92da5cd8-02b5-ee7e-5c07-bece49b57116@linaro.org>
Date:   Thu, 27 Jul 2023 09:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: gpio: fsl-imx-gpio: support i.MX8QM/DXL
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, stefan@agner.ch,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230725102330.160810-1-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725102330.160810-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/07/2023 12:23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8QM/DXL gpio compatible which is compatible with i.MX35.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

