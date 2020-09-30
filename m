Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B319327E18F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 08:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgI3Gn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 02:43:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:32404 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgI3Gn0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 02:43:26 -0400
IronPort-SDR: Xl8oNgxfLoofQircO6SNxdD+BP+9qhI3YtHMQoTt9n/TlY8qraolDTmfR7etFzuvBuddEevCyC
 m3/WIkk3/KSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="226528608"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="226528608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:43:23 -0700
IronPort-SDR: W4QiFPXCvfoJt6LYSyPs7WiJghvh9Lp9G6PYxEwHRqAUG17M0jc1bEZrBbNaZeUU9O2gCygzb3
 O5slC1KSEzSA==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="338963096"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:43:21 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Sep 2020 09:41:06 +0300
Date:   Wed, 30 Sep 2020 09:41:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] pinctrl: sunrisepoint: Modify COMMUNITY macros to
 be consistent
Message-ID: <20200930064106.GU2495@lahna.fi.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
 <20200929110306.40852-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929110306.40852-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 02:03:06PM +0300, Andy Shevchenko wrote:
> Modify COMMUNITY macros to be consistent with Tiger Lake and others.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
