Return-Path: <linux-gpio+bounces-17438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53488A5C735
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 16:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0202D3BAAE2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFFA25DD06;
	Tue, 11 Mar 2025 15:26:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6725DCFA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741706805; cv=none; b=OvHjrCUd0b4JJ+6HastnQE+lAlo9mAVxktewPqtRVVr6rCbRDhFYMHx28EicxDfRkH6MWGTeXUFIRA9ZUQ5yNRserngr8BOiDVHdQIIVOu1EmVYEtxR9iQqyCm8/LYgicimvCAdE8JiisC6L0P3tybH68YhOU8AwcllzkWaTYok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741706805; c=relaxed/simple;
	bh=Y6aiE0PNwEOzO7eDYA21Xw7f0kGjvKvb1F1Fsf7vdSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G43RWDJx3lBUvSaI2CxkAoIllXbdV0d41Zk1fc6YQLeQNjSEho7bZJrDPLRDYZM/ZuwHDZUYhlFsxqrdzVWjT/7YQABGVxQuxTU3iELFTUsZw19WHazn2E7lcj7MUoB4hXjdVvngZrTwA5tuGqIy8j21oIJ/w41C0orDXy3egdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso2442440241.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 08:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706802; x=1742311602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71dn95fDFv3oiazmJ4VaPD6pGhKsDUvRPMVd2bk7z+o=;
        b=ADmpInlsICapmfGUPYq8w63hGyzHJ6OtUFZG0PyeWVHYs/2hPkKvU5cyg633JsqTXo
         FYJ7c9JUDdi6+bO0ZBDlcjyNrS2ZBPn0xERbrxYis4kgH8BxSS0BySXi8T3wCtiJUkQP
         soHjc0EhRNcNyJRVgo68Q5NAqVNKGlgW2Okamqe7sbQ0UEgrCcJnJbHQA8ZU3ZzUKHGc
         f39+ES+pBLdoltWM6By7+yYAkSCgZ5Wj/IoP/TalpKUDn7P46fFX02za3N3CTsTAWtRN
         4i04DMwh2Sa86ngNMAvmusYfBFNiBNUwXz9L2UQ4GeeQQtUP2Dj/ZjaZGEmzV+l9ibw+
         eWcg==
X-Forwarded-Encrypted: i=1; AJvYcCU5DrfoFNoTkV6vKZwkoVfX53ulBy9NBWsK81DixgMEmih6bXTVno4ouSE6SlhMHmlEAy053e5FpRrF@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCUvzCy/CpVipQj6+pP3EYaykv7WQ/7oEvy/f7aateAJqlz45
	IqHcPDl4PdAy3xhDiegCjnVBWUEgLQp9LZ8leJ7BvA+ugV8Ip2N8UWW7Kk82
X-Gm-Gg: ASbGnctUzre0x3mKwTGCBGY6hnPKAoFbpOvSxXeICjHpbIHXtgBmBt0UDeami40TlKU
	gKJ/C8byOTP4F5Whkia6jGIwwHQD5LZS6o6WSlKP33bKJf7yfZPe6HUB+Dq/DbQT8WotH0fOmJ9
	dOqYZcppN5CoaLOYeRRt6zb6ilE3l7cLW1kxxJCDhQsBJUVX6Qn0bYnNBC1M557YgMcL+joW5tJ
	wzqQOpXI8LUiwYZpRC7j6W+5jai4n8FCRWDqsm53X+sJYHBHRdWda1U3V9FYmbg0YMTBrdS+b+n
	CySH97Zpr+lRdZfRdmk0edweCz0e+sVZanxXkx9Mi+6z2dViCkpytMeTbZgK5mMNl7tV0C6yhvR
	CEn9iwBo=
X-Google-Smtp-Source: AGHT+IEJuJsBZIzIfzJK6JeuTQBYr2NC90JC5LDU2SDG6ynBeSng6KNVawlLvwo+SMOJLP5LeMAH1A==
X-Received: by 2002:a05:6102:5798:b0:4c1:b001:b53 with SMTP id ada2fe7eead31-4c34d340ff6mr2997009137.18.1741706801924;
        Tue, 11 Mar 2025 08:26:41 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33cc83ddsm2339983241.30.2025.03.11.08.26.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:26:41 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86b68e51af4so2115120241.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 08:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOgu4Q8avMwMC1HtdG1ViQXyd+zvxExiFq7i74xK2KjQH1Ns5nrBrOJUblJB/bYji4PEYgE8sA54lf@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:4bb:d062:43e with SMTP id
 ada2fe7eead31-4c34d036959mr3760313137.0.1741706801068; Tue, 11 Mar 2025
 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de> <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
 <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com>
 <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
 <CAMRc=MeqG9-15-KCpXc2NCqj9X3Hj2m1rjUmPWLNV3Kdzv_Sfg@mail.gmail.com>
 <CAMuHMdXbEQDdgDie_EDbF8RrNejkXQrPxNmpvKaQcaAQFxWeNg@mail.gmail.com> <CAMRc=MeCR_PWQweEtS09CWq9SEi1FV+Lx_JQfWf7-=XMZY3U+w@mail.gmail.com>
In-Reply-To: <CAMRc=MeCR_PWQweEtS09CWq9SEi1FV+Lx_JQfWf7-=XMZY3U+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 16:26:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd2p4pD1vgzgznvbBNXGMjxJ_j0QF_Q5eqnoorG1ejbQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jpovp46Z7_gReoNKimLO_PJ19LxLzJYzoYo8GKSzEOGLnfGEtDu8hFdgg0
Message-ID: <CAMuHMdXd2p4pD1vgzgznvbBNXGMjxJ_j0QF_Q5eqnoorG1ejbQ@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Tue, 11 Mar 2025 at 12:54, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Tue, Mar 11, 2025 at 11:52=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, 11 Mar 2025 at 11:28, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > > On Fri, Feb 28, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > > I think the whole point of the thread is that this so-called
> > > > > sysfs v2 is supposed to be recommendable because users
> > > > > want something like this.
> > > >
> > > > Let's keep it simple, and similar/identical to the existing API?
> > > >
> > > > Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> > > > we can drop? edge?
> > >
> > > I would like to object here: I really *don't* want a fourth interface
> > > to support. I don't agree to a "sysfs v2" ABI. What I proposed is a
> > > backward-compatible *extension* of the existing interface and then
> > > gradual removal of unwanted features over time.
> >
> > That is exactly what I meant: do not invent with a new sysfs API, but
> > remove from the existing one, and simplify its backend where possible.
>
> Sure, just clarifying for the record because the "sysfs v2" triggered
> an alarm bell in my head.

IIUIC, "Sysfs v2" was coined by Marek, and dragged forward by Linus.

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

