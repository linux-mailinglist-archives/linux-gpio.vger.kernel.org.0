Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545BD601415
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiJQQzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiJQQzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:55:51 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440245F7E9
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666025750; x=1697561750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b4xrKAS2Wbd8B+088D/j5yUrr6OL+f0p8DHhMISKdGI=;
  b=hT9hvshP+PqoTGwhZW3TWgxecPWydSnRnNBYaas2tUBQylcx+zqs1wgT
   v2WrDW5801YCso5SNyQ6j5jf1UO8//Vpr3my24+vaUZhrgvmyUag47O6G
   ZLeeuaLJCMtFsyuEdX/tWDmCTHASVXcRGz3EDk0ZzWyTMGi7enI17U6R/
   2JoESWJLJLQncYp+0omqm1kg3lxIe9iQF6TJ3RtcQf0NwBjWrtXriXmai
   w31EXxdULPn5D+phdK6mSNmGbreDL9D1JCdos22uBychgG1WHij8m3MVT
   b+WfA5dUPlm10dOKsms6sTx3hdvNMia6PhvenhL6n8kzykxG3CBznV4DZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285579004"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="285579004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 09:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579442464"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="579442464"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2022 09:55:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okTOv-008vgb-1O;
        Mon, 17 Oct 2022 19:55:41 +0300
Date:   Mon, 17 Oct 2022 19:55:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y02JDbeZbPJ6VftG@smile.fi.intel.com>
References: <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
 <Y01+JhOMc53Dhps1@sol>
 <Y02Awqv4w3oC1Yib@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02Awqv4w3oC1Yib@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 12:20:18AM +0800, Kent Gibson wrote:
> On Tue, Oct 18, 2022 at 12:09:10AM +0800, Kent Gibson wrote:

...

> Oh, btw, the parser fn version would be something like:
> 
> def parse_value(arg):
>      (x,y) = arg.split("=")
>      return (x, Value(int(y)))

Not a lisp, no need for too many parentheses. Also, we could use splices:

	eqidx = arg.index('=')
	return arg[:eqidx], Value(int(arg[eqidx + 1:]))

or with split()

	l, v = arg.split('=')
	return l, Value(int(v))

> lvs = [ parse_value(arg) for arg in sys.argv[2:]

Dunno why you put spaces inside outer [], but okay.

> Is that clearer?

-- 
With Best Regards,
Andy Shevchenko


