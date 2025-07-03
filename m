Return-Path: <linux-gpio+bounces-22734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF30AF7635
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 15:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DA7188E7F5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E132E764A;
	Thu,  3 Jul 2025 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vn1T+Adm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945518DB0D;
	Thu,  3 Jul 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550865; cv=none; b=dKIYSO5bhkCmrdwPeu8KlLzILDQnm5nnhlTr6YYDm6CD/BfIlgYaTWRGaZuZultIqco0rBcY9eJwl0U0VSMXVZIedyVNi6vSglRuaye+z4n22SDAr8+XC/st5Bm2+vF1ZnSGphuQIQoQ9uqqmhsZK0oqf4d86LbKK9loR7KowJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550865; c=relaxed/simple;
	bh=y78VCoYM7VevEWRRosTle7tdkMGhmFsw5rVCtfwQPJE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cB0vRXQA+asG8iymECk3kzmfWchbYGxH8cKsxvQMTseM+vXaPxoxsf2AdDZtPWHU1yjbJQ43SFOlPEhnirLmOKqBEcwckEq0iLjkhagzY+n1ei09ka7IgTp491MCkcCYwHDPha6bg4mygnHf8laiPn8yp+ROq0AaXKs13jXs+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vn1T+Adm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751550861;
	bh=y78VCoYM7VevEWRRosTle7tdkMGhmFsw5rVCtfwQPJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vn1T+Adm7dAOD3R6Sydh5vATGD9TWJZ4xQXiRE2DGkOlDTfk8bXDfo1eKlk5S0p09
	 Cs1wSRHanBGrFcD7QGpKHsDdMM6DPuPD5fq9rgNa+XNfdApZ+QCISKe+Ehdavsq38a
	 3/U6GI2l5Fd+yxnDlYMfCO+flzBFFXnm8D4eKs771kVmY/bUWBqJVEA1pSJTc/Umkh
	 Z0NjYxF51gOFpCuK07R3mhiGz1KP9VVVfkS0z6+nJACp5nzBw8zKn0b7lA50o6lNzI
	 x4oH7h8fKJJgQtvZ34p/4pPJ0J8CqnjwaSl+xugSXkP65tazWhdrDHqH96Kj65JoGQ
	 R6D9TUmYAR9FQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600c8F85cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA95C17E04C0;
	Thu,  3 Jul 2025 15:54:20 +0200 (CEST)
Message-ID: <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
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
Date: Thu, 03 Jul 2025 15:54:20 +0200
In-Reply-To: <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
	 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
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

On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
>=20
>=20
> On 7/3/25 3:07 PM, Julien Massot wrote:
> > Hi Cosmin,
> >=20
> > On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> > > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devic=
es,
> > > replacing the few GMSL2 drivers already in upstream, and introducing =
a
> > > common framework that can be used to implement such GMSL chips, which
> > > avoids code duplication while also adding support for previously
> > > unsupported features.
> > >=20
> > > While the normally acceptable and polite way would be to extend the
> > > current mainline drivers, the choice was made here to add a totally n=
ew
> > > set of drivers. The current drivers support only a small subset of th=
e
> > > possible features, and only a few devices, so the end result after
> > > extending them would in any case be essentially fully rewritten, new
> > > drivers.
> > >=20
> > Thanks for your work,
> > The common framework will help a lot to drive new GMSL chips, and most =
of the
> > features are covered.
> >=20
> > > This series depends on support for internal pads, for which a patch h=
as
> > > been added.
> > >=20
> > > The previous version is at:
> > > https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gma=
il.com
> > >=20
> > > The following deserializers are supported:
> > > =C2=A0=C2=A0* MAX96712 (already exists in staging)
> > > =C2=A0=C2=A0* MAX96714 (already exists)
> > > =C2=A0=C2=A0* MAX96714F (already exists)
> > > =C2=A0=C2=A0* MAX96714R (GMSL2)
> > > =C2=A0=C2=A0* MAX96716 (GMSL2)
> > > =C2=A0=C2=A0* MAX96724 (already exists as part of existing MAX96712 d=
river)
> > > =C2=A0=C2=A0* MAX96724F (GMSL2)
> > > =C2=A0=C2=A0* MAX96724R (GMSL2)
> > > =C2=A0=C2=A0* MAX9296A (GMSL2)
> > > =C2=A0=C2=A0* MAX96792A (GMSL3)
> > >=20
> > > The following serializers are supported:
> > > =C2=A0=C2=A0* MAX96717 (already exists)
> > > =C2=A0=C2=A0* MAX9295A (GMSL2)
> > > =C2=A0=C2=A0* MAX96793 (GMSL3)
> > >=20
> > > Known backward compatibility breakages:
> > > =C2=A0=C2=A0* No default routing. Default routing has been intentiona=
lly ommitted
> > > =C2=A0=C2=A0=C2=A0 as the devices support quite complex routing and i=
t would be
> > > =C2=A0=C2=A0=C2=A0 unfeasible to provide sane defaults for multi-link=
 deserialziers.
> > > =C2=A0=C2=A0=C2=A0 It is expected that userspace programs would set a=
ppropritate
> > > =C2=A0=C2=A0=C2=A0 routing.
> > >=20
> > This part is the most annoying one: at the moment, there is no way to s=
et the routing except by
> > manually enabling a boolean within the kernel source.
> > You can't guess what routing the user really wants, but please at least=
 provide a default
> > routing
> > table that allows using your drivers =E2=80=94 for example, the device'=
s default routing.
> >=20
>=20
> It's a very delicate issue... I'll try to see if I can do that.
> It would be great if we could enable the streams API globally since it's
> been merged since Jan 15 2023. It's been over two years.
>=20
>=20
> Thanks,
>=20
> >=20
> >=20
> > > The following list enumerates new features that are supported by the
> > > common framework and their respective chip-specific drivers:
> > > =C2=A0=C2=A0* Full Streams API support. Most deserializers have suppo=
rt for more
> > > =C2=A0=C2=A0=C2=A0 than one link, and more than one PHY. Streams supp=
ort allows
> > > =C2=A0=C2=A0=C2=A0 configuration of routing between these links and P=
HYs.
> > >=20
> > > =C2=A0=C2=A0* .get_frame_desc() support. Both the serializers and des=
erializers
> > > =C2=A0=C2=A0=C2=A0 implement this to query and provide frame descript=
or data. This is
> > > =C2=A0=C2=A0=C2=A0 used in features explained in-depth below.
> >=20
> > So are almost all the sensor drivers incompatible?
> >=20
>=20
> Yes, sensor drivers need to have .get_frame_desc() implemented... It's
> not a huge feat and it's the only way this type of bridge could work
> properly.
>=20
> Alternatively, we could add a fallback that bases its decision on the
> stream format, but I'd prefer if we didn't and we would just implement
> .get_frame_desc(). After this series is merged I can submit my patches
> for imx219.
There is already one pending on the mailing list
"media: i2c: imx219: Report streams using frame descriptors"
I guess it's fine if we require the sensor to implement this function.

But I had to do it for vgxy61.

Btw I tested:
TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
With special lanes mapping and polarities.

And I had to:

- Apply pending patches for j721e to support the enable_stream API instead =
of s_stream
- Enable the experimental v4l2_subdev_enable_streams_api
- Add get_frame_desc to the sensor driver

