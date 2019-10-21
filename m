Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5DE1DEC98
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 14:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbfJUMoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 08:44:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:18540 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728877AbfJUMoy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Oct 2019 08:44:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 05:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209436612"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 05:44:50 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 15:44:49 +0300
Date:   Mon, 21 Oct 2019 15:44:49 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, fei.yang@intel.com,
        Oliver Barta <oliver.barta@aptiv.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Subject: Re: [PATCH v1] pinctrl: intel: Avoid potential glitches if pin is in
 GPIO mode
Message-ID: <20191021124449.GF2819@lahna.fi.intel.com>
References: <20191014095104.77689-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014095104.77689-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 12:51:04PM +0300, Andy Shevchenko wrote:
> When consumer requests a pin, in order to be on the safest side,
> we switch it first to GPIO mode followed by immediate transition
> to the input state. Due to posted writes it's luckily to be a single
> I/O transaction.
> 
> However, if firmware or boot loader already configures the pin
> to the GPIO mode, user expects no glitches for the requested pin.
> We may check if the pin is pre-configured and leave it as is
> till the actual consumer toggles its state to avoid glitches.
> 
> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Depends-on: f5a26acf0162 ("pinctrl: intel: Initialize GPIO properly when used through irqchip")
> Cc: fei.yang@intel.com
> Reported-by: Oliver Barta <oliver.barta@aptiv.com>
> Reported-by: Malin Jonsson <malin.jonsson@ericsson.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tagged for stable and applied to intel.git/fixes, thanks!
