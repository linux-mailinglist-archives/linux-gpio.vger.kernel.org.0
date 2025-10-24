Return-Path: <linux-gpio+bounces-27577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E960C04B24
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7382B1B829FD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5160B2E0B68;
	Fri, 24 Oct 2025 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="do0n/H+0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44B2DEA71
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290455; cv=none; b=fqdxSOeunmbn+Mblj3HDITAIHi+6el7t5a6wlcf/6TNnTo1bduCnSKXLGu9Ydh4DQMUmNFVqZjSO6wecA2de4hzRl3hK9CsZpj4Ejnu49OEU7gxB6m1OldkhEWgdT2nSD+TgAxA7JVWcct/lk/Zqxz/Lxre2WBOgLYdC1ACLgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290455; c=relaxed/simple;
	bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDlwFqbEc/wH89ns0gZ3zK7QOI1wBdkcj/RD5MOPQZeLYQ9PAYnRal1v5AGLIiGxfP2naM/lqCDFCWGdwFtbTTeE39+41/JSSbnyzA+scj818QaGSF1kdfIQpOKp2hdxxZayWGZCQr7bAwJELhGjHm4iQnI2+sYEQLDfSNDXNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=do0n/H+0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2028405e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761290451; x=1761895251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=do0n/H+0YBdSMkTq7sBSXWn2/iExuSH4K0sIPxL9iTSfguBIyMA23Lt0sQVhm0PSy0
         0xOcYCLnv24GEMyEVQXR6ARjMO7Mu8VwfZzGGYTd2CkQ7DgrYJBnTyT8tXGIFBZcd+2z
         /7Aupadl9J7Add8zraBmNJfaTmayqpTtIQYwASfQ+2z9NaRvc8O2BOMxiTcgGNNatDjn
         aTy/UOiUjqg1hTXOt2qLk0r2MeMWkvJxIiPlV9sv20AD3ZIonIu05vFTjISc4bFpTg6o
         fjK97f4HJYjgLkswp9aaoSnhY2zJs1fHeFRj/b/czuWD1FFNJTn+X9mHV6UEvyS/RjPm
         4qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290451; x=1761895251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=QalR9QOYGOJAGwiddTpwk46mjUFhE4fw+VDpAAYu1EOpxMcf/PwefhW+o/eH6kAwkt
         7NoqjZEucCeUu9wyAxm2kIKI50/mapirvLsa1M4Z0oSfpVccxCklevbS71BihtxFoYJu
         7Eh0KI7zuo+He1sVfG5AqT6aHpskUHS/H623bAmAUkJOXg0B+Bz9a7H5xuzQc92Ysx+E
         Tq3o+aAsA+fiEz5r/xYn3dgPSZskEf9WZXMJiCTqhZraOKC5dFutha5rf/KH4qLAjPQs
         9urjrZVVDVsdfB3ncH4JY/htbdiapd9okCM4wwEhuselGBepUmusHdjL8MDu1AG2/L84
         4bnw==
X-Forwarded-Encrypted: i=1; AJvYcCVASYxajQHtUENgRY6r1ZhU6mWjvzfzg9ugDZXYgx1jX2Yb8jgbCN7oVpS0/AwV9stGPNBOT1TcejrD@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGeH/wdqxak8VerSmsomBjifDZR0W4pwbTH6ALm3cOokZcs18
	Q9neTKkvEWjt7UDq/LpoMjt3rqqvbRji+HXHReEXV6TTwVmLTUEWyUZH4/X9/bmoElYxpN5A92n
	vhCN+9X77Zijl3/iENWi48rPy7vPeYxuRRSoswnvNqQ==
X-Gm-Gg: ASbGnctxXYv0l+F4ZJ2DuGV2qc4fw1iu7rS0/5hs/5NJgaz2x5XxCaIKG3DqLzN5832
	HS75WABum4cY/t3xR+kA0W2RR6MMS1m/8pj2io6L68HCT2SxtxR022B1Bn2TY4VRpA37rcsAeDl
	pu6z4AIdot3Yxg7uTMK2UEMCvDNO2dlkYEt3TxehtbRTYriCo/U8smVo9Pr3D0/2d4+n7Qld1eR
	77U1D0Ycx/j4eVB9b9fo0qmiGBT3soeWOmUtCGHe/DLD7NadiFAB39lkT/5dfD5APNDs2ifisbF
	9ssRzhNfe3eqrnjgJyao9BbU3g==
X-Google-Smtp-Source: AGHT+IH0zdKNAnAn0HY8zeCAL8aa1oecPklr3WTZJPyPQRrZZ9JAeaLToU97/5gWoSWPOCpiqMgKR7gX6TBItcaDYYE=
X-Received: by 2002:a05:6512:220e:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-592f5f9f709mr1849794e87.36.1761290451029; Fri, 24 Oct 2025
 00:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
In-Reply-To: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:20:39 +0200
X-Gm-Features: AS18NWBFHHtshqZfLTmGnpCECipG6SuC-vURJ7Hpik3InZgpuKVx4aYTO-AzQUA
Message-ID: <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 9:17=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
>
>
> On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> I had few stabs on this in the past, all got somehow derailed, one
> example was:
> https://lkml.org/lkml/2019/10/30/311
>

The main issue I see with this approach is adding an actual device
node for the shared GPIO which is now not accepted in DT bindings. We
only create nodes for actual HW components. All the information is
already in the device-tree, we just need to scan it which is what I'm
trying to do here.

Bartosz

