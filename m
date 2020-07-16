Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB6F221E4B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 10:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgGPI1y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 04:27:54 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34446 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgGPI1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 04:27:53 -0400
Received: by mail-oi1-f195.google.com with SMTP id e4so4481421oib.1;
        Thu, 16 Jul 2020 01:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bw5+hFRH2zrjxX766KqQ5x8VG7OfU7f1ZtUxTkUpoJw=;
        b=R5pYqgElSt0LWrHTsOX0EMuMjIJZLSBDQIhSjaPimPHHC6D6JFfxzfB6vJuLW1VU0L
         05ZFhkQv/uvC9JzVu/9e6r4BKlyJiUkYbTC/o93anRmY4RDFH5oJXzdf8NrUGARsxJJ/
         TSKhTeLSDULpUJwkPq03sHRITtJgUvtKVu7XzUiox/Lu/ifS4u472Tq/I0etun4Erydc
         Q7zsRlNkFyYXElcL2ZLlaMFGpj3POT3wdWd66+bCCfasnaEJx/RQRC8+A+L1Gs3WT5Fq
         hrRlKljjuk8xjfz2og02tgefLKCjro7pkG2oVAdVkJaZr/tTN6qOQKjfkbdX3eKKaq5g
         dgMg==
X-Gm-Message-State: AOAM533S1xoMzRulEJ5ysg7MMAAA6hy+ls/L13jfDoMUypqejVjf8o7Y
        YKgYAgoLJ54lBF8oSCoyMqo97eB3g/3jbOKFkw8=
X-Google-Smtp-Source: ABdhPJzmVMMoJDo1pTauAT6GN+3GQe6F/6FbTlBjJH9IwS6iqkhk9C3/n9B6BXkuhyJVbqprY9aAXpVrsmnj+1oZo4I=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr2905337oib.148.1594888072391;
 Thu, 16 Jul 2020 01:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200626143638.16512-1-geert+renesas@glider.be> <20200715201037.GA740389@bogus>
In-Reply-To: <20200715201037.GA740389@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 10:27:41 +0200
Message-ID: <CAMuHMdWk6Ma8d3zWui0xAczfJ6jixh46byF5kj3f_JnQFnpP5Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 10:10 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, 26 Jun 2020 16:36:38 +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas RZ/A2 combined Pin and GPIO controller Device Tree
> > binding documentation to json-schema.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../bindings/pinctrl/renesas,rza2-pinctrl.txt |  87 ---------------
> >  .../pinctrl/renesas,rza2-pinctrl.yaml         | 100 ++++++++++++++++++
> >  2 files changed, 100 insertions(+), 87 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, queueing in sh-pfc-for-v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
