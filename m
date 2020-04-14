Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3C41A77AA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 11:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437823AbgDNJs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 05:48:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:64301 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437817AbgDNJs4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 05:48:56 -0400
IronPort-SDR: PBBCaPDCfhI+020Qp7zKlW6qgWMOg4LYPnKMH8P+22CvQum7wkcDjViiS/JCqTaLm9TZQA5DOD
 CutesV9M7TQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 02:48:56 -0700
IronPort-SDR: au3s3YbgXCKTXLvnjCJ9GN4xnSeZon1evXhGTvk3mS/YA2omsn0sN6fKj6FtBvvLpsKClyJgVB
 YHtpQLk8BYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="363330647"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 14 Apr 2020 02:48:54 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 14 Apr 2020 12:48:53 +0300
Date:   Tue, 14 Apr 2020 12:48:53 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] pinctrl: intel: Introduce common flags for GPIO
 mapping scheme
Message-ID: <20200414094853.GF2567@lahna.fi.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 02:18:20PM +0300, Andy Shevchenko wrote:
> Few drivers are using the same flag to tell Intel pin control core
> how to interpret GPIO base.
> 
> Provide a generic flags so all drivers can use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
