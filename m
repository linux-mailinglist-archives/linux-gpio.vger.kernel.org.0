Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D174934084C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 16:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhCRPAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 11:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhCRPAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 11:00:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4EBC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 08:00:07 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so5181724pjb.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GP8HqtdLDQbACAGPUeBLgHbEvptdN7Zz3SPYMzgtiQM=;
        b=ekZArmL6/lP6JlxNRohk2L0ArP+EBUaVAJZPm6d+/ZQqqk/CCCodngggsiw2LOcDDy
         4KeLCXn/UQ4Efsk5RdtAqOiBaPj1TZj1TGAae+/01fl/HA47OZkaR9513+vtkN9lnhxe
         eZGQKv9WvLvOtJ11tnb3vYVmg0JZ/l0/qbfFOQbu231MPTEhmSt62jhFYPzNH7Ra8Q5M
         HTCnFD0E9pRPG5biA95HjnhYToxhigdXIwbbsjG4XwQZbli3LdO/9teQsUtLyLOgMx7w
         1CrZZHRmgrP/UjkHC73IB5ynl3AUSlgfBp0ekbr8NjUPL6/hyoAghnAgTC8/sNwqbAnp
         /qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GP8HqtdLDQbACAGPUeBLgHbEvptdN7Zz3SPYMzgtiQM=;
        b=SKT4RmxCNZWfMvKak1OhyeygCksHpJxK0ptOxQdT/IeQUX4TWuMNKDHLDO42RhfLAT
         gOrV1rOgwJWnZfIqx46HBMxXQwKIQAZ+mvVaci22P2FowFvq/0YgECArcyuYua3Y7UBR
         Xg10zT3LpX86fJyLCsv+nT0eTDEO0AK8gwLQnTo8JCc9oBzZTusjysh4GFQT4aei1kul
         6koJpvhqUzRmsEuO58ghhuch8PZYOzMdtLcRCysLnQySoxC1L/Uuk2MrtM8mBbGCFczd
         OikoT7qYtaIKhvlGpqqTiG/N1g7khdHcNhcJrSolXlMq54Cj8z2vGyREarS4T7oB/UEP
         h4aA==
X-Gm-Message-State: AOAM531Z9qvwQjt/KtqIUU475uaVOILzD9Ikgzlfz5YnSPgenBQiP5sM
        vyv6jH3uzRz4D69626aHNbxrXHVhml+rZKE12At2eMJ8DplCGQ==
X-Google-Smtp-Source: ABdhPJy53x4oM+Sm/oh/UpV/3qLf+WVixYkYMt7qXuo7Djf3/tQjwTjJNMmTKVUMp6lrNaAcwnRq1RGFPvI8SLAepVE=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr4945079pjr.228.1616079606934;
 Thu, 18 Mar 2021 08:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <946021874.11132.1615900079722@seven.thorsis.com>
 <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
 <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
 <854891727.11376.1616061014891@seven.thorsis.com> <CAHp75Vftrq66SweYKYprWBoi9X8csxe9ROaMorRFUjGSD8gNSQ@mail.gmail.com>
 <1236506597.11463.1616075798037@seven.thorsis.com>
In-Reply-To: <1236506597.11463.1616075798037@seven.thorsis.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Mar 2021 16:59:50 +0200
Message-ID: <CAHp75Vd-+rSgG08TV0P3ocCQjUdPkNypxGncJmT5K62SEuwXog@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
To:     Alexander Dahl <ada@thorsis.com>, Rob Herring <robh+dt@kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 18, 2021 at 3:56 PM Alexander Dahl <ada@thorsis.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> hat am 18.03.2021 13:40 ges=
chrieben:
> > You may look into the commit
> > 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for
> > device properties")
> > which unifies the logic, but at the same time removed one comment:
> >
> > -       /* If the chip defines names itself, these take precedence */
>
> Well, that could be added again. And if that precedence stays as is, it s=
hould be documented in the gpio devicetree bindings to not cause further co=
nfusion?
>
> > So, logic was that for a long time. And unfortunately I don't see how
> > we may change this without breakage. This backs us to the discussion
> > if the name of the line is ABI or not.
>
> I want to point out one point for consideration. There's usually a differ=
ence between the SoC and the boards using that SoC. So those pins are all t=
he same from the chips point of view and the default names are set in a dri=
ver related to the chip (family).  However the line names set in device tre=
e are probably related to a board.  Obviously different boards may have dif=
ferent line names, even when using the same SoC.
>
> In other words: if I design a new board, there's no interface I would bre=
ak, at least not from the userspace point of view just looking at the line =
names, or is there?

I understand that  names are platform specific and I'm on your side as
an IoT specialist, but on the Linux side we may not blindly do changes
like this due to ABI concerns. You see the problem here: you can't fix
all (legacy) DTSs in the world which do not have GPIO line names
listed, and for those users we effectively break their tools and
scripts which relies on the hard coded naming scheme.

So, we may change if and only if the names of the lines are not an ABI!

What we can do as a workaround is to reverse the partsing order, and
if somebody complains, it will be their DTS issues, whoever not the
best solution either.

+Cc: Rob to hear his opinion.

--=20
With Best Regards,
Andy Shevchenko
