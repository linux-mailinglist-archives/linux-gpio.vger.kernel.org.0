Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C115332C29
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 17:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCIQei (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 11:34:38 -0500
Received: from mga12.intel.com ([192.55.52.136]:57615 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230504AbhCIQea (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Mar 2021 11:34:30 -0500
IronPort-SDR: Nyq8wEqWXkM0WZ6/5+efb8D8VKdKmXcr28tMEeUiqr7MryorWqVTteh1osT908pcSQj1WJnt2M
 pn20EGaYeGTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="167544947"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="167544947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 08:33:57 -0800
IronPort-SDR: GjsUc0ZTlBTVjGJk/uvqZw/6+AveO1m2OCjfmKYMW7X4VNhCa01S/TW31/nMx+vxiU8HNi+o5D
 AB66lEFEkV7g==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="447558154"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 08:33:56 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lJfIv-00B6qx-I7; Tue, 09 Mar 2021 18:33:53 +0200
Date:   Tue, 9 Mar 2021 18:33:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEejcX6qrQ+rDhub@smile.fi.intel.com>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <YD+iWuLS/9knWLFb@builder.lan>
 <CACRpkdbZNJR5XaNaEWxwKdxED2mXnN_bN+mLjfPRMxyxVP3TVw@mail.gmail.com>
 <YEDVMpHyCGbZOrmF@smile.fi.intel.com>
 <CACRpkdaT7e-KhmWONG3ER1id_=g8C3d5MYJzvEkoSadj43fESw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaT7e-KhmWONG3ER1id_=g8C3d5MYJzvEkoSadj43fESw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 09, 2021 at 05:22:51PM +0100, Linus Walleij wrote:
> On Thu, Mar 4, 2021 at 1:40 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> 
> > Pin control has been though thru and implemented in the ACPICA, but we have no
> > time to fulfil this work to cover pin control subsystem in the Linux kernel.
> 
> Oh sweet! I suppose it means that firmware using it could appear,
> and at that point it will become a matter of priority to get it done in the
> kernel.

Yes, but so far it didn't appear.

-- 
With Best Regards,
Andy Shevchenko


