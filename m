Return-Path: <linux-gpio+bounces-13810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B339EE41A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 11:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3873B163509
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B8D2101B4;
	Thu, 12 Dec 2024 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H/Q2HDH0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF85211292
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999362; cv=none; b=PCwHMHQFzG2WsZZ40f4ivBfeAw0qXBtXNCvE4WNeOZH5pi/ShJCoanLCmhqJpDv+oaF8jNG+nZx1qlPlO1TWQVCdA9bDJ7hXW/cDPtGMBBYwvWKV2zca7R3J6zAWkdCljwCaoujmemVsaHxxOi3Wnjkvn1dBA+gOTY+A3O30M+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999362; c=relaxed/simple;
	bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIJBZboyVi3CD6+hjiBBxagRD5yiXy6980OrsuSsfRX2PF0z47s6Z7MGu0y2G1eyGIDIBj5byMNOC+RkeG7I5d8DzYFyGLu2surLaXG88QmjGkPxxCgnkiQX4L/jPy5AV3cehltuFgag0UsyLe++IMJ7NaFHdEygL/cLV/vc4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H/Q2HDH0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401e6efffcso494338e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 02:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733999358; x=1734604158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
        b=H/Q2HDH0HBRV2/sPhMvMxj4gsuUcP/qJGF/ao069FSpE5LbZa6RYcCYPYrMA0whE2T
         l4f+tQIRstzzOOC9RhBDkdOVICe8xtmjBS662el58OVjeLVsn6vSJL+nPaBVVVbQeLE6
         QIA57MHEjX8EAcQgISwtYEdc7WLCA4aL1oYWzvoyQWrob9356mb1Q8sWyy/BYZXFpD50
         w1P90OaFIo0VaKoBGQTzYNEaO7KLfgMAMJkClvZr8oMgjRbXEo+Ozg7xZYKkZtVFdlc/
         QWitARsK/YTmE0pS/vAXJBPZ/0bHwIxqOJt4k2eG5UlwabzbsvsgDaxUYaKtUjBzCitG
         VsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999358; x=1734604158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHa5QT8JkD1B/JMzxQ4HqhQQvv6uKOMk6Hbk4+UNj+I=;
        b=BA+nShHraEqw6RCb8qc4RG7S28cITuBPcQhSJPUDRj5DzWut57Ee+hEczhmwMj+544
         2hw5MQq9xLrfAuH+cL9soGS1rzBuzE4mKzeWWvXga7yDfjzcChLbHNUzGyXurDM9+pCd
         EpxtNQ3uxrkN+jFrGUSdhblWOizGwRj+sEW0RiHklh8VDznobs2JhmfQMc7f1XyUAMmC
         /+3zsSkB/zDIUjeqXk+0v4dzRFezxOKTD2GS5wpiuCzMBl1Y+B0SX6/ApuMEYhzeAj+n
         m78YcXeTkyoggfyaG7texV+BO4ApBOyGw2ykUT71WHbv2bYvuai7HGXX00R1tV0UKQQH
         ggiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvFEiq4xVPtwL2T/Al0f0F5SlOtRhL64s7LjHpqdd/qjUzksNwA5Xh3dizZgmyz8XFxuD/DHwA8go@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0gI7RgJFhFC60iWcLohei8PzS3sg3KD9vfwZzLGuxmdfU1QV
	SKbRJVG/PFF0TPeGXUfV6tiZWTyU6EhqTY4xUt6UbWi1g4AEQBGj4RJv5EDYECBMAooCR6EeLqe
	84OIcIap6L7zdlBE10tfWu98dURJz9BlcHD0reA==
X-Gm-Gg: ASbGnctqf2vsGTRGf5YNaEOghmHC4ZP1RsW9nUb1L9HwxR0dK+S7WpkKYjtrXOU0FLd
	KWXrIdMy51AFhNFO5HA0eNKMBZh1DNoelP4DGwQ==
X-Google-Smtp-Source: AGHT+IF5MRQjPv1qupkMKerR3TJa8F5ojOtH623jRIzHbwh2Yva4cWRDsheROKwicK7oG1R3ozY2p7TYivltOFVglY0=
X-Received: by 2002:a05:6512:3a96:b0:540:1ea7:44db with SMTP id
 2adb3069b0e04-54032c2f4a0mr306284e87.4.1733999358191; Thu, 12 Dec 2024
 02:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211051019.176131-1-chensong_2000@189.cn> <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
 <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
In-Reply-To: <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Dec 2024 11:29:07 +0100
Message-ID: <CAMRc=Medmy5EqTUWuQ-4YrQamOArKOK788iAY-=Cy42Od7y_Sw@mail.gmail.com>
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:55=E2=80=AFAM Song Chen <chensong_2000@189.cn> wr=
ote:
>
> Or we can use devm_gpiod_get_array, it's pretty much equivalent effect
> in s5m8767 even without fwnode specified.
>

Can you use it though? I was thinking you need the fwnode variant
because it's the child (regulator) node of the device?

If you can, that would be great.

Bart

