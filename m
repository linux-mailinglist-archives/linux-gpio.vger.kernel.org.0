Return-Path: <linux-gpio+bounces-30104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DFCF0DD6
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 13:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B27D83005A81
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 12:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D072D28CF5F;
	Sun,  4 Jan 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlDVT1Qi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB352673AA
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767528044; cv=none; b=E28fPxZO10Z2JDl9U6aNI/GpySZgelLFh8SK0D8Pb3zvbK12HGeYtRxK8DUzre2W8OQfDID3VZA+95nME7lbjgjjxVhEiaaXqkw2C53h3QURR3nxUTtI7NghXx0y9LCyhLQKcjxWtqRSvTQZSjDfoSeGGoSA+Duo/rfghMg/W9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767528044; c=relaxed/simple;
	bh=gk/O5/8TMjlT+wpe3vNH+tG/DMBud2FXxDco5ugVk+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOjKoLIXm2ozYgdxfr/0dXvRLJZh9hLZfE7HucrhTK9gtEzYiHRM9c8X4wdZtJTjvt6ggo3pkB3PiLFbW/yfCp5Udft7XKWx667bVdomCcaKePyxGaDKk6WOc/sGPbojdWP06L2pcVMIU3iWcxrfi4/4KO/TjCdQT2ZYCvP6X/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlDVT1Qi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A005C4CEF7
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 12:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767528044;
	bh=gk/O5/8TMjlT+wpe3vNH+tG/DMBud2FXxDco5ugVk+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mlDVT1QiOwDEfe1eqQ3t6OAtcw1k0oy5smmcPpJ4kxyr3+q90ttSwWtdSKvvC5rS7
	 BokbEN7YBv4M3/G4kuBooAa6eOUJvf27Z24/bhQKA0Yx5pDwth4TKHxgt0OjSpWOyD
	 PcfTJmxk9AfHc6UzZGfLlnt5eMn1LrV0V6mcr/s1ugXv7JeAozXkzT4qtSqtAbyYBQ
	 EhXkfXN4TgMJu4SJkD1cfdmXLDzR40l8wzYdRfxi3OjcALbyyGpaW1klTct9AsBIoO
	 gk7JhzQZjJvL0vWK0SrJz2hGNtDsPdszNl0WA0W7ZEchgdYvFJHtitonLFOLkuoaZR
	 4S2nP3mbiffPg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fccbc683bso99612207b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 04:00:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7g+Fgn/1ldr3npVkk4Xh+Y+zN5XRTRfuYrst87kbPb/dG0KtFcxnI0qxEq8oyG6YHu+DJKmO/VYzB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4uYfZeFYbPDeZSZtn+VhBet8m4bknQ/c8b2c7UMcBGw3uGxxN
	xn5mLMWUtwsrnnHbFnJ0Gb4nTuDlJS0jmpIkwqtStcuY2PfqLPS5RkY4qzhS1SVITpHWGdSp3Zp
	yju4XzrTivtkJHK36lizI2v9r1BJK+8k=
X-Google-Smtp-Source: AGHT+IHRIvO3ksa3QLYzzJfkSuNK3DEv4ik61urgIslLHNVqtp8kyS2NMIh1/AKMplqEBnEftxOF3QWj4wCPJzd1mUo=
X-Received: by 2002:a05:690c:3612:b0:781:64f:3132 with SMTP id
 00721157ae682-78fb409d56cmr309348707b3.64.1767528043622; Sun, 04 Jan 2026
 04:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-8-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-8-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 13:00:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKoOPCKRi9hvqqH54g1MYbGiK9r7pMi+3z6yHG43nGFQ@mail.gmail.com>
X-Gm-Features: AQt7F2rYDZXFYhSLsCcm698mZHPaUMrH9YKco-_ba-MTp1nPcf5WWSnYw7QDXME
Message-ID: <CAD++jLnKoOPCKRi9hvqqH54g1MYbGiK9r7pMi+3z6yHG43nGFQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Ye Zhang <ye.zhang@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ye,

thanks for your patch!

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +&pinctrl {
> +       rm_io0 {
> +               /omit-if-no-ref/
> +               rm_io0_uart1_tx: rm-io0-uart1-tx {
> +                       rockchip,pins =3D
> +                               <0 RK_PA0 7 &pcfg_pull_none>;
> +                       rockchip,rmio-pins =3D
> +                               <0 0 1>;
> +               };

This is just adding more and more "necessarily different"
pinmux to these poor DTS files.

I would do this:

&pinctrl {
      rm_io0 {
              rm_io0_uart1_tx: rm-io0-uart1-tx {
                  iomux {
                      pinmux =3D  <0<<16 | RK_PA0 << 8 | 7>;
                      bias-disable;
                  };
                  rmio {
                      pinmux =3D <0 << 16 | 0 << 8 << | 1>;
                  };
              };

If this requires some changes to the iomux driver to handle pinmux =3D <>;
as well and some code to handle subnodes for each pin controller,
that's fine. It's just work.

I need the DT bindings maintainers word on this, especially Conor
who has worked a bit on standardizing pin control bindings.

Yours,
Linus Walleij

