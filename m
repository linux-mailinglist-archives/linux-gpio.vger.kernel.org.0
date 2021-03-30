Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39D234E5C7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhC3KuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhC3Ktu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:49:50 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA59BC061574;
        Tue, 30 Mar 2021 03:49:49 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so1125211pjb.0;
        Tue, 30 Mar 2021 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrGU0EHV33eZgUS471R443XzOw4rBxLyBwGIaa5bkhg=;
        b=R2tyBehYCjuqQ1cnyPXArmpSoXe2pWDKjtrf3A7oAPVOoOFYSe6Xm9y6VR8Ssr1Bk/
         7LzPwA6Z4w9TOtj4+8D8zpbCTAfI5ddzPgtOfBPuJPYDWgoWJtp/W487/NdtC5QkKhks
         jM30UsixBEdPELcOr+UzkLIUGFh4oOZ0SIaQ2eZmnQIE8BOGcULkVnnbSPsH0JzHyZqE
         5z4NjbGVNhifpcv2OqQh1pMrOpzDP0Tp1LwC5qVqD5zrL0h7zfYGxHTUBRgfnJ0Y64yi
         wyxnhgLkiLDWrB+n3N2DzaY49FCDJt2U3k/jl0V5qCs9E/jS0Vt12tpI2IN7wwT0etl+
         1WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrGU0EHV33eZgUS471R443XzOw4rBxLyBwGIaa5bkhg=;
        b=dPBn/p8DApkCFsTi32bCSCJuZya9xz+DzeQSzA2ohptbh9WAqj9p9m7Jqq+2wIOcG2
         AC682aY8e+eiE58uuq29/2rltCm7fnaVByYW9XACEomJYH4JxJEBUKpdDOYSqxO+bXxh
         WzjgQ3dgMDxDMy69wU+SyaaLhM00qIAN960n7h+pYCk9KxWN2THGLURbvqbMNCy3phh9
         sno12xonlBbCxFdu6CY1Y/cwgcW3oU1JPmoBGXiBgHTMwReiJug62u/Ti+QE7ojhRZH5
         AN4cPpmB6qgx1mTjV/NuxKmc3xgsPad/DqLSdXAfF9AbpBtF6KHZusI75MOs8/uCsV7I
         iY3A==
X-Gm-Message-State: AOAM532SbWr7imKT7MyXmw2QGcOspDuIloaWaMWXXkMllBzkrj55sNXQ
        kBc/g1VwV8Pp3vvfWNHVf5QnG9m2Abqocf3JzfOmXhe0jEUlXA==
X-Google-Smtp-Source: ABdhPJykNpclOYNK8sD3z7syuCwKwvxBpCoBl1elvrWMoaq5AfB9SSD6B/YwZGkw7dRth99f7YDatwj0i7m9jpuSXjA=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr33146520plb.21.1617101389121; Tue, 30
 Mar 2021 03:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com> <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:49:32 +0300
Message-ID: <CAHp75VcVQJ6ezyHUc8TMd0qp453QgLL42N5GqWOy5oxrp5_qnQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 11:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a simple logic analyzer using GPIO polling. It comes with a
> script to isolate a CPU for polling. While this is definately not a

definitely

> production level analyzer, it can be a helpful first view when remote
> debugging. Read the documentation for details.

I would like to look at it closer, but don't have time right now. So,
some kind of a shallow review.

But the idea is, let's say, interesting.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

...

> +The binding documentation is in the ``misc`` folder of the Kernel binding
> +documentation.

Can't you give a reference in terms of reST format?

...

> +Note that the process will return you back to the prompt but a sub-process is
> +still sampling in the background. Unless this finished, you will not find a

this is finished

> +result file in the current or specified directory. Please also note that
> +currently this sub-process is not killable! For the above example, we will then
> +need to trigger I2C communication:

Shouldn't you use :: instead of : to mark sections as code excerpts?

> +    i2cdetect -y -r <your bus number>

...

> +config GPIO_LOGIC_ANALYZER
> +       tristate "Simple GPIO logic analyzer"
> +       depends on GPIOLIB || COMPILE_TEST
> +       help
> +         This option enables support for a simple logic analyzer using polled
> +         GPIOs. Use the 'tools/debugging/gpio-logic-analyzer' script with this
> +         driver. The script will make using it easier and can also isolate a
> +         CPU for the polling task. Note that this is still a last resort
> +         analyzer which can be affected by latencies and non-determinant code
> +         paths. However, for e.g. remote development, it may be useful to get
> +         a first view and aid further debugging.

Module name?

...

> +#include <linux/of.h>

Can you switch to use device property API?

...

> +#define GPIO_LA_NAME "gpio-logic-analyzer"
> +#define GPIO_LA_DEFAULT_BUF_SIZE SZ_256K

> +/* can be increased if needed */
> +#define GPIO_LA_MAX_PROBES 8
> +#define GPIO_LA_PROBES_MASK 7

Does this assume the power-of-two number of probes?
Perhaps using BIT(x) and (BIT(x) - 1) will clarify that.

...

> +struct gpio_la_poll_priv {
> +       unsigned long ndelay;
> +       u32 buf_idx;
> +       struct mutex lock;
> +       struct debugfs_blob_wrapper blob;
> +       struct gpio_descs *descs;
> +       struct dentry *debug_dir, *blob_dent;
> +       struct debugfs_blob_wrapper meta;
> +       unsigned long gpio_delay;
> +       unsigned int trigger_len;

> +       u8 trigger_data[PAGE_SIZE];

This is not good for fragmentation (basically you make your struct to
occupy 2 pages, one of which will be almost wasted). Better to have a
pointer here and allocate one page by get_zero_page() or so.

> +};
> +
> +static struct dentry *gpio_la_poll_debug_dir;
> +
> +static int fops_capture_set(void *data, u64 val)
> +{
> +       struct gpio_la_poll_priv *priv = data;
> +       u8 *la_buf = priv->blob.data;
> +       unsigned long state = 0;
> +       int i, ret;
> +
> +       if (!la_buf)
> +               return -ENOMEM;

> +       if (val) {

if (!val)
  return 0;

makes your life easier.

> +               mutex_lock(&priv->lock);
> +               if (priv->blob_dent) {
> +                       debugfs_remove(priv->blob_dent);
> +                       priv->blob_dent = NULL;
> +               }
> +
> +               priv->buf_idx = 0;
> +
> +               local_irq_disable();
> +               preempt_disable_notrace();
> +
> +               for (i = 0; i < priv->trigger_len; i++) {
> +                       u8 data = priv->trigger_data[i];
> +                       do {
> +                               ret = gpiod_get_array_value(priv->descs->ndescs, priv->descs->desc,
> +                                                           priv->descs->info, &state);
> +
> +                               if (ret)
> +                                       goto gpio_err;
> +                       } while (!!(state & BIT(data & GPIO_LA_PROBES_MASK)) != !!(data & 0x80));
> +               }
> +
> +               if (priv->trigger_len) {
> +                       la_buf[priv->buf_idx++] = state;
> +                       ndelay(priv->ndelay);
> +               }
> +
> +               while (priv->buf_idx < priv->blob.size && ret == 0) {
> +                       ret = gpiod_get_array_value(priv->descs->ndescs, priv->descs->desc,
> +                                             priv->descs->info, &state);
> +                       la_buf[priv->buf_idx++] = state;
> +                       ndelay(priv->ndelay);
> +               }
> +gpio_err:
> +               preempt_enable_notrace();
> +               local_irq_enable();
> +               if (ret)

> +                       pr_err("%s: couldn't read GPIOs: %d\n", __func__, ret);

Haven't noticed if you are using pr_fmt(). It may be better than using __func__.

Btw, it seems you have a struct device for that or so. Why don't you
use dev_err()?

> +               priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
> +               mutex_unlock(&priv->lock);
> +       }
> +
> +       return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_capture, NULL, fops_capture_set, "%llu\n");


> +static ssize_t trigger_write(struct file *file, const char __user *ubuf,
> +                            size_t count, loff_t *offset)
> +{
> +       struct seq_file *m = file->private_data;
> +       struct gpio_la_poll_priv *priv = m->private;
> +       char *buf;
> +       int i, trigger_len = 0;
> +
> +       priv->trigger_len = 0;
> +
> +       if (count & 1)
> +           return -EINVAL;
> +
> +       buf = memdup_user(ubuf, count);
> +       if (IS_ERR(buf))
> +               return PTR_ERR(buf);
> +
> +       for (i = 0; i < count; i += 2) {
> +               u8 val;
> +
> +               if (buf[i] < '1' || buf[i] > '0' + GPIO_LA_MAX_PROBES)

So, you can't increase the amount of probes without breaking this
entire parser (it will go somewhere to symbols and letters...).

> +                       goto bail_out;
> +
> +               val = buf[i] - '1';
> +
> +               switch (toupper(buf[i + 1])) {
> +               case 'L':
> +                       priv->trigger_data[trigger_len] = val;
> +                       trigger_len++;
> +                       break;
> +               case 'H':
> +                       priv->trigger_data[trigger_len] = val | 0x80;
> +                       trigger_len++;
> +                       break;
> +               case 'R':
> +                       priv->trigger_data[trigger_len] = val;
> +                       priv->trigger_data[trigger_len + 1] = val | 0x80;
> +                       trigger_len += 2;
> +                       break;
> +               case 'F':
> +                       priv->trigger_data[trigger_len] = val | 0x80;
> +                       priv->trigger_data[trigger_len + 1] = val;
> +                       trigger_len += 2;
> +                       break;
> +               default:
> +                       goto bail_out;
> +               }
> +
> +               if (trigger_len > PAGE_SIZE)    /* should never happen */

Shouldn't you return OVERFLOW here or something like that?

> +                       goto bail_out;
> +
> +       }
> +
> +       priv->trigger_len = trigger_len;
> +
> +bail_out:
> +       kfree(buf);
> +       return priv->trigger_len ? count : -EINVAL;
> +}

I'm not a fan of yet another parser in the kernel. Can you provide a
bit of description of the format?

...

> +       priv->debug_dir = debugfs_create_dir(dev_name(dev), gpio_la_poll_debug_dir);

> +       if (IS_ERR(priv->debug_dir))
> +               return PTR_ERR(priv->debug_dir);

Shouldn't be checked AFAIU.

...

> +static const struct of_device_id gpio_la_poll_of_match[] = {
> +       { .compatible = GPIO_LA_NAME, },

> +       { },

No comma needed.

> +};
> +MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);

...

> +       -t|--trigger <str>: pattern to use as trigger. <str> consists of n two-char pairs. First
> +                           char is channel number starting at "1". Second char is trigger level:
> +                           "L" - low; "H" - high; "R" - rising; "F" - falling
> +Examples:
> +Samples $NUMSAMPLES at 1MHz with already prepared CPU or automatically prepare CPU1 if needed

with an already
prepares

> +       '$0'
> +Samples 50us at 2MHz waiting for falling edge on channel 2. CPU usage as above.
> +       '$0 -d 50 -s 2000000 -t "2F"'
> +
> +Note that the process exits after checking all parameters but a sub-process still works in
> +the background. The result is only available once the sub-process finished. As the time of

finishes

> +writing, the sub-process is not killable, so be extra careful that your triggers work.
> +
> +Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
> +a zip file which also contains the binary sample data which may be consumed by others.
> +The filename is the logic analyzer instance name plus a since-epoch timestamp.
> +EOF
> +}

-- 
With Best Regards,
Andy Shevchenko
