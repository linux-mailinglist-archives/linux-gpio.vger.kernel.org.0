Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0124C3C6CC4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 11:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhGMJCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 05:02:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:50724 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234121AbhGMJCv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Jul 2021 05:02:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210171049"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="210171049"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 01:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="429975769"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2021 01:59:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 27E64FF; Tue, 13 Jul 2021 12:00:21 +0300 (EEST)
Date:   Tue, 13 Jul 2021 12:00:21 +0300
From:   Andy Shevchenko <andy@black.fi.intel.com>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, bjorn@helgaas.com, andy@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        rjw@rjwysocki.net, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
Message-ID: <YO1WJcxn2uKSpsM4@black.fi.intel.com>
References: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 02, 2020 at 09:20:58PM +0530, Vaibhav Gupta wrote:
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.

Pushed to my review and testing queue with some amendments, thanks!

-- 
With Best Regards,
Andy Shevchenko


