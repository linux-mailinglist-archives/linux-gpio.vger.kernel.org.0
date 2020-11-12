Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0E92AFFFA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 08:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgKLHBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 02:01:03 -0500
Received: from mga12.intel.com ([192.55.52.136]:54238 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgKLHBC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 02:01:02 -0500
IronPort-SDR: TXYJmof/Kass6i7xQF9Uj5SVO7fNJzuvD/3T5qVNifgt+lCdiAKwQsaOvSrAd++QQP2ao60Y1S
 f4a/+hcU1xTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149541593"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="149541593"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 23:00:56 -0800
IronPort-SDR: WvTMHRRTO6Rgj+wvRfIF5OvvA7zS71YGe08Zbkp+3/tzP2Fj9tv9Xju8lO4ZXUkcKJE6DPmJW8
 aTvCTdmvoEFQ==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542144885"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 23:00:53 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 09:00:50 +0200
Date:   Thu, 12 Nov 2020 09:00:50 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 17/17] gpiolib: acpi: Make Intel GPIO tree official
 for GPIO ACPI work
Message-ID: <20201112070050.GO2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-18-andriy.shevchenko@linux.intel.com>
 <20201111192739.GS4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111192739.GS4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 09:27:39PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 09, 2020 at 10:53:32PM +0200, Andy Shevchenko wrote:
> > Make Intel GPIO tree official for GPIO ACPI work.
> 
> Mika, do you think it's a good idea?

If it helps the GPIO maintainers work then yes sure, and in that case
you can add:

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
