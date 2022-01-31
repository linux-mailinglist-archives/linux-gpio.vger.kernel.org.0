Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742804A4565
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 12:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350538AbiAaLk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 06:40:27 -0500
Received: from mga01.intel.com ([192.55.52.88]:18732 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1376581AbiAaLgY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jan 2022 06:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643628982; x=1675164982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kgiOcoUuVtSg2vjAUJcju/uWAMd/0r0SZQcVag3h490=;
  b=PZNTEgud2LfwYL82xBr84SFZzR2QPBDi8u6+iT4IwbgD3+40cLdVlPuw
   yiTvS30wFq5EEXmOFhrAzMD0vgFAm23FAlgGyl31dP3g9UwFoR35udV4v
   akg51JC2dYHNrVzSIBS7A9+YJeVPEM/f2ho2KOcY8YW4qrSTEfXlg7xQZ
   ZtOtOh/cvCXUj82GmiHGDohw53PK+kpJnJSrkECQrTS95eGbex18sVqh6
   hpa2jGH1pFaZnvpC97qNWBIfh/x4LxNH7Iz0fIsRBwJ1fn/J66/9N+6Pz
   0stenb2PbXL86ra4PiT+ltWHlnDurGAqH4us8R4+86EJ/7rjU7J309dge
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="271911047"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="271911047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 03:27:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="522615854"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 03:27:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nEUpR-00Gqbt-1R;
        Mon, 31 Jan 2022 13:26:37 +0200
Date:   Mon, 31 Jan 2022 13:26:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Gasai Maple <gasaimaple@gmail.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl
Subject: Re: A problem with gpios on my sunxi board.
Message-ID: <YffHbHRJLlF/kJ8F@smile.fi.intel.com>
References: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
 <20220131005924.GA11753@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131005924.GA11753@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 31, 2022 at 08:59:24AM +0800, Kent Gibson wrote:
> On Fri, Jan 28, 2022 at 10:12:13PM +0800, Gasai Maple wrote:
> > I posted a question on stackoverflow, it's basically about me having
> > problems operating gpio with libgpiod, and a user advised me to drop a
> > message, the link is here
> > https://stackoverflow.com/questions/70863283/libgpiod-tests-fails-on-pcduino3-nano
> 
> It would be helpful to restate your question rather than providing the
> link.  But anyway...
> 
> My best guess is that your kernel is built with only v2 of the GPIO CDEV ABI.
> libgpiod support for v2 is a WIP, and 1.6.3 only supports ABI v1.
> The CHIP_INFO ioctl is common to both, so will still work.
> But all the line request ioctls changed so they wont.
> So libgpiod is probably making ioctl calls that your kernel doesn't
> support.

If this the case, can we add some warning to libgpiod tools to tell user that
the results may be way wrong because of that?

> For compatibility with libgpiod v1.6.3, ensure your kernel is built with
> these options:
> 
> CONFIG_GPIO_CDEV=y
> CONFIG_GPIO_CDEV_V1=y
> 
> And the libgpiod tests require that gpio-mockup is available as a loadable
> module, so
> 
> CONFIG_GPIO_MOCKUP=m
> 
> If building a new kernel isn't an option for you then you might want to
> try the development branch of libgpiod[1].
> Or you could try my Go[2] or Rust[3] libraries that both support both
> versions of the ABI and provide tools equivalent to libgpiod.
> 
> If you still have issues, try using strace to display the ioctl calls and
> we can debug that.
> 
> Cheers,
> Kent.
> 
> [1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/libgpiod-2.0
> [2] https://github.com/warthog618/gpiod
> [3] https://github.com/warthog618/gpiod-rs

-- 
With Best Regards,
Andy Shevchenko


