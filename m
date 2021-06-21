Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5143E3AF51F
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 20:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhFUSeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 14:34:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45633 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhFUSeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 14:34:11 -0400
Received: from [192.168.1.155] ([95.118.106.223]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mum6l-1l5DWs4Ayp-00rlVR; Mon, 21 Jun 2021 20:31:46 +0200
Subject: Re: [PATCH v5 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi>
 <20210621172053.107045-3-maukka@ext.kapsi.fi>
 <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <8d28463e-7a67-229a-6934-e3a59a8ab330@metux.net>
Date:   Mon, 21 Jun 2021 20:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hhh5/Dq8916GL3BChU1V2Gm++0xp8Eo4qOFj6Wdbl/qy6ca3y5L
 qQLzqRtOLSMTzrNJFUd5sWHeCzRqLmrXnmfr4s+BvMNjtJcLZ3gDzxxqTBfrMWbL2yOvlrq
 dJ8hRCzdxOUeF7+ln3MfdUnETyWz7i7y/rY/mu/px6oYA9sWEV51xu6432pbSKgrG3yGazQ
 npjycJdxAcAgpHTS/0t9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7nCPMQ8NwI0=:yMIWa4LDmTY1Bd4Hbnefai
 rdfJ/Hi7aRSVziZZ6lbqaoi3/JD+YwPFT58QctvFDZa66TnISBoHUcnkD3Fvy0shwKQ+AlmMG
 XYvIZXQ10qZAz9+M01hEaClcTJWcIaOI35/ftJhJKI0dpHjMospVK78uLtkbgq/n/hDSGZlje
 tlAVVbgjMimwDEYcePXVwHU1rlu1GstaAnDOb8D332Dzf18fmw6+ODejPMw7Gn69Pt9mWsXE+
 u7SiSHCKg1qcqOlPpHr+urkONSrFk1HPxCEafXJTJETSq8PHI/YIIATpl8i/kqa0scJZT6ljm
 PhrJ+IDSFYwLciIP2TWLyv5xmV+GmuTNgxIPfk+m5pkAwopgHByKptxrY/7kF6Q4vzOjarQSW
 BYOR/Reo878icO9+ebRrf+maGbPo7+3MyQ5zZkaCSU7g+28+92zNP8FMSu05V2rQXoKs+cRHZ
 Ab41eZ0ddGhCXJ4b8Ea9IWNCUARfDGH2d1Wcc0YEe9nBHxmNdwBbpPRzkAKELRP6LyxDr0p5f
 1AUSOQw5EjbIWiBDHrv2Jo=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21.06.21 19:43, Andy Shevchenko wrote:

> Since in parallel there is a discussion about the virtio-gpio
> interface, how will this work with it?

Haven't really understood what this is actually doing. A multiplexer
where only external line is connected to some actual gpio at a time ?
Or does it merge multiple inputs into one (eg. logical OR) ?

Is that about real hardware mux chips or just a software only ?

What is the actual use case ?

For now, I don't see any relation to virtio-gpio. Correct me if I'm
wrong.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
