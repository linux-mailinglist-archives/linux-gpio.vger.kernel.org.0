Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB2A1320DE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgAGICc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:02:32 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45801 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgAGICc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:02:32 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so75333258otp.12;
        Tue, 07 Jan 2020 00:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gWtGSvrvqj2AXyyq8wSP7MkIDXrKmFzyU8WLInWmmmM=;
        b=uJGPnUWT2fgEW7NwA5VNHUoAEiODFbBHtE5WgtafeT64J+GbWpI8TetH1Rw6EyZCHN
         mp9JuIcWmEKJgJg6WSl+fCKBpcdJ+U5vO7jPOX0cDXHOVnmAQstkmYxZeUv3MaF18DI4
         Hjfv7bCpNc6tJ8nsUQM0SHstYKxPhL51E9FMBdZwHM5kV1gzROfN6+LpY982sG5duqBo
         56F1gimO5dbpNCZm1Zik+0Guk1HICp/yEEtG+JSpVwpkwZtU8xYabr/fcCd/nrb8meT1
         p3oIlF+LjjugAe6sCcBLAhATKFIWnGcYlbpBnQAUNbwPKbYTlWIxhPELemAQviFMClI5
         bSqQ==
X-Gm-Message-State: APjAAAXeaniCrFS2ykQeVdBO71yLJihk0lgysQTZ70boMy2TwuroZQJh
        /WxOcGsj7jpQxuUyqFOv35UxUTKudQHOjLv3QPLKPny9
X-Google-Smtp-Source: APXvYqzSi9MVw/FPeW9TOgb3jI/DXK3Qcmr0bBEADQfnQ3cj/FW1nMF2VK4jkU4UCWEdTeHD/7fBEjnw5ck2vYvFb3E=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr121132715otd.39.1578384150999;
 Tue, 07 Jan 2020 00:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <20191230133852.5890-3-geert+renesas@glider.be> <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
 <70d24070-4f6d-8fc8-1214-1bd800cb5246@gmail.com> <49c477ed-0da3-9269-803a-cc35cd1137b8@gmail.com>
In-Reply-To: <49c477ed-0da3-9269-803a-cc35cd1137b8@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 09:02:19 +0100
Message-ID: <CAMuHMdUJ_jknvY_Fp0Tghif_J3uaT9MhiX5KXXBKJ_=P4hfkUQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Frank,

On Tue, Jan 7, 2020 at 8:26 AM Frank Rowand <frowand.list@gmail.com> wrote:
> On 1/7/20 1:10 AM, Frank Rowand wrote:
> > On 1/6/20 5:34 PM, Frank Rowand wrote:
> >> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
> >>> As GPIO hogs are configured at GPIO controller initialization time,
> >>> adding/removing GPIO hogs in DT overlays does not work.
> >>>
> >>> Add support for GPIO hogs described in DT overlays by registering an OF
> >>> reconfiguration notifier, to handle the addition and removal of GPIO hog
> >>> subnodes to/from a GPIO controller device node.
> >>>
> >>> Note that when a GPIO hog device node is being removed, its "gpios"
> >>> properties is no longer available, so we have to keep track of which
> >>> node a hog belongs to, which is done by adding a pointer to the hog's
> >>> device node to struct gpio_desc.
> >>
> >> If I have read the patches and the existing overlay source correctly,
> >> then some observations:
> >>
> >> - A gpio hog node added in an overlay will be properly processed.
> >>
> >> - A gpio hog node already existing in the live devicetree, but with a
> >>   non-active status will be properly processed if the status of the
> >>   gpio hog node is changed to "ok" in the overlay.
> >>
> >> - If a gpio hog node already exists in the live devicetree with an
> >>   active status, then any updated or added properties in that gpio
> >>   hog node in the overlay will have no effect.
> >>
> >>   There is a scenario where the updated property would have an effect:
> >>   apply a second overlay that sets the status to inactive, then apply
> >>   a third overlay that sets the status back to active.  This is a
> >>   rather contrived example and I think it should be documented as
> >>   not supported and the result undefined.
> >
> > I went back and double checked the related code.  For gpio hog nodes
> > that are in a non-overlay, the status property is checked because
> > of_gpiochip_scan_gpios() uses for_each_available_child_of_node()
> > to search for gpio hog nodes, and for_each_available_child_of_node()
> > checks the status property.  But in the case of a gpio hog node
> > added by an overlay, of_gpio_notify() does not check the status
> > property in the gpio hog node.  The check for the status property
> > should be added to of_gpio_notify().
>
> One more thing I have not thought through is the case where the
> overlay contains both the gpio node and the gpio hog node.  I'll
> walk through that tomorrow.

I haven't veried that, but I assume that works already without my patch,
as GPIO hogs are configured at GPIO controller initialization time.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
