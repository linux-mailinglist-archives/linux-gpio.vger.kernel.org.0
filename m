Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA501275C59
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 17:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWPrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 11:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWPrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 11:47:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBA1C0613CE;
        Wed, 23 Sep 2020 08:47:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so14626162pgo.13;
        Wed, 23 Sep 2020 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQn2ufZ5yGf3+2Y9QCjJ7v23t2Tt/Ir/jdvhcXaMV4w=;
        b=V6zr0xhyWJ8b9Lbx0Sr2Poslas2381Ebaun6+0wDb8v7cdWsraekM7a53YRbB7BJdZ
         QdENMOUCUOmt/z3/B8r3DWN5CxngIoVLN8gIzOpvw9z0c/HXDBAj4o0LPjNTuC20UriR
         ZfjkSUYAMQW0Cg/pcwjliS5dVdnDQ6VNk2NVrIeS7CEloVMgbaoI97Q8yP2+SA3qpLkU
         eq0f0xTV1Zn+l/4JfGXOOZVTXPeZHT5UFcaRKP9fG0dQ5Bpf9PvLwhRspsR8F28UNA4+
         wyMKbMUd5Y9MdfxFt2158YR6yWggoQ/VkQ3Kwakt9hDyNlteYQkx9/10jwAPc7BR0hzA
         oCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQn2ufZ5yGf3+2Y9QCjJ7v23t2Tt/Ir/jdvhcXaMV4w=;
        b=KglbB/zlZhDAHdytTEeLXsKiu6BBJhdP8tyMoGks1Rn9V6g5T07CWKO/F3pLfBd8bG
         wLs9NfYPy5YMHlB8JgKYo+fkhWozXw1yK/1IjkOKGmjTSiOpoagKtaeg9DM3v26h7ulp
         f/jIZqHqdJrjlY1vkW0CCs1WJqr6c1EbfLxq7AZNQXT1HxL2tFaxVPpBcn5jV1CU2MIv
         jp2jWivZRApZlJkQsO92yeGOsx3Q0GUcejJxWwZzzD/Z58S22wlEJQI6SsLsoaYumYI9
         agHxBssyz0cJx2WJuPJjLn1JicAQGgKjEJ9knIa/iEcw+rslp9TAHXabXS28UbcZv7bk
         qEag==
X-Gm-Message-State: AOAM531ZCSHd29niAqlbIKOPeQCQgJayH0sk/tFAeXxKN+IgdanUi8GT
        AwfdpsvmAWAQ634wKQYW6TBdieompspzplNWOpI=
X-Google-Smtp-Source: ABdhPJxH/3Uirxp9J3RBtwGxp13KM9BmKW3vIp5F4ECbDZRMkQWpX36zhU2ixB+XjFHODc5jGVqvoDD5FOL4QXxQqpc=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr497459pfn.73.1600876066565; Wed, 23 Sep
 2020 08:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-10-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-10-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 18:47:28 +0300
Message-ID: <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com>
Subject: Re: [PATCH v9 09/20] gpiolib: cdev: support edge detection for uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for edge detection to lines requested using
> GPIO_V2_GET_LINE_IOCTL.
>
> The edge detector implementation is based on the v1 lineevent
> implementation.
>
> Unlike the v1 implementation, an overflow of the event buffer results
> in discarding older events, rather than the most recent, so the final
> event in a burst will correspond to the current state of the line.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> The linereq_put_event() helper is only used once here, but is re-used in
> subsequent patches, and so is pre-emptively split out.
>
> edge_detector_stop() is extended in subsequent patches, and is strucured

structured

> to suit those additions.
>
>  drivers/gpio/gpiolib-cdev.c | 275 ++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.c      |   2 +
>  drivers/gpio/gpiolib.h      |   2 +
>  3 files changed, 279 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index d3857113f58c..145bda2151fb 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -404,9 +404,33 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  /**
>   * struct line - contains the state of a requested line
>   * @desc: the GPIO descriptor for this line.
> + * @req: the corresponding line request
> + * @irq: the interrupt triggered in response to events on this GPIO
> + * @eflags: the edge flags, GPIO_V2_LINE_FLAG_EDGE_RISING and/or
> + * GPIO_V2_LINE_FLAG_EDGE_FALLING, indicating the edge detection applied
> + * @timestamp_ns: cache for the timestamp storing it between hardirq and
> + * IRQ thread, used to bring the timestamp close to the actual event
> + * @req_seqno: the seqno for the current edge event in the sequence of
> + * events for the corresponding line request. This is drawn from the @req.
> + * @line_seqno: the seqno for the current edge event in the sequence of
> + * events for this line.
>   */
>  struct line {
>         struct gpio_desc *desc;
> +       /*
> +        * -- edge detector specific fields --
> +        */
> +       struct linereq *req;
> +       unsigned int irq;
> +       u64 eflags;
> +       /*
> +        * timestamp_ns and req_seqno are accessed only by
> +        * edge_irq_handler() and edge_irq_thread(), which are themselves
> +        * mutually exclusive, so no additional protection is necessary.
> +        */
> +       u64 timestamp_ns;
> +       u32 req_seqno;
> +       u32 line_seqno;
>  };
>
>  /**
> @@ -414,12 +438,22 @@ struct line {
>   * @gdev: the GPIO device the line request pertains to
>   * @label: consumer label used to tag GPIO descriptors
>   * @num_lines: the number of lines in the lines array
> + * @wait: wait queue that handles blocking reads of events
> + * @event_buffer_size: the number of elements allocated in @events
> + * @events: KFIFO for the GPIO events
> + * @seqno: the sequence number for edge events generated on all lines in
> + * this line request.  Note that this is not used when @num_lines is 1, as
> + * the line_seqno is then the same and is cheaper to calculate.
>   * @lines: the lines held by this line request, with @num_lines elements.
>   */
>  struct linereq {
>         struct gpio_device *gdev;
>         const char *label;
>         u32 num_lines;
> +       wait_queue_head_t wait;
> +       u32 event_buffer_size;
> +       DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
> +       atomic_t seqno;
>         struct line lines[];
>  };
>
> @@ -436,12 +470,150 @@ struct linereq {
>         (GPIO_V2_LINE_FLAG_OPEN_DRAIN | \
>          GPIO_V2_LINE_FLAG_OPEN_SOURCE)
>
> +#define GPIO_V2_LINE_EDGE_FLAGS \
> +       (GPIO_V2_LINE_FLAG_EDGE_RISING | \
> +        GPIO_V2_LINE_FLAG_EDGE_FALLING)
> +
>  #define GPIO_V2_LINE_VALID_FLAGS \
>         (GPIO_V2_LINE_FLAG_ACTIVE_LOW | \
>          GPIO_V2_LINE_DIRECTION_FLAGS | \
>          GPIO_V2_LINE_DRIVE_FLAGS | \
> +        GPIO_V2_LINE_EDGE_FLAGS | \
>          GPIO_V2_LINE_BIAS_FLAGS)
>
> +static void linereq_put_event(struct linereq *lr,
> +                             struct gpio_v2_line_event *le)
> +{
> +       bool overflow = false;
> +
> +       spin_lock(&lr->wait.lock);
> +       if (kfifo_is_full(&lr->events)) {
> +               overflow = true;
> +               kfifo_skip(&lr->events);
> +       }
> +       kfifo_in(&lr->events, le, 1);
> +       spin_unlock(&lr->wait.lock);


> +       if (!overflow)
> +               wake_up_poll(&lr->wait, EPOLLIN);
> +       else
> +               pr_debug_ratelimited("event FIFO is full - event dropped\n");

Under positive conditionals I meant something like this

       if (overflow)
               pr_debug_ratelimited("event FIFO is full - event dropped\n");
      else
               wake_up_poll(&lr->wait, EPOLLIN);

> +}
> +
> +static irqreturn_t edge_irq_thread(int irq, void *p)
> +{
> +       struct line *line = p;
> +       struct linereq *lr = line->req;
> +       struct gpio_v2_line_event le;
> +
> +       /* Do not leak kernel stack to userspace */
> +       memset(&le, 0, sizeof(le));

> +       /*
> +        * We may be running from a nested threaded interrupt in which case
> +        * we didn't get the timestamp from edge_irq_handler().
> +        */
> +       if (!line->timestamp_ns) {
> +               le.timestamp_ns = ktime_get_ns();
> +               if (lr->num_lines != 1)
> +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> +       } else {
> +               le.timestamp_ns = line->timestamp_ns;
> +       }

Ditto.

> +       line->timestamp_ns = 0;
> +
> +       if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> +                            GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> +               int level = gpiod_get_value_cansleep(line->desc);
> +
> +               if (level)
> +                       /* Emit low-to-high event */
> +                       le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +               else
> +                       /* Emit high-to-low event */
> +                       le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +       } else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
> +               /* Emit low-to-high event */
> +               le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +       } else if (line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
> +               /* Emit high-to-low event */
> +               le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +       } else {
> +               return IRQ_NONE;
> +       }
> +       line->line_seqno++;
> +       le.line_seqno = line->line_seqno;
> +       le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
> +       le.offset = gpio_chip_hwgpio(line->desc);
> +
> +       linereq_put_event(lr, &le);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t edge_irq_handler(int irq, void *p)
> +{
> +       struct line *line = p;
> +       struct linereq *lr = line->req;
> +
> +       /*
> +        * Just store the timestamp in hardirq context so we get it as
> +        * close in time as possible to the actual event.
> +        */
> +       line->timestamp_ns = ktime_get_ns();
> +
> +       if (lr->num_lines != 1)
> +               line->req_seqno = atomic_inc_return(&lr->seqno);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
> +static void edge_detector_stop(struct line *line)
> +{
> +       if (line->irq) {
> +               free_irq(line->irq, line);
> +               line->irq = 0;
> +       }
> +}
> +
> +static int edge_detector_setup(struct line *line,
> +                              u64 eflags)
> +{
> +       unsigned long irqflags = 0;
> +       int irq, ret;
> +
> +       if (eflags && !kfifo_initialized(&line->req->events)) {
> +               ret = kfifo_alloc(&line->req->events,
> +                                 line->req->event_buffer_size, GFP_KERNEL);
> +               if (ret)
> +                       return ret;
> +       }
> +       line->eflags = eflags;
> +
> +       if (!eflags)
> +               return 0;
> +
> +       irq = gpiod_to_irq(line->desc);
> +       if (irq <= 0)
> +               return -ENODEV;

So, you mean this is part of ABI. Can we return more appropriate code,
because getting no IRQ doesn't mean we don't have a device.
Also does 0 case have the same meaning?

> +       if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
> +               irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
> +                       IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
> +       if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
> +               irqflags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
> +                       IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
> +       irqflags |= IRQF_ONESHOT;
> +
> +       /* Request a thread to read the events */
> +       ret = request_threaded_irq(irq, edge_irq_handler, edge_irq_thread,
> +                                  irqflags, line->req->label, line);
> +       if (ret)
> +               return ret;
> +
> +       line->irq = irq;
> +       return 0;
> +}
> +
>  static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
>                                      unsigned int line_idx)
>  {
> @@ -484,6 +656,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
>             (flags & GPIO_V2_LINE_FLAG_OUTPUT))
>                 return -EINVAL;
>
> +       /* Edge detection requires explicit input. */
> +       if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
> +           !(flags & GPIO_V2_LINE_FLAG_INPUT))
> +               return -EINVAL;
> +
>         /*
>          * Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
>          * the hardware actually supports enabling both at the same time the
> @@ -547,6 +724,10 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
>         else if (flags & GPIO_V2_LINE_FLAG_INPUT)
>                 clear_bit(FLAG_IS_OUT, flagsp);
>
> +       assign_bit(FLAG_EDGE_RISING, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_EDGE_RISING);
> +       assign_bit(FLAG_EDGE_FALLING, flagsp,
> +                  flags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
>         assign_bit(FLAG_OPEN_DRAIN, flagsp,
>                    flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
>         assign_bit(FLAG_OPEN_SOURCE, flagsp,
> @@ -635,14 +816,85 @@ static long linereq_ioctl_compat(struct file *file, unsigned int cmd,
>  }
>  #endif
>
> +static __poll_t linereq_poll(struct file *file,
> +                           struct poll_table_struct *wait)
> +{
> +       struct linereq *lr = file->private_data;
> +       __poll_t events = 0;
> +
> +       poll_wait(file, &lr->wait, wait);
> +
> +       if (!kfifo_is_empty_spinlocked_noirqsave(&lr->events,
> +                                                &lr->wait.lock))
> +               events = EPOLLIN | EPOLLRDNORM;
> +
> +       return events;
> +}
> +
> +static ssize_t linereq_read(struct file *file,
> +                           char __user *buf,
> +                           size_t count,
> +                           loff_t *f_ps)
> +{
> +       struct linereq *lr = file->private_data;
> +       struct gpio_v2_line_event le;
> +       ssize_t bytes_read = 0;
> +       int ret;
> +
> +       if (count < sizeof(le))
> +               return -EINVAL;
> +
> +       do {
> +               spin_lock(&lr->wait.lock);
> +               if (kfifo_is_empty(&lr->events)) {
> +                       if (bytes_read) {
> +                               spin_unlock(&lr->wait.lock);
> +                               return bytes_read;
> +                       }
> +
> +                       if (file->f_flags & O_NONBLOCK) {
> +                               spin_unlock(&lr->wait.lock);
> +                               return -EAGAIN;
> +                       }
> +
> +                       ret = wait_event_interruptible_locked(lr->wait,
> +                                       !kfifo_is_empty(&lr->events));
> +                       if (ret) {
> +                               spin_unlock(&lr->wait.lock);
> +                               return ret;
> +                       }
> +               }
> +
> +               ret = kfifo_out(&lr->events, &le, 1);
> +               spin_unlock(&lr->wait.lock);
> +               if (ret != 1) {
> +                       /*
> +                        * This should never happen - we were holding the
> +                        * lock from the moment we learned the fifo is no
> +                        * longer empty until now.
> +                        */
> +                       ret = -EIO;
> +                       break;
> +               }
> +
> +               if (copy_to_user(buf + bytes_read, &le, sizeof(le)))
> +                       return -EFAULT;
> +               bytes_read += sizeof(le);
> +       } while (count >= bytes_read + sizeof(le));
> +
> +       return bytes_read;
> +}
> +
>  static void linereq_free(struct linereq *lr)
>  {
>         unsigned int i;
>
>         for (i = 0; i < lr->num_lines; i++) {
> +               edge_detector_stop(&lr->lines[i]);
>                 if (lr->lines[i].desc)
>                         gpiod_free(lr->lines[i].desc);
>         }
> +       kfifo_free(&lr->events);
>         kfree(lr->label);
>         put_device(&lr->gdev->dev);
>         kfree(lr);
> @@ -658,6 +910,8 @@ static int linereq_release(struct inode *inode, struct file *file)
>
>  static const struct file_operations line_fileops = {
>         .release = linereq_release,
> +       .read = linereq_read,
> +       .poll = linereq_poll,
>         .owner = THIS_MODULE,
>         .llseek = noop_llseek,
>         .unlocked_ioctl = linereq_ioctl,
> @@ -697,6 +951,9 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>         lr->gdev = gdev;
>         get_device(&gdev->dev);
>
> +       for (i = 0; i < ulr.num_lines; i++)
> +               lr->lines[i].req = lr;
> +
>         /* Make sure this is terminated */
>         ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
>         if (strlen(ulr.consumer)) {
> @@ -707,6 +964,14 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                 }
>         }
>
> +       init_waitqueue_head(&lr->wait);
> +       lr->event_buffer_size = ulr.event_buffer_size;
> +       if (lr->event_buffer_size == 0)
> +               lr->event_buffer_size = ulr.num_lines * 16;
> +       else if (lr->event_buffer_size > GPIO_V2_LINES_MAX * 16)
> +               lr->event_buffer_size = GPIO_V2_LINES_MAX * 16;
> +
> +       atomic_set(&lr->seqno, 0);
>         lr->num_lines = ulr.num_lines;
>
>         /* Request each GPIO */
> @@ -745,6 +1010,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                         ret = gpiod_direction_input(desc);
>                         if (ret)
>                                 goto out_free_linereq;
> +
> +                       ret = edge_detector_setup(&lr->lines[i],
> +                                       flags & GPIO_V2_LINE_EDGE_FLAGS);
> +                       if (ret)
> +                               goto out_free_linereq;
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> @@ -1267,6 +1537,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>         if (test_bit(FLAG_PULL_UP, &desc->flags))
>                 info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
>
> +       if (test_bit(FLAG_EDGE_RISING, &desc->flags))
> +               info->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
> +       if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
> +               info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
> +
>         spin_unlock_irqrestore(&gpio_lock, flags);
>  }
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index dfcff5d24b18..aa20481e9452 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2092,6 +2092,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>                 clear_bit(FLAG_PULL_UP, &desc->flags);
>                 clear_bit(FLAG_PULL_DOWN, &desc->flags);
>                 clear_bit(FLAG_BIAS_DISABLE, &desc->flags);
> +               clear_bit(FLAG_EDGE_RISING, &desc->flags);
> +               clear_bit(FLAG_EDGE_FALLING, &desc->flags);
>                 clear_bit(FLAG_IS_HOGGED, &desc->flags);
>  #ifdef CONFIG_OF_DYNAMIC
>                 desc->hog = NULL;
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 6709f79c02dd..39b356160937 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -114,6 +114,8 @@ struct gpio_desc {
>  #define FLAG_PULL_UP    13     /* GPIO has pull up enabled */
>  #define FLAG_PULL_DOWN  14     /* GPIO has pull down enabled */
>  #define FLAG_BIAS_DISABLE    15        /* GPIO has pull disabled */
> +#define FLAG_EDGE_RISING     16        /* GPIO CDEV detects rising edge events */
> +#define FLAG_EDGE_FALLING    17        /* GPIO CDEV detects falling edge events */
>
>         /* Connection label */
>         const char              *label;
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
