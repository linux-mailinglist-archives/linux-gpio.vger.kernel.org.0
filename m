Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6D827E154
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 08:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3GkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 02:40:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:42380 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728238AbgI3GkQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 02:40:16 -0400
IronPort-SDR: GTSDGdh1od10jRAH6ONHt+Vu5sQ/lerrHZ2OXBnWccpYKreQzYWTfMahy/Wvwm4ueK/4QKyaxN
 hGkM1lwZDsfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150037831"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="150037831"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:40:15 -0700
IronPort-SDR: 4mxdKC6dVItbBvIIJmLY7v8oh/yUSQpL6HbUeFh3DIr/26W+oh0U5HWQqYlrG74I3J+Hy6/Bk1
 HTotMoy5JpXw==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="338962402"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:40:13 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Sep 2020 09:37:59 +0300
Date:   Wed, 30 Sep 2020 09:37:59 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: cannonlake: Modify COMMUNITY macros to
 be consistent
Message-ID: <20200930063759.GT2495@lahna.fi.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
 <20200929110306.40852-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929110306.40852-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 02:03:05PM +0300, Andy Shevchenko wrote:
> Modify COMMUNITY macros to be consistent with Tiger Lake and others.
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
