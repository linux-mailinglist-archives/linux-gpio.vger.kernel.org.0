Return-Path: <linux-gpio+bounces-30101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F836CF0D88
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 12:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F54E300EA30
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 11:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0DD2874E9;
	Sun,  4 Jan 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cg7UMARt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C925287265
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527099; cv=none; b=Jsk+TEmAjs18kLS7ta0Za0GwBWkozmyD1gDXQ6LVkkHRQfTg1eUZLpAlXRbEz6OE92WfBRzXIaX0VTOZn5A/QyMHPbjNRzGxpqRAN0YPmWnmdGTdHXqofBTuJUbkcuWEV5NBVXLuCDe+L/lnX2SOb4OvcQnf9b6paJPTmVCEzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527099; c=relaxed/simple;
	bh=UJmd/RUuc8kvXGdj1yLXTt0tcEL4280vqD8fV3f882w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz5YXGID9LsxgsB2TKCGsUnrZCaJnb2EenirIS8XCSveTbvqL5AlrWcs7YhKlA3DdJm0PpP3co+8huh51TI0D0bsVUNLscB4/HueE1fXQCGDQm9seRtf+xvvFZ5vQyncotyx5KWnf6OpT5eh/+bkbIgtPi1a5MtUrj/LzKf8hTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cg7UMARt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDD8C19425
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527099;
	bh=UJmd/RUuc8kvXGdj1yLXTt0tcEL4280vqD8fV3f882w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cg7UMARt7QUJwPWBD9T+bOjhUn6d/+c+hNn0FR+uMbWvqrb7/n9MLts7caS49DJkF
	 OQah1x368eMjg5W21HTv1Ef9+DHSCbLVYph3jX6D5lkWKi5qT4fdSbErocHRthZJz4
	 X06hftKfXtkkAz3/BIX0Ageje0ZQh6EmSGQ8FL9SCO2gSJo6eayH+9jHUK5fyOPE3/
	 JQk1DnogBQ8uEQB2oUv0I32CBnpuwQw/+JBp3+sZmIrKbQRVJjNIdCT8AIGiNVMlnH
	 7Mj/NT/NQEk6FHxkB2CTf5aXKmCrSNgaHwOjhqUdwlJak51zZDPkT77xXzn3LLYT20
	 lgdyEfkCD4AcQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fb5764382so100329947b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 03:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcsG7oCbBoWPgy/qAM3GgTKB0e4JN8BlAl9HOlCL4GYbnMw4Ix8Mk0omSyay9f+c4msTP93zeyhsrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzb3YKa4bDRTnebW34u0pmr8iseLMc923Iptxud7+0VOLl7Ys
	Cu7fQ3hbk0pNRT7KiV+zUZSGhIf1avfmOL4xmsxghIblucsRJYcIJCa6cmmMLIeSZ/gD0urQg2/
	pq4GL1FIu6mrqvZl6ydzZl/0D2D9Nvs0=
X-Google-Smtp-Source: AGHT+IEg3DaZt0YbBBc1tGezgqWn4TsJbUX2OEwOcSIQLrbHB84o22MN0yY/1FtAcAVCX+iV8p02b8Dygwa19reZFf0=
X-Received: by 2002:a53:b163:0:b0:640:d174:3839 with SMTP id
 956f58d0204a3-6466a8a66d9mr27719698d50.36.1767527098556; Sun, 04 Jan 2026
 03:44:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
In-Reply-To: <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:44:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
X-Gm-Features: AQt7F2rYL5D4zs_GjxYPSmiyYP8LYXnbe2QAtqp2dHlaiukECPzoU61iv3jhlis
Message-ID: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 3:46=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> I understand your preference for standard bindings.  However, there is a
> specific constraint here: the RMIO acts as a secondary layer of muxing,
> sitting behind the primary IOMUX controller.
>
> The existing Rockchip pinctrl binding uses the vendor-specific
> rockchip,pins property for the primary IOMUX configuration.  If I were
> to use the standard pinmux property for RMIO, the node would contain
> mixed bindings like this:
>
> node {
>      /* Primary IOMUX (existing binding) */
>      rockchip,pins =3D <1 RK_PB1 16 &pcfg_pull_none>;
>      /* Secondary RMIO  */
>      pinmux =3D <(RMIO_ID << 16) | (RMIO_PIN << 8) | RMIO_FUNC>;
> };
>
> Since this node describes a single hardware pin configuration that
> requires two separate hardware settings (Primary Mux + Secondary RMIO),
> I thought keeping the secondary config as a vendor-specific property
> (rockchip,rmio) alongside rockchip,pins would be more consistent and
> less confusing than mixing legacy custom bindings with standard pinmux.

I see the concern but I would say two wrongs doesn't make one right.

The DT binding people will have to say what to do here, but ideally
I would say the primary IOMUX should be modified to *also* *additionally*
support the standard bindings and deprecating the old rockchip,pins,
and then you can consistently use the pinmux=3D<>; binding in new
trees for both pinmuxes.

I understand that maybe you are only working on this other controller
and might feel that the primary IOMUX is none of your concern,
but someone has to stand up and take the responsibility for the system
as a whole, if no-one else then the Rockchip SoC maintainer, else
we get throw-over-the-wall-engineering.

Yours,
Linus Walleij

