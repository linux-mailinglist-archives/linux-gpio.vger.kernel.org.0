Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94FA32D695
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhCDP0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbhCDP0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:26:33 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF77C061574;
        Thu,  4 Mar 2021 07:25:52 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id e9so6789509pjs.2;
        Thu, 04 Mar 2021 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ncJ9NY/mLyZMyG/VF15N0utvd28RHjvV/VjGSmt6itQ=;
        b=R4Op5H9t8KFewCTZbhQJy588E6qbxl1MkZDhb5BK3FA3Lg0cHKejtzNljCcOstnhg1
         SXOnqNfbqbPNQRn94sx3Ox8JoisAXOWTuEHniyG5gD6ftbUMW7V3qArnVHiM0xAXti+5
         +Pv8tiYFtTk3Uy5tNq1uA5b3rVliFBubnbBuLOYNv9uEL6hIMuwHo4nU3G6pjnP82AwH
         mBoVbXpiaTJOhB5Zqv17RFtafdCfLQzF9Ed6UtseL147gztlUT5+XPgSFYdc99Z8Z0Qz
         Aors5ONs7HEafr1sw3Ppo7XusL4BGd4d4kgI00OvHiIkfZ3i7WKjAfXL/3Je9ccRfYrD
         6/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ncJ9NY/mLyZMyG/VF15N0utvd28RHjvV/VjGSmt6itQ=;
        b=MkJfxWJtFrlmZfBR4Sxc91bQf20e1MR2LRmhaEdpYnSghakGLNWiRYrL7JYHrz3Acf
         5oD8MokQEEmOrjqk9Z7/yFWUfnRaNFeTRYu2m5xUPlvLBaSu/WgXDtI25HmHy7jm5kuf
         1crQUriyQbfEGRMjRP6dS5B2cGmm8tAAbCrc14U0505+pwxQMQVF20gs9rgYQl60ivWx
         dI6Qr3GM7YyfhJ9JH+2Mjk9OocMiHcRvp4JMD141wukCuLA+fzuCh4nujHrx8RqxZr5g
         upXR9AIV/ql8VRrzcZ9NQbFLr+lxI6wcW6IWZm/gIcDVUmrIwepOsMDL2w9NMwUHeS4g
         l0Jg==
X-Gm-Message-State: AOAM532SWHefYCXwsR0jJeFPXnMfXxEV3pdAO0oMrp1+6r4jF1htvLsG
        BV0IFR13/gUcbggeSDHb7snIfi02Y0t4uTwk2Ks=
X-Google-Smtp-Source: ABdhPJxHZCsqwFCy36YgzTmJjZ7IYrUiA8VuH+hqCe8/2LwepnSASruYlu6RG3jg3/DslIQ/bCdEE5IPRPH+eonudQM=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr5241457pjx.181.1614871552276;
 Thu, 04 Mar 2021 07:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
 <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com> <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
 <CAE32628-DC0D-479F-BB17-2CFA475D5128@gmail.com>
In-Reply-To: <CAE32628-DC0D-479F-BB17-2CFA475D5128@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:25:35 +0200
Message-ID: <CAHp75Vf6+1u5myV7cL1903Qc92H7vPFMuc916-_wjKQ6zwmoqg@mail.gmail.com>
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

On Thu, Mar 4, 2021 at 2:25 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 13:12, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 1:13 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 11:49, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>> <noltari@gmail.com> wrote:

...

> >>>> +               BCM6328_MUX_LO_REG,
> >>>> +               BCM6328_MUX_HI_REG,
> >>>
> >>>> +               BCM6328_MUX_OTHER_REG
> >>>
> >>> When it's not terminator add a comma, otherwise remove a comma.
> >
> >> =E2=80=A6 so you want me to add a comma or not?
> >
> > Hmm... you tell me! If this is a list which covers all possible cases
> > _and_ the last one is the kinda maximum value (aka terminator), then
> > comma is not needed, otherwise add it (to me feels like the latter
> > should be done here).
>
> Well=E2=80=A6 Then it shouldn=E2=80=99t be needed, since this is a list w=
hich covers all possible cases and the last one is a terminator.

Honestly the name suggests otherwise. And looking into the code there
is no guarantee you won't split that _OTHER_ area to something with
new compatible hardware.
Renaming to BCM6328_MUX_MAX_REG will clear that this is terminator,
but it means its value shouldn't be used except as to understand the
amount of supported registers of this enumerator.


--=20
With Best Regards,
Andy Shevchenko
