Return-Path: <linux-gpio+bounces-2295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAE83018C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 09:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18971F20EDE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 08:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B3B12B69;
	Wed, 17 Jan 2024 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uzjjQqqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763813FE4
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2024 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481520; cv=none; b=YZ8a7UwGvkw/8JMtSySpe9o67S1RL+kiem4HRe1WZH719zA2DggPYou4IABAVxII+U99J1sWEpnti7/LNHDTTWGGUGAjGyKkjoj/D6RIYpbBBPShQiDOV4ZN4epT+Zyp+15T5p6j3Nf4VR5nQ4CwugcHAmZMQxQZEMfPD7hA8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481520; c=relaxed/simple;
	bh=4SwlpHGcSWP6z2rcXR2s81UgwIGytxJ8hc/Rkdcy0OI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=mi++lzNGp/6GWDch6Gxz6JsiVaPSPcomufPUUJXS8e+OeFG2Jmd7OIYWN5ImDdY1tqC6nYNAc/ZsomlwATLoYhaA7lUnBR2Xjes4tEVzkHMd3gexM9H+bmy1rQRMvn5QHJbiKVuae6CqscdCet5BvqEFhK5IeNcbFbHeDLpFuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uzjjQqqL; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7ce9defc4c2so1740408241.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2024 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705481517; x=1706086317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbvt6okzEg9mCFzPVV+6Uem9oajRPBMKXyYL6WqdVzs=;
        b=uzjjQqqLfv2JFhJ900nSVMLEUe45fuIE7mx1jqD467PJYRhbZIAhFihafdPflSs7N5
         E7arFFOH75jJn/1VaUtD5nDY+JEAhAZRhFQcZeiYbGWu8XkQWBvZH0dmjIYZFwcFHYFD
         VV1bUD5q2VsMZJHmnEu6ERRCNLa5yHbd7A7LkljdSiLR7Uav6enOSxiaA6wnNoJSAc9S
         zAlx3oFSik4exwLnHUoN2tb5I7KDfSj2uvatGCBPS+lDLMmb91YDR6CLADHwA36NJnmy
         AaB6pTnN2HW00BRzvlvG/6yeG907DhjPvixS5C/r4sCKZeMgEr4d2ZVJhjaotjvvP2Mw
         pcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481517; x=1706086317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nbvt6okzEg9mCFzPVV+6Uem9oajRPBMKXyYL6WqdVzs=;
        b=HGIsAgl/qHeeyhIQaAs1UFnPCezs/ZfTIhsfv454D82zT5MXyEXrXSHEZnTPFKEqc4
         Vy0H+yA2veeZ5pTqtUwRZFSd5aWm0wL5UjT9u66MvEw82F/DvnFPAC7fSIBY/OEDuVAN
         hYXKuUhMnMAva0gFXApnvehtci+/UE71ygWTZlgW0odU5KVZWpNT0aNWT+LClmoIwLU7
         RcrlaTwIK7IJAKod4IIdFkcpBH9SSQYg6XQP60yRblqs03O5FrkvFCuHlcxtXTrmgGy5
         Fmp6JaLzZ9TrUPvawEHJrVH1UAh3d89FRnBtJCk2z1FXSUqyMZeIz+nZAA2Rx8uvFEt9
         Cg1A==
X-Gm-Message-State: AOJu0Yz0WAu6E9yNr+9Yn2/C9jYmpDiEfCDunYUYFAj+spxqR/Gdf+vy
	mqoa8wSQimQhIoQ3Dyw5ResF3gbj3HmbRr95ZH0qio7W1MLlyQ==
X-Google-Smtp-Source: AGHT+IG0TirBa98SQpIX2Hdl4lnpfCgzyQHdWiVCI1IaDb0GWmUzlC2LztTTiq3soJ5W//11rnS6g1wq5MWp1snplcg=
X-Received: by 2002:a05:6122:1690:b0:4b6:ba77:5a9f with SMTP id
 16-20020a056122169000b004b6ba775a9fmr3440748vkl.13.1705481516865; Wed, 17 Jan
 2024 00:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl> <19dca2a9-36e1-4a6b-9b65-db4c0a163d56@roeck-us.net>
 <CAMRc=McueRLdFJ_p-QPKPwFJatVXOG8hyeZKniAPGDBrNo2xFg@mail.gmail.com> <76bd483b-e48c-4697-8cbd-05a0346090b7@roeck-us.net>
In-Reply-To: <76bd483b-e48c-4697-8cbd-05a0346090b7@roeck-us.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Jan 2024 09:51:45 +0100
Message-ID: <CAMRc=McdyqDdaXv0Jb2ic8i4VkibgodAQ494ZKLhnF=pm7uabA@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 1/16/24 13:41, Bartosz Golaszewski wrote:
> > On Tue, Jan 16, 2024 at 7:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> Hi,
> >>
> >> On Tue, Dec 19, 2023 at 09:11:02PM +0100, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> extra_checks is only used in a few places. It also depends on
> >>> a non-standard DEBUG define one needs to add to the source file. The
> >>> overhead of removing it should be minimal (we already use pure
> >>> might_sleep() in the code anyway) so drop it.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> This patch triggers (exposes) the following backtrace.
> >>
> >> BUG: sleeping function called from invalid context at drivers/gpio/gpi=
olib.c:3738
> >> in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 7, name: kwor=
ker/0:0
> >> preempt_count: 1, expected: 0
> >> RCU nest depth: 0, expected: 0
> >> 3 locks held by kworker/0:0/7:
> >>   #0: c181b3a4 ((wq_completion)events_freezable){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x23c/0x644
> >>   #1: c883df28 ((work_completion)(&(&host->detect)->work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x23c/0x644
> >>   #2: c24e1720 (&host->lock){-...}-{2:2}, at: sdhci_check_ro+0x14/0xd4
> >> irq event stamp: 2916
> >> hardirqs last  enabled at (2915): [<c0b18838>] _raw_spin_unlock_irqres=
tore+0x70/0x84
> >> hardirqs last disabled at (2916): [<c0b1853c>] _raw_spin_lock_irqsave+=
0x74/0x78
> >> softirqs last  enabled at (2360): [<c00098a4>] __do_softirq+0x28c/0x4b=
0
> >> softirqs last disabled at (2347): [<c0022774>] __irq_exit_rcu+0x15c/0x=
1a4
> >> CPU: 0 PID: 7 Comm: kworker/0:0 Tainted: G                 N 6.7.0-099=
28-g052d534373b7 #1
> >> Hardware name: Freescale i.MX25 (Device Tree Support)
> >> Workqueue: events_freezable mmc_rescan
> >>   unwind_backtrace from show_stack+0x10/0x18
> >>   show_stack from dump_stack_lvl+0x34/0x54
> >>   dump_stack_lvl from __might_resched+0x188/0x274
> >>   __might_resched from gpiod_get_value_cansleep+0x14/0x60
> >>   gpiod_get_value_cansleep from mmc_gpio_get_ro+0x20/0x30
> >
> > When getting GPIO value with a spinlock taken the driver *must* use
> > the non-sleeping variant of this function: gpiod_get_value(). If the
> > underlying driver can sleep then the developer seriously borked. The
> > API contract has always been this way so I wouldn't treat it as a
> > regression.
> >
>
> I said
>
> "This patch triggers (exposes) the following backtrace"
>
> and
>
> "It isn't really surprising since sdhci_check_ro() calls the gpio code un=
der
>   spin_lock_irqsave().
> "
>
> I didn't (intend to) claim that this would be a regression. It was
> supposed to be a report. My apologies if it came along the wrong way.
>

No worries, I'm just stating that before someone wants a revert. This
has been a bug all along in MMC code.

Bartosz

