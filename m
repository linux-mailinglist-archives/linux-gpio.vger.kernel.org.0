Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9801130E9F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 09:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgAFIZ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 03:25:29 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41081 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFIZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 03:25:29 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so70670798otc.8;
        Mon, 06 Jan 2020 00:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ER0D8uLY6YrhMkJyHQ/GT99IuQuzHZUvBL1W09DRdAg=;
        b=pf1Ty90FiqA2iI0LugY5VUDx/q/ck0agNdQw3oIttCBE9vomNyH5wDfrq9V8bbGxBt
         g3Z3lgdFCO/TER8hb3Ew4p6m+tVnWeJUrVLBzXTuMftn8nPGHYE+NbOCmjW8WpClVgai
         8BGwKQpzVM9jC5CwwU3EuU/zpndMYveZLh2rEfA6wVh02XBSqhNhVsiamyzWa9TMQueZ
         I9yjo59pZFuIceC+FBesLAkeX4CdpzhJOBzVEDHCfoDrCUEJXaGJ9/gX8KfjPPm5YRBi
         2+uEGjLzKcPuSJFEhr+1EnNcZ3Q+ZDeFNPkX+b/gNhOuUOAlow61eVxHNTEEETFej1AJ
         QLvA==
X-Gm-Message-State: APjAAAVUWfz+sbbMXGc9qGfo/DN+vLWufpHoa9hipmOSCE9d8do/En6u
        3BvNmxMNBcCQ+RW5+M+s1qhzDeTt90XwU/4Ydag=
X-Google-Smtp-Source: APXvYqxqroOzVgFccWaYEJ6YI4j2kXb3vJtV7OZxBLL9aX3s9gQlKW0z4k7217yD3+wKRX9wHnDrqebUDBOnX6E3wHw=
X-Received: by 2002:a05:6830:68a:: with SMTP id q10mr12495545otr.145.1578299127870;
 Mon, 06 Jan 2020 00:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20191217184242.827-1-geert+renesas@glider.be> <TYAPR01MB4544936355182F4091F89EECD8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdVnoGpBvU5hH1dBHo6QXFS5voy6SmEDZKyu1JWqLfwhGQ@mail.gmail.com> <TYAPR01MB4544C1FDB2791246DBDF46F7D83C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544C1FDB2791246DBDF46F7D83C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jan 2020 09:25:16 +0100
Message-ID: <CAMuHMdV1YfoGx2bLCC0R6SkUcJRFohk-nb0Z1hPJMMtPH1YnYg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@de.adit-jv.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

Happy New Year,

On Mon, Jan 6, 2020 at 9:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, December 26, 2019 11:34 PM
> <snip>
> > > > Suggestions for simplifying sh_pfc_quirk_match(), or for alternative
> > > > solutions are welcome!
> > >
> > > I wondered if using weak attribute on both info variables could
> > > simplify sh_pfc_quirk_match(), but such a code [1] doesn't seem better
> > > than using #ifdef. Also, using weak attributes waste data size
> > > if R8A77950=n and R8A77951=y for instance.
> >
> > Thanks for the great suggestion!
> >
> > The trick is to add __weak to the existing extern declarations in sh_pfc.h,
> > instead of adding weak empty structs.
> > When the structs don't exist, their addresses just become zero.
>
> I'm happy my suggestion is useful!
> # I didn't know the trick though :)
>
> > So I came up with the following (whitespace-damaged) patch, which I intend
> > to fold into the original, if no one objects.
>
> The v2 patch [1] is better than v1!

I'm happy you like it.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
