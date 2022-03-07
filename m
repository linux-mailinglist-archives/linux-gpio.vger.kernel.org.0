Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6114D02B4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 16:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243745AbiCGP04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 10:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbiCGP0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 10:26:55 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB5191AF7
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 07:25:59 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l10so5556372wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 07:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DLjppdPNclxnNzxkIl9swnhWDLoAKxeSBraXfxGifqM=;
        b=mvht7xuj6s4o9ZmX01iGIYCekCMF5uknxVLhzqWHRYyb3H+53XvrBpIOzqeh/RmImy
         DVprzHQIKou6ak1OByLmRVF0+Rsoejr/E4OX5HKMpktnQrORwlPV+b5rtkZANtWNcVP1
         kC/o+gK7h84s0KoAPBJUaRU4/MDswY3zqd6kR39dyk1akJBoyipXMp6lWaY7oBhCoeHw
         7A2LfUA8coeKRQ5sIFSeOIDVVW0UfYe5CgE5Nj8UTBbdPTxxjvfbQLK+HomiRW4k0rsb
         P/iJoXTHitpuOOpZhqCiM58A2eXJf8OJj1wqtwtDV6jNflvctVDQux35yyhKoCDO4C17
         UGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DLjppdPNclxnNzxkIl9swnhWDLoAKxeSBraXfxGifqM=;
        b=iao5TxJ8gqV4VfX+AfLdxo4U0YgfBkxM0Dp1srpEkmbtQKiHwwq5NPLnaCgLY4nalc
         7VQ72+9FS/NEdZ9iHApurm2uyZrbdWWLbwz9ibbU5wTo3H18dpnFTEt3bZPSy+nMDQWK
         ey0O6MH2jFQPxAENPmJi2OMXs3qcheS6Htm3Ow6GBJTkgXeaoJNd/jB566RKBNzBux7I
         8vPKnXgXk1Psil2ZFD4d3y1zo6z2ekZ3hKtlDb9MaptINLPCf3LrYDRY4d2uZKKB3sXf
         tFYnjQakzfhyPpUdP8L6fWsGeh1IOkmdJvKpeWz28VkyzOWDSAIpENd3817TzTsSw3fT
         3skQ==
X-Gm-Message-State: AOAM533Wvm+h7jtcTG7DRoF6f05+iMcVNQdG0vWoSPcKWnkWQqPshR53
        DR8uZ7kOwjxPnvPEGPzBdFRr1Q==
X-Google-Smtp-Source: ABdhPJwJyR6cT4CTpBHIlPWPVhFMW6Ck7YuUXyzycoVnA8ADZTVr5V4Yj4gd+AJbniIckaYf+dADbg==
X-Received: by 2002:a7b:c2f7:0:b0:389:860c:6d3d with SMTP id e23-20020a7bc2f7000000b00389860c6d3dmr9581242wmk.116.1646666757953;
        Mon, 07 Mar 2022 07:25:57 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id h36-20020a05600c49a400b00382aa0b1619sm12843430wmp.45.2022.03.07.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:25:57 -0800 (PST)
Date:   Mon, 7 Mar 2022 15:25:55 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        - <patches@opensource.cirrus.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <YiYkAz0Xk2y3vytU@google.com>
References: <20220303195034.2261989-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303195034.2261989-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 03 Mar 2022, Rob Herring wrote:

> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> 
> Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
>  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
>  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
>  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 
> Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> nothing from pinctrl.yaml schema is used, so just drop the reference.
> 
> Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix lochnagar-pinctrl nodename in example
> 
>  Documentation/devicetree/bindings/mfd/brcm,cru.yaml          | 4 ++--
>  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml  | 4 ++--

Acked-by: Lee Jones <lee.jones@linaro.org>

>  Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml | 3 ---
>  3 files changed, 4 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
