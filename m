Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E4146D598
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 15:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhLHOaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 09:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhLHOaC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 09:30:02 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE99C061746;
        Wed,  8 Dec 2021 06:26:29 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so9177114edd.0;
        Wed, 08 Dec 2021 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WEqGRbqWp40+7xIlHrxTNX9Z2+0HYwvvaJQn6NNsWnY=;
        b=AEzodwMSKr6CHlgAaIAZ/IOORN2qo/H8d7g/Nq7kBhZkFhEFb06XsBrsPwzBjwOeBd
         aI80HSFhGRBsC0v8m5tU8zVx6ArTFbpLpT5UQqLQ5pAaiI0wfA8by/bsrKUduBSxn18i
         DWsDPc6UmuCLEswfROW6DqaRvnYK8Ipzlx7VenCGcASAxlCWemoJgCJFpxDGX/H7RMZM
         B5e7fuvpVvHFD3PH+TwkqUxANhcA3ICinxzdfI1xmiFeh2KuLZcPVMjkWYtrR5uBXCzQ
         899JkPcPGRFDzXmXhELzN4ytDBtwD42SAxni4RHwqM9foiqOEbeRsIdiacXBhrTj9lC1
         H8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WEqGRbqWp40+7xIlHrxTNX9Z2+0HYwvvaJQn6NNsWnY=;
        b=EGVIVKQRhFynkHCBw7GTXD69v3ICvk0n6rJXBKGgPCmpTLZ55RVSLwwOYXjaM3FJXQ
         lV0WfITc1ekmXx7YPa5f6kbIXld7nZIVSkNC+OGWshk5aohFgnB478gPQaWktEiag6Ww
         wsndsyXYu6Obwq5Fz9sMI0jx4X8tyc/9mbaJE8WlE5gliCLXWQZmcbYfs4lzRkeQjgxC
         fc1CnLq53hrGZ4amgLgH/vYJkU/prio4Q8C8jgGD/XQDC0J2wovJHsIbZ4kdxnmRkgtU
         wO0GiZrH7fP+ssU4D3+Hb7YvAnPULJLgBvnZ7fpAPJHYhd/2oYapgShiWdXA/hwzsEMc
         5Tww==
X-Gm-Message-State: AOAM530WRkufC8hvlhIqX2qE4XbAwQ4IXq004Dh1y2AnVKIjhlqm4QE5
        bt9TNimi50J58FDb5qcofciDJwKjlnkO3BJ5lFs=
X-Google-Smtp-Source: ABdhPJxX9XcPpR79RIlsOvNcLKOHM1oOtGfJHVEXIfKfG9URMTDbZftI5+ttxlZfcAlWULxKeI7xc9yp3TpvQvcteMo=
X-Received: by 2002:a17:907:869e:: with SMTP id qa30mr7465535ejc.356.1638973587669;
 Wed, 08 Dec 2021 06:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
 <CACRpkda2d9j7_HOM1Q1dEsK+U4-4KmbvjvTAEvx2AbxMQtOgFA@mail.gmail.com> <d1ce87a0-decb-ac29-7906-1181c83c1067@xs4all.nl>
In-Reply-To: <d1ce87a0-decb-ac29-7906-1181c83c1067@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Dec 2021 16:24:54 +0200
Message-ID: <CAHp75VfqH_1Rc4i-Fb9_SxtTWqr2SOspgvk=JGxMUHFWOZn6uQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] pinctrl: can_sleep and pinctrl_gpio_direction
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 11:26 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
> On 08/12/2021 01:30, Linus Walleij wrote:
> > On Tue, Dec 7, 2021 at 11:14 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Monday, December 6, 2021, Hans Verkuil <hverkuil-cisco@xs4all.nl> w=
rote:

> >>> Based on this discussion:
> >>>
> >>> https://lore.kernel.org/linux-gpio/CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9=
KPvwXVaowLMRhcejA@mail.gmail.com/T/#t
> >>>
> >>> I propose this RFC series.
> >>
> >>
> >> When I first saw your report I was thinking about actually adding a ne=
w callback ->set_direction_atomic()
> >> and then make pinctrl use it, otherwise like you do, I.e. issue a warn=
ing when it=E2=80=99s called in atomic context
> >
> > The problem is inside of pinctrl core, not in any driver. It takes a
> > mutex when going over
> > the GPIO ranges.
> >
> > I suggested maybe just replacing these mutexes with spinlocks, or RCU.
>
> RCU or spinlock would most likely work as a replacement for pinctrldev_li=
st_mutex, but
> not for pctldev->mutex. I didn't see any obvious way of replacing it with=
 something else.

You can't get rid of locking even with RCU. AFAIR the locking protects
"writer" side and it can well be mutex, doesn't really matter. The
question about RCU is what we are actually _doing_ in the call we are
talking about. If it's a simple _reader_ of some (shared) array of
data which is not being updated during this traversing, then it's a
very good fit for it. Otherwise other means should be considered.

> I'm open to any suggestions, but for now this was the best I could come u=
p with, given
> my limited knowledge of the gpio/pinctrl subsystems. It at least warns yo=
u that something
> is wrong.
>
> Personally I think that for combined gpio/pinctrl drivers it doesn't make=
 sense to take
> this additional loop through the pinctrl core, regardless of whatever loc=
king mechanism
> is used. I actually think that it obfuscates those drivers a bit, but tha=
t might just be
> me.


--=20
With Best Regards,
Andy Shevchenko
