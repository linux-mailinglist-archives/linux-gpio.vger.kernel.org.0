Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475F2FB036
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 13:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfKMMPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 07:15:12 -0500
Received: from mga02.intel.com ([134.134.136.20]:37824 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbfKMMPM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 07:15:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 04:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="214306918"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 13 Nov 2019 04:15:09 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 13 Nov 2019 14:15:08 +0200
Date:   Wed, 13 Nov 2019 14:15:08 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: baytrail: Update North Community pin list
Message-ID: <20191113121508.GO34425@lahna.fi.intel.com>
References: <20191112155721.3760-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112155721.3760-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 12, 2019 at 05:57:21PM +0200, Andy Shevchenko wrote:
> Update North Community pin list to be more clear about pin functions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
