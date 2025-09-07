Return-Path: <linux-gpio+bounces-25714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0DB47C8F
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 19:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B9B67A4E0E
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Sep 2025 17:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E0627AC21;
	Sun,  7 Sep 2025 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LDvPL+9w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEFCD528
	for <linux-gpio@vger.kernel.org>; Sun,  7 Sep 2025 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757266147; cv=none; b=iNfi45m/iOv/YAwcolfRoxfhB/KCzC7R2kBIZSQ9P+l5PsyGYwe2O2RmH3wMKQCm+sl52dwVW3RCNYWrhHndLNdhpqQer3c7vblzIZu02wxFISb0KLTac2HQHTmJWNnQO4yl4QcMIEi66HfpZie+cLzpOyE4cg7ViIGHAHp92kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757266147; c=relaxed/simple;
	bh=Cfp9mm5jePYAFrNTC3WesVMaULU0Cbtb9Mmm3IeyLFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYn4lRmfOOdm6odkEkHLScgykx93d7QUTRL7BqsQtA221KXPuc3tSRuoZEhYqhNd5Tay1qCFIoTvH+2NB9Eyx2cltzgoSF5Ag2aM87ubQfogs47z7Ckopp+pHHsGYKstnwSjNo5cRPi3IDytZRNU1AyhkfcnUlKqB+f5MDHVa1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LDvPL+9w; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HI7cBrf/VB0tvEUFj8M36AcWOsz9VdohrYv1q3umpTQ=; b=LDvPL+9w8nffgf51qfs60Ztwj/
	SjwY2Qk0KC/THjpsUX/8//wPP9CySwk7/KOAX7S4J2UTGyX2Zst3xjpsekLLhMutltVyAIxGHEd4S
	aJ3z466Q5+VdG8h/Car/C3QCy88WoX6yYqwH5o7o65ByqutRcOhuz/1UEq7UDuHveqwpseOaba8z3
	2ozi1TpRxZ9F7IBFM/HVKBpPwFWK1u3MTZdHhEJPUMy9T0minU5+KWCd4o1Krw6rR7fjdawfT35mr
	fnpkUKJ3ZrHdLM5CguuRxplZnjkpVpI6faWfKmCM3fBCSs9u7zFdB8B3KUWf8Ax5XhRWNDQdwfy9r
	vBYKsJaw==;
Received: from [61.8.147.163] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJC8-0004IN-3o; Sun, 07 Sep 2025 19:28:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
Date: Sun, 07 Sep 2025 19:28:50 +0200
Message-ID: <6789547.RUnXabflUD@phil>
In-Reply-To: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 3. September 2025, 21:48:54 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Sergey Shtylyov:
> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
> "rockchip,pins" property will always be present in the DT node it parses
> and so doesn't check the result of of_get_property() for NULL. If the DT
> passed to the kernel happens to have such property missing, then we will
> get a kernel oops when the pointer is dereferenced in the *for* loop just
> a few lines after the call.  I think it's better to play safe by checking
> the list variable for NULL (and reporting error if so), like we check the
> size variable for validity further down...
>=20
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>=20
> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Assuming that the DT is our friend, really is a bad assumption :-) .

While I can't imagine what 12-year-ago-me was thinking then, simply
checking the return value really is the better way

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


>=20
> ---
> The patch is against the master branch of Linus Torvalds' linux.git repo.
>=20
>  drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Index: linux/drivers/pinctrl/pinctrl-rockchip.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
> +++ linux/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
>  	 * do sanity check and calculate pins number
>  	 */
>  	list =3D of_get_property(np, "rockchip,pins", &size);
> -	/* we do not check return since it's safe node passed down */
> +	if (!list)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "%pOF: no rockchip,pins property\n", np);
>  	size /=3D sizeof(*list);
>  	if (!size || size % 4)
>  		return dev_err_probe(dev, -EINVAL,
>=20





