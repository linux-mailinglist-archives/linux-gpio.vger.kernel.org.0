Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652F01A8669
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 18:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407487AbgDNQ6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 12:58:13 -0400
Received: from mga11.intel.com ([192.55.52.93]:33041 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407474AbgDNQ6F (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 12:58:05 -0400
IronPort-SDR: 6pI3YC4eGhYY2BK3i/UnIhZvucjKvE3fZfDXFkA0AuATbT96MkuvzGOOK/bQcPLndMrSgkgEfm
 wUfA0S7k2J/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 09:58:04 -0700
IronPort-SDR: gMbE+QEekDU0/kio2XqaWcyspTrGOM24WgO+9PIqFcmMf+ocohTOzBvctElNLp6KpfsGLyuDFj
 QNG/IBZG2PwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="253250831"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40]) ([10.212.190.40])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 09:58:00 -0700
Subject: Re: [RFC PATCH 00/16] ASoC/SOF/clk/gpio/dt: add Hifiberry DAC+ PRO
 support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, tiwai@suse.de,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Hui Wang <hui.wang@canonical.com>,
        Matthias Reichl <hias@horus.com>, broonie@kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200414165022.GZ34613@smile.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7ea10ab5-a800-4c0e-8571-64dab08645c8@linux.intel.com>
Date:   Tue, 14 Apr 2020 11:57:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414165022.GZ34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



>> Since this patchset relies on different subsystems, sending as RFC for
>> now. I chose to import the original code from the Raspberry PI tree as
>> is,
> 
> I don't see briefly what they are, any pointers like patch numbers in the
> series?

The prefix is the key, I should have added the following in the cover 
letter:

ASoC: pcm512x -> gpiochip creation

ASoC: Intel: sof-pcm512x -> use of gpio and clk API in the 
board-specific machine driver.

clk: hifiberry-dacpro -> use of gpio and creation of clock.

ASoC: dtbindings -> yaml description
