Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BFA1267EF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfLSRYS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:24:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:46048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726866AbfLSRYR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 12:24:17 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88D95227BF;
        Thu, 19 Dec 2019 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576776257;
        bh=Yc0dVxNqw4LEl2NuvNZOlnPXns4Hras9ntdGRuPQr+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B2/HMkbIMtPZL6hs4lEzVOIG4SnjS3h6bB2xyyx1Rsr2sWTj1+XZR1BUIFDN9panN
         RK8gRw67tNhvucPNv8CT+mr4sJWVk/nZma4jF10eEu2/nDOcNM76yBeWHf19Nfond1
         AiWB3F31SfFfdqlwlK/PxBS14TxhkTi0hiBqaev8=
Date:   Thu, 19 Dec 2019 18:24:14 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
Message-ID: <20191219172414.GA2094615@kroah.com>
References: <20191219171528.6348-1-brgl@bgdev.pl>
 <20191219171528.6348-13-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219171528.6348-13-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 06:15:27PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
> 
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
> 
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c    | 191 ++++++++++++++++++++++++++++++++++++--
>  drivers/gpio/gpiolib.h    |   1 +
>  include/uapi/linux/gpio.h |  24 +++++
>  tools/gpio/gpio-watch     | Bin 0 -> 26528 bytes

Did you mean for this binary file to be checked in?

