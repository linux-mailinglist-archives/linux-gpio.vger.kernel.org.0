Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D912073DCB8
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 13:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjFZLCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 07:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjFZLC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 07:02:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E96E2723;
        Mon, 26 Jun 2023 04:02:01 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447624778"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="447624778"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="786114085"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="786114085"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2023 04:01:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qDjye-006juo-0N;
        Mon, 26 Jun 2023 14:01:48 +0300
Date:   Mon, 26 Jun 2023 14:01:47 +0300
From:   "andy@kernel.org" <andy@kernel.org>
To:     YE Chengfeng <cyeaa@connect.ust.hk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] gpiolib: cdev: Fix &lr->wait.lock deadlock issue
Message-ID: <ZJlwG4zzmm4ArMNX@smile.fi.intel.com>
References: <TYCP286MB1188A94580A60F47CAF892C88A26A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB1188A94580A60F47CAF892C88A26A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 26, 2023 at 10:39:56AM +0000, YE Chengfeng wrote:
> linereq_put_event is called from both interrupt context (e.g.,
> edge_irq_thread) and process context (process_hw_ts_thread).
> Therefore, interrupt should be disabled before acquiring lock
> &lr->wait.lock inside linereq_put_event to avoid deadlock when
> the lock is held in process context and edge_irq_thread comes.
> 
> Similarly, linereq_read_unlocked running in process context
> also acquies the same lock. It also need to disable interrupt
> otherwise deadlock could happen if the irq edge_irq_thread
> comes to execution while the lock is held.
> 
> Fix the two potential deadlock issues by spin_lock_bh() and
> spin_lock_irq() separately.

Side note: You have two patches in something that seems to be the series,
but lacks the references in email headers. Whenever you send a series,
do not forget to add --thread to `git send-email`.

-- 
With Best Regards,
Andy Shevchenko


