Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C498D44C57A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 17:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhKJQ6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 11:58:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:15090 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231577AbhKJQ6u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 11:58:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="232658411"
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; 
   d="scan'208";a="232658411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 08:55:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; 
   d="scan'208";a="669868873"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 08:55:07 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 10 Nov 2021 18:55:05 +0200
Date:   Wed, 10 Nov 2021 18:55:05 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] gpiolib: acpi: shrink
 devm_acpi_dev_add_driver_gpios()
Message-ID: <YYv5ab2Xlqae7ExC@lahna>
References: <20211110134743.4300-1-andriy.shevchenko@linux.intel.com>
 <20211110134743.4300-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110134743.4300-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 03:47:43PM +0200, Andy Shevchenko wrote:
> If all we want to manage is a single pointer, there's no need to
> manually allocate and add a new devres. We can simply use
> devm_add_action_or_reset() and shrink the code by a good bit.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
