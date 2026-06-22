Return-Path: <linux-gpio+bounces-38784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Q1JHgIDOWqilQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:40:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C656AE547
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 11:40:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="HG2EBMm/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38784-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38784-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA3D2303AF12
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 09:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7209139D6F2;
	Mon, 22 Jun 2026 09:35:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087B39B4A2
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 09:35:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120913; cv=none; b=MZw/Ozj+YgKQ+2CMrZbrHqf6r0e8XA5bmo7rePyrSlWNgBc+1KwF6Q9aeK4hYRJbwiYULpmuI8jlYaCcUXR0E45bPxqvtM9WyR4MmlX3IMHxGirBrsFqrabvlRavsexiiY7mRj99f7+gs9z6HeByKRLlxJuSLZ8T+efc5dgUgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120913; c=relaxed/simple;
	bh=cuEZVJH/kJudh1+55tC3k0yVRdzhHa6xCbzGW7ZT1PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nABLSqSvZz8axrVL37zMSC/oL2tQvUSNvtZYf0MF80hYfRNTRX45ezA9I35ulkGhIzvTCozM3wgejBmOD4G3vg/Wnutb9OKPe/Uww32VS1SVblNUtyreypOFyC2A7YmH0K6Q+r+K/96N3yT6ho9w+4p5pDjOCezvJNS+x9+rkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HG2EBMm/; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso27743945e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782120910; x=1782725710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cuEZVJH/kJudh1+55tC3k0yVRdzhHa6xCbzGW7ZT1PM=;
        b=HG2EBMm/nPPKuyrySzOVMMVaLhx0QjJXvjvIswvxf6EpBia2Aq2n0QUHBl5cGEn8m5
         R89rISNimZfEHQh1Lvi1+bExL+aY+yoTF/jGM3UGlXQJ2a4Gquio923rInRT06KpVpVN
         NtpS0FcoSbDf6gI34tPChf1VHQiQSkNBh+LZU1potPu6fJJNKr4CtTlj7iKi49haDait
         rmrrwYLLePAeDPnPBIhzM3qSkAlDZ1LXQoIelVkkSv3WB56k8g/Ahmian3zyDbPK7L8z
         wjNn+bNpzDsklPlZPAtyANdViGutwhMxr5I8n1/dXybfZxlGTMJ3tzlhk/e3a1XKdzbT
         5XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120910; x=1782725710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuEZVJH/kJudh1+55tC3k0yVRdzhHa6xCbzGW7ZT1PM=;
        b=AtuG6noKmaD95uHKUq5anAHtXVKNSKSdQElSJR+zhQhHmvWhbCot4cEe6OAW3CNsGf
         fccHajACZsf0XOKXSpnvUOwc4SFV75yqnAIfCT6MBEwIxiUON+WHIWWKH60rtlktRLme
         g/k9r/j/57HBAsvvCAYe76izc87OVgcIqTc+G6cXWMeIip34vGFs7KLLTvhai2dnzkSh
         QXhYA+fvGZPnci5tU0Rax2OZR8YmjOHRDsOa/Ixrd4TGntXM3L+13YYMRNQxI+MPXp1G
         b+LVJQqk+P7D+W6NYMPsZuWBOXkjFCLkh8tn9KGBfms6IHWpWR6f4Kh3gqR8DvE1ZgUH
         12mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JjqriGy2VshOWClcwsMwsj/onr7jszZt4Cr0XJTEAZQfdBApLLXRHw9T52k5geghK0vwFFoy875q9@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDs6xyM2Jr/H/0UiA5z/ifHlWmi5cY7P8Ttno1i33botSINmw
	xSLPw5c5cbOMKvEXJOgtezFGO8g8UHDgiRctOqTXG2aARnrOmW2ujZGb423x/aJvaxUJ68fFjo2
	RjGBt
X-Gm-Gg: AfdE7cl4k+JpLll/gy22ZRTVW/nP2VPlwpN+6re9pM6UchEmBKi8iaURjTt2FNoaVN9
	yU4URyKeLC5TFJgklncxi8cHoUY+qrmcQ3DvI/T4QlalKIR7QHB6ftu9APHMyGwU/edyTz9yno+
	/YVWcfilsL+cSEuAHFLePcPCDVlgUfodTMblGE8lNw5/1tBYMkhGDxEVI2COhSgx2w70eIhd5Ml
	WXyCE2AzuAF3+SamJGpcxO5h5hSOVGSAJDS6wEnm3dpqI3H3R2szG5eXf5p8XMImrJRXWEs50mq
	9rKQBMldRP05kZUV3Xrvxj7KPbd6mXQMiCFERmaRfcxlG7KIsh/1i5qDUA4iaCM/w+U4ofKiQuk
	zAFm1tv+jqhg2SneragCzOfLDJ9bPma/501+CeU3tjEpO6/ALboBUr5wCyT2lM8/niuapGcp1VL
	KjmtcaRFgtYTUtcoqeK6uLy7S3f/R4BoZUfIwRnA3HJPAybVjugsq+NAKf0gv4opy5Rx0FgOIgL
	zQZFE7nXzbiOA==
X-Received: by 2002:a05:600c:1c1c:b0:490:b724:507d with SMTP id 5b1f17b1804b1-49240e40a01mr253091445e9.11.1782120909786;
        Mon, 22 Jun 2026 02:35:09 -0700 (PDT)
Received: from localhost (p200300f65f47db0402a454298f09593b.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a4:5429:8f09:593b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49249238bfbsm211425655e9.5.2026.06.22.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:35:08 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:35:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: initialize return value in
 gpiochip_set_multiple()
Message-ID: <ajkBsWTtvG8UW8hd@monoceros>
References: <20260620155319.79994-1-ruoyuw560@gmail.com>
 <ajbCt5hAiqanKZ2f@monoceros>
 <CAK_7xqx_kJneD2=nDPYbefX_Ov0tf5sOwp5BLLLr7VzP9mtC_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzxrvq4f56hpfrm7"
Content-Disposition: inline
In-Reply-To: <CAK_7xqx_kJneD2=nDPYbefX_Ov0tf5sOwp5BLLLr7VzP9mtC_w@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38784-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12C656AE547


--dzxrvq4f56hpfrm7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] gpiolib: initialize return value in
 gpiochip_set_multiple()
MIME-Version: 1.0

Hello,

On Sun, Jun 21, 2026 at 11:08:09PM +0800, Ruoyu Wang wrote:
> This was found by a local static analysis checker. The checker flagged
> the uninitialized return value candidate, and I then confirmed by manual
> inspection that the fallback loop can be skipped for an empty mask.

That might be worth to point out in the commit log.

Best regards
Uwe

--dzxrvq4f56hpfrm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo5AcgACgkQj4D7WH0S
/k5rEwgApBHbId3Te6CBNX9udi4r7wsfjs/oMIlQCAbkSq15P+dQ4xnDMXBc3rPv
kPNTDaS5/ubKmVT+6iNYp3mUhlL+6gjaziyCIHnlaQQef5sCFYtnDBZQdRKw3NTF
v0J94ZHdYy58ATw02pZQvNqUvXsbsFuXLBW9h1kBuNWAbJ/YnplK4VEm1lsNOISB
/9KOxd6sfusMKfPUTHkUEqvq5nCPMuZg/vtAUKqzNqjb5uKtSK4WC46d+xY2e1f8
VyVPsO1kguT14MRXyd9xOdRGHq3H3+UONFs1/RxHN8NTWKTHP7hgAOUTp1Jcwnl4
24wqfaVdGszcn0v/N39BbCfoEiGn6w==
=gEKI
-----END PGP SIGNATURE-----

--dzxrvq4f56hpfrm7--

