Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385182990C8
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783525AbgJZPP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:15:59 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46817 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783519AbgJZPP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:15:58 -0400
Received: by mail-qk1-f193.google.com with SMTP id a23so8606656qkg.13
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=buOSgYj8nesBJduFGburfbQ47xwt4bpG9JY6+8gKov4=;
        b=iYn35eWa/XewaG2MxDAW6amkL78yH6RaWqiOQTAYYuFqpJstL0IazZysjd93a39Y60
         BCv/crpm3lNlkyYlvFrts8btSTlJCkJQ1n2hiZ9ZPp7p4sxQG9cSQ8hOfKH3QHPYsJrm
         2tEB1TEGjR2Zlgdl5lNZbjMCenXSZGLfcnoFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=buOSgYj8nesBJduFGburfbQ47xwt4bpG9JY6+8gKov4=;
        b=A22hzY4R7sue2GcTtBa6uoJWGKFr7p9YcIneoyIlGAzpyRqxqUXK6Ge8k/J+3QpRv9
         e4Ykih029ylpN0wCZkSsAPC7xGXodiftluwToRosky41gEO5lxm6gCa1UgFI3KX/3l3y
         Uj8HVpEnCMFAN/V+YWKtyptrb3INjTvti7LwyU1C9xdzOiYWDa+t+fJwNMCc7BE/NDKN
         x9njRWdyT7bWXZvH6NMK+XTTdcrTYptyCP9RTNgKR1wwyZPuq44sj4D1GjeCC76zJfNa
         1oaZf41EzHD9epfgAu6iEA4DKxnegfUCrFH5BhHNnUYZZen+cKL2p7lxh9yumKc0iSPq
         eHBg==
X-Gm-Message-State: AOAM532/atjr3iwFkRcMxN0tZyE4D3zq5Dq9F81LM0GV7xl9LCeAdyTR
        j0j7zE1nj9JutPe/oGds/Gs+fPA5HNUbtFVV4viTYkD/aac=
X-Google-Smtp-Source: ABdhPJzKvXMXDrmyVSP4kBSPjVcLXMaCfUmvAVBzFodzU54xWpGYxUXTnQVPmdZl2pZjxna3DgRbeae53Vc3ti/oSoY=
X-Received: by 2002:ae9:e807:: with SMTP id a7mr1269594qkg.443.1603725355881;
 Mon, 26 Oct 2020 08:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-2-daniel@0x0f.com>
 <20201026134604.GA43947@bogus>
In-Reply-To: <20201026134604.GA43947@bogus>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 27 Oct 2020 00:15:45 +0900
Message-ID: <CAFr9PXmuOCRoUiqNAdMi=xX142U46=Vnk-EHp9H02L8nut0esQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: Add a binding header for the
 MSC313 GPIO driver
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Mon, 26 Oct 2020 at 22:46, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 19, 2020 at 11:10:04PM +0900, Daniel Palmer wrote:
> > Header adds defines for the gpio number of each pin
> > from the driver view. The gpio block seems to support 128 lines
> > but what line is mapped to a physical pin depends on the chip.
> > The driver itself uses the index of a pin's offset in an array
> > of the possible offsets for a chip as the gpio number.
> >
> > The defines remove the need to work out that index to consume
> > a pin in the device tree.
>
> I'd expect the DT to have 0-127 numbering... If you need to map that to
> another number, then an array property in DT could handle that.
>

Thank you for the comments on this header and the binding description.

Thinking about this again I'm thinking about having the GPIO numbers
be 0-127 like you say but supplying the valid offsets for that
specific chip and the pad/pin names to make visible to the user via an
array/arrays that contains the pin register offsets and the pin names.
Basically my per-chip table moves out of the driver and into the DT.
Does that sound acceptable? The main thing I want to avoid is
presenting the user with 128 gpios when the actually chip only has <10
of them wired up.

Thanks,

Daniel
