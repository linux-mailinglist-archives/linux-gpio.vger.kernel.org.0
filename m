Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DCB359757
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhDIIOJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:14:09 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhDIIOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 04:14:08 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Md6AP-1m4wN83xZr-00aHea; Fri, 09 Apr 2021 10:13:54 +0200
Received: by mail-oi1-f181.google.com with SMTP id a8so4968109oic.11;
        Fri, 09 Apr 2021 01:13:53 -0700 (PDT)
X-Gm-Message-State: AOAM532Sdy+ZNBgdv6wrkbDzI2fZ15v/hCuQwkAN3jHkPWsy8ll0lISq
        lTjBAciO6uy0n93ESmRa2Qh1ykjpqfUQrGDoZo0=
X-Google-Smtp-Source: ABdhPJzFdzRK0Fr9sttYZU00DkmHPob2Ue763VfCmKuqxE8AuUxCM9nJfgP3QwCQkKhUcqhD2rg86m1268AEXjhhEyo=
X-Received: by 2002:aca:5945:: with SMTP id n66mr8949399oib.11.1617956032510;
 Fri, 09 Apr 2021 01:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210319061952.145040-1-andrew@aj.id.au> <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net> <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
 <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
In-Reply-To: <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Apr 2021 10:13:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ch82=QccNZboa-e1tVaotyJfGFTfqDuQCO0xPVitXgA@mail.gmail.com>
Message-ID: <CAK8P3a2ch82=QccNZboa-e1tVaotyJfGFTfqDuQCO0xPVitXgA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:obuQBkum3EouSx9gNWnc6EUZJhkkzkYTe8fASl4y2ztTxESDC8h
 RDjTogYZcoHKrQqo36EGcSeTcMBRopdtlVaFyluu6ZpVW7x1MOj5XeHw2YL7xCOnZZS+D+a
 nTFbVa4aIG/eBZRAFlAR9bXBcEKyo6i9pSkRRyD7DJN1+RluCza7xnxouY6hO+TNLau1vpX
 C2pIu7LmK3rFgsJX4u0ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LcPuQrOkFEI=:EqPZz1a+cgsfMSxbv6lCji
 YTTWcwkPGWTUJWAJEwgY0JoNcChVDmWNtJkodIRrt1KMfRThIyRh5AwEsrzviwd3fd3evU4/+
 23QoHHQDhAR6ikY33dPeBGLloeWXTiaCOYvDKqPhig1QNJ4VcGGm/peDi35KLIDjaJYfQktu3
 pY6YjLB7n9eaj6f5OqDTm3NCEx1wF2QbIyPXh8Kxilj5lDmOARij6f+dHY3TlRd9gtfAa0GDS
 Ug3z6on/X+V1cpkQkVoaGSuh+GVKGetHQZc1Z6a++SZiORbRiKeaxAZkdFaWbQNDIEFm/FIDp
 YhUUaMUQjljGuKeY/B6Cfm96dittrc/nD7gQjL2p7jRA47B4gX203wHqip1lJj2m8uEFH1YzG
 kXpm5bRYvQCnWMNEqxBf/9wtfxzuxgkoVC0IP/5fAuas4/b49Kg5T17vHb1rPYHmgWA68pJqa
 bwpAjUrDNF5scEEr+WPSQp/yQSd2HnMYoiEkp12L/WS8JBnoahJ12Fz4n4DbU0jyIR6tMWczq
 ql0TtEgTuOVT9ISzW2ABexoRei2dKTWljhIp9YspLewuZjNGFrqC1YGYZ1PXHSUcXcQO8JPi5
 /SvgvgnhfT91IbFRwOYYz2cwbM62fGSSS0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 9, 2021 at 6:09 AM Joel Stanley <joel@jms.id.au> wrote:
> On Thu, 8 Apr 2021 at 23:47, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> > > On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:
> > > There were some minor concerns that were unanswered, and there really
> > > was no review by others for many of the patches.
> >
> > Right; I was planning to clean up the minor concerns once I'd received
> > some more feedback. I could have done a better job of communicating
> > that :)
>
> I'll merge the first five through the aspeed tree this coming merge
> window. We have acks from the relevant maintainers.
>
> Arnd: would you prefer that this come as it's own pull request, or as
> part of the device tree branch?

When you are unsure, it's almost never wrong to go for a separate
branch, which gives you a chance to have a concise description
of the contents in the tag. This would be particularly helpful if there
are incompatible changes to the DT binding that require a justification.

If you are only adding a few DT nodes to existing files, then merging
these through the regular branch is probably easier.

       Arnd
