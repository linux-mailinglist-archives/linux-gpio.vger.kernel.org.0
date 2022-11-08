Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD296219E9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 17:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiKHQ6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 11:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbiKHQ54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 11:57:56 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99EB58BE0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 08:57:54 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y4so14714764plb.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCzMZw03l6KlJWlKBuHzriWFFyFchhEm8XaKQ03lsn4=;
        b=gZNwG+dFcSgRlc2w0nEgJoUjKn9zmEBUNltqgJp6bB7NrSbczwe54u5V0cL0O+hkXt
         /rRkDUOMb9W/BmHLMAokxpnEifmxCMoTTatE3EakPMGa6/vbvUjme2fNuJUa3wYu4IFu
         6O5QZz429C2EE/s5xm3ApL7mLmVXq+RDRSwJOH5yYokJdg4WKPx3tQ4tl3PmKA9Z+U4s
         7MEMfnw8HPZgO7ArK4sZ3XS1SzVewww8K9rQnfuL0Rl8HBJCRot0WmCZSJRzGXfT8PIx
         bomEAxJT4rSaiuJQ3qOZZoahQm5S45j535W4LnWpeUSQwuV4BGh9hZPB9SzQ6cJ3hF8f
         N+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCzMZw03l6KlJWlKBuHzriWFFyFchhEm8XaKQ03lsn4=;
        b=pwY5P5LfoeieanQkKbKpq4v2+plLrQigUpEQ8Wr0z04dOoQVUseeKkqpLQHFS1tXog
         zQ0Tuif8PmLGABJXORN6yWTactz0goMw4RF0h6SNBSKPDTUwHoOLzDOZhQ85qAOT6nKr
         CLCaz9WgsMwoBGcWH2mtEpJYZDlWjqqucxGoXbNkNBzpcj3Tm30C1UVvzmJwY4u1vKJt
         uOPd/RXcaqxKBz0xQMTBhXezPKkMeeBDbxmH5LdO3dyGnnnmEgYFjmjDdM+G8dvBuRd6
         +hrrL5ji3XgMIC1IM5msfkmhUoXGcSUYQFT94XZCfGpn2YcQD5BAckE5c811hzebD5OM
         0+Hg==
X-Gm-Message-State: ACrzQf0tbTzAB3rF3iuJxDylndDMUCcg+/151rO4M53c1+DP0gg/Xc+t
        +k6G7LFgyTAnDKSaD9dWorE=
X-Google-Smtp-Source: AMsMyM63S4cktx4RPWzri6z2QC/IixJwjjhXX3kErC/nJdBYtl3uMA+9pdCsBs3nuH1vqg67Xc5ofA==
X-Received: by 2002:a17:90a:eb0c:b0:213:8ff3:a46a with SMTP id j12-20020a17090aeb0c00b002138ff3a46amr63405279pjz.158.1667926674176;
        Tue, 08 Nov 2022 08:57:54 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id d13-20020a170903230d00b00181e55d02dcsm7219542plh.139.2022.11.08.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 08:57:53 -0800 (PST)
Date:   Wed, 9 Nov 2022 00:57:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, liwei391@huawei.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiochip_setup_dev
Message-ID: <Y2qKjPD8zcmybugm@sol>
References: <20221108115324.270361-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108115324.270361-1-zengheng4@huawei.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 07:53:24PM +0800, Zeng Heng wrote:
> gcdev_register & gcdev_unregister call device_add & device_del to
> request/release source. But in device_add, the dev->p allocated by
> device_private_init is not released by device_del.
> 
> So when calling gcdev_unregister to release gdev, it needs put_device
> to release dev in the following.
> 
> Otherwise, kmemleak would report memory leak such as below:
> 
> unreferenced object 0xffff88810b406400 (size 512):
>   comm "python3", pid 1682, jiffies 4295346908 (age 24.090s)
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff a0 5e 23 90 ff ff ff ff  .........^#.....
>   backtrace:
>     [<00000000a58ee5fe>] kmalloc_trace+0x22/0x110
>     [<0000000045fe2058>] device_add+0xb34/0x1130
>     [<00000000d778b45f>] cdev_device_add+0x83/0xe0
>     [<0000000089f948ed>] gpiolib_cdev_register+0x73/0xa0
>     [<00000000a3a8a316>] gpiochip_setup_dev+0x1c/0x70
>     [<00000000787227b4>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>     [<000000009ac5742c>] devm_gpiochip_add_data_with_key+0x2e/0x80
>     [<00000000bf2b23d9>] xra1403_probe+0x192/0x1b0 [gpio_xra1403]
>     [<000000005b5ef2d4>] spi_probe+0xe1/0x140
>     [<000000002b26f6f1>] really_probe+0x17c/0x3f0
>     [<00000000dd2dad9c>] __driver_probe_device+0xe3/0x170
>     [<000000005ca60d2a>] device_driver_attach+0x34/0x80
>     [<00000000e9db90db>] bind_store+0x10b/0x1a0
>     [<00000000e2650f8a>] drv_attr_store+0x49/0x70
>     [<0000000080a80b2b>] sysfs_kf_write+0x8c/0xb0
>     [<00000000a28b45b9>] kernfs_fop_write_iter+0x216/0x2e0
> 
> unreferenced object 0xffff888100de9800 (size 512):
>   comm "python3", pid 264, jiffies 4294737615 (age 33.514s)
>   hex dump (first 32 bytes):
>     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
>     ff ff ff ff ff ff ff ff a0 5e 63 a1 ff ff ff ff  .........^c.....
>   backtrace:
>     [<00000000bcc571d0>] kmalloc_trace+0x22/0x110
>     [<00000000eeb06124>] device_add+0xb34/0x1130
>     [<000000007e5cd2fd>] cdev_device_add+0x83/0xe0
>     [<000000008f6bcd3a>] gpiolib_cdev_register+0x73/0xa0
>     [<0000000012c93b24>] gpiochip_setup_dev+0x1c/0x70
>     [<00000000a24b646a>] gpiochip_add_data_with_key+0x10f6/0x1bf0
>     [<000000000c225212>] tpic2810_probe+0x16e/0x196 [gpio_tpic2810]
>     [<00000000b52d04ff>] i2c_device_probe+0x651/0x680
>     [<0000000058d3ff6b>] really_probe+0x17c/0x3f0
>     [<00000000586f43d3>] __driver_probe_device+0xe3/0x170
>     [<000000003f428602>] device_driver_attach+0x34/0x80
>     [<0000000040e91a1b>] bind_store+0x10b/0x1a0
>     [<00000000c1d990b9>] drv_attr_store+0x49/0x70
>     [<00000000a23bfc22>] sysfs_kf_write+0x8c/0xb0
>     [<00000000064e6572>] kernfs_fop_write_iter+0x216/0x2e0
>     [<00000000026ce093>] vfs_write+0x658/0x810
> 
> Because at the point of gpiochip_setup_dev here, where dev.release
> does not set yet, calling put_device would cause the warning of
> no release function and double-free in the following fault handler
> route (when kfree dev_name). So directly calling kfree to release
> dev->p here in case of memory leak.
> 
> Fixes: 1f5eb8b17f02 ("gpiolib: fix sysfs when cdev is not selected")

I'm confused. You say "gcdev_register & gcdev_unregister call device_add
& device_del" - which is only the case when CONFIG_GPIO_CDEV is not set.

But your trace shows CONFIG_GPIO_CDEV is set, as otherwise
gpiolib_cdev_register() would not exist.

Can you clarify the configuration in which you are seeing the problem?

Assuming CONFIG_GPIO_CDEV is NOT set:

Provide a more appropriate trace.

From a reading of the device_add() documentation, there is a problem if
the device_add() fails - in that case put_device() should be called - and
it is not, instead gpiochip_setup_dev() returns immediately - not going
via the err_remove_device path where your fix is??.
The correct fix for that would be to change the gcdev_register() to call
put_device() if device_add() fails.

Cheers,
Kent.

> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/gpio/gpiolib.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4756ea08894f..fa659af86d07 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -539,6 +539,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>  
>  err_remove_device:
>  	gcdev_unregister(gdev);
> +	kfree(gdev->dev.p);
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
