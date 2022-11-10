Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADDD6238C9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 02:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiKJB0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 20:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiKJB0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 20:26:43 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8C523EBB
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 17:26:42 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 78so280738pgb.13
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 17:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RtWgMCJZnGoeth0dnFIK+hifnxRTemqPqR+TqZRVVw=;
        b=QXVunuPjw+pfc0rUzT25y927sbh0VC0eIQWSXZcxN2MjV0xMecxUvMUXxz0Ydngzax
         +GrDBYuXghYi+0atH0Wov7jC0IuNQmsTGpxj9O0A3xmwqVG0+w0ZFuHk24NxSZdGIrGQ
         wgoD2AnrRrHfkVcA7+uJ8lEnV53LwcRU/g3zvQZ9EGrXfLLK/rXuE+e4AEE0qBhnKBOH
         kLkwSdLhV1PWFcD4jzoEglS/OR415MsAf+AE+edvC+i3avaXIgy38tBXv2huC33vyPHX
         7SbUMkbfeltEBKamscva5bIDenZXvRqgwkm0ZiBal2kg+cN3m9mDgN3P9v6Y+1z51pxM
         umzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RtWgMCJZnGoeth0dnFIK+hifnxRTemqPqR+TqZRVVw=;
        b=6ZoKLrPyj+OqDThn5xoo81DbiaacPbWbtPT+XsfY6k0JQx7adVwhrbBbim8oppkvkr
         RenHPUadcWSVHq3/RpixqRlpJQb5fsTAIbF+VXFBXnqmKNOfk93in7GS1HvupajlKfAi
         5ZU8vaPCrG1VfPg+UrUw5HMBf0klixDth1WcI50IEQNY1ozXLlRt7tGfBFCdVBoEYYHM
         oJia+dNZv42hCKDlLDdqPEcZlfufSAkYlj8IeRWFep1AwTQDz3fHhIQG0vRh31+OUKH+
         INXTKgD2kM4Hjw7e5v64Ib7icQINvE8FIHNHfQuwu9SA6VsYgvch7EAd0WVg51AI0Ofd
         KbTg==
X-Gm-Message-State: ACrzQf2dl7AgbFyPtF6FmANj3RaQAeqZXUonazDElTC5otJt79tF4BNH
        hlWYLt678G3emfspZL6sHvs=
X-Google-Smtp-Source: AMsMyM6LmYGpfzHdKfEItQ3yW6SE64zpTpVoFl/EcNBmDoB71ZIHiF33cimW9rRDTkFptIsez43h3A==
X-Received: by 2002:a63:ec02:0:b0:46f:a989:ad72 with SMTP id j2-20020a63ec02000000b0046fa989ad72mr1463804pgh.430.1668043602173;
        Wed, 09 Nov 2022 17:26:42 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id y13-20020aa78f2d000000b0056babe4fb8asm8833574pfr.49.2022.11.09.17.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 17:26:41 -0800 (PST)
Date:   Thu, 10 Nov 2022 09:26:35 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        linus.walleij@linaro.org, brgl@bgdev.pl, linux@roeck-us.net,
        linux-gpio@vger.kernel.org, liwei391@huawei.com, yuancan@huawei.com
Subject: Re: [PATCH v2] gpiolib: fix memory leak in gpiochip_setup_dev
Message-ID: <Y2xTSyce8WfLdtge@sol>
References: <Y2ttmcV+PFDUZR3l@sol>
 <20221109093120.3128541-1-zengheng4@huawei.com>
 <Y2u9bLIohQ8eFTY1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2u9bLIohQ8eFTY1@smile.fi.intel.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 04:47:08PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 09, 2022 at 05:31:20PM +0800, Zeng Heng wrote:
> > gcdev_register & gcdev_unregister call device_add & device_del to
> > request/release source. But in device_add, the dev->p allocated by
> > device_private_init is not released by device_del.
> 
> First of all, we refer to the functions like func().
> 

Further to this, the description of the problem could be clearer -
it would be helpful to indicate the code path that triggers the problem
- it is gpiochip_sysfs_register() returning an error?

> > So when calling gcdev_unregister to release gdev, it needs put_device
> > to release dev in the following.
> > 
> > Otherwise, kmemleak would report memory leak such as below:
> > 
> > unreferenced object 0xffff88810b406400 (size 512):
> >   comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
> >     ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
> >   backtrace:
> 
> Second, read Submitting Patches on how to provide your backtraces in the
> message body.
> 
> >     [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
> >     [<0000000045fe2058>] device_add+0xb34/0x1130
> >     [<00000000d778b45f>] cdev_device_add+0x83/0xe0
> >     [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
> >     [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
> >     [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
> >     [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
> >     [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
> >     [<000000005b5ef2d4>] spi_probe+0xe1/0x140
> >     [<000000002b26f6f1>] really_probe+0x17c/0x3f0
> >     [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
> >     [<000000005ca60d2a>] device_driver_attach+0x34/0x80
> >     [<00000000e9db90db>] bind_store+0x10b/0x1a0
> >     [<00000000e2650f8a>] drv_attr_store+0x49/0x70
> >     [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
> >     [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0
> > 
> > unreferenced object 0xffff888100de9800 (size 512):
> >   comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
> >   hex dump (first 32 bytes):
> >     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
> >     ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
> >   backtrace:
> >     [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
> >     [<00000000eeb06124>] device_add+0xb34/0x1130
> >     [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
> >     [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
> >     [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
> >     [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
> >     [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
> >     [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
> >     [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
> >     [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
> >     [<000000003f428602>] device_driver_attach+0x34/0x80
> >     [<0000000040e91a1b>] bind_store+0x10b/0x1a0
> >     [<00000000c1d990b9>] drv_attr_store+0x49/0x70
> >     [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
> >     [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
> >     [<00000000026ce093>] vfs_write+0x658/0x810
> > 
> > Because at the point of gpiochip_setup_dev here, where dev.release
> > does not set yet, calling put_device would cause the warning of
> > no release function and double-free in the following fault handler
> > route (when kfree dev_name). So directly calling kfree to release
> > dev->p here in case of memory leak.
> 

Again, this could be clearer.  The dev->p is normally freed by
device_release() - why is that not happening in this case?
(as put_device() is never called in this path)

The double free you see if you do call put_device() appears to be due to
different expectations as to the cleanup that gpiochip_setup_dev() will
perform on error, depending on where it is called. gpiochip_setup_devs()
assumes any cleanup is performed by gpiochip_setup_dev(), while
gpiochip_add_data_with_key() assumes that it hasn't performed any cleanup.

Having gpiochip_setup_dev() perform its own cleanup makes the most sense
to me, so gpiochip_add_data_with_key() should be changed to allow for
that.

> ...
> 
> > @@ -539,6 +539,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
> >  
> >  err_remove_device:
> >  	gcdev_unregister(gdev);
> > +	kfree(gdev->dev.p);
> >  	return ret;
> 
> Third, I do not believe it's a correct fix.
> Have you read comments around device_del() / etc.?
> 

I agree - this is not the correct fix.  The correct fix is to trigger the
normal cleanup mechanism, so put_device().
The fact that that triggers a warning:

"Device '%s' does not have a release() function, it is broken and must be
fixed. See Documentation/core-api/kobject.rst.\n"

is an indicator that dev.release should be set earlier.
If gpiodevice_release() is not appropriate, or cannot be modified to deal
with the device state at that point, then an appropriate interim release
function should be set.

And, as mentioned above, gpiochip_add_data_with_key() needs to be modified
to allow for gpiochip_setup_dev() cleaning up its own mess.

That is my take, but that is just from perusing the code so I may be
totally off base.  Either way, an ACK/NACK on this from a maintainer or
other gpiolib expert would be helpful to expiditing a solution.

Cheers,
Kent.

