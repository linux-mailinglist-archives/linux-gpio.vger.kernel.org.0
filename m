Return-Path: <linux-gpio+bounces-17414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED1A5BDE3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2AE170608
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C11F235BE1;
	Tue, 11 Mar 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Torbk760"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1487A22F155
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688908; cv=none; b=MHZgZDtpjatJSvSonIPGwsvOm3et420jsbgPFB4Bq04/v0fEBdw8PU7/8sfg0Jq1rvxc0ZfzujG8sNpDIjZ9LvXhMNZbmTQU5Q5yBfXVK/ZxfJ9wyXguuotK/POsl89MLQlyi22hjL1ZdpXpH2LdTnwXJBNngERu88I+EWNt7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688908; c=relaxed/simple;
	bh=VN/5jNQRb0bApyfpGgoWLThRnOO1LnXfiDan7Ee3WX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFlui14LQ3eOFoJi5DAxX+QLSzPjokCOOTk1jCYuRWBfUPLWKUDyrwKQI/GSqdfgNjnev9DOf8DIIbehEH8kwS/AXPng2Zv3B0DntGhi3id9UoFIa/B1BF5u32zvu1Jxhr8qqyHZAt38GSi55aZdgAxgiODGJiq086W712uga3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Torbk760; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54954fa61c9so6051485e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 03:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741688904; x=1742293704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN/5jNQRb0bApyfpGgoWLThRnOO1LnXfiDan7Ee3WX4=;
        b=Torbk760x1S9icG653PKQSwCw+mot94iadMcWPqsg88uG+NLTAbPYLx6FF7vKLhFjO
         YIW+QYAmAbaVeYKO4PZ7OTUbpAW1GbyQPjD6UmL90ISiwFy9J1NM+OKqSFhxcqfDk4//
         9OSvxtRIaNRNhd4ZekUrjwSoIhblpcJ7owYLDZabElVw6RIqq7FDcNdPaLvUHM9gWA3n
         cpDt+aUsoNs7pmFm3K2WpJWDCd1coW+niKY64yTDMRdjgYRGvtuPIkxL8hBbXohjElos
         td/pb4nsgPBdY5KyT9bgPrBqpc1qSl/Ogv/pVuV17atdQiVPHTqRq/lFq5+5vQixOa7P
         8MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688904; x=1742293704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN/5jNQRb0bApyfpGgoWLThRnOO1LnXfiDan7Ee3WX4=;
        b=j6Uq8dG81Q9WaMXZVInT/npvWsZ+t+fxZ+Tji4lxY1VQr2ql3fVJUm88Vx0h/7E1Ua
         MX8D1xA4cnoU5mVOUwV9n2orOs57aq/ecvpkIvYzH5+APN1+qZJHbpAD5x1Du2LHM2CB
         pifDlXMNTCeiC8sVDv65ydTHm3IL0p2VhYrBqA19HCaZn0H6I69++7kM1BpCP3p2Hl5n
         2vNftFtnXA8qM9ZnJYngqcaZgGdCz2My9CDbGJfmHphSpAdDcq0JE+cN37xqjvV6TYKy
         U4o42RZrome0a9AS0kg+XPlPTWaUzuIdk3ViIdVeMXGLb6WD4Ybs88tLdsbLErbn/R/7
         83pA==
X-Forwarded-Encrypted: i=1; AJvYcCVXusSLdjmr+0JWcXYyblh3uAVP0MiKJUSTKa25xJUOpM8wm9q9JlLTcSIXn8WKrOOteO4y24fLjcLb@vger.kernel.org
X-Gm-Message-State: AOJu0YyCnA1xmiz4L8Wfo0I3qD9VmyHSbSOx/umvXweyqc2SqH8/mS2w
	bQuFXYPL7tlrTZXi5FINUIkEInj4tdt6S/wD/UsLGRC9/TVsDHf83GeptcOC/e1SNDsvWKhW5Wr
	luY+/MhsjzXit20abWRAASoxrKBMHY303JZKlcA==
X-Gm-Gg: ASbGnctQXXNFMKilCAyavFBYTkfdTdlz2+8MEqDJMV2uHZI0Y6b35Sh8SBQAR1qSQVR
	uViAtNGSm6L/Pr3ICVCmnRq516FzOfHGO9zobyVrE0yLD/yD6hWCZNR7DAUEaWqH4Nn1xlbJ+TD
	eE3/LXK/ICPFnXxbSHj7YBg7dpa/QM+etybD4W2Ifg09S1JZ/WM3ON2Xww
X-Google-Smtp-Source: AGHT+IEXtdgg+0Np+mlxwZSkHV7RSBRGpRMtDqSa/1GA2+c1oEEZJ2ShhmE32Urgw3dWFgrlLfzkRZQFc5yfERL5PkQ=
X-Received: by 2002:ac2:44c6:0:b0:549:91d3:cb16 with SMTP id
 2adb3069b0e04-54991d3cb26mr4681338e87.4.1741688903939; Tue, 11 Mar 2025
 03:28:23 -0700 (PDT)
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
 <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com> <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
In-Reply-To: <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 11:28:12 +0100
X-Gm-Features: AQ5f1JqB2G8J7uLJa6VDZeR4NGrXHr9gmDh4MvgDzK495FQEWvjGyzcbWVTAAmw
Message-ID: <CAMRc=MeqG9-15-KCpXc2NCqj9X3Hj2m1rjUmPWLNV3Kdzv_Sfg@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marex@denx.de>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> >
> > I think the whole point of the thread is that this so-called
> > sysfs v2 is supposed to be recommendable because users
> > want something like this.
>
> Let's keep it simple, and similar/identical to the existing API?
>
> Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> we can drop? edge?
>

I would like to object here: I really *don't* want a fourth interface
to support. I don't agree to a "sysfs v2" ABI. What I proposed is a
backward-compatible *extension* of the existing interface and then
gradual removal of unwanted features over time.

Bart

