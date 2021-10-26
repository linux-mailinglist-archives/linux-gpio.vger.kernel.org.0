Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412A843AC0E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 08:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhJZGNO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 02:13:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:37063 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232721AbhJZGNO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 02:13:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="253365532"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="253365532"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 23:10:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="529077011"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 23:10:47 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 26 Oct 2021 09:10:44 +0300
Date:   Tue, 26 Oct 2021 09:10:44 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@intel.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [GIT PULL] pinctrl: intel: Changes for v5.16 merge window
Message-ID: <YXeb5KhlTIaeIKD7@lahna>
References: <YXa1NGuIO6u9i8BK@lahna>
 <CACRpkdYn4jEiXLz1JdvZFfKa3zrOTY7dG6xihZAuCHrvF7AVeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYn4jEiXLz1JdvZFfKa3zrOTY7dG6xihZAuCHrvF7AVeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 26, 2021 at 01:32:27AM +0200, Linus Walleij wrote:
> On Mon, Oct 25, 2021 at 3:46 PM Mika Westerberg
> <mika.westerberg@intel.intel.com> wrote:
> 
> > The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
> >
> >   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)
> 
> Since my tree is based on v5.15-rc1 I just picked out this one commit and
> signed it off instead.

Great, thank you! :)
