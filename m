Return-Path: <linux-gpio+bounces-38634-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DGpaJMt3Mmq40QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38634-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 12:32:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE4698857
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 12:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nngpRcHq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38634-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38634-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39AA1308B74E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B790E3F44E8;
	Wed, 17 Jun 2026 10:20:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7783EFFAF;
	Wed, 17 Jun 2026 10:20:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691626; cv=none; b=kWB91REpjZMz/JA4v6T3v4KaQOb+5Z0fIjn2/tzy/DTjCdHUHnFjws9BnR26jL4YJAulhnPcp1l98Saz3MyzQTaUvXsasRm554tZXC8b+U7chwh2i8psrol0odTi9M2UF5bTpe3kHPro277gth8Qxym77c4uHq1yzaJM04K9Kdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691626; c=relaxed/simple;
	bh=LemMe3KggFiCwPPl9bGmfkEUoHEUWpJ7AOoGFXW6Xbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFw38jjPlHupeIcQAUJEH6fCitXNBNR0n1TCYQbjMRuxCGXMc9KWDOzWl4ttfkCyLxluh+JeLBv2P8fEQRW/MOc9UT4o8Kwp3eGl/RuJoyxPBzZVjK4xNPtdpgH+JOV7nMs0EBH0FR1zU+DH8HyZllEQ3+ZaVjVBQ4KcGIKbpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nngpRcHq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073691F000E9;
	Wed, 17 Jun 2026 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781691617;
	bh=mGDpQKiaGmdMQBKgXybhSkmu2YNTiVFD1n1EPaO+ol0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nngpRcHqLTi0JBr234u9hEGzndNN1zkYDSWphGDzDeiBEyXscpEG3E02lAUNeKgLr
	 bP1/yubOPljYWqR+GDt7wHMLqr0kuTYXCU85r2UncLrQigEttDWrbj91/PKDZkqcOp
	 Zz2hTNleWc3ZJCNLsMwsfvkDXOvGuVeTQnNj+jzTigQ7+3uXR2bzVSHExxFwQkJ1YZ
	 l2qWmqEOCWBP1CPk3MS22aYCRqTjOZfFmXsfMgGt0Kw9IrDDe66Wk2hRZdyNDjCgbB
	 3gzrKgwCuKBANm8nFxQVd8FsZyYKOP9Mr+Ot0EfDPX2i+7Rvk7uHvEWVe/ZL/kllUw
	 1RHDFK3QZxvnQ==
Date: Wed, 17 Jun 2026 12:20:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	linusw@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Subject: Re: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
Message-ID: <20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
 <CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>
 <20260615085252.1964423-3-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615085252.1964423-3-alim.akhtar@samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38634-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08BE4698857

On Mon, Jun 15, 2026 at 02:22:49PM +0530, Alim Akhtar wrote:
> Document pin controller support on Exynos8855 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

No wakeup-eint?

>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Best regards,
Krzysztof


