Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928625B8606
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 12:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiINKN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 06:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiINKN0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 06:13:26 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D840D21267
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663150405; x=1694686405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0XhXhimbVkTYIKDHstiot2PhUoireYLQ75qQdnjAlxA=;
  b=d5XGsH2lom0+7aHkzgfheOVf96cqzgWpQyoWxg42XOS8Kec+6Q5w497+
   GMUB0bI5kCz+xHPJPDGYHdurUZIxS5pFtkyqVYSyOzMPYNKkInld1nXji
   nWfrksJKeZhgIUSIvqGPXJ9zVq/uTDpebBL4M3jPMXOHMvwpXmPiJYE4w
   uLyt5MGdvED4OMJn4VNyX9DWsZJJf0gQmHK79p2igZsNGio9GwXLNI0Wn
   Csdi3VBL0y4gjyIRBVbvs10efhSa0Y5Y6MAwwq6roM9KjqLBML/HFtvSg
   8EhTvW+aVxU+4wMYICTkUF0jjVO1bVHNmshW5Y14nVbS62GQMUxbp4uav
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281424191"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="281424191"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 03:13:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="647333894"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 03:13:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oYPOT-0029H9-0t;
        Wed, 14 Sep 2022 13:13:21 +0300
Date:   Wed, 14 Sep 2022 13:13:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2] treewide: rework line configuration
Message-ID: <YyGpQedIKMRg8IVA@smile.fi.intel.com>
References: <20220913161407.63472-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913161407.63472-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 06:14:07PM +0200, Bartosz Golaszewski wrote:
> This tries to get rid of the concept of defaults and overrides for line
> properties from the library (or rather hide them from the users). While
> this makes the C API a bit more complex, it allows for a more elegant
> high-level interface.
> 
> This patch is pretty big but I'll just give an overview here. I don't
> expect a detailed review of every line.
> 
> Low-level data structure model (as seen in the C API):
> 
> We're adding a new structure - line_settings. It's a basic data class
> that stores a set of line properties. The line_config object is simplified
> and becomes a storage for the mappings between offsets and line_settings.
> 
> We no longer require the user to store the offsets array in the
> request_config. The offsets to request are simply those for which the
> user explicitly added settings to the line_config. Subsequently, the
> request_config structure becomes optional for the request.
> 
> In C++ bindings this allows us to implement an elegant interface with
> rust-like chained mutators. To that end, we're also introducing a new
> intermediate class called request_builder that's returned by the chip's
> prepare_request() method which exposes routines for storing the line
> and request configs for the request we're making. For examples of
> usage - see C++ tests and samples.

It's a huge change and my knowledge of C++ is a bare minimum from dozen of
years ago, can you point out to the file with an example how this APIs (which
are suggested by a new code) look like for developer in practice? Some test
cases or simple example? This can help to understand the prettiness of the
API.

-- 
With Best Regards,
Andy Shevchenko


