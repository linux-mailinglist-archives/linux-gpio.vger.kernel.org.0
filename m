Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03681A878A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407669AbgDNRbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:31:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:19422 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732341AbgDNRbO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:31:14 -0400
IronPort-SDR: xkSX3tR87Whu96/aqq11VDgygeABGHZshLJIbwXcTW6fdmyHrX6efv5wMFhAKCsHnKBundhEFD
 x7CZbxFXNBng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:31:11 -0700
IronPort-SDR: i0kCkIFUR74Blyj6EAjijEEDnrSwFH14wws42sXrehAbT0FunF8mp2lTkIzRnF/BHeIMtCRN+M
 ItQ5BGFfBK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="332246781"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 14 Apr 2020 10:31:08 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOPOw-000Zxz-92; Tue, 14 Apr 2020 20:31:10 +0300
Date:   Tue, 14 Apr 2020 20:31:10 +0300
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
        Rob Herring <robh+dt@kernel.org>,
        DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>
Subject: Re: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
Message-ID: <20200414173110.GG34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:32PM -0500, Pierre-Louis Bossart wrote:
> From: Daniel Matuschek <daniel@hifiberry.com>
> 
> This patch imports the clock code from the Raspberry v5.5-y tree. The
> ASoC machine driver initially present in this patch was dropped. The
> comments are also dropped but all sign-offs are kept below. The patch
> authorship was modified with explicit permission from Daniel Matuschek
> to make sure it matches the Signed-off tag.
> 
> This patch generates a lot of checkpatch.pl warnings that are
> corrected in follow-up patches.

I guess it will be waste of time to review this part without squashing it first.

-- 
With Best Regards,
Andy Shevchenko


