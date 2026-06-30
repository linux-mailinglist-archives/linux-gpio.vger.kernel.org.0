Return-Path: <linux-gpio+bounces-39169-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OrszMGdfQ2oxXgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39169-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 08:17:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BECF6E0A8B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 08:17:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=XwtMK7zr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39169-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39169-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEAC13001472
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 06:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995D7257423;
	Tue, 30 Jun 2026 06:17:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49227B34E;
	Tue, 30 Jun 2026 06:17:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800227; cv=none; b=AYL0uZtu4g3xuNIl5NeGC7Ynm8BRb3piDGdeGqRn9YrYH6ntBju+b0nFVFZGApx1SZ3vJbEvRz2htz6YkboPLdxn+ThWzfanA/U83po3no6Xx8Ik9u/7qxMubD7+m0Oxab5BSpxtYSp2Yr/czMlMAN9XVDNs66gSsgkZ/Q5oUEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800227; c=relaxed/simple;
	bh=jz2k2iwFrmYI3ZTUmJ0Z1YTYakjlnqOufzRyadR5KZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCZQPwilcyHl3hYJNBHKUm8ktU3CvZuraENrfNynfV7zsHtZ0kzm37plm+bHRFw3Xk+xhKX/euaRKAHlsJkpLZqEqDmjfYkJLos+zRO1tTWZShgHJtr0m0xDvmNo6QoX/YVwuH960TqG0MZrEov2+QOspeuVmyj1qLnLv/VHzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XwtMK7zr; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6958B1A0D26;
	Tue, 30 Jun 2026 06:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3163860233;
	Tue, 30 Jun 2026 06:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44F7A106F1BFC;
	Tue, 30 Jun 2026 08:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782800207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x6tJh5JyOoEZq/6xhRs/YNQm1w4SzweRFfhO2imvZJk=;
	b=XwtMK7zrCeSFLHpRcwZy/qjEcOO72V+i5zT3jGUjqrhewBddhMq6SHRPegeA+Hgb8XN7OC
	dMs8NohO/cdJHvRGEblaLU/RC3Md87YXwEKVkTb/V7L1UcxmpsE//KRzc3UWp5DT5DXc70
	3Wwq1iwq0xX8Q6Nxd1XGhNfwApqqOQQEUklmto/Vr9CbphamwBJkz+89Bjrg7P7eBYcnUt
	aTZgphCexSMW3/yocbgpalK1IRVCUWlmC+5Th45fLoVZveAkhHm6J57DeyhyZfxexdyFl8
	F46V9u5ADO2jNaZHywR7gVehz1jE1Ec2bu6wRtM6viRMg6vl4hzMF/I+u7z9cw==
Date: Tue, 30 Jun 2026 08:16:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Brendan
 Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae
 Moar <raemoar63@gmail.com>, Daniel Scally <djrscally@gmail.com>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] software node: add fw_devlink support
Message-ID: <20260630081639.04476d4b@bootlin.com>
In-Reply-To: <akKSYKH2vyXMVcox@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
	<20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
	<akKSYKH2vyXMVcox@ashevche-desk.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39169-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BECF6E0A8B

Hi All,

On Mon, 29 Jun 2026 18:42:24 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> +Cc: Herve, to just ask the situation with one series that adds nice helper.
>
...
 
> 
> Doesn't Herve's patch(es) add some helpers for this?
> https://lore.kernel.org/lkml/20260511155930.34604-2-herve.codina@bootlin.com/
> 
> Ah, still not applied :-( Perhaps it can be applied as just part that brings
> fw_devlink_set_device()?

Yes, still not applied.

I plan to send a new iteration of the series rebased on v7.2-rc1 and I Hope
it will be applied in this cycle.

Best regards,
Hervé

