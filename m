Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B0A16533D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 00:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgBSX5D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 18:57:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:52090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726718AbgBSX5D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 18:57:03 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6749C206A5;
        Wed, 19 Feb 2020 23:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582156622;
        bh=1IW+yQwOQoK/ZE/qlAsbbc4XwXHuGcveuAoms/xk5dY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lCHRAKI9M7L12wHrBZ8MXGCU9Ueecj+GJJVICBRhdTihihtSzoKQ+dorDsMS8065t
         4yJYO4AmHlw7Zw20BJYYkhc4cH0wJuiNGAATeWdHGckhuZsychuFhiOhStetOYrolP
         NdwhtJaead2pHVH4yXQW2ptWcTUjk+Onv7lOz+p8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 19 Feb 2020 15:57:01 -0800
Message-ID: <158215662160.184098.12475377410437970578@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Leonard Crestez (2020-02-11 13:24:33)
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have sizeof "6" and "7".
>=20
> This produces many oopses with CONFIG_KASAN=3Dy:
>=20
>         BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0

Can you share the full kasan bug report instead of the single line?

>=20
> It shouldn't cause an issues in normal use because these structs are
> always allocated on the stack.

Is packed necessary for these? I thought that if the beginning of the
struct was naturally aligned and there was sometimes a byte or two at
the end then having __packed wasn't useful. So maybe it's better to just
drop __packed on all these structs and let the compiler decide it can
add some padding on the stack? Or do we have arrays of these structs
sitting in memory all next to each other and they need to be that way to
be sent through the mailbox?

>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> Reported-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
