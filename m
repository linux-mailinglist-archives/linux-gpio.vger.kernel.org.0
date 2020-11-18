Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4602B864E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 22:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgKRVKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 16:10:38 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:26751 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbgKRVKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 16:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605733838; x=1637269838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jq/eRjn0obi2uv5Dl0AS2noEMEJK9gbeIkY5UoNCpN8=;
  b=kbpdlJmCzC4GDEAwVieTmYDumxjwRqcuKzjWkbcTO859LiMLd5TnWJ2r
   25k7UyjeDzGuK7pP420tTio8W7U/s+Q/nA/I+KvgHh0I72IKUUdfw442D
   qQk+l1dO7qztMzG098Mt2LfeAhsKe4qIbWvaODNQmrcljR+ZanqalRaze
   pAxk20Td2YM7tszzFHxrTFdo08FSgSUoZtdA6csCCG1Q9gHwr0oI5mvTh
   GJRIvNQTcvToqmBzdrfYdCqsay23LNS0TPJgQkdtwRl6sRxUlzqlmTi5V
   7LvNlb1WPW9qqC6boYAxH3+pr29g8HF8Lr+QyilzChBsT+3XGZyfDvu1A
   Q==;
IronPort-SDR: 3UR5JNkMD9WDanNxM0NBtX9t15G95UXDp9NLTq9fAdrKKZgWWp/491k1x+pFqjw2QKHMPpoIMI
 D3/NkG5t/2aPunI3sKHa51eI8ezS4CfTvc7dovDU8za3qTlZ74jXIwKdJd8ACDcaoEMAhcfrKl
 IQdTBPLcsRFeQXWH7TejPUdryh3MW9DTSD28WAHNTIFACZLgaGz2LM/l0ZOPe3Wj5WfFXibaKP
 gtLBgeEEntJ2j62rQXgHmEQ2dNtpr9brkGZnwvruOATw+o0WFqcL9N27Mg/M2tvQnOCKm6cjOe
 Rr0=
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="98979099"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2020 14:10:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 18 Nov 2020 14:10:37 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 18 Nov 2020 14:10:36 -0700
Date:   Wed, 18 Nov 2020 22:10:36 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
        <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: at91: add pincontrol node for USB Host
Message-ID: <20201118210530.2liwy4sywichojry@sekiro>
References: <20201118120019.1257580-1-cristian.birsan@microchip.com>
 <20201118150336.g3u3ljuhrbrn2cko@sekiro>
 <20201118152652.GA11581@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201118152652.GA11581@piout.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 04:26:52PM +0100, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello,
> 
> On 18/11/2020 16:03:36+0100, Ludovic Desroches wrote:
> > At first glance, there is no trivial way to register the pin range in the
> > pinctrl-at91 driver. There is one driver for the pinctrl and one for the gpio.
> > I am open to suggestions to fix it in the pinctrl-at91 driver as well if there
> > is an elegant way (I have some in mind, but there are not) without having to
> > refactor the driver.
> >
> 
> But shouldn't that driver be refactored at some point anyway? I know you
> are moving away with new SoCs but it causes real issues. For example,
> gpio hogs are not working, this is impacting some of your customers.
>

I agree, maintainance of this driver is difficult because of its design.
Unfortunately, I doubt being able to hadnle a refactoring of this driver in a
near future.

> The other thing is the weird probe order preventing a nice cleanup of
> the platform code.

True. IMO, having gpio controlers probed before pinctrl is one of the reason
which prevents a trivial fix.

Regards

Ludovic

> 
> 
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
