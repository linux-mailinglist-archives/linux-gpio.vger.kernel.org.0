Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9618F676D45
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jan 2023 14:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjAVNwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Jan 2023 08:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjAVNwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Jan 2023 08:52:42 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3588698
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jan 2023 05:52:41 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t5so8621838wrq.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Jan 2023 05:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsFQoxntUEMKG4+ARLmikKjFVw81S61EgSCu1Qy3vpA=;
        b=LguRAKctglMkYAlkR0q7Se29qBW8QMYfJ+SeBavnV+whWe6xFirpcG/fTUUJQv9uu8
         K84poSEaVOnfWQjNWTlmdZLXgQGNT2Vn8UQw2pmHbVWE2pevu9CA6KoENYU0FB3DzQk+
         8cLrx3zmbv8lR2dkC0XILEOaumGpsZG6wNMbHl1wE7S/j+2KNMZOKRZMpLeaO9HD/Ftx
         CrEj9fDyS4dQFIvkWYKM80bUv+ILDLAqGCMJL5dZVIaeaFFhVucDeRTrvwTe+16eSlZ6
         T4dlG5uJIzMuSyoECrHVzLeZisLSIGyYpBwIjpDDWa/hQVyPILU8Msmp4n3slWN/4rO8
         H/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsFQoxntUEMKG4+ARLmikKjFVw81S61EgSCu1Qy3vpA=;
        b=AjOlMlgBjC4++3OrBJczyHkYGKZdeE/X3D7GX8SH2dmD+AUc745uxS7kqp3gm7ZF5d
         kJZoF8yxCkmC7HV1mvM5f2y34MRTqa+6enF4D7ftD4t4S8LpaBf1LwkOWG75QzidRiJP
         8Kp21v8DOAuWPiV1xfJ1hf49PLbrOfOc7IELcqF7xHgoGQ43hDwISCsr2+NO3clNWI4b
         08RUUDTuzbLFoWnuOPHd/S8CBM7fkwQUK2dHE7yZpljRvhpSwuCSj/R8CChNAG5nwaUS
         sToxSQU1OH1YeMYHVQPN73dTF4oUMiXGjzaltz2MIehjUByf4qKeVyB5j1j+y44gAR7Y
         /abg==
X-Gm-Message-State: AFqh2krtzvgjff3Q8JrZ0OaihxGUZcqYZuGIV4tjpmx6v84yqKhUU/BG
        ho+9i8bfzb0csA/VG8xyfDfLdr3J94xQkLeb
X-Google-Smtp-Source: AMrXdXu9rjfV7o7q3z/mrw8B4LNoGjFeBeukadWnDG+Pl5w6ReXv2THh7/euOg4HR+E16W+I/jqc2w==
X-Received: by 2002:adf:e912:0:b0:2b9:3cbb:6e02 with SMTP id f18-20020adfe912000000b002b93cbb6e02mr18277539wrm.27.1674395560165;
        Sun, 22 Jan 2023 05:52:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d6787000000b0025e86026866sm3800468wru.0.2023.01.22.05.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:52:39 -0800 (PST)
Message-ID: <d449d8f1-c5ef-89ea-49b9-aa0cfb5283f0@linaro.org>
Date:   Sun, 22 Jan 2023 14:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/8] dt-bindings: gpio: rockchip,gpio-bank: add
 compatible string per SoC
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/01/2023 12:06, Johan Jonker wrote:
> Currently all Rockchip gpio nodes have the same compatible.
> Compatible strings should be SoC related.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/gpio/rockchip,gpio-bank.yaml     | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index affd823c8..a604c3638 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -11,9 +11,27 @@ maintainers:
> 
>  properties:
>    compatible:
> -    enum:
> -      - rockchip,gpio-bank
> -      - rockchip,rk3188-gpio-bank0
> +    oneOf:
> +      - const: rockchip,gpio-bank
> +      - const: rockchip,rk3188-gpio-bank0

That's an enum so keep them like that

> +      - items:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

