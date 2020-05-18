Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6121D73CD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 11:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgERJVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 05:21:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42035 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERJVS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 05:21:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id z3so5789158otp.9;
        Mon, 18 May 2020 02:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kAa2psThKQ7YN1P9hrBIVOheMSQY5tyl7YTngLsSf9s=;
        b=VNIFVRJo5d1tgf+kX2RCdcuftoXDm343EvYZzCOCOwr60plK6XZdHYeNBA06gIVc2c
         Kv/Pd9dZeYE8Jh0mjzv3UXfkT9z+YVATN1/ztg4s36V8Tm8MluhLD5hB/Z09i6bZ3RPM
         tGX4liSEWImVljBCUewTv/lqtaXM6LnaJMxHlxQOzXQRb28nZsJTU5PFGtwyFlbEwNgS
         YFHO6UKLrN4aNjdNn+PhCvQDYp7RySzDbbvwdu13YXmW6yO5Czi62VuIzN53MRVRtBdb
         0G39qXu0bQdBzNfx9hGs0agM+SfJKSulzJbCw9ReNxzj5SnN8Z3RCRuh+/ZwCJUizAQc
         yOsQ==
X-Gm-Message-State: AOAM532GI0DRsRNC45CKrBTdKMzJeU3A4+Ftwp1st7fDASlrqcKQp304
        RnrJ4CbLrokPTPk1K8BHuRtSrYGtrOpy4lrJXFg=
X-Google-Smtp-Source: ABdhPJy/jYVzr4UFhMG3XsAuCDffsP6l/ymaV+byoPvr3DO7/Hr0St2Gcq6sQ6SCaJT6ercVH1Hg1rifAgCbjYjrD3Q=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr11298557otp.145.1589793676622;
 Mon, 18 May 2020 02:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be> <CACRpkdaz34Bc_EzcXKMEVCCCUt82_c2+t4X6YSLW2b59oi+9gA@mail.gmail.com>
In-Reply-To: <CACRpkdaz34Bc_EzcXKMEVCCCUt82_c2+t4X6YSLW2b59oi+9gA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 May 2020 11:20:59 +0200
Message-ID: <CAMuHMdUtNVfAnQODjWaDo_+ncFBwq=cNLMt=hsMqiVbqx-1XVg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, May 18, 2020 at 10:17 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> I have queued this v7 patch set in an immutable branch for testing and also
> merged to my "devel" branch for testing.
>
> If all goes well it also hits linux-next soon.

Thank a lot!

Back to the QEMU side...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
