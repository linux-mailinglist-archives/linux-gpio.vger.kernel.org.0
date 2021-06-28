Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904DD3B5D26
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jun 2021 13:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhF1Lcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Jun 2021 07:32:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:26879 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232834AbhF1Lci (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Jun 2021 07:32:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="229551409"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="229551409"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 04:30:11 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="408032278"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 04:30:09 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lxpSn-0060vR-9w; Mon, 28 Jun 2021 14:30:05 +0300
Date:   Mon, 28 Jun 2021 14:30:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
Message-ID: <YNmyvYDZwNeYRyTU@smile.fi.intel.com>
References: <20210621191830.10628-1-brgl@bgdev.pl>
 <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627084757.GA21720@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 04:47:57PM +0800, Kent Gibson wrote:
> On Mon, Jun 21, 2021 at 09:18:30PM +0200, Bartosz Golaszewski wrote:
> > This is the bulk of work implementing C++ bindings for the new libgpiod
> > API. The tests are not converted yet but the examples are fully
> > functional. More details in the cover letter as this patch will be
> > squashed with the one for the core C library anyway.
> 
> Firstly, I don't have any problems with patches 1-3.
> 
> Secondly, I'll be focussing on the API here, but I'm not up on current C++
> best practice, so take my comments, or the absence of them, with a
> suitable dose of salt.
> 
> A general comment - you use retrieve/read/get/return for essentially the
> same thing in the accessor method documentation.
> Perhaps you could settle on one?
> Variety may be the spice of life, but sometimes boring is better.

It's a weak point of many documentation files that I saw :-)
Nevertheless, it's good practice to define terms in the preface pages to be
sure everybody is on the same page with meaning of them.

Kent, do I understand correctly that Go bindings use C library?

-- 
With Best Regards,
Andy Shevchenko


