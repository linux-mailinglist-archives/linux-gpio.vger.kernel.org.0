Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141436E367A
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 11:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjDPJIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 05:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjDPJIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 05:08:36 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFCF1710
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 02:08:34 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id vc20so1662716ejc.10
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 02:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681636112; x=1684228112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iVzZMtuVtPL5EfnPX4GJynjPPBEy50a8B0MBjMmaGY=;
        b=QqMwyGaNfQavwwN9sOJ4yJkl3LWmjkcPBeRCIw3j6zZSnf7UlhCgiaowuYReyqXGNi
         WBHxRdyQCiu157oZR6lm1MtxFp4MwMoxYeImTyWp532rECQIFvfAQuWVv7Z3o63cm/ao
         y59rm+9dpMmCvb4cz4f0hdV3cRPu0hVuMCYxPXXT7IQ4HwOvBLE0flk+4IMGonWFRMHY
         2cMQfMhSOOqO9ntIgSeAtrj4JC5Jr/qAba8BgUYXgrHHgCnvMQhMiEH6qVEX0r9Xz/oh
         zQwhzGTAX4im05yvj4SnGDKwRV2quJqox7i7RDDZqVjgEXkiO2R8Lj+v/ebnnbWPCvAS
         fp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681636112; x=1684228112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iVzZMtuVtPL5EfnPX4GJynjPPBEy50a8B0MBjMmaGY=;
        b=gsYfy+Q7PhPEbLJWHkXMlgMhsEteBhGq8OweTsW++BR+KeD8xmwpr/20OJYNnhsE8P
         e7wKC7S/Eul4waBjVzEr6th0axhiau3WG/dB3ZMsDFj9BX+r6zfDLG54NiwfiTJxdknH
         ZG9Wzba7Zr3dJ4KVpNf+aoDbwAFfvp6H7/Iw0rIpfcKgmPQ9sYqHFDZyo9AbpdfcfMyu
         s8RgmvEDtj2JKAR4LnBNnYYH25dd+WWA3htB+D/Du7EDB+mKjqFcB4JuJ8avlUmZyk3n
         AAvTwkWiWse0WXI582PaT7i6VWkVLlul9XZ4XEfbfVduaHXnJQpZSJh9urSrUJHMM30i
         A4ug==
X-Gm-Message-State: AAQBX9dYqFu+v+hKA9JIipRu8RuzXQs4181BLYSRbnkQKpGBVuLVabX1
        u9H2fO8PVdUh913h6h5SXZlywQ==
X-Google-Smtp-Source: AKy350ZzuDK19/V14tNBGjj9hK+8MosfCZizTsSGF0i+56aCRZpjthV486zpLVSS59djue/xAJ1ENQ==
X-Received: by 2002:a17:906:ecba:b0:94e:f3d5:e4f8 with SMTP id qh26-20020a170906ecba00b0094ef3d5e4f8mr3892764ejb.37.1681636112693;
        Sun, 16 Apr 2023 02:08:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id re15-20020a170906d8cf00b0094ef923a6ccsm2736055ejb.219.2023.04.16.02.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 02:08:32 -0700 (PDT)
Message-ID: <1d7b92ec-2aa7-d69b-0959-b62751ac29c5@linaro.org>
Date:   Sun, 16 Apr 2023 11:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 7/9] dt-bindings: mmc: sdhci-msm: Document the IPQ5018
 compatible
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1681468167-11689-1-git-send-email-quic_srichara@quicinc.com>
 <1681468167-11689-8-git-send-email-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681468167-11689-8-git-send-email-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/04/2023 12:29, Sricharan Ramabadhran wrote:
> Document the compatible for SDHCI on IPQ5018.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540


Best regards,
Krzysztof

