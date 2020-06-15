Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF691F9429
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 12:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgFOKA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 06:00:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:61784 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgFOKA4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 06:00:56 -0400
IronPort-SDR: /DdsH8POFUFMF6KMLQeytE0KEK7ojN/0g3cAbAP04DYPjcXNyXvsQF9S2MG1BCsTSgXTTkhXcg
 dXb/Ytl0VUog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 03:00:55 -0700
IronPort-SDR: f8hXmnPufElzbCSRt39TZmubdyCetT9yydnUIFZXLShA66jtBT2J8whxLu6JLFWYBCinvvt0OK
 5ZwP4R9fW31g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="262687923"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2020 03:00:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jklvD-00DXc5-Rt; Mon, 15 Jun 2020 13:00:55 +0300
Date:   Mon, 15 Jun 2020 13:00:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        mouse <xllacyx@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] pintctrl: =?iso-8859-1?Q?me?=
 =?iso-8859-1?Q?rrifield=3A_Add_I=B2S?= bus 2 pins to groups and functions
Message-ID: <20200615100055.GU2428291@smile.fi.intel.com>
References: <20200604092807.67283-1-andriy.shevchenko@linux.intel.com>
 <20200604095224.GN247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200604095224.GN247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 12:52:24PM +0300, Mika Westerberg wrote:
> On Thu, Jun 04, 2020 at 12:28:07PM +0300, Andy Shevchenko wrote:
> > It is useful to control I²S bus 2 pins if we would like to connect
> > an audio codec.
> > 
> > Reported-by: mouse <xllacyx@gmail.com>
> > Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


