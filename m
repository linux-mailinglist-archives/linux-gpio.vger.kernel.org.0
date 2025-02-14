Return-Path: <linux-gpio+bounces-16033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EEA360A2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 15:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504D83A9F93
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8953A26657D;
	Fri, 14 Feb 2025 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qnv1zqqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D952661AC
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543884; cv=none; b=CBYbhIhQnScaQnq8UGefPPLg7H1+bnUMYqCRFPK0xQ5r7nxRvty0B3d0NrC+lCuVOl8Imnyu2RAfxOAQDRp8U0QN42GfvUHel0iv2iI5QCXAnE7zr31LAVbSzM2P4O4cr1BCZ+gU4HatlVGVAkijFTcHgqAeOnNIjNqFyTmzC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543884; c=relaxed/simple;
	bh=VWb5MkKgJlcOONgIwkXIHXhOHFOwyrjuHcEUQBNf7xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuQdpTis2Lq92bTMmYFlcQWN7meyuHFBYUTyPw45R2TRCpO/VWF8JvUxDiAUZa5OVfaipYsl9nigl6qEC9IQ8wZijvho9AgUg5qMfXw2Mf2vhZerPIYmiytMr2dcoEv+U+HAQRjvCl6kzYn4mD8s2HFlshuXSgdTTw9Iy/kih8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qnv1zqqw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5450abbdce0so2214451e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 06:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739543880; x=1740148680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/nWo8rBImm3/oJoY9sZaYO485tQZOmVynsCXssfwwk=;
        b=Qnv1zqqwxfpLkHSKnNaLKIKFbyg75JB75IxlrE/h7+F420HlaTZ+0ioMQqu2R3G8A9
         5BJeHLjkdJ4Scs8zR7CGNgrn1Hq2yd/8rzx8/FHm8o2m0+iSIHobu5RXwXHJOEN9Vyp0
         SG9Xb44XbjaJ+UPIykTyGaUtMahI5L88E5Klr1vxbfJsvmfp2jLQMzD5iRWAMaCyiKXE
         6FSSEAfZew371SuTnJ+cCy75G2ljIMVUnu4y/5SjXLvz07kBlQFjaxGmZSDawf+GVHDY
         R0MKJDjjVisJNvlmVmHX4BYB3sTGMCbeqY5bS6GMgHTk46GF1+7BSId+Gd+MVbhRZ3yZ
         KeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543880; x=1740148680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/nWo8rBImm3/oJoY9sZaYO485tQZOmVynsCXssfwwk=;
        b=f1E+LN/dOuJnovC2mwnWe0uuic97bFEdDoHXvEXAxcRLX9BaJ56ohk//tqft5ZZJGe
         aP/d4btD6YUqN19ASnJDHBexYQJNwxW+hdtxaUxfLAGdutpH2kuqLE4UAExdfGvGLPXd
         Vsax+U3mICAyYQEfErhiC1RSxhxd2VF/cJU1UAYoyU5Co2nG6inN++hF6l5jLupYL7nD
         /g/s4DxWDOpyX0wuMMi6K36ou9EsdkRJItreSvHlBUSrda2LT09YLY3pst2iEcbUNial
         sOR/1WqJgVGBwYoG0H7Mewa3VCe3JoyPVb3wHmmw7w2C1Bv3XCDvk80Zr6wYvq7l/Vyr
         5TfA==
X-Forwarded-Encrypted: i=1; AJvYcCULx4uus7NNbcutkQtS7FOGOXc/rLxNqnK3saAe+J2TnY8jJCy7rGwzUW81nGNZuL/rSVV4uCRWLB1S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1eLw6EtW5rwNG5wwHv27iZm/+clMQLo5GzJoQaQTChWVnXQZv
	YNhC48zQf26lFZVQwlWJJF5MACX6Rabv40pEK4yu6E2DOYrZzV6LhzMYVK72LLPg/4rX/Bg+hEg
	BqhB8/6ZAl6i0EZAh79pexaTZXygxw0GmsdeCzg==
X-Gm-Gg: ASbGnctLSG3iPHPJdCpuH38QWJxkD5knELfkhX2Os4ZVIUVV/HWDr7AtO+qFOzpihi9
	HQsO6Sa+Qz6z6b280sANfyEoFNqbCIN7W9mo8k8HS9AFjksTsJ83i27K2mwzffsbKc6FRpF+2Ns
	apGHAIJQN3I6+UigfKNyc7w3WGDDY=
X-Google-Smtp-Source: AGHT+IFI84zGNU/5Prn01Vy8fWHPKleDbw82zc5GSdSgL+oYsNCtPFeqOqBeE0yzBu7Mgzm4cA6Jih86DZ3F3f8DtA8=
X-Received: by 2002:a05:6512:ac7:b0:545:1049:eb44 with SMTP id
 2adb3069b0e04-545184a2edcmr3543131e87.36.1739543880482; Fri, 14 Feb 2025
 06:38:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
 <173952845012.57797.11986673064009251713.b4-ty@linaro.org> <CAHp75VcjAFEdaDQAMXVMO96uxwz5byWZvybhq2fdL9ur4WP3rg@mail.gmail.com>
In-Reply-To: <CAHp75VcjAFEdaDQAMXVMO96uxwz5byWZvybhq2fdL9ur4WP3rg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Feb 2025 15:37:48 +0100
X-Gm-Features: AWEUYZmZOOzJ-2PYVb-j2HjRho5iTG1Da6ZcvH4AymKKHcJZkPFSmjChMriWUzs
Message-ID: <CAMRc=MefPRs-REL=OpuUFJe=MVbmeqqodp+wCxLCE8CQqdL4gQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 00/15] gpiolib: add gpiod_multi_set_value_cansleep
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, David Lechner <dlechner@baylibre.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-sound@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 3:35=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Feb 14, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Mon, 10 Feb 2025 16:33:26 -0600, David Lechner wrote:
> > > This series was inspired by some minor annoyance I have experienced a
> > > few times in recent reviews.
>
> ...
>
> > [07/15] iio: adc: ad7606: use gpiod_multi_set_value_cansleep
> >         commit: 8203bc81f025a3fb084357a3d8a6eb3053bc613a
> > [08/15] iio: amplifiers: hmc425a: use gpiod_multi_set_value_cansleep
> >         commit: e18d359b0a132eb6619836d1bf701f5b3b53299b
> > [09/15] iio: resolver: ad2s1210: use gpiod_multi_set_value_cansleep
> >         commit: 7920df29f0dd3aae3acd8a7115d5a25414eed68f
> > [10/15] iio: resolver: ad2s1210: use bitmap_write
> >         commit: a67e45055ea90048372066811da7c7fe2d91f9aa
>
> FWIW, Jonathan usually takes care of patch queue on weekends.
> But whatever, it's not my business after all :-)
>

Too many conflicting suggestions. I just picked up all Acked patches. =C2=
=AF\_(=E3=83=84)_/=C2=AF

Bart

