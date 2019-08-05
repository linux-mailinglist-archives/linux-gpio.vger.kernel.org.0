Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B316817AE
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbfHEK5M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:57:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35235 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbfHEK5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:57:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so78987881ljh.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TzWdXtLAUrrMBEEWJP4I6zJKWMOnmN0iEzqlYudmigQ=;
        b=g4W9SBDYNYE5i6F+dksQYRpRO4BX2DMuzPAdV16wK7x2aQ1wGkFgxbu8+Tm/ur7a3i
         fmcqYRfAGMb3NMQvgoiabqFOLHynxWg53UaSlj7K/wrkcAU5FMjV3+Lcf/+sGDDxbnmw
         k7SEsjCRBO7OjRk2s8QOVRy+yoD8ERWCA0PbeB81hAVC5DZkNBXrg3564rgc9pzeW07v
         aHFrc4YuUeKwM2k5K/dv54tQ9x/2x06HRmePnl1L4VhnCeQ03Q8yZvab3XCChSThFnXx
         m9AzVUheQtNyQnM/qz9047gQ6G40pShUOtDkiea2+tKcN0K9jmjGdGJsJWZheJGJaZLm
         tKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TzWdXtLAUrrMBEEWJP4I6zJKWMOnmN0iEzqlYudmigQ=;
        b=BMPB2sQUxzovk2g3zL0Pq0cpfAfdpO54UlCIUVFl8KM51CFf233h1MMmqUYd1SztOD
         YDU/rw5/PvQ6KHmcmQ5e7DnwbRrDbatnVGfuPfzPoXADgUbOz0ULE+NSuEhQdkvmeQkP
         8jUprUnfhZuU80ww2i4QSW2XHmoM7e8yW+wt+nNIZOP1gREjwQwqhP1IOA4lR+cY7AZ/
         rucP3J1SyBx0amiUcFe83O9GtyeY6MbCAEwMPLet/hun6x18jBCryfW9NHK3OjXb3ztX
         F2vRJiPYXbUcjNI7z388GtI7JeXc/T3MdFW9nLJVMmZBgQMfAuOHlq/ypFb+P8UmlWyM
         Kzmw==
X-Gm-Message-State: APjAAAULPQ09iG1H+8bI6NnQugNWJbns3rF6L3CxuX32EA+FB/ZopWcx
        CKeL/woT7IhgYQARv+OzpNPBAml2+YLMOv5TYPnBjw==
X-Google-Smtp-Source: APXvYqyXFtChkPbm6NCyp23ajAiI62OlDD+/hHiQbm7lI17gWZ6ZJDZrRUyF56jvAOxDqP7Qr/vCARhS5NqWxJ1VRII=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr13843059ljo.69.1565002630201;
 Mon, 05 Aug 2019 03:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CACRpkdY6qAUkQW4YHN9HskvZS2P-viWYTHSb28ECh1p+itU=4Q@mail.gmail.com> <dc2016d4-b06c-aa8e-2644-90caa40fbd63@arm.com>
In-Reply-To: <dc2016d4-b06c-aa8e-2644-90caa40fbd63@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:56:58 +0200
Message-ID: <CACRpkdYeBPuR32+ZVXY0y9XrUyGuEPWEwGuF-r9D3yYa4ANJGw@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        christoffer.dall@arm.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 12:21 PM Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 01/08/2019 09:41, Linus Walleij wrote:

> > I would even go so far as to call it "gpio-virtualization" or
> > "gpio-virtualized" rather than "gpio-virtual" so it is clear what the
> > intended usecase is. We have a bit of confusion in the kernel
> > because people misuse the word "virtual" left and right, like for
> > "virtual IRQ number" (Linux IRQ numbers) which are just some
> > random number space, but not really "virtual", it's a semantic
> > disease similar to the confusion of using the word "manual" in
> > computer code.
>
> I'd drop the notion of "virtual" altogether. Nothing is virtual in this
> thing at all (the GPIOs are very real, from what I gather). Instead (and
> assuming I got it right, which is a long shot), what you have is a
> "synthetic" GPIO controller, made from the GPIOs belonging to other
> controllers. I'd call it "GPIO aggregator".

+1 on this.

Next thing that will predictably follow is a userspace ABI to
create those aggregators and have them go away if the
process creating it dies. Something to think of...

> > If QEMU can deal in a simple and straight-forward way with this
> > I see it quickly becoming a very useful tool for industrial automation
> > where you want to run each control system in isolation and just
> > respawn the virtual machine if something goes wrong.
>
> What the VMM (QEMU, kvmtool) would need to do is to present this as a
> "standard" GPIO IP, and use the backend aggregator to emulate it.
> Certainly doable. The nice part is that all the work is in userspace,
> and thus completely off my plate! ;-)

Yeah there is not really any "standard" GPIO, but if the user is running
e.g. a Versatile Express model, that has a PL061 GPIO, and then
a user would create an "aggregator GPIO" with say 8 lines and
QEMU would pick that up as /dev/gpiochipN and bind it inside
of QEMU to the lines of the virttualized PL061 GPIO controller,
so the machine thinks it is using a PL061 but in reality it is
just 8 GPIO lines on the host computer.

> You also may want to look into not emulating a standard IP, but use
> something virtio-based instead. The ACRN project seems to have something
> like this in progress, but I know nothing about it.

That sounds quite interesting as well.

Then the virtualized machine can just pick this "virtio GPIO" and
some command line switches or config file on the host can
set up and route a GPIO aggregator.

Yours,
Linus Walleij
