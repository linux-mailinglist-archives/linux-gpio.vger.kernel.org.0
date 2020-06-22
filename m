Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74482030DD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbgFVHyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:54:21 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:45228 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgFVHyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592812460; x=1624348460;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=MmOrVI6xag5zI5id2G6sN9KnqWs1OFqBibVoZnsiqI4=;
  b=gLv6Z26WBwgctTX9EM/XjrQar0m3qVJnAOtUet3JBaNhIDvNsfBeeH84
   TSTDnIcw1uWpT0ZQHtLwexMF9r/tXE7YOTGG0ozFyj6LpPJL1fykPSz10
   Wmzp0B1w1AS7YiGCqAkXm+Utq/8CVdmNSxPj1kP/vofbMfksipv+ESRhl
   aoZPnc/tz4BlyJqBTv2r5iv96SC4peKkAiQLzMgzpob8NzsAtom27r8q3
   cqCrJECN8/C84EgSpdRJMHZ7sMDCkOLUBBcZEM+lPrAkRZ8v5Sd9iuMKO
   LACgR9IHVFvipj/v5XQEMLIOYIa09tHhDuO5HtkO7mMxPNwfX9rKHb2GF
   A==;
IronPort-SDR: uviGtuAC0yFKNGjCzU1nNdXKCv1JIyywNhcjNHt1jYuWmqd11nW6KCYOVSvoMHjyy6KLvvsd7T
 kP7PdQH8Hj6a5hyVbf5z/73Hk7FztHPga06w9xvRl5OMv53VdDOsSoMjBu8tvHJcEJ/+035bsF
 P1a1DPIE5tB7hQw7E6PQVEpp+WDb0UuvZrfaLHag7qgK8XbcqBO97bskPXEyA7zM5Y7O2NSL2I
 MAXf/TXTmO94IxGtj/tQqkGiitJYeqknTK+pGXjbkLjjDScTRC8tLvYVaoxsbdDMYuubbXSApu
 3OI=
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; 
   d="scan'208";a="80326237"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2020 00:54:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 22 Jun 2020 00:54:08 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 22 Jun 2020 00:54:05 -0700
References: <20200615133242.24911-1-lars.povlsen@microchip.com> <20200615133242.24911-6-lars.povlsen@microchip.com> <CACRpkdaWZeMCNuwUNzyYd+g9Q75F_8o7K1Npxr46V+-Y4z-6wA@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 05/10] pinctrl: ocelot: Add Sparx5 SoC support
In-Reply-To: <CACRpkdaWZeMCNuwUNzyYd+g9Q75F_8o7K1Npxr46V+-Y4z-6wA@mail.gmail.com>
Date:   Mon, 22 Jun 2020 09:54:09 +0200
Message-ID: <87k0zzy1r2.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Mon, Jun 15, 2020 at 3:33 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This add support for Sparx5 pinctrl, using the ocelot drives as
>> basis. It adds pinconfig support as well, as supported by the
>> platform.
>>
>> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>
> Is it fine if I just apply this driver to the pinctrl tree?
> Otherwise Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Hi Linus!

Yes it would be fine with me for sure...

Thank you very much.

---Lars

>
> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
