Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3222B56CBFF
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 01:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiGIXVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 19:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiGIXVj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 19:21:39 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C7424F24
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 16:21:38 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id g4so3291991ybg.9
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jul 2022 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+wOgjBqQ4hrZ4R4pko11p6CsU3jQfxhkCfOujQvvFo=;
        b=XiLJwmKnVBWSF8VJbH5DUv22akdceFEWmU5tf2Wij3i5Nejt72HEo3E0Z8MeQK08Rb
         /jUC31VjGn4GQfcI3zGBlwB4Y9LqXfRWs/zVdjtmry1k8u5TdEuu1XQl9cNxNiFLfs08
         wZNfaE9q/2g678/Gk796BRq8sAR29E89OLKkMrGUB7ecFIaibejKYORsh+ck+Se7+7D3
         wMhaID1NflCmlbt/hkzPrKanCsTf0a7Gx7n4bvegkDET15cxHfR0QtGMX/GXD60PMl5B
         F7Zt6/SrrJcXx6UnxvwGWT5eofKyPzu7kxs7K/31d3FHJEdjMresySKZTQ+WodEJFj7u
         rqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+wOgjBqQ4hrZ4R4pko11p6CsU3jQfxhkCfOujQvvFo=;
        b=ReuiyBbe5KQ6IgLXoCFhMKl6TSeDUqaykgRstAHhXJThhWFj+FIag9LHjDLk6WtcJa
         RZZ/afFSmQXiq7D71T5g1+F69OwDWFhanRi6pKPsBDbvOkWRFPvC7Q9ShLgqwQqeaFLK
         Z4/Y8uEXoXar8ipNHz9neLo1exk5V/jbEkTS5mrl7aAHymi8XY3w61/7sGz0H5Vbo5aX
         VVWvuWDpstohiWqpUoTACjvcGfTB53CQpJcSoXDuc3o0DpCPbsiDKodhkFP5YF2/WLX7
         R3IGgPAtMJ72wXxXpOf37Zn7ec2eBYMgnvsPmH9mzVs0XYIRJ2m7QariJNQp66BwRsf4
         oaRQ==
X-Gm-Message-State: AJIora9k7Ge35JZJg+LMYTExgz7aVllQTEYGhp/67GHdX3aiMm3L8aVZ
        hc+gRuo3n5yBFvfbmXZ7x7We0Vj0IP75KDhmK2GMwQ==
X-Google-Smtp-Source: AGRyM1sWT2McXikvJoPgc+m40gnLYrLmZCt7Bv/q1rbes9rfucTXXl+j1dsTOZ2u1tmX67QeXmCwTahgwhU0F2a3bN0=
X-Received: by 2002:a05:6902:150a:b0:66f:8a6:be47 with SMTP id
 q10-20020a056902150a00b0066f08a6be47mr2704717ybu.291.1657408897468; Sat, 09
 Jul 2022 16:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220704165802.129717-1-thierry.reding@gmail.com> <20220704165802.129717-3-thierry.reding@gmail.com>
In-Reply-To: <20220704165802.129717-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:21:26 +0200
Message-ID: <CACRpkdYGFR82DhX=n9ooVb47TvO4nDj74EDD4LyjejhwOfmoZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: tegra194: Separate instances
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 4, 2022 at 6:58 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra194 has two separate instances of the pin controller, one called
> AON (in the always-on domain) and another called "main".

Maybe this information should be in the bindings themselves
too?

Other than that:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
