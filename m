Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB7635B147
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 05:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhDKDke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 23:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbhDKDke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 23:40:34 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963D2C06138B
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 20:40:18 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id o11so4674000qvh.11
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 20:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2dePqcnlEiNDQmL8sXnzKX1E1E1GgEgEern/rq9+tGY=;
        b=Y4kuhq+kSJWskls3bjRMVx1gqJpAiOf0/kTRFUQxaDiOwucouzS7QtSn6XfUyWmZv/
         +mTe7RsdRpKb8OEvr5LFJaWGfaU0XPG1cqxvnQDh6vA2yU8TbzBPL1OTLUF1yJ/9AsKx
         /kAJah5KujiG7Ov08I+YdGsQDUaEo5u3co4c6IOuUOJXTx+tCvMrs01/IOjT9rPji+R6
         f0M43la3sdjaLlfUWgSzwZtTW0/gk2TGcbvUEvg8r4+4OCMnfe2/NGIRtGUChiHRNZht
         UhnZ+9QicPyORfMek1vRJoPAgXwnK40Gox+RuhxSq0jsa82A+5pXbiB1ZYnmbKsaXqw8
         Wjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2dePqcnlEiNDQmL8sXnzKX1E1E1GgEgEern/rq9+tGY=;
        b=bAJ8Sq7xwNhljhL91nAfKxTL4DlJEdVloZ/UK8/JX3Ijw4+FsIzTFI6Vv7JJ9p+D+t
         QT9MtaBDbRBwSy/nhGzDjYutyGHt5zkS5Sz+mkIycAPwFCW5AjFwK9m5lwG/jjpd0cWZ
         xtIV71tG2YGxoQ5w062WIGdtXruz/OUM/LoISz4CqzuQHkWVpc/nNkuXbGV1Wt1Q9MMs
         MHs9cZLKtYuH6pecToUy7DLhpcb2DFuSSuASls3y6371tC+oabkPHHvBySy7S+yyPol2
         t8qVaRyMtBnoBynBzy4MlGteV+deSIKzPYEfdi0Bm7oHTUg3eCPF9YXNdh4/f6p8o1f+
         a7wA==
X-Gm-Message-State: AOAM533lOCvPJW8XWOodCej2JtcLvwr+Fw0of8cLjYmRFDtBDcheGaCK
        TnDaZkOC88TzMRzr02E2VojnrxKzaOb4je31NgBajNKiADIg0Q==
X-Google-Smtp-Source: ABdhPJwtoUaqdQVkHgbsuCd2nem9Ie/1WtVSGNpGoyp4bIK6VXfdB8DAJXIo82ErKMr/I10B9HmUHdoYG210dUsLJ/I=
X-Received: by 2002:a05:6214:7e6:: with SMTP id bp6mr2398018qvb.37.1618112417095;
 Sat, 10 Apr 2021 20:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
 <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com>
 <3262311.AJdgDx1Vlc@diego> <CACRpkdZeZuHe9kFywrdQxcNMfAcBCJVAhJjfyD6ahLinT0hvmg@mail.gmail.com>
In-Reply-To: <CACRpkdZeZuHe9kFywrdQxcNMfAcBCJVAhJjfyD6ahLinT0hvmg@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sat, 10 Apr 2021 23:40:05 -0400
Message-ID: <CAMdYzYp80DdEp8LM7YkEUqmu-7WwhyTvFU4QAfGu9uimsE6rYg@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 8:40 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
>
> On Sat, Apr 10, 2021 at 11:10 PM Heiko St=C3=BCbner <heiko@sntech.de> wro=
te:
> > Am Samstag, 10. April 2021, 20:30:52 CEST schrieb Peter Geis:
> > > Good Afternoon,
> > >
> > > I'm currently working on the rk3566 early bringup support in mainline
> > > and encountered an issue with this patch set.
> > > Unfortunately in the rk3568/rk3566 the gpio registers switched to the
> > > (16 bits write enable / 16 bits config) register format that other
> > > rockchip registers use.
> > > This differs from previous chips where all 32 bits were used for gpio
> > > configuration.
> > > The patch fails to account for this, which causes all gpios to fail t=
o function.
> > >
> > > For clarity, this only affects GPIO_SWPORT_DR and GPIO_SWPORT_DDR.
> > >
> > > I'm currently working on a patch to fix this issue, but I know that
> > > you are planning on breaking out the gpio functions into a separate
> > > driver and wanted to make you aware of this immediately.
> >
> > just pointing to Jianqun's series providing the gpio controller support=
:
> >
> > https://lore.kernel.org/r/20210324064704.950104-1-jay.xu@rock-chips.com
> >
> > which introduces the necessary writemask-handling but seems to need an
> > update, judging by Ezequiel's reply to it.
>
> Does this mean that if we get a speedy and nice looking respin of the
> GPIO series we probably got this problem covered?
>
> The merge window is getting close but it would be nice to get this in.

Thank you for the responses!
With a bit of effort and a quick build fix, I've successfully rebased
the gpio patch set to the latest linux-next.
I now have functional gpio control on the rk3566.
I haven't tested them on older devices yet though.

With your blessing I can send in the rebased patches in the morning,
unless Jianqun wants to handle it.

>
> Yours,
> Linus Walleij
