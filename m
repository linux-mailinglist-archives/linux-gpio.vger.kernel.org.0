Return-Path: <linux-gpio+bounces-33457-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDf6NzbHt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33457-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:02:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E152969B2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9186303DD02
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145CB382362;
	Mon, 16 Mar 2026 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8exm6Fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65D38238B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651547; cv=none; b=HYsym2A45Ll37JY7H8JfUCcd8cUkTU5Fmz8BnzHo2M2Xvti1CsGdk7I7czPFPIAeVr7E2d8ipfwRXgwPfAUBm6EJEclfWiAQxIjSN+pOu0tfue6ZXe1mbUD5x9TyVputhphGEMhUQnAOu0wmKCElIFyJvVkGystMJLs1TRBK5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651547; c=relaxed/simple;
	bh=fnLXTziv/oESSosjbc2G6ZUToQZc8/ezPhvrWzY5E6I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQardX/1ZVIOgnBOdA1A77BSmNwgAGg9WfisNZRwv+/nXWhl1+NahuQA1fgEJbAR3gnLOccR2KneuGsdAgQld/dZVULVydqFfWEsb8MwhP4cGkifGL09yi3KP8Cr1dIEViCx/9TfaEiRSLzT1e1FFCRwFR+H0glGOFy6JMcNr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8exm6Fb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21EC2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651547;
	bh=fnLXTziv/oESSosjbc2G6ZUToQZc8/ezPhvrWzY5E6I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=a8exm6Fbq6etXnGFsBdBrURZx0yeI/cTOHP+fXrIO3uSPcijpPAVNJwMsI6oo6aGr
	 5Crj+6k1B03QCECDNIcrzNGJsg1k1LkfcZ8pibpnKBB0oxTlIGOz1gJkbBthv5/4DD
	 7+wLgBwWrz1M533nqA/Pa+2KJfBuznIx0UzCS/A4FzPcFSHvjwrWFfBv6M2SAWZNwX
	 s7M8w6kya5RLQlABkZYqBWjT005u1wjfgkCb7KM0ZMxezZQ3Yc+03faLZ6hPoai/EO
	 /I9VmOvqqxn7Ubp7fPJAkvhoMipkh9Ru7K1gqs/6qjyfeKELKSxC9ne3BsZNn6NESx
	 g0ob5SV3aqzkA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a32d36396so37432251fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:59:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpSpeCOEvEnFugC0zQ9HCsmylNygOHNTCd83hg9yibQQGshjJ5X944Wk9EpPBWwkPeoteiZ1dEfzkg@vger.kernel.org
X-Gm-Message-State: AOJu0YxOO/Ruwt+K5eU+av2L6Vb081uUth5/7N7JA5hMN5vzY06PTdt2
	L7S76izBrlgwsC4SUBPLgzMDNuPRXxoLmSWSHLRuizsWbGa8f4ZW6oZR1mRhw9DdK1k1RHeHdrH
	j6602DstKRJ2RjeEUhUhgIqg20vanffgXAsPnu0xUBw==
X-Received: by 2002:a2e:9e4b:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a7278e904mr35834111fa.8.1773651546169; Mon, 16 Mar 2026
 01:59:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:59:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:59:04 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Date: Mon, 16 Mar 2026 04:59:04 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfsv+wee_v3f0shhOw9owKi2QRzh4ydPWMK4K7DWmdy4g@mail.gmail.com>
X-Gm-Features: AaiRm52T7Yjh5LiUALQVcYnPD3UPhNluzpKLRyKl4GR9B4seATU4YtXWIzOG9uE
Message-ID: <CAMRc=Mfsv+wee_v3f0shhOw9owKi2QRzh4ydPWMK4K7DWmdy4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codec: arizona: Convert to use GPIO descriptors
To: Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33457-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,lists.infradead.org,vger.kernel.org,kernel.org,samsung.com,armlinux.org.uk,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44E152969B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 23:56:49 +0100, Linus Walleij <linusw@kernel.org> said:
> This converts the Arizona driver to use GPIO descriptors
> exclusively, deletes the legacy code path an updates the
> in-tree user of legacy GPIO.
>
> The GPIO lines for mic detect polarity and headphone ID
> detection are made exclusively descriptor-oriented. The
> headphone ID detection could actually only be used by
> the legacy GPIO code, but I converted it to use a
> descriptor if someone would actually need it so we don't
> just drop useful code.
>
> The compatible "wlf,hpdet-id-gpio" is not in the device
> tree bindings and only intended to be used by software
> nodes if any. If someone insists I can try to add a
> binding for it, but I doubt there is any real user so
> it seems pointless.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

I expressed my opinion on ABI compatibility elsewhere in this thread but
for the change itself:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

