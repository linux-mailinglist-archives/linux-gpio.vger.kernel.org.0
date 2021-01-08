Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F6D2EF2A5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 13:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbhAHMse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 07:48:34 -0500
Received: from mga07.intel.com ([134.134.136.100]:25722 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbhAHMsd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 07:48:33 -0500
IronPort-SDR: 7rXYtypWLyU+CMhOxs7E7l+6zLevPIPNkHFlLiBKlNld3PEZAQWP869Ri+IJoJdq1zkZywJNjx
 uhCsnE6OOxMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="241663336"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="241663336"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 04:46:46 -0800
IronPort-SDR: iUxLuetIJkCema+QppwQ5UbJ7vedM/uOpwgzaUKiClT9lYkFZbCteR7KzNsUjWZNR3ss3iTQpe
 KEdpsy2FTp3Q==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="463371415"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 04:46:45 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 14:46:43 +0200
Date:   Fri, 8 Jan 2021 14:46:43 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to
 features
Message-ID: <20210108124643.GA968855@lahna.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
 <20210108070722.GX968855@lahna.fi.intel.com>
 <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
 <CAHp75VcPM0UH6iaCdbakgdaxM7CaJax8-kVLMzYvAeFfRYgdng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcPM0UH6iaCdbakgdaxM7CaJax8-kVLMzYvAeFfRYgdng@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 02:31:23PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 8, 2021 at 2:22 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 8, 2021 at 9:09 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Thu, Jan 07, 2021 at 09:02:00PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > I don't see how it could be achieved (offsets can be unordered). If
> > there is such an issue it will mean a silicon bug.
> 
> Specification says clearly that one register is a must and its value
> defines the behaviour.
> 
> "The first Capability List register is located at offset 0x004...  and
> contains a pointer/address to the next Capability List register. The
> first Capability List register is no different than others... except
> for its “Capability Identification” field is always 0. The total
> number of Capability List registers... is 1 at the minimum (to
> determine if there is any capability)."

This is not the first time something like this is done wrong at silicon
level. IMHO it is always good idea to avoid possible infinite loops
especially in the kernel space.

> So I prefer to stick with my original variant.

OK.
