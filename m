Return-Path: <linux-gpio+bounces-39462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id weOYBE0lSmoI+wAAu9opvQ
	(envelope-from <linux-gpio+bounces-39462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 11:35:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93679709976
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 11:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WhjHqGtA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39462-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39462-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05F6300D694
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BF3331A4C;
	Sun,  5 Jul 2026 09:34:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898F1D130E;
	Sun,  5 Jul 2026 09:34:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244090; cv=none; b=RPpWfIEOMFwsMd/qZxDv4WJoCrpxHBEYfsRC7MVndfDJiOx3gxpd9g9/RkJpxd1uybe5wQTlPHd9toJmb7uOPNGZsfBK/U9U5u1RPAQg8GmXA61mJJ1yCq0oWxAFfILGlVO24y6bzdFHN1hICCos8MQyl4lI7mstjhWNthxnJqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244090; c=relaxed/simple;
	bh=S7jTigPPvFJRKU0kx15uSmH8rCK1lAN/BXMZ4I+qnvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SowOFgm6o5UZLN2MJCqktnU+5Es2aVyFRwPttTvHGpX54u2mPe38r2i6Ewp5faIfLt1wy3jVwrKCQLhFc56mlTz3PNhuW3UfZ2D9jqb01JDUyFxW8kx/TD8BIWC4JxkazJ73cl2H5P171jHTjemogTfrH8rF1isYt1a8gyvRFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhjHqGtA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091621F000E9;
	Sun,  5 Jul 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244088;
	bh=S7jTigPPvFJRKU0kx15uSmH8rCK1lAN/BXMZ4I+qnvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WhjHqGtANS1NzUFoOstSLpieTdPwUh25C5prUfV6qvgVRIHyiKgaJLg+JjyJv4mrG
	 pMUj0aIggqyKhf7mfD+qLgT/v/5I5Ct8cVaWy+1sXRHYcdDO0a3u4Bx+yyEN5+z1q7
	 EeTbAEWBSu+696HfHhSKYQ4UGscx6pISAwSMvy0zn9lW+fbvuolAJiE5rFFjDm0UEP
	 Ky3zhARzrWRcAPmqTULYjgHea/guUNSZMj+OWdOnNPrHviuc6UDgwU6rX5k3/4aVkN
	 6z9NY5tU2GuLSmrPFlYy6+yDDGGIzl9Wd6GWx4g+1PnjOyNRbNc3mw8cwn5AunpMxC
	 Wcra8sT91h5Ng==
From: Thomas Gleixner <tglx@kernel.org>
To: Liang Hao <haohlliang@gmail.com>
Cc: brgl@kernel.org, haohlliang@gmail.com, hoan@os.amperecomputing.com,
 linusw@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: dwapb: Mask interrupts at hardware initialization
In-Reply-To: <20260705074759.47863-1-haohlliang@gmail.com>
References: <875x2vlpjx.ffs@fw13> <20260705074759.47863-1-haohlliang@gmail.com>
Date: Sun, 05 Jul 2026 11:34:45 +0200
Message-ID: <8733xxlqyy.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:haohlliang@gmail.com,m:brgl@kernel.org,m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39462-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,os.amperecomputing.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93679709976

On Sun, Jul 05 2026 at 15:47, Liang Hao wrote:

> GPIO interrupts may retain stale state across warm reboots when
> peripherals remain powered. If a GPIO line is not explicitly
> configured for interrupts, this can result in interrupt storms
> due to missing handlers.
>
> Fix this by ensuring all interrupts are masked and disabled at
> hardware initialization time via the init_hw() callback. Pending
> interrupts are also cleared to start from a known-safe state.
>
> Interrupts will be unmasked only when explicitly configured by
> userspace or kernel drivers.

That makes way more sense. :)

