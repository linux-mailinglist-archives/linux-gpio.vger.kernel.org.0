Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401031427F9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 11:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgATKOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 05:14:36 -0500
Received: from mga12.intel.com ([192.55.52.136]:39185 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgATKOg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jan 2020 05:14:36 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 02:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="215195988"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2020 02:14:34 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1itU4p-0000C0-Na; Mon, 20 Jan 2020 12:14:35 +0200
Date:   Mon, 20 Jan 2020 12:14:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: sunrisepoint: Add Coffee Lake-S ACPI ID
Message-ID: <20200120101435.GF32742@smile.fi.intel.com>
References: <20200116110951.31644-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYVDggtFhfmNfk4soU--s9Dg=gPmUtEpxKCpKLdRcNJFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYVDggtFhfmNfk4soU--s9Dg=gPmUtEpxKCpKLdRcNJFw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 17, 2020 at 09:10:43AM +0100, Linus Walleij wrote:
> On Thu, Jan 16, 2020 at 12:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > From: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > Intel Coffee Lake-S PCH has the same GPIO hardware than Sunrisepoint-H
> > PCH but the ACPI ID is different. Add this new ACPI ID to the list of
> > supported devices.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Just because I understand it:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks! Sorry, it was a bit late and final commit misses this tag.

> Expecting a pull request for some v5.6 material soon!

Had been just sent.

-- 
With Best Regards,
Andy Shevchenko


