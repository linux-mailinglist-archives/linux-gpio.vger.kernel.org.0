Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AC633393C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 10:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhCJJwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 04:52:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:35370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231228AbhCJJv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 04:51:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 928B164ECC;
        Wed, 10 Mar 2021 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615369917;
        bh=8DjF5hfDNu9Ysuqn+EdjT0WOEZ0r4ECqcdJNt0wrATk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YsVqzMy1ltRkkHvbVcCwsXf7qwPFggnzCiy43Iclfcss1aj/o+Ou2ZOibSBf6yfWw
         dIXe4aVnqb4pjTh1p9QS8OOvr01lveHYvf8jLgWxNFL7q5WzbCTIyFCs9lKFsiVmYz
         Qd31KKB3tbjNR9Am4ATXnIMKKuW1L/cS++Y9Arp8=
Date:   Wed, 10 Mar 2021 10:51:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 00/11] gpio: implement the configfs testing module
Message-ID: <YEiWulEyDgr7pvZ2@kroah.com>
References: <20210309205921.15992-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 09, 2021 at 09:59:10PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series adds a new GPIO testing module based on configfs committable items
> and sysfs. The goal is to provide a testing driver that will be configurable
> at runtime (won't need module reload) and easily extensible. The control over
> the attributes is also much more fine-grained than in gpio-mockup.
> 
> This series also contains a respin of the patches I sent separately to the
> configfs maintainers - these patches implement the concept of committable
> items that was well defined for a long time but never actually completed.
> 
> Apart from the new driver itself, its selftests and the configfs patches, this
> series contains some changes to the bitmap API - most importantly: it adds
> devres managed variants of bitmap_alloc() and bitmap_zalloc().
> 
> v1 -> v2:
> - add selftests for gpio-sim
> - add helper programs for selftests
> - update the configfs rename callback to work with the new API introduced in
>   v5.11
> - fix a missing quote in the documentation
> - use !! whenever using bits operation that are required to return 0 or 1
> - use provided bitmap API instead of reimplementing copy or fill operations
> - fix a deadlock in gpio_sim_direction_output()
> - add new read-only configfs attributes for mapping of configfs items to GPIO
>   device names
> - and address other minor issues pointed out in reviews of v1
> 
> v2 -> v3:
> - use devm_bitmap_alloc() instead of the zalloc variant if we're initializing
>   the bitmap with 1s
> - drop the patch exporting device_is_bound()
> - don't return -ENODEV from dev_nam and chip_name configfs attributes, return
>   a string indicating that the device is not available yet ('n/a')
> - fix indentation where it makes sense
> - don't protect IDA functions which use their own locking and where it's not
>   needed
> - use kmemdup() instead of kzalloc() + memcpy()
> - collected review tags
> - minor coding style fixes

Thanks for dropping the device_is_bound() stuff, looks sane to me.

greg k-h
