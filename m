Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC34E24881D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 16:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHROrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 10:47:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:39878 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgHROra (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 10:47:30 -0400
IronPort-SDR: C8NsghLR8TMjqoX6Qdz3lORUhFXmCHdPitx0CbatfJF2omitbfWt0YcYmUhN2vtjWdJi0DoFW2
 fzLDlDZUSIHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="134435011"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="134435011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 07:47:30 -0700
IronPort-SDR: T1pl4bIHCe7zPH+qfPPnndSerscLe1mIwwicpNP2/AZBppi0zUBbbj6zNPzN+aEaazIbDN1Zk8
 S/3ZJFvMHqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="400513058"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 18 Aug 2020 07:47:28 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 18 Aug 2020 17:47:27 +0300
Date:   Tue, 18 Aug 2020 17:47:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Update header block to reflect direct
 dependencies
Message-ID: <20200818144727.GU1375436@lahna.fi.intel.com>
References: <20200818142353.34083-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818142353.34083-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 18, 2020 at 05:23:53PM +0300, Andy Shevchenko wrote:
> Update header inclusion block to reflect all direct dependencies
> that are being involved in pinctrl-intel.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
