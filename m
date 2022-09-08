Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28FF45B1ABF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 12:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiIHK6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 06:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiIHK6F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 06:58:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A99B5FF68
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 03:58:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bt10so27093224lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=antfYS9CLMVQjoxq/t8g85oFIDvnTn3dzLrv3hZENl4=;
        b=Ntkh6WCu0pxXWpACDQuiRU5VFkn8LBrt/pLT5MPHvHa/AwSfwVkuB6PORbKnR4bA9G
         9+YMccu0nvkshOnU3uICq+UaoMcC8Fx8gmw8fLpBa+X2oshWlUL7W9pPcFT8caQbK3JB
         VIRD9ynibkix+K2u33yoTdHKsVXdFbVgfjMDht8+4Q1wwLgv1r6NOlqV57NT9RbKX+z3
         ZvmY8eagnKerJ2voJgW2VD/70jDVPz0B6G/qX14xBgSDaTq0F0yoWRb0+v75MIbHDteg
         VGHAnigqH3WE8FilG+oj+xb9JYQi7kuvOEWeaeUzJFbPreXwWUNLFrQY9Cs5goAmsl/O
         rtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=antfYS9CLMVQjoxq/t8g85oFIDvnTn3dzLrv3hZENl4=;
        b=xa/sepFGQwtJENXEiJTDTQd0631Z4wj0s0O7nUD/3rLiqnlpkVaFCN3jAOQBjfzjOG
         fZHHSY7XqRK388quWf2sWPgAlAyMt+c7s1jtxqDwOuYS2U1RYLsw1lTIwfXRsfTxJRFH
         TOcnpKXOiZhrKh8OwrvMTTIDgnJjfmV4+wL7gcCNvGX5V7D9wIPbd3KeZ6XRs5ZmudgO
         gB9sscpvnA5mJkhSYnsfWfO0UaL9uk0kyCrmVJ8n+MG9nfxQENg+EB9MvJlu8ZzC32Pe
         uOFNYppUqTFLtMPOKCSsX+qcQvTLi79BRF8Ei8s/GQE3XfjMd3RIncitFh3iAWHvNEKx
         NJRg==
X-Gm-Message-State: ACgBeo19tzA32EC77jfaT3fnjbsQZZsW0OCwQYNqjD/+fMABtiPCWpwy
        0RGbaSVYhU1fG7tIrscBbBw0Pg==
X-Google-Smtp-Source: AA6agR4I706BLfaiL+d2jUeE+l8ZvCBicR6HGvKGkJFxogWGEMMiEug0S/q1OWf4gErFrUPjIV1zIA==
X-Received: by 2002:a05:6512:258b:b0:496:fadd:55f9 with SMTP id bf11-20020a056512258b00b00496fadd55f9mr2836471lfb.356.1662634682929;
        Thu, 08 Sep 2022 03:58:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p15-20020ac24ecf000000b00497a3e2a191sm1171992lfr.112.2022.09.08.03.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 03:58:01 -0700 (PDT)
Message-ID: <be1c2903-c2af-74b3-b34c-5f8ee4935fad@linaro.org>
Date:   Thu, 8 Sep 2022 12:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: rockchip: add clock-names
Content-Language: en-US
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220901013101.2634480-1-jay.xu@rock-chips.com>
 <20220901013101.2634480-2-jay.xu@rock-chips.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901013101.2634480-2-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 03:31, Jianqun Xu wrote:
> Add 'clock-names' to the gpio dt node. so the driver could get clocks by
> a const char id, this patch names the clock-names as
>   - 'bus': the apb clock for cpu to access the gpio controller
>   - 'db': the debounce clock for cpu to set debounce clock rate
> 
> Since the old dt nodes may have no clock-names, this patch not make them
> as part of 'required properties'.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

I see this patch sent three times... version your patches.

Best regards,
Krzysztof
