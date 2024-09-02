Return-Path: <linux-gpio+bounces-9537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BD9683A0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04E8BB23BDC
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E061D2791;
	Mon,  2 Sep 2024 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fQJmJfM3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC944C76
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270625; cv=none; b=XEHJt8AxDouKB3rWbfVfqf8h851U/u5GecLZUpGsXnqK7SrqODIkUKiNCfMJDp0oy7DvANcHAk6KsAndhE8VwhBTQVdE9xsBoPBYNcejxKzKQR/Tode2e8ccGaqjhidyKm4SlztMWosry0KEvMhXB3c9FjCSUbpHzjif7krA3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270625; c=relaxed/simple;
	bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvgzNVmyIC/1MprzG3+tBg2cd+bDYfcQQySQuYhrTn5594WXW5/ZfMY3lspk+ZAZDGFmI55SvxeIm1YrDUw7VNX1LYA4EPPTiWpeWPVT7AWrV4In83JCAv2nc7d78CkMHzCf+GoW1h1er7Nkya0OlcujstLje2RlndkYxX60FIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fQJmJfM3; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so46765611fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270622; x=1725875422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=fQJmJfM3bxDIA8JgfCiwG8tAZrBQpb0Ta8h1hshKZR/wqjq8diVlFu3v5wISePnfmr
         7CBwrfOFTRVhSJewyZjTjigC0RqpomBTVN7QrNfKtcsOR9kLdYYPWKm/xL3K5CcZjogK
         8eV3kqoZVehKa/zqDVIwTH6JLClY8E2mi2bJO5KZT0gLHe7/vnRqIFEhmjoXVZshTDGN
         aUTOIkcOesVnEmkHqGnZKjzw5vLC13Xk6kCSratOYjSB5z8sJRDKsdYV2ugLwJWvRcmf
         GqD9OniP1NrpiJnZrUlQtKPQIWzpDjXVdFO01JdJkHWA6RkPANZYkdrsyiML1wRyOkSD
         0Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270622; x=1725875422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=nO5WaUHormUIbv9tgau4CWLd9vWaSYPfyrbC50PgnXXljTgKv8f55enmh95pfbyQWb
         gYgv7yMpCYobC1Bsgh4qTb6fwDPm0XsFyww2xr+z+bwk7pY40Umkv0dzONd+V5wm6D0a
         jCY4GsykDcOKwGwcyXCCt1raGAKh73I+lx8UEPMUj2swwX177r8dS/KZML2jNkjk9N23
         huePP3Klt04ax6ZKjrXRqQu6K5b4rk3DsHU+9/MuOy4YWjHmLqkDreBwHb8TicqqvWcI
         KF5FQNa32j5FpRBvNbOA7TR/eq71eoDXimly5vq+CFcCIWr+VtQ5apXNIQiWqRgWIh4a
         9/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiJwTnr8PX5ZG+QmIoX34EwBK9NWRKCf6XkQGvUNlWPl0y+52/v7TtsZV1Aki5WCRdWZmQJmsiT6jP@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIO1Q9C9RW+2XSn1RGp3E83WRm63X4kTJKZ9GFp4dZuP7lx6k
	sKB0givQfyjju7/k+jJuI7llfArlB21mblkKeHTI1L5ns0u7Wq4nzjb0W0eV8Ac8MVTOTWajytL
	BNGKqmJio0ginDT6c76wRP9VzereZIU1xr/b4jA==
X-Google-Smtp-Source: AGHT+IHzAjC82O5fFXZUuxREWWYMeyebjNflKtG1tJUMYRTIdDHBfO7anU/6cm0HwOYbXK/491VB93Nh9ac09yNZ/4I=
X-Received: by 2002:a05:651c:552:b0:2f0:25dc:1886 with SMTP id
 38308e7fff4ca-2f636a04470mr20450581fa.10.1725270620988; Mon, 02 Sep 2024
 02:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org> <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
In-Reply-To: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 11:50:08 +0200
Message-ID: <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 12:32=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>
> > GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> > properties would be allowed.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I suppose it's best of Bartosz applies this to the GPIO tree with
> the rest of the series?
>
> Yours,
> Linus Walleij

Ah, I picked up the GPIO changes separately. No problem, I'll pick
this one up as well.

Bart

