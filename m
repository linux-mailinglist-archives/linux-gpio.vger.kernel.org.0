Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F2AE1322
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 09:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389845AbfJWHai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 03:30:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:6670 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389459AbfJWHai (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 03:30:38 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 00:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="209865074"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 23 Oct 2019 00:30:34 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 23 Oct 2019 10:30:34 +0300
Date:   Wed, 23 Oct 2019 10:30:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/5] pinctrl: intel: Refactor register restoring on
 resume
Message-ID: <20191023073033.GM2819@lahna.fi.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 12:59:59PM +0300, Andy Shevchenko wrote:
> Refactor ->resume() path to be a bit smarter and less noisy.
> 
> In v2:
> - add a patch to reduce a noise in kernel log
> - drop warning to debug level for one message
> - constify local pointers (Mika)
> 
> Andy Shevchenko (5):
>   pinctrl: intel: Introduce intel_restore_padcfg() helper
>   pinctrl: intel: Introduce intel_restore_hostown() helper
>   pinctrl: intel: Introduce intel_restore_intmask() helper
>   pinctrl: intel: Drop level from warning to debug in
>     intel_restore_hostown()
>   pinctrl: intel: Use helper to restore register values on ->resume()

For the whole series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
