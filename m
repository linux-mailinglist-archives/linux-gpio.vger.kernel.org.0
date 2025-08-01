Return-Path: <linux-gpio+bounces-23952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353BB181A8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921D01C806A2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF2E246774;
	Fri,  1 Aug 2025 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QWjdwY3+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD322F757;
	Fri,  1 Aug 2025 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050929; cv=none; b=IAl9H8gxJtqoO7itrrS3Fh4BbWvChU1tk1iD4xAJZTSj3JRLYU7CDD2lhJCWV0/hbLqNYzXI3tx7ymj+ckPaTgnLwHTUvUqFLrzFcUCmAFr1w1hvT7+pTdvUzJFtoU3DUquhxSg8kR3h6QGsAA6+TGsBnmAXKCsCD+kLPrlMQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050929; c=relaxed/simple;
	bh=yQIN+GJox3PRR2AEDjZ0/YWRMM1FlvIBDxZzDOs5vbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQ/lefVwX75cLKfwTVen7/WZ0uRcxokIxb/aBjs6im9OyyzFUDoCKa7v3jaaTtgeDPLJXWz5i3QlxSbhcdqYrTqk2v4j9S/tkZ/l9A8u5xNiQQ7eiyn6oukQO58QEElBkRC7fGZ8GqnrW6zusMyvHNmfBvfoJOJ2bpncqSILHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QWjdwY3+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050926;
	bh=yQIN+GJox3PRR2AEDjZ0/YWRMM1FlvIBDxZzDOs5vbs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QWjdwY3+GTUmpfeaFszOitsj+G/Pttq5r+Ka4+gs6cJEVGt2nt0Z/L5lIpfew4QD6
	 lIGCmAwDEeJ2aThVf2Yv6uZVBXrEClI4hi7pt+6OaYswiQv4PvMjUdG2LjXoDRMcdc
	 u8rtlFMWI1zzSvJ621PQbCyWNQDmADDf64VZma4h0HkTle9vUFVsTHC7ynuGxJ/ylZ
	 VF/DAtQ1fFS9okd3uix2gGC3ZH/F5yap0IZeY2GFuyv8N7/4LqmgL83WhDcw+WQOCk
	 S20arNJiczCI956PIgEkROK/wVslGUZFo0BasCpu8mMs+dOS5qoYmbsIMv2P/1hSLQ
	 chMQwzWUfYYkg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cf092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9048117E0DD7;
	Fri,  1 Aug 2025 14:22:05 +0200 (CEST)
Message-ID: <7b8f2e03cb0f1477e352ac59da638a3cae83623b.camel@collabora.com>
Subject: Re: [PATCH v6 12/24] dt-bindings: media: i2c: max96714: add myself
 as maintainer
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
Date: Fri, 01 Aug 2025 14:22:04 +0200
In-Reply-To: <20250716193111.942217-13-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-13-demonsingur@gmail.com>
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
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
>=20
Reviewed-by: Julien Massot <julien.massot@collabora.com>

