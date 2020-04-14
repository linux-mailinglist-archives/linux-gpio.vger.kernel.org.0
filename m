Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B37C1A8A99
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 21:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504645AbgDNTYd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 15:24:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:15223 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504639AbgDNTY0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 15:24:26 -0400
IronPort-SDR: vs74/kxxCyEg9NaYpyZAicL5u/MC+BEJB3QgYoshVKMxgiy3dCDC3rrZr6Gg4+4+Q66H2FsJRN
 1abac8MaxgdQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 12:15:19 -0700
IronPort-SDR: nUbP5h8r4Jfxdlj0aUSTSSoeTj7LFFCtRqWPHvrwnAzy7QNdJYvI2BP6sjvPKDzeZkKGrfbXDY
 2EpJCRVvmNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253286678"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 12:15:17 -0700
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
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
Date:   Tue, 14 Apr 2020 14:15:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414182728.GM5412@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 1:27 PM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 01:14:41PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:45 PM, Mark Brown wrote:
>>> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> 
>>>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>>>> the "sclk" string as a fallback.
> 
>>> Is this something that could be fixed at the ACPI level?
> 
>> I guess to fix this we'd need some sort of ACPI-level connection or
>> description of the clock, and I've never seen such a description?
> 
> Wait, so SCLK is in the *global* namespace and the provider has to
> register the same name?  That doesn't sound clever.  It might be better
> to have the board register the connection from the clock provider to the
> device rather than hard code global namespace strings like this, that
> sounds like a recipie for misery.

I believe this change has zero impact on DT platforms.

The 'sclk' is a fallback here. If you find a clock with the NULL string, 
it's what gets used. Likewise for the clock provider, the 'sclk' is a 
lookup - an alias in other words. The use of the references and phandles 
should work just fine for Device Tree.

> It is really sad that nobody involved in producing these systems that
> don't work with the current limitations in ACPI has been able to make
> progress on improving ACPI so it can cope with modern hardware and we're
> having to deal with this stuff.

I can't disagree but I have to live with what's available to me as an 
audio guy...I had a solution two years ago where I could set the clock 
directly from the machine driver. The recommendation at the time was to 
use the clk framework, but that clk framework is limited for ACPI 
platforms, so we can only use it with these global names.

We had the same problem on Baytrail/Cherrytrail devices some 4 years ago 
and we had to use an 'mclk' alias. We are going to have the same problem 
when we expose the SSP MCLK, BLCK and FSYNC clocks - and that's also 
what the Skylake driver did - we don't have a solution without global names.

>> All the examples I've seen use an explicit 'mclk' string (that's e.g. what
>> we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, we added
>> a lookup). Here I used 'sclk' since it's what TI refers to in their
>> documentation.
> 
> They appear to call it SCK not SCLK.

Yes indeed, will change.


