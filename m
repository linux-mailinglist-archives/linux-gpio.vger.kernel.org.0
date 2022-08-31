Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B8F5A811A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 17:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiHaPWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 11:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiHaPWD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 11:22:03 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9CBD7CD1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 08:22:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id cu2so29156861ejb.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0m2oIrh3yC54EVrEreYhwyL8Y0H01nobfjjxW5+cUuQ=;
        b=iEU4jQPxCh9h74E1oy7W/RnSqz6NrFyB4kz2wdNtI5vIms8D1qzDa4qnrwBP0/Eut4
         YKSg7v7Y0cBIda4ecZ4Iuc9Rwvnp+rkpUQ6kPcEf29mPtaPyZRyQ674x6vz4E63lmV1o
         veiyVTfxUJRFoEHQaB5tFrXqsM0yOipdS+3APNjp0AwAGKSSwERtLpJ8Qwm+ASpyKIF5
         c8q2n2MEVDRgn25cFcB2y76e1Mm0omUBogee3u3/jqchmjRQxQNmdyjrpdLK4wkLx+Kc
         jYeVb2Vz52l+BdwGfa99tqTokcNfmP8U/kRQ0wa/uly9JzaCpk8zGOlTBHO2iC3fVqcw
         0KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0m2oIrh3yC54EVrEreYhwyL8Y0H01nobfjjxW5+cUuQ=;
        b=x8lYMzLrH4VwuCE62l2Z2fY0f0YZiFetWQcUhCI944fijrd90jwJax3Kmaro29nvTe
         M1N0qHevjjmR6oR2ESXNd7UKF7/onSObacY2byHXmn+ipcmWBHe2HQ1v97QoffUWNhdU
         Nsak4OENUok/OlI0At5rN/LSsnQZHetZRijKgG4fkMweDx6iAX/Ap7/oaj2nX/ztAPcI
         8MMTRUESqiwZOp1aLkap6of72qc0FCmXi2qHfgs/t12V58LC3JW0754ZeCAT6JNdvGhV
         aCAmWmkrTkLC/rTxFRpHyPLGhOPtB63M8J4G57ehkaU2Pd3pwt/+WDnrICn2gfJyp7ZW
         mpew==
X-Gm-Message-State: ACgBeo1R6V7aDWGMsh02se5kEXhwSbdhAd1wwBAyS7FRiF5CD0LtxlMp
        Fg0csWAgjZDqmZUCmsJ0/R6fpgrQ1XoJZvEY4+0JiA==
X-Google-Smtp-Source: AA6agR5ZjxPhq9omwkeZ964yAKfueyM1Pu3izd4L2oHudKgS1F1HUqt6oIYsKxfvM4MYcRKvum7eKyobKlpXMPSa+Uw=
X-Received: by 2002:a17:907:7394:b0:73a:d077:9ba1 with SMTP id
 er20-20020a170907739400b0073ad0779ba1mr19882150ejc.697.1661959320475; Wed, 31
 Aug 2022 08:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
In-Reply-To: <20220812133012.7283-1-shenwei.wang@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 17:21:49 +0200
Message-ID: <CAMRc=Mem-sH=wi0DryMqyybKHbKtHu1vEkmZM-2VQE_qCDEiyA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add IMX8 SCU GPIO support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 12, 2022 at 3:30 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> The system controller (SCU) is the central unit to manage the resources
> on i.MX8 platforms. The SCU firmware provides a set of APIs to access
> the GPIO PINs on the SCU domain.
>
> This patch series implements the standard GPIO driver over the SCU
> firmware APIs, so that the GPIOs on the SCU domain could be accessed
> like a local GPIO PINs.
>
> Changes in V5:
>  - rename the file name from fsl,imx-sc-gpio to fsl,imx8qxp-sc-gpio
>    to match the compatible string
>
> Changes in V4:
>  - remove the generic compatible of "fsl,imx-sc-gpio"
>  - update the gpio $ref in "fsl,scu.yaml" as the file name is changed
>  - update the commit comment for 0003 because the driver is moved to the
>    directory of "drivers/gpio"
>
> Changes in V3:
>  - follow the other imx8 SCU binding rule and rename the compatible string
>    from fsl,imx8-scu-gpio to fsl,imx8qxp-sc-gpio
>  - rename the doc file from fsl,imx8-scu-gpio.yaml to fsl,imx-sc-gpio.yaml
>
> Changes in V2:
>  - move the driver into the gpio directory per Krzysztof's feedback
>  - change the subnode description in file fsl,scu.yaml
>  - fix the dt_binding_check error
>
> Shenwei Wang (3):
>   dt-bindings: gpio: Add imx scu gpio driver bindings
>   dt-bindings: firmware: imx: Add imx-scu gpio node
>   gpio: imx-scu: add imx-scu GPIO driver
>
>  .../devicetree/bindings/firmware/fsl,scu.yaml |   5 +
>  .../bindings/gpio/fsl,imx8qxp-sc-gpio.yaml    |  39 +++++
>  drivers/gpio/Kconfig                          |   4 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-scu.c                   | 139 ++++++++++++++++++
>  5 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,imx8qxp-sc-gpio.yaml
>  create mode 100644 drivers/gpio/gpio-imx-scu.c
>
> --
> 2.25.1
>

Applied the series, thanks!

Bart
