Return-Path: <linux-gpio+bounces-20094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACFAB5A8E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 18:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A95017EE04
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 16:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910CE1E3762;
	Tue, 13 May 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpVE5BNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501778F43;
	Tue, 13 May 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155100; cv=none; b=SvAJiktcFJykRwFzRwjb1tNGz+nFDQ99erdpQ9vwJ6l3JXUckE+TYeaABpkDJMGN3sCSQlKMxwohoDCpcRiBZHFFipjdFR+mace+E4SdRaVL9M5RF4zaf+ASdwcFQdJaJdKIq3U3Ot0/ieUZJq92uD/ieWRXMAmS83fv3voUBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155100; c=relaxed/simple;
	bh=C1hlnjaMSgVB4uMq9dvyHeUmhvhADJCgdI4coa9c/n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcW96508rzeIkWcZiD2G7dQbocCukur9owKDPgJYD/vtu9mLxXPefRzJY72mZWxkW3yGKPgOiBd6X1sGbs0Gdm4F8Ifj4kRlhp3IsJUlvrhHDUmbscXBVe85iw60E76pviHp8GvC1d4PuXKSjT4WSKlXKQTuXv3gi+VsaJquyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpVE5BNp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fcab0243b5so7302338a12.1;
        Tue, 13 May 2025 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747155097; x=1747759897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lr3Kw0x/yVyqdVwkR/x7lOZr5+jKaT8dfG2N3XLcaBU=;
        b=dpVE5BNpJyI8WPcziwATP9/3/Y4PxxcYkitw8e9rUx4cCnsSxLb4mLNEeJLa7X4CpX
         ql+a+H3R5+W3wSdGcRc9G+5hXmx3KWAu/A0Hj/IB9SBo+5CvpoLob47jUZyKD8hqvpO3
         tsebPdBdBM5NymYf5yeA2VPWpQJDEqOtbU8jvgEPDd9nkRr7jQXBZg0hgHbZwy+l2Zg3
         Qo4VF+aAd5Qx+/9Ltnjdyc+ysLmPYdtaKxKCvPF/Pj20cKKwvJb/2Cw9NJ7Sh/FepLjy
         9eMPOH0Buhe8uthlYnV0XmCGjAKBsIOqWRkcgvo+j2BweckPXznYqfMEzQsCHm4/YGFu
         bwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155097; x=1747759897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr3Kw0x/yVyqdVwkR/x7lOZr5+jKaT8dfG2N3XLcaBU=;
        b=hepUvrW2c/JapM3kcVBAdP0NGJvJOO+9MQhmUPqbHEIJ48f+wd8xfK2g3oVujdPFqR
         64Tdbn37rmhtAoQ+p3ZTHqpoHi5QdAccSDdT7dAF4nzEEMvhpvgA1eG7bVa5z4KDzbfd
         ojRdewVSjNyzaiM7nsluWILNTl6mbLRwDctOnOzvPXfujAiMTm+bukA5f1s6es/dxnkJ
         d0p+a9Ww5BTFA4QVba0Nu/vNQ5EteLsJ0UeReJqv7BNOxtzqGMVvIgsCMHbB09PX1K59
         kic0+zRGODZLg+wDLMCWLzkcdRY8KlEmVifnxFbNfaU59mawvClBj2ChB1hez0OIdjLu
         maRA==
X-Forwarded-Encrypted: i=1; AJvYcCUdLD9fmbLIaVUnT0ixHswQAiCuM6ZRJKsNtrgq6fcws9p+ldJGI60G5DnJeOxMuTWPOs1leOlU2xWx@vger.kernel.org, AJvYcCWSUMvVctYeaU9v6DR8LfH249SZnDlk+4kAQfSluJQj8K7viUto+ark2eJh+M6i3cBPKC2VoAVybpwYb4tw@vger.kernel.org, AJvYcCWSYv9xom54lIBHEoIPC6NiolNfPin/zEdTY9qRPP/q3pc77URp9G9zOvJRneIFZuQtqELZrV5W@vger.kernel.org
X-Gm-Message-State: AOJu0YzcVb7z+m+N2i/zm4752Yp/ouVhZxfdyUtNyOr+4Gc7c1VVbkt6
	xHBhq4BMgLAh6N6qoXJFtdlS8lGIbNmK2bxrrJhlUInnfeP1d9r3
X-Gm-Gg: ASbGncudLUkg+VoKPZ+50X5H/4Zzq5CjuZIRmYqpOhBufd+g2zNnaEMhcGlcZTGk21F
	w295VHPzpyFeGHs2qSwQwtsJjnLeZh+y9oZ75NXCejpj5/kyi6En/YbzPjon4AjefWSt+pJQ2AO
	cFIjdrsokRcEHGJrtEbYpl9DtHnz5+zsv8xsGZMWwK891+HjZ/q2i3l4BvbJHfZHVBko84J3cfF
	i+6TLLwkqvL8LuxCOgTBYQVkvcc4VUM77dXhkBPBx6Gk6tM1gvLG4UlNgCdXWrALzfoRygjEfYF
	kk4pAVI1k49K9C1GDIbVaQkQr1KotZhqj9nYnpbGmHPChgdwRAdMvzIHsisMqWx110SfQ+NAgi2
	Etbb5NbsscBKtVaqzWefX8rG+keE=
X-Google-Smtp-Source: AGHT+IH/7zg5Sc/5uwXax+BSgnLw8VJOscMNR0Z0aL72Y51/8y3j+/YyqVwH9Ycv88UhttHDrWRLxg==
X-Received: by 2002:a05:6402:1e92:b0:5fd:2e33:fa49 with SMTP id 4fb4d7f45d1cf-5fd2e433eacmr9014481a12.6.1747155096747;
        Tue, 13 May 2025 09:51:36 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc3f5dasm7449795a12.31.2025.05.13.09.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 09:51:36 -0700 (PDT)
Message-ID: <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
Date: Tue, 13 May 2025 18:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
> On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
>> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
>>> The series contains several small patches to fix various
>>> issues in the pinctrl driver for Armada 3700.
>>
>> I'm not sure all these should be for stable. Some are clear bugs, but
>> not propagating the errors has not bothered anybody so far, a
>> requirement for stable.
> 
> So we are at -rc6 so I'm not sending these as fixes to Torvalds
> right now unless they are super-critical.
> 
> I will merge this for v6.16 (-rc1) and then the stable maintainers
> will have to decide from the point it enters mainline.
> 
> Gabor: can you look over the tags? Once you have decided
> on stable/non-stable tags I will merge the series.

Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
along with the 'stable' ones? If I keep those, they might land up in stable
trees anyway.

Regards,
Gabor


