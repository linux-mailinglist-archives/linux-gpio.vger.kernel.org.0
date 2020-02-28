Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7268F17374E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 13:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgB1Mjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 07:39:52 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:61249 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1Mjw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 07:39:52 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: CmTboWtx5gdf1rZKZ4Z34EE+eP06E01r9yI6xLPQL9PdnB6KJJA631PV1floXrxOSjsRYSvuNf
 +sM89EjCfI1HvfSa0h5Rm3e/2tZGclRip92ymIRyToHCz+8vjNdBs+H/c9OxxVoRS0H42Yrh4U
 +YdRFj7jRPL/v3M3zlKifMEJFtyr79zMK6FMBXafhHOvdy9XZvSLyeK3IOqb5ijXMRrgT1LeE0
 EDRWu+1SvMfP+jp2nYiOgcaQKW7rVKs72U/W4GGfQWBNwe2z7f6YkbiFvVDxVPkGOm4W2q5Lc1
 iE0=
X-IronPort-AV: E=Sophos;i="5.70,496,1574146800"; 
   d="scan'208";a="68335100"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2020 05:39:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Feb 2020 05:40:04 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 28 Feb 2020 05:40:04 -0700
Date:   Fri, 28 Feb 2020 13:39:10 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Romain Izard <romain.izard.pro@gmail.com>
CC:     Linux GPIO List <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: GPIOs not correctly exported via sysfs on ATSAMA5D2
Message-ID: <20200228123910.hbf2bnk3w2dbishr@M43218.corp.atmel.com>
Mail-Followup-To: Romain Izard <romain.izard.pro@gmail.com>,
        Linux GPIO List <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Romain,

On Fri, Feb 28, 2020 at 11:58:21AM +0100, Romain Izard wrote:
> 
> Hello,
> 
> While experimenting with a new chip, I connected it on the SDIO
> interface on my board based on a SAMA5D2 SoC. For a first step, I need
> to drive the pins on the SDIO bus at a given level to program this new
> chip. To do so, I tried to control the GPIO lines manually by unbinding
> the SDHCI controller, and using /sys/class/gpio/export to control the
> pins, with the following code:
> 
> echo a0000000.sdio-host > /sys/bus/platform/drivers/sdhci-at91/unbind
> echo 4 > /sys/class/gpio/export
> echo low > /sys/class/gpio/PA4/direction
> 
> Unfortunately, the state of the pin does not change and it remains
> driven to 1. I checked the configuration register with devmem2, and it
> appeared that the selected function remains the SDIO function even after
> calling export.
> 
> The issue does not appear when I use a GPIO in a driver with an explicit
> pinctrl configuration in the device tree, which explains why I did not
> see it until now.
> 
> The kernel version used is Linux 5.4.22
> 
> Is this a user error from my part, or is there something missing in the
> AT91 PIO4 pinctrl driver ?

This is a known issue.

The AT91 PIO4 pinctrl driver doesn't implement gpio_request_enable()
contrary to the AT91 PIO pinctrl driver. If we implement it, then you
would be able to change the pin muxing and configuration from the sysfs.
The issue is nothing prevent you do this and so to possibly break a
device.

There is the strict pinmux_ops property which prevents from this
situation. The side effect is that we must not declare a pinmux/conf for
a GPIO so all the DT files have to been updated. That's not a big deal,
the problem is, at that time, the GPIO subsystem didn't allow to set the
bias for instance. It may have changed but not sure it covers all the
possible configurations we have from the pinmuxing subsystem.

Regards

Ludovic

> 
> Best regards,
> --
> Romain Izard
