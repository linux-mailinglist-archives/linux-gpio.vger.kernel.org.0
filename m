Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39E125BC01
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgICH7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 03:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgICH7b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 03:59:31 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4DDC061245
        for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2020 00:59:29 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gr14so1385874ejb.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2020 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=631Dyyj+5J1i4PyIFclIjVjOc2aZH6fWRoROHrNThkE=;
        b=OhuY/LJ9ZXiJdh/h6zxSJ7jWF4WBeWwm7oxf2Bj21hgqvOBHdqyMY3NiFHrYE3jkzq
         cv2PJwXOQ+YuU+W/SvVq3zWMeX+Q+UL3Lb09KAdxxeDEG66pNKXz7svZrTC18ODLIF/m
         u5kI9UIUAkgJfs02/EvDhkayPfxIytG7rbkZzkjgcMDUFu8LqLYuMdWk3ewU967PVUBe
         8QeRiXzsYZOYozH55E1xmt6INtDYVWVR3TEAY9jvqYURMIrq8Kcgbb7sCW6AqEts2mV9
         5/BymYtNy1syz2I/scALDYE7FGXnK/tIKtOK2uHGP7L1HhtquFy+Qd9vOA1sr3nhfysG
         ngPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=631Dyyj+5J1i4PyIFclIjVjOc2aZH6fWRoROHrNThkE=;
        b=SUo4NBvS5uMHVxXgwZEFIir8CFkjPvlw7sd5BZmoDgWhgIbswzlEE4QQoXf7bWzWBq
         mmLj6vo6Tl+D1wR2HtzvNLd8Q51BSzGd9jq7Zz36gKokNcZZ7aE5Fhme0je4n29pgtOb
         PgAKwd1b2+25uuJzy+FoP4338IE+xA61d/eDjDA9hLtrF7VUet2eRP40BQ9ECNRFkm20
         bGKUPVUo7LIYB9vPwMHH8oDsjMDBENPmhAuo6HPbIMceamvh7lG9/iDwprLXfnwAOkKF
         PxRoymCt46/zWowUSE9P93yLw7iN5OzVyk0THoW8agmmgbt66Q/QFtqFRj8MlxIFqCJy
         LBYw==
X-Gm-Message-State: AOAM533IhHJZupHFjCx+8EcKAmwVTkf1kCoOOtQB34hyUJUdSwfeGNPT
        Kd1dGRpTubX24dugP0OZg6al+Yco5FC9rj/33S4N9AXQ0K4=
X-Google-Smtp-Source: ABdhPJyBbIUChvvzLiPQLdiZrhe2BSGEnj5NkfhqnqgNeWvbZ7O/IYUicka8eALd6ofrbKtaeTxzOpCHys3x0cJUdSo=
X-Received: by 2002:a17:906:d8ca:: with SMTP id re10mr852855ejb.382.1599119968510;
 Thu, 03 Sep 2020 00:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200831032006.1019978-1-warthog618@gmail.com> <20200831032006.1019978-12-warthog618@gmail.com>
In-Reply-To: <20200831032006.1019978-12-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Sep 2020 09:59:17 +0200
Message-ID: <CAMpxmJWYpDQsvKCsNudb6p3zAey=6EuNpb3wQ3dpCJVCTjjBsg@mail.gmail.com>
Subject: Re: [PATCH v6 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 5:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 59 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 936b8c9958dd..9f05bbd2161e 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -777,6 +777,63 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
>         return 0;
>  }
>
> +static long linereq_set_values_unlocked(struct linereq *lr,
> +                                       struct gpio_v2_line_values *lv)
> +{
> +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> +       struct gpio_desc **descs;
> +       unsigned int i, didx, num_set;
> +       int ret;
> +
> +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> +               if (lv->mask & BIT_ULL(i)) {
> +                       if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
> +                               return -EPERM;
> +                       if (lv->bits & BIT_ULL(i))
> +                               __set_bit(num_set, vals);
> +                       num_set++;
> +                       descs = &lr->lines[i].desc;
> +               }
> +       }
> +       if (num_set == 0)
> +               return -EINVAL;
> +
> +       if (num_set != 1) {
> +               /* build compacted desc array and values */
> +               descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);

Missing retval check.

> +               for (didx = 0, i = 0; i < lr->num_lines; i++) {
> +                       if (lv->mask & BIT_ULL(i)) {
> +                               descs[didx] = lr->lines[i].desc;
> +                               didx++;
> +                       }
> +               }
> +       }
> +       ret = gpiod_set_array_value_complex(false, true, num_set,
> +                                           descs, NULL, vals);
> +
> +       if (num_set != 1)
> +               kfree(descs);
> +       return ret;
> +}
> +
> +static long linereq_set_values(struct linereq *lr, void __user *ip)
> +{
> +       struct gpio_v2_line_values lv;
> +       int ret;
> +
> +       if (copy_from_user(&lv, ip, sizeof(lv)))
> +               return -EFAULT;
> +
> +       mutex_lock(&lr->config_mutex);
> +
> +       ret = linereq_set_values_unlocked(lr, &lv);
> +
> +       mutex_unlock(&lr->config_mutex);
> +
> +       return ret;
> +}
> +
>  static long linereq_set_config_unlocked(struct linereq *lr,
>                                         struct gpio_v2_line_config *lc)
>  {
> @@ -853,6 +910,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
>
>         if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
>                 return linereq_get_values(lr, ip);
> +       else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
> +               return linereq_set_values(lr, ip);
>         else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
>                 return linereq_set_config(lr, ip);
>
> --
> 2.28.0
>
