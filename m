Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAE8B400F4A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Sep 2021 13:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhIELWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Sep 2021 07:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhIELWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Sep 2021 07:22:33 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93B8C061575;
        Sun,  5 Sep 2021 04:21:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i24so3260971pfo.12;
        Sun, 05 Sep 2021 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NriIdZAXPfbBB2tJpse2NZflOcwHiN/+TbmjQ+V+Aw=;
        b=NwV6bZisW65sj/6s6Vj2QSVeZjY+vTq9I8g4SSauLFEbaIpcIvudyYL8sq/eeIhtiw
         GH5k1AnlP0zxIE6f01WNWAg/WOynHy16kzCjoplrQq4355cbcIl631ZM1ELLRNpHO3RN
         qdBWkkqnItk8DAM6mqHpgPrFZoDSyn70wIvBWh+n7esQJ+J5L5iyiMCkAKz3qRzcDBWu
         40RQu7AxDBhU/FIFCOVrw1okLJv+TNWQaRstT4VPaYtI0yvto3lwS0WrQUUEkcoRF3X1
         GqWphZjZaCbxTEiZpqKTRA4zxKeL3AmgVi950getD1XZfF2RPGsIobaVHHepsyYeEq5n
         WrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NriIdZAXPfbBB2tJpse2NZflOcwHiN/+TbmjQ+V+Aw=;
        b=ERAyn6XwnI6jbbMAOcrBtDiUkbAgBPrxTsNhXhnjyoRutZC4G5IbCamdbvShagA3FH
         /hk0ReabieQMCIceGKOqGKVAYn5SxafixEOM2SkwGPOJui+4Wz3e8MQ5+NTFNJE5qfpL
         FlU+DeiemGFhjOwtyktHcWvmpsbM2f1OyipwQpHug8whi+mg4ts0vinM5ER6HpYM6/PJ
         ucJMp6CNThRjsgPPODPptJgieuLh2pJpx4+jXvjuSaxfsZP4h3LDdYwABMGT2FynoTm5
         Xkb7VHUTrLHc9oZP+kg85G/47ihVhQCBQjLJf+VS9HTcRxRunKmCQSYAePCEiATcH7s8
         oSSA==
X-Gm-Message-State: AOAM531aVml2I2KF+AE6nPN6RdonYvehEmiZTOLk/+Kga+Se80GjUVD5
        nCiDg2TFV0S86QNX+TX4E+d44qK8ejSlyIGE2Jfq6qe6ZzFqmvkC
X-Google-Smtp-Source: ABdhPJwyV9kJWwswDRgIQO1YvXlOhCo0iGZ0gCB0C5GI/POfCkT6SVfx2QxIlL63g2NSboZUFi+h1L8Vh+BXS4yde+8=
X-Received: by 2002:a05:6a00:1750:b0:40c:f3b8:dc76 with SMTP id
 j16-20020a056a00175000b0040cf3b8dc76mr7215177pfc.22.1630840889010; Sun, 05
 Sep 2021 04:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com> <20210901194549.3999-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210901194549.3999-2-wsa+renesas@sang-engineering.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 5 Sep 2021 14:20:52 +0300
Message-ID: <CAHp75VdZt_dDb0YpThfsoqRvWdjfVZT70o=eCJCbThJ9qbD42w@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 1, 2021 at 11:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definately not a production

definitely

> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

...

> +static __always_inline int gpio_la_get_array(struct gpio_descs *d, unsigned long *sptr)
> +{
> +       int ret;
> +
> +       ret = gpiod_get_array_value(d->ndescs, d->desc, d->info, sptr);

> +       if (ret == 0 && fatal_signal_pending(current))
> +               ret = -EINTR;
> +
> +       return ret;

I would rewrite it, like

if (ret)
  return ret;

if (...)
  return -EINTR;

return 0;

but it is a matter of style.

> +}
> +
> +static int fops_capture_set(void *data, u64 val)
> +{
> +       struct gpio_la_poll_priv *priv = data;
> +       u8 *la_buf = priv->blob.data;

> +       unsigned long state = 0; /* zeroed because GPIO arrays are bitfields */

Not sure if bitmap_zero() would be better. Up to you.

> +       unsigned long delay;
> +       ktime_t start_time;
> +       int i, ret;
> +
> +       if (!val)
> +               return 0;
> +
> +       if (!la_buf)
> +               return -ENOMEM;
> +
> +       if (!priv->delay_ns)
> +               return -EINVAL;
> +
> +       mutex_lock(&priv->lock);
> +       if (priv->blob_dent) {
> +               debugfs_remove(priv->blob_dent);
> +               priv->blob_dent = NULL;
> +       }
> +
> +       priv->buf_idx = 0;
> +
> +       local_irq_disable();
> +       preempt_disable_notrace();
> +
> +       /* Measure delay of reading GPIOs */
> +       start_time = ktime_get();
> +       for (i = 0; i < GPIO_LA_NUM_TESTS; i++) {
> +               ret = gpio_la_get_array(priv->descs, &state);
> +               if (ret)
> +                       goto gpio_err;
> +       }
> +
> +       priv->acq_delay = ktime_sub(ktime_get(), start_time) / GPIO_LA_NUM_TESTS;
> +       if (priv->delay_ns < priv->acq_delay) {
> +               ret = -ERANGE;
> +               goto gpio_err;
> +       }
> +
> +       delay = priv->delay_ns - priv->acq_delay;
> +
> +       /* Wait for triggers */
> +       for (i = 0; i < priv->trig_len; i+= 2) {
> +               do {
> +                       ret = gpio_la_get_array(priv->descs, &state);
> +                       if (ret)
> +                               goto gpio_err;
> +
> +                       ndelay(delay);
> +               } while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
> +       }
> +
> +       /* With triggers, final state is also the first sample */
> +       if (priv->trig_len)
> +               la_buf[priv->buf_idx++] = state;
> +
> +       /* Sample */
> +       while (priv->buf_idx < priv->blob.size) {
> +               ret = gpio_la_get_array(priv->descs, &state);
> +               if (ret)
> +                       goto gpio_err;
> +
> +               la_buf[priv->buf_idx++] = state;
> +               ndelay(delay);
> +       }
> +gpio_err:
> +       preempt_enable_notrace();
> +       local_irq_enable();
> +       if (ret)
> +               dev_err(priv->dev, "couldn't read GPIOs: %d\n", ret);
> +
> +       kfree(priv->trig_data);
> +       priv->trig_data = NULL;
> +       priv->trig_len = 0;
> +
> +       priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
> +       mutex_unlock(&priv->lock);
> +
> +       return ret;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_capture, NULL, fops_capture_set, "%llu\n");

...

> +static int fops_buf_size_set(void *data, u64 val)
> +{
> +       struct gpio_la_poll_priv *priv = data;
> +       int ret = 0;
> +       void *p;
> +
> +       if (!val)

> +               return -EINVAL;

Hmm... in this case you haven't updated the internal parameters, but...

> +       mutex_lock(&priv->lock);
> +
> +       vfree(priv->blob.data);
> +       p = vzalloc(val);
> +       if (!p) {
> +               val = 0;
> +               ret = -ENOMEM;

...here you do. What's the difference?

> +       }
> +
> +       priv->blob.data = p;
> +       priv->blob.size = val;
> +
> +       mutex_unlock(&priv->lock);
> +       return ret;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_buf_size, fops_buf_size_get, fops_buf_size_set, "%llu\n");

...

> +       ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +                                               priv->descs->ndescs);
> +       if (ret >= 0 && ret != priv->descs->ndescs)

> +               ret = -ENOSTR;

A bit of an unusual error code.
Perhaps -ENODATA?

> +       if (ret < 0) {
> +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> +               return ret;
> +       }

...

> +       for (i = 0; i < priv->descs->ndescs; i++) {
> +               unsigned int add_len;
> +               char *new_meta, *consumer_name;
> +
> +               if (gpiod_cansleep(priv->descs->desc[i]))
> +                       return -EREMOTE;
> +
> +               consumer_name = kasprintf(GFP_KERNEL, "%s: %s", devname, gpio_names[i]);
> +               if (!consumer_name)
> +                       return -ENOMEM;
> +               gpiod_set_consumer_name(priv->descs->desc[i], consumer_name);
> +               kfree(consumer_name);
> +

> +               /* '10' is length of 'probe00=\n\0' */

Maybe instead of comment is to use respective strlen():s / sizeof():s?

Actually, looking below possible option is

const char *fmt = "probe...";

add_len += sprintf(NULL, 0, fmt, 0, "");

...

snprintf(..., fmt, ...);

But it's up to you.

> +               add_len = strlen(gpio_names[i]) + 10;
> +
> +               new_meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
> +               if (!new_meta)
> +                       return -ENOMEM;
> +
> +               meta = new_meta;
> +               snprintf(meta + meta_len, add_len, "probe%02d=%s\n", i + 1, gpio_names[i]);

> +               /* ' - 1' to skip the NUL terminator */
> +               meta_len += add_len - 1;

Reuse return value from snprintf()?

> +       }

...

> +static int gpio_la_poll_remove(struct platform_device *pdev)
> +{
> +       struct gpio_la_poll_priv *priv = platform_get_drvdata(pdev);
> +
> +       mutex_lock(&priv->lock);
> +       debugfs_remove_recursive(priv->debug_dir);
> +       mutex_unlock(&priv->lock);

mutex_destroy()?

> +
> +       return 0;
> +}

...

> +#!/bin/sh -eu

Next step is to add 'f' to the mix here :-)

...

> +$0 - helper script for the Linux Kernel Sloppy GPIO Logic Analyzer

Use at the top something like

PROG_NAME="${0##*/}"
PROG_DIR="${0%/*}"

And then $PROG_NAME here.

...

> +Samples $numsamples values at 1MHz with an already prepared CPU or automatically prepares CPU1 if needed,
> +use the first logic analyzer instance found:
> +       '$0'

Ditto,

> +Samples 50us at 2MHz waiting for falling edge on channel 2. CPU and instance as above:

for a falling

> +       '$0 -d 50 -s 2000000 -t "2F"'

Ditto (program name)

...

> +fail()
> +{
> +       echo "$1"
> +       exit 1

echo "$2'
exit $1

And use

  fail <ERROR_CODE> "<ERROR_MESSAGE>"

?

> +}

...

> +       [ -n "$cur_cpu" ] && fail "CPU$isol_cpu requested but CPU$cur_cpu already isolated"

This theoretically may fail the script since you have '-e'.
I guess I have mentioned that 'a && b' is not an equivalent to 'if-then-fi'.
I suggest double checking all similar expressions and try under
different shells (like dash).


> +       [ -w "$cpufreqgov" ] && echo 'performance' > "$cpufreqgov" || true

I guess this is where you actually hit the above mentioned difference.

...

> +while true; do
> +       case "$1" in
> +       -c|--cpu) initcpu="$2"; shift 2;;
> +       -d|--duration-us) duration="$2"; shift 2;;
> +       -h|--help) print_help; exit 0;;
> +       -i|--instance) lasysfsdir="$sysfsdir/$2"; shift 2;;
> +       -k|--kernel-debug-dir) debugdir="$2"; shift 2;;
> +       -n|--num_samples) numsamples="$2"; shift 2;;
> +       -o|--output-dir) outputdir="$2"; shift 2;;
> +       -s|--sample_freq) samplefreq="$2"; shift 2;;
> +       -t|--trigger) triggerdat="$2"; shift 2;;
> +       --)     shift; break;;
> +       *)      fail "error parsing commandline: $*";;
> +       esac

I would prefer to have a clear shift here instead of doing shift 2
everywhere above (less error prone).

> +done

...

I think usage of SI units makes sense to be less error prone in case
you are using them more than once.

-- 
With Best Regards,
Andy Shevchenko
