Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B2C1AD977
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 11:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgDQJIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 05:08:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:40938 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729920AbgDQJIh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 05:08:37 -0400
IronPort-SDR: To4oH2p7SgNoRwACYvLFmehZ8+D9rWjOumVcHOUzgcXXcX4c6mvlM+b/WV8uAx8XUrrtbSEIll
 citXcOxi09EQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 02:08:37 -0700
IronPort-SDR: tV/NdWMXWbHzH70bd5vww+Lg4Os+UqivkaqitE/FyhyC0x1T/S0mm26LM9LQ1DPSeX7pYDciYj
 y8L0W+HV5wQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="364275963"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 17 Apr 2020 02:08:34 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 17 Apr 2020 12:08:33 +0300
Date:   Fri, 17 Apr 2020 12:08:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Grace Kao <grace.kao@intel.com>
Cc:     linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, briannorris@chromium.org
Subject: Re: [PATCH v2 1/1] pinctrl: cherryview: Add missing spinlock usage
 in chv_gpio_irq_handler
Message-ID: <20200417090833.GO2586@lahna.fi.intel.com>
References: <20200417030449.10601-1-grace.kao@intel.com>
 <20200417041154.13063-1-grace.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417041154.13063-1-grace.kao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 12:11:54PM +0800, Grace Kao wrote:
> According to Braswell NDA Specification Update (#557593),
> concurrent read accesses may result in returning 0xffffffff and write
> instructions may be dropped. We have an established format for the
> commit references, i.e.
> cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in
> byt_gpio_irq_handler")
> 
> Signed-off-by: Grace Kao <grace.kao@intel.com>
> Reported-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
