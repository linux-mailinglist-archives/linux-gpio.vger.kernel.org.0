Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43B19DF603
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 21:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfJUT3u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 21 Oct 2019 15:29:50 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57153 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfJUT3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 15:29:49 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MwwqB-1i7Bp90UQN-00yTKm; Mon, 21 Oct 2019 21:29:48 +0200
Received: by mail-qt1-f182.google.com with SMTP id o25so9463601qtr.5;
        Mon, 21 Oct 2019 12:29:47 -0700 (PDT)
X-Gm-Message-State: APjAAAXxG3PwcfRI3eLtJ+5+/ni+CU0R/KBbA+CH2mR93Dr70yh2q6o5
        HYoj9rKV7RJBlESQY+vIkFofRwVypTXpEG/YFac=
X-Google-Smtp-Source: APXvYqxjZ7hRce7aTLzsiguJU9kzIisgOu1fuNnnsvsKuS64oRa2BWzO+E2SzpQf094lq5mjR4yUh0g+513/L1lQ7gY=
X-Received: by 2002:aed:3c67:: with SMTP id u36mr25957878qte.142.1571686186839;
 Mon, 21 Oct 2019 12:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com> <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
In-Reply-To: <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 21 Oct 2019 21:29:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
Message-ID: <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:z1euxHiRdhARy27mW0ZCeOjUtQqaADtxQBbiIbswc1h5rWIJCDb
 AzGbjoaXc6kfdylbqmWJskmXCTA2mSziVKpvRaQP/eU1cpiCDgoEq8gWyNr6zhtxWu3hv+k
 KU17nThTf03b+7RUdI06k6KeOYLdPYDqil/+68rFfWVqGKoQZON9DBmXvuKiTVwxrK/MSpG
 2BjyEzKtGh877wG2d4Kjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cAUK04/pw78=:+ery2poVEwEVB0Bq1qvzIA
 hZVv6D6mFYFB8n3iQ30yxdLLoKi6rvXZme6AKDUuJUUbiJr+tdPofys3PtZOGEqYKHscHJXPo
 Aym2hvYJZ7U2Rb1YSfS18x70IpD0LbESYXZ9sidwD0chwzsjrYuuSfTsBlNIAgPu64bJ/OoE7
 w6caZsP6xmSa7DrbfqjbE+Q8xpnkZ+Pqc91i0L7eiqny4OZTBj7hJkevcaRhRY7716swyimnG
 S1DHudU9D06GIFFRex4q2jAc3HKShN1BszDv7ZjFAdSHZc8LZJ4NvizAthgvGuUBMN1QgpFa6
 mGJGFX8OPjZ3K9IhD/yaEWWx0mC3DsM0Y5W1loZAOAXlyEjEHYnBum3KlYqApzPOVt18o4X36
 /WkZ/eil0gCpIFrC0bUIDj9Xo0OhB2ARMws5lYenzYASoI9Wd+S4JMb6TaB98OrS1kpoGSj96
 YzpF944VJ+EWQr4dRWEDmvOYC1+Q8nPZRbZnbj+MAMst1YeEFs6YklcFkSqs/zpwvEnCoePfs
 t9hlZnPu6DAaSLTPOVHRl3PRd1FiWep+eFYT4qAVpOKXzkXhEnJrDgUbiw34u8xTTiSuMuA0x
 XNrDzzQDtSrlySGHf0G5uIlzQeV3T1yyt5aIAIjMbI2GwcvhJbV+QY++zlIsO22UqYM6TKsvV
 RY+GhDUUkZ537HsGM+zA3spyBPco4awW4ytdMNgvEXzLJ4F5kpjDvTNnzT97LnVExanjM9lfz
 rVD77eSnN6XbwRObYdjudVW5kcA4t+BfBAMDClOi6y89NdpWE+yW127jqNxZ1ZvSCeWjPe8C+
 rmk+2s3+Z+eXbvDuJ+yYsT6MXB30lGeWMym32qJAp/n/3isZBvnO/zWXvjCWOlUIX4xL+PnIB
 WDjnnGtFphIMKe8B31jQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 6:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> pon., 21 paź 2019 o 17:53 Arnd Bergmann <arnd@arndb.de> napisał(a):
> > On Mon, Oct 21, 2019 at 5:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > gentle ping for this. I noticed that some maintainers are complaining
> > > about being spammed with patches converting old drivers to using
> > > devm_platform_ioremap_resource() and there's even a patch removing the
> > > relevant coccinelle script on the list, but I think for new drivers
> > > these are still useful. Do you want to pick them up for v5.5 (or at
> > > all)?
> >
> > I think this series is useful and we should merge it. Are there any
> > remaining dependencies or conflicts with Christoph Hellwig's recent
> > __ioremap rework? If there are, I would prioritize his work and maybe
> > delay this one by another merge window, otherwise please add
> > my Reviewed-by to all patches and resend them for Greg to pick
> > up (provided he has no objections).
>
> Is Christoph's work in next? The series doesn't apply cleanly on next,
> I needed to fix a couple conflicts. What branch should I rebase it on
> before resending?

Not sure, maybe Christoph can comment.

Your patches would best go through the char-misc tree and be based
on top of that, for Christoph's I think the idea is to have some go
through the architecture maintainer trees, and have whatever is
left go through my asm-generic tree.

      Arnd
