Return-Path: <linux-gpio+bounces-37230-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF2oE3wdDmro6AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37230-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 22:45:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042759A118
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 22:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EFC93396A61
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 18:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09E73FD131;
	Wed, 20 May 2026 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="1LX5NcJ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288443FD133
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302661; cv=none; b=Zj9s3GGaNIPnFDpiZFRwp+9pUOIXArEuerW51WE368V4kJ3g/YLMzXCKUtB/Uj0gKCQodENIyhSHJkc/AE5z0Fg9OdSLZ2dOwb4sLWNbNmExSRwGvqUL8GJNqhXCKnRo86brj+lVE+X5KZUAa9yOVSVfz65joM01yZ1Tg6zxt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302661; c=relaxed/simple;
	bh=LyHBGHh0pa8085eT7UHWuWdYRG7dAT6dfZHVJNoi4DE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AyV0n+Ukxzs/QFg/VXj5NIrC1EKUjNE2RmdkWlYAq7sol7XQjCU1UPEha8kAdMfXJfo6mONuG8PJggJcFnK9xiRfu4n6T94INaWa2yC52oLNwW+14hCHRBeStFAQtubn41dg6t+hMMgyHaBnA2flCNeeTflBw291+mSR1vYNlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=1LX5NcJ1; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162d:3d00:c381:7255:a866:916d] (2a02-1812-162d-3d00-c381-7255-a866-916d.ip6.access.telenet.be [IPv6:2a02:1812:162d:3d00:c381:7255:a866:916d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id DCC16785F41;
	Wed, 20 May 2026 20:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1779302657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LyHBGHh0pa8085eT7UHWuWdYRG7dAT6dfZHVJNoi4DE=;
	b=1LX5NcJ1cD+X6QFdPyfLllb1+FvgX/YCJb2c8XI+OeMjjkNivSwscgCxCmRCNVodVPVIM8
	odCuFIIEeDESCRgcl2FQrk1iUDDLt6hMZuN1693Fzt3XGJ3kNVWQ/sb9+HS9kjYxUddmZl
	5I3H+nW7jyX1MCL2ERzimNBhu/wIDRAMZHWGjuzZjayPp9uVy7Y7t4ua8xewJ9jh97ycXa
	XPyh2RGz2fcgm4P6bYWj8VfokchHBO/G+JexNrQXtLNqGWrlfJDddzfnqi8Uyl2VmPXnnW
	ype3WKyphpVcXRZSNft7N3PlJfOa9iz78QQUDkAct1G7CJcn9pNTgNHcO1PUYQ==
Message-ID: <bbdc75ed03f5af92a1dc16095ae5ea60875a774e.camel@svanheule.net>
Subject: Re: [PATCH v3] i2c: i2c-gpio: Enhance driver for buses with shared
 SCL
From: Sander Vanheule <sander@svanheule.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, 
	wsa+renesas@sang-engineering.com, andi.shyti@kernel.org, linusw@kernel.org,
 	brgl@kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 20 May 2026 20:44:15 +0200
In-Reply-To: <20260520173129.1382489-1-markus.stockhausen@gmx.de>
References: <20260520173129.1382489-1-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37230-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,sang-engineering.com,kernel.org,vger.kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[svanheule.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gmx.de:email]
X-Rspamd-Queue-Id: 7042759A118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

Thanks for looking into this. It was on my to-do list for _long_ time, but =
I
never got to it :-(

On Wed, 2026-05-20 at 19:31 +0200, Markus Stockhausen wrote:
> Some lower end hardware (especially Realtek based switches) are
> designed with multiple I2C buses that share a single clock line.
> E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.
>=20
> Enhance the i2c-gpio driver so it can handle such hardware designs.
>=20
> - Detect GPIOs that are used by multiple I2C buses in the dts by
> =C2=A0 using a unique identifier for each managed SCL.
>=20
> - The first probing instance allocates and requests the shared SCL
> =C2=A0 GPIO plus an associated rt_mutex. Subsequent instances detect the
> =C2=A0 existing entry via the identifier and increment a reference count
> =C2=A0 to reuse the descriptor.
>=20
> - All data transfers are serialized via custom lock_ops that handle
> =C2=A0 both the standard adapter bus lock and the shared SCL mutex. This
> =C2=A0 ensures mutual exclusion across adapters sharing the clock line.
>=20
> This patch was successfully tested on Linksys LGS310C that has two
> SFP slots with two GPIO based I2C buses that share a sinlge SCL.
> Test environment: OpenWrt snapshot ported to kernel 6.19.14
> including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

I've updated my Cisco SG220-26 devicetree and it now boots with:


[..] i2c-gpio i2c-temp: Slow GPIO pins might wreak havoc into I2C/SMBus bus
timing
[..] i2c-gpio i2c-temp: using lines 565 (SDA) and 551 (SCL)
[..] i2c-gpio i2c-fan: Slow GPIO pins might wreak havoc into I2C/SMBus bus
timing
[..] i2c-gpio i2c-fan: using lines 567 (SDA) and 551 (SCL)
[..] i2c-gpio i2c-sfp25: Slow GPIO pins might wreak havoc into I2C/SMBus bu=
s
timing
[..] i2c-gpio i2c-sfp25: using lines 549 (SDA) and 551 (SCL)
[..] i2c-gpio i2c-sfp26: Slow GPIO pins might wreak havoc into I2C/SMBus bu=
s
timing
[..] i2c-gpio i2c-sfp26: using lines 550 (SDA) and 551 (SCL)


Four busses sharing a clock line. Nice! SFP detection works and "sensors"
provides meaningful output for the fan and temperature monitors.

Tested-by: Sander Vanheule <sander@svanheule.net>

Best,
Sander

