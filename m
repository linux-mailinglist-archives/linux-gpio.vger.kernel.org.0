Return-Path: <linux-gpio+bounces-14546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3AA03138
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 21:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE6A3A47AF
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 20:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4B71DFE37;
	Mon,  6 Jan 2025 20:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bol9V1FU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5F1DFE22
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jan 2025 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194603; cv=none; b=uxeO+c4CImA3d6L2DGcS5LjYtjO4Wb44T0znLKbqiMTgukbmnzvsT/MFlCE/TQZms9H/WdDzCt7yqC+tRLsEETzcWTOKHzNWjCliV+gQQHL+HhAIPDgcZmMcVnANXh+7V3Br+ZQ+QyK2zUFd8EE3ZY5r4/GQkj97MJRXNVtz4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194603; c=relaxed/simple;
	bh=YkYtqqCKRl8vK7tB/jQwPp5JWB7DeGIJrEhPyVWKKn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf658OaV6MTIk3RhMlLV0XvpfbxksdpWSgcCw6QJlhFmT4nzLLhy/TfxS+8sO+sxjXeh+HMLONsYYzmUJikCV0e8hc68sOx6kVH6pJqu9iQJk5JJ9YsPphPlFjrjtb19LvB06oMvv4A4Icgb7SlBNj7cTJILk95PbwW9UdukHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bol9V1FU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso14667183e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2025 12:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736194599; x=1736799399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d+Fdw+gn8d5UEQDtXsCn8NjpoB5BbsA0G5XapaHkLs=;
        b=bol9V1FUx0yZL/+x07fnzatSnFGaiiiR9iJBAs+A7gNXiMvNpaQ1Hv77ooRH5x531y
         ho1JEQCI6XZskxikvRCaA124yuXklQa7Mfl451DQWbStQsYFOm4BV877QtMQxDNO4D57
         4MxPufB1PX8RWUDNw5A1khqCoAfIq0Ry+YDlbqNHMf2krpEf+FOzRm6h5wYhRSAfOPju
         YEBTXKc53h+T5IUQVjUO0OwFcGMCfJTXR7anFbXwcM/V6lHUq0B52NfBu0LrHmEDn7xf
         2rjk5CGVhuyKSML56VpI0Kmd5FwzYzhd2GE7QjkorhpnKheU6HjSvby9dJE5IRS1Hj0E
         TyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194599; x=1736799399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d+Fdw+gn8d5UEQDtXsCn8NjpoB5BbsA0G5XapaHkLs=;
        b=JquXTybe/8XZ1Q8vs1fwggT7acKSRA6YdKcogieBc5zd9KYM1ddXYsRGJ8d9RRr0DO
         1iNFc47ioPeaWeZC/6O4H8Ox6Kgpe6DMvtkAlCeSCtig5S1Gt7jKXf5cTxvq0c+bJGZ1
         HUgGDBu34i723+B6Ty2w247lFPmHKitL5bDS5mOMlgVE3PCeXoZaW2fvn2dcgVczSB7c
         8T2p0WEM+InI3Gd+0tfBYTKpB5T1fv3tanzIPDaTwW02YCRnwBk1ZQ8v5GF3RfPGDSfp
         KCZ3r2XYXcXWAKJuNaZ75H5D771NzKQe5PouchKKH2cRS5zz5e52PUx/Ehd0z8U3N6Gd
         6Lwg==
X-Forwarded-Encrypted: i=1; AJvYcCWXOPEdgZCoJ71LM2iG++ZnzzUoJLooZRm4FZGWXnkyEkVwGPuZ6SqKTc6nvAqumC2JsOCDmPfg8jXC@vger.kernel.org
X-Gm-Message-State: AOJu0YwXyzBUygrbJt/Wu4z8lYuyJAX2SmniLqBZphnri2HU6ZmR34mJ
	te/q1W6E8g4dRVurLPiTZEwQKBTQi6WZ8a4HEHnO+pv1Cg6EbxBbcOechiY+N8hpmJE9q+ycW8S
	RBd+FwTHByWVHDT+Jo30Sdnl8H2mxz7YiNaiSgA==
X-Gm-Gg: ASbGncvuKPgrj8NbBIZFO2DIxH2417OpFrLH2Gw/YEjgQGBpVpY54MpkJaKdQuQeW6f
	oTmT/HzfVWElowapl4eUHeOgS3m9VB+4cuiLexklfVl9LyFh4QwzdrVXcQ47U6w7+v68=
X-Google-Smtp-Source: AGHT+IG5tBWpb7Rg63s3EUJvmIccVdw+1ODSCXEJ90/LYEJp9bT5bcWd70KaJ6AJVVK0Fhqy5kuobakOnOkuMInUY1A=
X-Received: by 2002:a05:6512:1110:b0:542:21ec:ff02 with SMTP id
 2adb3069b0e04-542295405e0mr17537866e87.32.1736194598036; Mon, 06 Jan 2025
 12:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net> <173593634037.257292.1488097273042214180.b4-ty@linaro.org>
 <CAMuHMdUqvTrSsiGuJ=VvNqsQm4eQs9rNTU8VBg+FzHJZxRnXow@mail.gmail.com>
In-Reply-To: <CAMuHMdUqvTrSsiGuJ=VvNqsQm4eQs9rNTU8VBg+FzHJZxRnXow@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Jan 2025 21:16:27 +0100
X-Gm-Features: AbW1kvbwV2i84p6yzPEy6vFTkfU_fVy3ia34sQ0a_M5WWwzr-4QtSHi0m1keVnk
Message-ID: <CAMRc=McAm3A1movK-8q67UbKuPb8FQzVwD_me7Q6x-gei2PA_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: 74HC595 / 74x164 shift register improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 10:19=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> CC spi
>
> On Fri, Jan 3, 2025 at 9:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > On Tue, 24 Dec 2024 09:02:09 +0100, J. Neusch=C3=A4fer wrote:
> > > This patchset adds a compatible string for another part, and clarifie=
s
> > > the role of the latch clock pin on 74x164-compatible shift registers.
> >
> > Applied, thanks!
> >
> > [1/3] dt-bindings: gpio: fairchild,74hc595: Add On Semi MC74HC595A comp=
at
> >       commit: 0ba6cec7acbb666d28998780683deb83a3e677e3
> > [2/3] gpio: 74x164: Add On Semi MC74HC595A compat
> >       commit: b1468db9d865deb5271c9a20d05201b1c0636895
>
> Do we really need to document and add driver support for all variants?
> I can easily come up with a list of tens or perhaps even hundreds
> of xx74yy595z parts that are all compatible, as far as software is
> concerned.  As SPI was invented by Motorola, the original part is
> probably named MC74595 or MC74LS595 (yes, ON Semiconductor bought the
> logic division of Motorola).
>
> Perhaps we need a separate vendor prefix for the 74xx-series[1]?
> The xx-prefix and z-suffix don't matter; the yy-infix for semiconductor
> technology rarely matters (there are a few exceptions, though, mostly
> pinout, which doesn't matter for software).
>

I missed the fact that Rob actually responded to patch 1/3 with a
similar suggestion (fallback, instead of a full compatible).

I can drop this series from my queue if it needs more rework.

Bartosz

