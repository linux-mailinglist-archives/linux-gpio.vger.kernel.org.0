Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24E11A890E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 20:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503761AbgDNSRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 14:17:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:2610 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503751AbgDNSR0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 14:17:26 -0400
IronPort-SDR: RDWvki/Mb/EmFIqeFt9tNq4A85Pxwl6gYAatOqdPajWN9voNytS5egprwSA3HUed28tw8sBKsA
 6CERGpoqrm+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:17:25 -0700
IronPort-SDR: zetcgI7Tu/vLLfaxeuL+7qG30tlfoiwW1C/aRreTbnxRrJpMKduGR6ULAHtMhkjjgKdDMDwX+r
 SAp+x+sP71sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253273018"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:17:20 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
Date:   Tue, 14 Apr 2020 13:14:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414174530.GK5412@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 12:45 PM, Mark Brown wrote:
> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>> the "sclk" string as a fallback.
> 
> Is this something that could be fixed at the ACPI level?

I guess to fix this we'd need some sort of ACPI-level connection or 
description of the clock, and I've never seen such a description?

All the examples I've seen use an explicit 'mclk' string (that's e.g. 
what we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, 
we added a lookup). Here I used 'sclk' since it's what TI refers to in 
their documentation.

I vaguely recall AMD had similar issues with another codec.
