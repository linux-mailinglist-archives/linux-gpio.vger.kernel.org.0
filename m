Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40A362235A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 06:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKIFMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 00:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKIFML (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 00:12:11 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E2318E27
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 21:12:08 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id s196so15274546pgs.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 21:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6hvxPs0UbUcZk/uCodx6qvW1KP+soef9EQKNEsyzxY=;
        b=mKNDA8To50lRUECCsYWlYaz2bOpIAVy4LWsBfnvuHWhqePq2sbG8xz4bxUwNsQC3Wa
         mVPaypwh7NRsVa2pbzEDJ2bYrbTwI+q8ByLkhNH1fglw7y/4ww8sBi4ajFw+D2ySAbMN
         ak/+nfewZPHmdsR901wZYPMKELKPstDg2Yeunc9PznxsyBP/yMBETDbwt+ExqWrTkqpw
         Axip9EH39hFmaU46mTjLun4+VE/RDS9rveBOGX1RsSt2nFQlWhS32K8FVPZsAAnlSeS7
         izhr4/+gbSpz6kdHcAgmC/c4PJ/2RBgICOHvwrXTZooo+LxTwKITlNNGJlY1zgG4WtNg
         ZYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6hvxPs0UbUcZk/uCodx6qvW1KP+soef9EQKNEsyzxY=;
        b=sazk2lVBODV7ljSx5s+yoTXolfCBFIIiDK+QNLlzUu5iHtb2yy6DqVn7wQxXmeuCrO
         h9SAflon6XTn4S19Jop05gpNX6ZEJti9vy8DMO2gsd3vwE9TP242ZYZ/AesQzPPxNlmX
         zUksswS+r/ZNxkO9GE+UIQQeEMfx85Qcmn7SlW3V0MA76rVCXquEZhcSREnQ6dUDoQ6G
         NuPp0jZEYllR2hl9Tyrod9oyI31PTqJre8ZbqYrpeqJZuCGkJhDRwMJ+q0caf5DnxC5a
         HK7EezQNOeRf+5F4uSiVBhs8+udBwQ8WOwy4L36aogac166/SNvhql0zgEodSTZNiPT8
         sAMw==
X-Gm-Message-State: ACrzQf2H/iRjbMz/DM/gebcekXXgLG77DLULFF/iC4toegaxp+9UmG6c
        VzTynnVEky8MEAdWgt2kQM3RLcA20z8=
X-Google-Smtp-Source: AMsMyM6wM8sJz1t4knLwhL99jrTRsTL7GxH2bM1HMlbOVBEfK3XnIfn4WMAZeVuRPRPpk9Nzc6Lu7A==
X-Received: by 2002:a63:ea04:0:b0:43a:b17f:cd12 with SMTP id c4-20020a63ea04000000b0043ab17fcd12mr50174751pgi.109.1667970728257;
        Tue, 08 Nov 2022 21:12:08 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id b29-20020aa7951d000000b0056d98e31439sm7484888pfp.140.2022.11.08.21.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 21:12:06 -0800 (PST)
Date:   Wed, 9 Nov 2022 13:12:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, liwei391@huawei.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiochip_setup_dev
Message-ID: <Y2s2oUpjtU+ENuzN@sol>
References: <20221108115324.270361-1-zengheng4@huawei.com>
 <Y2qKjPD8zcmybugm@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qKjPD8zcmybugm@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 12:57:48AM +0800, Kent Gibson wrote:
> On Tue, Nov 08, 2022 at 07:53:24PM +0800, Zeng Heng wrote:
> > gcdev_register & gcdev_unregister call device_add & device_del to
> > request/release source. But in device_add, the dev->p allocated by
> > device_private_init is not released by device_del.
> > 
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
> > 
> > Fixes: 1f5eb8b17f02 ("gpiolib: fix sysfs when cdev is not selected")
> 
> I'm confused. You say "gcdev_register & gcdev_unregister call device_add
> & device_del" - which is only the case when CONFIG_GPIO_CDEV is not set.
> 
> But your trace shows CONFIG_GPIO_CDEV is set, as otherwise
> gpiolib_cdev_register() would not exist.
> 
> Can you clarify the configuration in which you are seeing the problem?
> 
> Assuming CONFIG_GPIO_CDEV is NOT set:
> 
> Provide a more appropriate trace.
> 
> From a reading of the device_add() documentation, there is a problem if
> the device_add() fails - in that case put_device() should be called - and
> it is not, instead gpiochip_setup_dev() returns immediately - not going
> via the err_remove_device path where your fix is??.
> The correct fix for that would be to change the gcdev_register() to call
> put_device() if device_add() fails.
> 

Ignore that - as you mentioned the dev.release hasn't been set at that
point.

Having another look at this, I don't think the problem is related to the
Fixed commit at all - it looks more general.
How did you conclude that that commit introduced the problem?
Is it easily repeatable and have you bisected for it?

Cheers,
Kent.
 
