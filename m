Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268501A8726
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407454AbgDNRL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:11:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:8977 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732059AbgDNRL1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:11:27 -0400
IronPort-SDR: CzANbdIBjLxTi14aMj4YgkwJMHhP/DeM4P2/I8XHRsX0+kecrGip9CK4STkT5OEPzahVSC4jVS
 GJ2AhYUGH6OQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:11:26 -0700
IronPort-SDR: X2hTiwRuNNYfRLz2VLOiMFJdlmRfVHJElCnoyRMQXDU8M3WGbp89EjT8hNRzzE/v6NG223QzxF
 mFvtNXzD40nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="454626137"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2020 10:11:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOP5p-000Zja-QL; Tue, 14 Apr 2020 20:11:25 +0300
Date:   Tue, 14 Apr 2020 20:11:25 +0300
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
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
Message-ID: <20200414171125.GB34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
> the "sclk" string as a fallback.

This is fishy a bit.
Do we have this name in the bindings?

If no, why not simple switch to devm_clk_get_optional()?

-- 
With Best Regards,
Andy Shevchenko


