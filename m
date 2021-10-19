Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B14B4332DE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 11:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbhJSJyk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 05:54:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:65378 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231652AbhJSJyk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Oct 2021 05:54:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209266693"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="209266693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 02:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="531371974"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 02:52:21 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mclms-000SXr-2L;
        Tue, 19 Oct 2021 12:52:02 +0300
Date:   Tue, 19 Oct 2021 12:52:02 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <YW6VQutGMFOZPNlC@smile.fi.intel.com>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
 <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
 <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 18, 2021 at 07:02:43PM +0200, Emil Renner Berthing wrote:
> On Mon, 18 Oct 2021 at 18:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > Having a second look I found even problematic error paths because of
> > mixing devm_*() with non-devm_*() calls, which only assures me that
> > your ->probe() error path is broken and should be revisited.
> 
> So do you want to expand on that now or should I send v2 first?

Here is not enough context anymore to point out. I expect one to have done
their homework anyway.

-- 
With Best Regards,
Andy Shevchenko


