Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF991E26B3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 18:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgEZQTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgEZQTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 12:19:00 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED06C03E96D
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 09:18:58 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id c8so2276833iob.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlO7WABGBLOy77NqEHgOcO5q8wjIIW1MJbT7hwWRp0k=;
        b=q3emcy0V8Y6OP022PCSTSurJ3wLTYi4A0DRsfReAqnK0fLz53pAwcrT8cbIqxbb3kt
         9tsnlYo6HwG9iuxtV33aiddsznKRc8tMkZ/paMgb6ytXEUN1U+ctsB2zCsQUPV2fZHTi
         /M6maObujop17CM5/wul1FRQDeim+E/bNgKvFDxzacro5AwyQPJpLM1LnZkHmypSs0cB
         JWolPlApPCjGGRPNhdjT+L0RiO3l+F7Nlm594sdXpa9mrTCjYOnC/R+sYdsd2Gn+/Tiz
         MkjBeIVSbEPQAP/47ki4w/JNUxUa4Fr+mBWnfnWSTyZ7TyZ6FH4HtxopagDrekTdmb93
         JLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlO7WABGBLOy77NqEHgOcO5q8wjIIW1MJbT7hwWRp0k=;
        b=Uy7Jhk4gaEsHlHouUWY6jEpDctyzuiEQ0muSmy1fazqVIwYd7VYRxobpW62YFBByrU
         7+o3LDAIleWeLD0ubyqDH6TrYrZT21JwIVUX5SwqY1AuZ09uI8+yx8frLk++4VKVQDB2
         895fb+eASXI4ohFb3/l0MOl2F5WOVRAZyNhbu3JSC+Slh2pc5CLBt2TJaA/Wc9LeO3gT
         +SQw38VCa8uYoIbysjBlBRBY/O79fWQM6oK/KYBRD7+BPlMtbjSR6141GOngE6jNUbP1
         5jekOg2VZpGnoFegALsL3IKZC06PR4dO2V5c6X1qX/MVmWjVzSiClHZWUEbc8eX6Yuli
         JWCg==
X-Gm-Message-State: AOAM531eFvExge8oZjP7zKPq8Kk/25A1w5/KGnl6xLEKGkWz/xUonVNt
        hDzk9MyPxSEHE1lLOAiLwm4TZKcV2yuVSYds51mEvNg=
X-Google-Smtp-Source: ABdhPJyykN+IJraXkUEetmcQG3Y6UE7p1Tz5VeiHZSEqW+NqCsfIqUzYleBLBJyz7PFglF/BUigGXM73xWcxXz7EpY8=
X-Received: by 2002:a05:6638:cb2:: with SMTP id x18mr1836912jad.6.1590509938113;
 Tue, 26 May 2020 09:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200525054833.28995-1-saraon640529@gmail.com> <CACRpkdbubY-DjuTx=-vj9rrLuSGgZekDw0J4DHpnU5bf5BorZw@mail.gmail.com>
In-Reply-To: <CACRpkdbubY-DjuTx=-vj9rrLuSGgZekDw0J4DHpnU5bf5BorZw@mail.gmail.com>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Tue, 26 May 2020 11:18:46 -0500
Message-ID: <CAErSpo77YJaiiWnSUgoJ-0Kyjt+RAW2f3bqcy95=BG_SL2GcHg@mail.gmail.com>
Subject: Re: [PATCH] GPIO: Submit a new GPIO driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Richard Hsu <saraon640529@gmail.com>, Richard_Hsu@asmedia.com.tw,
        Yd_Tseng@asmedia.com.tw, Andrew_Su@asmedia.com.tw,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 7:58 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Richard!
>
> Thanks for your patch!
>
> On Mon, May 25, 2020 at 7:48 AM Richard Hsu <saraon640529@gmail.com> wrote:
>
> > This driver provide GPIO functionality on Asmedia 28XX and 18XX PCI-E
> > Bridge
> >
> > Signed-off-by: Richard Hsu <saraon640529@gmail.com>
> > ---
> >  patch | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>
> There is something off with how this patch is generated.
>
> > diff --git a/patch b/patch
> > index 0000000..a713f91
> > --- /dev/null
> > +++ b/patch
> > @@ -0,0 +1,312 @@
> > +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
> > +--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c   1970-01-01 08:00:00.000000000 +0800
> > ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-22 11:55:13.736272177 +0800
>
> Definitely off. Can't you just generate it from the git repo using
> git format-patch HEAD^..HEAD or something?
>
> > ++#include <linux/module.h>
> > ++#include <linux/kernel.h>
> > ++#include <linux/gpio/driver.h>
> > ++#include <linux/pci.h>
> > ++#include <linux/spinlock.h>
> > ++#include <linux/pm_runtime.h>
>
> #include <linux/bits.h>
> Because you use BIT().
>
> Maybe the PCI maintainer could look at how the pci_* accessors are
> used in this driver because that beats me.

I'd be happy to look.  Can you point me at the patch?

Bjorn
