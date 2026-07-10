Return-Path: <linux-gpio+bounces-39817-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p9fwA4jKUGqv5AIAu9opvQ
	(envelope-from <linux-gpio+bounces-39817-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:33:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0B739BF8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E59VEGjD;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39817-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39817-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC174307CAF2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E5C407CFF;
	Fri, 10 Jul 2026 10:28:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AEE18CC13;
	Fri, 10 Jul 2026 10:28:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679297; cv=none; b=Ihej2kwColV1u9SyNLpBGnAWcnUZqjMg4cCdW74JoBZKT0xIYX9jalqXUq3PjtrXPYXFhfoIYCn+aenSdUGd9GLaAS9us43XfeZqB97zHiTyMGWD+WsfxIKNcQ/Tyemah1Mjk43rblxtkyHaLrOKqJcQCpdkY4d+WrQrYD7BfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679297; c=relaxed/simple;
	bh=WEYyzP3BKnY+B51R4z0JfgChQz0KAGXJFEt+nf+VAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opg2u5rQjIyGiwtPDxNjrqmodBlcALBwmCiA5fruo+TdmPrrNTlYzWCBUmWKox5dP5XeH+CJuU6AaLTZj7Y/stFLgreW40LJCk7ZKXiEdh9sdRYMMKAOfcLKn8gwLqoiDuVnLuoQJE/BZHQXcNAfRKLiiJjL/EIyxsXZYrCWotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E59VEGjD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C41F000E9;
	Fri, 10 Jul 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679295;
	bh=BdmbeR+nXP2QOTmJSL448JaWOhpFdJafXIzincBL+Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E59VEGjD2WXB4bUGmJBQC7A1D/xBU5RjYM4hv1oGNHf73wKSUSUgQhTy1N4nDaoBX
	 BddUzBpETIjpA6lNNhR1qJN1AEWf2QBTyl4kyFEFrT9EO3NW7H+0TM2dTgp93U13nO
	 DNkMYFMJPkLBG1ezmd+ZFJ38c8HW/ylby25KSP9sMsmyc55zW8REh5t09dmnX3nDYU
	 2Giy5jGDIYrcBOCVI60C8CwuEttGo5D3aYIQiDgezd2qe9AygAwPJILlBaCVklIz90
	 23DTG35DsRTwPBotQQv5ENuLuq5JAN5jfOpdcdWGos9UMrdQIEcVm1w3D5y+nAEf1m
	 /CD0IiuhXfvEw==
Date: Fri, 10 Jul 2026 12:28:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: soc: fsl: qe: Convert QE GPIO to
 DT schema
Message-ID: <20260710-portable-thoughtful-uakari-4db7be@quoll>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
 <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul.louvel@bootlin.com,m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:herve.codina@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39817-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,bootlin.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[csgroup.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quoll:mid,bootlin.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DF0B739BF8

On Wed, Jul 08, 2026 at 12:15:16PM +0200, Paul Louvel wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Convert QE GPIO devicetree binding to DT schema. The old binding uses
> fsl,<chip>-qe-pario-bank because multiple MCP83XX SoC has support for
> these GPIO banks. The best practice is to list out every <chip> instead.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 45 ++++++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          | 26 +------------
>  2 files changed, 46 insertions(+), 25 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


