Return-Path: <linux-gpio+bounces-809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A5800536
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 09:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009531C20B0D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E690017725;
	Fri,  1 Dec 2023 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZkLYaiK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B427810FC
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 00:10:21 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d3d0f862f7so9506397b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 00:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701418221; x=1702023021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agFd2Y6GZ15wz3HAW24M17l3WAWBLfRgg7Tdk/LzReg=;
        b=UZkLYaiKcdRfh7Z0iy1NvLamhU3DLZhEM1FakgIwX78alixTxpI99o7yWRGPaXgNSu
         Qbf5sJXxgt077o1oeP6v7P2gYKFlbv82IdkdVAR0QIgiXgDxkqC4ex3uFLgOEfmR36uk
         pifOabCNGFvWZ0WQsEZujnnQNsXyWbYKPbvyvS6bks7uKoYjnCe84V/dLvYDpsmbB7KL
         VLFl1d0MFVSSpUt6bDxdhF/JLgzevkbWfQ+qqixwoMuAWgjatPT1UeWQfzq8CTUBC+N3
         W+jafxusGRj73c2NlgEY1Lduv85vvGdZi5lJposrG1vmqw2Pxw6ocwkvguSDReAgWrD6
         Vccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701418221; x=1702023021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agFd2Y6GZ15wz3HAW24M17l3WAWBLfRgg7Tdk/LzReg=;
        b=SlTZa0H2uiD6S34RWxe6ms4MGj0+K/2VpNV4PoGSuPhEprMyMlM4A6Ccym3RuPo96q
         2A2kxSsLanm5dpYJTNwW04fw9Tbnp/H2tiDiU+VBUt1SDauVaSD2NjZi90sR7yK/pBJF
         mmNIuNa2b/G9f8wBBZW9NG1l+3p6LeCG94MJ0itSJdz5IwZkzp44mjjKlQJAVjfzXGW8
         X2BkHnhGLzY7gkgs9z23IIK2LcM2rrgwAt3BgjYrmvSevm+yaIstsPSeJZHzmNyyrbn0
         O70qMyzYOXwPnDPXoe8jCeypDOZU3sh3SPrI02UiGwWcvz9lzart5rKK0PsqxIyu4Ia2
         81Fg==
X-Gm-Message-State: AOJu0Yzo9KV+8lX6zwO4swcUy9O7tOYcwxf/FxLNh+fPnh+Fnyi0Fj56
	A6JFv8VCNmX59nCnE8dBd4Kl5aYLl517JPtv8rvQBw==
X-Google-Smtp-Source: AGHT+IEjaMMgVpIYb9RaoQTtvGvXuk5DcXTXYdapNizUiG1NSoWVb9uZFCHPAKL8NwGrr/+/Tb9SuMWCWBlR45Bz9i0=
X-Received: by 2002:a81:6006:0:b0:5c9:af70:8e99 with SMTP id
 u6-20020a816006000000b005c9af708e99mr25663727ywb.41.1701418220718; Fri, 01
 Dec 2023 00:10:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
 <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
 <CACRpkdZRf7bNVmJCgsVD0uheD1VLkLKG13d1oS-kbT8BFyRKQw@mail.gmail.com> <e703c87e-32b9-4dce-b232-89c0e909c35e@quicinc.com>
In-Reply-To: <e703c87e-32b9-4dce-b232-89c0e909c35e@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 09:10:02 +0100
Message-ID: <CACRpkdZtCxwLZCY4autrTvonmZ3XcVzH6iXqXanS97VKCZ+ERw@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Chester Lin <clin@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan, Nick,

(just picking some LLVM compiler people I know of... and trust)

Context is this patch:
https://lore.kernel.org/linux-gpio/20231115102824.23727-1-quic_aiquny@quici=
nc.com/

On Thu, Nov 30, 2023 at 6:37=E2=80=AFAM Aiqun(Maria) Yu <quic_aiquny@quicin=
c.com> wrote:
> On 11/29/2023 11:08 PM, Linus Walleij wrote:
> > On Wed, Nov 29, 2023 at 3:56=E2=80=AFPM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >> On Wed, 29 Nov 2023 at 04:09, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> >>>
> >>> The most interesting patch is the list iterator fix in the core by Ma=
ria
> >>> Yu, it took a while for me to realize what was going on there.
> >>
> >> That commit message still doesn't explain what the problem was.
> >>
> >> Why is p->state volatile there? It seems to be a serious locking bug
> >> if p->state can randomly change there, and the READ_ONCE() looks like
> >> a "this hides the problem" rather than an actual real fix.
>
> This is indeed an interesting issue. Thx for the comment, Linus.
> **Let me explain how: "p->state becomes volatile in the list iterator",
> and "why READ_ONCE is suggested".
>
> The current critical code is:
>    list_for_each_entry(setting, &p->state->settings, node)
>
> after elaborating the define list_for_each_entry, so above critical code
> will be:
>    for (setting =3D list_head(&p->state->settings, typeof(*setting), node=
); \
> &setting->node !=3D (&p->state->settings); \
> setting =3D list_next(setting , node))
>
> The asm code(refer result from Clang version 10.0) can cleared explain
> the step of p->state reload actions:
> loop:
> ldr x22,[x22] ; x22=3Dlist_next(setting , node))
> add x9,x8,#0x18 ; x9=3D&p->state->setting
> cmp x22,x9 ; setting,x9
> b.eq 0xFFFFFF9B24483530
>
> ldr w9,[x22,#0x10] ; w9,[setting,#16]
> cmp w9,#0x2 ; w9,#2
> b.ne 0xFFFFFF9B24483504
>
> mov x0,x22 ; x0,setting
> bl 0xFFFFFF9B24486048 ; pinmux_disable_setting
>
> ldr x8,[x19,#0x28] ; x19=3Dp, x8=3D[p->state], *reload p->state*
> b loop
>
> The *reload p->state* inside the loop for checking is not needed and can
> cause possible infinite loop. So READ_ONCE is highly suggested even if
> p->state is not randomly changed. And then unnecessary "ldr
> x8,[x19,#0x28]" can be removed from above loop code.
>
> **Comments about the locking bug:
> currently pinctrl_select_state is an export symbol and don't have
> effective reentrance protect design. That's why current infinite loop
> issue was observed with customer's multi thread call with
> pinctrl_select_state without lock protection. pinctrl_select_state
> totally rely on driver module user side to ensure the reentrant state.
>
> Usually the suggested usage from driver side who are using pinctrl would =
be:
> LOCK;
> pinctrl_select_state();
> gpio pulling;
> udelay();
> check state;
> other hardware behaviors;
> UNLOCK;
>
> So the locking bug fix I have told customer side to fix from their own
> driver part. Since usually not only a simple pinctrl_select_state call
> can finish the hardware state transaction.
>
> I myself also is fine to have a small per pinctrl lock to only protect
> the current pinctrl_select_state->pinctrl_commit_state reentrance
> issues. Pls any pinctrl maintainer help to comment to suggest or not and
> I can prepare a change as well.

Luckily I am the pin control maintainer :D
And I also ha my morning coffee and looked over the patch again.

So tilting the compiler to generate code that is less prone to race
conditions with READ_ONCE() isn't really the solution is it? We need
to introduce a proper lock that stops this from happening if it is
a problem people are facing.

Can you try to make a patch that removes READ_ONCE()
and introduce a lock instead?

Racing is rarely an issue in pin control for reasons explained
in another context here:
https://lore.kernel.org/linux-gpio/CACRpkdZ0cnJpYuzU=3D47-oW-7N_YGMo2vXpKOe=
XeNi5PhPY7QMA@mail.gmail.com/

...but if people still manage to run into it, we better have a lock
there. Just make sure it is not just an issue with outoftree code,
but a real problem?

The change that changes the code to use the old_state variable
should stay in, it makes the code more readable, it's just the
READ_ONCE() macro which is dubious.

Yours,
Linus Walleij

