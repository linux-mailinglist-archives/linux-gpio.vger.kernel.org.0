Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0EE17D9FD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 08:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgCIHpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 03:45:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45596 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIHpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 03:45:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id m9so690091wro.12;
        Mon, 09 Mar 2020 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JohOmOJ2T+csOaen6ynllfQT2PQ8VgsBqiM3qEbp8as=;
        b=HP+Om+gmFPxPOXCJQ4AgXeIEU4/wRrwvfwQH7ZxwqOgJbeyO9kv2rUkMUkXSWLslto
         m5Bf9EmNlvde6i0960insg5nBP0LL+mrPaueYnFfZwdWllo5wyB8nqTH906n2IFvoUFC
         mk0Kgl5ryDblG0fZEEPLTl/51Py2oVhukshG+F5BDobuFxf0QJdzoc/OLAeCjm7W5ORV
         Ti3pxp0c4v5390A8Q/T19lw1wQA+71tX3p9oRELquG68t5KXXE+rbUc5CLrKsoSxfCnE
         rpdXolv2ETmowsmmfOS4L+BGcIRl8YHMW+5X5WvRMGlXl/vhWwgz1yLmFOv+E9SK8aYy
         qt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JohOmOJ2T+csOaen6ynllfQT2PQ8VgsBqiM3qEbp8as=;
        b=PdU4khU6ZNR+g9XcIx0mCSmT7MzXRf7MNB2K/0QJKxXamneyvTqzYv1o0dZZhoTxos
         GNQ0v3shQjbahzRVe5n/CLGT9/F42uYbXnQqSuYxQOga/zshJkt5nRGfHOoMMjBcj8XS
         dtzoxDqv1aaKf6iN2JZGSMiH9nVC2bVAWH1P0kBLrGbV+td/oJtx6hI5ycAeDgAHFcog
         j0TsD1d9PRTCH/Y47SSAbXtmSLSEcxts6/HhEmDz5D+bQ8g5spVo6E5wPi1YawfAgLT1
         1URKhE8tZ8MTyGWkIxOSxgt+RCklydtkSX52Ndxx0wd+obLGLVlbSYPcuBqcvd+WQJQq
         fXUA==
X-Gm-Message-State: ANhLgQ3A82275pYCsfCJ84ovOrwUrx9v2B9XviUzag1O27B59Nlh9Q4p
        HEoTfdrnrrTNBnu9IPSLGLiyaqEWDx98krw463kKqQ==
X-Google-Smtp-Source: ADFU+vt4iAmDL5h0y/kV4E7Ipmkv+BBc24pv9MRc0ozJhfCIh3aP/zVHGMnQwBBM+ci4u4lNUsbZ8iMb8yog2Jeb0TA=
X-Received: by 2002:a5d:4902:: with SMTP id x2mr20682737wrq.301.1583739929355;
 Mon, 09 Mar 2020 00:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <1583539986-573-1-git-send-email-opendmb@gmail.com>
In-Reply-To: <1583539986-573-1-git-send-email-opendmb@gmail.com>
From:   Gregory Fong <gregory.0xf0@gmail.com>
Date:   Mon, 9 Mar 2020 00:45:02 -0700
Message-ID: <CADtm3G4eq_p1YZtQrtcx4LGPiY82BpgXf55YtJCW+WJSrM7siw@mail.gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: support gpio-line-names property
To:     Doug Berger <opendmb@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On Fri, Mar 6, 2020 at 4:14 PM Doug Berger <opendmb@gmail.com> wrote:
>
> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-brcmstb
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

I've added a few comments below.  With the suggested updates:
Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

> ---
>  drivers/gpio/gpio-brcmstb.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 05e3f99ae59c..e9ab246e2d42 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -603,6 +603,49 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
>         .resume_noirq = brcmstb_gpio_resume,
>  };
>
> +static void brcmstb_gpio_set_names(struct device *dev,
> +                                  struct brcmstb_gpio_bank *bank)
> +{
> +       struct device_node *np = dev->of_node;
> +       const char **names;
> +       int nstrings, base;
> +       unsigned int i;
> +
> +       base = bank->id * MAX_GPIO_PER_BANK;
> +
> +       nstrings = of_property_count_strings(np, "gpio-line-names");
> +       if (nstrings <= base)
> +               /* Line names not present */
> +               return;
> +
> +       names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(char *),

Please use sizeof(*names) instead of sizeof(char *).

> +                            GFP_KERNEL);
> +       if (!names)
> +               return;
> +
> +       /*
> +        * Make sure to not index beyond the end of the number of descriptors
> +        * of the GPIO device.
> +        */
> +       for (i = 0; i < bank->width; i++) {
> +               const char *name;
> +               int ret;
> +
> +               ret = of_property_read_string_index(np, "gpio-line-names",
> +                                                   base + i, &name);
> +               if (ret) {
> +                       if (ret != -ENODATA)
> +                               dev_err(dev, "unable to name line %d: %d\n",
> +                                       i, ret);

Recommend adding the GPIO bank ID to this error message.

Best regards,
Gregory
