Return-Path: <linux-gpio+bounces-38643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WyzeFG/IMmrU5QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:16:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A430E69B511
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:16:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Diy+mwm0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38643-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38643-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5A653004D2F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 16:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E221F3033E8;
	Wed, 17 Jun 2026 16:15:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7D4A33E2;
	Wed, 17 Jun 2026 16:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712921; cv=none; b=iavKQw6D87P5p6zaJlGPskkvh2Iz37/E6/Z9BMXI3QltjIqO8+NwsrYM7gDtSs3fppu3fCfWNIqO/GBZd6ztou1+4XapxwuTSWo+BsdKFhxwtJwqz2TWIMFIZPY/WuszjBCXYLUDZTdlUnfrxRHKq2+TxOL9UDu/9LwwuzDJ344=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712921; c=relaxed/simple;
	bh=PJ8IxzpbhrapIoC9P+hRFPHsOQrg5Qc17j9A3yx5d2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0LgsXEMMiRxMIvtgVIzBDMjNosrc7UcV7RZw5RlhJTK+vixfI2pRBffgj3PPFl8AAQRpNvaZRfWO52aFuTv6ImXCOcc53zAI7Esf6DI9T3fu1ynfvDmPRRvsMONZWKrFNYnp9jNeOuw+FfDMd3eZK5NM2KLxu0A4c6iTlyZVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Diy+mwm0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CA1F000E9;
	Wed, 17 Jun 2026 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712914;
	bh=zDk2NNmHbI3xWQa7eXy9sZ9mgo4GiwpiOqZdkAzZK4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Diy+mwm0SjUgtACjZD+V2BwuyrsmGtwF21b4GZhhoCHOgeOmqjv226x/nxUJKpKja
	 7SbOQ+Efvleil6LSQl8neoR8Kqv1J8Kk0VuWF0k98mNi2FkS/D3/F3B/uTz72gfPht
	 TkCtVYI3tHTjwFOThltiZ+6OeUq342xXPkzScN/PDatqSPd6UdV13VR389pXphDNLk
	 6Bwd1CvqqZasuYcvwWyxW2m7Oy1FiONBsMpv0YIznpt4akCUeMpuY7H28qmDrkaDf4
	 Z+BErb08oWufErwdY4MOZC6f4rG18SDEPGN4YZCpW0awmIx5BgN2uJxOsGqJIsv5Ft
	 aO0J4CeCyULxg==
From: Lee Jones <lee@kernel.org>
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
Subject: Re: (subset) [PATCH] mfd: si476x: Modernize GPIO handling
Message-Id: <178171291278.1675957.17499698111905767721.b4-ty@b4>
Date: Wed, 17 Jun 2026 17:15:12 +0100
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-38643-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A430E69B511

On Fri, 27 Mar 2026 09:37:26 +0100, Linus Walleij wrote:
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


