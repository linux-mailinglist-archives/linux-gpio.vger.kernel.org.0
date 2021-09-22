Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABCA414597
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbhIVJzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbhIVJzf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:55:35 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84C2C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:54:05 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id b65so7270922qkc.13
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWTPAf/bkEE3iX2u98cLR9gNV6mV1xdpmTwLBO2P/1I=;
        b=eF+vylZhrg3/SaTMPjZ2N3M3aQAbYrPhrrsTOYieTYgUpXxUy8epQMzueErwcIZwU6
         ROqukO2wTMrE7IRRJgDhWq1jezf2x7JtXwoPOLa/HNVDjUIEu0TM7VZRSOcrFxR1Kuqg
         L1YnyzcWvIeaaiXZEjo2N5fzSumAlWNnIe2Q9OZKkxj3nE8gYtBlIkF9ShFHiIVsjV4Z
         TGt/Ki22BfIm4QPw5NfGDJyPznwQMSgsKBENbhkDZFShhdEvFi66PSdBAdC80lnArcn2
         aYiV7dC+ZPU3gRWD1YPUjeD6Vc35PdFy0UCMvCN7I1yZznZcblyA/DbWHK8m3f/6FWgP
         EquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWTPAf/bkEE3iX2u98cLR9gNV6mV1xdpmTwLBO2P/1I=;
        b=VT0640OeqBBYq3Aw1YMWPpw/wU7VQVHnwowXUJQ0/scKZe4pKRFzHiOxxpDxBOMyUI
         brFDoEuO+9O7wnBW0204NG629NU5YMX7fyyXvr7FTfUUe9EP3ecOF4h553SPL+kmtG4h
         5szOTe8s0Ti6NHI+H1Feb9qxNsBmDoQAu8QxQIKkJe4I1LjjrN3wCtMAt2xULZaIXqXX
         gBVdDcEscZaiAlgRQQahAXtn/WRA51T3k6OoM2+n6i7u7WQlkgBx2bQY3QjZONM6NYNE
         yg2qm7vOAghxZkJtU4U4Yij9l4I0bMo6ChORFP21NThdZT9ndFhISu9BRSykSqpY7uSc
         JrZQ==
X-Gm-Message-State: AOAM533ZMGQFpZnCpNdlhbxiInDU+XYL8iXtWJWYcKIZXDdvtWBum8Pd
        KED8YqnoPE+mB8nOVepLe3W8WDNf9GFTq5gkJO0fBrrOhFQ=
X-Google-Smtp-Source: ABdhPJxMFmab/Lha8daNzTpWdqb3xbeHjh8Z+Gl0yPC9hGJTJbA6B/xCcEg4pux/3n4Z+ZHN7d//YLpsKsmNyZsTDfw=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43698958ybc.353.1632304445057;
 Wed, 22 Sep 2021 02:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com> <20210824164801.28896-12-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210824164801.28896-12-lakshmi.sowjanya.d@intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:53:54 +0200
Message-ID: <CAMpxmJX+1sSceOe5ZN9iViWYfede50KwzdDduVgRb=8VtxbC5Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 11/20] gpio: Add event count interface to gpiolib
To:     lakshmi.sowjanya.d@intel.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, mgross@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        tamal.saha@intel.com, bala.senthil@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:
>
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Add a flag for event count and an extended structure to capture the event
> count when the flag is enabled.
>
> Intel(R) PMC Timed I/O device has an event count register counting
> the number of missed input edges. The register interface captures the
> event count and timestamp of the last event. For an event rate
> exceeding the rate that software can read events, the software can use
> the missed event count to calculate average event rates.
>
> The application requests one or both rising and falling edges when
> initializing the interface. The count of the selected edge type is
> optionally selected with an added event type flag. The event count is
> returned in an extended buffer using the read() interface.
>
> Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Mark Gross <mgross@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 28 +++++++++++++++++++---------
>  include/linux/gpio/driver.h |  1 +
>  include/uapi/linux/gpio.h   | 12 ++++++++++++
>  3 files changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 1df28a71f88b..3b5719d5e2dc 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -518,7 +518,8 @@ struct linereq {
>          GPIO_V2_LINE_DRIVE_FLAGS | \
>          GPIO_V2_LINE_EDGE_FLAGS | \
>          GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> -        GPIO_V2_LINE_BIAS_FLAGS)
> +        GPIO_V2_LINE_BIAS_FLAGS | \
> +        GPIO_V2_LINE_FLAG_EVENT_COUNT)
>
>  static void linereq_put_event(struct linereq *lr,
>                               struct gpio_v2_line_event *le)
> @@ -1252,10 +1253,14 @@ static ssize_t linereq_read(struct file *file,
>         struct linereq *lr = file->private_data;
>         struct gpioevent_poll_data poll_data;
>         struct gpio_v2_line_event le;
> +       size_t min_userbuf_size;
>         ssize_t bytes_read = 0;
>         int ret, offset;
>
> -       if (count < sizeof(le))
> +       min_userbuf_size = sizeof(le);
> +       min_userbuf_size += lr->lines[0].eflags & GPIO_V2_LINE_FLAG_EVENT_COUNT ?
> +                                       sizeof(struct gpio_v2_line_event_ext) : 0;
> +       if (count < min_userbuf_size)
>                 return -EINVAL;
>
>         /* Without an IRQ, we can only poll */
> @@ -1270,12 +1275,17 @@ static ssize_t linereq_read(struct file *file,
>                                               lr->lines[offset].eflags, &poll_data);
>                 if (ret)
>                         return ret;
> -               event = kzalloc(sizeof(*event), GFP_KERNEL);
> +               event = kzalloc(min_userbuf_size, GFP_KERNEL);
>                 event->timestamp_ns = poll_data.timestamp;
>                 event->id = poll_data.id;
> -               if (copy_to_user(buf, (void *)&event, sizeof(event)))
> -                       return -EFAULT;
> -               return sizeof(event);
> +               if (lr->lines[offset].eflags & GPIO_V2_LINE_FLAG_EVENT_COUNT)
> +                       event->ext[0].event_count = poll_data.event_count;
> +
> +               ret = copy_to_user(buf, (void *)event, min_userbuf_size);
> +               if (ret)
> +                       ret = -EFAULT;
> +               kfree(event);
> +               return ret ? ret : min_userbuf_size;
>         }
>
>         do {
> @@ -1396,7 +1406,7 @@ static int setup_input(struct linereq *lr, struct gpio_v2_line_config *lc,
>         ret = edge_detector_setup(&lr->lines[line_no], lc, line_no,
>                                   lflags & GPIO_V2_LINE_EDGE_FLAGS);
>         if (ret < 0) {
> -               if (ret != -ENXIO) {
> +               if (ret == -ENXIO) {
>                         if (lr->gdev->chip->setup_poll &&
>                             lr->gdev->chip->setup_poll(lr->gdev->chip, offset,
>                                                        &lflags) == 0 &&
> @@ -1513,7 +1523,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                                 goto out_free_linereq;
>                 }
>
> -               file_flags = O_RDONLY | O_CLOEXEC;
> +               file_flags = O_CLOEXEC;
>                 file_flags |= output ? O_WRONLY : O_RDONLY;
>                 file_flags |= (!output && !lr->lines[i].irq) ? O_NONBLOCK : 0;
>
> @@ -1524,7 +1534,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                         offset);
>         }
>
> -       fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> +       fd = get_unused_fd_flags(file_flags);
>         if (fd < 0) {
>                 ret = fd;
>                 goto out_free_linereq;
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 561e289434aa..09637fcbfd52 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -493,6 +493,7 @@ struct gpio_chip {
>  struct gpioevent_poll_data {
>         __u64 timestamp;
>         __u32 id;
> +       __u32 event_count;
>  };
>
>  struct gpio_output_event_data {
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index c39efc459b9f..e7fff2a205ec 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
>         GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN        = _BITULL(9),
>         GPIO_V2_LINE_FLAG_BIAS_DISABLED         = _BITULL(10),
>         GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME  = _BITULL(11),
> +       GPIO_V2_LINE_FLAG_EVENT_COUNT           = _BITULL(12),
>  };
>
>  /**
> @@ -270,6 +271,15 @@ enum gpio_v2_line_event_id {
>         GPIO_V2_LINE_EVENT_UNKNOWN_EDGE = 3,
>  };
>
> +/**
> + * struct gpio_v2_line_event_ext - Extended gpio line event
> + * @event_count: count of events
> + */
> +struct gpio_v2_line_event_ext {
> +       __u32 event_count;
> +       __u32 reserved[3];
> +};
> +
>  /**
>   * struct gpio_v2_line_event - The actual event being pushed to userspace
>   * @timestamp_ns: best estimate of time of event occurrence, in nanoseconds.
> @@ -280,6 +290,7 @@ enum gpio_v2_line_event_id {
>   * @line_seqno: the sequence number for this event in the sequence of
>   * events on this particular line
>   * @padding: reserved for future use
> + * @gpio_v2_line_event_ext: Extended gpio line event
>   *
>   * By default the @timestamp_ns is read from %CLOCK_MONOTONIC and is
>   * intended to allow the accurate measurement of the time between events.
> @@ -296,6 +307,7 @@ struct gpio_v2_line_event {
>         __u32 line_seqno;
>         /* Space reserved for future use. */
>         __u32 padding[6];
> +       struct gpio_v2_line_event_ext ext[];

This bit is an instant NAK as it breaks the ABI.

While I understand this is a bit of a different problem than the one
handled by the seqno fields, I think you should just think about
adding a field called something like "real_seqno" for those hardware
counted sequence numbers.

Bart

>  };
>
>  /**
> --
> 2.17.1
>
