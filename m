Return-Path: <linux-gpio+bounces-38644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jSGHCyXIMmrG5QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:15:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D169B4FA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:15:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SHQVZafo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38644-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38644-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 388D7301BEE7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 16:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3074B8DE7;
	Wed, 17 Jun 2026 16:15:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A047ECDC;
	Wed, 17 Jun 2026 16:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712923; cv=none; b=IgbRfLw6X1MYBmUECt8S76wQAvxV4QMfn8jIn0Yp2o3WeVcP9tfQJABld7yT2gU087kqmOhiROCA9wb+avX1UCnvnxhRyQM+etM0bQS9eoOJ71EG/lZwmKqxsbA07xvPsxl2XdqPywmmhD2HsqTD/459q++wRp1mks1QkLPin+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712923; c=relaxed/simple;
	bh=u1b9+EhCd4/VXAves46ZuRPNrC7aD+7SaK466F4FxLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JWDVoGXYS/+SaE3B0MKYmoDKEOenfjvgO/o8VTYzYbfKoMek0zTP+bYLMhFKMpBtf60EiAuEGdhwphgQGy5iqxh1Xrj/+g8sQ80vLgFdVqwwYu/qLJ+QOo9pebtQsGBCLMnSXgy2RsUkx0izk32yUuh8FbtCU1BFJWjhvPWIlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHQVZafo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69891F00A3A;
	Wed, 17 Jun 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712916;
	bh=PD3vI4IT8+ugaHfqqxvY5TqGtr2wF3luT7BisiQbBLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SHQVZafoeF+Byln9xKKD2VAbzcgthlA6n6+2bwoDU6UP5qGDHOU+CU7gBRNofM3DT
	 ZA0iJc8cufNprO2a0FXsPuZDLCc9DL5AewP+h3sfUVHaC8Gy33ubVVJqJovZPLggnF
	 kQTFNdT4hBi3RUikYPcgBzKxM2Wn0PgN9qx2IKH4uptwhvukeyJ5M2uNSwODzdrzOf
	 1Uc6M89jfg956y4D2451mSkQNNOEfhXQyw/3dP7lDCr57AvRAB4ghSZ53JMNJCcni9
	 Qr10RXl+xXi4Zgc4bDVeKQIYVdNyFJZ28pVmp+W7oMzKpmfDpWs6t76z3VMT4bvNvN
	 D+0yPEfI2XMVA==
From: Lee Jones <lee@kernel.org>
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
References: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
Subject: Re: (subset) [PATCH v2] mfd: si476x: Modernize GPIO handling
Message-Id: <178171291455.1675957.16885396370152870936.b4-ty@b4>
Date: Wed, 17 Jun 2026 17:15:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew.smirnov@gmail.com,m:lee@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:andrewsmirnov@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38644-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC2D169B4FA

On Mon, 08 Jun 2026 10:57:34 +0200, Linus Walleij wrote:
> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
> 
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
> 
> [...]

Applied, thanks!

[1/1] mfd: si476x: Modernize GPIO handling
      commit: f3f0acd3768dfe71aa6b2618dbeaff69f25923c4

--
Lee Jones [李琼斯]


