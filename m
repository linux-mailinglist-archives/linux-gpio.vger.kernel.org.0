Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB59C2DCF61
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 11:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgLQKRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 05:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:48618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgLQKRi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 05:17:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608200218;
        bh=R0x1PA8BvcIrgXrlUvqF6asRJGMm2WhicqNyzRbZC2o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mCL1L9zgdfqLhBl2s7Z9cWUEM5KEpflWhFZaOhh3dbYhlmraw4KTFW1Yh6wHlWEsS
         Eu427VLD3QX6z2qjMeyRu7gLqwgHoiEJbuzK72wlgEYQMjpj66IKazEg3bIZCa0tS3
         x14drQubinSh3dl3V1RbLu0itU7G9142RXMd3bMO9YFornBfgvT7byTXJcz706WCl2
         DhVkteYoW7WUlR/JfEqu+NbvfpnB6F+FzQKyiO3PAujPt3HBZMSS9ChuQ+tRHiQsR4
         taLbQSCM/AqHjaBNZixdrhHexcseMI3PvmqWJ/sxqc+53WDHEPCCCYeme3Zk6OycoJ
         h2zjkylROTluw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-10-damien.lemoal@wdc.com> <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com> <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Thu, 17 Dec 2020 02:16:55 -0800
Message-ID: <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-17 00:13:57)
> On 2020/12/17 17:10, Stephen Boyd wrote:
> > Quoting Damien Le Moal (2020-12-13 05:50:42)
> >> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-binding=
s/clock/k210-clk.h
> >> index 5a2fd64d1a49..b2de702cbf75 100644
> >> --- a/include/dt-bindings/clock/k210-clk.h
> >> +++ b/include/dt-bindings/clock/k210-clk.h
> >> @@ -3,18 +3,51 @@
> >>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> >>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> >>   */
> >> -#ifndef K210_CLK_H
> >> -#define K210_CLK_H
> >> +#ifndef CLOCK_K210_CLK_H
> >> +#define CLOCK_K210_CLK_H
> >> =20
> >>  /*
> >> - * Arbitrary identifiers for clocks.
> >> - * The structure is: in0 -> pll0 -> aclk -> cpu
> >> - *
> >> - * Since we use the hardware defaults for now, set all these to the s=
ame clock.
> >> + * Kendryte K210 SoC clock identifiers (arbitrary values).
> >>   */
> >> -#define K210_CLK_PLL0   0
> >> -#define K210_CLK_PLL1   0
> >> -#define K210_CLK_ACLK   0
> >> -#define K210_CLK_CPU    0
> >=20
> > This seems to open a bisection hole. I see that ACLK is used in the
> > existing dtsi file, and that is the same as CLK_CPU, but after this
> > patch it will change to not exist anymore. Can we leave ACLK around
> > defined to be 0? I imagine it won't be used in the future so we can
> > remove it later. I can then apply this for v5.11-rc1 and then merge the
> > clk driver patch in clk tree.
> >=20
> >> +#define K210_CLK_CPU   0
> >> +#define K210_CLK_SRAM0 1
> >> +#define K210_CLK_SRAM1 2
> >=20
>=20
> Patch 6 of the series removes the use of K210_CLK_CPU and K210_CLK_ACLK f=
rom the
> device trees. I added that patch as the DT modification proper comes only=
 at
> patch 16. Maybe I should squash patch 6 into this one ?
>=20

Preferably the defines are just left alone forever and then forgotten.
The dt-bindings directory is almost ABI and so changing numbers or
removing defines is hard to do. Usually patches in this directory are an
additive thing.
