Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA483EF776
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 03:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbhHRBVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 21:21:07 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44571 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhHRBVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 21:21:06 -0400
Received: by mail-ot1-f50.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so760722otv.11;
        Tue, 17 Aug 2021 18:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SvKci2pGuG7ajQwJqFrJTn5mqUzF+JKynExPCCsdFYI=;
        b=lX4ZiWBwjAeKqlK/nkbkIk4CHAGr1HZbhKE2hF+SXpBx6DYunb6cz8VL2ZwH90JJwW
         5uC1Y7OeYOOyik4H8o11AcpZO6n3GsHqBjgXP8pSYBQ0GH+/86qBK90tkR44d++aLBFd
         rH6bQ/IKnt6XxNitlXs3aABspCfPYYLe5Ft09gkLe1kXM3VN7p3kAA+0uEJEz+7n7zvL
         l4lovIMH8fCkZd6s8wqvo+yWU0Rp5j3ftW9ZcliW4KHKceSkkVheI5z363vF3aQSiCU1
         Tk9Gg/ojptwKGWHyDaY0dozzS4Cd5PVBjIdY394AReyrU48KGAYNXVaXaTH+deGApFK0
         Si0w==
X-Gm-Message-State: AOAM530ekd3Dp58+GjFXX8hWNwnA+1Z1FL9jPIKMItss71gOUBM7SIJo
        BFbfC07UXBJg/EWJoE9VOg==
X-Google-Smtp-Source: ABdhPJw+xR0Z6Q/+z2YaeF5ZyVo4tytqq09prFN4la6ON8Lt4wub10K9mhw5q6rk8gFvLBnMjoJ6XA==
X-Received: by 2002:a9d:71c7:: with SMTP id z7mr5012000otj.194.1629249632592;
        Tue, 17 Aug 2021 18:20:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d26sm781598oos.41.2021.08.17.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:20:32 -0700 (PDT)
Received: (nullmailer pid 1182736 invoked by uid 1000);
        Wed, 18 Aug 2021 01:20:30 -0000
Date:   Tue, 17 Aug 2021 20:20:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-watchdog@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-serial@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [v2,02/12] clk: mediatek: add mt7986 clock IDs
Message-ID: <YRxgXso7qQcAqg6+@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-3-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-3-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Aug 2021 15:45:47 +0800, Sam Shih wrote:
> Add MT7986 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: changed to dual licience
>     applied the comment suggested by reviewers:
>     - removed 1:1 factor clock
>     - renamed factor clock for easier to understand
> 
> ---
>  include/dt-bindings/clock/mt7986-clk.h | 169 +++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7986-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>
