Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8E43E049C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 17:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbhHDPo5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 11:44:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:21852 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239124AbhHDPo4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 11:44:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="235902327"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="235902327"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:43:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="637026751"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:43:46 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 04 Aug 2021 18:43:43 +0300
Date:   Wed, 4 Aug 2021 18:43:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Riccardo Mori <patacca@autistici.org>,
        Lovesh <lovesh.bond@gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: tigerlake: Fix GPIO mapping for newer
 version of software
Message-ID: <YQq1rzsupUSLYsEw@lahna>
References: <20210804140246.64856-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804140246.64856-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 04, 2021 at 05:02:46PM +0300, Andy Shevchenko wrote:
> The software mapping for GPIO, which initially comes from Microsoft,
> is subject to change by respective Windows and firmware developers.
> Due to above the driver had been written and published way ahead of
> the schedule, and thus the numbering schema used in it is outdated.
> 
> Fix the numbering schema in accordance with the real products on market.
> 
> Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> Reported-and-tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Reported-by: Riccardo Mori <patacca@autistici.org>
> Reported-and-tested-by: Lovesh <lovesh.bond@gmail.com>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213463
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213579
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213857
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy for taking care of this!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
