Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43B1B85968
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 06:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHHEnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 00:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHHEnX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 00:43:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30FC0217D7;
        Thu,  8 Aug 2019 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565239402;
        bh=epeHa/FiHLUJX+Won1KcmqufCoWzRRNhnCbnjs+xtOE=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=Kc4ZDf1JK1gy2Li/0XaN/PMxsQBAC2yqwdZULhUg9zLN0rTqC7NgtlhrIJMBkquFc
         iK9xz36G2sSfMlUOCD935ehbb+Qn7/5j+eZGn5LG9vtuPOa1/KhSmBlDP+HFZae1BC
         orQ+lrzDQ69ksPmQpDlQAzkk325NAKjV5BniViIU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-8-narmstrong@baylibre.com> <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dbasehore@chromium.org
Subject: Re: [RFC/RFT v3 07/14] clk: meson: g12a: add notifiers to handle cpu clock change
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:43:21 -0700
Message-Id: <20190808044322.30FC0217D7@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Martin Blumenstingl (2019-07-02 16:28:55)
> Hi Stephen, Hi Neil,
>=20
> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> =
wrote:
> >
> > In order to implement clock switching for the CLKID_CPU_CLK and
> > CLKID_CPUB_CLK, notifiers are added on specific points of the
> > clock tree :
> >
> > cpu_clk / cpub_clk
> > |   \- cpu_clk_dyn
> > |      |  \- cpu_clk_premux0
> > |      |        |- cpu_clk_postmux0
> > |      |        |    |- cpu_clk_dyn0_div
> > |      |        |    \- xtal/fclk_div2/fclk_div3
> > |      |        \- xtal/fclk_div2/fclk_div3
> > |      \- cpu_clk_premux1
> > |            |- cpu_clk_postmux1
> > |            |    |- cpu_clk_dyn1_div
> > |            |    \- xtal/fclk_div2/fclk_div3
> > |            \- xtal/fclk_div2/fclk_div3
> > \ sys_pll / sys1_pll
> >
> > This for each cluster, a single one for G12A, two for G12B.
> >
> > Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_RE=
PARENT,
> > to be used as "parking" clock in a safe clock frequency.
> it seems that this is one case where the "coordinated clocks" feature
> would come handy: [0]
> Stephen, do you know if those patches stopped in March or if there's
> still some ongoing effort to get them ready?
>=20

Derek told me yesterday he wants to work on it again, but I don't know
his timeline. If Derek doesn't reply here then maybe it can be picked up
by someone else.

