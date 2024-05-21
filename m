Return-Path: <linux-gpio+bounces-6521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0295B8CB100
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91655B20D5F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7514A143C60;
	Tue, 21 May 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="xH3OScQO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD79143890;
	Tue, 21 May 2024 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716304102; cv=none; b=Xa2490nhT6GVYkARz0DF6eyc//4/3Vzcuwbfe3BmsD3Ekb6ba+D7XxD0qZ79eGk9J9dVr3yOAeAeQAsCt9+KWsMnRIv4sUA2qhaRZrEZ20QMw/fD1YiUYeA5QX6B5PDENLRnOiN6zIHxSYTL4Di5qZWJzjqlNWm9zxPoG23kbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716304102; c=relaxed/simple;
	bh=XbwB6Y1ncfxvFcAluUNDlB2Uk3g7I/vYkgRiL0JeCwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k99rVDKDI1g0E6j+whbxgdHauLUg6SGr9+eKZahVoF2ofHsr9X1ddLnJhjlyMDxkHIVKRLR31u0XgNhvgiIZ6YBz3mxLI8vpIVOsIMrmHLmIdbPYPlpoRWpvvkwzMjFOA2N5AVeLCvkMK+EsAIU3dS5iUR64e0dveJMUwknqA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=xH3OScQO; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1716304095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7huwlz6e+OJTDpkqE9pk3NgcFlZcNZLJZwH9Yh0gUb0=;
	b=xH3OScQOnERJ0m65qBvqlVgCWgjvFXfSPRX1tZVYhS73pVeKCe043+2s8cYuhBQIA7AVXM
	2LKEXv8lS07ur8cWPXYtgXNjqyaur6UFfvPjPKKWwbAQ2lFORVO2oKe1/DKRnF89Ny7C2g
	DLoFNBCOI7PbEko0S1Be85GtbqruXPfFLaBQD3IIyBBmHjw3UcLRlv6QxuB6xqbOUDWBam
	bZg0NakLT9kpXwbJis/GG9hoeewT9LW5FHXnPthD98tDo3FNbY5P4cidd8qLoFX+8uuzIf
	Gf2L2auEfCSxijy2eXPKmXTp/UeHYzEMtTryLrqmHSBcaRES5m6URWYoe+j9Ag==
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: efault@gmx.de
X-Envelope-To: claudiu.beznea@tuxon.dev
X-Envelope-To: linux-renesas-soc@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: claudiu.beznea@tuxon.dev
X-Envelope-To: linux-rt-users@vger.kernel.org
X-Envelope-To: claudiu.beznea.uj@bp.renesas.com
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: geert+renesas@glider.be, linus.walleij@linaro.org, efault@gmx.de,
 Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev,
 linux-rt-users@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject:
 Re: [PATCH] pinctrl: renesas: rzg2l: use spin_{lock,unlock}_irq{save,restore}
Date: Tue, 21 May 2024 17:08:04 +0200
Message-ID: <1909974.d4bNfQZPDi@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5820949.HBZXY12uQI";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart5820949.HBZXY12uQI
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Tue, 21 May 2024 17:08:04 +0200
Message-ID: <1909974.d4bNfQZPDi@bagend>
Organization: Connecting Knowledge
References: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0

On Monday, 20 May 2024 09:20:33 CEST Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On PREEMPT_RT kernels the spinlock_t maps to an rtmutex. Using
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() on
> &pctrl->lock.rlock breaks the PREEMPT_RT builds. To fix this use
> spin_lock_irqsave()/spin_unlock_irqrestore() on &pctrl->lock.
> 
> Fixes: e1fd1f9f457b ("pinctrl: renesas: rzg2l: Configure the interrupt type
> on resume") Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c index 20425afc6b33..78f947a8e26e
> 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2069,11 +2069,11 @@ static void rzg2l_gpio_irq_restore(struct
> rzg2l_pinctrl *pctrl) * This has to be atomically executed to protect
> against a concurrent * interrupt.
>  		 */
> -		raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
> +		spin_lock_irqsave(&pctrl->lock, flags);
>  		ret = rzg2l_gpio_irq_set_type(data, 
irqd_get_trigger_type(data));
>  		if (!ret && !irqd_irq_disabled(data))
>  			rzg2l_gpio_irq_enable(data);
> -		raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
> +		spin_unlock_irqrestore(&pctrl->lock, flags);
> 
>  		if (ret)
>  			dev_crit(pctrl->dev, "Failed to set IRQ type 
for virq=%u\n", virq);

Now the build succeeds on both amd64 and arm64.
Thanks!
--nextPart5820949.HBZXY12uQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZky41AAKCRDXblvOeH7b
bv6EAP0YuCZoGdztw1jivJ1yX2r7Z1UJqSpTOJGtwl10KZCmmAD8D6BkuzDB3RCH
yIhCrbJaTvdW+PJeKOqh6hG2Mb85nw0=
=x0p+
-----END PGP SIGNATURE-----

--nextPart5820949.HBZXY12uQI--




