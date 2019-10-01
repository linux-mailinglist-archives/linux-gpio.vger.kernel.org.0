Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64414C2EEC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 10:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732738AbfJAIeY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 04:34:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:22431 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731596AbfJAIeY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Oct 2019 04:34:24 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 01:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="205024645"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 01:34:21 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 11:34:20 +0300
Date:   Tue, 1 Oct 2019 11:34:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alex Levin <levinale@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cherryview: restore Strago DMI workaround for
 all versions
Message-ID: <20191001083420.GB2714@lahna.fi.intel.com>
References: <20190924024958.GA229906@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924024958.GA229906@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 07:49:58PM -0700, Dmitry Torokhov wrote:
> This is essentially a revert of:
> 
> e3f72b749da2 pinctrl: cherryview: fix Strago DMI workaround
> 86c5dd6860a6 pinctrl: cherryview: limit Strago DMI workarounds to version 1.0
> 
> because even with 1.1 versions of BIOS there are some pins that are
> configured as interrupts but not claimed by any driver, and they
> sometimes fire up and result in interrupt storms that cause touchpad
> stop functioning and other issues.
> 
> Given that we are unlikely to qualify another firmware version for a
> while it is better to keep the workaround active on all Strago boards.
> 
> Reported-by: Alex Levin <levinale@chromium.org>
> Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to intel.git/fixes, thanks!
