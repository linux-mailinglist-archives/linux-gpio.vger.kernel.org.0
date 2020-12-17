Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344042DCFBC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 11:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgLQKuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 05:50:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgLQKuG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 05:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608202166;
        bh=IHqvIzeT44TaD9aaUc8PyL7YXy3hvVBgUG/OHFSFaaA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mdSvliX2x2jj1hqcaE9GugLxg+uvTty8dWlmPINRIQ73YGm4sgircwj3elJ7HmkCg
         8PQsHRvtNf3X+Ds/dYrJhh4BmfYa8mSd5ywvLMvs90U8llnZEsS/2y6M7z1TJcs8OL
         H1XOkWupOhiQK4v1F1n1hm/qMXJDkXQviX5ex6h5bXea7cBkNHZ3LT4MflavUn+DH4
         F0P29NBqTlUtpqObZDVYltt4R2tLru7clWkB1/trvyjX2f4xuiBH165sEhmDqiqo8m
         YVh9kP6S9mSXwEnR+2+axplesYCr8a4clFUxvwQ7vuEknnMdRXQFmbAmzBj+TCtEMA
         3F8FHJdPtRXAQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-10-damien.lemoal@wdc.com> <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com> <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com> <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com> <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
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
Date:   Thu, 17 Dec 2020 02:49:24 -0800
Message-ID: <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-17 02:43:50)
>=20
> I just did that. It works.
>=20
> Ideally, patches 7, 8 and 9 need to go in together with the clk driver pa=
tch.
> Since the builtin DTB patch precedes the clock driver patch that touches =
the
> sysctl driver, I need to rework it a little, keeping the
> SOC_DECLARE_BUILTIN_DTB() for now. And finally, a small DTS update patch =
needs
> to be added too for the sysctl & sysclk nodes update. That would make it =
a 5
> patch series for the clock driver addition. Would this work ?
>=20
> Or, you just take patch 9 (clk doc) and patch 13 (clk driver), slightly m=
odified
> to move the sysctl register definitions into a common header (currently p=
art of
> patch 7). 2 patches only, without any other change, resulting in the clock
> driver not being used until the rest of the series goes into 5.12. Do you=
 prefer
> that solution ?
>=20

I was thinking of just applying this DT binding patch now so it gets
merged into the next -rc1. Then anyone can use the defines because
they're in Linus' tree and wherever the dts file ends up can just base
on -rc1. I probably won't merge the clk driver until v5.12 given that
the merge window is open.
