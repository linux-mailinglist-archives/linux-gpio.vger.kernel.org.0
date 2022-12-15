Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4F064E30C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 22:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiLOV0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 16:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiLOV0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 16:26:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3392D27CD8;
        Thu, 15 Dec 2022 13:26:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8AF6327;
        Thu, 15 Dec 2022 22:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671139591;
        bh=JQrqhtL11L48cTij+OlsRJZQG3HfM5Z9q1ivB/bi3Bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHzFcbh/dcCo6lCWCcJZGUjxR7PVosNdwwslbfQevANHsvMgXWL665madYqYKR6Mw
         Ch/SjvVGS9SEGppEnYDeaAtkTF1Ix0Vc4UST4fKUxmXGa+cN8aOy2xochihqOGdaDw
         5s8dyc4A/wpllBuW2TviNOhjmhZMe+5F0l3xO1yU=
Date:   Thu, 15 Dec 2022 23:26:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
Message-ID: <Y5uRBPsa4YCsAbj2@pendragon.ideasonboard.com>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
 <CACRpkdbPy0krGYDdR4-Ga7tE=Wd6d2_KQ50b94VUvV=Zv=iBvA@mail.gmail.com>
 <CAL_JsqJ0xY5e6mZB_smTCNm0HfsPTF64d0YgikmRx8FPzjxKCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ0xY5e6mZB_smTCNm0HfsPTF64d0YgikmRx8FPzjxKCw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 15, 2022 at 12:21:33PM -0600, Rob Herring wrote:
> On Thu, Dec 15, 2022 at 7:16 AM Linus Walleij wrote:
> > On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein wrote:
> >
> > > thanks for the feedback I've received. This is the reworked RFC for
> > > adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> > > Now the delays are neither specified as gpio-controller nor
> > > consumer-specific properties.
> > >
> > > v2 is a different approach than v1 in that it adds a new driver which will
> > > simply forward setting the GPIO output of specified GPIOs in OF node.
> > > The ramp-up/ramp-down delay can now be actually defined on consumer side,
> > > see Patch 1 or 3 for examples.
> >
> > I really like this approach, it looks better than I imagined.
> 
> It seems over-engineered to me. So far no comments on my 3 suggestions either...

I like the idea of handling this on the consumer's side, possibly with
standard foo-gpios-ramp-{up,down}-delay-us (name to be bikeshedded)
properties as you mentioned in the review of v1.

> One is to just use some GPIO flag bits. Say 4-bits of GPIO flags
> encoded as power of 2 ramp delay. We have to pick the units. For
> example, 100us*2^N, which gives you 200us-3.2s of delay.

This could probably work too.

> Anything less is short enough to just hard code in a driver.

In which driver though ? The whole point is that we should avoid
handling this in particular drivers.

-- 
Regards,

Laurent Pinchart
