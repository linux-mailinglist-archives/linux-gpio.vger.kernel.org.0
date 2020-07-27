Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D5322EAD5
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 13:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgG0LHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 07:07:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:45915 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgG0LHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 07:07:34 -0400
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N5VLY-1ksLsH2eE6-0170OO; Mon, 27 Jul 2020 13:07:31 +0200
Received: by mail-qv1-f42.google.com with SMTP id s15so2778448qvv.7;
        Mon, 27 Jul 2020 04:07:31 -0700 (PDT)
X-Gm-Message-State: AOAM533HndIsn7C3eJfJtiaRP6SJnOrlJpjKhwuyUJbBR8t7Ul8IEshi
        WTie9KP6tuSWckZzxlidtav9DErxuzLgBbq74+Y=
X-Google-Smtp-Source: ABdhPJzxOngJK6stFBNtdHenz0ykV74orh0S+FvohVN1V01bLg69miZWGOg43PNVNxMAXwrpCMzVbqT41VdOkXRTOnM=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr20821335qvb.210.1595848050219;
 Mon, 27 Jul 2020 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200727084211.6632-1-lars.povlsen@microchip.com>
 <20200727095009.GK4073@piout.net> <87v9i9fdy7.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87v9i9fdy7.fsf@soft-dev15.microsemi.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 13:07:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CMqqFWM+QXC0wXxrfKBN0U5cyx_naBx+hS3V3SG2KOQ@mail.gmail.com>
Message-ID: <CAK8P3a0CMqqFWM+QXC0wXxrfKBN0U5cyx_naBx+hS3V3SG2KOQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Adding support for Microchip Sparx5 SoC
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VQrKRxNjIjvZRIEeCkAz30oJy/i+x4XOwSIIe22zj3vGPVX3xwW
 B8VT/nfb1I30p30rKj0Uuy9yjvkMzVHBSgnUOQ8npY2A/JwnN1j3vnSOhJadJa8D1e4ebjg
 I5kbFM46k8uMAK3FbSb8Jv819zX3TKO1LSnoASLFe4nDLMzVfbJdHE/4mYjvR6obfUWNR7X
 aSsD2jCdSZREqoHIzpZkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zn333mraLCU=:K6u21uNyZfQWEhNs0LPmaG
 0QCJBEOZ3RHArxr3HqpP347CBeQvh3hlTODTwJxmnRvFvGZ8ZC3nA2LalvBrtIG2zFi8KzpaN
 SZmj4R24ZiRSpzYnPD8kUTwSOd1k4MXTT3FMsVt77CCxkf6iHzGBV22Z2EWxJVi2erzNFDfNO
 0eiJIJ0yo3dmThIQ0abPzum8M+hdaRITncovfY8fjijsYbx1FDCYKQLSbwyW51S3zK7loORi5
 8YHUMa/7GsGpoWBz3kZuzBr/+hXtNhWVZwJ+EF/SOn/u3wsx9nG9inHenmkYryeC5I8+2efaX
 L3C4ReXq3CI522YkCfzs3BTqUJDdydCcIKWUNQM/HzEusSDq+31rpDIF6KHfw1vCB+VYUB9HM
 9iL9MWFBF2j5DFT78ON2EvgsUdNhr4NOMZsTXbTj1vENSSHGmj4Vu/eajf4xsgx8f1nEgoG5L
 Ymc3I2fd3BLbSvwyoqMbxJrJSyjBaimXZzZ2G7r44JdxJFY96bIz2qhGWdZ0aWDKbQhs/ScQz
 yFq6jVAA0a3KyZAJwCPBHbQAgds95ppbuzCtG1ro8g07kYeqnhZWYjJrwcsYfWiaiwEMZLCap
 ff8gz2HZvFv1I39IqObBJKTUNGMFfvCUEcK44Vf0MnNAU1+hzHWGqklYTkARxbmGZlbjsCb0P
 w01HN5rJK1vMXhwEIlEr68wo90nTUSDYpRfn7sJL3UfRv9MeafJ4iU9p3zRle7tQyopNx3NAO
 fTxMCBNz5Brwp1GOpvZIqSKTroFsw5AE7uAjLbNzAyS++7/KOE3aOY6qDoFiyqB9Kr4okwC/U
 uJggSSGGIp1oBJ2CyHQdrk6AIntMvQX/V9yrvNh4398Rs0/TWswyhblAjJEkPulvDEyS0tYlm
 8cZ5PKBg0dTaHVi4HwJ72TmgnuZJIATMfSDgujwO9QGCOgSaVSsSS/t7frgautm6I+wBraBmm
 uzHiAaQiyByeq6hm1akvyrg2RktphnyECXJgpW3RtidbAg5PMCVc/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 12:30 PM Lars Povlsen
<lars.povlsen@microchip.com> wrote:
> Alexandre Belloni writes:
> > As Arnd stated, he already applied the patches so you have to send an
> > incremental patch to fix the clock driver.
> >
>
> I actually wrote Arnd about this specifically, and he replied that a
> patch against either next or mainline was fine - so that's why I
> refreshed the lot (Including Reviewed-by: headers).

I think I misunderstood your question. To clarify: Alexandre is right,
you should not resend patches that have already been merged but
instead send the incremental patches if you need further changes.

I thought your question was about the case where your patch
series has conflicts against another unrelated set of changes
that may have been merged already.

> But I will send an incremental patch just in case, no problem.

Thanks,

      Arnd
