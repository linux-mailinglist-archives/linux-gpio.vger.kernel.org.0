Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5575154EDF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 23:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgBFW1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 17:27:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37069 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgBFW1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2020 17:27:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so335762wru.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2020 14:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MNds49IcWx4nfR2y5vEmKA96Wni6tdn8XwP9GpCdGmk=;
        b=umbtkvnIwclCPt3UU0MxXi1sKX6Z4RURUTaypSwYLTsotPQC/vhtVE8Rp7LK1q6laJ
         YqnMjYPZ95gA+6NRsrCMUkYRe6Z2wPKdDZ7eqhmuj0vaJoVsj4t5cgclTUqFXY9nS/hY
         0pl4OszNVWVu6xRsYBLNNYpjtuSVpvH1io2HehhxZa1AdLt8vfWuJNLX8WePAmwdtdXN
         rSnC+vqlbTkvOExIRa7j1s4klGJNzAVtCob5UD04VZd2ThOy/4VC1L4rG8t0SM5AJML0
         9I8EQDgV2dM3L1G6dDhi5UD5iY6PJQGWmLAphruH4Zdvo4fad48AH0G2s6Z2R8etBUru
         6yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MNds49IcWx4nfR2y5vEmKA96Wni6tdn8XwP9GpCdGmk=;
        b=Vn3GJ1BaCw0MPeIyUdNgT0nlI8iCKLSGUm5+Z9fRNyb0X3IDsbMJw0NgIpVRdSa2GY
         aTJyt+ANG6sc11axzAjhwBjHQuKWoEK8pbJJGB3vCm/crdWNUzmiHVw0Qclq5MpGT4Pd
         PIlx5+A5AzxbVoQjJBXw/YLOTRjhz3ErFp46z62sXx6Z2jAg5FhBAbNheZoC3X5iSv6/
         nyzBClOUO4ORM5zjCuey5lOUqhuQmiRxrDrkKrJE3yhy8HbGVqYEFa+oyl/+f3v6EDeL
         C3n2jSAx1JNHueGF7SKxFw6XIJ47su8cGQOy6ZAk8Zg+TIIyPP9KGwctm+3mRCwlC4vs
         pWAQ==
X-Gm-Message-State: APjAAAUY+QoD5WNbCVsiBb4M2XjkqbQEFbmYfGgl/7bq3kFKMy45E0nA
        jlNPqV//kDqCuIZ6zt/nuKIq35kLHs9GMCoAlMTP5Q==
X-Google-Smtp-Source: APXvYqxUCp/JBFhD831bn2alN/uVeNrgyIAVbjvFEIr2YFrvvlqq5ugPf1xEfY1aKbMa7eYQC2HkgJrigsjyy5cJ+s8=
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr189290wrn.344.1581028025651;
 Thu, 06 Feb 2020 14:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20200205194804.1647-1-mst@semihalf.com> <20200206083149.GK2667@lahna.fi.intel.com>
In-Reply-To: <20200206083149.GK2667@lahna.fi.intel.com>
From:   =?UTF-8?Q?Micha=C5=82_Stanek?= <mst@semihalf.com>
Date:   Thu, 6 Feb 2020 23:26:54 +0100
Message-ID: <CAMiGqYi2rVAc=hepkY-4S1U_3dJdbR4pOoB0f8tbBL4pzWLdxA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add quirk with custom translation of
 ACPI GPIO numbers
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, stanekm@google.com,
        stable@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>,
        levinale@chromium.org, andriy.shevchenko@linux.intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, rafael.j.wysocki@intel.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 6, 2020 at 9:31 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Wed, Feb 05, 2020 at 08:48:04PM +0100, Michal Stanek wrote:
> > Dropping custom Linux GPIO translation caused some Intel_Strago based Chromebooks
> > with old firmware to detect GPIOs incorrectly. Add quirk which restores some code removed by
> > commit 03c4749dd6c7ff94 ("gpio / ACPI: Drop unnecessary ACPI GPIO to Linux GPIO translation").
>
> Hi,
>
> Can you elaborate this? I was under the impression that all the
> different Strago systems have been already worked around by patches from
> Dmitry (Cc'd).

Hi Mika,

The previous patches from Dmitry handled IRQ numbering, here we have a
similar issue with GPIO to pin translation - hardcoded values in FW
which do not agree with the (non-consecutive) numbering in newer
kernels.

> What GPIO(s) we are talking about and how does it show up to the user?

As an example, the issue manifests itself when you run 'crossystem
wpsw_cur'. On my Kefka it incorrectly reports the value as 1 instead
of 0 when the write protect screw is removed.


> > +             /*
> > +              * Some Braswell based Google Chromebooks need custom ACPI GPIO
> > +              * number translation due to hardcoded GPIO numbers in firmware.
> > +              */
> > +             .ident = "Intel_Strago based Chromebooks (All models)",
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> > +                     DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
>
> Same comment here. Are you saying all Stragos are broken in the current
> mainline?

Yes, I believe all Braswell based Chromebooks are affected.
Yes, I believe all Braswell based Chromebooks are affected.
