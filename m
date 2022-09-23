Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7131A5E81CA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 20:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbiIWScA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 14:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbiIWSbv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 14:31:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5B21280D5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 11:31:40 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d42so1660069lfv.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 11:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Na3n3SprFDx9daDpLXiteUuNQB+TrmpJxeAgycVYyAI=;
        b=CjCeDRwHaGYT1YuWQxXkM3FEWJXzp2iy14ZqpmfHok6hO6STyc0pQciAJ7d8zCYtlY
         NwQ9eSGnCoB5C6U4VYWfHaEX52sCSdm6/idxArbiGQbs09la+f9lvy/S2uDaU21SSPXu
         dLZ8rJalWzQJ0CqiC2wE8dMmlW+JUWl6Hia88EWhCTKXFR6LkF3hOm86v9oXW/+FKdeT
         KeM2MDKEU0JMNuS/sMC9oycZXkcpWJCG2rVUERMqR1oEjQO5xNcdGDXHkMcwu2FcxEa6
         qr75Rxfh2pJnXSesWh9eTdHRV+1zfAGtY07CzieyTcS9TDsU6vJCyJD39QmLHbAEV4YS
         gL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Na3n3SprFDx9daDpLXiteUuNQB+TrmpJxeAgycVYyAI=;
        b=dZ2gOxZmGnhK8LFCT6e9z/FFYmW3XKTVc0ztZ9vVU32ISklNC2m/Veg+5sJO6GOuVz
         fjfKDYLXxUPBYNEnW7G4vS0CR3je0LzDGfjELTgJzyq2/4xZrHyRxp/v9uUYIDSs/lIX
         lLZc4rrDIc3O8FibuoIchDceMzH2DeKADzzI8455Qxxvh+ZMso/FBWSBCAt4aQDQehPZ
         rI9miXU3fItJIz3pcNxrc6QUqg+xJjuENAR9m3yNZfd2OveSmjLYdfWzZDcLm6FeWL+j
         udKMp/LhJiQ4rT2EBdsoWa7ss3eL1ubvrociGM9kSR9kBR3mDumrUVdJg8VZU+52YUXd
         hYkA==
X-Gm-Message-State: ACrzQf1R8WcjmFP7rlAirmCzGWfGYp0hfg3yjmnO7d5LjYxIcVLYmBOs
        VpcU7xosD5/Yqamwz3EgXuSrJw==
X-Google-Smtp-Source: AMsMyM7qcE1cRvo+guW4S55Xk58U7p8CtcbQzqo2RVUdpgm6bVh1yHZKICeYrhtWrRXIlDnjPtzN3w==
X-Received: by 2002:a05:6512:1309:b0:492:e273:d800 with SMTP id x9-20020a056512130900b00492e273d800mr3672433lfu.93.1663957898710;
        Fri, 23 Sep 2022 11:31:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r11-20020ac252ab000000b004946bec4e7fsm1566214lfm.41.2022.09.23.11.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:31:38 -0700 (PDT)
Message-ID: <8ebb5b7d-dcdb-5bf4-06f1-37e5910554ba@linaro.org>
Date:   Fri, 23 Sep 2022 20:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 net-next 12/14] dt-bindings: net: dsa: ocelot: add
 ocelot-ext documentation
Content-Language: en-US
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
References: <20220922040102.1554459-1-colin.foster@in-advantage.com>
 <20220922040102.1554459-13-colin.foster@in-advantage.com>
 <35ba126d-be10-2566-63df-3c474cdc8887@linaro.org>
 <Yy34edNkKopsETcg@colin-ia-desktop>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yy34edNkKopsETcg@colin-ia-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/09/2022 20:18, Colin Foster wrote:
>> "Currently supported" by hardware or by some specific, chosen
>> implementation? If the latter, drop it. If the former, maybe this should
>> be constrained in allOf:if:then.
> 
> Hi Krzysztof,
> 
> Currently supported by the software. This patch set explicitly adds
> support for the four internal ports. There'll be another patch set right
> around the corner that'll add QSGMII to ports 4-7.

Then it is not related to the bindings.

> 
> I see your point though. I'll drop "currently" and have it match the
> wording of the other drivers.

Drop entirely that sentence. One, chosen implementation in a very
specific moment should not be referred by bindings.

Best regards,
Krzysztof

