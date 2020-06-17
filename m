Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9A41FC340
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 03:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgFQBPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 21:15:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:29699 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgFQBPB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 21:15:01 -0400
IronPort-SDR: PP0OJbHvLRyafsOo+loBJfxSynC57+ZYxYLWnGpx1Za2v1t+gfYKd6S9D9mRYWxpbLwGTYOvOG
 1menSzt6aYjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 18:14:57 -0700
IronPort-SDR: nI+MhNpwgleQA8t8Ohm5pXFbdgiJzKbZuRjxK5/GE65FVDf8xoyVwXXU6bosrSsLYZJoRcRMU8
 EdmS7hIVRD5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; 
   d="scan'208";a="262402157"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by orsmga007.jf.intel.com with ESMTP; 16 Jun 2020 18:14:55 -0700
Date:   Wed, 17 Jun 2020 09:14:29 +0800
From:   Philip Li <philip.li@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        kbuild-all@lists.01.org
Subject: Re: [kbuild-all] Re: [PATCH v3 1/3] pinctrl: intel: Make use of
 for_each_requested_gpio_in_range()
Message-ID: <20200617011429.GB29542@intel.com>
References: <20200615151353.88194-2-andriy.shevchenko@linux.intel.com>
 <202006160949.aOLXxFhV%lkp@intel.com>
 <CAHp75VfnNAUUK1nUyJbBEQxYLp5zc1pC8ASjg8DtOfGtrk7DVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfnNAUUK1nUyJbBEQxYLp5zc1pC8ASjg8DtOfGtrk7DVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 08:36:11AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 16, 2020 at 4:18 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Andy,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on pinctrl/devel]
> > [also build test ERROR on v5.8-rc1 next-20200615]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> Is there a way to tell kbuild bot to use another patch series (by link
> to lore?) that should be used as a base?
Hi Andy, currently we recommend to use --base option to deduce the base commit,
and bot will read this information to find a better tree as base that contains
the base commit.

> In any case this series has such links in a cover letter. Can kbuild
> bot parse it (perhaps some special tag, like BaseLink: is needed)?
We haven't support other way yet. With --base option, we will parse the
extra information added by --base.

> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
