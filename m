Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADA9A15672C
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 19:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBHSnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 13:43:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51711 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgBHSnj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 13:43:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so5756721wmi.1
        for <linux-gpio@vger.kernel.org>; Sat, 08 Feb 2020 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pkGGU8cEcpg1WQ5oeotxdCpOUBGNhi+JYRWVa+V80s=;
        b=ms+A/tTuvVz3HZCbAlRinLVe0SmeiI3IuRip/0uQPzHbS9mUbtBNFcgeSke7bLaLSp
         p5pgxVUFVWi2o+JvDU/dCAkNUKIwrCe5x+XurkivpcLK+ONpQm0aNnwLePtsKr2qGk0F
         PIUqpCV4OgxB5Clg78ul1dEnBJQqlb+Wm/dVlpVgInHGrWnynXzHG5xdBFivNhc1a4y+
         pWbLAE5x3LdoSNIyrCnG8Uq/2rd4rELIqEg8m69IeDmeAv1okYOMcgkjrScZ/bjfwNoT
         BCQffulbka/25ZR/6d1EvPDrVwadiuJbkfmlKsw9jN9iVuThDkS/FMsdAa4OKYi0zKAQ
         H/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pkGGU8cEcpg1WQ5oeotxdCpOUBGNhi+JYRWVa+V80s=;
        b=mYt/Luvx4zdMfXgPD2DjumzVnbBjp1XZvf9zZxWeEYTZS1QzPNlkK+HC3n6erVb+ZI
         KC03W0OJJ00eyX7v5kWq26L4+Gx4g2XwphevCyYQzGCaJxOZ5i/C/K0oSCGk8/nI+nFN
         M1kNacC7AYWgfiB+P09aOs6Jdm5kPRDGgydpLsT5eF8RSwAAOhzCXVDvZYy7l7SLTIT5
         kDEi2ihkKBeTfFpvJRDGyFlejQ565lQGA7G+gTIsSyGu9FNNxUvk8uwEFWpZXl7QAHtf
         kQU5Taq30utbAlqk11Yrt7U2Zu1X2ChWkSd+Xh5c9zVNnUbQiXBZijrW4KuKSCyZl22q
         Os2Q==
X-Gm-Message-State: APjAAAWAv5yafUW+CkHs3XhUYXuV2//+ncxq9ILTjPcocrUGqCpLKWnl
        3Y0clZ8K8sbP1FjH8tP2sWcftL5neR9XstJhCNeTOzZavHU=
X-Google-Smtp-Source: APXvYqxtmrVmPK8v7/hnwsOr9LLRPCmhswgHaA017VNaGV7/DhRBF2VBSd/TMopxN856SckCGc/G/zrwkCk+G1ht4Fw=
X-Received: by 2002:a1c:9dce:: with SMTP id g197mr5128787wme.23.1581187416790;
 Sat, 08 Feb 2020 10:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20200205194804.1647-1-mst@semihalf.com> <20200206083149.GK2667@lahna.fi.intel.com>
 <CAMiGqYi2rVAc=hepkY-4S1U_3dJdbR4pOoB0f8tbBL4pzWLdxA@mail.gmail.com> <20200207075654.GB2667@lahna.fi.intel.com>
In-Reply-To: <20200207075654.GB2667@lahna.fi.intel.com>
From:   =?UTF-8?Q?Micha=C5=82_Stanek?= <mst@semihalf.com>
Date:   Sat, 8 Feb 2020 19:43:24 +0100
Message-ID: <CAMiGqYjmd2edUezEXsX4JBSyOozzks1Pu8miPEviGsx=x59nZQ@mail.gmail.com>
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

> >
> > Hi Mika,
> >
> > The previous patches from Dmitry handled IRQ numbering, here we have a
> > similar issue with GPIO to pin translation - hardcoded values in FW
> > which do not agree with the (non-consecutive) numbering in newer
> > kernels.
>
> Hmm, so instead of passing GpioIo/GpioInt resources to devices the
> firmware uses some hard-coded Linux GPIO numbering scheme? Would you
> able to share the exact firmware description where this happens?

Actually it is a GPIO offset in ACPI tables for Braswell that was
hardcoded in the old firmware to match the previous (consecutive)
Linux GPIO numbering.

> > > What GPIO(s) we are talking about and how does it show up to the user?
> >
> > As an example, the issue manifests itself when you run 'crossystem
> > wpsw_cur'. On my Kefka it incorrectly reports the value as 1 instead
> > of 0 when the write protect screw is removed.
>
> Is it poking GPIOs directly through sysfs relying the Linux GPIO
> numbering (which can change and is fragile anyway)?

I believe so, yes.
