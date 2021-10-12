Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA4F42A8CE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237544AbhJLPxb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbhJLPx2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 11:53:28 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C226CC061745
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 08:51:25 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k7so68152768wrd.13
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0OhKQIwoghCkVMvy0ntTgm1TZtrtuMJ/Kc4LFr0NMt4=;
        b=x4Rq60HqtgL8j1SAa7uu6kXxUrAJSrXmrdb15UbqyIRaKYIJpa5WclTIEllT8XQfgM
         Xxz4A0SKjrfCcEVd58dgbd0IeD+GmvzoLAieZL+g7Q8Qj1wiWfYf//qfiHPmIPloKUyY
         khzrjGjoPWpTIuR7qTvDqef7TcQ8FaNfF8Fx8HEjmHgDEKq/C/UFqd10CCpQxseydXk2
         kWiwxLbMHleQ21gNxsSNs3dD8exldIZs0LWWrMcwkhezsJEUelz+a4P7RW3KE2TjPUSb
         zuTA4HjLbP4wqqyqnPv8l44h0Jk4fU6hR9Xhu26+G8Dg8Csp37jJPuZZDMEMvfwON27t
         G6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0OhKQIwoghCkVMvy0ntTgm1TZtrtuMJ/Kc4LFr0NMt4=;
        b=SggsPh9PXv9PIupid90mJyL80nxnE8zv6knKR6I8OyMMT4eWToB6LnMq+doEltUfMv
         9Pm5GEelLGbypzEbVlT7wLE6qrmYqWIwYCr0doVH06ENccCglLR4YkcCMV6g5TdCiENJ
         K+DRlQYENP/UaJqpbck6Q70CusAphaFrbFmkZeTBYlUsyABfkVcfWFcEmZl4+wI0Yf2m
         sQtMsqHMdXuHJH9B/KQBKtsAwJe6ZWNFEgXpkCPlsaVy/gX/BI+uu1Ao0cBAb/nahG2x
         HeUBlPWvC7FEa+3T8qkp6SZPZCWgfZIxyLkzC8R7eqOuXLJj+gKRKy8fkuKQEvx2yv5z
         cpew==
X-Gm-Message-State: AOAM530gn3OEbsF5Zq9xxdbzDa1ceL+M6KYM6vNDkFQgom1Ut5TyfW5M
        945nFda51fwHfl/O/eRT5Qe2mQ==
X-Google-Smtp-Source: ABdhPJwTgOwYumKhS0NLYNtIZeo86a3d5YpXh9kDlz6oLvzLp9ICnppoWXU865MyyXk/g4O1H/66WA==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr6415280wml.9.1634053884330;
        Tue, 12 Oct 2021 08:51:24 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id g2sm11446141wrb.20.2021.10.12.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:51:24 -0700 (PDT)
Date:   Tue, 12 Oct 2021 16:51:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWWu+t487giK/FB2@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com>
 <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 12 Oct 2021, Rob Herring wrote:

> On Tue, Oct 12, 2021 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Tue, 12 Oct 2021, Rob Herring wrote:
> >
> > > On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > > > thanks to its device tree binding.
> > > >
> > > > Now that we have the DT validation in place, let's convert the device
> > > > tree bindings for that driver over to a YAML schema.
> > > >
> > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: linux-gpio@vger.kernel.org
> > > > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > >
> > > > ---
> > > >
> > > > Changes from v1:
> > > >   - Removed the example and moved it in the mfd schema
> > > > ---
> > > >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> > > >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> > > >  2 files changed, 55 insertions(+), 75 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> > >
> > > This one not being applied with the rest of the series is also
> > > breaking linux-next.
> > >
> > > b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am
> >
> > Thanks for the link.
> >
> > Seeing as there are no *real* dependencies, it would be better for
> > Linus to take the patch (if he's okay with it of course).
> 
> Only that 'make dt_binding_check' is broken for anyone using your
> branch (and linux-next ATM). It's as real as a broken build due to a
> missing header. If you don't think this is a problem, then don't apply
> MFD binding patches.

Ah, I missed Bartosz Ack up there.

Happy to apply it.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
