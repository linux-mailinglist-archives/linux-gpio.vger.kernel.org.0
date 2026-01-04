Return-Path: <linux-gpio+bounces-30103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBDCF0DB5
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 12:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 718DD301B498
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 11:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56431288C34;
	Sun,  4 Jan 2026 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLJTDnXk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171412882AA
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527652; cv=none; b=ep6TPCh75ibyP2rao0+UAF6IEWZRUBZbeIKe10GIxFRDozxfLq7ARRtcbPwVU7yoHpK/mnAMZXDLzj7+iEEiLh3eP8shethpMY5jgN8NYnJMpmHlrXJ+U52xsYfh+a2ZJq0FC/W90eONCrx4KKIBOY/8lBOz5M9MPmbaMEE6FZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527652; c=relaxed/simple;
	bh=AcdRLvhNh8FGlzW+TOR1NqwjouA0EJJ3chB+HVQXgi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeIMYl4AlCGHXOIxmCgNJ2tIMxBrc5lBK7mRDwZJs0qtf6cJ4XEAv/RUeh54xpJYnNUnTy/Ab0PZxjdwo719XXZK/yHRm7hJOhmb3IFYL1jmgqVwnpV8DTv1PvX12TfWfgyiqGDXlp03n/4J1VLO01HVZcWQ+oQ8XFpmMw2elEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLJTDnXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADBFC4CEF7
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527651;
	bh=AcdRLvhNh8FGlzW+TOR1NqwjouA0EJJ3chB+HVQXgi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sLJTDnXkODOe54DMJPdkGdMjK7+W+FDQTWtC76a2OPbF207Hkfy5bx3ckBzBHKLyj
	 miINtekufMc9Ljcjnt5+rNJTNLzXcdnhtuQF47x2zhdZ2ECk4b6T38waUlOnrOFgrj
	 s3u5rkHHFyVr7bsYCLT4eML3Yc+t2dq9DHc7SMNxcdbIlB9vgCdC6Y8+EFnDdtqxWB
	 fkawMUjfVMEl4FA2xWwp/j6l4V0XzCLT7dWLYFbd7npCTAIVIzObe9BANJ1tcCSCI/
	 juq2qYkAD2upk/VXWejTMWDF/faqBP4zXoZAupF/51fJs0q2QOMwC+6JPMe0mK2rfE
	 IAnF8Y50bOxvA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fdb90b670so84188367b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 03:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkvaBiDSAYp/bjdbQQmmHGhV41QBZFSuO9cOVOLp2ga6x9eOw3uWlkK5aP4ClOz4ld7rIUC/pAbceq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KNqtYjG5OdNxB4GHg+YPTolq4MXXvUvWIiKIEJ1+Qud6icvA
	gHZoc9VMF89jkEwEFtYEj5Oug48mzdzsVN6v7f2W6xk+c9d8n50ohll8r4Kfz0ChsI95V2q/O1z
	LsHk7LayiLFBPbstV3Fv0DE3ihPFczf4=
X-Google-Smtp-Source: AGHT+IGi7QFbFfC9+u8deXvEkGUtUoDMSC7p+FUi+Vu2ikgFZWwDkuLdG6m590kIpmNyayCsx7hnVPTUXHZ7MMSOHHM=
X-Received: by 2002:a05:690c:6c08:b0:786:7aaa:a070 with SMTP id
 00721157ae682-78fb400fb2dmr389515767b3.10.1767527651098; Sun, 04 Jan 2026
 03:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-4-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-4-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:54:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWRy_i7ergPouu4LK+r4g_a-ry+iN0m+jgSGn3+Zhjdw@mail.gmail.com>
X-Gm-Features: AQt7F2oL3yzobHab3UPIxoHqEHXwAO3naOHfp6yFtxa1dYpd6Lg-Kfe1G-jLF64
Message-ID: <CAD++jLnWRy_i7ergPouu4LK+r4g_a-ry+iN0m+jgSGn3+Zhjdw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: rockchip: rv1126b: Add pinconf and
 pinctrl dtsi for rv1126b
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ye,

thanks for your patch!

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +       /omit-if-no-ref/
> +       pcfg_pull_none_drv_level_4_00: pcfg-pull-none-drv-level-4-00 {
> +               bias-disable;
> +               drive-strength =3D <0x2c>;

Normally drive-strength should be in mA, it is very strange to use hex
for an SI unit.

> +&pinctrl {
> +       aupll_clk {
> +               /omit-if-no-ref/
> +               aupll_clk_pins: aupll-clk-pins {
> +                       rockchip,pins =3D
> +                               /* aupll_clk_in */
> +                               <7 RK_PA1 1 &pcfg_pull_none>;

This looks better as:

pinmux =3D <7 << 16 | RK_PA1 << 8 | 1>;
bias-none;
drive-strength =3D <...>;

It's just weird to have the phandle at the end of the
pins creating something "necessarily different" from what
everyone else is doing.

I would change the bindings, driver and whatever script
generates this to use pinmux.

I understand this scheme looks comfortable when just doing
Rockchip all day, but as subsystem maintainer I need to
take into consideration how this will look for people working
with multiple SoC:s and maintenance, and anything different
from standard pinmux =3D <>; is just a big pain.

Yours,
Linus Walleij

