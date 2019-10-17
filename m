Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C133DAE05
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 15:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394410AbfJQNPJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 09:15:09 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44279 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394358AbfJQNPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 09:15:09 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so1805133otj.11;
        Thu, 17 Oct 2019 06:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X4y1bL0W15R+iE+SZario6x1aoorMFx/lA03Hqcj+uo=;
        b=XjClrDWNDoaEXM8jCzjqpU7bb2QHSY1Wr6yi813YTp4ULQQ7Pt4ZhSbzAt2RR1y3RG
         KaKZm4RQz+9hJbZU1dUjEWaQpt7XCRr7lvjsDHXy7e6d7TEsNDmZ852T/8Q7dMSLNJNz
         xxwWW0gQJuCTX+X/vcYKoIHPBzsBiBX0h33iLH5ZecWP0g/O51n9Qfs/GHJGw13hYp3x
         1f0mme5exwofv236ZHhr9Qj4qMTfBfcEX21BUYryC1pY3sS5vFRWXdGpYm+nmazMWHKs
         tYiK9PXkvcFSFLC+c7cJUmi3C5CBTtrCGtND6HHdZRINfidTc6OqvMyxZYWcaXvTc2HT
         sxzQ==
X-Gm-Message-State: APjAAAUAhVeRdlUvonNz2r3WsGU+TMDJauai94bBViQD0B+PTJjdPu18
        sVtCtdbC8na1DAcDzyODZa2I2Uz5ZNE0ZrZflLo=
X-Google-Smtp-Source: APXvYqx6Cyj0duUJOmyaICT1oznRv0AsWMh3/W9MVZ9kCrwp9V1GSyE7je5R0ohOloX8VfE95wNZLLERLoGqQy+zYsU=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr3037382otk.39.1571318108713;
 Thu, 17 Oct 2019 06:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <1e48cafb-6ec5-0573-4829-03e36f9d3d82@codethink.co.uk>
In-Reply-To: <1e48cafb-6ec5-0573-4829-03e36f9d3d82@codethink.co.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Oct 2019 15:14:57 +0200
Message-ID: <CAMuHMdWMbQeFciY-wet0onMrGOCsB+PrTs03Nf=TdjLiaFsnKg@mail.gmail.com>
Subject: Re: drivers/pinctrl/sh-pfc/pfc-sh7734.c multiple define of TCLK1_B
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Ben,

On Thu, Oct 17, 2019 at 1:54 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> drivers/pinctrl/sh-pfc/pfc-sh7734.c hsa TCLK1_B defined twice.
> Not sure how to fix, so reporting it here:
>
>    1453          GPIO_FN(RD_WR), GPIO_FN(TCLK1_B),
>    1454          GPIO_FN(EX_WAIT0), GPIO_FN(TCLK1_B),

Thanks, nice catch!

Looks like (a) someone accidentally jumped to the wrong row in the
datasheet when entering this, and (b) we need more runtime checks to
catch bugs like this.

Will fix...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
