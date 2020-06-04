Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8531EE1D7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 11:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgFDJw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 05:52:29 -0400
Received: from mga06.intel.com ([134.134.136.31]:45098 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbgFDJw3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jun 2020 05:52:29 -0400
IronPort-SDR: nqSPO534JOfYu5gvbShwtZvbYcp5WQ3W3AAnySNp0/lD956iiJn1Z1kQ2dL7t5rfSzm9GTgT+I
 skHYzEeGGWqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 02:52:28 -0700
IronPort-SDR: 2fRFjaqnmVnAgs8MloW7pvIeeTr2Da57f3xQAECY/ol3kDbPIgp8b4eTToZ6XB/UqXLAk0oVle
 nljA2i+KXdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="378366963"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 04 Jun 2020 02:52:25 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Jun 2020 12:52:24 +0300
Date:   Thu, 4 Jun 2020 12:52:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        mouse <xllacyx@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1] pintctrl: =?iso-8859-1?Q?me?=
 =?iso-8859-1?Q?rrifield=3A_Add_I=B2S?= bus 2 pins to groups and functions
Message-ID: <20200604095224.GN247495@lahna.fi.intel.com>
References: <20200604092807.67283-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200604092807.67283-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 12:28:07PM +0300, Andy Shevchenko wrote:
> It is useful to control I²S bus 2 pins if we would like to connect
> an audio codec.
> 
> Reported-by: mouse <xllacyx@gmail.com>
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
