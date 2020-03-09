Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE68E17DB5D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCIIlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:41:53 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41828 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgCIIlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:41:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id o10so2255246ljc.8
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 01:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZvqsm5Jk9I1CS0nmGvu4WnH7QAFJGkExKW0dLeMXLQ=;
        b=SfuGVa+tqtykyNgtMLL9w8NUEOP6CTQc/sL7D36z0lOvTZSpTB/+HdVFiipuzFo+3v
         0GVnVMILpNX3A/+I2IKTvcu1OPHgMkMDMHxM0A75v6qXEcs4m8F4gSAQad8dUgmHfkSe
         ocf0qnZn/pUZHD2TxO6+qz6wLxRnAM49Y6p9D+TM1ovGZwuBnxj0lJHgApUb4h69n4Cv
         +ibZSIvWxLuT+zheZAquKK4/m9aIsf0W5vGjyQCuKEnfw9N7MpX9jta7nzLJeB6prNyA
         Bf3YwcuuDSoyjig0d+nhTHovrCVYIAiwOM6d8O4A+KYz86AcFw7cnmsjGBJMMQQAOc8R
         dgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZvqsm5Jk9I1CS0nmGvu4WnH7QAFJGkExKW0dLeMXLQ=;
        b=K8ONrPxuJoSCKXBdGi6WsOvQ3btnWyabIi6dGD/aQ9hCfEwmXjyhYNd5cUauJOC800
         Ie2aKDpO0aYcLmNVXb9AZ/GQkGoGf/gEYr39yevPaNFuF95Q1lVoSwLGDDJxnF/zo5bf
         aVn213Xf2lVa49VgFGddRShKT3Fq1wLNvodSmftgfMj6nF/J0z0HHcdupSte/39Cw6uR
         GXcxzoD90cwYpcprcPnsp2PdeVDmkb29+hulSibBWkPm7T8RAYro7E2kMPcrADr/Onby
         zEfetY5QHehiCpqrZ5rZmq+uTgRD5BMTsBFbm3jLjLD1Pu5eL9mI6hzaBnnwvzdsq+Du
         DDFw==
X-Gm-Message-State: ANhLgQ0ELU/ua6BCfITzEmXKYF0jwRXVIR/HwAnPE0XGIiYqeqnzzqJ5
        ezvbEItXuxMChv67u6HGRHcO8qNa2VIKAOJxMzAsPtLz
X-Google-Smtp-Source: ADFU+vss4htwV9kBeh6tpTFgAlVQycJbf4bRwo+a3UMY7Jk5Lfgv6PrwXf7aE33CrFJgSuB98BSFOG0aLgmaVLfgrbU=
X-Received: by 2002:a2e:b169:: with SMTP id a9mr8681858ljm.258.1583743310759;
 Mon, 09 Mar 2020 01:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200302111225.6641-1-hdegoede@redhat.com> <20200302111225.6641-2-hdegoede@redhat.com>
In-Reply-To: <20200302111225.6641-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 09:41:39 +0100
Message-ID: <CACRpkdab35m=dJ5wy=ne_V+yh-_a_tS7nXgZiiXJZXiE+UbWkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpiolib: acpi: Rework honor_wakeup option into an
 ignore_wake option
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Lehmann <schmorp@schmorp.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Commit aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option +
> quirk mechanism") was added to deal with spurious wakeups on one specific
> model of the HP x2 10 series.
>
> The approach taken there was to add a bool controlling wakeup support for
> all ACPI GPIO events. This was sufficient for the specific HP x2 10 model
> the commit was trying to fix, but in the mean time other models have
> turned up which need a similar workaround to avoid spurious wakeups from
> suspend, but only for one of the pins on which the ACPI tables request
> ACPI GPIO events.
>
> Since the honor_wakeup option was added to be able to ignore wake events,
> the name was perhaps not the best, this commit renames it to ignore_wake
> and changes it to a string with the following format:
> gpiolib_acpi.ignore_wake=controller@pin[,controller@pin[,...]]
>
> This allows working around spurious wakeup issues on a per pin basis.
>
> This commit also reworks the existing quirk for the HP x2 10 so that
> it functions as before.
>
> Note:
> -This removes the honor_wakeup parameter. This has only been upstream for
>  a short time and to the best of my knowledge there are no users using
>  this module parameter.
>
> -The controller@pin[,controller@pin[,...]] syntax is based on an existing
>  kernel module parameter using the same controller@pin format. That version
>  uses ';' as separator, but in practice that is problematic because grub2
>  cannot handle this without taking special care to escape the ';', so here
>  we are using a ',' as separator instead which does not have this issue.
>
> Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mechanism")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Rewrite to use a much more generic string based format to describe
>  the controller@pin combination(s) on which to ignore wakeups

Patch applied with the ACKs.

Yours,
Linus Walleij
