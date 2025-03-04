Return-Path: <linux-gpio+bounces-17066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28319A4E600
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA21817CED3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 16:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2B828D071;
	Tue,  4 Mar 2025 16:02:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8612356C9;
	Tue,  4 Mar 2025 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104158; cv=none; b=J0m+u4u8EKXHXMtA1BnUHpUEjz/qrN+0C3mPFHNtGGirI0c0ZihAP2F/EKXEuGQ/8IqzzQqp07blua+VEgjmf4Uty+R6YDHVMLpX7llzy2W96PD5p7bTg1i0q3kbki6bUgeHlVw46bnGshj0GhaTAXg3x8Id4a98lMH62XJCx9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104158; c=relaxed/simple;
	bh=D1LkyfRhE+4q4GnLe1NDgQGmZdZtQaKJPjx44GsJp3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJvIeAWm7K6xid126MiWa5DeyRtPTc0++qzcHCZKOIzYZIkvej5cd1PGko9UcI08N99D7MoLzaf7Y7Ltsek3erw2HphfB+WoW5KjKm3wnxBYtWJyg/ItV1toc9Q5K+Hc5db/GbGFKrZCSnENicZ/fCVLaWJJkzmD0rzb2MY6zfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e89063f754so43164116d6.0;
        Tue, 04 Mar 2025 08:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104154; x=1741708954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZedOmGnO/WUt3LVfOx/mchan0b5xgDqWjTw3G7ppsA=;
        b=nFl/RGq4x2EqnDt/bkXuXfoDn3TzdV+/8JRVy9ysaV39j8gcK2pqex/UMJByVgcWPo
         1c9pDiKwRvtAn9Mz8Fioa/IvdlhI9AVG6NfCsKeNTfsz4lsRMJBhzuz2kwVlU+S3SAOP
         +q0tRzO4930ZWvo3/ylaPbhC1pEbdBsctM7YBMHr3JLtIvHH+dzMXNwpT2H07jUzU7Bb
         YgoUoFygL/ruoWkvCMOwVhu2+HI6hYZF544WZspFGycvoD5424BLYInYvH09Tg3mSsw3
         LC35QmzqiZMwulq4c+hqVnvZ0xoLNv/hAyctTcfcKuutfRMY8wRODphj1bn9bJXV+FrW
         wknA==
X-Forwarded-Encrypted: i=1; AJvYcCVrwVtVhM7EGIXHxxIjSpoaK6p8j5RSdmgmppzMYyrw48KganM3Tuiuke1NL3ZAafTRvh/8rfdqs2wWJTkkXZdPVIg=@vger.kernel.org, AJvYcCVxrS9OCtTNoTjGInRxXt7eZtiKRkL9SBAo6EAASOLgEOMOj+qeeLj2i57p36a2jNlJprv1V5JHgDeh@vger.kernel.org
X-Gm-Message-State: AOJu0YywlScngRmVagjQpIGOElu4iy2QOGoHLstLjRB/UE+aZjC54M33
	lqQo/GfV/H0FBthgsfQKNphF1hms3/At8SFwxmET6SQUpmcZ5Atpg0DIsHRx
X-Gm-Gg: ASbGncs7XQWM+whEFaFO9f0uRR3t/pthlG+TitWBE3wsZwVb91krkAvMfH5NYkA2UXM
	GbUDsD2CKRrZ0C1pDmQ+mGfOwtPNkjH1g5cAosPdLZILGR7LJe41OqGZLzfGVHBTikRi4vJBue0
	kj20fobUcc+0FKytJAqzOjb2PiI4A1JG6hW8Wvul97LXcK6vk+3HMuKpCaRnRZQ2WOGTJF9vq1Z
	Ep1LYYKd09g2cSzhYyEThA6W+eimybogKRUZ6F6GWpkgdYUXNISz2UWICdtoMhhKfrI48XQiDEi
	g3aC1TwN+E9mCrvAvOGOy7K2gDhMzUTHuphmPNHbGnJszn0jdoXAnL2sdI5LIFmgnTE1oX4qaw5
	hA8Yhieg=
X-Google-Smtp-Source: AGHT+IEVfghHHcgsOBIc5SqPmyAwn46QCt/f/oxRUkVbkNCJ6A/vLCePd6vRIbXppp0mO9W1nyQ/+g==
X-Received: by 2002:ad4:596c:0:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e8a0c87aa2mr265522746d6.5.1741104154472;
        Tue, 04 Mar 2025 08:02:34 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e897634c48sm68373846d6.6.2025.03.04.08.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:02:34 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e89063f754so43163876d6.0;
        Tue, 04 Mar 2025 08:02:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+BcRAOlB0AmAu2jvZPvwU2v5y0iL4lRM0TtCfc9rmHp9Sj3vMf1ikrqC8v2k6QBzY1mjF310sd8rNwJid11gpd1c=@vger.kernel.org, AJvYcCXAwWhf6oM+7ag8Mh8lkrB5mXJEZU4OGIcePB+5HUVPeNDO0uqk5aCVFwV+tqWV/pN2IBscHzGPkaEn@vger.kernel.org
X-Received: by 2002:ad4:5f87:0:b0:6d8:9cbf:d191 with SMTP id
 6a1803df08f44-6e8a0ce2c6amr239892866d6.12.1741104153854; Tue, 04 Mar 2025
 08:02:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV1ucHtbhWGEjTeCim7zJ0QQo1CDu3DPTeAruAb72q9Kg@mail.gmail.com> <20250122172707.GH3436806@ragnatech.se>
In-Reply-To: <20250122172707.GH3436806@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Mar 2025 17:02:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQetSZt+MUcOQ+EnCdab9wFdOTK0PgjHc1uS59SpSnnw@mail.gmail.com>
X-Gm-Features: AQ5f1JpJXH-K3r_7IHZlrBTodNR197PWISicSlglzCNMMARIpTZ4troAjGtzVSY
Message-ID: <CAMuHMdUQetSZt+MUcOQ+EnCdab9wFdOTK0PgjHc1uS59SpSnnw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 22 Jan 2025 at 18:27, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-01-21 15:49:59 +0100, Geert Uytterhoeven wrote:
> > On Tue, Jan 21, 2025 at 2:59=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Use raw_spinlock in order to fix spurious messages about invalid cont=
ext
> > > when spinlock debugging is enabled. The lock is only used to serializ=
e
> > > register access.
> > >
> > >     [    4.239592] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >     [    4.239595] [ BUG: Invalid wait context ]
> >
> > [...]
> >
> > >     [    4.426274]  lock_acquire+0x1c4/0x33c
> > >     [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
> > >     [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
> > >     [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8
> >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> > This indeed gets rid of the annoying messages on various R-Car boards.
> > Unfortunately  I now start seeing other scary messages during resume
> > from s2idle/s2ram.
>
> I think this might be symtom of issues in those drivers too. As Claudiu
> points out the issue in RAVB was discussed and fixed by patch [1].
>
> With this and patch and [1] applied I no longer see a splat when
> resuming on M3N using WoL.
>
> I still think this patch is correct, but of course the bug on Marzen
> should be fixed, but that is unrelated to this patch. Would you agree?

Yes, I think we should proceed with this patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> 1.[PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

