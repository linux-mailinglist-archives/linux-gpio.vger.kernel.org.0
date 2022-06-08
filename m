Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58749543023
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jun 2022 14:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238822AbiFHMVg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jun 2022 08:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiFHMVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2022 08:21:35 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2ABE169E33
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jun 2022 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654690894; x=1686226894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KLlUTFXPzLaUOI8aYwILjGuDa7R4ZcQ2X1Cj6jiWyc=;
  b=FcDBQKDSfbWtFKrW2I0v688fYyfNsLCRiXq4nftuGduguQDt/pmILDz3
   XRIvMKSmtOnCbH3SZYZnDBZ2nmtidhjNd2wL2CQLq+pz7ZNhotItnnaCI
   U7tP71Zmlq4pOQs02t1cV/BmIYswB8KnmzcHWJcOxqkHTBEns54hcyVb1
   s/wIqaLW9E6XhWgPf0Vb6wCKQ0WZxjmbsjuLsELu27vfB1c9jq5+fNeEx
   ZR0WWIPTZK9FKxkKWXjTqVUdAgHCBNJhHGfN+AoCk1A93T3IyNL4PqAHT
   v8GufuLLGVL/Y6YUyfXpPSl4AsZCRZ0Tggfty1ZSWqOiTxOz7kubBxnxd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363207334"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="363207334"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 05:21:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="670525767"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 05:21:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nyugk-000WzX-FV;
        Wed, 08 Jun 2022 15:21:30 +0300
Date:   Wed, 8 Jun 2022 15:21:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.19-3
Message-ID: <YqCUSuvCamkqPpMn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

MAINTAINERS database fix, please pull for v5.19-rcX, i.e. current cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.19-3

for you to fetch changes up to ba79c5e45eecb9e009eca7f5da224f6e42bd4fcb:

  MAINTAINERS: Update Intel pin control to Supported (2022-06-06 12:34:54 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.19-3

* Update a record in the MAINTAINERS database for Intel pin control drivers

The following is an automated git shortlog grouped by driver:

MAINTAINERS:
 -  Update Intel pin control to Supported

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Update Intel pin control to Supported

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


