Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9C122AC2E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 12:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbgGWKJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 06:09:06 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:19593 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgGWKJF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 06:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595498945; x=1627034945;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=Ke9E7JJ3zQ2XCPvF/ZiJvhJqLTFeRFCsv/7IuKKbagQ=;
  b=V7NOUmd9VpHnjDvoasUeywKtXuDf4kzyNVEsZxoXFFjbkJcF94vmgjhX
   db/Nn0tMurhj679SmlyPoi8BSluHZP3azKLfUHeTkGFVY055h/d/xD/j4
   3N5FRvpIokdUycmzZnJFHiszWdEBQN6777cM6sUEYDM5jO/fG6bCgDs93
   JG06E76+SOyPLuEEagEvkzRcPafnnqpBDOZqFL2FsEvnvfhAN1bafI2XU
   5z3/v2BH45QD2WqpWzsIIOIKVQi6tv9oj8wNvPCupqGMkOiTGUx464dxa
   jbylbgF8taTBhIdGPxV53DIItXj7Pj5N1bb4cD3mUe4/5O+iwZA/IpoLz
   Q==;
IronPort-SDR: ILYu3poOG836t6YdFhhy7gRwahSmw/PjhZTTy1y+ww68TrIdV3l/q3YZ1OYi6dpKEY6kFS3qYS
 HR+d2nKC7+zdK4+OpGOh/rBjwf947+pHLSxvKcD87AN7UTz3Yt8tO4irhrCCMLZAUFEnzq/oIE
 Ng+bTkCoXaB2d6sxUGWepoGjGiK56pCDVK81Vo8D341+ZwHLyfPpHeBpgDeizgHgxiMnvk3Aan
 Ql41m9S/EAtBNNAL7wrD8JXbdjMMH6SwpHZsKo2xJetKCYf6q+3eY/VD1mhGWobY/Pvm2uS5mj
 Vf8=
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="85093580"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jul 2020 03:09:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 23 Jul 2020 03:08:22 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 23 Jul 2020 03:09:01 -0700
References: <20200615133242.24911-1-lars.povlsen@microchip.com> <CAK8P3a1VGsMFfqaMXA2n49F84MYR5eYWvPT-sMHK1XYGGnNB0A@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v3 00/10] Adding support for Microchip Sparx5 SoC
In-Reply-To: <CAK8P3a1VGsMFfqaMXA2n49F84MYR5eYWvPT-sMHK1XYGGnNB0A@mail.gmail.com>
Date:   Thu, 23 Jul 2020 12:09:00 +0200
Message-ID: <87v9iek0g3.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Arnd Bergmann writes:

> On Mon, Jun 15, 2020 at 3:33 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>>
>> This patch series adds support for Microchip Sparx5 SoC, the CPU
>> system of a advanced, TSN capable gigabit switch. The CPU is an armv8
>> x 2 CPU core (A53).
>>
>> Although this is an ARM core, it shares some peripherals with the
>> Microsemi Ocelot MIPS SoC.
>
> I've picked up this version of the series into an arm/newsoc branch in
> the soc tree,
> except for the pinctrl patch that Linus Walleij already merged.
>

Great! Thanks a lot for following up!

> I see you still have a few pending patches for other subsystems (spi, mmc)
> and I'm not sure what the status is for those and am dropping them for the
> moment.
>

Yes, I had a question out for the SPI maintainer but did not get any
feedback, so I was thinking just doing my own assumptions and refreshing
the series - probably tomorrow.

I also just bumped the MMC maintainer (Adrian) yesterday, as he did send
a me an 'Acked-by', but it hasn't been merged it seems.

> Once the bindings are accepted by the respective subsystem maintainers,
> please send any remaining DT patches as a follow-up to what I've already
> merged.
>

I'll try to work out the puzzle, might need to reach out directly to to
determine whats missing.

Later,

---Lars

>       Arnd

-- 
Lars Povlsen,
Microchip
