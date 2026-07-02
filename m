Return-Path: <linux-gpio+bounces-39350-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7w/ACpMdRmrwKAsAu9opvQ
	(envelope-from <linux-gpio+bounces-39350-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:13:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBB6F4A51
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D7cSQFo8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39350-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39350-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154543067F1E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1953D4121;
	Thu,  2 Jul 2026 07:59:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB103D3306
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:59:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979171; cv=none; b=BZqUd+NSs2CFOJZYyXt8Ga//etzmIE6xf7hG6JSLY03J9waxWbDIqZ5FGnfAy/3QIznzQJIHuZT/cN01nU/CWszf2O1wDvhg8j+nC3wjFs+GIsK++nFeEUG0FbL9nwhjVA2KB0ho7Mk48ONP6Gh37+2zpmlqcvjnNKicAKZ6LUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979171; c=relaxed/simple;
	bh=zWRq/sO85PfHonPyiE6spIYFUQsSZJsxHqGMVQszviQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZE4h2WcDdOZBf1FwvRTwUeaaeVe4x5UAA3eDCN3Sp3JLI3sJu3kuKloeeaxei+3OZAsjdhAOgdLinY+dBdgSEMFLNkKEE6RleGjQVwfOxjGkCgHiE1bFCJULa12HWxmRH5/i8xhcCX+mv5640hlzGb/JVYRBWoSWl5ARrIIerQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7cSQFo8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350961F00ADB
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979170;
	bh=KMF0XPgxh1bPvJqjJzOCEAXRRBEy4S34va7nAbDWY8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7cSQFo8X6CcFmn5MmR63opL79CNwlOUTkeojVXjQNXiMR+syEvpGnzAJzgda2JTe
	 EcKTshWWfoHgri6T621CJP5KhPqmtmMuECE+INihG66kIVnyv+FllXlXO5dSV4cnHs
	 8+oTuAC/pdev4diCCgPD/5PqsDjZWng4VPkjGjFMyIzWnK5b+EXk+3Iz+sEiMqup8N
	 JHd6zwRstFBKWhdD/dlhJxo4DVV8adaUDRHv/El/U99jA3gTaEhIvYOLzEtEB52l9m
	 TNyLMskIN/1Ez6Ots/C9h1WJaR++JEgpagkKF38Fdqsua2ZriIY55AdkKgyIyZ6pXQ
	 66WO7P+/aNVOg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebae2f310so1394275e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcCE3HWlQcvhU9fPzt/oMvXMW7gzmoHEHC+1VKUPJEDulfaz2DzmHCoxi4u4i1n1A+0Y5TISeMDFfH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4CRNsnVgyGMy3OebkABGJIMdGtI63/EIVa8ATQAxNXU4xAuRY
	bLdBmRBLl2p71ljcs1nKZKAg/vCvzFfh2yhFMM02pe+/2H/U5jzY0V3hA0v5wj9EG8SRjvLf86w
	tHoXQL4yc31HmFubUAAR8wGCbFydA2wM=
X-Received: by 2002:a05:6512:8354:b0:5ae:b4d5:6e5f with SMTP id
 2adb3069b0e04-5aec67b87abmr805780e87.40.1782979168977; Thu, 02 Jul 2026
 00:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:59:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnrytVkFAcftQ-izh3uLTSF2EVahJYvsfCtEgaemW5Fvg@mail.gmail.com>
X-Gm-Features: AVVi8Cfg-mo5-xyGo9O3KW-dS4uIM1OW6BMV2xJQvOGyercEBg0FSbo8ioLZlCA
Message-ID: <CAD++jLnrytVkFAcftQ-izh3uLTSF2EVahJYvsfCtEgaemW5Fvg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: nomadik: drop duplicate probe error line
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39350-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:theo.lebrun@bootlin.com,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BDBB6F4A51

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Now that all error codepaths in nmk_gpio_populate_chip() log an error,
> drop dev_err() call that is made on nmk_gpio_populate_chip() failure.
>
> Current boot log:
>
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -=
EPROBE_DEFER
> [    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip str=
uct
>
> The second line is always redundant (or is logged when we shouldn't log,
> like ioremap or alloc failures).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

