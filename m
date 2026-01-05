Return-Path: <linux-gpio+bounces-30170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A89CF50A0
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E3E7304EDA6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B5131B81B;
	Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih9Qw6lz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124B301010
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634719; cv=none; b=FPY/irrtYXk7SlgF3aqR6/VL0osfeeCm8fvBh4VtHMQu2RQS4tLBjo3htQgf8uRkR1GQHnmshcG4U30Cp4SII+/nKDDXmaMRqBZ+6EB0kRgKIGROap3Pwztr19/BMo8dsBTZ1Z/UpAKXbCptOSOzUMpyGwe9DFTuoAs/6iswbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634719; c=relaxed/simple;
	bh=Xp0i1Ix8i4EVXbO6cbFPIEaut/C7zGARDQHbCBH0TDs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUxhTH0l2xudMScDCFOoDol73aSkJjAHPkUzoa7WS0I43SjRtQgD+uoedcn9+92h1IXjbq3TNsaJCmO+2yLFzCOaNoSZKTgP9mpCHjFuewYHpVgL86pirwR7v1tg7ngtSr7ATT0qSIoqask10XQa80AfgrkY37TkHN5j2jiiI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih9Qw6lz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D81DC2BC87
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634719;
	bh=Xp0i1Ix8i4EVXbO6cbFPIEaut/C7zGARDQHbCBH0TDs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ih9Qw6lz1Sko5fL7pFLbomG8nmlCZWV5f7VzhNkCv3qefRr8/DZCKpPozic2neoTd
	 Xw4fRybgZh/FRbdFzVZ7KJ3VUaI+bO8UXaC0hYJ6BHPod+ZT9Fbf54stFIjt889hVF
	 JrGDcMSZtE2iEZp6xZj9JnTOSTTs2m75dLdvvRvpmnYM4/IqnM5c5fRWYDDFtGfmU5
	 buKtj+8Sw+3eOCb2sKEA4X7KO3Dgn3T6udqPNwd+kNITAJjjP5Wv1CZDkGPCa7Ftr9
	 GnV7m7L+1R6UyMjEMJ0APffCchNsz13K5mszzy3M2J0GHXoIaUObJ8m0lFNZY6a2Oa
	 N9eikJpKN+0jA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37fd6e91990so1345721fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 09:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXs1F+Cukj/0krsNBUDLPRa7uDbkyockzq3SoKolnHflJiHNwPnIy+h0BaqpVeopRnr38/LwLeC8UHS@vger.kernel.org
X-Gm-Message-State: AOJu0YxscNVd1Zuwma+ntcu0Oo+KnayQPRKijwz73oKIPuJIEiHTashN
	1XlELIUtgI6r4QS0F5Tmb+OS70n824cSQE27m/i45GiZLscxXsqsC66RC34wkH2oMsQ7dLCGUE3
	kyKH7Cqrjrdz0v4Y5KlezFNQh9KokLr8D2ROJzjU65Q==
X-Google-Smtp-Source: AGHT+IG6SIPigJxkJHInO+tkcsToIW/YovjrsTkuD8gZ0NGaSCdwwzyT7wEbNisz6v64WdN2v0/svdmJHeaElAERj4U=
X-Received: by 2002:a2e:ad13:0:b0:382:8844:2080 with SMTP id
 38308e7fff4ca-382eaabb736mr255161fa.25.1767634717790; Mon, 05 Jan 2026
 09:38:37 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com> <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Date: Mon, 5 Jan 2026 09:38:36 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-Gm-Features: AQt7F2oSq5mFA1y8aimNhkWa6uJgJwLZMRBreFji3RmTtVrRuRT8uL2rJ5zqO0Q
Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jan 2026 18:28:23 +0100, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> said:
> Hi Bartosz,
>
> On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> [...]
>>   mutex_lock_nested+0x24/0x30
>>   pinctrl_get_device_gpio_range+0x44/0x128
>>   pinctrl_gpio_set_config+0x40/0xdc
>>   gpiochip_generic_config+0x28/0x3c
>>   gpio_do_set_config+0xa8/0x194
> $ git grep gpiochip_generic_config drivers/pinctrl/meson/
> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
>  =3D gpiochip_generic_config,
> drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =3D
> gpiochip_generic_config;
>
> pinctrl-amlogic-a4.c still has:
>   .can_sleep =3D false,
>
> Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
> was the intention to fix "all" Amlogic pin controllers in this patch
> (which would mean that the change to pinctrl-amlogic-a4.c is missing)?
>
>

Yeah, I missed it. I will send a follow-up tomorrow.

Bartosz

