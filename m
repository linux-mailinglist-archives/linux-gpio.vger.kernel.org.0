Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109E3624B8E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 21:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbiKJURS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 15:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiKJURP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 15:17:15 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E3754B2A
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 12:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668111434; x=1699647434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YK0O2Nj5JAnbaAWLPGAi/EnfLKpRs+oaqYxz0LJZalo=;
  b=E7oHUFK/1mOFbfit+cm1F4GSqeM8UEDo8Lx2izlsmBhNzwWV0prz/2hE
   J/k8AtPKHm2SWphOt9tEVTHTUoKgeIyrjMBLe15F8Q9X8j67QBZUrzhby
   E69v8A22Qbgs38o3dmrM5QlcEeNjBijkPQJy1gwUP3QALzut3RECLeiGn
   p7/LgWq26Npo80Pqj267x3wCPmCE4SBcq5eK/jy4NUP4JzuS4LLWDFSQp
   v6kfekLXlILAypsMqdHYmIQ4QtGKrjQIdR5lUoVYO+AiMavIyXfsGE7mN
   A/MF96CbRTVbw5mma85xjL8cgdtHEwPi983u27vpPm+mb7amtoDjK+No3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397730146"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="397730146"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 12:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="615243185"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="615243185"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2022 12:17:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1otDz4-00AKMi-1r;
        Thu, 10 Nov 2022 22:17:10 +0200
Date:   Thu, 10 Nov 2022 22:17:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 2/3] pinconf-generic: add pull up and pull down
 config with resistance
Message-ID: <Y21cRkOwH/pmn5NP@smile.fi.intel.com>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
 <20221110191258.1134378-3-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110191258.1134378-3-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 07:12:57PM +0000, Niyas Sait wrote:
> pin configuration types have been extended to include a pull up
> and pull down config with resistance in ohms.

Why do we need this?

-- 
With Best Regards,
Andy Shevchenko


