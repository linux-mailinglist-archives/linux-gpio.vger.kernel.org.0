Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2999454301B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jun 2022 14:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238990AbiFHMSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jun 2022 08:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238907AbiFHMSs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2022 08:18:48 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFEA31D0F8
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jun 2022 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654690726; x=1686226726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgEfsavkaVZ1jujjBqC5Hlr32N7n5iagZtHKoMUNwwQ=;
  b=N3W6+rMjaUhbb2w8kTkKnunJkG9HlJ+6WoXClNTKiOXxS9DgQ9DMkjEv
   28H4HdBPLMy7EhWAk2N6eK29tcG9kMSHNV7oj4Lgi+UY08ZqdN8ytpZNb
   i+HQqJJ4xJmWDG+sVN+SVvXSSqriLDBBJbMJ3CAdoPgZ7Bbg+lHEKPcvi
   PCnie3ZicBqhqZyZ/7jm+eqzIPSl4bpnepx7+kLZyjYmyXQvuJlFgQRB9
   65SV8wjpLj+1dUApymownKNZSiWFmzx7dT9s4o/5dBPF5BPERGJE2hZQe
   gg6CJDNbJF+wGzJglqTUspYUiFzEKvYauifnAKgF6IaZI6jA8Q2BWlc9y
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="338663811"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="338663811"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 05:18:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="759450771"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 05:18:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nyue1-000Wui-5f;
        Wed, 08 Jun 2022 15:18:41 +0300
Date:   Wed, 8 Jun 2022 15:18:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.19-2
Message-ID: <YqCToAlhcjNNS+67@smile.fi.intel.com>
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

Hi Linux GPIO  maintainers,

Converting IRQ chip to be immutable in Intel GPIO drivers, this is for current,
i.e. v5.19-rcX, cycle. Please pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.19-2

for you to fetch changes up to b93a8b2c5161696e732185311d309e0aaf0575be:

  gpio: dln2: make irq_chip immutable (2022-06-06 14:09:16 +0300)

----------------------------------------------------------------
intel-gpio for v5.19-2

* Convert IRQ chips in Diolan and Intel GPIO drivers to be immutable

The following is an automated git shortlog grouped by driver:

crystalcove:
 -  Join function declarations and long lines
 -  Use specific type and API for IRQ number
 -  make irq_chip immutable

dln2:
 -  make irq_chip immutable

merrifield:
 -  make irq_chip immutable

sch:
 -  make irq_chip immutable

wcove:
 -  make irq_chip immutable

----------------------------------------------------------------
Andy Shevchenko (7):
      gpio: crystalcove: make irq_chip immutable
      gpio: crystalcove: Use specific type and API for IRQ number
      gpio: crystalcove: Join function declarations and long lines
      gpio: wcove: make irq_chip immutable
      gpio: merrifield: make irq_chip immutable
      gpio: sch: make irq_chip immutable
      gpio: dln2: make irq_chip immutable

 drivers/gpio/gpio-crystalcove.c | 70 ++++++++++++++++++++++-------------------
 drivers/gpio/gpio-dln2.c        | 23 ++++++++------
 drivers/gpio/gpio-merrifield.c  | 22 ++++++++-----
 drivers/gpio/gpio-sch.c         | 35 +++++++++++++--------
 drivers/gpio/gpio-wcove.c       | 10 ++++--
 5 files changed, 96 insertions(+), 64 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


