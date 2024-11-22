Return-Path: <linux-gpio+bounces-13186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3A9D58D7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 05:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18D411F22ED7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 04:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7620515688C;
	Fri, 22 Nov 2024 04:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZrBBP1+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211EB13AA38;
	Fri, 22 Nov 2024 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732250311; cv=none; b=XgmI5G+n8FKr+gXk5yzVHUc7rkbBmfUQiS0QMIGOoK0f9z+hh8xvMbKiP5hllDXUCnGb7f9HY9WjiUlQ9CiTWFjbVbESt6pOcOnaQPlXthrh1WHiWzjXTA1MU9soR/0AFmOj9LYsUSA3ygIzaqoWxa+BU9TTTLnq6LxNlo0phr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732250311; c=relaxed/simple;
	bh=yutVhNyr1EwpByH5fLGKop/h66NESLQzEwEMOCv1igs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DyAADtTxizJaOYTCteafL594zTq9ehBrTlo02k4NcRpUssRtDPCd3ImSbwCC8Fbq/cug7vNLYK9k29EaT/QQ/PeVmDBKjHd3CeNY5XBkgdp+HEIwka9f+8tprgDICyvP3NofJtt1ykVRzPWZ4onh4IthuMqmdYmvvFefhRWcE4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZrBBP1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5205DC4CECE;
	Fri, 22 Nov 2024 04:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732250310;
	bh=yutVhNyr1EwpByH5fLGKop/h66NESLQzEwEMOCv1igs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ZZrBBP1+ckE2dJi1lJ63U0pbgcUEnys3ASUM4phcfN4vZ2D++9cYVcDESZm++8cHM
	 GNN9T2QujrSlX3NCIhXYz9+28gK1EaqN5ELGg5tDgg+/WDKW7c7tH1nj7l8VnzySAz
	 +JviqaP4H/HdIETX9FT7BAVmq99khDLjBlp7Vxvm9tQh5n2skGCgeWgffb24TJLiDt
	 WNQkZnwpRnzqsIYpEWJL0sAmtn76YRhALbasEXy+InxWN6WscMvOsgIc7YsKouNumc
	 ChLiR2HDivTNAUODdGBAAPFpyPqx84xB0vZc9V9fGSf+61J9wwsgDDIjQOgf6Z1R/U
	 /x009S1Vbv1/Q==
Date: Thu, 21 Nov 2024 20:38:27 -0800
From: Kees Cook <kees@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Linus Walleij <linus.walleij@linaro.org>, David Wang <00107082@163.com>,
 brgl@bgdev.pl, tglx@linutronix.de, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, geert@linux-m68k.org,
 linux-hardening@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Fix_a_potential_abuse_of_?=
 =?US-ASCII?Q?seq=5Fprintf=28=29_format_string_in_drivers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2024112031-unreal-backslid-0c24@gregkh>
References: <20241120053055.225195-1-00107082@163.com> <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com> <202411201008.5262C14@keescook> <2024112031-unreal-backslid-0c24@gregkh>
Message-ID: <8BEA1444-469F-4276-AB04-0CF7C324916D@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 20, 2024 11:28:35 AM PST, Greg Kroah-Hartman <gregkh@linuxfoun=
dation=2Eorg> wrote:
>On Wed, Nov 20, 2024 at 10:12:40AM -0800, Kees Cook wrote:
>> On Wed, Nov 20, 2024 at 08:35:38AM +0100, Linus Walleij wrote:
>> > On Wed, Nov 20, 2024 at 6:31=E2=80=AFAM David Wang <00107082@163=2Eco=
m> wrote:
>> >=20
>> > > Using device name as format string of seq_printf() is proned to
>> > > "Format string attack", opens possibility for exploitation=2E
>> > > Seq_puts() is safer and more efficient=2E
>> > >
>> > > Signed-off-by: David Wang <00107082@163=2Ecom>
>> >=20
>> > Okay better get Kees' eye on this, he looks after string vulnerabilit=
ies=2E
>> > (But I think you're right=2E)
>>=20
>> Agreed, this may lead to kernel memory content exposures=2E seq_puts()
>> looks right=2E
>>=20
>> Reviewed-by: Kees Cook <kees@kernel=2Eorg>
>
>Wait, userspace "shouldn't" be controlling a device name, but odds are
>there are some paths/subsystems that do this, ugh=2E
>
>> To defend against this, it might be interesting to detect
>> single-argument seq_printf() usage and aim it at seq_puts()
>> automatically=2E=2E=2E
>
>Yeah, that would be good to squash this type of issue=2E
>
>> > >  drivers/gpio/gpio-aspeed-sgpio=2Ec            | 2 +-
>> > >  drivers/gpio/gpio-aspeed=2Ec                  | 2 +-
>> > >  drivers/gpio/gpio-ep93xx=2Ec                  | 2 +-
>> > >  drivers/gpio/gpio-hlwd=2Ec                    | 2 +-
>> > >  drivers/gpio/gpio-mlxbf2=2Ec                  | 2 +-
>> > >  drivers/gpio/gpio-omap=2Ec                    | 2 +-
>> > >  drivers/gpio/gpio-pca953x=2Ec                 | 2 +-
>> > >  drivers/gpio/gpio-pl061=2Ec                   | 2 +-
>> > >  drivers/gpio/gpio-tegra=2Ec                   | 2 +-
>> > >  drivers/gpio/gpio-tegra186=2Ec                | 2 +-
>> > >  drivers/gpio/gpio-tqmx86=2Ec                  | 2 +-
>> > >  drivers/gpio/gpio-visconti=2Ec                | 2 +-
>> > >  drivers/gpio/gpio-xgs-iproc=2Ec               | 2 +-
>> > >  drivers/irqchip/irq-gic=2Ec                   | 2 +-
>> > >  drivers/irqchip/irq-mvebu-pic=2Ec             | 2 +-
>> > >  drivers/irqchip/irq-versatile-fpga=2Ec        | 2 +-
>> > >  drivers/pinctrl/bcm/pinctrl-iproc-gpio=2Ec    | 2 +-
>> > >  drivers/pinctrl/mvebu/pinctrl-armada-37xx=2Ec | 2 +-
>> > >  drivers/pinctrl/pinctrl-mcp23s08=2Ec          | 2 +-
>> > >  drivers/pinctrl/pinctrl-stmfx=2Ec             | 2 +-
>> > >  drivers/pinctrl/pinctrl-sx150x=2Ec            | 2 +-
>> > >  drivers/pinctrl/renesas/pinctrl-rzg2l=2Ec     | 2 +-
>> >=20
>> > Can you split this in three patches per-subsystem?
>> > One for gpio, one for irqchip and one for pinctrl?
>> >=20
>> > Then send to each subsystem maintainer and CC kees on
>> > each=2E
>> >=20
>> > I'm just the pinctrl maintainer=2E The rest can be found with
>> > scripts/get_maintainer=2Epl=2E
>>=20
>> Oof=2E That's a lot of work for a mechanical change like this=2E Perhap=
s
>> Greg KH can take it directly to the drivers tree instead?
>
>I can take it all, as-is, right now, if you want me to=2E  Just let me
>know=2E

Yes, please do=2E I will send a patch for making seq_printf more defensive=
 separately=2E

Thanks!

-Kees

--=20
Kees Cook

