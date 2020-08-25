Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3609F2512C8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 09:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgHYHMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 03:12:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38426 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbgHYHMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 03:12:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id i11so2568288otr.5;
        Tue, 25 Aug 2020 00:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6xLMSskjc/0tfKUR5gcLUrxGo2b6wdLqpwl4vtNWoY4=;
        b=NNgmXlgNVV4s5sEzgZTLfMkDCpnY6eFm/vKykel4aCLKwMT5RKwanGqfdzOPxwh9Cs
         pk4qFZoGLKjhk3elDBWZ4i/bagMRm1PJQ5ZZLjj7sJG1Hp3WTFTeFrFKCYY+1msLIRV8
         Xkq/qapVyjpR1RJFeEiv9BWXlmCQFys/zaHW5zq0HJ3ZBdW4+alLXfyZZRCLuRGTbqTP
         o06PqbUUDoUjBOcVk4xjTL6iLk56LVd8CM0ES7ci/rorh6doHDy554d5AFeEG16kOsgt
         cnw4O7nnVwGI6fdggzZ+IBWIQN2e52tzzVLNfq5qGSpdGkTMpRbQsjIv5ixhAi5zyOCF
         zeFw==
X-Gm-Message-State: AOAM532wRhRIWeXMdU7q2Ak5+FYAYP07uiVpoWwu71YySYMrs9zg2mLb
        hx58c7ZCWmmjCC/vb/KHK6n2wfsDTckhFMsFGIwCL+us
X-Google-Smtp-Source: ABdhPJyr6yeB7gVQM4gDWCrn0iIo3b3uuVybNM80+sq8ZmQ8Hx6s+1h+KOBAJrFbHQUuAF/hLFogUyd3vL6ZDviez0A=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr6150245otn.250.1598339544379;
 Tue, 25 Aug 2020 00:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200821112059.5133-1-geert+renesas@glider.be> <TY2PR01MB2924258A9762FD083630B628DF560@TY2PR01MB2924.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB2924258A9762FD083630B628DF560@TY2PR01MB2924.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Aug 2020 09:12:12 +0200
Message-ID: <CAMuHMdU2+=aesP5v3iAWp8+-LZ8dpMi+EOm7n5x74q7j8kFNPg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Gareth,

On Mon, Aug 24, 2020 at 5:10 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> On Fri, Aug 21, 2020 at 12:12 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Convert the Renesas RZ/N1 Pin controller Device Tree binding
> > documentation to json-schema.
> >
> > Use "pinctrl" generic node name.
> > Drop generic and consumer examples, as they do not belong here.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This is a clean and suitable conversion to me.
> For completion I ran this against my dts files for the rzn1 for testing
> purposes on next-20200824 without issues.
>
> Reviewed-by: Gareth Williams <gareth.williams.jx@renesas.com>
> Tested-by: Gareth Williams <gareth.williams.jx@renesas.com>

Thank you!

BTW, do you plan to upstream any of those DTS files? Currently, no
upstream DTS file for RZ/N1 contains pinctrl properties.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
