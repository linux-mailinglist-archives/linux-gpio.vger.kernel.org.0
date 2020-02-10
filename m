Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA2715729E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 11:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgBJKNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 05:13:25 -0500
Received: from mga02.intel.com ([134.134.136.20]:58079 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJKNY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 05:13:24 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 02:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; 
   d="scan'208";a="431556779"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2020 02:13:22 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1j164B-000XJR-O1; Mon, 10 Feb 2020 12:13:23 +0200
Date:   Mon, 10 Feb 2020 12:13:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     sachin agarwal <asachin591@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        andy@kernel.org
Subject: Re: [PATCH v2] gpio: ich: fix a typo
Message-ID: <20200210101323.GS10400@smile.fi.intel.com>
References: <20200209111620.97423-1-sachinagarwal@sachins-MacBook-2.local>
 <CAMRc=Md9gsrm3OXcMgxd7DuiuZUovBB=Bcqfs7zCLApmgV6A8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md9gsrm3OXcMgxd7DuiuZUovBB=Bcqfs7zCLApmgV6A8Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 10, 2020 at 10:54:37AM +0100, Bartosz Golaszewski wrote:
> niedz., 9 lut 2020 o 12:16 sachin agarwal <asachin591@gmail.com> napisał(a):

> I'm seeing that you have been sending a lot of these single typo
> fixes. This is polluting the history and I'm not a fan of that.
> 
> Linus: what is your policy on this?

Side note from Intel developer(s):
Whatever you decide I would like to have Intel GPIO patches to be seen
separately, so, we handle them thru our trees.

Since it's only one patch now for me, I'll take it.

-- 
With Best Regards,
Andy Shevchenko


