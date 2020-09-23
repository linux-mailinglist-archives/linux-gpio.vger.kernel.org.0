Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D80C275D65
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 18:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgIWQ14 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 12:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWQ14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 12:27:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFA2C0613CE;
        Wed, 23 Sep 2020 09:27:55 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y6so7123950plt.9;
        Wed, 23 Sep 2020 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nC+x4Uq1t9dUrNUozhMC55aUGxmHKwhvoonxjgbKkQI=;
        b=mIcfprYbV0+il/0DY852qHf/ix9HsLmmnde5R7OvuAg/npgsFbBk3LW2jJtJf4wd5/
         ymcbOWFD8iEo53hUa2UOWUmNN+DPHdrgC14koPnESx++eweAawlwTWG3ErsZdM6Ay/kL
         66B96VH+x8MRKHsN+HhYmnNKXsHFttQY69vA4rnUTFN2PHWyaOYCY6uZa4xF4hSQYsRP
         pV7B9nm7b7GSulbqPTrBuyIz8zMvSVLEQt1FjgC7SEOK700l2ZgohbAg8h09qWq7aFo0
         9D1mPcd26WRrUJ6mtvcHEbrO2ddaMbVzgPyUppo5n4O2IXYnJsyjLBZoEYFohaWbzy9H
         yVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nC+x4Uq1t9dUrNUozhMC55aUGxmHKwhvoonxjgbKkQI=;
        b=gjAdO+BDX1SvzHvkg3aVLNnu6j9ynsDOA0bX2X84v2jejhGwHXeHxBe8f6xqIL74hW
         66QOYkE2bdO+0GGjfypWNcpBzQvbu+r6dpIJdaORJsY2ehjMICffYfcw5uMkOzNNuS4k
         kvFTgG1RaffuXIRMN6VFaP2PWstJNysmWCt6iBpJtIIZTuB8njsy9zqsLJ2SpMM9Kxrb
         QxlOlQeesrCdE4ppUBYS1PteTB62H8zHCzZSF1/6DC+iBW76pAFeMwDTe2LhuB0zk0ya
         HielcDc0BhHtE4C4qFL82cPUHM/85adYNsJf4MWi/Yc7pcJrY7+x9J7WrYXFC5loMI14
         qVMQ==
X-Gm-Message-State: AOAM530GhG8T+Qu7axfME76+gbkasaOBwxnHaP5VFCeGkRwA0Y5rs0S5
        OGzihHqPAgBLp1VhcwAmU6OMab8nhMyk6HY56Ao=
X-Google-Smtp-Source: ABdhPJz6+qQ8UP2S7CDehxadbxAI6wmIJLNcBx5SBJl4xMzPLASyHVZtRWAPzq4cCvZ2KfqncwArQ8YK+a6prfNaOAs=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr182500pjb.129.1600878475235;
 Wed, 23 Sep 2020 09:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-13-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-13-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 19:27:37 +0300
Message-ID: <CAHp75VchWpH0tH_RoewFwqk0vGfasArYTnf1dbeCiOdyqT-9MA@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] gpiolib: cdev: support setting debounce
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

On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for setting debounce on a line via the GPIO uAPI.
> Where debounce is not supported by hardware, a software debounce is
> provided.
>
> The implementation of the software debouncer waits for the line to be
> stable for the debounce period before determining if a level change,
> and a corresponding edge event, has occurred.  This provides maximum
> protection against glitches, but also introduces a debounce_period
> latency to edge events.
>
> The software debouncer is integrated with the edge detection as it
> utilises the line interrupt, and integration is simpler than getting
> the two to interwork.  Where software debounce AND edge detection is
> required, the debouncer provides both.


> +static unsigned int debounced_value(struct line *line)
> +{
> +       unsigned int value;
> +
> +       /*
> +        * minor race - debouncer may be stopped here, so edge_detector_stop

() ?

> +        * must leave the value unchanged so the following will read the level
> +        * from when the debouncer was last running.
> +        */
> +       value = READ_ONCE(line->level);
> +

> +       if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
> +               value = !value;

I'm not sure what this means in terms of unsingned int to be returned.

> +       return value;

Shouldn't we rather return 0/1 guaranteed?

Perhaps

 if (active_low)
  return !value;

return !!value;

?

> +}
> +
> +static irqreturn_t debounce_irq_handler(int irq, void *p)
> +{
> +       struct line *line = p;
> +
> +       mod_delayed_work(system_wq, &line->work,
> +               usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void debounce_work_func(struct work_struct *work)
> +{
> +       struct gpio_v2_line_event le;
> +       struct line *line = container_of(work, struct line, work.work);
> +       struct linereq *lr;
> +       int level;
> +
> +       level = gpiod_get_raw_value_cansleep(line->desc);
> +       if (level < 0) {
> +               pr_debug_ratelimited("debouncer failed to read line value\n");
> +               return;
> +       }
> +
> +       if (READ_ONCE(line->level) == level)
> +               return;
> +
> +       WRITE_ONCE(line->level, level);
> +
> +       /* -- edge detection -- */
> +       if (!line->eflags)
> +               return;

> +       /* switch from physical level to logical - if they differ */
> +       if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
> +               level = !level;

Seems to me a good candidate to have

static inline bool convert_with_active_low_respected(desc, value)
{
  if (active_low)
   return !value;
 return !!value;
}

> +       /* ignore edges that are not being monitored */
> +       if (((line->eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) && !level) ||
> +           ((line->eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) && level))
> +               return;
> +
> +       /* Do not leak kernel stack to userspace */
> +       memset(&le, 0, sizeof(le));
> +
> +       lr = line->req;
> +       le.timestamp_ns = ktime_get_ns();
> +       le.offset = gpio_chip_hwgpio(line->desc);
> +       line->line_seqno++;
> +       le.line_seqno = line->line_seqno;
> +       le.seqno = (lr->num_lines == 1) ?
> +               le.line_seqno : atomic_inc_return(&lr->seqno);
> +
> +       if (level)
> +               /* Emit low-to-high event */
> +               le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
> +       else
> +               /* Emit high-to-low event */
> +               le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
> +
> +       linereq_put_event(lr, &le);
> +}
> +
> +static int debounce_setup(struct line *line,
> +                         unsigned int debounce_period_us)
> +{
> +       unsigned long irqflags;
> +       int ret, level, irq;
> +
> +       /* try hardware */
> +       ret = gpiod_set_debounce(line->desc, debounce_period_us);
> +       if (!ret) {
> +               WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> +               return ret;
> +       }
> +       if (ret != -ENOTSUPP)
> +               return ret;
> +
> +       if (debounce_period_us) {
> +               /* setup software debounce */
> +               level = gpiod_get_raw_value_cansleep(line->desc);
> +               if (level < 0)
> +                       return level;
> +
> +               irq = gpiod_to_irq(line->desc);
> +               if (irq <= 0)

Same question about return code...

> +                       return -ENODEV;
> +
> +               WRITE_ONCE(line->level, level);
> +               irqflags = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
> +               ret = request_irq(irq, debounce_irq_handler, irqflags,
> +                                 line->req->label, line);
> +               if (ret)
> +                       return ret;
> +
> +               WRITE_ONCE(line->sw_debounced, 1);
> +               line->irq = irq;
> +       }
> +       return 0;
> +}
> +
> +static bool gpio_v2_line_config_debounced(struct gpio_v2_line_config *lc,
> +                                         unsigned int line_idx)
> +{
> +       unsigned int i;
> +       u64 mask = BIT_ULL(line_idx);
> +
> +       for (i = 0; i < lc->num_attrs; i++) {
> +               if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
> +                   (lc->attrs[i].mask & mask))
> +                       return true;
> +       }
> +       return false;
> +}
> +
> +static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
> +                                              unsigned int line_idx)
> +{
> +       unsigned int i;
> +       u64 mask = BIT_ULL(line_idx);
> +
> +       for (i = 0; i < lc->num_attrs; i++) {
> +               if ((lc->attrs[i].attr.id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE) &&
> +                   (lc->attrs[i].mask & mask))
> +                       return lc->attrs[i].attr.debounce_period_us;
> +       }
> +       return 0;
> +}
> +
>  static void edge_detector_stop(struct line *line)
>  {
>         if (line->irq) {
> @@ -578,12 +752,18 @@ static void edge_detector_stop(struct line *line)
>                 line->irq = 0;
>         }
>
> +       cancel_delayed_work_sync(&line->work);
> +       WRITE_ONCE(line->sw_debounced, 0);
>         line->eflags = 0;
> +       /* do not change line->level - see comment in debounced_value */
>  }
>
>  static int edge_detector_setup(struct line *line,
> +                              struct gpio_v2_line_config *lc,
> +                              unsigned int line_idx,
>                                u64 eflags)
>  {
> +       u32 debounce_period_us;
>         unsigned long irqflags = 0;
>         int irq, ret;
>
> @@ -594,8 +774,16 @@ static int edge_detector_setup(struct line *line,
>                         return ret;
>         }
>         line->eflags = eflags;
> +       if (gpio_v2_line_config_debounced(lc, line_idx)) {
> +               debounce_period_us = gpio_v2_line_config_debounce_period(lc, line_idx);
> +               ret = debounce_setup(line, debounce_period_us);
> +               if (ret)
> +                       return ret;
> +               WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> +       }
>
> -       if (!eflags)
> +       /* detection disabled or sw debouncer will provide edge detection */
> +       if (!eflags || READ_ONCE(line->sw_debounced))
>                 return 0;
>
>         irq = gpiod_to_irq(line->desc);
> @@ -620,15 +808,31 @@ static int edge_detector_setup(struct line *line,
>         return 0;
>  }
>
> -static int edge_detector_update(struct line *line, u64 eflags,
> -                               bool polarity_change)
> +static int edge_detector_update(struct line *line,
> +                               struct gpio_v2_line_config *lc,
> +                               unsigned int line_idx,
> +                               u64 eflags, bool polarity_change)
>  {
> -       if ((line->eflags == eflags) && !polarity_change)
> +       unsigned int debounce_period_us =
> +               gpio_v2_line_config_debounce_period(lc, line_idx);
> +
> +       if ((line->eflags == eflags) && !polarity_change &&
> +           (READ_ONCE(line->desc->debounce_period_us) == debounce_period_us))
>                 return 0;
>
> -       edge_detector_stop(line);
> +       /* sw debounced and still will be...*/

> +       if ((debounce_period_us != 0) && READ_ONCE(line->sw_debounced)) {

'(  != 0)' are redundant. But I think you want to show that it's not
boolean and we compare to 0...

> +               line->eflags = eflags;
> +               WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> +               return 0;
> +       }
> +
> +       /* reconfiguring edge detection or sw debounce being disabled */
> +       if ((line->irq && !READ_ONCE(line->sw_debounced)) ||
> +           (!debounce_period_us && READ_ONCE(line->sw_debounced)))
> +               edge_detector_stop(line);
>
> -       return edge_detector_setup(line, eflags);
> +       return edge_detector_setup(line, lc, line_idx, eflags);
>  }
>
>  static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
> @@ -726,6 +930,11 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>                 ret = gpio_v2_line_flags_validate(flags);
>                 if (ret)
>                         return ret;
> +
> +               /* debounce requires explicit input */
> +               if (gpio_v2_line_config_debounced(lc, i) &&
> +                   !(flags & GPIO_V2_LINE_FLAG_INPUT))
> +                       return -EINVAL;
>         }
>         return 0;
>  }
> @@ -762,7 +971,7 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
>         struct gpio_v2_line_values lv;
>         DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
>         struct gpio_desc **descs;
> -       unsigned int i, didx, num_get;
> +       unsigned int i, val, didx, num_get;
>         int ret;
>
>         /* NOTE: It's ok to read values of output lines. */
> @@ -801,7 +1010,11 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
>         lv.bits = 0;
>         for (didx = 0, i = 0; i < lr->num_lines; i++) {
>                 if (lv.mask & BIT_ULL(i)) {
> -                       if (test_bit(didx, vals))
> +                       if (lr->lines[i].sw_debounced)
> +                               val = debounced_value(&lr->lines[i]);
> +                       else
> +                               val = test_bit(didx, vals);
> +                       if (val)
>                                 lv.bits |= BIT_ULL(i);
>                         didx++;
>                 }
> @@ -905,7 +1118,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
>                         if (ret)
>                                 return ret;
>
> -                       ret = edge_detector_update(&lr->lines[i],
> +                       ret = edge_detector_update(&lr->lines[i], lc, i,
>                                         flags & GPIO_V2_LINE_EDGE_FLAGS,
>                                         polarity_change);
>                         if (ret)
> @@ -1099,8 +1312,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>         lr->gdev = gdev;
>         get_device(&gdev->dev);
>
> -       for (i = 0; i < ulr.num_lines; i++)
> +       for (i = 0; i < ulr.num_lines; i++) {
>                 lr->lines[i].req = lr;
> +               WRITE_ONCE(lr->lines[i].sw_debounced, 0);
> +               INIT_DELAYED_WORK(&lr->lines[i].work, debounce_work_func);
> +       }
>
>         /* Make sure this is terminated */
>         ulr.consumer[sizeof(ulr.consumer)-1] = '\0';
> @@ -1160,7 +1376,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                         if (ret)
>                                 goto out_free_linereq;
>
> -                       ret = edge_detector_setup(&lr->lines[i],
> +                       ret = edge_detector_setup(&lr->lines[i], lc, i,
>                                         flags & GPIO_V2_LINE_EDGE_FLAGS);
>                         if (ret)
>                                 goto out_free_linereq;
> @@ -1631,6 +1847,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>         struct gpio_chip *gc = desc->gdev->chip;
>         bool ok_for_pinctrl;
>         unsigned long flags;
> +       u32 debounce_period_us;
> +       unsigned int num_attrs = 0;
>
>         memset(info, 0, sizeof(*info));
>         info->offset = gpio_chip_hwgpio(desc);
> @@ -1691,6 +1909,14 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>         if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
>                 info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
>
> +       debounce_period_us = READ_ONCE(desc->debounce_period_us);
> +       if (debounce_period_us) {
> +               info->attrs[num_attrs].id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> +               info->attrs[num_attrs].debounce_period_us = debounce_period_us;
> +               num_attrs++;
> +       }
> +       info->num_attrs = num_attrs;
> +
>         spin_unlock_irqrestore(&gpio_lock, flags);
>  }
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index aa20481e9452..3cdf9effc13a 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2097,6 +2097,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>                 clear_bit(FLAG_IS_HOGGED, &desc->flags);
>  #ifdef CONFIG_OF_DYNAMIC
>                 desc->hog = NULL;
> +#endif
> +#ifdef CONFIG_GPIO_CDEV
> +               WRITE_ONCE(desc->de> --
> 2.28.0
>
bounce_period_us, 0);
>  #endif
>                 ret = true;
>         }
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 39b356160937..b674b5bb980e 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -124,6 +124,10 @@ struct gpio_desc {
>  #ifdef CONFIG_OF_DYNAMIC
>         struct device_node      *hog;
>  #endif
> +#ifdef CONFIG_GPIO_CDEV
> +       /* debounce period in microseconds */
> +       unsigned int            debounce_period_us;
> +#endif
>  };
>
>  int gpiod_request(struct gpio_desc *desc, const char *label);

-- 
With Best Regards,
Andy Shevchenko
