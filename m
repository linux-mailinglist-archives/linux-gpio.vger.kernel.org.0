Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72EA258997
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 09:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgIAHvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Sep 2020 03:51:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:55335 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgIAHvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Sep 2020 03:51:15 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MTANt-1k14ow22hD-00UWsr; Tue, 01 Sep 2020 09:51:13 +0200
Received: by mail-qk1-f169.google.com with SMTP id w186so149613qkd.1;
        Tue, 01 Sep 2020 00:51:13 -0700 (PDT)
X-Gm-Message-State: AOAM533+DlebdLJcLt9tRUnz5LtCfFsKH00ZOI/H4ALuS+6ir34IzSsr
        FSjQlH25nKTZ3ibzUEIWjmVYzAzL3OJlnTJLtN4=
X-Google-Smtp-Source: ABdhPJxvMigd3aZcpcYcmxYsKNOay3F7nmzvJdUVHhpU00gYPHRbFWJizCtRrMfbUrwuD1KCLNzE272tD74H/N9Xw1Y=
X-Received: by 2002:a37:a04b:: with SMTP id j72mr653021qke.352.1598946672202;
 Tue, 01 Sep 2020 00:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200831081025.2721320-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CAK8P3a2xD-zp3ov=3vobSSAmyfvPCMe0mGgP3F7mZkk8WieUpw@mail.gmail.com> <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp>
In-Reply-To: <20200831224122.i5tau3atlty4ikeu@toshiba.co.jp>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 1 Sep 2020 09:50:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2O_-jiiRe41Dci3yAsN7s==u5b_fHGsXh6m6y-Ki7WAQ@mail.gmail.com>
Message-ID: <CAK8P3a2O_-jiiRe41Dci3yAsN7s==u5b_fHGsXh6m6y-Ki7WAQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add Toshiba Visconti ARM64 Platform support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wQ9CPiep6VAWNF72502KqBKxBLpZiDj/iYLuNRlz4WIUgFIVdZ+
 CBI/LPrk8tl94nnztETv4Dd8snurEymMzupJQM1hQ8Vz1CEegI3ThgKkR+cxxILw82AHI8n
 SMJyGwVLfvoUQnsAWZ7jpnmGlHqMCSfKqyzyB8dG+Sk1+igD5/NDv7AaBQPL2/4vsut3U2V
 BjJKAY65WzYEYN/xlNV8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:elgd04rZvM8=:LtKaC8Xeu6TBNljDzSHwzf
 vAMLk44PqkRClbdNRO9KRTE4lLmVJeC5qro0LQocdWSE9xYPLKQ1sdiCru0Tlhmr5C9/elH7i
 /lVK21yIHjWuL9r6uUcq7DvgRmDeabPJv+BVqIibZbvyZZ7WDuAumBFjwm3E6Uxtsv0OowczS
 a3YZuyoR9cJ6GoJvI8h8b6zr3Y+z9mXKnje80QM3441x8r4cjEeo2MnDmSHmMYCqnHN9W7uVM
 umZpBX6WT4VBBsvbX0mycp2wQGrtaTzwYnbfZNCI6M8B7IS3wBMlvZD6r5UjJ0cZue/+IRMBG
 axyPOemZsAlt9crJF8679PJntmpOOmXhJ5mVoQIu/GyKTM5Eq1VHNirnUzgrbLwSRdsACJNkN
 1ovHgaNR3nW9jT8ddKt6hsr+hAGALuKnYVz4byVXjkc75rEu+qqP3tVoleAldqzKDz3cYVzOE
 Jc8+0uKLBzPpbo3I+w52cRE1teUp5vEkd9NNRnnxM4aNJBuGDO1lAZw7wD6HnF5b3o51medmu
 USEZ5U8zlry5XRRlxBpskGHU0XGiuSd5QEWToatxgEr357Rp3K5zTa14C2u2lE2fDvHvngmiE
 YYRa5F8uiG4tFpm7/y4e3ocnu4+q/DIxCqWXzTyK4VnOmlIGw2dMsHUpR7oGL7wORMmeNnaG/
 zEK0Y2yE27zOSpYzVCIIb7gB+5vjivRZjowtsPNiSYIYnLOiT0T6qC40SrU09g42AJgc42+4X
 L+nVaOjwoQZ5Mg7zkZjLYzhafJ1k6lZ9bItN5d43YZKAkMIKzWocp7BwN8Y9QbL7yNy9fIrO7
 GCKoZTAsCq+EKTKBrq3YAI/rOV8WG1Y6rAnrvDd9IZEZYCjIhXI9eRCfJtVVgT11AaCjkIO/2
 TZx6OWjqbUffzhpzCs/DHHd2FJ0HBpqOdPxR9lSMz+VCoDB0NWEgCaZRznADp11GrJXRQNZSx
 aVYsfu9lyZpFbEqY6AL6+Wz16Vw6vorUKQXD12u4W9ZtJ8mKmlVa1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 1, 2020 at 12:41 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> On Mon, Aug 31, 2020 at 11:19:02AM +0200, Arnd Bergmann wrote:
> > On Mon, Aug 31, 2020 at 10:10 AM Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> > >
> > > Visconti is a series of Toshiba's SoCs targeting image processing
> > > applications[0]. These set of patches adds support for Visconti5 a Arm
> > > v8 based SoC.
> > >
> > > The series add minimal support for the Visconti5 SoC and the TMPV7708 RM
> > > main board. Peripherals such as UART, SPI, I2c and timer use Arm's
> > > IP and work with the existing kernel drivers in the tree. The series
> > > includes a pinctrl driver to select appropriate functions on the pins.
> >
> > The arch/arm64 series looks all reasonable to me, nice work!
> >
> > Once the review from the DT and pinctrl maintainers is completed
> > and you have received their Acked-by or Reviewed-by tags, please
> > send the series with those tags to soc@kernel.org for inclusion, keeping
> > everyone else on Cc.
> >
> > I'd leave it up to Linus Walleij whether he wants to merge the pinctrl driver
> > through his subsystem tree, or whether we should pick it up through
> > the soc tree, either way works for the initial merge. For any updates to
> > the pinctrl driver and additional subsystem support (clk, media, ...)
> > in later releases there is no need to Cc the SoC maintainers as those
> > should just get merged through the subsystem while we take care
> > of the DT files.
>
> Thank you for the explanation. I will do that.
> BTW, I searched the process for this but I couldn't find any detailed
> documentation. Could you tell me if you know?

We never documented this well, sorry about that.

Generally speaking, if you only have small updates (a few patches
at a time), feel free to send those patches to soc@kernel.org once
you consider them ready for inclusion.

On 32-bit architectures as well as the more widely used 64-bit
platforms with many .dts files, please send pull requests that group
the patches into logical topics. Once you are listed in the
MAINTAINERS file and you want to host a git tree on git.kernel.org
for that purpose, you can apply for a kernel.org account and
send pull request from there as well as have the tree integrated
into linux-next for earlier testing. On the more specialized platforms
without third-party machine support in the kernel, that is usually not
necessary.

In either case, patches and pull requests should be based on
an early -rc tag from mainline Linux (normally -rc1) and get sent
between -rc1 and roughly -rc5 for new features. Bug fixes can
be sent at any time regardless of the current -rc, with a balance
between sending them quickly and collecting multiple of them
into a pull request to reduce the number of merges. Please let
us know whether bug fixes should be applied only at the next
merge window, on current kernels, or backported to previous
releases, using the "Fixes:"  and "Cc: stable@vger.kernel.org"
tags as appropriate. The default is to backport bug fixes as far
back as they apply, unless there is a reason not to.

     Arnd
