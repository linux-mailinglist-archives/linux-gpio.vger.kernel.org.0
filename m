Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7B11323E4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgAGKjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:39:20 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:48555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgAGKjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:39:20 -0500
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M7auJ-1ilinL2iAH-0086lr; Tue, 07 Jan 2020 11:39:18 +0100
Received: by mail-qt1-f174.google.com with SMTP id t3so44896249qtr.11;
        Tue, 07 Jan 2020 02:39:18 -0800 (PST)
X-Gm-Message-State: APjAAAUgF18u2te5AjGTo76XIfn80wBmeWCyq2Va5FrPO/oI9BVz7TfP
        lL+CX0Ya5rMr6A9LpmIhrsHNy9mfw/DFKP0+jrA=
X-Google-Smtp-Source: APXvYqyZhmN1eLl6pt96KksAU6g7g17LqbBD1ix7k6Tl4UknhAbwyEGN+KnksbzRm55kVluXwuoazvSU6xkSWIKNn+U=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr77340587qtr.142.1578393557482;
 Tue, 07 Jan 2020 02:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de> <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
In-Reply-To: <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 11:39:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
Message-ID: <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, patches@opensource.cirrus.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ajcqhieEFeekJVb9iVY2aZbxaecN6UG7UfxqZoCtiHAaY63swd1
 T2AfV2REiE/Nk4yk4mDUPbxfCpKwuuuEJoiXmf3NSX1KSq2wqAmT5QwQSsjnn/Y/0BrusbN
 7WwSaM76i2a3/xaRC2RpNRrMeiRvsCW0D/U72FTZoZ8sJWn1S9HNckEkhbhlO2Ghm/UOktY
 ruwXdYU4Phr/kUg11dY3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W28qWyYB02w=:8wtfUerc4mBjEzIo98OY2E
 JqQxhchied/b/BRcbuFLRwxnnMVg3hreMGUIozaedeVr4saXl0nayRZS5j5UXR+JKWglqZdbf
 4HQxFEoHgCsVD6yZDQEZHgldp5wQRGN2JhGog1harLwhuQQZu8qVoQfH6xYZ1779rycR9jowE
 2hXyfs/DCZ/uzoP7Ew4BGEDjYl77WMETjKruYSJqmEnxph5+CrH/EyGMaJWjDtmS7UcrxGctM
 q4K1ZQtzUyTLvYN/oYe9t+ICw4ZrG9JIgGEsbUukRcsWYkicTcPqQ5tQZ+dzuxAEQqhuQjJWr
 1jpCW7zOaBjhJdwNxjzGcMWcbyiSmCRhSoOAZvIHh54Mj6kKG8VkL1zH7NfxCI8AtMeb1klIW
 FunNXn1B8HImhbIqnTO5vSwJAk4f+gwDxNzd8d231owYMzuOnLPYqMW+D4ytatA1TyObtvhBH
 OsSZqRdfG6BitcYyHGyHfi7SFtumaguJheRF0q096ISnyMScxSDpJ+lX0DgfFBVEk8cTBiR5o
 UfnTYggYMTXfSc1L80Ut+WemFasyCr7yWDdwyJD5s1VHuk6GSOTky/STwg/FmSrha+qGznDva
 rsdFtyUMIjzKlFbnHIBAuyIV8YJSQ2mpgQPlUl0Sr9gEMrPrrzEm7Vtq5rsVe9nlYVsJuwlbV
 LJzjs+KGSx+CD5PNc2b4/h+NPjmxipe8/YKyxsenItR8fzWUrK47SkFE0Tqt2xV3wGolcCmqy
 JWeR8BPYN6b8iipvxNx+8fRLUHT8fb46B//6DaIKaL3PeZDz29OCEYNXLUsTDqM/D2Ulj+q40
 +TviVnBdWIe1Da7+2bdYtPtugTv2iiO4uynqFLsUbqKs/pkJAVIjMxYJvzsObQuC6yrR7mMy6
 uF9ErKw4ItP1FIgE8Szw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> > subsystem, or if there are still good reasons for leaving it disabled
> > on any machine that uses CONFIG_PINCTRL.
>
> Hm that is a tricky question, they almost always come in pair but are
> technically speaking separate subsystems.

I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
are there any examples of the reverse?

       Arnd
