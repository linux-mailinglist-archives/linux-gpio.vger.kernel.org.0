Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DF2343CEA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 10:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCVJdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 05:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhCVJc4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 05:32:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54320C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 02:32:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m12so20149576lfq.10
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C67DpF1KtpYNwlxaARq6ob5Dr4pLDohlmzXIHLbba5k=;
        b=BVRyNkoRJsq7rbYOyZK+qqVEKaWDz734WMzgF2hzAmldFwoT4bQSqvVANhi20vVTin
         T0KguqYNpYKJyOnc5xY1jBbKV7b2Z8FS+MsOhRTes1usp6J3dWZMQpHiff1Eb1D55yRq
         nIhde0iWk06RT228pGYU+zSdCEuA3FJ4Pc5hxxyhQe8V5nENtD8TeNrlV7vM9JY+i3QD
         bOO63QFL7/vcK3tORfP4ePUs0qG4+vj8V2oCQydPEvfkpp5mcDQ9Rpr7dGWj0W0itBHK
         Jtrwbee1U9C8h8mmrlbKhcm5OH0Qy9aPSqIovccE4vWD/GJF9+1zjfpMGS/Vq7kPvAc7
         2FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C67DpF1KtpYNwlxaARq6ob5Dr4pLDohlmzXIHLbba5k=;
        b=OXS6OjOmJ9G3uEGwkNWWIjZVSKcrEItBCSpGHVadIetgW7LciMsm/A/Tho9l8PYWTR
         4oOrThSVsPMOZUzuytkbb7sfBKG8mYhgDSdNMgWEIueIfMovs1RxtFb2KFmJY8ZFX3N4
         nh3lfTVSWqJTihLTBg/8TlU0wnEai4t9EZ4ZXnXUyMgtxZLIFAugaLlqPvi8BwyvxjmX
         zSPi2zYgJ/XVTaZA6WrwW7iK4DMZpGBsaDkF5+2yB9emQBfVQlwP6Y2ReUxzrjOnIqjt
         pV6gxI9Vti8IWjRqCB4mOBlJ8zXvW10g19XazHWmW8xLM4MRMrNshLwt9oioZp+fk/Rx
         VYHg==
X-Gm-Message-State: AOAM531u4gf8PLsZ6/KvX66xqMhdY9NddANs63zhWPSiFatbHXZvL5Aw
        E8XCn5vPhZfByKVyFZDTNxn68M1CVfMLu2glVShaOQ==
X-Google-Smtp-Source: ABdhPJyvw1v6b754u5NQaageISGFAwipZV0zDgOlXLK9SVxnh/nCYCPUxoub/byxofEBUVQZ5jb0Xog7+CBSNtEBGSI=
X-Received: by 2002:a19:4c87:: with SMTP id z129mr8466782lfa.183.1616405574861;
 Mon, 22 Mar 2021 02:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com> <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com>
In-Reply-To: <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 10:32:43 +0100
Message-ID: <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 9:52 AM Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:
> On 20/03/2021 12:28, Linus Walleij wrote:
> > This is starting to look right :)
> >
> > But use the top-level board DT compatible to determine that
> > hiearchy is needed, and implement a per-soc child_to_parent_hwirq()
> > and do not attempt to get the IRQs from the device tree.
>
> No! We have all 3 variants on the same board (without IRQs as well)!
> Even AXXIA has 1-parent and 8-parent variant in the same upstream DT!

OK we have to discern it somehow. Since the SoC integration is
specific for these PL061 instances, we would normally add a
unique compatible string for this version of the GPIO controller.

The compatible field is intended to say how this hardware
works after all. I would even say the original PL061 has
been modified to pull out individual IRQ lines so the cell is
arguably no more compatible with "arm,pl061".
As far as I understand the original PrimeCell can't really
do that, someone has been hacking the VHDL code.

However since this is a PrimeCell, first check if the
PrimeCell ID number has been updated in the hardware.
(Just hack drivers/amba/bus.c to print what it finds in the
PID/CID registers when probing.) If LSI have been nice
enough to update this ID with something unique then
that can be used to determine the variant.

If the PrimeCell ID has not been updated (and this happens)
I'd say we need to use a unique compatible string.

You'll have to update this first:
Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

I think it should be something like

compatible = "lsi,<soc-name>-pl061", "arm,primecell";

Where <soc-name> is something reasonable for this
SoC unless LSI have their own name for this modified
block on this SoC. I think it needs to be SoC-unique
since I bet it will be routing the IRQs to different HW IRQs
every time a new SoC is made.

Then augment the behaviour in the PL061 driver accordingly
when this new compatible is found, using the HW offsets
for this SoC.

Yours,
Linus Walleij
