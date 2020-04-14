Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EF61A8C09
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 22:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbgDNUNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 16:13:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:45827 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2632770AbgDNUNI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 16:13:08 -0400
IronPort-SDR: FOc5uC5u7u8QogM2VdXWSHyICPKEsXxaw2RkggTPeO2ys0eq7Io+5k6lrLfC9uRUuShimHL6jj
 JriiTSnqnDcQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 13:13:04 -0700
IronPort-SDR: 2Ewn15Ji8stuoV7+I13V/tQewZwPzGnIug1GjNuXiEvj4iVvCxW72WcX6xG8aBFuF3tDZqajeY
 0vb5X5EmMNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; 
   d="scan'208";a="253299512"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 13:13:02 -0700
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
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
Date:   Tue, 14 Apr 2020 15:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414195031.GP5412@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/14/20 2:50 PM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 02:15:16PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 1:27 PM, Mark Brown wrote:
> 
>>> Wait, so SCLK is in the *global* namespace and the provider has to
>>> register the same name?  That doesn't sound clever.  It might be better
>>> to have the board register the connection from the clock provider to the
>>> device rather than hard code global namespace strings like this, that
>>> sounds like a recipie for misery.
> 
>> I believe this change has zero impact on DT platforms.
> 
>> The 'sclk' is a fallback here. If you find a clock with the NULL string,
>> it's what gets used. Likewise for the clock provider, the 'sclk' is a lookup
>> - an alias in other words. The use of the references and phandles should
>> work just fine for Device Tree.
> 
> It's not just DT platforms that I'm worried about here, it's also ACPI
> systems - all it takes is for a system to have a second device and a
> name collision could happen, especially with such generic names.  We
> tried to avoid doing this for board files for the same reason.

I am on the paranoid side but here I don't see much potential for conflicts:

a) this only works for the Up2 board with a HAT connector
b) this only work with the Hifiberry DAC+ PRO board.

This codec is not used in any traditional client devices.

> 
>>> It is really sad that nobody involved in producing these systems that
>>> don't work with the current limitations in ACPI has been able to make
>>> progress on improving ACPI so it can cope with modern hardware and we're
>>> having to deal with this stuff.
> 
>> I can't disagree but I have to live with what's available to me as an audio
>> guy...I had a solution two years ago where I could set the clock directly
>> from the machine driver. The recommendation at the time was to use the clk
>> framework, but that clk framework is limited for ACPI platforms, so we can
>> only use it with these global names.
> 
> My understanding is that ACPI just doesn't have clock bindings (or audio
> bindings or...) so you're basically using board files here and board
> files can definitely do more than we're seeing here.

I don't understand your definition of board file, sorry. We've never had 
one, the only thing that's board-specific is the machine driver.

>> We had the same problem on Baytrail/Cherrytrail devices some 4 years ago and
>> we had to use an 'mclk' alias. We are going to have the same problem when we
>> expose the SSP MCLK, BLCK and FSYNC clocks - and that's also what the
>> Skylake driver did - we don't have a solution without global names.
> 
> You should be able to register links between devices using the clock
> API, or add that functionality if it's not there but AFAIK clkdev still
> works.

The machine driver has no information whatsoever on who provides the 
clock. I just don't see how I might link stuff without at least some 
amount of information?

All I needed was to toggle 2 gpios to select 44.1 or 48kHz...Looks like 
it's going to take two more years, oh well.
