Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F28F5B1AF8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 11:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388004AbfIMJle (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 05:41:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:26905 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387994AbfIMJle (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Sep 2019 05:41:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 02:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,500,1559545200"; 
   d="scan'208";a="200931747"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 13 Sep 2019 02:41:31 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 13 Sep 2019 12:41:30 +0300
Date:   Fri, 13 Sep 2019 12:41:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 2/2] gpiolib: introduce fwnode_gpiod_get_index()
Message-ID: <20190913094130.GF28281@lahna.fi.intel.com>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
 <20190913032240.50333-3-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913032240.50333-3-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 08:22:39PM -0700, Dmitry Torokhov wrote:
> This introduces fwnode_gpiod_get_index() that iterates through common gpio
> suffixes when trying to locate a GPIO within a given firmware node.
> 
> We also switch devm_fwnode_gpiod_get_index() to call
> fwnode_gpiod_get_index() instead of iterating through GPIO suffixes on
> its own.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
