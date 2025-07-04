Return-Path: <linux-gpio+bounces-22780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5CAF88E2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 09:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C8ED4A0CD5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 07:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A65E274B20;
	Fri,  4 Jul 2025 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VrV1onED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A512F271A71;
	Fri,  4 Jul 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613082; cv=none; b=bmlX81ZQcx6Wxn+1m1g9xejkEt/5DTK3Ad3anQFcdYASrBLRnOaEH+8nFF116Nqt963rzoiZD01KaGAQPcaX2nnstPiBW5O2QzFVFHOponwm2oLJaJJ+J2odLQc7mbUiF+Vz7ptIiNSxH8rnoR2FLwJ2nGYbBErhEqrv37D5svI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613082; c=relaxed/simple;
	bh=u1t9kgo32n46P3lCiA/YsRG69hKIm2B9bRzkw/n0hCc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PzYlSYD0q6+2ingtuGxAktyNYRGD2+5iRnEQi3ZdPtBubc0Q3lJzuMIxm4RHYbCAVc/c4VH4dKtcTr5r+8SvEG2vLyZvVHwcgWvl/YQngA/orNzGCxBnVWhoGh8S0TUJ/SEHJ2xG5t/WC44fWvrFly276zTZNd+bhAwZjO02F8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VrV1onED; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751613078;
	bh=u1t9kgo32n46P3lCiA/YsRG69hKIm2B9bRzkw/n0hCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VrV1onEDAPBj1gXtmoDisI701xglCoEK1T4zryC7ADJ75bTtZGaIAJCx4Y+zBoPs9
	 jM2f/d/caI78n4W2MpPqQao8YaRoUF7u30y0XWeTUEDxLcBtmqmPRMGR2ST4oDCJu+
	 Qx6XV7KY1/PubEW2Ziu6FYhvT5UhsTk+aXN8llhNT+E67Ib9Wug3a8gxAQe8iyLJx6
	 tIcOVLsKDZ8XcymS+x2gdF32VGkyCvLqBB1epj+7AvtkVbnqQFHINFE/8SvYN0tDMH
	 hyzc0M3q8/ZRbKrqC64M/xogbPmQeeNgeV7X/3VYKjRNVS/7aJk6Sgjm1Ztl1SbsLF
	 Qt9f/pWZD7hsw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600C8F85cF092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B028B17E0EB8;
	Fri,  4 Jul 2025 09:11:17 +0200 (CEST)
Message-ID: <f2f39aad24dc000bd1066ade7a7a38a072a00664.camel@collabora.com>
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
Date: Fri, 04 Jul 2025 09:11:16 +0200
In-Reply-To: <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
	 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
	 <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
	 <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
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

On Thu, 2025-07-03 at 17:46 +0300, Cosmin Tanislav wrote:
>=20
>=20
> On 7/3/25 4:54 PM, Julien Massot wrote:
> > On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
> > >=20
> > >=20
> > > On 7/3/25 3:07 PM, Julien Massot wrote:
> > > > Hi Cosmin,
> > > >=20
> > > > On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> > > > > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 d=
evices,
> > > > > replacing the few GMSL2 drivers already in upstream, and introduc=
ing a
> > > > > common framework that can be used to implement such GMSL chips, w=
hich
> > > > > avoids code duplication while also adding support for previously
> > > > > unsupported features.
> > > > >=20
> > > > > While the normally acceptable and polite way would be to extend t=
he
> > > > > current mainline drivers, the choice was made here to add a total=
ly new
> > > > > set of drivers. The current drivers support only a small subset o=
f the
> > > > > possible features, and only a few devices, so the end result afte=
r
> > > > > extending them would in any case be essentially fully rewritten, =
new
> > > > > drivers.
> > > > >=20
> > > > Thanks for your work,
> > > > The common framework will help a lot to drive new GMSL chips, and m=
ost of the
> > > > features are covered.
> > > >=20
> > > > > This series depends on support for internal pads, for which a pat=
ch has
> > > > > been added.
> > > > >=20
> > > > > The previous version is at:
> > > > > https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur=
@gmail.com
> > > > >=20
> > > > > The following deserializers are supported:
> > > > > =C2=A0=C2=A0=C2=A0* MAX96712 (already exists in staging)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714 (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714F (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96714R (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96716 (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724 (already exists as part of existing =
MAX96712 driver)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724F (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96724R (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX9296A (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96792A (GMSL3)
> > > > >=20
> > > > > The following serializers are supported:
> > > > > =C2=A0=C2=A0=C2=A0* MAX96717 (already exists)
> > > > > =C2=A0=C2=A0=C2=A0* MAX9295A (GMSL2)
> > > > > =C2=A0=C2=A0=C2=A0* MAX96793 (GMSL3)
> > > > >=20
> > > > > Known backward compatibility breakages:
> > > > > =C2=A0=C2=A0=C2=A0* No default routing. Default routing has been =
intentionally ommitted
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 as the devices support quite complex rou=
ting and it would be
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 unfeasible to provide sane defaults for =
multi-link deserialziers.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 It is expected that userspace programs w=
ould set appropritate
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 routing.
> > > > >=20
> > > > This part is the most annoying one: at the moment, there is no way =
to set the routing except
> > > > by
> > > > manually enabling a boolean within the kernel source.
> > > > You can't guess what routing the user really wants, but please at l=
east provide a default
> > > > routing
> > > > table that allows using your drivers =E2=80=94 for example, the dev=
ice's default routing.
> > > >=20
> > >=20
> > > It's a very delicate issue... I'll try to see if I can do that.
> > > It would be great if we could enable the streams API globally since i=
t's
> > > been merged since Jan 15 2023. It's been over two years.
> > >=20
> > >=20
> > > Thanks,
> > >=20
> > > >=20
> > > >=20
> > > > > The following list enumerates new features that are supported by =
the
> > > > > common framework and their respective chip-specific drivers:
> > > > > =C2=A0=C2=A0=C2=A0* Full Streams API support. Most deserializers =
have support for more
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 than one link, and more than one PHY. St=
reams support allows
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 configuration of routing between these l=
inks and PHYs.
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0* .get_frame_desc() support. Both the serialize=
rs and deserializers
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 implement this to query and provide fram=
e descriptor data. This is
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 used in features explained in-depth belo=
w.
> > > >=20
> > > > So are almost all the sensor drivers incompatible?
> > > >=20
> > >=20
> > > Yes, sensor drivers need to have .get_frame_desc() implemented... It'=
s
> > > not a huge feat and it's the only way this type of bridge could work
> > > properly.
> > >=20
> > > Alternatively, we could add a fallback that bases its decision on the
> > > stream format, but I'd prefer if we didn't and we would just implemen=
t
> > > .get_frame_desc(). After this series is merged I can submit my patche=
s
> > > for imx219.
> > There is already one pending on the mailing list
> > "media: i2c: imx219: Report streams using frame descriptors"
> > I guess it's fine if we require the sensor to implement this function.
> >=20
> > But I had to do it for vgxy61.
> >=20
> > Btw I tested:
> > TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
> > With special lanes mapping and polarities.
> >=20
> > And I had to:
> >=20
> > - Apply pending patches for j721e to support the enable_stream API inst=
ead of s_stream
> > - Enable the experimental v4l2_subdev_enable_streams_api
> > - Add get_frame_desc to the sensor driver
>=20
> Did it work without issues with those changes?
>=20
Yes :)
btw you can add:
Tested-by: Julien Massot <julien.massot@collabora.com>
>=20
> If that's the case then I think all I can do to make it is easier is to
> add default routing. I'm not a fan of each driver having its own
> get_frame_desc() fallback, especially when it's a very small change to
> do to the sensor drivers.
Ok for me.

Ragards,
--=20
Julien

