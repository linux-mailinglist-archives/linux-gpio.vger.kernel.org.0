Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860655B03DE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 14:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIGMY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 08:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIGMY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 08:24:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAE9606B5
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 05:24:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq23so22163444lfb.7
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2022 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=E2pT4odo6msVCFiBbsbwvyP9vmPfqCiwzxLpHRkjPYM=;
        b=SoJPMjFm1nUngdJKsZo6R74ErZZVSLhUTFdVPyI22UExnaAv0xjLfmiA+74HpRy4yl
         ZpW/EhYmjMU/7ke3aIVO2+dzFG/4IiScASJOO+SYeTWT6axgKLOsEKZ7MjVB61G9Xtsl
         mlTawNJBSL+rf8EjRRkXfGJl6osMtW+YT9MsAJvmvyKQHkwG1bf1325r27jrmTZOM2CW
         virR4+Q09haaiEosBh8Dsicaf4/JvHMV3tR2kOB0/UqPw/XlKUbLw+AGBkS9U2p1R3uU
         4usf3t0jKmycOVZU4ExBRWckQZ+IXu/n6E/1eG/vPBm5kHu9AN6yYL5Pa8ljUw24WB2I
         cViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=E2pT4odo6msVCFiBbsbwvyP9vmPfqCiwzxLpHRkjPYM=;
        b=POPaGDtvTyvLHgnxan/Qjyj1ZytuBsdRIFMszQh2HF4GMDFw2XwJgt6bTK6VjtFfH1
         r2oXtM+cF+edlHZkhLdyqA9iC8FOJ8iA+VRxsDaXdLYzHnM4ligULu+/UcLn/FPozDxW
         8rgLxVKozXj25vvkq6OFa2EzKb0/YwHs5MXs9AIIZrm7HiwJMiRjYA3Ey+wJQ+AGu44a
         XGZSXf5qw7IUp73UFRU24aWChR23ptoL+u9hg1073BOA0HN9SJgz4PPxtou2TLNmFapp
         xBslijQQmPa+5zbISq3j0weVP2ermr8X7O8b2g7ykj4eQVMMW+KNv9ba0z1uvNSpBJxt
         4xXQ==
X-Gm-Message-State: ACgBeo1QLJujgMvqMUHEHbhZOBHT3D98Cjd76f6oS0FhAhrCP3zNBSf0
        +wyvr7WlA1FdklNg06H4jSoj7A==
X-Google-Smtp-Source: AA6agR7sRSdXN8IO/gCJjSavuucCA2q3Oud2U6duP0DjI7M8CqbyCZHInxPQlOW5yDAPWQzSAiQOmg==
X-Received: by 2002:a05:6512:ad0:b0:497:a620:157d with SMTP id n16-20020a0565120ad000b00497a620157dmr1116655lfu.643.1662553494421;
        Wed, 07 Sep 2022 05:24:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i5-20020a056512318500b004947887d0acsm2444567lfe.174.2022.09.07.05.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 05:24:53 -0700 (PDT)
Message-ID: <123a9a03-e1d1-cf0f-8d09-b90f75b1050d@linaro.org>
Date:   Wed, 7 Sep 2022 14:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: rockchip: add clock-names
Content-Language: en-US
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220902060426.2980951-1-jay.xu@rock-chips.com>
 <20220902060426.2980951-2-jay.xu@rock-chips.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902060426.2980951-2-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/09/2022 08:04, Jianqun Xu wrote:
> Add 'clock-names' to the gpio dt node. so the driver could get clocks by
> a const char id, this patch names the clock-names as
>   - 'bus': the apb clock for cpu to access the gpio controller
>   - 'db': the debounce clock for cpu to set debounce clock rate
> 
> Since the old dt nodes may have no clock-names, this patch not make them
> as part of 'required properties'.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
