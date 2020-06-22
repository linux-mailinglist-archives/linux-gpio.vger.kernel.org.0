Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B819D203D08
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 18:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgFVQsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 12:48:08 -0400
Received: from muru.com ([72.249.23.125]:58714 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729492AbgFVQsH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jun 2020 12:48:07 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C73F08140;
        Mon, 22 Jun 2020 16:48:58 +0000 (UTC)
Date:   Mon, 22 Jun 2020 09:48:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: single: support #pinctrl-cells = 2
Message-ID: <20200622164804.GN37466@atomide.com>
References: <20200618125057.41252-1-drew@beagleboard.org>
 <20200622161132.GM37466@atomide.com>
 <20200622164628.GA510359@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622164628.GA510359@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200622 16:47]:
> On Mon, Jun 22, 2020 at 09:11:32AM -0700, Tony Lindgren wrote:
> > * Drew Fustini <drew@beagleboard.org> [200618 05:52]:
> > > Currently, pinctrl-single only allows #pinctrl-cells = 1.
> > > 
> > > This series will allow pinctrl-single to also support #pinctrl-cells = 2
> > > 
> > > If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> > > pcs_parse_one_pinctrl_entry() does an OR operation on to get the
> > > value to store in the register.
> > >     
> > > To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> > > omap.h is modified to keep pin conf and pin mux values separate.
> > 
> > Hmm to me it looks like the order of the patches is the
> > wrong way around here. Don't we need to first change
> > pinctrl-single.c, and then only after that update the
> > dts? And make sure the pinctrl-single.c change does not
> > break anything without changing the dts :)
> > 
> > Regards,
> > 
> > Tony
> 
> Thanks for pointing this out.
> 
> I'll submit new version where:
> [PATCH 1/3] pinctrl: single: parse #pinctrl-cells = 2
> [PATCH 2/3] ARM: dts: change AM33XX_PADCONF macro separate conf and mux
> [PATCH 3/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

OK thanks. Otherwise sounds like git bisect will break for booting.

Regards,

Tony
