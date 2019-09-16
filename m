Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 296BAB3E10
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 17:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfIPPrx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 11:47:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:37475 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbfIPPrx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 11:47:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 08:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; 
   d="scan'208";a="201618725"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2019 08:47:49 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 Sep 2019 18:47:49 +0300
Date:   Mon, 16 Sep 2019 18:47:49 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Federico Ricchiuto <fed.ricchiuto@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allocate IRQ chip dynamic
Message-ID: <20190916154749.GD28281@lahna.fi.intel.com>
References: <20190916144751.21525-1-andriy.shevchenko@linux.intel.com>
 <A0EC9DA6-CDF9-46A7-890B-8EE00D6A4563@getmailspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A0EC9DA6-CDF9-46A7-890B-8EE00D6A4563@getmailspring.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 05:38:47PM +0200, Federico Ricchiuto wrote:
>    That's good!
> 
>    There's a place where I can watch fro updates on the topic?

We typically keep Intel pinctrl/GPIO patches here:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/

>    I'm going to recompile the kernel soon, if the update is ready I'd like
>    to add it.

Great. Let us know if it solves the issue you reported so I can apply
the patch to that tree.
