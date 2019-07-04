Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4865F8EC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 15:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfGDNNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 09:13:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:44586 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbfGDNNZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jul 2019 09:13:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 06:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; 
   d="scan'208";a="184993869"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 04 Jul 2019 06:13:22 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Jul 2019 16:13:21 +0300
Date:   Thu, 4 Jul 2019 16:13:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Drop double check for data in
 intel_pinctrl_probe_by_uid()
Message-ID: <20190704131321.GK2640@lahna.fi.intel.com>
References: <20190704130239.24111-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704130239.24111-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 04, 2019 at 04:02:39PM +0300, Andy Shevchenko wrote:
> There is no need to duplicate the check which is done in the common
> intel_pinctrl_probe().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
