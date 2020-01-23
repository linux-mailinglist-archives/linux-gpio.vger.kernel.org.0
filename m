Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F83146BC8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgAWOvI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:51:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:52212 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729009AbgAWOvH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jan 2020 09:51:07 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 06:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; 
   d="scan'208";a="221532042"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2020 06:50:58 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iudow-0004I4-J5; Thu, 23 Jan 2020 16:50:58 +0200
Date:   Thu, 23 Jan 2020 16:50:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Stefani Seibold <stefani@seibold.net>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND PATCH v5 0/7] gpiolib: add an ioctl() for monitoring
 line status changes
Message-ID: <20200123145058.GW32742@smile.fi.intel.com>
References: <20200123140506.29275-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123140506.29275-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 23, 2020 at 03:04:59PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Resending with some people who could ack kfifo patches in copy.

Haven't you got Ack from Stefani [1]?

[1]: https://lkml.org/lkml/2020/1/7/514

> 
> ===
> 
> When discussing the recent user-space changes with Kent and while working
> on dbus API for libgpiod I noticed that we really don't have any way of
> keeping the line info synchronized between the kernel and user-space
> processes. We can of course periodically re-read the line information or
> even do it every time we want to read a property but this isn't optimal.
> 
> This series adds a new ioctl() that allows user-space to set up a watch on
> the GPIO chardev file-descriptor which can then be polled for events
> emitted by the kernel when the line is requested, released or its status
> changed. This of course doesn't require the line to be requested. Multiple
> user-space processes can watch the same lines.
> 
> This series also includes a variety of minor tweaks & fixes for problems
> discovered during development. For instance it addresses a race-condition
> in current line event fifo.
> 
> First two patches add new helpers to kfifo, that are used in the later
> parts of the series.
> 
> v1: https://lkml.org/lkml/2019/11/27/327
> 
> v1 -> v2:
> - rework the main patch of the series: re-use the existing file-descriptor
>   associated with an open character device
> - add a patch adding a debug message when the line event kfifo is full and
>   we're discarding another event
> - rework the locking mechanism for lineevent kfifo: reuse the spinlock
>   from the waitqueue structure
> - other minor changes
> 
> v2 -> v3:
> - added patches providing new implementation for some kfifo macros
> - fixed a regression in the patch reworking the line event fifo: reading
>   multiple events is now still possible
> - reworked the structure for new ioctl: it's now padded such that there
>   be no alignment issues if running a 64-bit kernel on 32-bit userspace
> - fixed a bug where one process could disable the status watch of another
> - use kstrtoul() instead of atoi() in gpio-watch for string validation
> 
> v3 -> v4:
> - removed a binary file checked in by mistake
> - drop __func__ from debug messages
> - restructure the code in the notifier call
> - add comments about the alignment of the new uAPI structure
> - remove a stray new line that doesn't belong in this series
> - tested the series on 32-bit user-space with 64-bit kernel
> 
> v4 -> v5:
> - dropped patches already merged upstream
> - collected review tags
> 
> Bartosz Golaszewski (7):
>   kfifo: provide noirqsave variants of spinlocked in and out helpers
>   kfifo: provide kfifo_is_empty_spinlocked()
>   gpiolib: rework the locking mechanism for lineevent kfifo
>   gpiolib: emit a debug message when adding events to a full kfifo
>   gpiolib: provide a dedicated function for setting lineinfo
>   gpiolib: add new ioctl() for monitoring changes in line info
>   tools: gpio: implement gpio-watch
> 
>  drivers/gpio/gpiolib.c    | 351 +++++++++++++++++++++++++++++---------
>  drivers/gpio/gpiolib.h    |   1 +
>  include/linux/kfifo.h     |  73 ++++++++
>  include/uapi/linux/gpio.h |  30 ++++
>  tools/gpio/.gitignore     |   1 +
>  tools/gpio/Build          |   1 +
>  tools/gpio/Makefile       |  11 +-
>  tools/gpio/gpio-watch.c   |  99 +++++++++++
>  8 files changed, 486 insertions(+), 81 deletions(-)
>  create mode 100644 tools/gpio/gpio-watch.c
> 
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko


