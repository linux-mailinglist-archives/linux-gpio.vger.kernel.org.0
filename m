Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE6138AB87
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 13:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237091AbhETLZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 07:25:51 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:60737 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241257AbhETLYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 07:24:06 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 6a821899;
        Thu, 20 May 2021 13:22:42 +0200 (CEST)
Date:   Thu, 20 May 2021 13:22:42 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     robh@kernel.org, kettenis@openbsd.org, devicetree@vger.kernel.org,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CACRpkdYPsL+5ZN3WOovwqkGydaGoJZCskwMkT6rhZ1BYpYVgrw@mail.gmail.com>
        (message from Linus Walleij on Thu, 20 May 2021 01:27:37 +0200)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
 <20210510141955.GA58072@robh.at.kernel.org> <5612be5a12568600@bloch.sibelius.xs4all.nl> <CACRpkdYPsL+5ZN3WOovwqkGydaGoJZCskwMkT6rhZ1BYpYVgrw@mail.gmail.com>
Message-ID: <5612e60278566bd3@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Thu, 20 May 2021 01:27:37 +0200
> 
> On Mon, May 10, 2021 at 7:06 PM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > > From: Rob Herring <robh@kernel.org>
> 
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: apple,t8103-pinctrl
> > > > +      - const: apple,pinctrl
> > >
> > > A genericish fallback is maybe questionable for pinctrl. That's not
> > > often the same from one SoC to the next.
> >
> > Krzysztof raised a similar point.  It seems that Apple isn't in the
> > habit of changing this aspect of their SoCs.
> 
> Rob what's your stance on this? Does it need to be changed?
> Else I'll apply the patch.

Hi Linus,

Rob asked me to provide a description for the interrupts in response
to the v2 I sent a few days ago:

  http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210516183221.93686-2-mark.kettenis@xs4all.nl/

I'll roll a v3 later today for that.

Cheers,

Mark
