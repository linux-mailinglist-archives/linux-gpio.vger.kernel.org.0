Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250043057CE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314436AbhAZXIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390660AbhAZSRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 13:17:42 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F51C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 10:17:02 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id b11so17645523ybj.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 10:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C63W8Y93BecXXNue/Bt+pWJEqyrzx0Hg2TryKJ8xF3U=;
        b=sIcUAWDvgO5KukWwqZJd2E/uyHM7Mwiuujj/xRIJmAqOEKjNZ/LDqryjCMHouSf+d2
         tf8WOOX6A6ROU0JzpV7ZplsXpA32diogSjKpYjY7aVNBEay/uqM1ZDZaWetg1H7sPo1b
         v1/iaAIDy5XXh3IToXwNgfm7YTvUsmbXECeLZu19sP7C9tswdUHxrpbQyM8tPfnNMPwt
         vslKnigoR6jEFlTl1qSzODTjHJ7qoO6763loZuCXJxPfWEWdMGXlUXM/Kqv4SJdyoflc
         mzCDyfvN6PeMRmWfDRqKT6iqTsWnZDXFNxOICuB+3L7vVMqKA5sDjMCdg5fAM0fk5fn7
         0zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C63W8Y93BecXXNue/Bt+pWJEqyrzx0Hg2TryKJ8xF3U=;
        b=EyYNGbNAbU5pF99sr+8O/8t/MJzRoGJBauFIFUgVQjD+M+KMzU6IjRwOqvlj3jWuxC
         0gQYAVzapmh3IJqSczGgPpUfLYciCKlNVHJ8buSAmWA4mXL5v4EDDlurSOi1WQI2Hs8Q
         ysTsZ91JqDUat4iUvDV7hMwEvd33uVogimCEF97+n4CGg0UP1sN1DZsGjX99Se/Puq7H
         nR6Ux6GXaEKCKvSUlMFgQJOmmPRwr0krSO8gOAUkoQIJoVv2eWctJgwC7h4X13L35CO+
         EHmj6eCzHGF4npDAFMviQSx35lss4D0f2rOXddL3TL1xee5AhxIJS8y/Y5SqZudi/XdX
         8z7Q==
X-Gm-Message-State: AOAM531cha0/w7IUE7t8pIlzSz22RFI8wUoRaotfPjt3qAgMODs1TQbF
        OkLC97KyYCQEDkKiSXq0x8g85X/QLD63CzGTnSdWUQ==
X-Google-Smtp-Source: ABdhPJyKBxbNwKUWs/G+whnZ2vm5Q3D8MJv7kvnkBA1M/xXs+yzBq5YtqbfmfAIzYvaozMNBN7cAp0S7OJeN5pkLzLo=
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr9347224ybl.310.1611685021454;
 Tue, 26 Jan 2021 10:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com> <CAHp75VfKiuVd7JO-0nwCuvy7tgPZScOpKX8Q4+oT+JSBR+d=ew@mail.gmail.com>
In-Reply-To: <CAHp75VfKiuVd7JO-0nwCuvy7tgPZScOpKX8Q4+oT+JSBR+d=ew@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 26 Jan 2021 10:16:25 -0800
Message-ID: <CAGETcx_FmOvLe4fN8ZZ_Kno-DnUy2DcPayk9Szmx2vrihr0KoQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 1:40 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>
>
> On Friday, January 22, 2021, Saravana Kannan <saravanak@google.com> wrote:
>>
>> There are multiple instances of GPIO device tree nodes of the form:
>>
>> foo {
>>         compatible = "acme,foo";
>>         ...
>>
>>         gpio0: gpio0@xxxxxxxx {
>>                 compatible = "acme,bar";
>>                 ...
>>                 gpio-controller;
>>         };
>>
>>         gpio1: gpio1@xxxxxxxx {
>>                 compatible = "acme,bar";
>>                 ...
>>                 gpio-controller;
>>         };
>>
>>         ...
>> }
>>
>> bazz {
>>         my-gpios = <&gpio0 ...>;
>> }
>>
>> Case 1: The driver for "foo" populates struct device for these gpio*
>> nodes and then probes them using a driver that binds with "acme,bar".
>> This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
>> This lines up with how DT nodes with the "compatible" property are
>> typically converted to struct devices and then registered with driver
>> core to probe them. This also allows the gpio* devices to hook into all
>> the driver core capabilities like runtime PM, probe deferral,
>> suspend/resume ordering, device links, etc.
>>
>> Case 2: The driver for "foo" doesn't populate struct devices for these
>> gpio* nodes before registering them with gpiolib. Instead it just loops
>> through its child nodes and directly registers the gpio* nodes with
>> gpiolib.
>>
>> Drivers that follow case 2 cause problems with fw_devlink=on. This is
>> because fw_devlink will prevent bazz from probing until there's a struct
>> device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
>> supplier). Once the struct device is available, fw_devlink will create a
>> device link with gpio0 device as the supplier and bazz device as the
>> consumer. After this point, since the gpio0 device will never bind to a
>> driver, the device link will prevent bazz device from ever probing.
>>
>> Finding and refactoring all the instances of drivers that follow case 2
>> will cause a lot of code churn and it is not something that can be done
>> in one shot. In some instances it might not even be possible to refactor
>> them cleanly. Examples of such instances are [1] [2].
>>
>> This patch works around this problem and avoids all the code churn by
>> simply setting the fwnode of the gpio_device and creating a stub driver
>> to bind to the gpio_device. This allows all the consumers to continue
>> probing when the driver follows case 2.
>>
>
> Do we need to unregister it at __exit initcall?
> What side effects would be of the stub driver presence on the GPIO bus? Any traverse on it will work as before?

I checked. There is no __exit initcall.

-Saravana
