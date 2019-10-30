Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8F1E9BAC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 13:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfJ3MmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 08:42:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33746 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3MmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 08:42:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id t5so2532313ljk.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I5mZQTqFepO47vaRXrWh5DzOJ3qHuyhm2O0U6chkSUQ=;
        b=Mfr9mKZulAlznHzMuN7SrDlqRCXz1ys+kuYaoURP8/b+q2ntkdbxqtTP1m1wd2eJqx
         FqbZmYEdZuS4iB+SjnpVyf1fESTW1zrKXjhGi3Nl7fWIDw1qoWlcLpeYLTrIFFRCY0KD
         uJkbqYK2nTz9qR+1MYKHMFSZRvthxBNdBMDwdc1JNDf8Do3TZES1qAI0oq6kLwb0NVOT
         oVz6Z9WySn0pblvlQZfxZh+q5tuvA68QZUOJEyPG4iLblr6YU5nYatoVYiPOwQ1HeaFx
         T9Qk80aoDfWngNMJtBGi3JTottvBr3aClwdGvzSVUblqo2srOLXosHPdgyEJUg5Bubem
         B2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5mZQTqFepO47vaRXrWh5DzOJ3qHuyhm2O0U6chkSUQ=;
        b=eyRmi24OeoC63x3aMLKpcT9JBG63f0wR1xD0C2eTCHes39eHdbDiDLfpJKyglzB4Mi
         0BAkani6QumECJ6Vh6mZYQLLm+1xU+Yx/ipDXTKaMidPnVJfwrxFuhzqHij2H8BWwvEn
         ttkb1BVdMDAAJbf8OTdZ2ikPgHa5Kd7XJFJomZJMpgJy6+7OX8osv4yUIdn7dqINAWV3
         RVJPnmhEH0ZVhZPscYyaNG7dC4I9MyYjNIIFfwEjklNrjtJEJAxmPqozkTDu14Vp6oB8
         sMHr/+i3AgXj9QBj2UXE8pudHiSCZs0M/glDRdvQ1JtyNlF6eXINaTDYH6jVDJVO76OC
         HgVw==
X-Gm-Message-State: APjAAAWtb3n0pDy+h70GwH2Ytgano6c3r283CDvWmHmbL1Ny70OkrN9m
        vrBn8/ulAxO2lucSmlDgnb02zt8/IpLIn5oc5KoFCg==
X-Google-Smtp-Source: APXvYqwx+ng42kyEDka0fafC+671z3lgcsKTR1Jm48ZIdijisMOcwjKYngNU/xayVuwdVrS9Ta91Tm/8bDQLCpSIYxA=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr6647925lja.218.1572439335753;
 Wed, 30 Oct 2019 05:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com> <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
In-Reply-To: <ddd33998-43c4-7772-16dd-c09c2184c51d@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 13:42:02 +0100
Message-ID: <CACRpkdboOodR4Ux-bNp+XcFkTtxA-QehtP6+H+RsfFk+h6OaXQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization
 to a dedicated callback
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 10:31 AM Hans de Goede <hdegoede@redhat.com> wrote:

> The problem here is that gpiochip_add_data_with_key() calls gpiochip_irqchip_init_hw()
> before it calls gpiochip_irqchip_init_valid_mask(), so after commit 88583e340a0e
> when byt_gpio_irq_init_hw runs gc->irq.valid_mask is NULL and we crash with a NULL
> pointer exception (or so I believe, the kernel never gets far enough to get
> any info out of it without extra work).
>
> Note that this ("[PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated callback")
> patch fixes this since it moves the gc->irq.valid_mask accesses to
> byt_init_irq_valid_mask.

OK so we have a halfway fix there.

> But this change itself triggers another variant of this ordering issue,
> it causes these 2 new errors to get logged:
>
> byt_gpio INT33FC:01: GPIO interrupt error, pins misconfigured. INT_STAT0: 0x01800000
> byt_gpio INT33FC:02: GPIO interrupt error, pins misconfigured. INT_STAT0: 0x00400000
>
> The problem is that before this change the code calculating the valid_mask
> would also disable interrupts on GPIOs which do not have their
> BYT_DIRECT_IRQ_EN bit set. This now happens after the check done in
> byt_gpio_irq_init_hw() causing these false-positive error messages.

Isn't that easily fixed with something like this:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9afbc0612126..e865c889ba8d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct
gpio_chip *chip, void *data,

        machine_gpiochip_add(chip);

-       ret = gpiochip_irqchip_init_hw(chip);
+       ret = gpiochip_irqchip_init_valid_mask(chip);
        if (ret)
                goto err_remove_acpi_chip;

-       ret = gpiochip_irqchip_init_valid_mask(chip);
+       ret = gpiochip_irqchip_init_hw(chip);
        if (ret)
                goto err_remove_acpi_chip;

(I sent a separate patch for this.)

It isn't super-easy to know the right ordering semantics
for init_hw vs init_valid_mask I think. Sadly we need to
test it out in practice.

> Even if we ignore the NULL pointer deref problem for now and we ignore
> these 2 new error messages for now. Things are still broken with the
> current changes in pinctrl/intel.git/for-next switching to letting
> devm_gpiochip_add_data register the irqchip means that
> acpi_gpiochip_request_interrupts() gets called before
> gpiochip_add_pin_range() is called from pinctrl-baytrail.c, causing
> the GPIO lookup of any ACPI _AEI handlers to fail, resulting in
> errors like this one:
>
> byt_gpio INT33FC:02: Failed to request GPIO for pin 0x13: -517
>
> And none of the _AEI handlers working

I just vaguely understand this...

If what you're saying is that the Baytrail driver is dependent
on registering the pin ranges *before* registering the GPIO
chip can we then:

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
b/drivers/pinctrl/intel/pinctrl-baytrail.c
index beb26550c25f..b308567c5153 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1549,16 +1549,20 @@ static int byt_gpio_probe(struct byt_gpio *vg)
                girq->handler = handle_bad_irq;
        }

-       ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
+       /*
+        * Needs to happen first since the gpiochip is using pin
+        * control as back-end.
+        */
+       ret = gpiochip_add_pin_range(gc, dev_name(&vg->pdev->dev),
+                                    0, 0, vg->soc_data->npins);
        if (ret) {
-               dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
+               dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
                return ret;
        }

-       ret = gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
-                                    0, 0, vg->soc_data->npins);
+       ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
        if (ret) {
-               dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
+               dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
                return ret;
        }

(Tell me if I should send this as a separate patch.)

It's not entirely logical to have this semantic ordering so
the extra comment explains it, I hope, in case it actually
works.

> TL;DR: commit 88583e340a0e ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
> breaks a bunch of stuff and should be dropped from pinctrl/intel.git/for-next
> and this needs some more work before it is ready for mainline.

I don't know if that is such a good idea if this is a global problem,
like something that would potentially disturb any ACPI-based
GPIO chip. We might leave something else broken even if we
fix the issue locally.

Yours,
Linus Walleij
