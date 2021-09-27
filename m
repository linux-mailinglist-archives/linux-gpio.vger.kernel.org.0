Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D771C419115
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 10:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbhI0IsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 04:48:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50440 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbhI0IsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 04:48:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 94EA71F429D1
Date:   Mon, 27 Sep 2021 04:46:34 -0400
From:   Alyssa Rosenzweig <alyssa@collabora.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sven Peter <sven@svenpeter.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <YVGE6r5RPjuP6u+W@maud>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
 <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
 <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > Apple calls those four controllers "gpio", "nub-gpio", "smc-gpio"
> > and "aop-gpio". SMC is their system management controller and AOP
> > is their "always-on processor". No idea what "nub-gpio" is.
> 
> It's similar to what we have in Baytrail/Cherrytrail.
> AOP -> SUS
> SMC -> ...
> 
> nub is probably related to some type of hub (or maybe simple typo, or
> typo on purpose?).

Unlikely a typo. "nub" is an Apple term. In software, an XNU (macOS)
kernel driver has a "nub" for exposing its public API. I don't know what
it means for hardware but very likely intentional.
