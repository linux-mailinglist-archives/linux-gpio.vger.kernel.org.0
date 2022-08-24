Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926CD59FA4A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Aug 2022 14:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbiHXMri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Aug 2022 08:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbiHXMrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Aug 2022 08:47:36 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BBE9083D
        for <linux-gpio@vger.kernel.org>; Wed, 24 Aug 2022 05:47:35 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n15so2762613lfe.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Aug 2022 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZUpMSIDqsTgGgd5HUMEVbQG3gXHxQEJwHf+JxBOfjok=;
        b=OADfvvWHsXfdJrIU6icvXfguqE9THxW6oz3hk1h+6Aam4fSImoFKp+FD8DZWqH08Xs
         bkw6eTky+GiGJ4B0ZtLz2EQkbizXh41RNFK6YC4ujGcn8KpLrHVBhwYSSQfNnXXRbSVu
         /pEEoKH1UI0PaX7WVNYK9fBneV6XchHxJpjnA/NeZW9BGE5eEwfXB3H9yXK6SPRs/imw
         CtemRasRteWwDwV/Wrw4POPdOsYRJqK0npdehfIpNbFy9d3F8xSwGKGJjLWeAFQi0eJP
         KC8xmCUgVRFny+JQ9Mt4Xo9A7KTSJ7yS9GkE5BSrkPkA5JOXu5oZJv+c/O0l22YdfSbP
         zEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZUpMSIDqsTgGgd5HUMEVbQG3gXHxQEJwHf+JxBOfjok=;
        b=BD3TcSniZ3+Qf+lYqA+t3YubNabVvJvu9k1zmcskIp/ZJMIHNlocby+3jhQQi+hvtW
         Ql/XjBGBctzAJA49r4ztNfro4kjLVEyE/S/37nQNFj64+0nIvUTzBg6AU36m6KH7P8X5
         9HNFGMgrue2bpUse7LqqqaXEmvqATX2dDC1SSV66KSBVcb0k4gpykSiMaoEZSe3X98BQ
         ViHfRsfDIui5WowzjTxBvmjYqLgO4vPkoVALK3rTMzkFYRTO6NIwOPO42AzfkQATJwuF
         YnbGRgNhd+QCF96T30LwzCAPlpUGS0YNC8nfI7tE/vEEZ1wy440qoFFip2/8Sc+FWweZ
         O89w==
X-Gm-Message-State: ACgBeo0nz5KjPEJ3OhXp/o3y99Fn+ugU+OalHei0JxleTeSAJ9ZnBir5
        JNpV4Bq0DEZGoVOKcdIxA8Irfw==
X-Google-Smtp-Source: AA6agR6cZ6914v1H2yOOzs8QziISFTpV/gKx4PI2mgNZIJ4eUl6+V3xKe+l/W0/ITEsLKGcKGO5XSg==
X-Received: by 2002:ac2:5f43:0:b0:492:d6e3:1dd3 with SMTP id 3-20020ac25f43000000b00492d6e31dd3mr7798393lfz.326.1661345254041;
        Wed, 24 Aug 2022 05:47:34 -0700 (PDT)
Received: from [10.243.4.185] ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id p5-20020a05651238c500b0048a83336343sm3007721lft.252.2022.08.24.05.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:47:33 -0700 (PDT)
Message-ID: <25820bbe-c232-fb5c-0654-fc917ed8ad92@linaro.org>
Date:   Wed, 24 Aug 2022 15:47:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] arm64: dts: ti: Add initial support for J784s4 SoC
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>
Cc:     Apurva Nandan <a-nandan@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hari Nagalla <hnagalla@ti.com>
References: <20220819190054.31348-1-a-nandan@ti.com>
 <20220819190054.31348-4-a-nandan@ti.com>
 <b572cfa0-a051-ee7f-c720-5f0ccbea8950@linaro.org>
 <20220824050233.u4457ldxiqtiia4p@nineteen>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824050233.u4457ldxiqtiia4p@nineteen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/08/2022 08:02, Nishanth Menon wrote:
> On 13:18-20220823, Krzysztof Kozlowski wrote:
>>> +	main_gpio_intr: interrupt-controller@a00000 {
>>> +		compatible = "ti,sci-intr";
>>> +		reg = <0x00 0x00a00000 0x00 0x800>;
>>
>> 0x0, not 0x00. Here and all other places.
> 
> 
> Krzysztof is this a convention we have started following strongly?
> 
> The reason I ask is to be able to cleanup elsewhere in the dts as well..
> 
> 
> So far, I have insisted on 0x00 usage.

Not really, just stick to one. Your other nodes have 0x0, so just choose
one. Anyway additional zeros seem redundant, but it is up to you which
convention you prefer. Just choose one, not mixed.

Best regards,
Krzysztof
