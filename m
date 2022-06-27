Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6F655D279
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbiF0KiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 06:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiF0Kh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 06:37:59 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A154663FB
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 03:37:58 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3176d94c236so81153317b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fMQXwv7Mktf7bEw2lseIlWOSd1SEbqsUPoL1K84mKtA=;
        b=f+egeIAwRp+XVfyseHGj2M2B+izx8nVxMISWtq1InISk25uvsXXUlUviIVPBDzX4vg
         SliSskUjwtWkfl8Kg57WhcaalcZQLV6Q6jfQl3KOZhH23oarZpDke9CIQZyuNLvREkID
         kML+fS5P/VobaNtiTyMYNRkF/h3tfucbe8G3djYG1xbVJxU75BGOjAfKRSlUxF2z7B2r
         V8SoHCSqi1HxFs70ms7mzE9R9hGc74KZ1nhBEoC8qNKcw/b4HG7MRG8gyGxa2/zZ6Bt2
         4WP2txsvcoFaYzJpHKbqSyUNfNj79AAgN+9vQ84CE7/syNn15oWyMDVB7yWZyOBg28nn
         8yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fMQXwv7Mktf7bEw2lseIlWOSd1SEbqsUPoL1K84mKtA=;
        b=H+Cfsa3+khmD6A8KRViw8ezVbd45d5lcb73HHJN/6j8qMh405HRE0LyYte7nV3USFs
         V5Y/L4hMDlAkuTuczmsEtpcUsBpncRyiQEqoiYvfF2wfqPdIouhmysA30ziyivWWuCVg
         SmoEn/6VYSnKmC+bp06y4iDf+5+yMWVpPqFkJSUnHFLmFKP0VjfI49J4j7jZw6rkIPLt
         PkvP3uyFIBGqlVFMqVH4apn7DP9BUuKDpP8SwFlVwO8LDMEG5HOE2bHf19x+5OLPQblW
         /TmNw9x9Hg7ws/8eySG0pF2BP4w7X9yBC675KT5J5CNrGyGfxO77KSmgI5JSeR13VQTo
         Zmnw==
X-Gm-Message-State: AJIora/W11nozLlGSKTPJnoSshdtnuqEo84y4YRH5XVxwSZELuU9laae
        z9p7veMzYb7bLMTS7ScOLUkq9B6fH1vE5Devp0TYfBTnFcHlqQ==
X-Google-Smtp-Source: AGRyM1tPmMd07rPP6c6m9YDCoiV2SVKCDg5xNOk0ibZMZYrwzQF8xgmq4ai76w26kMyWouJGjdZ5s3Xv+nUOmYdGN0Q=
X-Received: by 2002:a81:aa44:0:b0:30c:c697:a65f with SMTP id
 z4-20020a81aa44000000b0030cc697a65fmr13976117ywk.96.1656326277867; Mon, 27
 Jun 2022 03:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol>
In-Reply-To: <20220622102632.GA37027@sol>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 27 Jun 2022 12:37:46 +0200
Message-ID: <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
Subject: Re: Reading current output value
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

On Wed, Jun 22, 2022 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> > On a am335x based board I have a GPIO pin that enables/disables power
> > of an external device (the bootloader sets this pin to output and 1,
> > and the kernel is instructed to not change it). Using kernel
> > 5.19.0-rc2 and sysfs interface, I can read the current status as
> > follows:
> >
> > echo 68 > /sys/class/gpio/export
> > cat /sys/class/gpio/gpio68/value
> >
> > As a result, I read 1.
> >
> > Using gpioget (libgpiod) v1.6.3, the line will be configured to
> > "input" and the value is set to 0:
> >
> > # gpioget 2 4
> > 0
> >
> > So, how can I read the state without changing it? I am mostly
> > interested in using the kernel userspace API directly.
> >
>
> The API itself supports it, but it isn't exposed in gpioget v1.6.3.
> The gpioget in libgpiod master has a --dir-as-is option for exactly
> this case, but that hasn't made its way into a libgpiod release yet.
> (commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
> Can you try master?

# gpioget -v
gpioget (libgpiod) v2.0-devel
Copyright (C) 2017-2018 Bartosz Golaszewski
License: LGPLv2.1
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Now, I get my "1", but as soon as gpioget exits, the pin goes at "0".

> > By the way, setting pin to 0 works but not to 1:
> > gpioset 2 4=0 - OK
> > gpioset 2 4=1 - no level change
> >
>
> gpioset has to remain running to guarantee the output level.
> The pin is probably reverting when gpioset exits.
> Try the --mode=wait option.

Yes, this works, as long as gpioset is running.

Yegor
