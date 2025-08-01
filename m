Return-Path: <linux-gpio+bounces-23951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45FB181A4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0DA1C82962
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D3024678D;
	Fri,  1 Aug 2025 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pz92dnm8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133A246765;
	Fri,  1 Aug 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050869; cv=none; b=d5zRjQjG4E7ALARVhx4wr2LVNmFt3MfEsuPmqzwEYlArmLbGvTkkKZha0ZbvWdpqhh+IPdhVR8Y088nOEcJgolAh2+H+2bQCe3aJsqgDNI3OtoKsuYH5tRcw4+wH4B/CdESw33sqxGbotqVeXUIxvy1wibFE3KGDVGF8cdaFy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050869; c=relaxed/simple;
	bh=/qmdPRh6Cf8hysxZiP63hggNV8Z8NHhtUuFazfQfo6A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PNdtCnkh/Mp6BIDtSFB2s/9zPmikfZL4v0GD1+p45sCJaDUCBHBG+nJC2eCWllbskNbNnl865GagixOXAnPj51ZGR02/2SZ1LJm/kIdY+dre96HGASe6XdPlrd7bgMbNlnLA+H5dlFfynJZF+u82HDvjQCSJ/AmUPd5bH1VzL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pz92dnm8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050866;
	bh=/qmdPRh6Cf8hysxZiP63hggNV8Z8NHhtUuFazfQfo6A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pz92dnm8Yo2JZFYDudphkvtf0EP1fHzriCb8Ya6SalNDaJQOd1ayHgsIC5HpylzEf
	 6fSfPF5aMQOYePYfv/hx8fg3Fh6Q/VFzsYrF5/N3CLscN+JMjjX7zVzH/WAlyir0ma
	 Zo9BGcZEqbbGDCdZHeJaShoIeGg9LDXvAUXth+M1sediLCPSL7Hw5XYi/A4vpWCBL+
	 Kha+j7CmhwebimrxwnsztXPZi/HUdmDGa0sobkkQzKdeW2OSTl298HbNpF2Ye4CoPE
	 FKbU1nfcPGcDx49+y68JDKU4TOxP1xD0rNTKyx+4BcRBfhSTORcGqpMq80E6oM2zdB
	 qU4HKQ3JDoGeA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64CB517E046D;
	Fri,  1 Aug 2025 14:21:05 +0200 (CEST)
Message-ID: <7608b4ac1037b0ef92f75624f65be7dcbe07c590.camel@collabora.com>
Subject: Re: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
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
Date: Fri, 01 Aug 2025 14:21:04 +0200
In-Reply-To: <20250716193111.942217-6-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-6-demonsingur@gmail.com>
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
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
>=20
> Document the compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Julien Massot <julien.massot@collabora.com>

