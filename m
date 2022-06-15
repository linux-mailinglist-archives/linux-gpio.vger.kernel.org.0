Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4113D54CB0A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 16:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241332AbiFOOSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 10:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbiFOOSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 10:18:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785B42019D
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655302695; x=1686838695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TLnR7gr3pP5p+jGA8xiuziIDg/pmjQDefjmcFRA/HOk=;
  b=FUVrWjVMEwVhGQDSsNlDPrhZUskf0hrsYTb/EroWJ5dNJ/PHmZbiuO+m
   KHk4Oy/0QDgLk8xzdQuiN95GKT/+8pKFIlU8mVd5xjNwjmwEh815xdjp6
   OyAAs9s1lTzEEwCcjkrPPl6FimMzfGPOEG4xZKHetzqYbGy+eHxMXBS/3
   srmRs2L0OPONXzW+lKY1hGOU3QQWwT6W0qrTvsKmi6DBF9AxT2Cm3Y+qt
   40raGX1W6sDUMM8a/YNc7E0jShJq975Q/7HmjXuXxw/TQgFpISaCirvG3
   5V6FaQOPxrM5ADpet4YiWHlLgWs+jTrXA8V7fESjCjwrsQU/2kYEPhnsx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261999024"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="261999024"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 07:18:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="674521779"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 07:18:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o1TqR-000dV1-Sc;
        Wed, 15 Jun 2022 17:18:07 +0300
Date:   Wed, 15 Jun 2022 17:18:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com
Subject: Re: [PATCH v6 0/6] Enhancements to AMD pinctrl and implementation of
 AMD pinmux
Message-ID: <YqnqH+5QD/NnIxON@smile.fi.intel.com>
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
 <CACRpkdaQQxSO+dSbsFdgmzprJTexepmtBqbuX-X-XP2zVzepsw@mail.gmail.com>
 <Yp3R3RrH2/SGx6oo@smile.fi.intel.com>
 <CACRpkdbynUtZgT9Pcc3eoF6FKMxJ4Jjc=R9-osZvBK2ACbd08g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbynUtZgT9Pcc3eoF6FKMxJ4Jjc=R9-osZvBK2ACbd08g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 15, 2022 at 03:55:59PM +0200, Linus Walleij wrote:
> On Mon, Jun 6, 2022 at 12:07 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Jun 04, 2022 at 12:12:31AM +0200, Linus Walleij wrote:

...

> > Can you provide an immutable tag / branch, so I can pick it up to my tree and
> > develop patches for Intel drivers based on patch 1 from this series?
> 
> Sorry for slowness.
> Created ib-v5.20-amd-pinctrl as a branch in the pinctrl
> tree and merged to devel. Pushing it out soon!

Merci!

-- 
With Best Regards,
Andy Shevchenko


