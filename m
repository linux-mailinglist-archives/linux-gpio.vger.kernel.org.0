Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734246B06F6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 13:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjCHMWv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 07:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjCHMWm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 07:22:42 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB46BF395
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 04:22:03 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id ay14so61244827edb.11
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678278105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1+QoiB0k7uK9HwVoaPFB3R0wsTQ3wETZ1dYhPGfX2I=;
        b=uNbCAtDRe7cRmmmBtkPCr0ZzwY6e6K7KsgA2K6mCUj33OWW6/+RKq16XEes4f6E0C5
         ZH6zitE0olyk59gTq/3/USR67zm3uf8aORzkwKFvvsl5yqMlDDs48kHn5UmlSADlXpeN
         hN7+uvMGBjvwUFutWz/KFmVmgT3ZDcTexetCRpj10DximvboLm2kRiqFgyvy6EnZEZ0L
         wEE2h6bDoDSl5PsYSv2GAEyS5os9L/+CyXC6x+nfj4+vm+CzCSot3fYYlpxOx1YFX7kc
         c2FNdrEQrP6FnzWG9Ww9iVHm8AUno2xhoqJw8uftgYwqBaJErvi9kf/QDD5MLwUhnCcr
         8Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1+QoiB0k7uK9HwVoaPFB3R0wsTQ3wETZ1dYhPGfX2I=;
        b=frcoJ167QBkmAowGnmV713X4/CvEFEsM0pj2Hhk2G+cNMz2Ta7v1L3sxcowr5syiTn
         5C/sf1T8cSd6nXiaayRpAaCur/DdYJ4/PAx9leHIqfoEuYiu8XGPmftIbYxWdmB98kxQ
         oFxNdNdUB3BlbWfkMqzzvTAPzlgZMGo5EOhGKacxYVzedhMdzDFwstLyf6Vqs7qwBflE
         TBHDkRC4mYdnfDbl6RxuIkCDcF2fyW9ndbl1ZNX9AMpsv0OmIsq6WHDpHtzou2G86PAP
         G5+H1UCX+pZZEDlNmBbK2m2Tu+dMgQhJoFTH+/40AGU9L8iy/IpZlLoKrZUx7aV+Pr2s
         cZrA==
X-Gm-Message-State: AO0yUKWVr7uXerETKFGDePno+XdTC5hUFkxIcoiU70DgTUz2tAhvg/dD
        kNWGbcyHG9FlI0VP0yAVxzCcfQ==
X-Google-Smtp-Source: AK7set//pnG/hUfU9dnpKwgyOtGLLsGngkBOwgX0mXHkioCCsnLFf9+5fdRAS06P4j5ui/g+tHOHEA==
X-Received: by 2002:a17:907:a0d5:b0:88e:e498:109b with SMTP id hw21-20020a170907a0d500b0088ee498109bmr23363670ejc.5.1678278105564;
        Wed, 08 Mar 2023 04:21:45 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id e19-20020a50a693000000b004ad61135698sm8062309edc.13.2023.03.08.04.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:21:45 -0800 (PST)
Message-ID: <c4d53e9c-dac0-8ccc-dc86-faada324beba@linaro.org>
Date:   Wed, 8 Mar 2023 13:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: pinctrl: k3: Introduce debounce select mux
 macros
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20230308084309.396192-1-nm@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308084309.396192-1-nm@ti.com>
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

On 08/03/2023 09:43, Nishanth Menon wrote:
> Introduce the debounce select mux macros to allow folks to setup
> debounce configuration for pins. Each configuration selected maps
> to a specific timing register as documented in appropriate Technical
> Reference Manual (example:[1]).
> 
> [1] AM625x TRM (section 6.1.2.2): https://www.ti.com/lit/pdf/spruiv7
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  include/dt-bindings/pinctrl/k3.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

So these are register values? You should consider moving them out of
bindings, like we do for some other platforms.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

