Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D4239748
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731139AbfFGVEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:04:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40752 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731127AbfFGVEf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:04:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so2898689ljh.7
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vkU0CLA4zd7U+4w/MeYB7MsnfkDi0Po4BQ8jWMFBUjo=;
        b=Bl3VdEFDNRcw68lQN2+iAhPiWw5DQMPXg2SfOdO0jMkLGnBZ+uzq2sVjmQ4vaHAbG4
         yNaYAP/1r/yIlm+Vay8Wsve+dfOIcTk28G0cVRmtAwbrROgC3Dyj8uSlyUDJNpKeM1wL
         EBMTqw5WMOWJKdh3wSd10dvEDiZK+z1gGAbKjQrBjE6N7MCrUY9X5KM/bZYvdjcRZ424
         gdJXbrG19WOm+xi1E8pcpR2k4g5NwCTXuPQO1pXeFt8zefmVKfKGIXKgKIHsdyV+XrUH
         AIsp1mw/e21lcxOHA2q/t59+syFLF30vm0Vl1BbVgLnQG/sILfmw0yuI/keT7LFF3F9f
         Ghqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vkU0CLA4zd7U+4w/MeYB7MsnfkDi0Po4BQ8jWMFBUjo=;
        b=ovW1uFTIstJ/csYAwP/sp6rxPr9cDqbhWMiOrzTwiS7udWguTAJt4tdA8nffg0GDbI
         H15JYqTmU4PgvX9DrDxJf9nRIZqXTaYgCfT5ZQPwMPn/IE1bboLPUs9MScVmcQpOMjeY
         urkIhtjaYK+jLV0DBsx3vdNSCXeGCEtkFaTJlDgd1MHM6awmDQhuuGBcZU4HJ4LfEvUp
         cZY3tPBGDJ6VhRZMz410v4Vbto5mARqkBi9d4ztvv3n1/vHDVoNaIlwj7n6jWRVamW5r
         HCjRaLzfYfAQcTi+FhHB6Ya5s40SH8sDk5xHSBwpZ3UcxpEUAy2wOvAq7pBVhWamYs/3
         wenQ==
X-Gm-Message-State: APjAAAUmMgGuhlSaqHDAg4s8IjnQaL1PyNnvZuGGfepv3onMD4Kpv/6g
        e9h6kuhZjfnHIC48awVL5/QthknrGo7fcJBAU2iIhw==
X-Google-Smtp-Source: APXvYqyCQqq/sYVcHyrozCmhdkems9DE56UaaALAZIcDJuvLRmL+KVL12nZblAfJci6jVwnq/iR/eVswn8WPsSelqws=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr19782540lje.46.1559941473627;
 Fri, 07 Jun 2019 14:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
In-Reply-To: <20190530030546.9224-1-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:04:25 +0200
Message-ID: <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 30, 2019 at 5:04 AM <Anson.Huang@nxp.com> wrote:

> From: Anson Huang <Anson.Huang@nxp.com>
>
> Add binding doc for i.MX8MN pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Looks mostly OK to me, but I'd like the maintainers to review,
so Dong et al please look at this!

> +Required properties:
> +- compatible: "fsl,imx8mn-iomuxc"

So should this not be "nxp,imx8mn-iomuxc"
or "nxp,freescale-imx8mn-iomuxc" or something these
days? The vendor name is nxp is it not.

I was complaining to the DT maintainers at one point that
these companies seem to buy each other left and right
so this vendor nomenclature is dubious, but I guess at least
it should reflect the vendor that produced the chip or something.

If everyone is happy with "fsl,*" I will not complain though.
(i.e. if the maintainers ACK it.)

Yours,
Linus Walleij
