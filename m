Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0884E3C6D2F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 11:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbhGMJXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 05:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbhGMJXe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 05:23:34 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80D2C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:20:44 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id u14so21051972pga.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTmMdrMAB9bImB5lvMc1DD+Z/7YP8LKKmtvXPZXTDoA=;
        b=eRM81P7okufqiPg6IEmABprVWTgrBmOTw/3du73QRY0jLtgQNCG+sRqGLl4mBBF5CP
         04zo3/byHW2mCZjOeGBPjWax0rwqMfcmkL25eZDzpIfkDWGbNQ1sSeppTJlsYPJiOIER
         a7CreGJMYDYThVYMXaXFRkxnlmnanPuaRz2WmdKqOjp6rQSOLkjl5PinCZ4CP4poU45H
         yjRsTGKI8VU+j1g7E6Bh8cSm10LbCYltQHr79kmtDjdAkzyhnv8xpXZsW/IT1szDP8in
         +qR4whB0u94BmWDzkHb10ueCeM2t9IED0nbaZHeVysga5j45J0XmZmxyXhIbjwhBI6vL
         KQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTmMdrMAB9bImB5lvMc1DD+Z/7YP8LKKmtvXPZXTDoA=;
        b=JF6vxKiSLU6S1Z03brpTtD36jGj9QPuQoyUD+EaQPk17PGTIY0KwcWVB488g8KqXQc
         ef4ViUbre7QKe/EveV7dTr+ntBRRqP4qVPWo8uD1bfAuAqOiKlr/HPdH9Xc/DOmfhXva
         1lcdQfYX1Zw3ZYzfn9Iaxh2qfGf92whTdqlWMnHPlIwS33NsggMEiuIALFjoqQ/bBX0E
         IP0pfNlccHYAkbAoIOKTf29SUMaVWxMlnEwPwB8Wra4CPHo8PxCLPo4oj7c5EJcNl0hq
         RlUP0zUwSfWCKPFqGKf5bJfOBoqDxRuh9tEu/SszM6/Lghbbk+Ej0gma24kA70aCLNdU
         63Rw==
X-Gm-Message-State: AOAM532PW9vm+RlwuZe1AdZ2yh5wCCiRec5GDONFApYwN1x16tV5TYzU
        xM68ry/4iImEmIwuSSK7R6ASwiB5w8+to7RwW/w=
X-Google-Smtp-Source: ABdhPJy4TSMIhbabCUl6HYY8vLuTRxbqSFh3OeOlBOyfrPde65y3joqTqoo/zbM/U0p+ccqdzOQOSMTe3iUfNqy/cFI=
X-Received: by 2002:a65:434a:: with SMTP id k10mr3455400pgq.4.1626168044491;
 Tue, 13 Jul 2021 02:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210712210836.GA3636@cephalopod> <CAHp75VdSVB4shmAO2Oww=UU_5pqR=W3JZ98ChjZwZaRZ9gbVdQ@mail.gmail.com>
In-Reply-To: <CAHp75VdSVB4shmAO2Oww=UU_5pqR=W3JZ98ChjZwZaRZ9gbVdQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Jul 2021 12:20:05 +0300
Message-ID: <CAHp75VdeeAhAOYi1uEtLRH=k2BsUOE+2j5YBF8__ujb3pya33A@mail.gmail.com>
Subject: Re: [libgpiod] How stable is the v2 API?
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 12:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 13, 2021 at 12:09 AM Ben Hutchings
> <ben.hutchings@essensium.com> wrote:
> >
> > I'm working on a project that requires GPIO debouncing and is planned
> > to use libgpiod.  But debouncing is only available on the unreleased
> > next/libgpiod-2.0 branch.
> >
> > What we'd like to know is whether the current C API on that branch is
> > expected to change much before release.  I don't expect any commitment
> > to API or ABI stability, but it would be helpful to have some
> > indication of how much change is likely to be needed in a client that
> > is written for the current API.
>
> I believe this is the right thread to discuss and influence if needed.
>
> https://lore.kernel.org/linux-gpio/20210621191830.10628-1-brgl@bgdev.pl/T/#ma70b1ab80804c09644f4a018ff5eff10464b195a

Oops, it was a follow up, but the core bindings were here:
https://lore.kernel.org/linux-gpio/20210607045950.GA18318@sol/T/#u

-- 
With Best Regards,
Andy Shevchenko
