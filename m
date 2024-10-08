Return-Path: <linux-gpio+bounces-11040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB73994D95
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64762286FFB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3831DEFE3;
	Tue,  8 Oct 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dk56SyGY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4D1DEFDD
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392802; cv=none; b=P7WGlevbJBqxJoX3YZA8U4DmW3M+ByvxR5Mdjxs4Sq0+TMLrrIiDckrDZ757lTzwjdbSQbemGr5kQv0Je4Kl3vj6bWhJg3bCYH/4s4ZfXrw1XNu/NmTxMc7OAKFWzqw5SlgjUqpSctpCaT91LIHv3lrLIPOH5kL+O2AwFjIOxT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392802; c=relaxed/simple;
	bh=DVROXGl8Sa0Yu4mCsME9XAd29XJS2duHOYsuSTf8Tys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nc7BNros3zgxF6oFPEno4n8tcySB33ps5zMalsXBXi5+VFGgcm8mJwZAdn3ipwgMncUzLbXC1DtGFVktLYmxHCvPeQXkXA2u+nCCpw38DEtBHSb9400noGgMmwGKWM8dunKIZOqixpmoQptg+Uq5Tnh617wftOZDx8MFWJ0sKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dk56SyGY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e33155fso6931119e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728392798; x=1728997598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x75xK/nK2Detutg2t7pTQ7FfVhhCeSOQhU4bxKho0gU=;
        b=Dk56SyGYvTuO30u70Yi9vq++cvMKLVSOoyrtNL4jP61O8lPWnc9qaP4wR3+goi16xG
         MF5V3JUmQmKevzp3G6TTejc2Rbghzl0iMZQhv0AH3JoNDtlHbzCmR/IkKw422pBZE4dU
         83QZywBxItsE8j5IDCTHpH3jLfEcU5VO/ZID+QkE3eeSH+oAeByzR5SxuW22nilspOrG
         kNL1p7KpRRPnwM44iY+bNi37woyTCrs2Tb7fSSBfZWoE+B9kIbjKUOFRW+6iwOX0/kzM
         32rpqxpX7qAYrypSEW2dSNBBzLpZkKvnndKKeDgDPnt9kwzTU9HB0v/8B1t0qaxQ11aE
         ZOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392798; x=1728997598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x75xK/nK2Detutg2t7pTQ7FfVhhCeSOQhU4bxKho0gU=;
        b=o6SKh8vfK0tLv1j6G8RQpfKcDJ8RjmbmKg4uiZKpz7a408NJiZsNvv74Ajg8hlxsCs
         4gfwG1SNlv2iXPXwul6UJhBlUq+BXRrSo+2Wa/F/dh5UMEOfHnXzugmukQTDQjqMvHpr
         JXR0IjZhNUUXIUiwGNLLMfg1XcyRwqTLhItenyUk9UdZIICLTPS79sYmu0G7KiNA0ghL
         wrqs0adZxriBXIKRj7W1nn7JAT6o9vaMu9SIYumAy8FSw6gy7UYdAcNXpJ/UritSYGCd
         jN1GfmQ4ySu/BhWrhmp+4Wiq3APhDSTlC8tLAtZTjdI6nVEfSuK5xiLw+IQxheGnbfSB
         OiBw==
X-Gm-Message-State: AOJu0YxV+IcVozhaAhW0NgelZEvJs/W7Yyg0mJH8mrI/VyNPfyamU/su
	one5XD6zhe6+3DvhTASsR02z6GPf3HbcLoTf/DCJ3EaYLr72oXL/k9nHRVRSZmK1/1SYKR9mk8Q
	9W5wkzaRF67THiyJfwpCdauESFEIrWZWaD6qGEg==
X-Google-Smtp-Source: AGHT+IEFj83X166WIbE5SR1F3xl08s9rT1B9sUIMgP2APMfCg27hoeVV61lOmyNIFgYnU09EoZauI1bJzRVYVjSq+AQ=
X-Received: by 2002:a05:6512:3b2a:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-539ab876e2amr8423662e87.13.1728392798020; Tue, 08 Oct 2024
 06:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB16034E0BC481FB633E39D28E9F7EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16034E0BC481FB633E39D28E9F7EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:06:26 +0200
Message-ID: <CAMRc=MfDm2DSUd6_XXsaz2uV2yPogyF=+4AP_2KN67jsBnWOOQ@mail.gmail.com>
Subject: Re: [External] - Re: [libgpiod][PATCH 01/22] bindings: python: clean
 up imports and exports
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "vfazio@gmail.com" <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 2:38=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> w=
rote:
>
> It's mostly just a convenience/cosmetic thing.
>
> All of the other classes, including the Exceptions, were exported, I thou=
ght
> maybe the intent was to expose everything and that the line Enums were si=
mply
> an oversight. I misinterpreted our conversation on GH:
>

Exceptions are fine, their names indicate what they mean.

>   Me: Right now, the objects in `gpiod.line` are hidden behind `line.X` o=
r
>     require explicit import via `from gpiod.line import X, Y`
>
>   You: And that is an omission from my side.
>

I'm not sure what I meant here anymore. :(

> The main benefit is that all gpiod classes are directly available from th=
e main
> module so consumers don't have to hunt down the import path for the line =
Enums
> or have extended type hints a la:
>
>   def fn(arg: gpiod.line.Value) -> None: ...
>
> or
>
>   def fn(arg: line.Value) -> None: ...
>
> It's cosmetic and can be solved with an additional import so isn't a huge=
 deal.
>
> I can certainly restore the previous behavior for these Enums.
> .

Yes, I would like to keep these enums behind the line package.

Bart

