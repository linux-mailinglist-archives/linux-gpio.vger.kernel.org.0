Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE9F33AFCA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 11:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhCOKQq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 06:16:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:14241 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229772AbhCOKQc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 06:16:32 -0400
IronPort-SDR: f8wtgg8Jt7dm7zVHZfCcHfhOQNVrHvua5zZgAXe0F8OX0rBaBFBb+VUvxvGaLYTQMIY6U7DHZo
 OEoxMqReL4ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="274106523"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="274106523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 03:16:31 -0700
IronPort-SDR: CnWuOi8amMBycx0Vxpin37vx5cILfhLTUswCWGPN1pLcp0upQvxUxuYG6eJzsm+pIuZlE6mnPG
 QN3zH7GQCAcg==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="522106603"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 03:16:29 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lLkGw-00CeEm-RJ; Mon, 15 Mar 2021 12:16:26 +0200
Date:   Mon, 15 Mar 2021 12:16:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YE8z+ohM9abBs9SD@smile.fi.intel.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> Unfortunately while this may fix the particular use-case on STM32, it
> breaks all other users as the 'gpio-line-names' property doesn't live
> on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> 
> How about we first look for this property on the latter and only if
> it's not present descend down to the former fwnode?

Oops, I have tested on x86 and it worked the same way.

Lemme check this, but I think the issue rather in ordering when we apply fwnode
to the newly created device and when we actually retrieve gpio-line-names
property.

-- 
With Best Regards,
Andy Shevchenko


