Return-Path: <linux-gpio+bounces-17063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00504A4E544
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5BC4213F8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BC327BF65;
	Tue,  4 Mar 2025 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXZ7XMBl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292A29DB87
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103349; cv=none; b=m2jMsYLYx5S26FymMB6kzjY9g5+wRHQz0G2kf4NjYvLo2hdViKrKrvoNcP/Vk+/pAarMHqUCECxv1o9d2c8X9SJPPtSR/Ez/69ghPRgiNVaRW9xHUmN3kVYoQjsLMj/k7mUO5Z9YIkvVPsM6+6njz1Uvx+ewU0C1rfM/Hz9Rl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103349; c=relaxed/simple;
	bh=UUs8ERBGg88VD12tctrsBCPHVg8T8rEBK2VnQ8MhNdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8iCaY6DfChcfu0M+drSZdBoReuuFXrjC9eFVtj1JvvXRTSyPnNYSR6yvgZSByENf/iJYZH/Yf7fB/gtmo8iUsHKFVmem/EWTz7qi64DZF04cCvIET59x+e1BRD7i4OB35EC9Mes9GztJ8550zxqzkWD8VYd6l13MTMD6sHjlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXZ7XMBl; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30b9b1979b9so46853881fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741103346; x=1741708146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA6n7Tk6ZRco5Uoy7ute4MTebhJQTrRMnucOQVIkMHA=;
        b=NXZ7XMBlXmtI7i65UK+fNrecBDFEdTRwOgplhgHHQDTNto/lPGvawZflTWREBpD8Gs
         +sxDx+AqVpKZX+y9PLMg5aX/eRWIbGnRI4pF3wvHeQKhIWTiT0rJkeI0yi3ZY9lRvhed
         WO/Irv4LecLvnynhbzZXTamBNMeqy0FoVINkKaWFny3rAtBzvUVIQEYYeCGqfySuo5MT
         rYAh50QwDz9izAkx5F34H8GyLrcThXBhPTzLqcPnyhv3pKlcGqnzMTu+YalVc+gnRuya
         IL/nv7jnNkK1IGvSQnlw0fGqjL079Wd5YzE7tHZsfBqKmFKcSN5lorkSEnMTKFlkek+T
         X39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103346; x=1741708146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA6n7Tk6ZRco5Uoy7ute4MTebhJQTrRMnucOQVIkMHA=;
        b=MEXL7ViOKXyWbxKcPzhrZiPsrDAoRTYGdxgeP2xWZK9n6WGCwPVuUKfmh+xtRtzY5d
         9J9lnTZP2lHH6PJ82HfgWRtfeqoerog0kh02LXFkyjCmKnKJTNFj35ZmRj8j+fOPSnBp
         oHyLCPyTwTBtuXO1YkzmzHlv+02nJF1P225h+OuFRQXzU2qYUooNuwNn4gZJnNfc+o+K
         c+/OA7/8fJ2TNi88Gvl8QQQ6oeJlhccynDkbxNgeS6umnRFDLEa4/IffHENiyWMlVk/y
         CE+LKNdbbpgQEpqx0SdsCYyJPxgrjJHa5ez6QXtEsWDSvqOh/1lmplTGrUfMsqZH09gM
         aY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiaURwvm6CiGZ6dYGp+5XeznEdPCsqsgRQ81mpwdRvQeQ+7RSOz5KFNKSHX8tBYertmP+wCwTfos4v@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZVkmsyYMfrWfSXdx13lnpsw8CvMeysLnmw2ryHc31SNAkay4
	vPr1Es+b+2lDuo1wThCT7CtGqoKfiSyR/B4eXLnpRmrYaIAX4Piqxu5jvaCt9WSy0mMFmHjSSNY
	fOY7zTm7O3cVh6MqsAx++3kZVJucjsawlFYziBg==
X-Gm-Gg: ASbGncshTNClMLf+P/gq1qE5bg5xBp0FBpN+hoRJhhLl0NmZyK25WGCsJK/I15atTad
	+WK/ZrjJYFwdUUCx7nwIZ08MmqNdcE4jDgCo8Y4nG07SE88sJcJ53YnrnyMMe0pEkJCdhe8VGlD
	Pb8bfDgg7gD2op5H+OWALO2YAZpHaoEK3eCDp2oqb5SVGb3ZmbjUPfZuD4KQ==
X-Google-Smtp-Source: AGHT+IGNYxY68hSY04NHeDnGF45WuYW30TweqyCBwT2x9jUZoSI7dfONpy9h4GhUJmNMztNWJp/TupvscySj3TQu+14=
X-Received: by 2002:a2e:b890:0:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-30b932531aamr67179271fa.19.1741103345563; Tue, 04 Mar 2025
 07:49:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org> <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
In-Reply-To: <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 16:48:54 +0100
X-Gm-Features: AQ5f1JrZSN7a9veGHD2nhdiFznQ7s35dZW-f_2MRRUu_xgWuisKdFa1xTMAGa9g
Message-ID: <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 4:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, 03 Mar 2025 09:41:40 +0100, Linus Walleij wrote:
> > This drops unused includes and converts one Samsung
> > codec to use GPIO descriptors.
> >
> >
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/6] ASoC: samsung: bells: Drop unused include
>       commit: b19d340d5d08c5940ce612c2a1b5fe3a8a401f9d
> [2/6] ASoC: samsung: littlemill: Drop unused include
>       commit: c4b2d9643a06a5326a778c4d77d6fa60e0f3d6b1
> [3/6] ASoC: samsung: lowland: Drop unused include
>       commit: 5c06f7f3d8374df1cec3b353306a4d1032a60f44
> [4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
>       commit: da9146c19b1774926148ff271c4a3dc8d7891b18

I pointed out an issue with patch 4. :(

Bart

> [5/6] ASoC: samsung: tobermory: Drop unused include
>       commit: c095b7a27529d1d18b3b36a47f77a1419f0de939
> [6/6] ASoC: samsung: tm2_wm5110: Drop unused include
>       commit: 0a22454ab2eca530702b2689858909b608953703
>

