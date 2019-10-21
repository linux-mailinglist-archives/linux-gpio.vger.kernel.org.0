Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863D4DEF5E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfJUOWv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:22:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:4278 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727555AbfJUOWu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Oct 2019 10:22:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 07:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209451152"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 07:22:47 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 17:22:46 +0300
Date:   Mon, 21 Oct 2019 17:22:46 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Tiger Lake pin controller
 support
Message-ID: <20191021142246.GP2819@lahna.fi.intel.com>
References: <20191021125329.29646-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021125329.29646-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 03:53:29PM +0300, Andy Shevchenko wrote:
> +static const struct intel_pingroup tgllp_community0_groups[] = {
> +	/* PLACE HOLDER */
> +};
> +
> +static const struct intel_function tgllp_community0_functions[] = {
> +	/* PLACE HOLDER */
> +};

Can you please drop all these?
