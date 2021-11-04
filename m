Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7697F444CCC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 02:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhKDBIL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 21:08:11 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:38437 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhKDBIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 21:08:10 -0400
Received: by mail-oi1-f182.google.com with SMTP id d12so3132664oij.5;
        Wed, 03 Nov 2021 18:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mGavWcXNjdvsaFGjH3yLVdsxiECxJZKPSKveuDvmokQ=;
        b=Nub1mM4IxnZs0x6UJyUMt6AXK0V9WY5zfpBpVFCirPnuiSzl2RprAOlgDd56c3JSca
         efT7Jz2oUSwa7sBxBDPCRkQCSWsi/LBeF1pkAhBSvKA9+1SlV3jAO33LHHMg+p6vx4DP
         cmCMahLIZCE0pNPmqpiRBBQOEZdKwvksMVQXv191H6xl2r02zOzuGV58XAxQFLcwb/VL
         Cs2gUrJ6ADRGW7HbmH3HAdJYkeZOvl7EAwen0tvP5VHrkB/dnYdOJOeewrY3ZCHF0AuH
         mO8221N5GiyYxf6EkRWB6nTDLtWe7Qab8dR8Ew6aXKybPJvXoR4zsMWZCcG+0BGp+6CO
         V37g==
X-Gm-Message-State: AOAM530cM9E/pGAf+48GzU+DsQ5MojUBTUWu4BPQgj9kKTJiiDL4pxU3
        ns9jcxcnJ8IwQG1T3q3FFA==
X-Google-Smtp-Source: ABdhPJwcF6k+uaPsW687lTM1lrQbGJ72CwyhOXZbDNl0jW49yDGyFkCfZIMrsqrxXE6V9BAJwSV6Qw==
X-Received: by 2002:a54:4e97:: with SMTP id c23mr13542906oiy.153.1635987933167;
        Wed, 03 Nov 2021 18:05:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z12sm247106oid.45.2021.11.03.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 18:05:32 -0700 (PDT)
Received: (nullmailer pid 2115444 invoked by uid 1000);
        Thu, 04 Nov 2021 01:05:31 -0000
Date:   Wed, 3 Nov 2021 20:05:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Message-ID: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
 <20211102233017.bvZyNHgwkuFX2SrymY1886iySuCFjH3IP1hlSc3HduY@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102233017.bvZyNHgwkuFX2SrymY1886iySuCFjH3IP1hlSc3HduY@z>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 03, 2021 at 12:30:17AM +0100, Giulio Benetti wrote:
> Hi Fabio, Jesse, All,
> 
> On 11/3/21 12:25 AM, Jesse Taube wrote:
> > 
> > 
> > On 11/2/21 19:17, Fabio Estevam wrote:
> > > On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> > > 
> > > >    static struct esdhc_soc_data usdhc_imx8qxp_data = {
> > > >           .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> > > > @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
> > > >           { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
> > > >           { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
> > > >           { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> > > > +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
> > > 
> > > I thought Rob suggested to use the SoC name, so this would be:
> > > 
> > Uh i think that may have been for the UART.
> > > { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
> > > 
> > > The same applies to the other bindings in the series.
> > > 
> > > This way it would be possible to differentiate between future
> > > supported i.MX RT devices.
> > > 
> > This makes sense will do in V3.
> > 
> 
> If we add every SoC we will end up having a long list for every device
> driver. At the moment it would be 7 parts:
> 1) imxrt1020
> 2) imxrt1024
> .
> .
> .
> 7) imxrt1170

You don't need a driver update if you use a fallback. When you add 
the 2nd chip, if you think it is 'the same', then you do:

compatible = "fsl,imxrt1024-usdhc", "fsl,imxrt1050-usdhc";

That requires no driver update until the driver needs to handle some 
difference. And when there is a difference, you don't need a DT update.

You could make "fsl,imxrt-usdhc" the fallback from the start if you are 
adverse to the first way.

Rob
