Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D745760141F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJQQ5l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJQQ5k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:57:40 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17D35F23D
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666025859; x=1697561859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPIOnJ19//Gx1SeB5b8IPuMSfi4XRu9v5r8ZmVBRzl4=;
  b=H99NXW0Y4YNa77OoZjkLlhvnZwEH0GerLXWmRct5+hha0zRe+9vCyFr3
   O09j1yONi8JsT/eLy6HfBoJWYHQy0ffsYsCdOoJjrinc3A07qsdSZCP6I
   xaYk5a7R92J+FrOIfXA9qjxGPWzMMLmif/CMmE0rjf70gyoCRZm8layZ6
   9zEExcBAxdvverB0+3p/d3JjOsOZO4C4sem0CBGN5pMjPoC0Os5K2P6r3
   EktTF2jPDaXe2/T5Htl4XQJdAE5c6vn8cd2Zl2zHmzridIfOt26Voig/q
   sbFtyWxuHq8l0X6Ss/TKXXAnUkahQUD3Pzm/Q5NE0cOd8a4PbdPK5U2dy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286249708"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="286249708"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 09:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="691435374"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="691435374"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2022 09:57:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okTQm-008vjL-1m;
        Mon, 17 Oct 2022 19:57:36 +0300
Date:   Mon, 17 Oct 2022 19:57:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y02JgEXQyjNryfkF@smile.fi.intel.com>
References: <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
 <Y01+JhOMc53Dhps1@sol>
 <Y02Awqv4w3oC1Yib@sol>
 <Y02JDbeZbPJ6VftG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02JDbeZbPJ6VftG@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 07:55:41PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 18, 2022 at 12:20:18AM +0800, Kent Gibson wrote:
> > On Tue, Oct 18, 2022 at 12:09:10AM +0800, Kent Gibson wrote:

...

> > Oh, btw, the parser fn version would be something like:
> > 
> > def parse_value(arg):
> >      (x,y) = arg.split("=")
> >      return (x, Value(int(y)))
> 
> Not a lisp, no need for too many parentheses. Also, we could use splices:
> 
> 	eqidx = arg.index('=')
> 	return arg[:eqidx], Value(int(arg[eqidx + 1:]))
> 
> or with split()
> 
> 	l, v = arg.split('=')
> 	return l, Value(int(v))
> 
> > lvs = [ parse_value(arg) for arg in sys.argv[2:]
> 
> Dunno why you put spaces inside outer [], but okay.

and this actually can be directly put to the dict constructor:

	values = OrderedDict(parse_value(arg) for arg in sys.argv[2:])

This looks short enough and readable.

-- 
With Best Regards,
Andy Shevchenko


