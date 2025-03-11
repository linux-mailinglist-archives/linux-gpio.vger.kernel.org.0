Return-Path: <linux-gpio+bounces-17422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D9A5BFCB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840E3173CD5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659BC25484B;
	Tue, 11 Mar 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bf+L0Bjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C0250BFF
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694047; cv=none; b=ZJJtH3VVkzHMPoIhasyYGPhJPrwYjH7yT0lse9IQxITjBAG3xfvkSkGSR+6BE1K7Y6mIhXblbYUUgYEWH7MOaZVVlKRzm/8GovRYxon+oRYmvyduCrmZvjSg8CZIf0GvXGTD90/Uux6+NGhBSddFYnDk1OgwqvF6BGIKN+jFGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694047; c=relaxed/simple;
	bh=La5eG8fvyK/IY6GMN5SG/5ZsvCoNi4eDm5c3bdX0NP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utD7DphdL0cKCaT7zJrpOwDahn0yWoS08TnefKMcU4I+yu6b4Imxsp4VcHwTsu8ae72qhkJnSLhZi7uk7BGqDaXHjqoXH9SVB8wmf+V/MO+o12tG3q1toXOirpbwTzHVtmgzruk1Qc785J0JIDZ53gC3nvYfaBgV2oskePBBMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bf+L0Bjx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5165303e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741694043; x=1742298843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La5eG8fvyK/IY6GMN5SG/5ZsvCoNi4eDm5c3bdX0NP4=;
        b=Bf+L0BjxdxYR47BQzPXti4LeLM8BzE9OD6IQ4DzChVnbNU7QgSG9GrOMpZqM82hNCd
         ZAFGKZCvgLoekMCkL24BYDkFEaCVUfMUHj3t03lhLTMEGd3R3uwC85gytMIFImvuiR9L
         gAqxFnYN4C45zhoWT5A5yH3pItmPR4cpFeHd1Tb4J8sTzxCc0ApRqeJ0vkSt4fYQNF8v
         +Kd8r25AId25MycKbsSKe16AlQcIJAnC3fDUKfLiWiZLUwrzpUqUO6P7+3b3Qa+vEzOq
         4mnIrFE7sFri+kXxMY4bRdUwcv59+AAxtQ411ewKlAkWTWUyJjRN8T0UcbRLbeekEBGH
         pwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694043; x=1742298843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La5eG8fvyK/IY6GMN5SG/5ZsvCoNi4eDm5c3bdX0NP4=;
        b=iAwxKJLryPvHXYl8Pe/y57BfQaUeCeKdkebx3qCvQcLPaXEaUUwjT5O57osH2MC6yY
         iNbO4g8B/ME5D00BHPsYGI7Cube9SGn4oTCwW7jghxBk4Tmy1cATuk12XcyrkjsZwiXy
         WpuieRi+p7NZX3ES543zd8OkU6dc63yT3IavUJrBVNKXzyKfl1ioPXTOkWH2dnpjwtIn
         z3KQr4fHTkX+mVv4jULExM0EpwmayImhx3IioOOZzzafktLH2Vq2eKJO/tmXsfZF8TYE
         t2+pmItW5UbixdMRcOYnQpKSwMX1qy+/HtwPBzdjxuqaCrb4GqFPfqMzsCO2VpWqbSz1
         W/Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVTFU8VcOhGRN6S/owHaox0cbPF7c8CCeBvgsyhWQZwss4DmPb+RKpM6IYl+d9n+ft2FdcJFo3br5t0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWbqXBsKXFT3j3q9Rv/9VtC4yFa7nEwZUiCkkzDiTUeTzk96G
	SunaztPzs8Juzc6lIPD8gq1k1nRewagEH6phmfcpMSkbjWOYm6w9x2gbffjsvC0DYsu/zsVBzyM
	FUsn9U4PTrODc8AdRhr4DtLsOPXOKN2KQxUGrEg==
X-Gm-Gg: ASbGnctKywjJitewm4sxdXXBFtVYseiqLqJTwpSUoO4UcpnZo1BWz3gyoOwHKwyj1yG
	zD2UiWOYENLIsN2GWFzyqBsth1x/mIX/7bjgnBtTPPdizicDx8YTxK9bQnP3myd5zuJXhOqT0N7
	+NcI42pXmcbMPlUstOEjRsM2IMEYH3jXLJPDPLKLNTEY6x7+0zeR8l0XXv
X-Google-Smtp-Source: AGHT+IFXNzax13rvzdcZG1LjmWU/A3de7LaQuLQ7Nh2r6GdFcJ9/fxfoPRoneXDF4WJVSYzos1uHGOsC8N1WVu2rzNA=
X-Received: by 2002:a05:6512:1598:b0:545:e7f:cf33 with SMTP id
 2adb3069b0e04-54990e67727mr5275935e87.28.1741694043386; Tue, 11 Mar 2025
 04:54:03 -0700 (PDT)
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
 <CAMRc=MeqG9-15-KCpXc2NCqj9X3Hj2m1rjUmPWLNV3Kdzv_Sfg@mail.gmail.com> <CAMuHMdXbEQDdgDie_EDbF8RrNejkXQrPxNmpvKaQcaAQFxWeNg@mail.gmail.com>
In-Reply-To: <CAMuHMdXbEQDdgDie_EDbF8RrNejkXQrPxNmpvKaQcaAQFxWeNg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 12:53:52 +0100
X-Gm-Features: AQ5f1Jq8K24CVBbZ-H8TIlzVd3szdlmo1lGbrYP6F3Qkok6Ie7I40IlN9StBuhc
Message-ID: <CAMRc=MeCR_PWQweEtS09CWq9SEi1FV+Lx_JQfWf7-=XMZY3U+w@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:52=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 11 Mar 2025 at 11:28, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, Feb 28, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > > I think the whole point of the thread is that this so-called
> > > > sysfs v2 is supposed to be recommendable because users
> > > > want something like this.
> > >
> > > Let's keep it simple, and similar/identical to the existing API?
> > >
> > > Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> > > we can drop? edge?
> >
> > I would like to object here: I really *don't* want a fourth interface
> > to support. I don't agree to a "sysfs v2" ABI. What I proposed is a
> > backward-compatible *extension* of the existing interface and then
> > gradual removal of unwanted features over time.
>
> That is exactly what I meant: do not invent with a new sysfs API, but
> remove from the existing one, and simplify its backend where possible.
>

Sure, just clarifying for the record because the "sysfs v2" triggered
an alarm bell in my head.

Bartosz

