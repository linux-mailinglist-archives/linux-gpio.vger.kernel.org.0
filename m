Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC612D2B4A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 13:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgLHMmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 07:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbgLHMmp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 07:42:45 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55494C06179C
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 04:42:05 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id jx16so24358706ejb.10
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 04:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tx7so5XKh7FIt1CA8a0h/fwFWUTtxj/iNvR1h5PSzgs=;
        b=X9IfdZ07CRaiRKxilHDYeGeCj7zned0+KK4/c2hUOKGBFsLX4mL5lpbLbO4tW8eFx+
         S1SPRlOnL119OUpixgUVUsaanEf+Inh54zdDT4arb83ADCp1T0ZRxNlpvvuyUtlVq6BL
         /B0K29s1R81mTX/7k9+yGB2VfH4gAsqUMKzGZ61+GP37udF5so1UcUvtNiP7Fpv2W/uN
         LzcRJM+sfvD2NRyYdvW6qhzTCOb3GpRgDp0uyTJd209DJESVQL1CXmjfLWhEqyMYh6Lc
         bNoqBEzhWivPk5Uy/g7HHyJWaOQm3flu8ayUQzLrpGpuM2LIEJMnhhJV5/be7zf/ZZQI
         8FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tx7so5XKh7FIt1CA8a0h/fwFWUTtxj/iNvR1h5PSzgs=;
        b=UF9I7ryrcWFCzC9LNrHxk3VMM4pdVfRhcUk9PzY9FNyBvmTL1Qt4Yd3m9j0HTKWy4S
         Fd2FGVCj6hNeX6HO5DV8nRilHymjCIn9G7OqLVf/i63qKb/Bpjjmh59s13lXUGoTttcm
         8o6GqCoTrJ8KldI/N2Mni/VKbDIYKmYT2tu5awYycMwVekk9VqzGAW4slRpcvKJ+qsXx
         I3o3/YqvUZnNCc2Ot4t8xEttVX47JJnRpmJQzeCGZktMLwLmDSVsx4WHDPyoA+l4EzJX
         QM3hJyJjCrXaaVyKP/8gy58SNPxHbPmpKAn6PSkXmUILyHoISK+QcxNV+yGLP9efCqCL
         +vCw==
X-Gm-Message-State: AOAM531uNtXcGa2WLjsSNM8gWmmbLuomGatEo774H8k6YZ1Hr1uCOs8J
        UhZCbepTOiWVtsYA1n3qz4vobA5sspK7fbZtMxQlJA==
X-Google-Smtp-Source: ABdhPJy7t/No4fH1h4DsAU+2EaLD5XR/kFCUDJ6y6e6XetS2CV9vhLSdpVaPVEmxxKbl8FmphDgHIKYlvueG5WlWgi8=
X-Received: by 2002:a17:906:38c3:: with SMTP id r3mr2523260ejd.193.1607431323939;
 Tue, 08 Dec 2020 04:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost> <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
In-Reply-To: <X89OOUOG0x0SSxXA@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 13:41:52 +0100
Message-ID: <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 10:57 AM Johan Hovold <johan@kernel.org> wrote:
> [Me]

> > A better approach might be to create an array of names
> > prepended with something device-unique like the USB
> > bus topology? Or do we need a helper to help naming the
> > GPIOs? What would be helpful here?
> >
> > name = kasprintf(GFP_KERNEL, "%s-NAME", topology_str);
>
> Well we started discussing this back when we only had the sysfs
> interface which suffered from the same problem. I thought the chardev
> interface was supposed to get rid of the assumption of a flat name
> space? Perhaps in v3 of the ABI. ;P

It's "mostly true" that the line names are unique per-chip actually,
because people don't like the nasty warning message. I wonder
if anything would really break if I go in and make a patch to
enforce it, since all drivers passing ->names in the gpiochip
are in the kernel we can check them all.

If the names are unique-per-chip, we can add a restriction like this
with the requirement:

depends on !GPIO_SYSFS

so it can't even be compiled in if someone is using the sysfs.

That should solve the situation where people are (ab)using
the sysfs and getting name collisions as a result.

Then it should be fine for any driver to provide a names array
provided all the names are unique on that gpiochip.

I doubt it would break anything, but let's see what Geert says.
He has some special usecases in the gpio-aggregator driver
which will incidentally look for just linenames when
aggregating gpios, but I feel it is a bit thick for it to work
with multiple hot-pluggable GPIO chips as well, I don't think
that is its usecase. (We all want to be perfect but...)

> But what about any other non-pluggable
> IC, which provides a few named GPIO lines and of which there could be
> more than one in a system?

I think if there are such, and the lines are unique per-chip
we should make the drivers depend on !GPIO_SYSFS.

> The topology is already encoded in sysfs and it seems backwards to have
> each and every gpio driver reconstruct it.

I agree.

I think if this driver already has unique line-names per-gpiochip
we could actually make it depend on !GPIO_SYSFS and
just add the names.

Yours,
Linus Walleij
