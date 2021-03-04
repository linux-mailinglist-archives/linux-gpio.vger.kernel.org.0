Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DA932D6D2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbhCDPh4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbhCDPh2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:37:28 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1026BC061574;
        Thu,  4 Mar 2021 07:36:48 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id u12so7271282pjr.2;
        Thu, 04 Mar 2021 07:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tMpHBozJF23/PJX3uQgZEpvD0NBhGLHb16sjZqmBXVE=;
        b=m1URj6jOtt1EMCkbi4PYOJjgvfcwMeQ/uilfsTo+EGDkrTNtkEIDSaq87LjsACxCXR
         Y3NV5txbBJ98/ddTTrlmKzHdb0PBa7AUFtwpAyGUt+FJJ5iXRhC2zXVW1ajYiVJQvreV
         N6bmilgLhEmz8xOMH8p4ED+CkrGf7RgZiTq5FpgnEJULcCg5LKIS2UuIZgKAOY+Y10VQ
         bX5VS0kDhD+7a4GF3F39l/JukRZG84Uwtcfk4XDP6RgsSoWUS+1NpKf86mIJlU6QHxvk
         AY6nRQLbVTqY7kVcnVAHyk03EN25pNpbdSVLcBZ38Vxo+J1i/meSdtZ4kujCEPjnCg+a
         Bpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tMpHBozJF23/PJX3uQgZEpvD0NBhGLHb16sjZqmBXVE=;
        b=QMPc2g5apAy3DB+ShOk1NECtOh83Qn4KXvUhyY+FTmr7Lu4k9zZk1YL7o926reU4D9
         yKl+qSlipAby4OFf9w/UM4tpt0z0H0MVHDrZG72gWmuZeX/8dLOCuQHnRzbQ/LZydNEr
         sXclE/1DfkZITWDWt9IE3dGKFkKvS1BELDS+VI3V2oneF8HmOZXKRVL2QJo95LtOfwSv
         UWNrlWv3TpC8BofucyWybgW+C7Jy9nPOghx22R/9SKLRoEhtddJB4Wqae6G3uN32z1JJ
         Iel43Xm/8RQ1vTr7NIBbAkoWkAy9BeuNpSETZZPBBpo1KxNKogFnVcEhy5Q2Uaqheiw3
         1pYw==
X-Gm-Message-State: AOAM530mJIUmkJlWZuoQ/dmqygeqEjr6rbdpIly+ydcoZHAYSbX2hkqA
        jXhv3G3nBTE7KG1y6z5tLFdaAqrdY3bOCspATFU=
X-Google-Smtp-Source: ABdhPJwmf/4+uzJnuVW49yegOxUu2AmdE/RE7OyCiQCfkx5i+iblZx2hstJgMyuze90wNqmU5oOnhZ/mysj+aquZGgE=
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr3574975pjg.129.1614872207519;
 Thu, 04 Mar 2021 07:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
 <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com> <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
 <CAE32628-DC0D-479F-BB17-2CFA475D5128@gmail.com> <CAHp75Vf6+1u5myV7cL1903Qc92H7vPFMuc916-_wjKQ6zwmoqg@mail.gmail.com>
 <0A8F3739-E4A2-499F-8B25-C35CF6F811ED@gmail.com>
In-Reply-To: <0A8F3739-E4A2-499F-8B25-C35CF6F811ED@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:36:31 +0200
Message-ID: <CAHp75VeNqF+38srodSvVXwJZ80n7RxkD-X9tiMGRK_KrQYo0gw@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
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

On Thu, Mar 4, 2021 at 5:33 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 16:25, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 2:25 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 13:12, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 1:13 PM =C3=81lvaro Fern=C3=A1ndez Rojas <nolt=
ari@gmail.com> wrote:
> >>>>> El 4 mar 2021, a las 11:49, Andy Shevchenko <andy.shevchenko@gmail.=
com> escribi=C3=B3:
> >>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>>>> <noltari@gmail.com> wrote:
> >
> > ...
> >
> >>>>>> +               BCM6328_MUX_LO_REG,
> >>>>>> +               BCM6328_MUX_HI_REG,
> >>>>>
> >>>>>> +               BCM6328_MUX_OTHER_REG
> >>>>>
> >>>>> When it's not terminator add a comma, otherwise remove a comma.
> >>>
> >>>> =E2=80=A6 so you want me to add a comma or not?
> >>>
> >>> Hmm... you tell me! If this is a list which covers all possible cases
> >>> _and_ the last one is the kinda maximum value (aka terminator), then
> >>> comma is not needed, otherwise add it (to me feels like the latter
> >>> should be done here).
> >>
> >> Well=E2=80=A6 Then it shouldn=E2=80=99t be needed, since this is a lis=
t which covers all possible cases and the last one is a terminator.
> >
> > Honestly the name suggests otherwise. And looking into the code there
> > is no guarantee you won't split that _OTHER_ area to something with
> > new compatible hardware.
>
> Every BCM63XX device has its own specific pin controllers.
> It seems that on every new SoC created by Broadcom they decided that the =
previous pin controller approach was a bad decision or something xD.
> Therefore I don=E2=80=99t think there will be such =E2=80=9Cnew compatibl=
e hardware=E2=80=9D...
>
> > Renaming to BCM6328_MUX_MAX_REG will clear that this is terminator,
> > but it means its value shouldn't be used except as to understand the
> > amount of supported registers of this enumerator.
>
> No, I don=E2=80=99t think this is a good idea.
> Please, take a look at:
> https://github.com/jameshilliard/gfiber-gflt100/blob/b292e8c271addbda6210=
4bece90e3c8018714194/shared/opensource/include/bcm963xx/6328_map_part.h#L41=
0-L441
> As you can see, BCM6328_MUX_LO_REG and BCM6328_MUX_HI_REG are used for sp=
ecific GPIOs, but BCM6328_MUX_OTHER_REG is used for pins which lack a direc=
t GPIO assignment.

Understood. Thanks for elaboration. Go ahead with current approach, thanks!

--=20
With Best Regards,
Andy Shevchenko
