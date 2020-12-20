Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889492DF3E5
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Dec 2020 06:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgLTFfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Dec 2020 00:35:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:43976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726729AbgLTFfo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Dec 2020 00:35:44 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608442504;
        bh=aIFosRjp0pvkc7SjVi5j1znmZz4mlFjF/3Le9rkNXvw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OUPgAhjqV84wDwcNTFEfgf5cCxdnSyI6X244yxCQ/4HKA8VLf+g6B8GYj/pRVYc/e
         GkcMovrHkCP2M2Qkb6uYeqIpAodyDmSqZSN4GyQxIfpZCsxO0PV4c40SJkD/HNAg4p
         slsRhyfuGBu/zmRxX8N+K5liQvNqYSw84cbLBB+ZYS7XxxL0S6wfeXUn8TnUp2Dg8e
         RpHvkhcXp7SSvsIRBLf3MXgnxLvn8nLQ8RK+LCv3CoFYJc2rKf7hR5DSPonNLYNcNy
         BRdIPrqMcS12RfywFvjY3jmNUOYAri/36JaeY5o8AYzNoykV34012mHoEQjAg2ZAA3
         LauaD7TSl5pcg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-10-damien.lemoal@wdc.com> <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com> <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com> <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com> <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com> <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com> <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
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
Date:   Sat, 19 Dec 2020 21:35:02 -0800
Message-ID: <160844250293.1580929.6654681087428087193@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-17 02:51:20)
> On 2020/12/17 19:49, Stephen Boyd wrote:
> > I was thinking of just applying this DT binding patch now so it gets
> > merged into the next -rc1. Then anyone can use the defines because
> > they're in Linus' tree and wherever the dts file ends up can just base
> > on -rc1. I probably won't merge the clk driver until v5.12 given that
> > the merge window is open.
>=20
> OK. Makes sense. Sending just the clk binding patch then, with the K210_C=
LK_ACLK
> clock definition left in.
>=20

Did you send it?
