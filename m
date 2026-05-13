Return-Path: <linux-gpio+bounces-36709-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOJfK+gqBGoDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36709-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:40:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C8C52ECA5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25D3B3009F27
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A93D6CA6;
	Wed, 13 May 2026 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjcN0k0j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7172E3D45ED
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658017; cv=none; b=PYF7jJuzx72XsnBMklkMza1ezDnX59LKNXcyNnp2LHs8mv3JyT+1Fw8kb1nsB9Rarasr6vy1QK/oAVDjUTPl/joqssIkcl+0ghdfPCncVA913uq2r6kTpVNo6vOPRnzxS2PXrSXswRiJwaJ5FyVe3s8rWhsYGMJfZAqtqLDZhhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658017; c=relaxed/simple;
	bh=M6IF5YB9Ms7ikCs0h7PlwhA7b1dkMEzgFjwgA6Kd07c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzv+5/jSiG4AV2vGigs3YXDRkifT1xFLo2rC+PehVDUb9kdS+eZ+7Lf/Ry30gPFzzSC5myK8Xm4aCP2CY9AVW98yPm6uhG2bUVyjhkEwIRxgWPb3fNuVH8aEzkzLvK6SVldhwHvYqCqjuTWsum8OkB6+LRL4uY+oZtVHaIerpW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjcN0k0j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1B4C2BCFA
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658017;
	bh=M6IF5YB9Ms7ikCs0h7PlwhA7b1dkMEzgFjwgA6Kd07c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HjcN0k0j8IMDmeyMWq9IC1+RMwcF2uURrHo4dFG3F5jAwJg6VjTYwFi2do9fvW4b1
	 uXrMIIchbuzuxLiAt9TFOOhCiGOoW0Xmddh7y58UooTJW25CKUZSu9RsYTf0LWxB8N
	 DGSG7r++j/SUo3Y26ZaiEk9hhMtt8Tu/t44v+0cWjrffushvh+W0W7khVn1Bwspwly
	 97xJ8bhJ3idHX5pCuS1xVJTeku1/6hn/hkgoqlPalMRBeOj4E1V1a2VEGg9cjJTdKq
	 OifKCmj2/wqt4NYLNb7SuyY2XrIi4A+dazQRegBf6MKFv/HB6jKUALzBBCd6YBsNSL
	 xqay+x24ycF7w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393da8f389bso65109811fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NwkG5nsE0gGURbGSviGzo7kZwt+aQJu8FDRNJgKd6iVIFEP+bcrgtyPP2x/S2sROgbHbbvyFn9+L/@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoiZnUKSpXRCiGzI3rT03+S8EaHHzt9poqBZGD2oAZYkQbmgI
	oIYHmIXof/HrzpMB9gHzJ8Wr7JxYfcSROXoSph6czAR55mLZ8OpfoOI0eu6A592eE5QAoyzCPIi
	Z+iBm6mo7RVnDyCoyMqE5i8z7CMCNBxA=
X-Received: by 2002:a05:6512:2396:b0:5a8:9f6f:31fc with SMTP id
 2adb3069b0e04-5a8ef9352c3mr674739e87.12.1778658015719; Wed, 13 May 2026
 00:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com> <20260512033317.1602537-4-eleanor.lin@realtek.com>
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 13 May 2026 09:40:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdq+43N11xNVNvq3wYhhDzvFZ=yJL-SCRDhQPbCAVQLg@mail.gmail.com>
X-Gm-Features: AVHnY4LBwJ6oIR5aJTDwxQV6K4gULrWZodoEkRc6fxJoapre3LNZvomIzuavyFI
Message-ID: <CAD++jLkdq+43N11xNVNvq3wYhhDzvFZ=yJL-SCRDhQPbCAVQLg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, wbg@kernel.org, mathieu.dubois-briand@bootlin.com, 
	mwalle@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org, 
	cy.huang@realtek.com, stanley_chang@realtek.com, james.tai@realtek.com, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 21C8C52ECA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36709-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Yu-Chun,

thanks for your patch! I really like the direction this is taking.

On Tue, May 12, 2026 at 5:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
>
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
>
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>

linusw@kernel.org these days.

> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

The rest of the comments I had Andy, Jonathan and Sashiko has
already pointed out, just hash through it and this will look really
nice in the end.

Yours,
Linus Walleij

