Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A22447C9F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 10:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbhKHJU1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 04:20:27 -0500
Received: from mga17.intel.com ([192.55.52.151]:41360 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233715AbhKHJU1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 04:20:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="212928192"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="212928192"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 01:17:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="544398855"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 01:17:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mk0m3-004cLP-Ea;
        Mon, 08 Nov 2021 11:17:07 +0200
Date:   Mon, 8 Nov 2021 11:17:07 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Yury Norov <yury.norov@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
Message-ID: <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
 <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
 <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 04, 2021 at 01:15:46PM +0100, Emil Renner Berthing wrote:
> On Tue, 2 Nov 2021 at 22:17, Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> I'd really like to understand your reasoning here. As far as I can
> tell reading 2 adjacent 32bit registers with a 64bit read as you're
> proposing is exactly what would cause endian issues. Eg. on little
> endian you'd get reg0 | reg1 << 32 whereas on big-endian you'd get
> reg0 << 32 | reg1.

Nope, it won't. The endianess is a property of both CPU and device.

The I/O accessors, such as readl()/writel() and iowrtieXX()/ioreadXX()
are _always_ LE.

So, writeq() will properly put bits to their places in case device is LE.
And most devices are LE (or should be). Of course there are cases, but then
you have to specify them explicitly.

My motive here is simple as that the device is definitely a set of a few
128-bit bitmaps (in registers) and using bitmap _is_ representing hardware
in the kernel. Using something else will deviate from that (maybe not too
far, but still...).

-- 
With Best Regards,
Andy Shevchenko


