Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8053B3665
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 10:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731015AbfIPIa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 04:30:59 -0400
Received: from mga18.intel.com ([134.134.136.126]:18636 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729373AbfIPIa6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 04:30:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 01:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; 
   d="scan'208";a="201554852"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2019 01:30:55 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 Sep 2019 11:30:54 +0300
Date:   Mon, 16 Sep 2019 11:30:54 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/2] gpiolib: introduce devm_fwnode_gpiod_get_index()
Message-ID: <20190916083054.GN28281@lahna.fi.intel.com>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
 <20190913032240.50333-2-dmitry.torokhov@gmail.com>
 <20190913094007.GE28281@lahna.fi.intel.com>
 <20190913181310.GA237523@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913181310.GA237523@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 13, 2019 at 11:13:10AM -0700, Dmitry Torokhov wrote:
> On Fri, Sep 13, 2019 at 12:40:07PM +0300, Mika Westerberg wrote:
> > On Thu, Sep 12, 2019 at 08:22:38PM -0700, Dmitry Torokhov wrote:
> > > devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> > > in question does not have to be a child of device node. Let's rename it
> > > to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> > > for now.
> > 
> > Shouldn't we convert all the users and drop that monstrosity
> > devm_fwnode_get_index_gpiod_from_child() completely?
> 
> Yes, once we land this in 5.4 I will start blasting maintainers with
> patches.

OK, thanks for the clarification.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
