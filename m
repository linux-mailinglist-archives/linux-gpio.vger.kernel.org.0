Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7A9127EBF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 15:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLTOum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 09:50:42 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39904 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfLTOul (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 09:50:41 -0500
Received: by mail-ot1-f67.google.com with SMTP id 77so12140004oty.6;
        Fri, 20 Dec 2019 06:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WX10vICYYRvoUi29Bg7nghuIV/IRkRBUGYTlCz77POw=;
        b=h4Ep7ozmlsGYPifmQqIf+l8tigH7HyfxNTuZ04Fh62rXqhc068z6XVwwhbsBTIfzlE
         62fioCFzBMQDNmiGtD1Dw+WtlKyT1NckaOigqaKfc+TN4CvmevsGMlVLbtUyJkn3+S9h
         CFdnRyXLLlVBtcjwdYJEe9cowdoNbNb/Xb4NRXkDkv/SFNV5M3IC6AmU7+mkN+2dar+Y
         Gkh4witmgzLmEGEPQtemAcFveN81oMiY3oJCmNClUYq+GiVtwpXZnxZo9sIEDaaEmDaW
         nz8lRdZAHQUEW6nmz/RYS8Ltpnx80SfX1h32dpAWzGIIiUmV2wlNSDtfCVnusHF+ECPt
         CaYA==
X-Gm-Message-State: APjAAAWiCVrJ0qFfy4tJf8pVfHPqUYxSj5xjoTNeT8SOLewNr14cM0nW
        q+AcsSCXkiGdvqM4h7U9DFKncG4Kk34JQWCA7Ds=
X-Google-Smtp-Source: APXvYqyJfWHsIwMzr4B7jUQ/MHRfy0TUIc7UQtDOKVGgjT24Ynml5q9N/yvlferG3HqtPALA9efqtkiEANEIbG1R9ac=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr15711603otm.297.1576853441079;
 Fri, 20 Dec 2019 06:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20191212135301.17915-1-chris.brandt@renesas.com> <CACRpkdYOXvWpAs1LkgeQFxZiU=HvnaUod=px+42qpJBrcKGCfw@mail.gmail.com>
In-Reply-To: <CACRpkdYOXvWpAs1LkgeQFxZiU=HvnaUod=px+42qpJBrcKGCfw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 15:50:29 +0100
Message-ID: <CAMuHMdUTyhKSt6qEhnkgKZpn5KizUDLe8zztY5cy0ZSxCSj+Mw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: rza1: reduce printed messages
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Dec 16, 2019 at 10:41 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Dec 12, 2019 at 2:53 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Since this message is printed for each port, it creates a lot of output
> > during boot and would serve better only during debugging.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Acked-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I think Geert usually pick these up as well, else tell me if I should
> just apply it.

Indeed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queueing in sh-pfc-for-v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
