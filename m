Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0886A7A779C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 11:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbjITJdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 05:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbjITJdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 05:33:11 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ECC97
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:33:06 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4510182fe69so2485060137.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695202385; x=1695807185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfNqK8L6q1PlFEDhklDZAwbggIZ8KkG1jYC1QEAOeOw=;
        b=Qc/RZnL8jExlx7TEwzF61YWwIL6Jh0gGwreTZ3eUic1Le/NQuqGnwxIXq24UIzfuFn
         J8z+fQVDDlTqG0qRC06JdB76MczdWIuPaDpRFRKzBuarKrohH/09/UkhPGtiIRQ/SHSv
         9n8BYo1h9pHSURW7aue4n7i2pp/j5gwot3vmSbvbkgs4BBU4sSJysogbsgRolrv63pMq
         uw0FHLROq6Zfnu2ZjwvKGRY0u/ML4ZOhOxUv3g17S579BM+OZSmUoeEzKfiNCGDjeXgv
         xTPvxzI0/rC+HvH9XthprxZmBz5OvcQgA+9V+GBlOn1MWl12R09tl6k438ElTC+OF/8C
         5Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695202385; x=1695807185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nfNqK8L6q1PlFEDhklDZAwbggIZ8KkG1jYC1QEAOeOw=;
        b=EcHJr678h6gW2vscUwQZmmTpVjVuLF1aqaoNygIQiNvzGrsvQGAYX+t1i7QUk6hX/d
         k2reUCZfpi+d5TvO9G7o1KZaR0nmfQLtkYFjhjCfiyrfP+cK8PB2nmED6cdvu/qG7uHG
         d06I56RXywNToQDZv808kCCfmtG2CI9BLFU1MCyAWQ5xHPo9m1xH+M3+9Ulw8GZJHzN9
         Bmc3F01Q/tLIZGr+p4oiGuzOxS17r8tP2PRuRtkWR4kJpA6cgG97WBKhTLBwpE4RwpPF
         BW6gheEVVvpfeI7OLS5GYqF49BnkR277w3gk9PYAqMeYkMCDkXaXFBWeJfFMbDkkZnt4
         FywA==
X-Gm-Message-State: AOJu0YznH8ucmZEbYEgr3F45r130nZ5y148goBnD0QGOr2Bv83Ptx5RI
        hgO6tjvecKBn2yrvTvHxdhV3ErMNNTM3+7+O+hEqvQ==
X-Google-Smtp-Source: AGHT+IEkUlWaBFsCfvHkll+A7BguWyOA6I6beL0yMDhI0NpxSRFhifb+ZVr4Onn7zD0tQB0YwpYOSWPewT8Nbu9cQNc=
X-Received: by 2002:a67:ebc1:0:b0:452:6fc1:a3e5 with SMTP id
 y1-20020a67ebc1000000b004526fc1a3e5mr1806673vso.1.1695202385114; Wed, 20 Sep
 2023 02:33:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Sep 2023 02:33:04 -0700
From:   Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl> <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
Date:   Wed, 20 Sep 2023 02:33:04 -0700
Message-ID: <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 Sep 2023 11:12:58 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> On Wed, Sep 20, 2023 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> There are two places in the code where we retrieve a lookup table using
>> gpiod_find_lookup_table() (which protects the table list with the lookup
>> table lock) and then use it after the lock is released.
>>
>> We need to keep the lookup table mutex locked the entire time we're usin=
g
>> the tables. Remove the locking from gpiod_find_lookup_table() and use
>> guards to protect the code actually using the table objects.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I convinced myself that this change is correct, good find!
>
>> @@ -3822,8 +3822,6 @@ static struct gpiod_lookup_table *gpiod_find_looku=
p_table(struct device *dev)
>
> Can we rename this function gpiod_find_lookup_table_locked()
> as per precedents in the kernel, to indicate that it needs to be
> called with a lock held?
>

I think you mean gpiod_find_lookup_table_unlocked() as with this change it
will no longer take the lock?

Bart

> Either way:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
>
