Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F03C744DA9
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jul 2023 15:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGBNDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jul 2023 09:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGBNDb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jul 2023 09:03:31 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06EEE5F
        for <linux-gpio@vger.kernel.org>; Sun,  2 Jul 2023 06:03:29 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8054180acso29087875ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2023 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688303009; x=1690895009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3entMsUwx1xL+bxsYdiuisWj41BtO6l9zsAWKJUXdfA=;
        b=hHoInT0vDQ+oW9fTieDsRp3Pc+rUOve88KQmYToV4ZNIK3pg7QJUlJ9dryjSbO+EWh
         5olpxpIAym/UgPOz76rCBhyF1g1tG0GYflqU6xL2gKHdW0Omy6s5N1AZGI6HCj5g8AwD
         V+3J6TatvRUufKATLX3l/vANM7mXfVYQ++/yr1cRi3t+RO2Tk/xH7txxlKdnu3YixI9R
         /ZTSsamrLtrEpVgxb0bBGpfrSqR10iXj3u1pHU89QlN72kLWwLL8bKDr+uKaNI5XiFkO
         VjgL0k5FzWSzTaxT26sWkNpB5QzK+wuzBlNHRXtLzlHsI6RWVPgl1qauawxTO+QWIrh/
         +yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688303009; x=1690895009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3entMsUwx1xL+bxsYdiuisWj41BtO6l9zsAWKJUXdfA=;
        b=OdEQ7OF9/VWZTuj+wMSxwRj/21DdY99IL9nzG6odQt0fXs1w0tY3DD3kUWpKJuv1WS
         2TjZabU3nMM9iKl/JSMGGPPYlzbsGZbqSLjB0f9fY6/JopnIO1EgEREdSi4LqLUfOkGI
         6YxusPnlQDeGxr6yKNylOMstJ+VGfAghBKrqC2YRF0EhaWS6ZEF17Ybjd0VjlzuWRi/g
         Mx0hq6zASPApbxx8AlQ9Xbl8Bew7SqoxQhPvEmYpzSxjpe7DNFwkGaVx3s6uDrJAfXBf
         J+iPoFaTFaOlYUA8MnthtBOvDazmmzQEkVGyzOxQZaEP5IU2iObU+s25GhEeodo8cb8I
         ETMQ==
X-Gm-Message-State: ABy/qLZrWUrc5j1YunnXk6zVjttPVs5Xj8SAhsdE9E3osYPpmZnGE7y+
        ZvLuWl5ODPayO8oF96rt7ic=
X-Google-Smtp-Source: APBJJlHZAaOIiM20GE//+MIP4sYcpuiBlh31VhwyrW+2NNOdDzv+pGpPRcpYdW8n2cP6i337rWN8XQ==
X-Received: by 2002:a17:902:ecc9:b0:1b8:4515:8be4 with SMTP id a9-20020a170902ecc900b001b845158be4mr10238610plh.56.1688303009225;
        Sun, 02 Jul 2023 06:03:29 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902b08800b001b8307c81c8sm7607383plr.121.2023.07.02.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:03:28 -0700 (PDT)
Date:   Sun, 2 Jul 2023 21:03:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Improving the hot-unplug event handling in gpiolib
Message-ID: <ZKF1nMtCLj7uxdzR@sol>
References: <CAMRc=MczceSat_G5yO=DjDDePZ6mFSNF02-OJcBU6TzKQ+ne-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MczceSat_G5yO=DjDDePZ6mFSNF02-OJcBU6TzKQ+ne-g@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2023 at 11:39:15AM +0200, Bartosz Golaszewski wrote:
> Hey Kent, Andy, Linus et al!
> 
> I've been spending time looking at the gpiolib code and trying to
> figure out all that's wrong with hot-unplugging code in order to
> finally fix the issues that lead to various memory corruptions and
> crashes (or at least paper over the issues enough to make it
> semi-reliable at hot-unplug events). I did some experiments with
> promising results but before I start coding for real, I wanted to run
> this by you.
> 
> The easiest way to trigger a crash is instantiating a gpio-sim chip,
> running gpiomon or gpionotify on one of its lines, removing the chip
> from configfs (simulating an unplug event) and then killing the
> program. This will consistently show up in KASAN output as a
> use-after-free bug. The same can be achieved for a real-life example
> with the cp2112 driver which exposes a GPIO chip over USB.
> 
> There are several issues here, and I also list some possible solutions.
> 
> 1. Not waking up the poll when the chips disappears.
> 
> We should call wake_up_poll() on the relevant wait queue with
> (EPOLLERR | EPOLLHUP) when the chip goes down to force a return to
> user-space from poll(). This way, the current syscall will not be
> stuck with a chip gone from under it and any sybsequent
> read()/write()/poll() will fail the gdev->chip check.
> 
> 2. Freeing descriptors and irqs after the GPIO chip is gone.
> 
> The GPIO device is gone after the call to gpiochip_remove(). Meanwhile
> linereq, lineevent etc. are reference counted and are only released
> after the last reference to their owning file descriptor is gone. This
> means that userspace process needs to call close() on the relevant fd
> or exit before we start releasing the resources associated with these
> structures. This is fine for fields only used by the code in
> gpiolib-cdev.c but for system-wide resources, we need to free them
> right when gpiochip_remove() is called and "numb down" the cdev
> structs like we do with the GPIO chip.
> 
> To that end I propose to reuse the blocking notifier in struct
> gpio_device: let's add a notifer block to struct linereq (I'll focus
> on this one here) and get notified when gpiochip_remove() is called.
> We can now wake up the poll and free all resources that must not be
> used anymore.
> 
> 3. No locking for struct linereq, lineevent etc.
> 
> File operations only take the inode lock and don't protect any data
> touched by the callbacks. I think this can lead to some still hidden
> issues and especially when we start freeing resources when notified by
> core gpiolib. There's config_mutex in struct linereq but it seems to
> me that it doesn't protect all data everywhere and linereq is also
> accessed from interrupt context, for instance in edge_irq_handler().
> 
> We should add spinlocks to every cdev context structure and take care
> to protect all accesses correctly.
> 
> I'm sure the above list is not complete and other issues will be
> uncovered as we move but it's what I figured out so far.
> 
> Let me know what you think and if any of this makes sense.
> 

My biggest concern here is that cdev is being treated as a special case,
when it should just be another gpiolib user.
Potentially the prototypical gpiolib user, but still just a gpiolib user.
More specifically, a gpiodev and gpiod user, NOT a gpiochip user.

IMHO all the gpiochip functions that cdev calls should be delegated to
gpiolib functions that perform the gdev->chip mapping, with appropriate
locking, and then the gpiochip function.
e.g. gpiochip_get_desc(chip, offset) -> gpiodev_get_desc(gdev, offset).
Then cdev never directly accesses the chip - that is gpiolib's problem.

That reduces the problem to notifying the gpiod user when the chip is
removed. Given such a notification, the gpiod user can release any
associated resources, including all the descs and the gdev.
So gpiochip_remove() would trigger the removal notification, after numbing
the device, and wait for all descs using it to be released before putting
the device.  It might be good to incorporate the registration of a
removal handler into the gpio_device_get() itself, to ensure that the user
provides one.

In the case of cdev, the removal notification for a given request would
trigger numbing all the ioctls, releasing the associated descs and irqs
and the gdev itself, and signalling the user via the request fd.

Wrt point 2 - the removal notification, so that would be similar to
the block notifier in struct gpio_chardev_data, which is already hanging off
the gpio_device notifier, and that receives GPIOLINE_CHANGED_* events?
But it would only receive removal events??  Or do you expect it to filter the
GPIOLINE_CHANGED_* events?

No conceptual problem with using a blocking_notifier for this, but maybe a
dedicated one rather then piggybacking on the GPIOLINE_CHANGED_*
notifier?

Be mindful of the race condition where the chip is removed between the user
requesting the desc and registering the notifier callback.

Wrt point 3, not sure how the inode lock is relevant here.
The lock is not held during ioctl calls, right?
If the inode lock IS held, then the ioctls would be inherently serialized,
and the config_mutex would be redundant, as its purpose is to prevent
ioctls concurrently twiddling with the desc flags and debounce_period.
FWIW, I've always assumed the ioctls can be concurrent.

And while the linereq is accessed from interrupt context in
edge_irq_thread(), the contained desc and irq are not.

I don't think there is any need to go adding spin locks everywhere.
Each field has its access and locking strategy documented in its kernel-doc.
If you have concrete cases where that is incorrect or the locking is
deficient then please share.

Anyway, cdev will need to coordinate the notifier callback with its
other operations to ensure the callback doesn't release the descs until
they are numbed - including removing the irqs.
Need to think about the best way to handle that.  It may require a mutex
to serialize request ops as the descs are held during calls like
gpiod_get_value_cansleep(desc), so can't use a spin lock.

Does that make sense?

Cheers,
Kent.

