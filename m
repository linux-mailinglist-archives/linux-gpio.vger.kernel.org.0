Return-Path: <linux-gpio+bounces-22716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD802AF7343
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2A0165A21
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B888E2E3AF0;
	Thu,  3 Jul 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W0C937Il"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64032DE6E2;
	Thu,  3 Jul 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544476; cv=none; b=AbrQf17iDJKgzzbBV/ZRglm198vZkwYrgD+bp1qDR0YkDCLQFyBoUUWJzEoPCF7tBrPvg3nu2W3UJDrQxvkZUaDaJMgn70Xrtkb6ZX8vOaQtBM2bYhYPcVSPVWzk1j4zn1WTI/sKJyUtW5z3dbcACxT6DyIIOmcLX8k/x0uUqxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544476; c=relaxed/simple;
	bh=IekaWCgyefEz+OXynHwXW6gb/bOXeh4BKlACOEukjxo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0h/dotva3oD7pnsszSNtWhR3BOMOes/ff2L84nFa2kL3E5Add1MZgsjAGRUiCjIGArILJ+8CJOYeRgUxbnH4f4mKODLBsqwR1XOiwh9SEECpxx43RQxh0JGGCtjZzYB8OtBjH5dbn5gOCMrb3LUqrINv2b+XoBrFscvPzGQAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W0C937Il; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544471;
	bh=IekaWCgyefEz+OXynHwXW6gb/bOXeh4BKlACOEukjxo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W0C937Ilw/5FnUxJgy1B4bN/DIxN1juOu9aFY0gKEznjcoF30BJrqAO0D4Qhfck9n
	 0Bnfz+uxyBmtoyxa0L+4oWLi95sGGJIt+RW8qq6QnhLUaSroDb+QYo8EvQcZhaZ98O
	 /R4+KznMPQrfVk3e/eknprlpVYTWfcW71/eGoUnPUeW3Pr0RIVpoqp4i3JBkralZjd
	 HyNH9LBS8xoQddgyKhhA1oiDXHJ0AbRYzYhB2sVwBz4y/yz4T5OptWs+gk18o+/aDm
	 8Z4PwPjdIL0b+FDefmYvIYOz28XKoMrN3M7OumPqm8jAwur9mcCp7LgKzxZl2ROWSW
	 9yzyuuv/Wr/zw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600c8f85CF092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 364AA17E059B;
	Thu,  3 Jul 2025 14:07:50 +0200 (CEST)
Message-ID: <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
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
Date: Thu, 03 Jul 2025 14:07:49 +0200
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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

Hi Cosmin,

On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
>=20
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
>=20
Thanks for your work,
The common framework will help a lot to drive new GMSL chips, and most of t=
he
features are covered.

> This series depends on support for internal pads, for which a patch has
> been added.
>=20
> The previous version is at:
> https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gmail.c=
om
>=20
> The following deserializers are supported:
> =C2=A0* MAX96712 (already exists in staging)
> =C2=A0* MAX96714 (already exists)
> =C2=A0* MAX96714F (already exists)
> =C2=A0* MAX96714R (GMSL2)
> =C2=A0* MAX96716 (GMSL2)
> =C2=A0* MAX96724 (already exists as part of existing MAX96712 driver)
> =C2=A0* MAX96724F (GMSL2)
> =C2=A0* MAX96724R (GMSL2)
> =C2=A0* MAX9296A (GMSL2)
> =C2=A0* MAX96792A (GMSL3)
>=20
> The following serializers are supported:
> =C2=A0* MAX96717 (already exists)
> =C2=A0* MAX9295A (GMSL2)
> =C2=A0* MAX96793 (GMSL3)
>=20
> Known backward compatibility breakages:
> =C2=A0* No default routing. Default routing has been intentionally ommitt=
ed
> =C2=A0=C2=A0 as the devices support quite complex routing and it would be
> =C2=A0=C2=A0 unfeasible to provide sane defaults for multi-link deserialz=
iers.
> =C2=A0=C2=A0 It is expected that userspace programs would set appropritat=
e
> =C2=A0=C2=A0 routing.
>=20
This part is the most annoying one: at the moment, there is no way to set t=
he routing except by
manually enabling a boolean within the kernel source.
You can't guess what routing the user really wants, but please at least pro=
vide a default routing
table that allows using your drivers =E2=80=94 for example, the device's de=
fault routing.



> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
> =C2=A0* Full Streams API support. Most deserializers have support for mor=
e
> =C2=A0=C2=A0 than one link, and more than one PHY. Streams support allows
> =C2=A0=C2=A0 configuration of routing between these links and PHYs.
>=20
> =C2=A0* .get_frame_desc() support. Both the serializers and deserializers
> =C2=A0=C2=A0 implement this to query and provide frame descriptor data. T=
his is
> =C2=A0=C2=A0 used in features explained in-depth below.

So are almost all the sensor drivers incompatible?

>=20
> =C2=A0* .get_mbus_config() support. The deserializers implement this to a=
llow
> =C2=A0=C2=A0 upstream devices to query the link frequency of its pads.
>=20
> =C2=A0* Address translation with I2C ATR for the serializers.
>=20
> =C2=A0* I2C ATR translation - some deserializers cannot do muxing since I=
2C
> =C2=A0=C2=A0 communication channel masking is not available per-link, and=
 the only
> =C2=A0=C2=A0 other way to select links is to turn them off, causing link =
resets.
> =C2=A0=C2=A0 For such cases, I2C ATR is used to change the address of the
> =C2=A0=C2=A0 serializers at probe time.
>=20
> =C2=A0* Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbp=
s, GMSL2
> =C2=A0=C2=A0 3Gbps.
>=20
> =C2=A0* Automatic stream id selection for deserializers which need serial=
izers to
> =C2=A0=C2=A0 stream on unique stream ids.
>=20
> =C2=A0* Automatic VC remapping on the deserializers. VCs are picked so th=
at
> =C2=A0=C2=A0 if they were unique on the sink pad, they will end up as uni=
que on
> =C2=A0=C2=A0 the source pad they are routed to too, prioritizing using th=
e same
> =C2=A0=C2=A0 VC ID as the sink pad, to facilitate the possibility of usin=
g tunnel
> =C2=A0=C2=A0 mode.
>=20
> =C2=A0* Automatic pixel mode / tunnel mode selection. Tunnel mode is used
> =C2=A0=C2=A0 when VC IDs do not need to be changed and all hardware suppo=
rts
> =C2=A0=C2=A0 tunnel mode, otherwise, pixel mode is used. The serializers =
are
> =C2=A0=C2=A0 automatically switched between the two by using a private AP=
I.
>=20
> =C2=A0* Automatic double mode selection. In pixel mode, double mode can b=
e
> =C2=A0=C2=A0 used to pack two pixels into a single data unit, optimizing =
bandwidth
> =C2=A0=C2=A0 usage. The serializers are automatically set up to support t=
he double
> =C2=A0=C2=A0 modes determined by the deserializers using a private API.
>=20
> =C2=A0* Automatic data padding. In pixel mode, if the data being transfer=
red
> =C2=A0=C2=A0 uses two different BPPs, data needs to be padded. The serial=
izers
> =C2=A0=C2=A0 automatically set this up depending on the configured double=
 mode
> =C2=A0=C2=A0 settings and incoming data types.
>=20
> =C2=A0* Logging. Both the deserializers and serializers implement the V4L=
2
> =C2=A0=C2=A0 .log_status() ops to allow debugging of the internal state a=
nd
> =C2=A0=C2=A0 important chip status registers.
>=20
> =C2=A0* PHY modes. Deserializer chips commonly have more than a single PH=
Y.
> =C2=A0=C2=A0 The firmware ports are parsed to determine the modes in whic=
h to
> =C2=A0=C2=A0 configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variatio=
ns using
> =C2=A0=C2=A0 fewer lanes).
>=20
> =C2=A0* Serializer pinctrl. Serializers implement pinctrl to allow settin=
g
> =C2=A0=C2=A0 configs which would otherwise be inaccessible through GPIO: =
TX/RX via
> =C2=A0=C2=A0 GMSL link, pull-up & pull-down (with strength), open-drain &
> =C2=A0=C2=A0 push-pull, slew rate, RCLK pin selection.
>=20
> =C2=A0* TPG with selectable formats, resolutions and framerates for both
> =C2=A0=C2=A0 serializers and deserializers.
>=20
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
> =C2=A0* Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
> =C2=A0* Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
> =C2=A0* Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219
>=20
> Analog Devices is taking responsibility for the maintenance of these
> drivers and common framework, and plans to add support for new
> broad-market chips on top of them.
>=20
> Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.=
com>
> for testing the drivers, helping debug and coming up with ideas /
> implementations for various features.
>=20
> V5:
> =C2=A0* dt-bindings: max96717: restrict RCLKOUT to pins 2 & 4
> =C2=A0* dt-bindings: max96717: remove confusing rclksel pinconf property
> =C2=A0* dt-bindings: max96717: remove maxim,gmsl-tx/rx pinconf property
> =C2=A0* dt-bindings: max96717: remove gmsl prefix from maxim,gmsl-tx-id/r=
x-id
> =C2=A0* dt-bindings: max96717: remove minimum: 0
> =C2=A0* dt-bindings: max96717: better document slew-rate
> =C2=A0* dt-bindings: max96717: better document maxim,jitter-compensation
> =C2=A0* dt-bindings: max96717: better document maxim,tx-id/rx-id
>=20
> =C2=A0* max_serdes: add default TPG values
> =C2=A0* max_serdes: remove MAX_MIPI_FMT macro
> =C2=A0* max_serdes: EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
> =C2=A0* max_serdes: remove EXPORT_SYMBOL_GPL from symbols not used in oth=
er
> =C2=A0=C2=A0 modules
> =C2=A0* max_serdes: rename symbols/macros/types to have max_serdes prefix
> =C2=A0* max_serdes: slim down TPG functions
>=20
> =C2=A0* max_des: fix may be used uninitialized errors
> =C2=A0* max_des: fix misplaced TPG validation
> =C2=A0* max_des: fix setting pipe PHY in tunnel mode for chips that suppo=
rt
> =C2=A0=C2=A0 both set_pipe_phy() and set_pipe_tunnel_phy()
> =C2=A0* max_des: move doubled_bpp/sink_bpps variables to usage place
> =C2=A0* max_des: do not dynamically control PHY enable, letting lanes be =
in
> =C2=A0=C2=A0 LP-11 when not streaming
> =C2=A0* max_des: refactor get/set_pipe_stream_id() logic
> =C2=A0* max_des: remove explicit ret =3D 0
>=20
> =C2=A0* max_ser: make VC remaps not pipe-specific, allocate dynamically
>=20
> =C2=A0* max9296a: add missing 1080p30 TPG entry
> =C2=A0* max9296a: move BIT() left shift into macro
> =C2=A0* max9296a: move BIT() ternary into macro
> =C2=A0* max9296a: reuse max_des_ops for chip-specific ops\
> =C2=A0* max9296a: document and compress RLMS register writes
>=20
> =C2=A0* max96717: restrict RCLKOUT to pins 2 & 4 because of hardware
> =C2=A0=C2=A0 capabilities
> =C2=A0* max96717: add support for XTAL/1, XTAL/2, XTAL/4 clocks
> =C2=A0* max96717: set RX_EN/TX_EN automatically
> =C2=A0* max96717: reorder custom pinconf flags
> =C2=A0* max96717: drop OF dependency
>=20
> =C2=A0* drop of_match_ptr
> =C2=A0* re-do some indentation
> =C2=A0* implement TPG pattern control
> =C2=A0* remove pr_info() usage
> =C2=A0* inline lane polarity val =3D 0
> =C2=A0* inline returns
> =C2=A0* rewrite some Kconfig docs
> =C2=A0* split up patches for easier review
>=20
> V4:
> =C2=A0* max_des: fix infinite version loop
> =C2=A0* max_des: fix pipe link id when there are more pipes than links
> =C2=A0* max_des: implement setting pipe link
> =C2=A0* max_des: do not pass routing to phy update
> =C2=A0* max_des: move GMSL version strings to max_serdes
> =C2=A0* max_des: split finding existing VC remap from adding a new one
> =C2=A0* max_des: add tracking for in-use pipes
> =C2=A0* max_des: skip unused pipes when finding / setting pixel/tunnel mo=
de
> =C2=A0* max_des: simplify remap code
> =C2=A0* max_des: split set_pipe_phy() into set_pipe_tunnel_phy()
>=20
> =C2=A0* max_ser: clean up i2c_xlates printing
> =C2=A0* max_ser: fix changing serializer address
> =C2=A0* max_ser: move non-continuous mode check into max96717 driver
>=20
> =C2=A0* max96724: use regmap_set_bits for STREAM_SEL_ALL
> =C2=A0* max96724: match surrounding indent for MAX96724_PHY1_ALT_CLOCK
> =C2=A0* max96724: fix setting invalid PHY to 1 when PHY 0 is in 4-lane mo=
de
> =C2=A0* max96724: remove support for setting pipe phy from max96712
> =C2=A0* max96724: fix setting double mode on pipes 4-7
> =C2=A0* max96724: drop powerdown gpios
>=20
> =C2=A0* max96717: use gpio_chip's set_rv
>=20
> =C2=A0* max9296a: switch versions to unsigned int
> =C2=A0* max9296a: remove parantheses from MAX9296A_MIPI_PHY18/20
> =C2=A0* max9296a: fix printing of PHY packet counts
> =C2=A0* max9296a: fix phy_hw_ids size
>=20
> =C2=A0* remove usage of cammel case in defines
> =C2=A0* move field_get/prep to max_serdes.h
> =C2=A0* rework stream id setup
> =C2=A0* rework tunnel/pixel mode finding
> =C2=A0* rework bpps retrieval
> =C2=A0* pass whole subdev state around
> =C2=A0* add helper for retrieving a route's hw components / frame desc
> =C2=A0* update pipe enable based on active routes
> =C2=A0* add support for tunnel-only chips and VC remaps in tunnel mode
> =C2=A0* simplify max_get_streams_masks()
> =C2=A0* add support for TPG
>=20
> V3:
> =C2=A0* dt-bindings: drop reflow text patches
>=20
> =C2=A0* dt-bindings: max96717: move pinctrl configuration into main file
> =C2=A0* dt-bindings: max96717: allow a single level of pins configuration
> =C2=A0* dt-bindings: max96717: use regex for matching pins nodes
> =C2=A0* dt-bindings: max96717: drop extra allOf in pinctrl configuration
> =C2=A0* dt-bindings: max96717: fix i2c-atr channel name regex
> =C2=A0* dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
> =C2=A0* dt-bindings: max96717: limit pins for gpio / rclkout
> =C2=A0* dt-bindings: max96717: add description for bias-pull-up/down
> =C2=A0* dt-bindings: max96717: require pins and function properties
> =C2=A0* dt-bindings: max96717: turn single compatible strings into an enu=
m
>=20
> =C2=A0* dt-bindings: max9296a: include indices in port descriptions
> =C2=A0* dt-bindings: max9296a: remove property-less schema from input por=
ts
> =C2=A0* dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX en=
tirely
>=20
> =C2=A0* dt-bindings: max96712: include indices in port descriptions
> =C2=A0* dt-bindings: max96712: deprecate enable-gpios in favor of powerdo=
wn-gpios
> =C2=A0* dt-bindings: max96712: switch from MUX to ATR
>=20
> =C2=A0* dt-bindings: max96714: add support for MAX96714R
>=20
> =C2=A0* max_des: fix POC NULL check
> =C2=A0* max_des: remove index var in POC enable
> =C2=A0* max_des: fix writing empty remaps
> =C2=A0* max_des: skip mode setting in tunnel mode
> =C2=A0* max_des: remove a duplicate source->sd NULL check
> =C2=A0* max_des: set pipe tunnel mode even for disabled links
>=20
> =C2=A0* max_ser: apply TX ID changes irrespective of serializer ID
>=20
> =C2=A0* max9296a: fix typo in BACKTOP22
> =C2=A0* max9296a: make register macros more consistent
> =C2=A0* max9296a: switch MAX96716 from MUX to ATR
> =C2=A0* max9296a: deduplicate max9296a_phy_id() logic
> =C2=A0* max9296a: use proper PHY id in remaps
> =C2=A0* max9296a: fix DPLL reset clear
> =C2=A0* max9296a: limit MAX96714F to GMSL2 3Gbps
> =C2=A0* max9296a: add support for MAX96714R
> =C2=A0* max9296a: do not write GMSL3 link select registers in GMSL2 devic=
es
> =C2=A0* max9296a: use field_prep when setting RX_RATE
> =C2=A0* max9296a: simplify setting SEL_STREAM for MAX96714
> =C2=A0* max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
> =C2=A0* max9296a: fix off-by-one in lane polarity when using
> =C2=A0=C2=A0 polarity_on_physical_lanes
>=20
> =C2=A0* max96724: fix typo in BACKTOP22
> =C2=A0* max96724: switch from MUX to ATR
> =C2=A0* max96724: add support for powerdown GPIO
> =C2=A0* max96724: remove support for tunneling from MAX96712
> =C2=A0* max96724: only set tunnel-related bits when in tunnel mode
> =C2=A0* max96724: add support for MAX96724F/R
> =C2=A0* max96724: oneshot reset links after link selection
>=20
> =C2=A0* remove GMSL2 version defaults, set all supported versions explici=
tly
> =C2=A0* reorder GMSL versions to start from 0
> =C2=A0* add support for GMSL2 3Gbps
> =C2=A0* support GMSL version finding for devices using MUX / GATE
> =C2=A0* add support for deserializers which don't have individual control
> =C2=A0=C2=A0 of each link's GMSL version
> =C2=A0* add support for deserializers that need unique stream ids across =
all
> =C2=A0=C2=A0 serializers
> =C2=A0* select_link_version -> set_link_version
> =C2=A0* select_resets_link -> use_atr
>=20
> V2:
> =C2=A0* add missing compatible for MAX96717F
> =C2=A0* fix embarrassing dt-bindings mistakes
> =C2=A0* move MAX9296A/MAX96716/MAX96792A to a separate file as they have =
two
> =C2=A0=C2=A0 links / PHYs, and adding those conditionally seems impossibl=
e
>=20
> Cosmin Tanislav (23):
> =C2=A0 dt-bindings: media: i2c: max96717: add myself as maintainer
> =C2=A0 dt-bindings: media: i2c: max96717: add support for I2C ATR
> =C2=A0 dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
> =C2=A0 dt-bindings: media: i2c: max96717: add support for MAX9295A
> =C2=A0 dt-bindings: media: i2c: max96717: add support for MAX96793
> =C2=A0 dt-bindings: media: i2c: max96712: add myself as maintainer
> =C2=A0 dt-bindings: media: i2c: max96712: use pattern properties for port=
s
> =C2=A0 dt-bindings: media: i2c: max96712: add support for I2C ATR
> =C2=A0 dt-bindings: media: i2c: max96712: add support for POC supplies
> =C2=A0 dt-bindings: media: i2c: max96712: add support for MAX96724F/R
> =C2=A0 dt-bindings: media: i2c: max96714: add myself as maintainer
> =C2=A0 dt-bindings: media: i2c: max96714: add support for MAX96714R
> =C2=A0 dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
> =C2=A0 media: i2c: add Maxim GMSL2/3 serializer and deserializer framewor=
k
> =C2=A0 media: i2c: add Maxim GMSL2/3 serializer framework
> =C2=A0 media: i2c: add Maxim GMSL2/3 deserializer framework
> =C2=A0 media: i2c: maxim-serdes: add MAX96717 driver
> =C2=A0 media: i2c: maxim-serdes: add MAX96724 driver
> =C2=A0 media: i2c: maxim-serdes: add MAX9296A driver
> =C2=A0 arm64: defconfig: disable deprecated MAX96712 driver
> =C2=A0 staging: media: remove MAX96712 driver
> =C2=A0 media: i2c: remove MAX96717 driver
> =C2=A0 media: i2c: remove MAX96714 driver
>=20
> Sakari Ailus (1):
> =C2=A0 media: mc: Add INTERNAL pad flag
>=20
> =C2=A0.../bindings/media/i2c/maxim,max9296a.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0 242 ++
> =C2=A0.../bindings/media/i2c/maxim,max96712.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 70 +-
> =C2=A0.../bindings/media/i2c/maxim,max96714.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 6 +-
> =C2=A0.../bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0 155 +-
> =C2=A0.../media/mediactl/media-types.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 13 +-
> =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 1 -
> =C2=A0drivers/media/i2c/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 34 +-
> =C2=A0drivers/media/i2c/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 3 +-
> =C2=A0drivers/media/i2c/max96714.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1017 ----=
--
> =C2=A0drivers/media/i2c/max96717.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1102 ----=
--
> =C2=A0drivers/media/i2c/maxim-serdes/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 55 +
> =C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0drivers/media/i2c/maxim-serdes/max9296a.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1354 +++++++
> =C2=A0drivers/media/i2c/maxim-serdes/max96717.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1685 +++++++++
> =C2=A0drivers/media/i2c/maxim-serdes/max96724.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1180 +++++++
> =C2=A0drivers/media/i2c/maxim-serdes/max_des.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 3111 +++++++++++++++++
> =C2=A0drivers/media/i2c/maxim-serdes/max_des.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 151 +
> =C2=A0drivers/media/i2c/maxim-serdes/max_ser.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2075 +++++++++++
> =C2=A0drivers/media/i2c/maxim-serdes/max_ser.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 145 +
> =C2=A0drivers/media/i2c/maxim-serdes/max_serdes.c=C2=A0=C2=A0 |=C2=A0 413=
 +++
> =C2=A0drivers/media/i2c/maxim-serdes/max_serdes.h=C2=A0=C2=A0 |=C2=A0 183=
 +
> =C2=A0drivers/media/mc/mc-entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 10 +-
> =C2=A0drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 2 -
> =C2=A0drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 -
> =C2=A0drivers/staging/media/max96712/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 14 -
> =C2=A0drivers/staging/media/max96712/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 -
> =C2=A0drivers/staging/media/max96712/max96712.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 487 ---
> =C2=A0include/uapi/linux/media.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A029 files changed, 10839 insertions(+), 2687 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/media/i2c/maxi=
m,max9296a.yaml
> =C2=A0delete mode 100644 drivers/media/i2c/max96714.c
> =C2=A0delete mode 100644 drivers/media/i2c/max96717.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
> =C2=A0delete mode 100644 drivers/staging/media/max96712/Kconfig
> =C2=A0delete mode 100644 drivers/staging/media/max96712/Makefile
> =C2=A0delete mode 100644 drivers/staging/media/max96712/max96712.c

Regards,
Julien

