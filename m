Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66322372B41
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 15:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhEDNpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 09:45:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230263AbhEDNpq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 May 2021 09:45:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99C7E613CA;
        Tue,  4 May 2021 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620135891;
        bh=OoY7sR/hY7LZvtUjMAYF/MkjrOj1a5CCgGxbKU/rJZw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OKm5uExsk0ndOjKjti3FLrEg5dOu5Bn/nkm/IjPlMivLUIYOHxSais/2AjQIBoRgl
         K9/aRVq0DtHDKztVBb76apF519fMCRfNLo6hMaArfgpH65ZQ7GCTbaSapPBouurO8u
         3MMwDMnC/oay4OKgzu1QCTmmAqM/HkVeP8Y6OzbvFZ0AciXe1RveMMoQhFCd+Sjq7u
         NEsqSvg9QJCCN4Q2wEnBtddFPY44h6xDHi6zYauc4j7qxRMCMdWjxmX+4Mur6EtzwT
         SUpBJ9Q/Xybkoa9RvyMw7iYIyV+aIosilO9wkrV8oMC2p3Adl94FNqc39wtB5cRpPx
         RjbtIijx2Znww==
Received: by mail-ed1-f43.google.com with SMTP id g14so10487496edy.6;
        Tue, 04 May 2021 06:44:51 -0700 (PDT)
X-Gm-Message-State: AOAM5301cmq3QB9z4aXZayhu0Tn2lZ5ThKmtR6GlQDrMMozmmxKe1yI0
        Ffh+971kj2brO/I8l4OU6eHuCDN5UggOt9yTUw==
X-Google-Smtp-Source: ABdhPJyXXxiV2axgsIJtm4Ts4YBQH28fg/zBYx3IUm470HLRGclpfqPPVwgy6hYb18r7lsRW1m5nchaoZwE0g+Re7iY=
X-Received: by 2002:aa7:dc10:: with SMTP id b16mr26637920edu.258.1620135890171;
 Tue, 04 May 2021 06:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <20210426095426.118356-2-tsbogend@alpha.franken.de> <CACRpkda7n3VL-EpwdXDxt47azFo8Wkp67-urUy7--3D6TJs7iA@mail.gmail.com>
In-Reply-To: <CACRpkda7n3VL-EpwdXDxt47azFo8Wkp67-urUy7--3D6TJs7iA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 4 May 2021 08:44:36 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+48xVScx87WYD85Ty5CxqO3L8taMeQ7S9QwHew1+TjKA@mail.gmail.com>
Message-ID: <CAL_Jsq+48xVScx87WYD85Ty5CxqO3L8taMeQ7S9QwHew1+TjKA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 1, 2021 at 7:13 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Apr 26, 2021 at 11:54 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>
> > Add YAML devicetree binding for IDT 79RC32434 GPIO controller
> >
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > Changes in v4:
> >  - renamed to idt,32434-gpio this time for real
>
> Overall looks good to me.
>
> > +required:
> (...)
> > +  - ngpios
>
> Is there a *technical* reason why this is required?
>
> Can't the driver just default to 32 gpios when not specified?
>
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - interrupts
>
> Why can't interrupt support be made optional?
>
> It is fine if the driver errors out if not provided, but
> for the bindings this feels optional.
>
> Or does the thing break unless you handle the IRQs?

If the hardware has interrupts, then we should describe that. It's the
OS driver that may or may not support interrupts.

Rob
