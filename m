Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D4153E635
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 19:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbiFFKPz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 06:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbiFFKPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 06:15:03 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8064C16CF7F
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654510494; x=1686046494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RuWmbkcXsds6oQxi8e13zsjdzV3WtOxY8rtluu7YARA=;
  b=bm5Lx0Qqmn1uHhGDKctrIxJVADo/WadHDd3x8q2BTHbpbX9XzzLAnZqK
   oe5ImJWWUBgBSyI8twrTeBlWkKOk6ZOchS4siW5uABlcoZB74qF2m4PGf
   bjLdWPT61iBLMJSkCJcraD2SRElcU95NSj0ClNdVyl3H+zqcIdu0JztMm
   bp4Vsyspi/mOKu7u9Y815yRn6+2o22+mKKxZkqkkFOhH92OIxrca06blK
   A9h9FilNjlHsDt3dTfIXQPtCgTH1U+6CYLv0eQRjfGg0vTZ+kU3Wbpler
   agLMtOrcW0pYjnKPTWtocTqBc+JMSzMT52C8UoUgB4FLjTXFEuDno2f5v
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="302003592"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="302003592"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:14:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="758502024"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:14:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ny9l2-000UXZ-TY;
        Mon, 06 Jun 2022 13:14:48 +0300
Date:   Mon, 6 Jun 2022 13:14:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
References: <20220525140704.94983-1-brgl@bgdev.pl>
 <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol>
 <20220604024131.GB13574@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220604024131.GB13574@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:
> On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> > On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:

...

> > The focus of my comments above is to simplify the API for the most common
> > case, and to make it a little more Pythonic rather than mirroring the C
> > API, in both cases by hiding implementation details that the casual user
> > doesn't need to know about.
> > 
> 
> Further to this, and recalling our discussions on tool changes, it would
> be great if the Python API supported identification of line by name, not
> just (chip,offset).
> 
> e.g.
>     with gpiod.request_lines(
>         lines=("GPIO17", "GPIO18"),
>         edge_detection=Edge.BOTH,
>     ) as request:
>         for event in request.edge_events():
>             print(event)
> 
> with the returned event extended to contain the line name if the line
> was identified by name in request_lines().
> 
> The lines kwarg replaces offsets, and could contain names (strings) or
> offsets (integers), or a combination.  If any offsets are present then
> the chip path kwarg must also be provided.  If the chip isn't provided,
> request_lines() would find the corresponding chip based on the line name.

From Python programmer perspective it's a good idea, but from GPIO (ABI)
perspective, it may be confusing. Line name is not unique (globally) and
basically not a part of ABI.

-- 
With Best Regards,
Andy Shevchenko


