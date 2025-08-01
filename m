Return-Path: <linux-gpio+bounces-23953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD2B181AE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FCAD3A4A37
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D215324679E;
	Fri,  1 Aug 2025 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZMk4dJjU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37A6246772;
	Fri,  1 Aug 2025 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050993; cv=none; b=mGxsTYdn5Hzb9MR7yug288o5itOyi/4iztjCt81ep3+b+AfziTR74Nujmsva4eDQci5+v4CIiKAjV/ZMjvZcT8LqAOXy37ceL9lT9q1K5xG3wmAbAZRojYOc5RBpz1YZ7I7E0YzWDTjzojMvk/k8O2/xBZsvyXYXtC4khm3ClPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050993; c=relaxed/simple;
	bh=Gd04OOLTcUdYHILu/YZcz4ZXhF6ZSYvXhUuGSBvshcc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iBq/cqsHQusmaZN7jjdep8jtD0axyyP4dXCJdOhWNfdVprPeLjhaic92VXwY3jJ0EsJpRWRza2GOLiHmo2KJ21RLzpFckwUWXih7B13aybmurtduQCtumAoFUVIlCk/B8tkmjrU+NdubXao7azC5yX2zMwwefTqrNkrSzRFZZA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZMk4dJjU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050990;
	bh=Gd04OOLTcUdYHILu/YZcz4ZXhF6ZSYvXhUuGSBvshcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZMk4dJjUxi6IG69VDUmWevwMoCDLVrpBpl0bX8BtOzJMQIDWF7f4Kqn1fX+sfVs/T
	 yfgr1vkYrPUM4+HvbUSUI+PVSMnVdGDphw596c4IhvyfJuSiFjaaogUiCylb8+Br7T
	 wDQy77GwuxortMCiNCINpjJZhI6v57wlUH0uGbStMcA2ekAZrM8x4DvILEDEELd40V
	 AlZf9HlinXae4zySR2nZzGPrPf2RcO81n7S/p89n2drl+FjC3GQRBfIpdZF2xkVhWU
	 zszQ9TlNusXc4avQbBrcWEGlld+vi0Q0MJqsC0sL4syYmmEZi2agxQKimMCjPBPIxJ
	 Ow+02NjsWrFPw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cf092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5919417E0DD7;
	Fri,  1 Aug 2025 14:23:09 +0200 (CEST)
Message-ID: <e65da901e52067b22ff463cd886a3539d11da88d.camel@collabora.com>
Subject: Re: [PATCH v6 13/24] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
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
Date: Fri, 01 Aug 2025 14:23:08 +0200
In-Reply-To: <20250716193111.942217-14-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-14-demonsingur@gmail.com>
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
> MAX96714R is a lower capability variant of the MAX96714 which only
> supports a fixed rate of 3Gbps in the forward direction.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
>=20
Reviewed-by: Julien Massot <julien.massot@collabora.com>

