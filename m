Return-Path: <linux-gpio+bounces-22717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7EEAF734B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 152C3563838
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120D2E3B0F;
	Thu,  3 Jul 2025 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hsYnL7wW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3E6EB79;
	Thu,  3 Jul 2025 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544530; cv=none; b=npsBw8ZpjXkoJglnCcShf0PQ2xA2T+2jMCqj8wZGtOFRHH5Hej5fzdXpp2gHeO+qmKZB+jShfe3qoa/Gt2ujoTfsm5bzyX5TBk9dLGklIexUXQOoHdoaG2ADVlFo/Y//FfalYp4lnIt1mPVLLmJfSvCH7cJCQkcuRuapcfCzpOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544530; c=relaxed/simple;
	bh=H6imShkiI7+4Y/sQCjW5gOqgX5DJ0kIynHNTMC/ekwM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XKa7PS7DnrnsS3AaeAXNJt/uvJXlT2/XHKtxH1GmIeEROCwZ0RhjNuTC1k/Z3R2u35CwETagUHvWYD+YF2s8F71btNmXoJqer9KCk6uvumxnRGqFBFaj3kVIY2YVA3TYkTF2DfgwpPvuggl1VJQSN266b42DhpE2WmECWM/PG4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hsYnL7wW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544525;
	bh=H6imShkiI7+4Y/sQCjW5gOqgX5DJ0kIynHNTMC/ekwM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hsYnL7wWxl0Iu9A8GjX89HYlxe1Sq/FnK1F0hL0h7hzsU/892h1kCvHY++pXZjHMV
	 Zc43nzUsgjTGwixBwEX+OyMO5ASgQhGJt1ma/NH8uW2WfEtOCUu/rJUkFH2b5jciBK
	 BlHCQVOFLeDEpYrik1dNNftrSj4fJvA8+pom9subuS01qYRXODIgxyutHpG6W93Xts
	 MHbBOlQ3BPGTjlSvaw7R3C4DG66Tb5TXt+yGsRa+EOtPS1Mm9lmNNGny5BJubznfEz
	 yQR6WUJevcix4L2zfnjGj/Li4ldFriJUYuPUtIWkXQGjJcqK1QDmY2mU5emCZKS42Q
	 sgllXlh3BEW6Q==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600c8F85cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 272FC17E059B;
	Thu,  3 Jul 2025 14:08:45 +0200 (CEST)
Message-ID: <cc449f4230ebf2cc854c456d60db4814bb1e1f8a.camel@collabora.com>
Subject: Re: [PATCH v5 15/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
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
Date: Thu, 03 Jul 2025 14:08:44 +0200
In-Reply-To: <20250702132104.1537926-16-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-16-demonsingur@gmail.com>
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
> These drivers are meant to be used as a common framework for Maxim
> GMSL2/3 serializers and deserializers.
>=20
> This framework enables support for the following new features across
> all the chips:
> =C2=A0* Full Streams API support
> =C2=A0* .get_frame_desc()
> =C2=A0* .get_mbus_config()
> =C2=A0* I2C ATR
> =C2=A0* automatic GMSL link version negotiation
> =C2=A0* automatic stream id selection
> =C2=A0* automatic VC remapping
> =C2=A0* automatic pixel mode / tunnel mode selection
> =C2=A0* automatic double mode selection / data padding
> =C2=A0* logging of internal state and chip status registers via .log_stat=
us()
> =C2=A0* PHY modes
> =C2=A0* serializer pinctrl
> =C2=A0* TPG
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0drivers/media/i2c/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +
> =C2=A0drivers/media/i2c/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0drivers/media/i2c/maxim-serdes/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 16 +
> =C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +
> =C2=A0drivers/media/i2c/maxim-serdes/max_serdes.c | 413 +++++++++++++++++=
+++
> =C2=A0drivers/media/i2c/maxim-serdes/max_serdes.h | 183 +++++++++
> =C2=A07 files changed, 619 insertions(+)
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 334195989c00..8cd57b66afe3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14769,6 +14769,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +F:	drivers/media/i2c/maxim-serdes/
> =C2=A0
> =C2=A0MAXIM MAX11205 DRIVER
> =C2=A0M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4c199da6ea..f504016aadfd 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1700,6 +1700,8 @@ config VIDEO_MAX96717
> =C2=A0	=C2=A0 To compile this driver as a module, choose M here: the
> =C2=A0	=C2=A0 module will be called max96717.
> =C2=A0
> +source "drivers/media/i2c/maxim-serdes/Kconfig"
> +
> =C2=A0endmenu
> =C2=A0
> =C2=A0endif # VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 5873d29433ee..25a0093d40ec 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) +=3D max9271.o
> =C2=A0obj-$(CONFIG_VIDEO_MAX9286) +=3D max9286.o
> =C2=A0obj-$(CONFIG_VIDEO_MAX96714) +=3D max96714.o
> =C2=A0obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
> +obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D maxim-serdes/
> =C2=A0obj-$(CONFIG_VIDEO_ML86V7667) +=3D ml86v7667.o
> =C2=A0obj-$(CONFIG_VIDEO_MSP3400) +=3D msp3400.o
> =C2=A0obj-$(CONFIG_VIDEO_MT9M001) +=3D mt9m001.o
> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> new file mode 100644
> index 000000000000..cae1d5a1293e
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_MAXIM_SERDES
> +	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
> +	depends on VIDEO_DEV
> +	select I2C_ATR
> +	select I2C_MUX
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	=C2=A0 This driver supports the Maxim GMSL2/3 common Serializer and
> +	=C2=A0 Deserializer framework.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called max_serdes.
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/=
maxim-serdes/Makefile
> new file mode 100644
> index 000000000000..630fbb486bab
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +max-serdes-objs :=3D max_serdes.o
> +obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/=
i2c/maxim-
> serdes/max_serdes.c
> new file mode 100644
> index 000000000000..73e018d1f0d2
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/stringify.h>
> +
> +#include <media/mipi-csi2.h>
> +
> +#include <video/videomode.h>
> +
> +#include <uapi/linux/media-bus-format.h>
> +
> +#include "max_serdes.h"
> +
> +const char * const max_serdes_tpg_patterns[] =3D {
> +	[MAX_SERDES_TPG_PATTERN_GRADIENT] =3D "Gradient",
> +	[MAX_SERDES_TPG_PATTERN_CHECKERBOARD] =3D "Checkerboard",
> +};
> +
> +static const char * const max_gmsl_versions[] =3D {
> +	[MAX_SERDES_GMSL_2_3GBPS] =3D "GMSL2 3Gbps",
> +	[MAX_SERDES_GMSL_2_6GBPS] =3D "GMSL2 6Gbps",
> +	[MAX_SERDES_GMSL_3] =3D "GMSL3",
> +};
GMSL3 12Gbps for consistency ?

>=20
> +
> +const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version ver=
sion)
> +{
> +	if (version > MAX_SERDES_GMSL_3)
> +		return NULL;
> +
> +	return max_gmsl_versions[version];
> +}
> +
> +static const char * const max_gmsl_mode[] =3D {
> +	[MAX_SERDES_GMSL_PIXEL_MODE] =3D "pixel",
> +	[MAX_SERDES_GMSL_TUNNEL_MODE] =3D "tunnel",
> +};
> +
> +const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode)
> +{
> +	if (mode > MAX_SERDES_GMSL_TUNNEL_MODE)
> +		return NULL;
> +
> +	return max_gmsl_mode[mode];
> +}
> +
> +static const struct max_serdes_mipi_format max_serdes_mipi_formats[] =3D=
 {
> +	{ MIPI_CSI2_DT_EMBEDDED_8B, 8 },
> +	{ MIPI_CSI2_DT_YUV422_8B, 16 },
> +	{ MIPI_CSI2_DT_YUV422_10B, 20 },
> +	{ MIPI_CSI2_DT_RGB565, 16 },
> +	{ MIPI_CSI2_DT_RGB666, 18 },
> +	{ MIPI_CSI2_DT_RGB888, 24 },
> +	{ MIPI_CSI2_DT_RAW8, 8 },
> +	{ MIPI_CSI2_DT_RAW10, 10 },
> +	{ MIPI_CSI2_DT_RAW12, 12 },
> +	{ MIPI_CSI2_DT_RAW14, 14 },
> +	{ MIPI_CSI2_DT_RAW16, 16 },
> +};
> +
> +const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(max_serdes_mipi_formats); i++)
> +		if (max_serdes_mipi_formats[i].dt =3D=3D dt)
> +			return &max_serdes_mipi_formats[i];
> +
> +	return NULL;
> +}
> +
> +int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 =
stream,
> +				=C2=A0=C2=A0 struct v4l2_mbus_frame_desc_entry *entry)
> +{
> +	struct v4l2_mbus_frame_desc fd;
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EOPNOTSUPP;
> +
> +	for (i =3D 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream =3D=3D stream) {
> +			*entry =3D fd.entry[i];
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
> +			=C2=A0 unsigned int *bpp)
> +{
> +	const struct max_serdes_mipi_format *format;
> +
> +	format =3D max_serdes_mipi_format_by_dt(entry->bus.csi2.dt);
> +	if (!format)
> +		return -ENOENT;
> +
> +	*bpp =3D format->bpp;
> +
> +	return 0;
> +}
> +
> +int max_serdes_process_bpps(struct device *dev, u32 bpps,
> +			=C2=A0=C2=A0=C2=A0 u32 allowed_double_bpps, unsigned int *doubled_bpp=
)
> +{
> +	unsigned int min_bpp;
> +	unsigned int max_bpp;
> +	bool doubled =3D false;
> +
> +	if (!bpps)
> +		return 0;
> +
> +	*doubled_bpp =3D 0;
> +
> +	/*
> +	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
> +	 * to another bpp <=3D 16:
> +	 * Hardware can only stream a single constant bpp up to 24.
> +	 *
> +	 * From these features and limitations, the following rules
> +	 * can be deduced:
> +	 *
> +	 * A bpp of 8 can always be doubled if present.
> +	 * A bpp of 10 can be doubled only if there are no other bpps or the
> +	 * only other bpp is 20.
> +	 * A bpp of 12 can be doubled only if there are no other bpps or the
> +	 * only other bpp is 24.
> +	 * Bpps <=3D 16 cannot coexist with bpps > 16.
> +	 * Bpps <=3D 16 need to be padded to the biggest bpp.
> +	 */
> +
> +	min_bpp =3D __ffs(bpps);
> +	max_bpp =3D __fls(bpps);
> +
> +	if (min_bpp =3D=3D 8) {
> +		doubled =3D true;
> +	} else if (min_bpp =3D=3D 10 || min_bpp =3D=3D 12) {
> +		u32 bpp_or_double =3D BIT(min_bpp) | BIT(min_bpp * 2);
> +		u32 other_bpps =3D bpps & ~bpp_or_double;
> +
> +		if (!other_bpps)
> +			doubled =3D true;
> +	}
> +
> +	if (doubled && (allowed_double_bpps & BIT(min_bpp))) {
> +		*doubled_bpp =3D min_bpp;
> +		bpps &=3D ~BIT(min_bpp);
> +		bpps |=3D BIT(min_bpp * 2);
> +	}
> +
> +	min_bpp =3D __ffs(bpps);
> +	max_bpp =3D __fls(bpps);
> +
> +	if (max_bpp > 24) {
> +		dev_err(dev, "Cannot stream bpps > 24\n");
> +		return -EINVAL;
> +	}
> +
> +	if (min_bpp <=3D 16 && max_bpp > 16) {
> +		dev_err(dev, "Cannot stream bpps <=3D 16 with bpps > 16\n");
> +		return -EINVAL;
> +	}
> +
> +	if (max_bpp > 16 && min_bpp !=3D max_bpp) {
> +		dev_err(dev, "Cannot stream multiple bpps when one is > 16\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *so=
urces,
> +					=C2=A0=C2=A0=C2=A0 u32 source_sink_pad_offset,
> +					=C2=A0=C2=A0=C2=A0 const struct v4l2_subdev_state *state,
> +					=C2=A0=C2=A0=C2=A0 u32 pad, u64 updated_streams_mask,
> +					=C2=A0=C2=A0=C2=A0 u32 sink_pad_start, u32 num_sink_pads,
> +					=C2=A0=C2=A0=C2=A0 bool enable)
> +{
> +	u32 failed_sink_pad;
> +	int ret;
> +	u32 i;
> +
> +	for (i =3D sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
> +		u64 matched_streams_mask =3D updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +		struct max_serdes_source *source;
> +
> +		updated_sink_streams_mask =3D
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		source =3D &sources[i + source_sink_pad_offset];
> +		if (!source)
> +			continue;
> +
> +		if (enable)
> +			ret =3D v4l2_subdev_enable_streams(source->sd, source->pad,
> +							 updated_sink_streams_mask);
> +		else
> +			ret =3D v4l2_subdev_disable_streams(source->sd, source->pad,
> +							=C2=A0 updated_sink_streams_mask);
> +		if (ret) {
> +			failed_sink_pad =3D i;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i =3D sink_pad_start; i < failed_sink_pad; i++) {
> +		u64 matched_streams_mask =3D updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +		struct max_serdes_source *source;
> +
> +		updated_sink_streams_mask =3D
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		source =3D &sources[i + source_sink_pad_offset];
> +		if (!source)
> +			continue;
> +
> +		if (!enable)
> +			v4l2_subdev_enable_streams(source->sd, source->pad,
> +						=C2=A0=C2=A0 updated_sink_streams_mask);
> +		else
> +			v4l2_subdev_disable_streams(source->sd, source->pad,
> +						=C2=A0=C2=A0=C2=A0 updated_sink_streams_mask);
> +	}
> +
> +	return ret;
> +}
> +
> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable)
> +{
> +	u64 *streams_masks;
> +	unsigned int i;
> +
> +	streams_masks =3D devm_kcalloc(dev, num_pads, sizeof(*streams_masks), G=
FP_KERNEL);
> +	if (!streams_masks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_pads; i++) {
> +		u64 matched_streams_mask =3D updated_streams_mask;
> +		u64 updated_sink_streams_mask;
> +
> +		updated_sink_streams_mask =3D
> +			v4l2_subdev_state_xlate_streams(state, pad, i,
> +							&matched_streams_mask);
> +		if (!updated_sink_streams_mask)
> +			continue;
> +
> +		streams_masks[i] =3D old_streams_masks[i];
> +		if (enable)
> +			streams_masks[i] |=3D updated_sink_streams_mask;
> +		else
> +			streams_masks[i] &=3D ~updated_sink_streams_mask;
> +	}
> +
> +	if (enable)
> +		streams_masks[pad] |=3D updated_streams_mask;
> +	else
> +		streams_masks[pad] &=3D ~updated_streams_mask;
> +
> +	*new_streams_masks =3D streams_masks;
> +
> +	return 0;
> +}
> +
> +static const struct videomode max_serdes_tpg_pixel_videomodes[] =3D {
> +	{
> +		.pixelclock =3D 25000000,
> +		.hactive =3D 640,
> +		.hfront_porch =3D 10,
> +		.hsync_len =3D 96,
> +		.hback_porch =3D 40,
> +		.vactive =3D 480,
> +		.vfront_porch =3D 2,
> +		.vsync_len =3D 24,
> +		.vback_porch =3D 24,
> +	},
> +	{
> +		.pixelclock =3D 75000000,
> +		.hactive =3D 1920,
> +		.hfront_porch =3D 88,
> +		.hsync_len =3D 44,
> +		.hback_porch =3D 148,
> +		.vactive =3D 1080,
> +		.vfront_porch =3D 4,
> +		.vsync_len =3D 16,
> +		.vback_porch =3D 36,
> +	},
> +	{
> +		.pixelclock =3D 150000000,
> +		.hactive =3D 1920,
> +		.hfront_porch =3D 88,
> +		.hsync_len =3D 44,
> +		.hback_porch =3D 148,
> +		.vactive =3D 1080,
> +		.vfront_porch =3D 4,
> +		.vsync_len =3D 16,
> +		.vback_porch =3D 36,
> +	},
> +};
> +
> +static void max_serdes_get_vm_timings(const struct videomode *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_tpg_timings *timing=
s)
> +{
> +	u32 hact =3D vm->hactive;
> +	u32 hfp =3D vm->hfront_porch;
> +	u32 hsync =3D vm->hsync_len;
> +	u32 hbp =3D vm->hback_porch;
> +	u32 htot =3D hact + hfp + hbp + hsync;
> +
> +	u32 vact =3D vm->vactive;
> +	u32 vfp =3D vm->vfront_porch;
> +	u32 vsync =3D vm->vsync_len;
> +	u32 vbp =3D vm->vback_porch;
> +	u32 vtot =3D vact + vfp + vbp + vsync;
> +
> +	*timings =3D (struct max_serdes_tpg_timings) {
> +		.gen_vs =3D true,
> +		.gen_hs =3D true,
> +		.gen_de =3D true,
> +		.vs_inv =3D true,
> +		.vs_dly =3D 0,
> +		.vs_high =3D vsync * htot,
> +		.vs_low =3D (vact + vfp + vbp) * htot,
> +		.v2h =3D 0,
> +		.hs_high =3D hsync,
> +		.hs_low =3D hact + hfp + hbp,
> +		.hs_cnt =3D vact + vfp + vbp + vsync,
> +		.v2d =3D htot * (vsync + vbp) + (hsync + hbp),
> +		.de_high =3D hact,
> +		.de_low =3D hfp + hsync + hbp,
> +		.de_cnt =3D vact,
> +		.clock =3D vm->pixelclock,
> +		.fps =3D DIV_ROUND_CLOSEST(vm->pixelclock, vtot * htot),
> +	};
> +}
> +
> +int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_tpg_timings *t=
imings)
> +{
> +	u32 fps;
> +
> +	if (!entry)
> +		return 0;
> +
> +	fps =3D DIV_ROUND_CLOSEST(1 * entry->interval.denominator,
> +				entry->interval.numerator);
> +
> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(max_serdes_tpg_pixel_videomod=
es); i++) {
> +		struct max_serdes_tpg_timings vm_timings;
> +		const struct videomode *vm;
> +
> +		vm =3D &max_serdes_tpg_pixel_videomodes[i];
> +
> +		max_serdes_get_vm_timings(vm, &vm_timings);
> +
> +		if (vm->hactive =3D=3D entry->width &&
> +		=C2=A0=C2=A0=C2=A0 vm->vactive =3D=3D entry->height &&
> +		=C2=A0=C2=A0=C2=A0 vm_timings.fps =3D=3D fps) {
> +			*timings =3D vm_timings;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(max_serdes_get_tpg_timings);
> +
> +int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing=
)
> +{
> +	const struct v4l2_subdev_route *route;
> +
> +	if (routing->num_routes !=3D 1)
> +		return -EINVAL;
> +
> +	route =3D &routing->routes[0];
> +
> +	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +		return -EINVAL;
> +
> +	if (route->sink_stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +MODULE_DESCRIPTION("Maxim GMSL2 Serializer/Deserializer Driver");
> +MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.h b/drivers/media/=
i2c/maxim-
> serdes/max_serdes.h
> new file mode 100644
> index 000000000000..fdd761fcd8b2
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_serdes.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#ifndef MAX_SERDES_H
> +#define MAX_SERDES_H
> +
> +#include <linux/types.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define REG_SEQUENCE_2(reg, val) \
> +	{ (reg),=C2=A0=C2=A0=C2=A0=C2=A0 ((val) >> 8) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 0) & 0xff }
> +
> +#define REG_SEQUENCE_3(reg, val) \
> +	{ (reg),=C2=A0=C2=A0=C2=A0=C2=A0 ((val) >> 16) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 8)=C2=A0 & 0xff }, \
> +	{ (reg) + 2, ((val) >> 0)=C2=A0 & 0xff }
> +
> +#define REG_SEQUENCE_3_LE(reg, val) \
> +	{ (reg),=C2=A0=C2=A0=C2=A0=C2=A0 ((val) >> 0) & 0xff }, \
> +	{ (reg) + 1, ((val) >> 8)=C2=A0 & 0xff }, \
> +	{ (reg) + 2, ((val) >> 16)=C2=A0 & 0xff }
> +
>=20
> cci helper handle that nicely.
>=20
> +#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
> +#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
> +
At some place you use FIELD_PREP some other field_prep, this is confusing
can you use only the FIELD_GET/PREP ?


> +#define MAX_SERDES_PHYS_MAX		4
> +#define MAX_SERDES_STREAMS_NUM		4
> +#define MAX_SERDES_VC_ID_NUM		4
> +#define MAX_SERDES_TPG_STREAM		0
> +
> +#define MAX_SERDES_GRAD_INCR		4
> +#define MAX_SERDES_CHECKER_COLOR_A	0x00ccfe
> +#define MAX_SERDES_CHECKER_COLOR_B	0xa76a00
> +#define MAX_SERDES_CHECKER_SIZE		60
> +
> +extern const char * const max_serdes_tpg_patterns[];
> +
> +enum max_serdes_gmsl_version {
> +	MAX_SERDES_GMSL_MIN,
> +	MAX_SERDES_GMSL_2_3GBPS =3D MAX_SERDES_GMSL_MIN,
> +	MAX_SERDES_GMSL_2_6GBPS,
> +	MAX_SERDES_GMSL_3,
> +	MAX_SERDES_GMSL_MAX =3D MAX_SERDES_GMSL_3,
> +};
> +
> +enum max_serdes_gmsl_mode {
> +	MAX_SERDES_GMSL_PIXEL_MODE,
> +	MAX_SERDES_GMSL_TUNNEL_MODE,
> +};
> +
> +enum max_serdes_tpg_pattern {
> +	MAX_SERDES_TPG_PATTERN_MIN,
> +	MAX_SERDES_TPG_PATTERN_CHECKERBOARD =3D MAX_SERDES_TPG_PATTERN_MIN,
> +	MAX_SERDES_TPG_PATTERN_GRADIENT,
> +	MAX_SERDES_TPG_PATTERN_MAX =3D MAX_SERDES_TPG_PATTERN_GRADIENT,
> +};
> +
> +struct max_serdes_phys_config {
> +	unsigned int lanes[MAX_SERDES_PHYS_MAX];
> +	unsigned int clock_lane[MAX_SERDES_PHYS_MAX];
> +};
> +
> +struct max_serdes_phys_configs {
> +	const struct max_serdes_phys_config *configs;
> +	unsigned int num_configs;
> +};
> +
> +struct max_serdes_i2c_xlate {
> +	u8 src;
> +	u8 dst;
> +	bool en;
> +};
> +
> +struct max_serdes_mipi_format {
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +struct max_serdes_vc_remap {
> +	u8 src;
> +	u8 dst;
> +};
> +
> +struct max_serdes_source {
> +	struct v4l2_subdev *sd;
> +	u16 pad;
> +	struct fwnode_handle *ep_fwnode;
> +
> +	unsigned int index;
> +};
> +
> +struct max_serdes_asc {
> +	struct v4l2_async_connection base;
> +	struct max_serdes_source *source;
> +};
> +
> +struct max_serdes_tpg_entry {
> +	u32 width;
> +	u32 height;
> +	struct v4l2_fract interval;
> +	u32 code;
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +#define MAX_TPG_ENTRY_640X480P60_RGB888 \
> +	{ 640, 480, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, =
24 }
> +
> +#define MAX_TPG_ENTRY_1920X1080P30_RGB888 \
> +	{ 1920, 1080, { 1, 30 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888=
, 24 }
> +
> +#define MAX_TPG_ENTRY_1920X1080P60_RGB888 \
> +	{ 1920, 1080, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888=
, 24 }
> +
> +struct max_serdes_tpg_entries {
> +	const struct max_serdes_tpg_entry *entries;
> +	unsigned int num_entries;
> +};
> +
> +struct max_serdes_tpg_timings {
> +	bool gen_vs;
> +	bool gen_hs;
> +	bool gen_de;
> +	bool vs_inv;
> +	bool hs_inv;
> +	bool de_inv;
> +	u32 vs_dly;
> +	u32 vs_high;
> +	u32 vs_low;
> +	u32 v2h;
> +	u32 hs_high;
> +	u32 hs_low;
> +	u32 hs_cnt;
> +	u32 v2d;
> +	u32 de_high;
> +	u32 de_low;
> +	u32 de_cnt;
> +	u32 clock;
> +	u32 fps;
> +};
> +
> +static inline struct max_serdes_asc *asc_to_max(struct v4l2_async_connec=
tion *asc)
> +{
> +	return container_of(asc, struct max_serdes_asc, base);
> +}
> +
> +const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version ver=
sion);
> +const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode);
> +
> +const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt)=
;
> +
> +int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 =
stream,
> +				=C2=A0=C2=A0 struct v4l2_mbus_frame_desc_entry *entry);
> +
> +int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
> +			=C2=A0 unsigned int *bpp);
> +int max_serdes_process_bpps(struct device *dev, u32 bpps,
> +			=C2=A0=C2=A0=C2=A0 u32 allowed_double_bpps, unsigned int *doubled_bpp=
);
> +
> +int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *so=
urces,
> +					=C2=A0=C2=A0=C2=A0 u32 source_sink_pad_offset,
> +					=C2=A0=C2=A0=C2=A0 const struct v4l2_subdev_state *state,
> +					=C2=A0=C2=A0=C2=A0 u32 pad, u64 updated_streams_mask,
> +					=C2=A0=C2=A0=C2=A0 u32 sink_pad_start, u32 num_sink_pads,
> +					=C2=A0=C2=A0=C2=A0 bool enable);
> +
> +int max_serdes_get_streams_masks(struct device *dev,
> +				 const struct v4l2_subdev_state *state,
> +				 u32 pad, u64 updated_streams_mask,
> +				 u32 num_pads, u64 *old_streams_masks,
> +				 u64 **new_streams_masks, bool enable);
> +
> +int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_tpg_timings *t=
imings);
> +
> +int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing=
);
> +
> +#endif // MAX_SERDES_H

--=20
Julien

