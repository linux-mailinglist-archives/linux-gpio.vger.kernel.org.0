Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5470A207604
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389253AbgFXOqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391165AbgFXOqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:46:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0229C0613ED;
        Wed, 24 Jun 2020 07:46:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s10so1540055pgm.0;
        Wed, 24 Jun 2020 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SmSu2RwKBiJXw3XuQ+XcCaI65hnx9UTfsWeRC0rnzjY=;
        b=Y4eXjg+PwBt6Cx+bbuy55sU+iwwLMxmLrpFBDshiP7I1E1uQGFS925+hq5IHNFBDan
         fhIO8fc4iKEaPS2FqWlrKF+H2xq2efv5ozFzyBGK4XJIVdL8czqppdw8H/+rudjpPaQa
         2Hv0ZJOuS3MFcrT/EfIGY7Yvx3yUVY8Fl4oms6qJE0bxZaqT3m9mf4ByVzVFUUm3z14R
         +gDxwZr/YZAjcOLe6inBHwX0RV2Vp+xwZqPbgj04npAgyNdd2GUiiAH/sW1zwZL9V/Lh
         BQp/xKuwaAkWWruZJi8fG6aEu3p72G3aC2fF1IFSOxnD4pTaf95SPDtJybZoqD1qLYFj
         W58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SmSu2RwKBiJXw3XuQ+XcCaI65hnx9UTfsWeRC0rnzjY=;
        b=UwfN1kzFtKcA+34b7DhdLtkXs7yDRPrDmBa08/KZd5VafjMS3vVORuB7cIkT6VvsrN
         y03vUtG74qdjZsQntUGg+WQW9cDLLAiZpcTNztQIgzDwGw7v+xfOoTie2N1caAe+WW4E
         MKopoezMS5R5cT+/xBSXlmO46Xz6ez9/ON0mkpLP4sV1Q+ec+VVbP3k/LMf16Td4Opur
         +AtJcOLwQgdcaQfTZXUhrmuwgZx42UKgbtDu76tsw9xXDgT4ryLBeHIZZzpxawjCuHqJ
         qV5sn8SLX4p74X1r/ctd6m9mQafEDBsI4QW3Vz3g2eNRPL9vnObjX5mTu1VwcvvkMORL
         lKNQ==
X-Gm-Message-State: AOAM533Qu9nKhE0cNZpcf6jxzIpDM4fsv+j+TnewvxgF0tm93BGfAx4D
        VVacqmzvGop8kmsya5gl44MJdoYS4GX7XFBMWKs=
X-Google-Smtp-Source: ABdhPJwNudlha78cWScKnDvfgr3MORpokdMvjyfbgFTiK5Ybwq96BbMUEwaVdTBD8zHNNpTPypSzEqD9Yv6hmUtxGCY=
X-Received: by 2002:a63:ff52:: with SMTP id s18mr22646964pgk.203.1593010006407;
 Wed, 24 Jun 2020 07:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-11-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-11-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 17:46:33 +0300
Message-ID: <CAHp75VdG4r95ZU8G9TfL+jkT63+Gppb8w5TRvAtCR_pAk0o=NA@mail.gmail.com>
Subject: Re: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 7:03 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Merge separate usage of test_bit/set_bit into test_and_set_bit to remove
> the possibility of a race between the test and set.
>
> Similarly test_bit and clear_bit.
>
> In the existing code it is possible for two threads to race past the
> test_bit and then set or clear the watch bit, and neither return EBUSY.

I stumbled over this myself, but...

> -               if (test_bit(hwgpio, gcdev->watched_lines))
> +               if (test_and_set_bit(hwgpio, gcdev->watched_lines))
>                         return -EBUSY;
>
>                 gpio_desc_to_lineinfo(desc, &lineinfo);
> @@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>                         return -EFAULT;
>
> -               set_bit(hwgpio, gcdev->watched_lines);
>                 return 0;

...I think it's not an equivalent despite races involved. If you set
bit and return error code, you will have the wrong state.

...

> -               if (!test_bit(hwgpio, gcdev->watched_lines))
> +               if (!test_and_clear_bit(hwgpio, gcdev->watched_lines))
>                         return -EBUSY;
>
> -               clear_bit(hwgpio, gcdev->watched_lines);
>                 return 0;

OTOH, this is okay as long as we have no code in between. So, I really
prefer something better to do such checks.
(Alas, I can't come up with a proposal right now)

-- 
With Best Regards,
Andy Shevchenko
