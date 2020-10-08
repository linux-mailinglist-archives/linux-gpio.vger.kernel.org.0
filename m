Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A29286C8F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 04:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgJHCAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 22:00:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgJHCAK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 22:00:10 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 106A5207C3;
        Thu,  8 Oct 2020 02:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602122410;
        bh=wyBO4zvjEjDcbx6nOHG1RJNNWIaPg0x7TNYULJRlR6Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lojukMi8qd73ZjRWlJfe4shDOCavAlS2irrvtYg9a7bFgxx0405b5a+p0BNBiIyPG
         23BFJG6rabPwBbMOCSgfPq2NI9wiSvs5JtYuoeQYH0RT925UM9P9P8WV/OoPtwEvc4
         UQNgGBK9QBtOkvUDfWr1oyopSAuTbflq2dgX0sdU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601719607.774.1.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com> <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com> <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Loda Chou <loda.chou@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Oct 2020 19:00:08 -0700
Message-ID: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Hanks Chen (2020-10-03 03:06:47)
> Hi Michael & Stephen,
>=20
> Please kindly let me know your comments about this patch.
> Thanks
>=20

What's the base for this patch? I tried applying to v5.9-rc1 and it
didn't work.
