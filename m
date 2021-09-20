Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B21411416
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 14:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbhITMRE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 20 Sep 2021 08:17:04 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:44858 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbhITMRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 08:17:03 -0400
Received: by mail-vs1-f53.google.com with SMTP id c28so16314930vsh.11;
        Mon, 20 Sep 2021 05:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dcKWBJDDCm5/KrEU1JK27IMhUlggSfKYwlMvaoFcIfg=;
        b=FjyZYsm5sjBNnmvU6qMIrL0Pbu/H8+uAm/jAZ7O+l8GP3dYZVxnu01FeMeBUvGSzmW
         hrD6hdsi5tyRCIB2ZZJqcP6cUoxUEo33iuGXA1RfH0/MwgWFw0kgSbjKEPRe0ss8st8m
         P/HGKM856J/KVe05tvl37mn4TcyJUAvA+89ghZivq+AUINZOCMRBA5zwk7IzSN+VGugM
         qb04rrnOLoM7cPc4uqdKIMBR7PZN7uynvLWgHBVtJ2YACUtP45SUnLpY8Jnmv/VR3NJu
         rHaBldSu798ydBs1p51RL06cG6T87yQEKLYIQ4DKbZzd+jU4kmTBOkXQEneKq9nBwVU7
         sbTA==
X-Gm-Message-State: AOAM530oyKcJpQpLm8DbW6mcCDSvAly3LKAnqCOd7UNYh0hvHeXYrdef
        eT0TmiW2rj+U479ZxMxN/1Q0eRZaQ7aq9QlpsVAAp8Zu
X-Google-Smtp-Source: ABdhPJx1nHJtZvHq4rZSchfSEzSCgcCKUSaT80/oz8u7g2/nPh4CHjzyEPsBrhy3lzZtSKXgKwy/scTCvzD8hf3Uwqk=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr15865158vsl.9.1632140136191;
 Mon, 20 Sep 2021 05:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com> <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Sep 2021 14:15:25 +0200
Message-ID: <CAMuHMdXYpK861-=Esa3GqjkNMAqzLBiGN5NQKpHNo5d0w=FWmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wolfram,

On Sat, Sep 18, 2021 at 4:22 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Note that this is the second posting using v2, and the previous version
was simultaneously v1 and v3 (branch renesas/gpio-logic-analyzer-v3).
Resetting version numbers may confuse people and tools (e.g. b4).

> --- /dev/null
> +++ b/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
> @@ -0,0 +1,71 @@
> +=============================================
> +Linux Kernel GPIO based sloppy logic analyzer
> +=============================================
> +
> +:Author: Wolfram Sang
> +
> +Introduction
> +============
> +
> +This document briefly describes how to run the GPIO based in-kernel sloppy
> +logic analyzer running on an isolated CPU.
> +
> +Note that this is a last resort analyzer which can be affected by latencies,
> +non-determinant code paths and non-maskable interrupts. It is called 'sloppy'

non-deterministic?

> +for a reason. However, for e.g. remote development, it may be useful to get a
> +first view and aid further debugging.
> +
> +Setup
> +=====
> +
> +Tell the kernel which GPIOs are used as probes. For a Device Tree based system,
> +you need to use the following bindings. Because these bindings are only for
> +debugging, there is no official schema::
> +
> +    i2c-analyzer {
> +            compatible = "gpio-sloppy-logic-analyzer";
> +            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
> +            probe-names = "SCL", "SDA";
> +    };
> +
> +Note that you must provide a name for every GPIO specified. Currently a
> +maximum of 8 probes are supported. 32 are likely possible but are not
> +implemented yet.
> +
> +Usage
> +=====
> +
> +The logic analyzer is configurable via files in debugfs. However, it is
> +strongly recommended to not use them directly, but to use the script
> +``tools/gpio/gpio-sloppy-logic-analyzer``. Besides checking parameters more
> +extensively, it will isolate the CPU core so you will have least disturbance

the least

> +while measuring.
> +
> +The script has a help option explaining the parameters. For the above DT
> +snippet which analyzes an I2C bus at 400KHz on a Renesas Salvator-XS board, the

kHz

> +following settings are used: The isolated CPU shall be CPU1 because it is a big
> +core in a big.LITTLE setup. Because CPU1 is the default, we don't need a
> +parameter. The bus speed is 400kHz. So, the sampling theorem says we need to
> +sample at least at 800kHz. However, falling edges of both signals in an I2C
> +start condition happen faster, so we need a higher sampling frequency, e.g.
> +``-s 1500000`` for 1.5MHz. Also, we don't want to sample right away but wait
> +for a start condition on an idle bus. So, we need to set a trigger to a falling
> +edge on SDA while SCL stays high, i.e. ``-t 1H+2F``. Last is the duration, let
> +us assume 15ms here which results in the parameter ``-d 15000``. So,
> +altogether::
> +
> +    gpio-sloppy-logic-analyzer -s 1500000 -t 1H+2F -d 15000
> +
> +Note that the process will return you back to the prompt but a sub-process is
> +still sampling in the background. Unless this has finished, you will not find a
> +result file in the current or specified directory. For the above example, we
> +will then need to trigger I2C communication::
> +
> +    i2cdetect -y -r <your bus number>
> +
> +Result is a .sr file to be consumed with PulseView or sigrok-cli from the free
> +`sigrok`_ project. It is a zip file which also contains the binary sample data
> +which may be consumed by other software. The filename is the logic analyzer
> +instance name plus a since-epoch timestamp.
> +
> +.. _sigrok: https://sigrok.org/

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1682,4 +1682,21 @@ config GPIO_VIRTIO
>
>  endmenu
>
> +menu "GPIO hardware hacking tools"
> +
> +config GPIO_LOGIC_ANALYZER
> +       tristate "Sloppy GPIO logic analyzer"
> +       depends on (GPIOLIB || COMPILE_TEST) && EXPERT
> +       help
> +         This option enables support for a sloppy logic analyzer using polled
> +         GPIOs. Use the 'tools/gpio/gpio-sloppy-logic-analyzer' script with
> +         this driver. The script will make using it easier and will also

make it easier to use?

> +         isolate a CPU for the polling task. Note that this is a last resort
> +         analyzer which can be affected by latencies, non-determinant code

deterministic

> +         paths, or NMIs. However, for e.g. remote development, it may be useful
> +         to get a first view and aid further debugging.
> +
> +         If this driver is built as a module it will be called
> +         'gpio-sloppy-logic-analyzer'.
> +endmenu
>  endif

> --- /dev/null
> +++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sloppy logic analyzer using GPIOs (to be run on an isolated CPU)
> + *
> + * Use the 'gpio-sloppy-logic-analyzer' script in the 'tools/gpio' folder for
> + * easier usage and further documentation. Note that this is a last resort
> + * analyzer which can be affected by latencies and non-determinant code paths.

deterministic

> + * However, for e.g. remote development, it may be useful to get a first view
> + * and aid further debugging.

> +static int fops_capture_set(void *data, u64 val)
> +{
> +       struct gpio_la_poll_priv *priv = data;
> +       u8 *la_buf = priv->blob.data;
> +       unsigned long state = 0; /* zeroed because GPIO arrays are bitfields */
> +       unsigned long delay;
> +       ktime_t start_time;
> +       int i, ret;

unsigned int i

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

> +static int gpio_la_poll_probe(struct platform_device *pdev)
> +{
> +       struct gpio_la_poll_priv *priv;
> +       struct device *dev = &pdev->dev;
> +       const char *devname = dev_name(dev);
> +       const char *gpio_names[GPIO_LA_MAX_PROBES];
> +       char *meta = NULL;
> +       unsigned int meta_len = 0;
> +       int ret, i;

unsigned int i;

> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       mutex_init(&priv->lock);
> +
> +       fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
> +
> +       priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
> +       if (IS_ERR(priv->descs))
> +               return PTR_ERR(priv->descs);
> +
> +       /* artificial limit to keep 1 byte per sample for now */
> +       if (priv->descs->ndescs > GPIO_LA_MAX_PROBES)
> +               return -EFBIG;
> +
> +       ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +                                               priv->descs->ndescs);
> +       if (ret >= 0 && ret != priv->descs->ndescs)
> +               ret = -ENODATA;
> +       if (ret < 0) {
> +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> +               return ret;
> +       }
> +
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
> +               add_len = strlen(gpio_names[i]) + 10;
> +
> +               new_meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
> +               if (!new_meta)
> +                       return -ENOMEM;
> +
> +               meta = new_meta;
> +               meta_len += snprintf(meta + meta_len, add_len, "probe%02d=%s\n",

%02u

> +                                    i + 1, gpio_names[i]);
> +       }

> --- /dev/null
> +++ b/tools/gpio/gpio-sloppy-logic-analyzer
> @@ -0,0 +1,221 @@
> +#!/bin/sh -eu
> +# Helper script for the Linux Kernel GPIO sloppy logic analyzer
> +#
> +# Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
> +# Copyright (C) Renesas Electronics Corporation
> +#
> +# TODO: support SI units in command line parameters?
> +
> +samplefreq=1000000
> +numsamples=250000
> +cpusetdir='/dev/cpuset'
> +debugdir='/sys/kernel/debug'
> +ladirname='gpio-sloppy-logic-analyzer'
> +outputdir="$PWD"
> +neededcmds='taskset zip'
> +max_chans=8
> +duration=
> +initcpu=
> +lainstance=
> +lasysfsdir=
> +triggerdat=
> +trigger_bindat=
> +progname="${0##*/}"
> +print_help()
> +{
> +       cat <<EOF
> +$progname - helper script for the Linux Kernel Sloppy GPIO Logic Analyzer
> +Available options:
> +       -c|--cpu <n>: which CPU to isolate for sampling. Only needed once. Default <1>.
> +                     Remember that a more powerful CPU gives you higher sample speeds.

sampling speeds

> +                     Also CPU0 is not recommended as it usually does extra bookkeeping.
> +       -d|--duration-us <n>: number of microseconds to sample. Overrides -n, no default value.
> +       -h|--help: print this help
> +       -i|--instance <str>: name of the logic analyzer in case you have multiple instances. Default
> +                            to first instance found
> +       -k|--kernel-debug-dir: path to the kernel debugfs mountpoint. Default: <$debugdir>
> +       -n|--num_samples <n>: number of samples to acquire. Default <$numsamples>
> +       -o|--output-dir <str>: directory to put the result files. Default: current dir
> +       -s|--sample_freq <n>: desired sample frequency. Might be capped if too large. Default: 1MHz.

sampling

> +       -t|--trigger <str>: pattern to use as trigger. <str> consists of two-char pairs. First
> +                           char is channel number starting at "1". Second char is trigger level:
> +                           "L" - low; "H" - high; "R" - rising; "F" - falling
> +                           These pairs can be combined with "+", so "1H+2F" triggers when probe 1
> +                           is high while probe 2 has a falling edge. You can have multiple triggers
> +                           combined with ",". So, "1H+2F,1H+2R" is like the example before but it
> +                           waits for a rising edge on probe 2 while probe 1 is still high after the
> +                           first trigger has been met.
> +                           Trigger data will only be used for the next capture and then be erased.
> +Examples:
> +Samples $numsamples values at 1MHz with an already prepared CPU or automatically prepares CPU1 if needed,
> +use the first logic analyzer instance found:
> +       '$progname'
> +Samples 50us at 2MHz waiting for a falling edge on channel 2. CPU and instance as above:

µs

> +       '$progname -d 50 -s 2000000 -t "2F"'
> +
> +Note that the process exits after checking all parameters but a sub-process still works in
> +the background. The result is only available once the sub-process finishes.
> +
> +Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
> +a zip file which also contains the binary sample data which may be consumed by others.
> +The filename is the logic analyzer instance name plus a since-epoch timestamp.
> +EOF
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
