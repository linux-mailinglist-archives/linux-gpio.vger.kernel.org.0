Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67C326F774
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 09:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgIRHxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 03:53:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbgIRHxP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Sep 2020 03:53:15 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06430235FC;
        Fri, 18 Sep 2020 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600415594;
        bh=zR4pC32CsRwkRMcQjTnnCp339wA8YZYmTzvhc8Ku3wQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cZJCNtkfkHA0r0FeMIAWY7D+QPapfLaH15sFE1WNYM4PKyUdb33JlOgilSdSSTwM4
         xGabXi2sfwLjYfFwquhkvjT02UVDctUBVqx+oQlovxOMWqP6oSQxOmeXlwiNQh93Do
         /Vu58+Vdi5m6dZbWmFufI2IgJXtwo+Id3LfJFLZc=
Received: by mail-ej1-f49.google.com with SMTP id lo4so6816003ejb.8;
        Fri, 18 Sep 2020 00:53:13 -0700 (PDT)
X-Gm-Message-State: AOAM5322x9vk1MhUHFVQGQWeaMtCYoBkJFKPRbrvliNpWhinsBqGAiVC
        iw55FPvy/pQrybbdppR2VvjMxfww1o4jgfX5YsE=
X-Google-Smtp-Source: ABdhPJz4h58zSa29o5A1o7MhoFoews9vi+zWZmYhOt2gWbPt5yeBvYS4l1uut8tLvrHP24ftCZlb9SA8h3ZMk81xBpI=
X-Received: by 2002:a17:906:5008:: with SMTP id s8mr36525529ejj.408.1600415590292;
 Fri, 18 Sep 2020 00:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200917165301.23100-1-krzk@kernel.org> <20200917165301.23100-2-krzk@kernel.org>
 <20200917200936.GF3969@pendragon.ideasonboard.com>
In-Reply-To: <20200917200936.GF3969@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 18 Sep 2020 09:52:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
Message-ID: <CAJKOXPc=o0vtU0VKE5b5Ro3nF=ra-p7UnbFfjj_++onw8MeSKQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO controllers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Sep 2020 at 22:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Krzysztof,
>
> Thank you for the patch.
>
> On Thu, Sep 17, 2020 at 06:52:49PM +0200, Krzysztof Kozlowski wrote:
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.
>
> How about deleting the part that has been converted from gpio.txt ?

I did not move everything from the gpio.txt and it is really nicely
explained there. I think to leave it as it works as a overview/guide
better than YAML.

>
> > The schema enforces proper naming of GPIO controller nodes and GPIO
> > hogs.
> >
> > The schema should be included by specific GPIO controllers bindings.
>
> Instead of including it manually, could we use a conditional select: to
> apply the schema automatically when a gpio-controller property is
> present ?

You mean the same way as generic schema for GPIO controllers work?
This could be done but the point is to enforce the GPIO controller
bindings in GPIO controllers, so also in cases when someone forgets to
add "gpio-controller" property. Although, if given GPIO controller
schema requires "gpio-controller" then indeed select would work...

Best regards,
Krzysztof
