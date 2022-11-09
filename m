Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BACB622641
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiKIJHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbiKIJGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:06:40 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8047121801
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:06:39 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id 4so16568645pli.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MhjGzcGIEwxwmvJOcBR4oJry7kOtjj25TGEd7eFUw=;
        b=Jl3dqUgEkCh0hO5pIjXziMfgLd36+Rsl4YMNwU9GxnOHLdX4XGalgd2mFZVH5Y5+9y
         d+zhviDv+ESwSxU04MzCTG2WB753OY2Po9reNl7rbbgr7RqOCSk6HD6NybjFMj3KIypP
         AnhgiVJpMfpc78Yw0/yLGH2ADNI8muzq76xMR/6lgiJgXm56uypNvARMzysGSl3KaTOH
         yA/WEY2cGOsKAPCMGoBwEG4kff5LtjRJnrGG16+ErGpy6HIyaNiqlEx5vD/XMfTr/8Mj
         ye6lZy4kwgKTV7f9vEcizeXObYnyRI89nWai6KegOlRdmEP+w+vCS+J17vPhjRwYXwTx
         kPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MhjGzcGIEwxwmvJOcBR4oJry7kOtjj25TGEd7eFUw=;
        b=AW/KpyG5YUBdsjKR9EriP+uzJ13SaPe8M9ySNWZXc4dwIg2TjdKkZGwM2bct5kmYPD
         CqmR/ByeTEHH7W5qmJGWvYeHJ4o2NlkUeJTZtMyIcB/09ZJTYO8XB8ccBzibrmFt/pMI
         ph1Lr+wTG+Y8K3uDpr6yjplKygV4fcMGJ7zbsc3QbJWPr1daJzQEju7OMOA9zJimwreS
         5O/x7shzv0MPC8We1tW7UePegg4btVA9Te1rePIMYk1s0MIHnj+6geMAWDjNvG4JH9ib
         +Z7DqE/cg8SD42jCwZWdraWselQtPiMpCyifQ/TDderhCXOlnNsSUl3gnF56jLWPuHYN
         Rm6g==
X-Gm-Message-State: ACrzQf1lOgSfsn0qslYj89XkvEXiq/PaD0qBvBFTlYCmduciR+xB9x6H
        iu7f46pJ09kQE6ZDnOrNXWw=
X-Google-Smtp-Source: AMsMyM5o3A0NE0r/7q9K6VKVEdEeHt5/XShsPQN0Ls+JHDe4FEcJpEWqUSl88MFXqpY71ax+hd6M4Q==
X-Received: by 2002:a17:902:d386:b0:187:190f:6ac7 with SMTP id e6-20020a170902d38600b00187190f6ac7mr52654099pld.170.1667984798879;
        Wed, 09 Nov 2022 01:06:38 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id p68-20020a625b47000000b0056a93838606sm7751677pfb.58.2022.11.09.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 01:06:38 -0800 (PST)
Date:   Wed, 9 Nov 2022 17:06:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, liwei391@huawei.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiochip_setup_dev
Message-ID: <Y2ttmcV+PFDUZR3l@sol>
References: <20221108115324.270361-1-zengheng4@huawei.com>
 <Y2qKjPD8zcmybugm@sol>
 <Y2s2oUpjtU+ENuzN@sol>
 <9bc294da-080c-9854-193d-a0474d058df0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc294da-080c-9854-193d-a0474d058df0@huawei.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 04:27:26PM +0800, Zeng Heng wrote:
> 
> On 2022/11/9 13:12, Kent Gibson wrote:
> > On Wed, Nov 09, 2022 at 12:57:48AM +0800, Kent Gibson wrote:
> > > On Tue, Nov 08, 2022 at 07:53:24PM +0800, Zeng Heng wrote:
> > > > gcdev_register & gcdev_unregister call device_add & device_del to
> > > > request/release source. But in device_add, the dev->p allocated by
> > > > device_private_init is not released by device_del.
> > > > 
> > > > So when calling gcdev_unregister to release gdev, it needs put_device
> > > > to release dev in the following.
> > > > 
> > > > Otherwise, kmemleak would report memory leak such as below:
> > > > 
> > > > unreferenced object 0xffff88810b406400 (size 512):
> > > >    comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
> > > >    hex dump (first 32 bytes):
> > > >      00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
> > > >      ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
> > > >    backtrace:
> > > >      [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
> > > >      [<0000000045fe2058>] device_add+0xb34/0x1130
> > > >      [<00000000d778b45f>] cdev_device_add+0x83/0xe0
> > > >      [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
> > > >      [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
> > > >      [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
> > > >      [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
> > > >      [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
> > > >      [<000000005b5ef2d4>] spi_probe+0xe1/0x140
> > > >      [<000000002b26f6f1>] really_probe+0x17c/0x3f0
> > > >      [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
> > > >      [<000000005ca60d2a>] device_driver_attach+0x34/0x80
> > > >      [<00000000e9db90db>] bind_store+0x10b/0x1a0
> > > >      [<00000000e2650f8a>] drv_attr_store+0x49/0x70
> > > >      [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
> > > >      [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0
> > > > 
> > > > unreferenced object 0xffff888100de9800 (size 512):
> > > >    comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
> > > >    hex dump (first 32 bytes):
> > > >      00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
> > > >      ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
> > > >    backtrace:
> > > >      [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
> > > >      [<00000000eeb06124>] device_add+0xb34/0x1130
> > > >      [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
> > > >      [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
> > > >      [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
> > > >      [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
> > > >      [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
> > > >      [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
> > > >      [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
> > > >      [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
> > > >      [<000000003f428602>] device_driver_attach+0x34/0x80
> > > >      [<0000000040e91a1b>] bind_store+0x10b/0x1a0
> > > >      [<00000000c1d990b9>] drv_attr_store+0x49/0x70
> > > >      [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
> > > >      [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
> > > >      [<00000000026ce093>] vfs_write+0x658/0x810
> > > > 
> > > > Because at the point of gpiochip_setup_dev here, where dev.release
> > > > does not set yet, calling put_device would cause the warning of
> > > > no release function and double-free in the following fault handler
> > > > route (when kfree dev_name). So directly calling kfree to release
> > > > dev->p here in case of memory leak.
> > > > 
> > > > Fixes: 1f5eb8b17f02 ("gpiolib: fix sysfs when cdev is not selected")
> > > I'm confused. You say "gcdev_register & gcdev_unregister call device_add
> > > & device_del" - which is only the case when CONFIG_GPIO_CDEV is not set.
> > > 
> > > But your trace shows CONFIG_GPIO_CDEV is set, as otherwise
> > > gpiolib_cdev_register() would not exist.
> > > 
> > > Can you clarify the configuration in which you are seeing the problem?
> > > 
> > > Assuming CONFIG_GPIO_CDEV is NOT set:
> > > 
> > > Provide a more appropriate trace.
> > > 
> > >  From a reading of the device_add() documentation, there is a problem if
> > > the device_add() fails - in that case put_device() should be called - and
> > > it is not, instead gpiochip_setup_dev() returns immediately - not going
> > > via the err_remove_device path where your fix is??.
> > > The correct fix for that would be to change the gcdev_register() to call
> > > put_device() if device_add() fails.
> > > 
> > Ignore that - as you mentioned the dev.release hasn't been set at that
> > point.
> > 
> > Having another look at this, I don't think the problem is related to the
> > Fixed commit at all - it looks more general.
> > How did you conclude that that commit introduced the problem?
> > Is it easily repeatable and have you bisected for it?
> > 
> > Cheers,
> > Kent.
> 
> Thanks to your patience for taking another look at this mail.
> 

No problem - my bad for initially responding without giving it more
consideration.

> And allow me to claim that I indeed do the inject-fault test and regression
> test based on the patch.
> 
> 
> My test environment has included CONFIG_GPIO_CDEV config, but no matter
> includes this config or not,
> 
> there is still memory leak in fault handle route about dev->p because of
> calling device_add.
> 
> 
> Apologize for the fixed commit is not accurate, and exactly it's this one:
> 
> Fixes: 159f3cd92f17 ("gpiolib: Defer gpio device setup until after gpiolib
> initialization")
> 
> 
> If everything is all right, I would send the second version patch and
> correct fix tag.
> 

Yeah, that makes more sense - it has been there since that section of
code was reworked - quite some time ago.  Good catch.

Cheers,
Kent.
