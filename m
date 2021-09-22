Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172E54145B9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbhIVKFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbhIVKFf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:05:35 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5C9C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:04:05 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id t4so7491744qkb.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+JmR4YUGtp0GTRuEl3U6ZfEXJALH18uLwdK0NgyeVE=;
        b=KYUSmxxaqbZPE5OpaENFTFgr8Ql7Scuj0j3ARIvMJguNGOIbQEn9qkw2FUS+WxfETN
         VDDw6HoqEcyQP1OpKXV78tHBaNu992dSy4doxL3egXkUD1yu/Ls1qHXgRFY7LVcIasQ4
         2/cgud5RFPBKTVbaXpd80R5YkzOX2dJ7Ct7qc4oKS2V9f+GSswzWkzMayYFSG5hZ5mbK
         sgG/MmCwMd3a6Ea/ZckdNHCnE4/gP0F5PvZbBapeFooQnal98w3L334KYEke1C4Evkt7
         9QWhoCZonhQexXQ4DENfUOaWU7wof8vLzspQ9l8BcGuuD95wwO7V80MWSRqZv6HYykPh
         u11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+JmR4YUGtp0GTRuEl3U6ZfEXJALH18uLwdK0NgyeVE=;
        b=kATihA5KytIqIqflKcJfuXq8SSI1VOKC3OzhVCm5RvtXUh57vmz/zBTKo8G2BCLXLB
         +gSWGOLhx2iekqXlYPlJ/2F+QOBYGpOhbN4ShYYtkrdz8sm4h0yw+RE5U/XXbk7IYKxr
         LP4uPzFuPUATKQuN3EydgQGzMr2yrilD3ga1qNeJ5UiGwpcAZGXDIf5t0ZrTjHrBZuyj
         B9YtKCLTUevXgFQJthCJ7b7zxtqkj5VYOQ0hZB70kGVbBAWHRzuswBJ1c5hVPs4ZWvgm
         PglzM7JdX/ffPVtkBLqd29BJXx4m6X3f+foZNDNQ337ReqKEH5M9d88YGwUrIqGsupwF
         kHJQ==
X-Gm-Message-State: AOAM531NRezDdtcbIReTSiQ1LFx4XSa/eZsE8VWHIy3qiTDGGxEuansC
        +Omvxun0+PMVDSx5uia6IIc0C16SRNrMGi6XyuPKbQ==
X-Google-Smtp-Source: ABdhPJxHL/OxcUTjONxWPPtCbBRvtbVUi/lomIZky1cW+lg87kGWpt3iR0EoSj1hI2Me7w1cmMEXY+JNenGKbOn81UI=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43747209ybc.353.1632305044479;
 Wed, 22 Sep 2021 03:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com> <20210824164801.28896-3-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210824164801.28896-3-lakshmi.sowjanya.d@intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 12:03:53 +0200
Message-ID: <CAMpxmJWeZP-f-3BoWwX7PkWNZySn5RP=rc4cVyLEwYmSb6if+w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 02/20] gpio: Add GPIO polling interface to GPIO lib
To:     lakshmi.sowjanya.d@intel.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, mgross@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        tamal.saha@intel.com, bala.senthil@intel.com,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:
>
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Some Intel Timed I/O devices do not implement IRQ functionality. Augment
> read() interface to allow polling.
>
> Add two GPIO device methods: setup_poll() and poll():
> - setup_poll() configures the GPIO interface e.g. capture rising edges
> - poll() checks for events on the interface
>
> To implement polling, the driver must implement the two functions above
> and should either leave to_irq() method NULL or return irq 0.
>
> setup_poll() should configure the hardware to 'listen' for input events.
>
> poll() driver implementation must return the realtime timestamp
> corresponding to the event and -EAGAIN if no data is available.
>
> Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Mark Gross <mgross@linux.intel.com>
> ---

Interesting. So the idea is to allow user-space to read line events as
if they were generated by interrupts handled in the kernel. While this
whole series has a long way to go and this patch looks wrong to me in
several places at first glance, I find the idea interesting. Cc'ing
Kent who's the author of most of this code - Kent: what do you think?

Bart

>  drivers/gpio/gpiolib-cdev.c | 28 ++++++++++++++++++++++++++--
>  include/linux/gpio/driver.h | 19 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index c7b5446d01fd..4741bf34750b 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1227,13 +1227,34 @@ static ssize_t linereq_read(struct file *file,
>                             loff_t *f_ps)

Why would you do this in linereq_read()? Userspace ends up in
linereq_poll() when it calls poll().

>  {
>         struct linereq *lr = file->private_data;
> +       struct gpioevent_poll_data poll_data;
>         struct gpio_v2_line_event le;
>         ssize_t bytes_read = 0;
> -       int ret;
> +       int ret, offset;
>
>         if (count < sizeof(le))
>                 return -EINVAL;
>
> +       /* Without an IRQ, we can only poll */
> +       offset = gpio_chip_hwgpio(lr->gdev->descs);
> +       if (lr->lines[offset].irq == 0) {
> +               struct gpio_v2_line_event *event;
> +
> +               if (!(file->f_flags & O_NONBLOCK))
> +                       return -ENODEV;
> +
> +               ret = lr->gdev->chip->do_poll(lr->gdev->chip, offset,
> +                                             lr->lines[offset].eflags, &poll_data);

What if the driver doesn't implement do_poll()?

> +               if (ret)
> +                       return ret;
> +               event = kzalloc(sizeof(*event), GFP_KERNEL);
> +               event->timestamp_ns = poll_data.timestamp;
> +               event->id = poll_data.id;
> +               if (copy_to_user(buf, (void *)&event, sizeof(event)))
> +                       return -EFAULT;
> +               return sizeof(event);
> +       }
> +
>         do {
>                 spin_lock(&lr->wait.lock);
>                 if (kfifo_is_empty(&lr->events)) {
> @@ -1314,6 +1335,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  {
>         struct gpio_v2_line_request ulr;
>         struct gpio_v2_line_config *lc;
> +       unsigned int file_flags;
>         struct linereq *lr;
>         struct file *file;
>         u64 flags;
> @@ -1411,6 +1433,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                                 goto out_free_linereq;
>                 }
>
> +               file_flags = O_RDONLY | O_CLOEXEC;
> +
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
>                                              GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
> @@ -1425,7 +1449,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>         }
>
>         file = anon_inode_getfile("gpio-line", &line_fileops, lr,
> -                                 O_RDONLY | O_CLOEXEC);
> +                                 file_flags);
>         if (IS_ERR(file)) {
>                 ret = PTR_ERR(file);
>                 goto out_put_unused_fd;
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 3a268781fcec..f5b971ad40bc 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -17,6 +17,7 @@ struct device_node;
>  struct seq_file;
>  struct gpio_device;
>  struct module;
> +struct gpioevent_poll_data;
>  enum gpiod_flags;
>  enum gpio_lookup_flags;
>
> @@ -304,6 +305,11 @@ struct gpio_irq_chip {
>   * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
>   *     requires special mapping of the pins that provides GPIO functionality.
>   *     It is called after adding GPIO chip and before adding IRQ chip.
> + * @setup_poll: optional routine for devices that don't support interrupts.
> + *     Takes flags argument as in/out parameter, where caller requests
> + *     event flags and driver returns accepted flags.
> + * @do_poll: optional routine for devices that don't support interrupts.
> + *     Returns event specification in data parameter.
>   * @base: identifies the first GPIO number handled by this chip;
>   *     or, if negative during registration, requests dynamic ID allocation.
>   *     DEPRECATION: providing anything non-negative and nailing the base
> @@ -396,6 +402,14 @@ struct gpio_chip {
>
>         int                     (*add_pin_ranges)(struct gpio_chip *gc);
>
> +       int                     (*setup_poll)(struct gpio_chip *chip,
> +                                             unsigned int offset,
> +                                             u32 *eflags);

Does anyone even call this?

> +
> +       int                     (*do_poll)(struct gpio_chip *chip,
> +                                          unsigned int offset, u32 eflags,
> +                                          struct gpioevent_poll_data *data);
> +
>         int                     base;
>         u16                     ngpio;
>         const char              *const *names;
> @@ -471,6 +485,11 @@ struct gpio_chip {
>  #endif /* CONFIG_OF_GPIO */
>  };
>
> +struct gpioevent_poll_data {
> +       __u64 timestamp;
> +       __u32 id;
> +};
> +
>  extern const char *gpiochip_is_requested(struct gpio_chip *gc,
>                         unsigned int offset);
>
> --
> 2.17.1
>

This patch doesn't look good - or even tested - but as I said - the
idea itself sounds reasonable in general.

Bart
