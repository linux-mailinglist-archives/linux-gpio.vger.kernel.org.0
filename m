Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D24426F7F7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 10:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIRITn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 04:19:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgIRITm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Sep 2020 04:19:42 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7788121D20;
        Fri, 18 Sep 2020 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600417181;
        bh=BJGVXo9LuBYkG/UJ83GT4URHLbNRNG+Zxm/NJ71KpQM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EJFz3tnFnXVUibC3YjJ/aDnX9vkiw9iq4EOtKW9AY1UzHJjf1IKzyYfw1N2p1QO8m
         P6M8ES8lJXTghi6n/cG7hjYZ3GeO1N7Fc/cTU7jR211u/HsFoqwjlmyBMdPFS3JgdU
         2ERcli34bBFhjIO+FPo08NLHVYa3E8zGl3lcg3RA=
Received: by mail-wr1-f45.google.com with SMTP id t10so4702422wrv.1;
        Fri, 18 Sep 2020 01:19:41 -0700 (PDT)
X-Gm-Message-State: AOAM5316qZap81LiF3C5fHOFDBXKQVafkq/HmSAVfuaWsTE/G+89jpzb
        FZPaQv6FmMXI3dfhJ+u80SFuLBZHIZ+LyMMUNbE=
X-Google-Smtp-Source: ABdhPJxjVFR3dSbIHpxy/vgZ/bWImIgEGLUaIDHRxTPfiF/dL+umHl5OoO3hY+yZN6dZjAPUxX/KLimMiPWxT50m8Xg=
X-Received: by 2002:a17:907:724f:: with SMTP id ds15mr33866016ejc.119.1600417177168;
 Fri, 18 Sep 2020 01:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200917165301.23100-1-krzk@kernel.org> <20200917165301.23100-10-krzk@kernel.org>
 <20200917201204.GG3969@pendragon.ideasonboard.com>
In-Reply-To: <20200917201204.GG3969@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 18 Sep 2020 10:19:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdB0mxQ8+UhCGU6B2DS_9DCDc=i9cFmdr8avKqQcLi3GQ@mail.gmail.com>
Message-ID: <CAJKOXPdB0mxQ8+UhCGU6B2DS_9DCDc=i9cFmdr8avKqQcLi3GQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] dt-bindings: pinctrl: include common schema in
 GPIO controllers
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
        Jaroslav Kysela <perex@perex.cz>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Sep 2020 at 22:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Krzysztof,
>
> Thank you for the patch.
>
> On Thu, Sep 17, 2020 at 06:52:57PM +0200, Krzysztof Kozlowski wrote:
> > Include the common GPIO schema in GPIO controllers to be sure all common
> > properties are properly validated.
>
> Shouldn't we delete the properties that are now redundant from these
> schemas ?

Good point. However not with "additionalPropeties: false". Schema
requires all properties to be mentioned. I would need to use
"unevaluatedProperties: false" in each file.

What is preferred?

Best regards,
Krzysztof
