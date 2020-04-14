Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB1C1A85DB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 18:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441021AbgDNQuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 12:50:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:30107 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440469AbgDNQuX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 12:50:23 -0400
IronPort-SDR: 9oSKd+HRRu9JhqChL7Wopl/pveXsB9KQHXmUvumBNfDm3deh11UYstO9Kll2cVQ53hA+z8nmhE
 VnVNEJn+urjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 09:50:22 -0700
IronPort-SDR: bWxEDQjuFDrDT9MygE7f1IjUi3D1Um86kZB5pVVrNCCWMQigtPOGBvd0wxbGDA6tjHzE9R1fNv
 aENPuNPRmLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="245461959"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2020 09:50:19 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOOlS-000ZWr-5E; Tue, 14 Apr 2020 19:50:22 +0300
Date:   Tue, 14 Apr 2020 19:50:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 00/16] ASoC/SOF/clk/gpio/dt: add Hifiberry DAC+ PRO
 support
Message-ID: <20200414165022.GZ34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:25PM -0500, Pierre-Louis Bossart wrote:
> The Hifiberry DAC+ / DAC+ PRO is supported in the Raspberry PI tree
> but until now not in the mainline and not for ACPI platforms.
> 
> This patchset implements the recommendations suggested by Mark Brown
> back in 2018: first add a gpiochip in the PCM512x codec driver, then
> use these gpios from a clock driver and the machine driver.
> 
> Since this patchset relies on different subsystems, sending as RFC for
> now. I chose to import the original code from the Raspberry PI tree as
> is,

I don't see briefly what they are, any pointers like patch numbers in the
series?

>	and add my changes on top. If there is a preference to squash the
> changes that'd be fine.

I guess it would be good to have.

> I also don't know if I should split this
> series in two, one for ASoC and one for clk changes?
> 
> This patchset does not add changes to the sound/soc/bcm machine
> drivers, but that should be trivial once all the gpio/clock is
> available.
> 
> Thanks to Andy Shevchenko for his help navigating the gpio subsystem
> and flagging mistakes in the use of lookup tables, and to Rob Herring
> for pointers on the DT bindings verification tools.

You are welcome!
I'm going to review them (where I understand something) as they are presented.

> Daniel Matuschek (1):
>   clk: hifiberry-dacpro: initial import
> 
> Pierre-Louis Bossart (15):
>   ASoC: pcm512x: expose 6 GPIOs
>   ASoC: pcm512x: use "sclk" string to retrieve clock
>   ASoC: Intel: sof-pcm512x: use gpiod for LED
>   ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+ PRO
>   ASoC: Intel: sof-pcm512x: reconfigure sclk in hw_params if needed
>   ASoC: Intel: sof-pcm512x: select HIFIBERRY_DACPRO clk
>   clk: hifiberry-dacpro: update SDPX/copyright
>   clk: hifiberry-dacpro: style cleanups, use devm_
>   clk: hifiberry-dacpro: add OF dependency
>   clk: hifiberry-dacpro: transition to _hw functions
>   clk: hifiberry-dacpro: add ACPI support
>   clk: hifiberry-dacpro: add "sclk" lookup
>   clk: hifiberry-dacpro: toggle GPIOs on prepare/unprepare
>   clk: hifiberry-dacpro: add delay on clock prepare/deprepare
>   ASoC: dt-bindings: add document for Hifiberry DAC+ PRO clock
> 
>  .../bindings/sound/hifiberry-dacpro.yaml      |  38 +++
>  drivers/clk/Kconfig                           |   4 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-hifiberry-dacpro.c            | 284 ++++++++++++++++++
>  sound/soc/codecs/pcm512x.c                    | 134 ++++++++-
>  sound/soc/intel/boards/Kconfig                |   2 +
>  sound/soc/intel/boards/sof_pcm512x.c          | 190 +++++++++++-
>  7 files changed, 635 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml
>  create mode 100644 drivers/clk/clk-hifiberry-dacpro.c
> 
> 
> base-commit: dd8e871d4e560eeb8d22af82dde91457ad835a63
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


