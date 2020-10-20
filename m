Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F55029398E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 13:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392415AbgJTLEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 07:04:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:43759 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390873AbgJTLEH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 07:04:07 -0400
IronPort-SDR: Urzu8pHsxcV2FNUswikJbyvRPU/JJi6szTCLpmdGCXITrWwMSh64UvABEVJfO9vvX8BAxLiuip
 Nk6fJ6Pz5SiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="164579545"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="164579545"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:04:07 -0700
IronPort-SDR: GDtBhTA5JlSSZUJsNuhDEfTQVrZDCbxdJeNXlBwAi0/WVG157wDZhj+1anFZGbPyvr2IDGMMlY
 pPwHlRZHhnkQ==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="320611899"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:04:01 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUpRw-00BNQ6-Gk; Tue, 20 Oct 2020 14:05:04 +0300
Date:   Tue, 20 Oct 2020 14:05:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201020110504.GJ4077@smile.fi.intel.com>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol>
 <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 12:47:02PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 19, 2020 at 6:21 PM Kent Gibson <warthog618@gmail.com> wrote:

...

> I'm now actually leaning more towards making it opaque but I need to
> find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> struct.

+1 for opaque if technically possible.

For the issue you describe, perhaps callbacks somewhere? (Although it might
look not so nice)

-- 
With Best Regards,
Andy Shevchenko


