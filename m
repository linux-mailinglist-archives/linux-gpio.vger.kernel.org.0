Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411443313A1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCHQmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCHQmb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:42:31 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B60C06174A;
        Mon,  8 Mar 2021 08:42:31 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id n9so5789551pgi.7;
        Mon, 08 Mar 2021 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szyMeXcOZPuC9dOSVL+eNNkbXb+YXhRZoKhNYCwWUV4=;
        b=XACI94yB8Hq4F903l0I4gjuqDGjE8+QVH3SyX55gJPtTcy+JPCKK4Gg/ysPAIuS8Lh
         Qqh3PfWx2UaE52gL1pWKKtM/5InWAs0btEst8HjDsEj5eIel5ZTEghkLVOazc6AB3qcQ
         8m+fI4mJj9x0FtdGmrICPHU+k+mkENyz5oqiFtx9a49rxYsGmwmmtQ/YmL4MGKjVKzjj
         mQ8kze5yhI0JVR4lahPkWiXHgWzFsznBjzWVb/wUVHtCNN4TMkTyjvyqBvc+TbbFbcfS
         aA414nV+sDB8CvIFwanFdieWV/9DwYz9EcZvdryqR5vXooIVNSWeTK8s/MM3ZL5JxLgY
         nbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szyMeXcOZPuC9dOSVL+eNNkbXb+YXhRZoKhNYCwWUV4=;
        b=RFlGIhv6lZP1Nwx1rz4DZySfM3a8fW7/uhiFFNJ+TEq8H96YLj/vCb3k1LPAE6Zm05
         gEZT6wrXLcZEwwee3XfmNfp2PlqEJySOu0Wgx7z9MwJ5Fx0eNy+9b0hAbXJvDeyvb0/R
         QC/Yc//9FCoEull7r59TElTSKQ3IwsbiPaQDL9f1h00X/5yFz+Dwa70mgNYtpH8pM+uR
         yKfnkb5nHE0o1NoDsWLI4GtMHRIxJLpdHHjEvYAckwUyc3QZMoUisLpndZ3ifABRR5J1
         KZdtauQe+xiTiftPw+1BWdDcFcGeHNjc+wHIHPTCnnHNqw1qfxaPQjuWFHOBeLCdYT35
         VCEQ==
X-Gm-Message-State: AOAM5323Uvmw3kXtaMQy/cG2cf7YtCmakeEHSeHQbrNRIHOWQgeTw3gg
        IrdbOqyifr+aldHmNe/XrvlbZ2hO3h8Wg0mCv5Q=
X-Google-Smtp-Source: ABdhPJyHV/rUkdcHC7NKhrWHQX/swbcv1gpat7thJiURoKv4H3gfBEISNGKgrdmBolENgwwwwvAaVMyHAwhTVBcp0ME=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr22141889pfk.73.1615221751139; Mon, 08
 Mar 2021 08:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com> <c306b082-f97a-96d8-1291-78ff14c4ea88@gmail.com>
In-Reply-To: <c306b082-f97a-96d8-1291-78ff14c4ea88@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 18:42:14 +0200
Message-ID: <CAHp75Vd9N_U7NobAwpYkqGoOCVNYbBSTkZ1vpgziOfgAf=c0wQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "pinctrl: intel: Split intel_pinctrl_add_padgroups()
 for better maintenance"
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 6:34 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> On 3/8/21 4:35 PM, Andy Shevchenko wrote:
> > On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
> >> Following commit 036e126c72eb ("pinctrl: intel: Split
> >> intel_pinctrl_add_padgroups() for better maintenance"),
> >> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
> >> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
> >> should be there (they are defined in ACPI and have been accessible
> >> previously). Due to this, gpiod_get() fails with -ENOENT.
> >>
> >> Reverting this commit fixes that issue and the GPIOs in question are
> >> accessible again.
> >
> > I would like to have more information.
> > Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
> > output (when kernel command line has 'ignore_loglevel' option) for both working
> > and non-working cases?
>
> Sure.
>
> Here are dmesg logs for:
>
>   - Kernel v5.12-rc2 (not working): https://paste.ubuntu.com/p/HVZybcvQDH/

Thanks!

Yeah, yeah... Please, test my patch, I am quite sure it will fix the issue.

[    0.335705] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 0->23
[    0.335711] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 24->47
[    0.335716] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 48->71
[    0.335721] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 72->95
[    0.335725] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 96->119
[    0.335730] gpio gpiochip0: (INT344B:00): created GPIO range 0->23
==> INT344B:00 PIN 120->143
[    0.335734] gpio gpiochip0: (INT344B:00): created GPIO range 0->7
==> INT344B:00 PIN 144->151


>   - Kernel v5.12-rc2 with 036e126c72eb reverted: https://paste.ubuntu.com/p/hwcXFvhcBd/
>
> > Also if it's possible to have DSDT.dsl of the device in question along with
> > output of `grep -H 15 /sys/bus/acpi/devices/*/status`.
>
> You can find the DSDT and a full ACPI dump at [1] and GPIOs that fail at
> [2] and [3].
>
> [1]: https://github.com/linux-surface/acpidumps/tree/master/surface_book_2
> [2]: https://github.com/linux-surface/acpidumps/blob/62972f0d806cef45ca01341e3cfbabc04c6dd583/surface_book_2/dsdt.dsl#L15274-L15285
> [3]: https://github.com/linux-surface/acpidumps/blob/62972f0d806cef45ca01341e3cfbabc04c6dd583/surface_book_2/dsdt.dsl#L17947-L17982
>
> `grep -H 15 /sys/bus/acpi/devices/*/status` yields
>
> /sys/bus/acpi/devices/ACPI0003:00/status:15
> /sys/bus/acpi/devices/ACPI000C:00/status:15
> /sys/bus/acpi/devices/ACPI000E:00/status:15
> /sys/bus/acpi/devices/device:16/status:15
> /sys/bus/acpi/devices/device:17/status:15
> /sys/bus/acpi/devices/device:31/status:15
> /sys/bus/acpi/devices/device:71/status:15
> /sys/bus/acpi/devices/INT33A1:00/status:15
> /sys/bus/acpi/devices/INT33BE:00/status:15
> /sys/bus/acpi/devices/INT3400:00/status:15
> /sys/bus/acpi/devices/INT3403:01/status:15
> /sys/bus/acpi/devices/INT3403:02/status:15
> /sys/bus/acpi/devices/INT3403:06/status:15
> /sys/bus/acpi/devices/INT3403:07/status:15
> /sys/bus/acpi/devices/INT3403:08/status:15
> /sys/bus/acpi/devices/INT3403:09/status:15
> /sys/bus/acpi/devices/INT3403:11/status:15
> /sys/bus/acpi/devices/INT3407:00/status:15
> /sys/bus/acpi/devices/INT344B:00/status:15
> /sys/bus/acpi/devices/INT3472:00/status:15
> /sys/bus/acpi/devices/INT3472:01/status:15
> /sys/bus/acpi/devices/INT3472:02/status:15
> /sys/bus/acpi/devices/INT347A:00/status:15
> /sys/bus/acpi/devices/INT347E:00/status:15
> /sys/bus/acpi/devices/INT3F0D:00/status:15
> /sys/bus/acpi/devices/LNXPOWER:07/status:15
> /sys/bus/acpi/devices/MSHW0005:00/status:15
> /sys/bus/acpi/devices/MSHW0029:00/status:15
> /sys/bus/acpi/devices/MSHW0036:00/status:15
> /sys/bus/acpi/devices/MSHW0040:00/status:15
> /sys/bus/acpi/devices/MSHW0042:00/status:15
> /sys/bus/acpi/devices/MSHW0045:00/status:15
> /sys/bus/acpi/devices/MSHW0084:00/status:15
> /sys/bus/acpi/devices/MSHW0091:00/status:15
> /sys/bus/acpi/devices/MSHW0107:00/status:15
> /sys/bus/acpi/devices/MSHW0133:00/status:15
> /sys/bus/acpi/devices/MSHW0153:00/status:15
> /sys/bus/acpi/devices/NTC0103:00/status:15
> /sys/bus/acpi/devices/PNP0103:00/status:15
> /sys/bus/acpi/devices/PNP0C0D:00/status:15
>
> This output is the same for both versions.

It was expected.

-- 
With Best Regards,
Andy Shevchenko
