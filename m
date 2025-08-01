Return-Path: <linux-gpio+bounces-23950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A85B1819B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDBF91C24F19
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1857246772;
	Fri,  1 Aug 2025 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KcBU3NSw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82823F294;
	Fri,  1 Aug 2025 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050820; cv=none; b=UskkZUXV5z5tkE/c+Jpcg4WQr6o4qU4em2d08SFpC5aSVhaOmyBusn7Ax3nGy0i4FMbGsg2vr2zxE8VLguyxf6uGuQw5HN0n2fCUI3u7UxADOu2JhZV1TZ/RUKUSDtojVFi3POMRwRFf1HmyXbSHktYBDUf2MJEiNuGlfPd16Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050820; c=relaxed/simple;
	bh=ubzGrW94MWhU2Fj0Rg0wOd3qcRVcxwxlTC0A4cHNNOE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BlOpoQ1eQxnesE7uzufVR4HQORMgOT4pLFUq86Se57kXDaj598Va+4UF0DhozSCuhoP93lw9k5XV/LsCgLck9PZYCwyJE49GszeSoG/4Zo+u2KyYLcye4Wn3Y/UZqIxcLiMeOLmZeHuA3oH4wtABlMW3rVEAzJ2qTWpjoMCmxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KcBU3NSw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050817;
	bh=ubzGrW94MWhU2Fj0Rg0wOd3qcRVcxwxlTC0A4cHNNOE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KcBU3NSwubUUuF9KiS/gQjFWpT21KyD6u2bv7ll3NLS4pb7kbzwbZFncK9IMCXLBB
	 mBPlYAZsmZjKeOX/i/zQwZMdIFNgIqWngHu1Xy9UawZFBMshodx1S7zJUlQKfdoA6f
	 rziJHy8oBrfuxEqGpbxtbD7HIuAcFNbaUZQyY2h8X3UyyUAuMjQ+KgfD8DosVl+gpr
	 Y+CBFo6J9qCqpAJ42Uz0znqdRX2MHl94cnryW+nJVSwFVUfoacRvMcOBOAWJXA5lAJ
	 C631lWnznDvdofbVGKiYC6BZLa41mIsWR+tVYc0LMFApbky+/L5owmH7s1hlJ6SL7t
	 m7jz7l5Mo0X/Q==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 421E717E046D;
	Fri,  1 Aug 2025 14:20:16 +0200 (CEST)
Message-ID: <b3efdf32df6a53f2d7783f2521aae3727fe1e59f.camel@collabora.com>
Subject: Re: [PATCH v6 04/24] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:20:15 +0200
In-Reply-To: <20250716193111.942217-5-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-5-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
>=20
> Add pinctrl/pinconf properties to support this usecase.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20

Reviewed-by: Julien Massot <julien.massot@collabora.com>

