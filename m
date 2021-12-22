Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE547D727
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 19:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236150AbhLVSt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 13:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344899AbhLVStZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 13:49:25 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDFEC06173F
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 10:49:25 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id q14so4643738edi.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 10:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t527YhaNyGu7HcjOk9HU9o2SGkKvW6SpXMnwPDOJZa4=;
        b=Md1yFRyp41NAPO67xvU+LCsYd0ekh95gn+gFjvlEGcJ3W9f1kd0pon7J6pwaVJaFce
         FdcFAVmTNTUnJUAwO6l+xHgEx6QeoNhBOIv89+KdFlFI2HYQRX8Wg3mPjXK11Rw0vtKl
         ueAtI5UB3yqNkZdkdKZReWVTqBShtYpMRrt/32hrIXl1a9irYQAbe4b5qWDzolDTrith
         CR84QgJ4yJDF2akPhHZ7x/GwIoVaAow8pcdoKhC6ySSmD6NDAgRgG5W/XqQlLNA6tC+2
         NYfKtZjE021eNrF8oY2ej1maSAsZ+BQGKticzmi2DOD4oZ0yVFVCTC4PbnbW3UU/c459
         d3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t527YhaNyGu7HcjOk9HU9o2SGkKvW6SpXMnwPDOJZa4=;
        b=gMwXjJmuxQ/ktZoQBM8GW0DnGj+KDhMM5L4Z49MRKkAdArbPBq5YjXVbxggXPnPwS0
         TxH9bEK5BbQFKX+LZh6mO7qJzlumriy1yOFoTEcGajmodc3QVfS791BJbUbf7uA1fOjL
         otSGRJC6DddlOIuuCe5is+L48nUpChubpSZspFq092V3i35HIOD387JYUegCBNiOukNL
         TSpdrPSnRD6fEGdXy9f6ecg3vFO8617AhTieOC4Xwm0uJO+hmVfhkBt6XGIC/8hxa76X
         WhgPi1Bv+qeGgxTLpNfSS3t9egZ9vXk+InY+p1+K4lYzba1rwT3DC6RqBFRHACdIwsxM
         A/ew==
X-Gm-Message-State: AOAM53114hLOE6A1FCqA41nIQJbMRWByVUxbS1D5J8pDEreZuxnx2CdH
        1cD2252N4QAvx9wexuaz3T7SQr/iV4PisHRW3YA=
X-Google-Smtp-Source: ABdhPJwrFsn+v6bZ0XZyDEnb/KqoW+v7MTZFMO+K+muryvuVrlPGBUuUpPogqZxHVa6i5caUzW5flVgWPENIADGZ7uc=
X-Received: by 2002:a17:907:76d4:: with SMTP id kf20mr3547950ejc.44.1640198963837;
 Wed, 22 Dec 2021 10:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20211221190459.GB13192@COLIN-DESKTOP1.localdomain>
In-Reply-To: <20211221190459.GB13192@COLIN-DESKTOP1.localdomain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 20:47:25 +0200
Message-ID: <CAHp75VdGXAxBQqYy9kHrqHYytXeP5ackdZBBUrBVVwt38B=XGA@mail.gmail.com>
Subject: Re: activity status for pinctrl-microchip-sgpio
To:     Colin Foster <colin.foster@in-advantage.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ Linus and Bart for the starter

On Wed, Dec 22, 2021 at 5:58 PM Colin Foster
<colin.foster@in-advantage.com> wrote:
>
> Hello,
>
> I'm taking a look at the pinctrl-microchip-sgpio driver. After
> converting it to regmap, it was quite simple to finish support for the
> VSC7512 MFD RFCs I've been sending out. As it currently stands, I expect
> that patch set to get chopped up and submitted for 5.18 due to
> end-of-year schedules.
>
> I don't know how the other chips that use the sgpio driver operate, but
> the primary function as I see it for the VSC7512 is the activity LED. It
> seems like that functionality was initially planned by way of:
>
> static const char * const functions[] = { "gpio" };
>
> Has there been, or is there expected to be any work to add this
> feature? If there is, I'll be able to focus on PCS ports next. If not,
> I'll spend some time on activity LED functionality.
>
> Is this a feature that'll be desired for SPARX5 and LUTON? Or just
> Ocelot? If it is Ocelot-only it would seem like a flag in sgpio_priv is
> necessary. If it is for everything, then extra parameters in
> sgpio_properties.regoff[] would seem like the way forward.
>
> Thanks,
>
> Colin Foster



-- 
With Best Regards,
Andy Shevchenko
