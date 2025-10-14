Return-Path: <linux-gpio+bounces-27081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925FBD942D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1550F35325E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E6E312823;
	Tue, 14 Oct 2025 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KQNLuGlF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx-relay151-hz1.antispameurope.com (mx-relay151-hz1.antispameurope.com [94.100.133.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AB4312830
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.192
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443878; cv=pass; b=ph7RjHNDy+nJHqQAPTNTqn7yQ3uEm/XY1b3MGy05fWJwe5OuS4xh40/P0DPm0YKX9GDgbJ6SNKshwV0XErKRo8D4cVLEtB312YdRK+xlDXh9mT9PGSjF9VTROvzRN7hF6mYMtGGbH1dW0kGQVAUqhw4AAp0ggeUhtxOQG8pJ6yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443878; c=relaxed/simple;
	bh=aD2nx8wgFZ0mjkF8oQsctIZ3lEUZE+zCfg4YIU5/5Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BxS4a2/Ogu9WzT4sdbu9YzPgfU1BzLVZv/L/Km4gZUSsGIF//e6dpDXLtpQ4RYmnX0l6aD2eSplrCC6hi8r0ad+ODnT5+c62TuWCUkwwuSA98OMwMMCUiOD+GR194+QcCibM+UvG6dsIBpQRk8TNZ9l1WtBkr8iYaEobUUX82II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KQNLuGlF; arc=pass smtp.client-ip=94.100.133.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate151-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=57GMX9oTRwBsbSPNR5DjMru+4zcGNHcKCYnNsKSB5ic=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760443810;
 b=kd66e1km5/mk73AC9DDoZvkd9/9NS1B5iUbMxEwCmxs7M3UECNMUYdQ1Q3OwlYEC2x9RguqV
 MqAte4gSisSD/+zG+ZdFfupRemLwEkYlUWORnRjTBh5OH/mzM/A4OFRcJ5NrDBH+n/xa5T8ZCv9
 YX7RybwSGbcCGgBdjWnKD1jLYbtZ0b7cIkqGxUlNUP9ibxR6e9YnCrHZGfmTkgyt+qYoaLWAoOi
 6cWrR9r3i6bw4IEKFXBfgddrxbOX80Nq4DnNYnHPpxAKwpXgEuZMEs55ds8YC/HEfpnKy9PstuU
 esj9lbfXMgRNbXoOype4GdCH5MBUnRQv6ibscv/ojTzhA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760443810;
 b=ZT5pWIm1/D7c7LLsF5LMBQJ5df3n/kNz+IB6rPQiRpM3uO3Ek84XdSaA5nWxhSbOjPdmVaQO
 wGLs6W4ZAxrHHVUkuM4Br++sbvTAHFHTaNJu48zO/LByx+TZhM4xp9LLw5x+MIreRIbzb0D6HUI
 mWpnZTj3xNbZWPGJfjjG2kKoJGDYWnWFHY3gOa522XIeJGnmuoHhni2HeMbBxjGBXqm1obFR6kh
 MZLD5DZAsFYAtDWeqA1WL8SFIRdLv7NjTTkaeaoga1EoOgtvepif75BZiJhlW/5I7iorpLudJRe
 KUB4OAj/7BGQPHe8hvEdyawZREvdBiMIr1fpDNQauRBdw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay151-hz1.antispameurope.com;
 Tue, 14 Oct 2025 14:10:09 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CD68C5A0EC7;
	Tue, 14 Oct 2025 14:09:56 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinmux: Add missing .function_is_gpio kerneldoc
Date: Tue, 14 Oct 2025 14:09:56 +0200
Message-ID: <3379790.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org>
References: <20251014-function-is-gpio-kerneldoc-v1-1-4e6940a2b37f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-gpio@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay151-hz1.antispameurope.com with 4cmChP2Yndz1fylp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1c215a18d353ae9b073a219a2c3930e8
X-cloud-security:scantime:4.403
DKIM-Signature: a=rsa-sha256;
 bh=57GMX9oTRwBsbSPNR5DjMru+4zcGNHcKCYnNsKSB5ic=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760443809; v=1;
 b=KQNLuGlFc3+D7/5YexwPH8P3PRQCJGhfKY/On/gLm7Esv5GU5zh2e5QOwbKx/7cRlUGxpSkf
 pMbkp6RichnKDx9a4UpE9ptO7BrC3/P5YEdwSwEJkgfXr+6aVSGTksaj4IFqdhFew9PTfvXzJhA
 1eO2gPTLG5y+EHYc6NyyI5mcXTsIUDj8wRYo/qNsWrftOJbnocgJX7xiUUpYNhYYHLmNNI6rRWi
 Ql0m7umTdk/ipUbBdzDX8eNYQ9+SFmQieeDpN7r5IrikxamBrStPkfZCYgmcj+LlEwwdtHJI3Za
 Y9yU1DL4mDYwC8yag8kHbWEeDDCnUBcMiYlZg1LZ+fhUQ==

Hi Linus,

Am Dienstag, 14. Oktober 2025, 13:03:21 CEST schrieb Linus Walleij:
> This callback was undocumented, add the docs.

I'm not an expert on grammar, but the things below somehow are bugging me.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/linux/pinctrl/pinmux.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmu=
x.h
> index 6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81..d2da7169b767609682e667004=
11051e20ba3fed2 100644
> --- a/include/linux/pinctrl/pinmux.h
> +++ b/include/linux/pinctrl/pinmux.h
> @@ -35,6 +35,13 @@ struct pinctrl_gpio_range;
>   *	name can be used with the generic @pinctrl_ops to retrieve the
>   *	actual pins affected. The applicable groups will be returned in
>   *	@groups and the number of groups in @num_groups
> + * @function_is_gpio: determine, preferably by reading hardware register=
 states

Missing comma at the end?

> + *	if the indicates function selector passed corresponds to the GPIO

indicated?

Best regards
Alexander

> + *	function which can also be used by the accelerared GPIO functions
> + *	@gpio_request_enable, @gpio_disable_free and @gpio_set_direction.
> + *	When the pin control core can properly determine if a function is a
> + *	GPIO function, it is much easier to use the @strict mode on the pin
> + *	controller and avoid confusing set-ups.
>   * @set_mux: enable a certain muxing function with a certain pin group. =
The
>   *	driver does not need to figure out whether enabling this function
>   *	conflicts some other use of the pins in that group, such collisions
>=20
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251014-function-is-gpio-kerneldoc-29b9b9df9b2a
>=20
> Best regards,
>=20
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



