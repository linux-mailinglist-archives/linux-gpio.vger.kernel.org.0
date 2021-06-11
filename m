Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB103A3DFB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 10:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhFKIbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 04:31:43 -0400
Received: from smtp-18-i2.italiaonline.it ([213.209.12.18]:47211 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229733AbhFKIbm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Jun 2021 04:31:42 -0400
Received: from oxapps-16-092.iol.local ([10.101.8.102])
        by smtp-18.iol.local with ESMTPA
        id rcXuloclM0I8JrcXulQi1W; Fri, 11 Jun 2021 10:29:43 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623400183; bh=fVsbJQIpUBoJMDwG+RK7OIhgK/xXtb4GSJNmoPNFyBI=;
        h=From;
        b=iJyK3SgW+q1vsTv92/LBRymhu3XOBmwi6kxE1bXdkS8KAs+4KfG2CFZemI/n8/yJl
         VdcmCV86byMoHf2paGdnArX7L0inPUbW7UMyvmYlZYnI7oqi/PE9do6SHjhxievO4x
         lOOFX3nT0PSUzYOGH0nnvSgK5WQ5r3A7orko1DhkKJJFchHXDk5QMbRUyCX8EXUaMG
         27XfRttARpSFOBtrCJOvYmUVqxNcfGrSpa7vNLfgHHDsjYY3zZMBcrppqeU+pCnd8j
         d58wf8F1rgD0JPvcErhoJNoer0/chbf706FPPINQQunzK7xudnl77Ba7POFVb4mXMc
         nTZxmgsRmKC5w==
X-CNFS-Analysis: v=2.4 cv=KrWIZUaN c=1 sm=1 tr=0 ts=60c31ef7 cx=a_exe
 a=hqWHHYEsxhyOzh8fkFjDpg==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=2KMo9-giAAAA:8 a=KKAkSRfTAAAA:8 a=6J6j7_AOAAAA:8
 a=iMqvq_K-3UeLqAj76rMA:9 a=QEXdDO2ut3YA:10 a=UeCTMeHK7YUBiLmz_SX7:22
 a=cvBusfyB2V15izCimMoJ:22 a=DoBsnWhqfNmTxX1QClym:22
Date:   Fri, 11 Jun 2021 10:29:41 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <1397253066.299778.1623400182022@mail1.libero.it>
In-Reply-To: <YLcRN0KSCpvCS4ET@atomide.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
 <106030092.519428.1622143415836@mail1.libero.it>
 <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com>
 <2062056721.520514.1622147634190@mail1.libero.it>
 <CACRpkdZb4WZS8cd=nFz_J0GrBc5HJ8SMYtniB2W_Jpq_vtPTYQ@mail.gmail.com>
 <YLcRN0KSCpvCS4ET@atomide.com>
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: D9ZsAGjbUV+Pnn9AUBQu/TVi9vJFJa8O
x-libjamv: DAGL9GmEjDg=
X-CMAE-Envelope: MS4xfGL1QmvK0MOckz/uvTafwdQqHowDYItDpenjupCnkWTlwE+VJ+9TX6fQ5VtVi4X9+0BnER/14oIQJMtUINQpSL2HzEFIRTnuNxe5iodUf8H98si//sF1
 uv5F4YGw88BbtWxPIGTVRi7LoZWwRs41TwMoRO/d9PQpu2MHP4QRDZKym04U6aZg/DBpTleOqmuYD8ry2WsyNZdAntS/NeLIPikM2s5qPEBGqcLMKvbk5Azi
 ZwAcp7FNJDTllGEhYtrEyFt+CTK8X+F/Q0NFewNuN/t8VPpdSB93V5Rh0vc0NIzJLygwT0jK3KukmounEE28w0KmdBHDpCsKePWomiBb99lTwRhSYKCaX7oY
 j4um+pOnUrK97+y88gW5j+2nfSaX0ovbeXp3vaap+OgRwVfLzvc=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> Il 02/06/2021 07:03 Tony Lindgren <tony@atomide.com> ha scritto:
> 
>  
> * Linus Walleij <linus.walleij@linaro.org> [210528 09:08]:
> > On Thu, May 27, 2021 at 10:33 PM Dario Binacchi <dariobin@libero.it> wrote:
> > > > Il 27/05/2021 21:57 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> > 
> > > > Unfortunately you continue to cling to the broken interface, while I see no
> > > > comments from you about asked to consider pin groups and pin group functions.
> > >
> > > Could you kindly explain to me, with some practical examples, what kind of interface
> > > would you implement ?
> > 
> > I am not fully understanding this discussion.
> > 
> > I get the feeling that this is caused by the early architectural decisions with
> > pinctrl-single to put all configuration of pin groups and functions per pin into
> > the device tree.
> >
> > Tony specifically wanted this because what he gets from TI are some raw
> > ASIC data dumps from the designers, that he could make a script to process
> > into device tree rather than into .h files, and get this out of the kernel.
> > (As I remember it, Tony correct me if I'm wrong.)
> 
> Yeah the idea was to avoid stuffing even more SoC specific data into the
> kernel and rather use devicetree data only for the booted SoC.
>  
> > This makes it hard to align some concepts of the pin control subsystem such
> > as functions and groups because pinctrl-single assume a 1-to-1 mapping
> > between one pin and one group, which in turn has a 1-to-many mapping
> > to functions.
> > 
> > Is the patch trying to debugfs around this somehow?
> > 
> > If this hack is only needed for pinctrl-single.c then it should be placed in
> > that driver, so Tony can review it and maintain it as applicable in that
> > driver's context only, not in the pinctrl core as it appears the general
> > applicability for other drivers is not there.
> > 
> > Would this really be useful for other drivers than pinctrl-single.c?
> 
> I'd rather go with a generic interface. I think it should work if we only
> allow enabling and disabling of unclaimed pingroups from sysfs. And then
> we can also allow creating new pingroups for unclaimed pins if needed.
> 

Could you kindly explain to me, with some practical examples, what kind of interface
would you implement ? Or something similar to start from that is already in the Kernel?

Thanks and regards,
Dario

> Regards,
> 
> Tony
