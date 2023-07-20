Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D16275A9F0
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjGTI5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjGTImp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:42:45 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC68C268F
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689842564; x=1721378564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P3AvjhB6MyoXfooexG8yXL81KcfaezGLcahB96hmSRY=;
  b=BrgtLxiAW4fyTVPT6KYcm9aQifHcRAnBDUCjn2z3VGMcX67RM4N2iF8J
   A32cIXCxvSkxxQAJlVVq+Q/0SgahkPdd6Imszsj6+kUeruNetX36qyJhr
   Mj2o8JCU8Mwze6m5uazc6lYZPAbvE0AQLELhNgHyEIuUt0CHwRpgVZpz5
   ss8GkSMiIlyy85XfUp3K69Z1dBv/VyMbu3UhV4RkxRG5Z9zl0wj3do1TJ
   BYEZp1mttUiGjMWkvfZ4sNxXZ/VsvZSZHv0mZmrR7gUX0k8Sjp8/PHtFk
   0KkgY2hiQ4qX/OvePCDiYG9kCsGnhpH9xR80x7oDF2WtPP3Uh5e1EXXl9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="453049919"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="453049919"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 01:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="814450439"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="814450439"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 01:42:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qMPFB-00Gutv-0o;
        Thu, 20 Jul 2023 11:42:41 +0300
Date:   Thu, 20 Jul 2023 11:42:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLjzgYzUG8dhKnyH@smile.fi.intel.com>
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 5:27 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> as it would be the one allowing the caller to reopen the same chip.

Since you do not control the lifetime of the files, the above may not be
guaranteed. So, this path is just an arbitrary information from the past.
It _was_ consistent with the request, but it does _not_ mean it still is.

I would rely on the chip name, which is provided by the DT/driver, if
possible.

-- 
With Best Regards,
Andy Shevchenko


