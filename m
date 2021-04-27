Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A270C36C77B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 16:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbhD0OFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 10:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbhD0OFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 10:05:13 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17D7C061574;
        Tue, 27 Apr 2021 07:04:30 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id lp8so899226pjb.1;
        Tue, 27 Apr 2021 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3qdFMwemNuTC0Lq+ofQnzwQ+11ErORiqBQgp9UWRx+I=;
        b=rpRnlqmWyx1T9/KaLKj+Vj22t38v9006K5jmumLd5V+RswWOqv3jlAyTRGEc5QbG5e
         c81QisD4Yxo7xDbVDjehoFhzdtGoY3uj3kByr1YaBXLxO0k+KstGANKhKj64GfJ0xzuJ
         cWL6JJxGTMy8ayiCsIufS5sLHkcrOjKm7/WfUGKV+KtyQBUo2eVZPW8GCP0tigSR1VlN
         f3kKcqpQtAFh77B6c5Bk2FpbqUgeRImWlQxcxd2xM8KU43kp1H7IQV+kEKuLhHAxEB1v
         f0sqEVdxIhVfQV7xMRZD8gMULpJgxKRGm77OvlnYcNUuGE0uhgT56SCystI41lxbShON
         U9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3qdFMwemNuTC0Lq+ofQnzwQ+11ErORiqBQgp9UWRx+I=;
        b=NAZmOTspEFkEeE8UxfWdryVrwHyRkOyFvKYSZyV3NrI+wIldfodE8PNlhcEInAd7OT
         5aMLQsC74VL4Qg/dFnOn5c6V3vzZbjjUCVTzi9Co9hDr/3BRvOXMjLMMX1pNQs7oCtbO
         0IIoN6SOCzF4kdlNzkL9zHdbI9atwkD6ky8NB+wLN/Zkr6yTqQpwmKXwArpFvmb9SzED
         WI2GEniIJksk7nMpU82NbRuw3dtM1oV/EQSiZaHGcQ4ogeqrOJ6evB/tmtO3pb/7XUFc
         KBsDAWw07SNMpHTJqljlYjEqh6cYgYohkix3G/BmHE9Q07pvqIiSCrBLpuRr+E8zv0Vb
         2bCg==
X-Gm-Message-State: AOAM5320Ghss+lznZjTgBprKGlqwJRlVTijYjq7U21bsw0J9b3jAPEB+
        CLrm6z9emH6vQzctY9sIfIqd5bC4CGv7Wfg+Cr4=
X-Google-Smtp-Source: ABdhPJyO7BWzNFgV/Kb4cVjTjLjE9wpdzKk+23+eB23Lgtn7vSJQC3ChwXAPRG4woH8TSxH+kXYedV3QCQfT5246vGo=
X-Received: by 2002:a17:90b:1c0f:: with SMTP id oc15mr28310722pjb.228.1619532270141;
 Tue, 27 Apr 2021 07:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com> <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
 <180ca47b-d627-2d7b-1d18-5557bfcf5875@xilinx.com> <CAHp75Ve1MY6wms7d1e2cByzV0Zy-rRs-qNMk=6X_fw=zu4rbgw@mail.gmail.com>
 <67cef577-0965-2fad-7d61-17181d692003@xilinx.com>
In-Reply-To: <67cef577-0965-2fad-7d61-17181d692003@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 17:04:13 +0300
Message-ID: <CAHp75VcqNC=MUJJJdou_2rJub2yeD50MQk03J2DfmHF4N0-htA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Joe Perches <joe@perches.com>,
        Sai Krishna Potthuri <lakshmis@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 12:59 PM Michal Simek <michal.simek@xilinx.com> wro=
te:
> On 4/27/21 10:39 AM, Andy Shevchenko wrote:
> > On Tue, Apr 27, 2021 at 10:38 AM Michal Simek <michal.simek@xilinx.com>=
 wrote:
> >> On 4/27/21 9:31 AM, Andy Shevchenko wrote:
> >>> On Tue, Apr 27, 2021 at 10:23 AM Michal Simek <michal.simek@xilinx.co=
m> wrote:
> >>>> On 4/26/21 4:04 PM, Andy Shevchenko wrote:
> >>>>> On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
> >>>>> <lakshmis@xilinx.com> wrote:
> >>>>>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> >>>>>>> Sent: Friday, April 23, 2021 9:24 PM
> >>>>>>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
> >>>>>>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:
> >
> > ...
> >
> >>>>>>>> +       help
> >>>>>>>> +         This selects the pinctrl driver for Xilinx ZynqMP plat=
form.
> >>>>>>>> +         This driver will query the pin information from the fi=
rmware
> >>>>>>>> +         and allow configuring the pins.
> >>>>>>>> +         Configuration can include the mux function to select o=
n those
> >>>>>>>> +         pin(s)/group(s), and various pin configuration paramet=
ers
> >>>>>>>> +         such as pull-up, slew rate, etc.
> >>>>>>>
> >>>>>>> Missed module name.
> >>>>>> Is this (module name) a configuration option in Kconfig?
> >>>>>
> >>>>> It's a text in a free form that sheds light on how the module will =
be
> >>>>> named in case the user will choose "m".
> >>>>
> >>>> Is this described somewhere in documentation that module name should=
 be
> >>>> the part of symbol description? I was looking at pinctrl Kconfig and=
 I
> >>>> can't see any description like this there that's why I want to doubl=
e
> >>>> check.
> >>>
> >>> I dunno if it is described, the group of maintainers require that for=
 some time.
> >>> I personally found this as a good practice.
> >>
> >> I don't think it is a big deal to add it but it is a question if this
> >> information is useful because module names should correspond target in
> >> Makefile which can be considered as additional information.
> >
> > For you as a *developer* =E2=80=94 yes, for me as a *user* =E2=80=94 no=
. You are
> > telling me something like "hey, if you want to know more you must dig
> > into kernel sources". No, this is not how we should treat users,
> > should we?
>
> As I said it is not big deal but we should care about consistency on
> this. Adding Joe here if we can extend checkpatch to report a warning
> about it. Then it will be visible and can be checked.

> >>>> Also if this is a rule checkpatch should be extended to checking thi=
s.
> >>>
> >>> There was a discussion at some point to add a check that help
> >>> description shouldn't be less than 3 lines. Not sure what the outcome
> >>> of it.
> >>
> >> This check is likely there because I have definitely seen these messag=
es
> >> coming but never seen any name checking.
> >
> > Yeah, it was about insisting developers to be more verbose in the help
> > descriptions, but the name is, as I said, an activity "de facto"
> > rather than "de jure". Just look around for the latest new driver
> > contributions (I follow IIO, I2C, SPI, GPIO, pin control) for how they
> > provide their help descriptions (I admit that not everybody follows
> > that practice).
>
> I have seen some on linux-next but really when any rule/recommendation
> like this is introduced it should be more visible and checked by
> standard tools (checkpatch or by bots) then people will start to do it.

I agree on this.


--=20
With Best Regards,
Andy Shevchenko
