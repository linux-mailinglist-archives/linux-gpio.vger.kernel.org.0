Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754B31B3A88
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 10:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgDVItL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 04:49:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:43499 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbgDVItL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 04:49:11 -0400
IronPort-SDR: uJeTVB8W/Ioe5n7erG26CWpvUAd9RM2YhB7Y9khBf8DtSFPSIPFn0KSGXu5lcce11W8Z16A5zJ
 sP1XidNOvbgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 01:49:11 -0700
IronPort-SDR: aNRlo73t+nUvfDKcs4vVlfrZuw8OzS0JV2HfPZyYqW0NJiP1sVVcypVZ+Au72zkw2UkdCQ5A2v
 c+z0VZs7zKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,413,1580803200"; 
   d="scan'208";a="365618943"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 22 Apr 2020 01:49:09 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 22 Apr 2020 11:49:08 +0300
Date:   Wed, 22 Apr 2020 11:49:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Update description in struct
 intel_community
Message-ID: <20200422084908.GQ2586@lahna.fi.intel.com>
References: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2020 at 10:00:48PM +0300, Andy Shevchenko wrote:
> It appears that most of the drivers, that are using struct intel_community,
> utilize gpps rather than gpp_size. Update comment accordingly.
> 
> While here, correct the description of gpp_size, i.e. remove double space
> and drop redundant 'etc.' part.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
