Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2220532D66C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhCDPUU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhCDPUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:20:19 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40465C061574;
        Thu,  4 Mar 2021 07:19:39 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id q204so18105558pfq.10;
        Thu, 04 Mar 2021 07:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K6ks9PYI9xqw17y1VnrD3Lh0rpwIlhxRiJrkiavk3io=;
        b=NLqzvYYUrzawjMn5Vc3yQoL7NDsyfvkVG2/hdYC+z2UR9fOUItDO5ccUguTm5TOjEo
         1kA+PPGu+5c/Y2a/EuEYDzyd12dUBX0c7iI9YznbyE2GQmFWDOBpf3IAzg9ExkUOs8YY
         7iP4JnW51MyXalCs+2ywv+nXujmZ3+OyWL+U+UBXjw4Kvn/n74+/2NJblDXyNLRPtcz9
         2y8NZ4SBetl79H9ywIyC3UAjvB3Bpfwmoc3caYlIAE1DK3ZnRfDX8NeZSq8peVL22CaT
         HVo6KeiqQoJEecYeeow/wvnDLAOcNLosc8d+R6Gsa0+5R7f1Bd8u7Gk0RPmgVXsnEmmL
         +70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K6ks9PYI9xqw17y1VnrD3Lh0rpwIlhxRiJrkiavk3io=;
        b=dW2qjQb8sa3deokDR8HC1s2wnkDeQCJXC2EynMA2tTNrh/EqGOJ9YgCwXmRH6Gby58
         r5MY4DDovAv+t1CIQRZl+PuxBOmItjXLJyCFaUfRms7JLT8ZonfM1PpklhYKVH2ZRovN
         YoBqkelNmSYbtebaO6QCeN1eQ40EgoI3gPuTtPP07jPvw8VHlKYPNJgh7WmMac4p2FHv
         heXtlTasVA70A8ZWFJH+6kBfNRwuhlDQlFGhGRDl7Bvoxpm2Z8if5/a9p2CaRyYv1wUQ
         k+wVvF4uj6fuT0/Ox2rLD4icsYZwQNtgcRpr+XCI+llbmiHlrVnD+kdIs72NTGnmNt1T
         ysHg==
X-Gm-Message-State: AOAM531haeRZFvkBOnc3pHOaMQkDWH5kEUyllw9IwR2vAEEiY/R/HFqt
        ceo+4MPf8iAboW5Vckt1y8mUqzul1quRsOWLaHI=
X-Google-Smtp-Source: ABdhPJx9rHrzH9c1WswtKF8auBnvg9rXoD3A8Ai3atUtkXxbamiwweGnfVZq22pkmC0k3BLvIs9R/4oB/wcHhvGzaS8=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr4147564pgf.4.1614871178698;
 Thu, 04 Mar 2021 07:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-4-noltari@gmail.com>
 <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com>
 <667E0AEF-B453-4CC7-9514-5E72BEF4B0E3@gmail.com> <CAHp75VdzgSyz24xtDiniM40-tjRjKipzdtFvd=Fq=-Xbvr-amw@mail.gmail.com>
 <3E07960B-BB4B-4647-A1FD-E291F9FD6D74@gmail.com>
In-Reply-To: <3E07960B-BB4B-4647-A1FD-E291F9FD6D74@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:19:22 +0200
Message-ID: <CAHp75VfPihSaZ+L6yOzb5ZGYmXfT3NLgu3HQuwiW8bsUjjoLdw@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 2:28 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 13:09, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 1:17 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 11:43, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>> <noltari@gmail.com> wrote:
> >>>>
> >>>> Add a helper for registering BCM63XX pin controllers.
> >>>>
> >>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>
> >>> This SoB is in a strange place.
> >>
> >> Why?
> >> Can=E2=80=99t we both sign the patches?
> >
> > You can, but you have to follow the rules (see chapters 11-13 in the [1=
]).
> >
> >>> The order is wrong taking into account the From header (committer). S=
o,
> >>> it's not clear who is the author, who is a co-developer, and who is
> >>> the committer (one person may utilize few roles).
> >>> Check for the rest of the series as well (basically this is the rule
> >>> of thumb to recheck entire code for the comment you have got at any
> >>> single place of it).
> >>
> >> Jonas was the original author of this patches (sent back in 2016) and =
I=E2=80=99m just continuing his work and trying to get those patches upstre=
amed.
> >> I don=E2=80=99t know how to do it correctly, so a little hint would be=
 appreciated.
> >
> > There are two ways (depends on the amount of work you have done):
> > - leave him as an original author (so Author field will have his name,
> > not yours) and apply yours with Co-developed-by tag and SoB since you
> > are co-developed and committed
> > - other way around
>
> So I will move his SoB to the top, add a Co-developed-by referencing him =
before that and then leave my SoB as the last one.

Yes, if it is what you, guys, agreed on and want to have.
Something like this.

Co-developed-by: Jonas
SoB: Jonas
SoB: you (and From in the email should be yours as one who submitted the ch=
ange)

> @Jonas are you OK with that?

> > [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.=
html#sign-your-work-the-developer-s-certificate-of-origin


--=20
With Best Regards,
Andy Shevchenko
