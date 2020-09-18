Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FFC26FFAA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 16:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgIROTW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 10:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgIROTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 10:19:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033DBC0613CE;
        Fri, 18 Sep 2020 07:19:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC382D7;
        Fri, 18 Sep 2020 16:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600438758;
        bh=fIZGQZZYM2FyHIfA+1pya2D9PN88lhv1BbBbmjKpOQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E/ZvmkqbpHcJAzSJWAcR9DD4mJds6aQ4ZFQLl81hgVUiAjz1lfibYnZHTp00xOuII
         mcjifMkOztY3aI9rZ53HCbQjoKLmJZelTc6VG1oDpdrdIMGDhNOqDxzZ/QnX7EXqLb
         tevVCNbQW2u28SmRYp6swCcNwEWZ9cVPc2mEccA8=
Date:   Fri, 18 Sep 2020 17:18:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        - <patches@opensource.cirrus.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Teng <andy.teng@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
        alsa-devel@alsa-project.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200918141847.GE28436@pendragon.ideasonboard.com>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <20200917200936.GF3969@pendragon.ideasonboard.com>
 <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Fri, Sep 18, 2020 at 09:52:57AM +0200, Krzysztof Kozlowski wrote:
> On Thu, 17 Sep 2020 at 22:10, Laurent Pinchart wrote:
> > On Thu, Sep 17, 2020 at 06:52:49PM +0200, Krzysztof Kozlowski wrote:
> > > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > > controllers.
> >
> > How about deleting the part that has been converted from gpio.txt ?
> 
> I did not move everything from the gpio.txt and it is really nicely
> explained there. I think to leave it as it works as a overview/guide
> better than YAML.

I'm just a bit worried that duplicating some of the information in two
places will lead to them becoming out of sync, but maybe the risk isn't
that high.

> > > The schema enforces proper naming of GPIO controller nodes and GPIO
> > > hogs.
> > >
> > > The schema should be included by specific GPIO controllers bindings.
> >
> > Instead of including it manually, could we use a conditional select: to
> > apply the schema automatically when a gpio-controller property is
> > present ?
> 
> You mean the same way as generic schema for GPIO controllers work?
> This could be done but the point is to enforce the GPIO controller
> bindings in GPIO controllers, so also in cases when someone forgets to
> add "gpio-controller" property. Although, if given GPIO controller
> schema requires "gpio-controller" then indeed select would work...

You could just make gpio-controller mandatory in the schema, and get
everything else automatically selected based on that, without needing a
manual $ref.

-- 
Regards,

Laurent Pinchart
