Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A282180A9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgGHHSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:18:09 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:43735 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgGHHSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:18:09 -0400
Received: by mail-ej1-f65.google.com with SMTP id l12so49205124ejn.10
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0u9YLIxIageO8dlqP6mHKrV3I5Y/Ii1tqc73sKGKtns=;
        b=r5bNrHNKABmjZL2LSTH7b38+wrd32rrJVb0xCud4eE70SE7qSvqb0SRaXVCmSDuzB5
         FwfFYfUg/m1xrzaTHdtZijKqx5grUgXNU1B9nH2YpvUjUrAeByl9a4ilIanHy33p5Ai7
         tvmz7bAK7JF130F6rUkn7X5IaZHxRLClMVNFIaug8Zq1Wuhbo3VOt3r5ojL0X5AoDl3O
         xXTnOYmWwoepU/4LSIOLGGKJvCNYJB4N8VRc3yC3gSyr08rWBRQykBf6ZnEq+lPc/OSL
         GipxK5w12K+73W2zKv+0orDzdz3Vy+pTjK1GZaM5v/ukUmP0BfekbKkIcrYJIqOlX3SA
         U0cA==
X-Gm-Message-State: AOAM533vd58fckOdnOsicwbvdRir5QPoBLpNyKelxnWS8ia8GGHoI5jV
        lUvduZG5JMsGLq+0KBhbbhQ=
X-Google-Smtp-Source: ABdhPJzjF4ADkuYNUEYLWzb2Zpm9uEGD97dqrKnLB3MMALdkSn4FWSX9uE9oz3WJkHeQ+tgUy/Yt+w==
X-Received: by 2002:a17:906:8381:: with SMTP id p1mr49759698ejx.280.1594192687790;
        Wed, 08 Jul 2020 00:18:07 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id q21sm1499228ejd.30.2020.07.08.00.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 00:18:07 -0700 (PDT)
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        andy@kernel.org
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
Message-ID: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
Date:   Wed, 8 Jul 2020 09:18:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I installed Linux on UMAX VisionBook 10Wi Pro. It sometimes boots, but
even then it encounters lags, soft lockups:
> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]
> watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [kworker/0:0H:6]
> watchdog: BUG: soft lockup - CPU#0 stuck for 21s! [kworker/0:2:133]
> watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:0]

spurious interrupts:
> irq 37: nobody cared (try booting with the "irqpoll" option)
> irq 80: nobody cared (try booting with the "irqpoll" option)
> irq 80: nobody cared (try booting with the "irqpoll" option)
> irq 37: nobody cared (try booting with the "irqpoll" option)

and similar. The irq handling is somehow screwed, as:

>  handlers:
>  [<00000000bfbdfc1a>] irq_default_primary_handler threaded [<00000000de877971>] int3496_thread_isr [extcon_intel_int3496]

But irq_default_primary_handler returns WAKE_THREAD and
int3496_thread_isr returns HANDLED. So something must have triggered a
lot of interrupts before the handler was instantiated.

When I run perf top, I see chv_gpio_irq_ack and chv_gpio_irq_handler at
the very top. Monitoring /proc/interrupts shows, that there are ~33000
interrupts/s from:
>   88:    2134217          0          0          0  chv-gpio    8  home
or
>   89:     221232          0          0          0  chv-gpio    3  INT3496:00

depending on what loads first -- the first is from soc_button_array
module, the second from extcon_intel_int3496.

If I blacklist *both* the modules, the system boots and works fine
(except of, I suppose, the vga connector and some buttons).

I tried this: > --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1469,6 +1469,13 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
>                 },
>         },
> +       {
> +               .ident = "UMAX VisionBook 10Wi Pro",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "UMAX"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "VisionBook 10Wi Pro"),
> +               },
> +       },
>         {}
>  };
>  
> @@ -1578,6 +1585,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>         if (need_valid_mask) {
>                 chip->irq.init_valid_mask = chv_init_irq_valid_mask;
>         } else {
> +               pr_info("%s: XXX quirk\n", __func__);
>                 irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
>                                                 community->npins, NUMA_NO_NODE);
>                 if (irq_base < 0) {

But it doesn't help (despite the message is logged). Any ideas?

Output of /proc/interrupts and with CONFIG_GENERIC_IRQ_DEBUGFS enabled
# head -100 /sys/kernel/debug/irq/domains/* /sys/kernel/debug/irq/irqs/*
is here:
https://paste.opensuse.org/view/raw/32092261

Note 125 is the stormed interrupt there now.

This is with 5.7.7, but 5.3.18 behaves the same. With the latter, the
module blacklisting doesn't help or I screwed up testing.

thanks,
-- 
js
suse labs
