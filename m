Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC459E9881
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 09:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfJ3IxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 04:53:15 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:7319 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfJ3IxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 04:53:15 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: cI+a4Vq/q5z7vdc74fDOKro/iJQP/AVCXSmzsTcb1alrbT5d75PBB5UIyhnOScb+Fs1uPHNX6e
 8aGqe9kmE4x20O+5eBwGsnAfT8zIx7lVKQ5/3/2YhdSBGdG5Akc+HSnovvC+YzuUnnYc3wMnDQ
 Fnvbfk4QT5wK0wZRAqTV3eBtwuv4pfAZLqc92ENP5e1mV2kB9uwo/j15g/ijk05lrHzf8ZrWQ4
 lNbuHZ1ItAFaHG036TBKt9O2T/oFH3ve36HXnVZS4531+IxBu55o5oNon1b3pnvJwoQh8Oeacy
 mQU=
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="52107702"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Oct 2019 01:53:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 30 Oct 2019 01:53:06 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 01:53:06 -0700
Date:   Wed, 30 Oct 2019 09:53:05 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Rob Herring <robh@kernel.org>
CC:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linus.walleij@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] pinctrl: at91: Enable slewrate by default on SAM9X60
Message-ID: <20191030085305.uwrt5g3mmbwthwms@M43218.corp.atmel.com>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com
References: <20191024172234.5267-1-codrin.ciubotariu@microchip.com>
 <20191029213757.GA8829@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191029213757.GA8829@bogus>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 29, 2019 at 04:37:57PM -0500, Rob Herring wrote:
> On Thu, Oct 24, 2019 at 08:22:34PM +0300, Codrin Ciubotariu wrote:
> > On SAM9X60, slewrate should be enabled on pins with a switching frequency
> > below 50Mhz. Since most of our pins do not exceed this value, we enable
> > slewrate by default. Pins with a switching value that exceeds 50Mhz will
> > have to explicitly disable slewrate.
> > 
> > Suggested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> > ---
> >  drivers/pinctrl/pinctrl-at91.c     | 4 ++--
> >  include/dt-bindings/pinctrl/at91.h | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> > index 117075b5798f..c135149e84e9 100644
> > --- a/drivers/pinctrl/pinctrl-at91.c
> > +++ b/drivers/pinctrl/pinctrl-at91.c
> > @@ -85,8 +85,8 @@ enum drive_strength_bit {
> >  					 DRIVE_STRENGTH_SHIFT)
> >  
> >  enum slewrate_bit {
> > -	SLEWRATE_BIT_DIS,
> >  	SLEWRATE_BIT_ENA,
> > +	SLEWRATE_BIT_DIS,
> >  };
> >  
> >  #define SLEWRATE_BIT_MSK(name)		(SLEWRATE_BIT_##name << SLEWRATE_SHIFT)
> > @@ -669,7 +669,7 @@ static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
> >  {
> >  	unsigned int tmp;
> >  
> > -	if (setting < SLEWRATE_BIT_DIS || setting > SLEWRATE_BIT_ENA)
> > +	if (setting < SLEWRATE_BIT_ENA || setting > SLEWRATE_BIT_DIS)
> >  		return;
> >  
> >  	tmp = readl_relaxed(pio + SAM9X60_PIO_SLEWR);
> > diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> > index 3831f91fb3ba..e8e117306b1b 100644
> > --- a/include/dt-bindings/pinctrl/at91.h
> > +++ b/include/dt-bindings/pinctrl/at91.h
> > @@ -27,8 +27,8 @@
> >  #define AT91_PINCTRL_DRIVE_STRENGTH_MED			(0x2 << 5)
> >  #define AT91_PINCTRL_DRIVE_STRENGTH_HI			(0x3 << 5)
> >  
> > -#define AT91_PINCTRL_SLEWRATE_DIS	(0x0 << 9)
> > -#define AT91_PINCTRL_SLEWRATE_ENA	(0x1 << 9)
> > +#define AT91_PINCTRL_SLEWRATE_ENA	(0x0 << 9)
> > +#define AT91_PINCTRL_SLEWRATE_DIS	(0x1 << 9)
> 
> This is an ABI. You can't just change the definition.

There is no DT using these definitions. They have been introduced for our new
SoC but its DT is not submitted yet. I assume it's not too late to do this
change as nothing will be broken.

Regards

Ludovic

> 
> Rob
