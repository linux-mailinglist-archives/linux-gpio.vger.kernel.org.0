Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4427F2DF152
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Dec 2020 20:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgLSTpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Dec 2020 14:45:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:41266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727312AbgLSTpd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 19 Dec 2020 14:45:33 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608407093;
        bh=7K8eUGnj2uMOFSrmvgYHs3AI2vLv/y/cha7daax2KpU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=K+2otkQMRCYLZbq4HXhkeb1Y4mZZBqftLy90BZZiRdLe0R3TbsrIlWMAJSswUnsv1
         kYYyvTFsxJzzliwaD1gcvgdclTdjytteel4tRwOy5uppi2DI7bSlXVxjhpMCnBVopP
         GgQI/961K/PW5oijEGBp0B/dZZT+kNdahTMdkhynxbeprenClfhhL5LCHwbg8f5EjP
         +DO2PFQNREGk7UPkbd88qpfGt9uwRvlLKJWA4f2z16pCkd3FzfzQpmVsRzSxmPbYbH
         wEieDYfQoL9UOhpQy6EYpLVK8jREa5rTO0BgXGavy3Me3TWvCVJ+KouEqV3sUoHmmN
         APIqTUvwjDzPw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CH2PR04MB6522CB93958F090C1075A9CBE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-10-damien.lemoal@wdc.com> <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com> <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com> <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com> <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com> <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com> <CH2PR04MB6522CB93958F090C1075A9CBE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
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
Date:   Sat, 19 Dec 2020 11:44:52 -0800
Message-ID: <160840709202.1580929.729105789064274741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-17 02:54:14)
>=20
> One more thing: to avoid dt-binding checks error for this patch, can you =
also
> take patch 8 that adds "canaan" as a vendor name ?
>=20

Sure.
