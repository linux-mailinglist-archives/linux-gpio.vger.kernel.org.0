Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400118CDF3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfHNIMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:12:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34243 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfHNIMu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:12:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id b29so71444614lfq.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TIlZCkZJxlDHR28R+sS00MYCYudDvIqTXfAD+oLJbI=;
        b=lr/rJWiCX2YbF/m0sA6in0LUPFKk7OLlPwqjMHp+4OuMai6Qm5bIo8KlHUfTj1Oj2p
         IZsZuR71qepX2fmJ89BeC77N8//zuYP35xcuQY1nYpbt5xJG324dcqPR5bx6W7qixBEc
         oSGT66V8vOOfqotF4pMAm/QyfrsPgChHTbRdFtzTicG9Qo4JsBpSnNUdxqwsWAuKU2xN
         OxyGF+8uhS/RlYVjaJ0kO7itdnte1IkPN8q9WrvoAVKWU+hHVKctSHxhDg5fRyBedgmE
         0TJnioZR+KInVg8xWUXPnMF/bhUgZfCvm4XcB682p85KaTnXAuqTdQuQWCNR4W0A8sH8
         6eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TIlZCkZJxlDHR28R+sS00MYCYudDvIqTXfAD+oLJbI=;
        b=J1VTu1CkulChJWPV2KHQz7BKMSZQ8TmDNF9V18iUQL2coD4CyRac8VgX7goZOfwns1
         nLmm4c3mZTjs90gfQKAOWigAmalsBZvMNe01hvYLpv4+upxvgz+wBXH9K5PROzNRCwdy
         Bvy3mXlRHuugp64ENojq09tTpqBiXatwoXor4FteOWhsjgLGQWm8YefoXD88TsRTSDxY
         BJYe5zyW0bDh4ACcywrb16Uos5ELs+bvjZ128+s1+Gn3r73DduC3lv8HH9ESXN/0/5cz
         U0AG7U/zN72nJzvVMyq/IRXqbhG9wOpjYqndlL2HhpSikbYLBSE4F4Fl6QNsc83ifDTt
         5Dsw==
X-Gm-Message-State: APjAAAU0OXI50CWDcBOdDHU8LbdX2g2KauVRqqoEzVR+pqrahuSlhYWs
        5IRKsgIPUVtmaQ5smxSUAznVfXtpvuBpA7BRaGiTYw==
X-Google-Smtp-Source: APXvYqwHvlDH0vndo0pr4NUQfvDBqBjDw418y79oXm0vBTRfqtR7xugOl/tDvhDPmUMcLM3wHxVOo0NOAEPfVdKl1bw=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr25628516lfp.61.1565770368060;
 Wed, 14 Aug 2019 01:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com> <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
In-Reply-To: <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:12:36 +0200
Message-ID: <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 7, 2019 at 2:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> > This is the second batch of changes (out of three) to support the brand
> > new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
> >
> > We add a new compatible (and the relevant support in the pinctrl
> > driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.
>
> Waiting for review from the Mvebu maintainers.
>
> If it takes too long just nudge me, it looks good to me.

So if the other MVEBU maintainers don't really look much at MVEBU
patches anymore while Miquel is working a lot on the platform,
what about listing Miquel as maintainer under the SoC entry, hm?

Yours,
Linus Walleij
