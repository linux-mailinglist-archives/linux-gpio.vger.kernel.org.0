Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5EE275D2D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 18:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgIWQS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 12:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWQS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 12:18:27 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34977C0613CE;
        Wed, 23 Sep 2020 09:18:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k133so9930390pgc.7;
        Wed, 23 Sep 2020 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppUCNhLmOopuimPTANSvO30QCF1CC2nP4YDFFJTQF2w=;
        b=FusmfOx/YO6EPSrv5/bO4uoPq0+JLceZT58dKLsNT7DaXT2MLAFkLulIkjimQFOK3p
         sQZh7DFa5gphpwuW3jakn7iPOKNWMfH0g9iFxPrKAYWy08tc02lG+eG3JQ/k2IKDkEE4
         W6c66n9v93lLZ1uHiFwAjV9hpbNvpBsUe1oD83p95RKpi38taTH7/0z+SaBe52nHcyJc
         t+U0ftW7IeK7CCmUz30i134cAUq6CEpJNg1lJe5KWWqqichj0rFGMHrSkkyVlgxcvePW
         kbWGw3UeFIaCGrV1l3hbLqVWPx/afYrubDcXY39hkaN1ALAnOcI4PkxAhL+j/njAI8f/
         nYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppUCNhLmOopuimPTANSvO30QCF1CC2nP4YDFFJTQF2w=;
        b=cV/wuWdCHk2Dv9+1JqEVLSBJCQ+2FOb7Vn1gBzq+wIDTyF3wkv3hTQ9Cq/hcitfWE0
         HMrri6pytLQbaZfhZS0fUn4GE1/mVNpBRarwlKEUKQ1OhJtEXkAZeD5U9ayrnKuzeAk0
         wQYyxf4e4ja5DP7LJU239qvl+E1CzG1AcAV/RJ8ziYp4GBJ6inecWFblZ1Ae+oIG5rHQ
         tNuvUkPuUshvHh8VpUqfQ6f6VktZ1HO61TSNpTGwlp8eL9RC9+EW5TRzm/Z1yAwVwqoO
         WEss5cJkEwNk1fdqH2DqBHYF+UC5KRiv7ucQI6SlF5d5d9oUoReh5uJ0+M0P21CmoCrR
         8MYw==
X-Gm-Message-State: AOAM532hl/PlttyU4GIQWbOxPpAWdPUzgYiZTmhdpsOfPL1iWA3+hGjz
        +qQAasCUHFm++0RCMUEfIcCGXN9MpqL1BZh6YSsHfLqQACSVJ1rv
X-Google-Smtp-Source: ABdhPJw64boQLBfmrOjrKgUJNkKCKaQfT2HQljqrpN1xDENoqeyiOr1/MyyXs/y6lfZ+Xvs4d8E9CT9fLQT1xZeeGq4=
X-Received: by 2002:a63:d648:: with SMTP id d8mr462372pgj.4.1600877906782;
 Wed, 23 Sep 2020 09:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-12-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-12-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 19:18:08 +0300
Message-ID: <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
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
> Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

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

Similar idea

DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);

num_set = bitmap_weight();

for_each_set_bit(i, mask, lr->num_lines)


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
> +               if (!descs)
> +                       return -ENOMEM;
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
> @@ -889,6 +948,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
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


-- 
With Best Regards,
Andy Shevchenko
