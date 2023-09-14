Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9F079FB43
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 07:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbjINFsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 01:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235673AbjINFsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 01:48:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DD91A2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:48:04 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9ad8a822508so73784166b.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 22:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694670483; x=1695275283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfGXKt00Cpu1VM3dmeeDSUKZ343EJMe0hHl3+p8EaQw=;
        b=fPlCijpuc4g8adn4j4ufcvDl1fxvdNZdp+YU9bNamZqm2B9WbvBe8onnm+pENwZDtD
         rUwlgt3nbsrKY3d12twN51T+YYhhIwhwRqD4LIP+eo0MpKTack0ujk5RoYtgzz/lm/F+
         YxmU0ra6BQlveCaZVBt7/S8Dsc2Ta6ArQKEWjfYIgwOdgzQ55nWAwr1Ypl7RdozwvxV3
         PVUjNRGuDITLWoP26sByPCogQhgVDNYKXebAeifWF13qr5HBAy3yiF3YpONI6BM/JNWu
         s3K9/qkIxX58j3s4h+nYljchEWnnazOmAX/4qMUBi50S2p4FaW52hECkAqd56p0JY4h0
         wfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694670483; x=1695275283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfGXKt00Cpu1VM3dmeeDSUKZ343EJMe0hHl3+p8EaQw=;
        b=arnH4pg1nbV/y/Dh8Aj5ooAoMp1qoGSpZQz+NnGS/cqlQXvj/1cGbPXA+l9LYd0OtD
         DITNUbq5gHQx87H0Mdb0bqJf4S7vdpq54INs97Dj1YWFve2TJcnSWzgolZPT13wP8ZiR
         zc/jJW+YKITuegbDxVe2NkCR4Y3IGban4Lgs3dkKP9LXfIv/BJCAX8tHP2uVwmUfbG/t
         KQsSOfrim/CRGnPq5py/up63pz3rz0vJnuGhiK6K2iu/djVMG+J5WkQ7KLYb5RpPmlgB
         k8djlg/j+cf/yVv+68wz4+0pcOcgWIUyow7/fkazmjlZhWqibAqsOJhiUY62SkFzY0Pw
         lQwg==
X-Gm-Message-State: AOJu0YztKAS11FuEZ/88XPJLyhbfy1Sr0RYB6xqFuz5TxbJh6i4UyVh9
        sh9dapK6A2YdyuLo04CwBwLbUw==
X-Google-Smtp-Source: AGHT+IH4Mh5DkZfgKNLNhCRsuNSHMLuMtZFw02LD8r/PeDnq8+urBDArz5zwYgwUsw7gAsU4QwYXDQ==
X-Received: by 2002:a17:906:3297:b0:9a6:5696:3887 with SMTP id 23-20020a170906329700b009a656963887mr3624398ejw.59.1694670482941;
        Wed, 13 Sep 2023 22:48:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709064a9a00b009a13fdc139fsm472558eju.183.2023.09.13.22.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 22:48:02 -0700 (PDT)
Message-ID: <8f86536f-42a3-a549-f01a-d1ce60aee338@linaro.org>
Date:   Thu, 14 Sep 2023 07:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/5] dt-bindings: gpio: vf610: add i.MX95 compatible
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230914-vf610-gpio-v1-0-3ed418182a6a@nxp.com>
 <20230914-vf610-gpio-v1-2-3ed418182a6a@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914-vf610-gpio-v1-2-3ed418182a6a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/09/2023 04:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX95 compatible string which is compatible with i.MX8ULP
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index 2593cc96fcbb..d0db2089cfab 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -26,7 +26,9 @@ properties:
>            - const: fsl,imx7ulp-gpio
>            - const: fsl,vf610-gpio
>        - items:
> -          - const: fsl,imx93-gpio
> +          - enum:

Just make it an enum in your previous patch, so you won't change this
line twice.

> +              - fsl,imx93-gpio

Best regards,
Krzysztof

