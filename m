Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83EF6B5D65
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 16:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjCKPnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 10:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjCKPnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 10:43:32 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B179926C29
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 07:43:29 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id er25so4224453edb.5
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678549408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joefQDumS5DAEug0aZemuXUZtj8AzGARl18WyLpCzIM=;
        b=DGDcAxUp+bLWAmNzmfOwGpGCJaSQM7d0nEuc7q+J3VArbV/wz0SQnQHNByGf8jJIGc
         FMbNjljsJQiDkiUsk/ErLLxySK5ObggKRsG3pZ0p6kOWY1BM2EdKYWnLcURT2oBJ1x/m
         HyAOzZ9K48nD09XaEpXJihHclNPGpX3X+PGiniJCpLrwXwAOAnWFR+17+efivj89IZtX
         1VjCeP8OMrLyDIpKMBoIOabrqmLdN3X+zhkdgcf+YV22AFllSe6pOibZyIn5IeHjrPHR
         KqaToW3JLXMqoil/0fSztggAayKqiDrOUC7khnSYP56WKP4tQMEU8f6MaNDD0JJtx6uW
         5NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678549408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joefQDumS5DAEug0aZemuXUZtj8AzGARl18WyLpCzIM=;
        b=zWYNLH0uSxYdNl+bTt0z/KzIdnb/h8fmaojL+nVqGh3pnBFuOjivzOVoUdB3fcJpdv
         fhYiOYspCPYVqep1JurLM5prHmZ+ipBuguhNpOInLhLSwBdwjuhNUifr8z4db8/26Im0
         FvyQa7+ia7otUWEv7ccX0A4UcbTXzrWrxITyo2dAc1O6sV/ksc22JNVQfB45dEVCYpYZ
         YH3hhJNAyaMfNEy51prNYnJFIv0yR3qW2xLgqWifPcc/ht1h3bVBLYwJvXodrjvx6EXs
         Y+XOjJHVIOEhXNKtac4XfZuWmquOfINWga+WWP1KPoCHKJzOXdsBW8+ZfU2HKnPhHgbq
         805A==
X-Gm-Message-State: AO0yUKUo5KDBCMyjfNlt/agOXqcbGLpTbgNan5tQsyG494uLMDDm1IpQ
        8gRqjHYVpzeuBwWPSfqaQmJo/pjMKRyFQU+I1jY=
X-Google-Smtp-Source: AK7set+SYz5w+m7N9cpwUO+BTOJg00mFqXkmIwLNwt6Hbg+I/FT8TbgGXCvZl9e8K3Kg1qnTzDE0BA==
X-Received: by 2002:aa7:cd55:0:b0:4c0:e156:7954 with SMTP id v21-20020aa7cd55000000b004c0e1567954mr22784637edw.34.1678549408198;
        Sat, 11 Mar 2023 07:43:28 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:6927:e94d:fc63:9d6e? ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709065d0800b008def483cf79sm1190278ejt.168.2023.03.11.07.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 07:43:27 -0800 (PST)
Message-ID: <75f4c8a8-c0ec-a2e9-ec81-23cebef59c19@linaro.org>
Date:   Sat, 11 Mar 2023 16:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: Drop pinmux
 header
To:     Nishanth Menon <nm@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20230311131325.9750-1-nm@ti.com>
 <20230311131325.9750-2-nm@ti.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311131325.9750-2-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/03/2023 14:13, Nishanth Menon wrote:
> Drop the pinmux header reference. Examples should just show the node
> definition.

You could mention that it is not used.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof

