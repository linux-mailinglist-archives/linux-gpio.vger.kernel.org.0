Return-Path: <linux-gpio+bounces-22718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF251AF735C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBA21889CB3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E462E425D;
	Thu,  3 Jul 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mx5nUfSu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673406EB79;
	Thu,  3 Jul 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544637; cv=none; b=K/M/uAhAZbtpcm2EcwgLNdnPC0YBd++OlJwpse1OXYS6jgnGpbsIxcG0nyzFVauVYxQf6CA4mFqDqIyL+9dB5KPQEvEEGzxOP0jnQVs0mhWu0xV8tpBQmuKaB3d5CYhfSB+W5gYEpaZvzM2yb6D2LvifKAZcztkzJGVNBjfrGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544637; c=relaxed/simple;
	bh=A0hyhO8475GqJbIRxmqWGCsa25XI6Lm5sNz2/yf7loQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqpI0if1mzzUj2m3o8c2IX2F4oBbuufYfmKXh5EA98j5hXjL58dYMaBXG/KzJYEy5zno+c7GbS8S4cGLA/Tc4c1ixg0kM52xvfNg/NF7QgiXeXpTc369eRf9AanODQNAVrWOQfwzb619U87q0IMtzXmD0CE1eUX/khOpaw9A4nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mx5nUfSu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544630;
	bh=A0hyhO8475GqJbIRxmqWGCsa25XI6Lm5sNz2/yf7loQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mx5nUfSuU3YvC6M0/WQREibyBB/vGtKdsx1mUhiiJyHuKjCqLQUIK4kDCVW9xoQka
	 ECRdboQ3d+gRXcX8x8FWnJtK/4wgHGJ5mzPJjp6JxjW2NLwmIpnK26FgRYs1rI1bx4
	 XvlevOfxpYQzYHRRvDnoO6YPvW501cw7y6Nwuw72GegXrolFPcdPXH5KGTidqqExpl
	 Au4n3NxzJls+oyUHKhkUcy/xwa9lt6B2TuQ5D5yuYqs/qpB+KgkueFwh9MlWFrpTZK
	 KDQ1fIdmN1QhoXCdDd4M84P8cVlbZPGZE4K8N+ymilxVdIiGFGME2bMTGW6BycNCM9
	 b7ZLvVW2B0qOA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B002B17E0636;
	Thu,  3 Jul 2025 14:10:29 +0200 (CEST)
Message-ID: <94fb4044b34ed61781a50f06373146443a38f4a6.camel@collabora.com>
Subject: Re: [PATCH v5 16/24] media: i2c: add Maxim GMSL2/3 serializer
 framework
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
Date: Thu, 03 Jul 2025 14:10:28 +0200
In-Reply-To: <20250702132104.1537926-17-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-17-demonsingur@gmail.com>
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

On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
> These drivers are meant to be used as a common framework for Maxim
> GMSL2/3 serializers.
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
> =C2=A0drivers/media/i2c/maxim-serdes/Makefile=C2=A0 |=C2=A0=C2=A0=C2=A0 2=
 +-
> =C2=A0drivers/media/i2c/maxim-serdes/max_ser.c | 2075 +++++++++++++++++++=
+++
> =C2=A0drivers/media/i2c/maxim-serdes/max_ser.h |=C2=A0 145 ++
> =C2=A03 files changed, 2221 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
>=20
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/=
maxim-serdes/Makefile
> index 630fbb486bab..17511cb03369 100644
> --- a/drivers/media/i2c/maxim-serdes/Makefile
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -1,3 +1,3 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> -max-serdes-objs :=3D max_serdes.o
> +max-serdes-objs :=3D max_serdes.o max_ser.o
> =C2=A0obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c=
/maxim-serdes/max_ser.c
> new file mode 100644
> index 000000000000..61986040e1ca
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
> @@ -0,0 +1,2075 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim GMSL2 Serializer Driver
> + *
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c-atr.h>
> +#include <linux/i2c-mux.h>
> +#include <linux/module.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "max_ser.h"
> +#include "max_serdes.h"
> +
> +#define MAX_SER_NUM_LINKS	1
> +
> +struct max_ser_priv {
> +	struct max_ser *ser;
> +	struct device *dev;
> +	struct i2c_client *client;
> +
> +	struct i2c_atr *atr;
> +	struct i2c_mux_core *mux;
> +
> +	struct media_pad *pads;
> +	struct max_serdes_source *sources;
> +	u64 *streams_masks;
> +	u32 double_bpps;
> +
> +	struct v4l2_subdev sd;
> +	struct v4l2_async_notifier nf;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +};
> +
> +struct max_ser_route_hw {
> +	struct max_serdes_source *source;
> +	struct max_ser_pipe *pipe;
> +	struct v4l2_mbus_frame_desc_entry entry;
> +	bool is_tpg;
> +};
> +
> +static inline struct max_ser_priv *sd_to_priv(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct max_ser_priv, sd);
> +}
> +
> +static inline struct max_ser_priv *nf_to_priv(struct v4l2_async_notifier=
 *nf)
> +{
> +	return container_of(nf, struct max_ser_priv, nf);
> +}
> +
> +static inline struct max_ser_priv *ctrl_to_priv(struct v4l2_ctrl_handler=
 *handler)
> +{
> +	return container_of(handler, struct max_ser_priv, ctrl_handler);
> +}
> +
> +static inline bool max_ser_pad_is_sink(struct max_ser *ser, u32 pad)
> +{
> +	return pad < ser->ops->num_phys;
> +}
> +
> +static inline bool max_ser_pad_is_source(struct max_ser *ser, u32 pad)
> +{
> +	return pad >=3D ser->ops->num_phys &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad < ser->ops->num_phys + MAX_SER=
_NUM_LINKS;
> +}
> +
>=20
> +static inline bool max_ser_pad_is_tpg(struct max_ser *ser, u32 pad)
> +{
> +	return pad >=3D ser->ops->num_phys + MAX_SER_NUM_LINKS;
> +}
> +
> +static inline unsigned int max_ser_phy_to_pad(struct max_ser *ser,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_phy *phy)
> +{
> +	return phy->index;
> +}
> +
> +static inline unsigned int max_ser_num_pads(struct max_ser *ser)
> +{
> +	return ser->ops->num_phys + MAX_SER_NUM_LINKS +
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ser->ops->set_tpg ? 1 : 0);
> +}
> +
> +static struct max_ser_phy *max_ser_pad_to_phy(struct max_ser *ser, u32 p=
ad)
> +{
> +	if (!max_ser_pad_is_sink(ser, pad))
> +		return NULL;
> +
> +	return &ser->phys[pad];
> +}
> +
> +static struct max_ser_pipe *
> +max_ser_find_phy_pipe(struct max_ser *ser, struct max_ser_phy *phy)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ser->ops->num_pipes; i++) {
> +		struct max_ser_pipe *pipe =3D &ser->pipes[i];
> +
> +		if (pipe->phy_id =3D=3D phy->index)
> +			return pipe;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct max_serdes_source *
> +max_ser_get_phy_source(struct max_ser_priv *priv, struct max_ser_phy *ph=
y)
> +{
> +	return &priv->sources[phy->index];
> +}
> +
> +static const struct max_serdes_tpg_entry *
> +max_ser_find_tpg_entry(struct max_ser *ser, u32 target_index,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height, u32 code,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 numerator, u32 denominator)
> +{
> +	const struct max_serdes_tpg_entry *entry;
> +	unsigned int index =3D 0;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ser->ops->tpg_entries.num_entries; i++) {
> +		entry =3D &ser->ops->tpg_entries.entries[i];
> +
> +		if ((width !=3D 0 && width !=3D entry->width) ||
> +		=C2=A0=C2=A0=C2=A0 (height !=3D 0 && height !=3D entry->height) ||
> +		=C2=A0=C2=A0=C2=A0 (code !=3D 0 && code !=3D entry->code) ||
> +		=C2=A0=C2=A0=C2=A0 (numerator !=3D 0 && numerator !=3D entry->interval=
.numerator) ||
> +		=C2=A0=C2=A0=C2=A0 (denominator !=3D 0 && denominator !=3D entry->inte=
rval.denominator))
> +			continue;
> +
> +		if (index =3D=3D target_index)
> +			break;
> +
> +		index++;
> +	}
> +
> +	if (i =3D=3D ser->ops->tpg_entries.num_entries)
> +		return NULL;
> +
> +	return &ser->ops->tpg_entries.entries[i];
> +}
> +
> +static const struct max_serdes_tpg_entry *
> +max_ser_find_state_tpg_entry(struct max_ser *ser, struct v4l2_subdev_sta=
te *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pad)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_fract *in;
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, pad, MAX_SERDES_TPG_STREAM)=
;
> +	if (!fmt)
> +		return NULL;
> +
> +	in =3D v4l2_subdev_state_get_interval(state, pad, MAX_SERDES_TPG_STREAM=
);
> +	if (!in)
> +		return NULL;
> +
> +	return max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height, fmt->cod=
e,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in->numerator, in->denominator);
> +}
> +
> +static int max_ser_get_tpg_fd_entry_state(struct max_ser *ser,
> +					=C2=A0 struct v4l2_subdev_state *state,
> +					=C2=A0 struct v4l2_mbus_frame_desc_entry *fd_entry,
> +					=C2=A0 unsigned int pad)
> +{
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	entry =3D max_ser_find_state_tpg_entry(ser, state, pad);
> +	if (!entry)
> +		return -EINVAL;
> +
> +	fd_entry->stream =3D MAX_SERDES_TPG_STREAM;
> +	fd_entry->flags =3D V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +	fd_entry->length =3D entry->width * entry->height * entry->bpp / 8;
> +	fd_entry->pixelcode =3D entry->code;
> +	fd_entry->bus.csi2.vc =3D 0;
> +	fd_entry->bus.csi2.dt =3D entry->dt;
> +
> +	return 0;
> +}
> +
> +static int max_ser_tpg_route_to_hw(struct max_ser_priv *priv,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 struct v4l2_subdev_route *route,
> +				=C2=A0=C2=A0 struct max_ser_route_hw *hw)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +
> +	hw->pipe =3D &ser->pipes[0];
> +
> +	return max_ser_get_tpg_fd_entry_state(ser, state, &hw->entry,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 route->sink_pad);
> +}
> +
> +static int max_ser_route_to_hw(struct max_ser_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_route *route,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_route_hw *hw)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct max_ser_phy *phy;
> +	unsigned int i;
> +	int ret;
> +
> +	memset(hw, 0, sizeof(*hw));
> +
> +	hw->is_tpg =3D max_ser_pad_is_tpg(ser, route->sink_pad);
> +	if (hw->is_tpg)
> +		return max_ser_tpg_route_to_hw(priv, state, route, hw);
> +
> +	phy =3D max_ser_pad_to_phy(ser, route->sink_pad);
> +	if (!phy)
> +		return -ENOENT;
> +
> +	hw->pipe =3D max_ser_find_phy_pipe(ser, phy);
> +	if (!hw->pipe)
> +		return -ENOENT;
> +
> +	hw->source =3D max_ser_get_phy_source(priv, phy);
> +	if (!hw->source->sd)
> +		return 0;
> +
> +	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->source->pad, &fd);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < fd.num_entries; i++)
> +		if (fd.entry[i].stream =3D=3D route->sink_stream)
> +			break;
> +
> +	if (i =3D=3D fd.num_entries)
> +		return -ENOENT;
> +
> +	hw->entry =3D fd.entry[i];
> +
> +	return 0;
> +}
> +
> +static int max_ser_phy_set_active(struct max_ser *ser, struct max_ser_ph=
y *phy,
> +				=C2=A0 bool active)
> +{
> +	int ret;
> +
> +	if (ser->ops->set_phy_active) {
> +		ret =3D ser->ops->set_phy_active(ser, phy, active);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	phy->active =3D active;
> +
> +	return 0;
> +}
> +
> +static int max_ser_set_pipe_dts(struct max_ser_priv *priv, struct max_se=
r_pipe *pipe,
> +				unsigned int *dts, unsigned int num_dts)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!ser->ops->set_pipe_dt || !ser->ops->set_pipe_dt_en)
> +		return 0;
> +
> +	for (i =3D 0; i < num_dts; i++) {
> +		ret =3D ser->ops->set_pipe_dt(ser, pipe, i, dts[i]);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ser->ops->set_pipe_dt_en(ser, pipe, i, true);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (num_dts =3D=3D pipe->num_dts)
> +		return 0;
> +
> +	for (i =3D num_dts; i < ser->ops->num_dts_per_pipe; i++) {
> +		ret =3D ser->ops->set_pipe_dt_en(ser, pipe, i, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_ser_set_pipe_mode(struct max_ser_priv *priv, struct max_s=
er_pipe *pipe,
> +				 struct max_ser_pipe_mode *mode)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +
> +	if (mode->bpp =3D=3D pipe->mode.bpp &&
> +	=C2=A0=C2=A0=C2=A0 mode->soft_bpp =3D=3D pipe->mode.soft_bpp &&
> +	=C2=A0=C2=A0=C2=A0 mode->dbl8 =3D=3D pipe->mode.dbl8 &&
> +	=C2=A0=C2=A0=C2=A0 mode->dbl10 =3D=3D pipe->mode.dbl10 &&
> +	=C2=A0=C2=A0=C2=A0 mode->dbl12 =3D=3D pipe->mode.dbl12)
> +		return 0;
> +
> +	if (!ser->ops->set_pipe_mode)
> +		return 0;
> +
> +	return ser->ops->set_pipe_mode(ser, pipe, mode);
> +}
> +
> +static int max_ser_i2c_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 addr, u16 alias)
> +{
> +	struct max_serdes_i2c_xlate xlate =3D {
> +		.src =3D alias,
> +		.dst =3D addr,
> +		.en =3D true,
> +	};
> +	struct max_ser_priv *priv =3D i2c_atr_get_driver_data(atr);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++)
> +		if (!ser->i2c_xlates[i].en)
> +			break;
> +
> +	if (i =3D=3D ser->ops->num_i2c_xlates) {
> +		dev_err(priv->dev,
> +			"Reached maximum number of I2C translations\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D ser->ops->set_i2c_xlate(ser, i, &xlate);
> +	if (ret)
> +		return ret;
> +
> +	ser->i2c_xlates[i] =3D xlate;
> +
> +	return 0;
> +}
> +
> +static void max_ser_i2c_atr_detach_addr(struct i2c_atr *atr, u32 chan_id=
, u16 addr)
> +{
> +	struct max_ser_priv *priv =3D i2c_atr_get_driver_data(atr);
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_serdes_i2c_xlate xlate =3D { 0 };
> +	unsigned int i;
> +
> +	/* Find index of matching I2C translation. */
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++)
> +		if (ser->i2c_xlates[i].dst =3D=3D addr)
> +			break;
> +
> +	WARN_ON(i =3D=3D ser->ops->num_i2c_xlates);
> +
> +	ser->ops->set_i2c_xlate(ser, i, &xlate);
> +	ser->i2c_xlates[i] =3D xlate;
> +}
> +
> +static const struct i2c_atr_ops max_ser_i2c_atr_ops =3D {
> +	.attach_addr =3D max_ser_i2c_atr_attach_addr,
> +	.detach_addr =3D max_ser_i2c_atr_detach_addr,
> +};
> +
> +static void max_ser_i2c_atr_deinit(struct max_ser_priv *priv)
> +{
> +	/* Deleting adapters that haven't been added does no harm. */
> +	i2c_atr_del_adapter(priv->atr, 0);
> +
> +	i2c_atr_delete(priv->atr);
> +}
> +
> +static int max_ser_i2c_atr_init(struct max_ser_priv *priv)
> +{
> +	struct i2c_atr_adap_desc desc =3D {
> +		.chan_id =3D 0,
> +	};
> +
> +	if (!i2c_check_functionality(priv->client->adapter,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +		return -ENODEV;
> +
> +	priv->atr =3D i2c_atr_new(priv->client->adapter, priv->dev,
> +				&max_ser_i2c_atr_ops, 1, 0);
> +	if (IS_ERR(priv->atr))
> +		return PTR_ERR(priv->atr);
> +
> +	i2c_atr_set_driver_data(priv->atr, priv);
> +
> +	return i2c_atr_add_adapter(priv->atr, &desc);
> +}
> +
> +static int max_ser_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
> +{
> +	return 0;
> +}
> +
> +static void max_ser_i2c_mux_deinit(struct max_ser_priv *priv)
> +{
> +	i2c_mux_del_adapters(priv->mux);
> +}
> +
> +static int max_ser_i2c_mux_init(struct max_ser_priv *priv)
> +{
> +	priv->mux =3D i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
> +				=C2=A0 1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
> +				=C2=A0 max_ser_i2c_mux_select, NULL);
> +	if (!priv->mux)
> +		return -ENOMEM;
> +
> +	return i2c_mux_add_adapter(priv->mux, 0, 0);
> +}
> +
> +static int max_ser_i2c_adapter_init(struct max_ser_priv *priv)
> +{
> +	if (device_get_named_child_node(priv->dev, "i2c-gate"))
> +		return max_ser_i2c_mux_init(priv);
> +	else
> +		return max_ser_i2c_atr_init(priv);
> +}
> +
> +static void max_ser_i2c_adapter_deinit(struct max_ser_priv *priv)
> +{
> +	if (device_get_named_child_node(priv->dev, "i2c-gate"))
> +		max_ser_i2c_mux_deinit(priv);
> +	else
> +		max_ser_i2c_atr_deinit(priv);
> +}
> +
> +static int max_ser_set_tpg_fmt(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format *forma=
t)
> +{
> +	struct v4l2_mbus_framefmt *fmt =3D &format->format;
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_fract *in;
> +
> +	if (format->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->code, 0, 0);
> +	if (!entry)
> +		return -EINVAL;
> +
> +	in =3D v4l2_subdev_state_get_interval(state, format->pad, format->strea=
m);
> +	if (!in)
> +		return -EINVAL;
> +
> +	in->numerator =3D entry->interval.numerator;
> +	in->denominator =3D entry->interval.denominator;
> +
> +	return 0;
> +}
> +
> +static int max_ser_set_fmt(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0 struct v4l2_subdev_format *format)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
> +		return -EBUSY;
> +
> +	/* No transcoding, source and sink formats must match. */
> +	if (max_ser_pad_is_source(ser, format->pad))
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	if (max_ser_pad_is_tpg(ser, format->pad)) {
> +		ret =3D max_ser_set_tpg_fmt(sd, state, format);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stream=
);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt =3D format->format;
> +
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad=
,
> +							=C2=A0=C2=A0 format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt =3D format->format;
> +
> +	return 0;
> +}
> +
> +static int max_ser_log_status(struct v4l2_subdev *sd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i, j;
> +	int ret;
> +
> +	v4l2_info(sd, "mode: %s\n", max_serdes_gmsl_mode_str(ser->mode));

Can we read ser->mode to initialize the value to the default hardware value=
 configured by the cfg
pins?

> +	if (ser->ops->set_tpg) {
> +		const struct max_serdes_tpg_entry *entry =3D ser->tpg_entry;
> +
> +		if (entry) {
> +			v4l2_info(sd, "tpg: %ux%u@%u/%u, code: %u, dt: %u, bpp: %u\n",
> +				=C2=A0 entry->width, entry->height,
> +				=C2=A0 entry->interval.numerator,
> +				=C2=A0 entry->interval.denominator,
> +				=C2=A0 entry->code, entry->dt,=C2=A0 entry->bpp);
> +		} else {
> +			v4l2_info(sd, "tpg: disabled\n");
> +		}
> +	}
> +	if (ser->ops->log_status) {
> +		ret =3D ser->ops->log_status(ser);
> +		if (ret)
> +			return ret;
> +	}
> +	v4l2_info(sd, "i2c_xlates:\n");
> +	for (i =3D 0; i < ser->ops->num_i2c_xlates; i++) {
> +		v4l2_info(sd, "\ten: %u, src: 0x%02x dst: 0x%02x\n",
> +			=C2=A0 ser->i2c_xlates[i].en, ser->i2c_xlates[i].src,
> +			=C2=A0 ser->i2c_xlates[i].dst);
> +		if (!ser->i2c_xlates[i].en)
> +			break;
> +	}
> +	v4l2_info(sd, "\n");
> +	if (ser->ops->set_vc_remap) {
> +		v4l2_info(sd, "vc_remaps: %u\n", ser->num_vc_remaps);
> +		for (j =3D 0; j < ser->num_vc_remaps; j++) {
> +			v4l2_info(sd, "\tvc_remap: src: %u, dst: %u\n",
> +				=C2=A0 ser->vc_remaps[j].src, ser->vc_remaps[j].dst);
> +		}
> +	}
> +	v4l2_info(sd, "\n");
> +
> +	for (i =3D 0; i < ser->ops->num_pipes; i++) {
> +		struct max_ser_pipe *pipe =3D &ser->pipes[i];
> +
> +		v4l2_info(sd, "pipe: %u\n", pipe->index);
> +		v4l2_info(sd, "\tenabled: %u\n", pipe->enabled);
> +
> +		if (!pipe->enabled) {
> +			v4l2_info(sd, "\n");
> +			continue;
> +		}
> +
> +		v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
> +		v4l2_info(sd, "\tstream_id: %u\n", pipe->stream_id);
> +		if (ser->ops->set_pipe_phy)
> +			v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
> +		if (ser->ops->set_pipe_dt) {
> +			v4l2_info(sd, "\tdts: %u\n", pipe->num_dts);
> +			for (j =3D 0; j < pipe->num_dts; j++)
> +				v4l2_info(sd, "\t\tdt: 0x%02x\n", pipe->dts[j]);
> +		}
> +		if (ser->ops->set_pipe_vcs)
> +			v4l2_info(sd, "\tvcs: 0x%08x\n", pipe->vcs);
> +		if (ser->ops->set_pipe_mode) {
> +			v4l2_info(sd, "\tdbl8: %u\n", pipe->mode.dbl8);
> +			v4l2_info(sd, "\tdbl10: %u\n", pipe->mode.dbl10);
> +			v4l2_info(sd, "\tdbl12: %u\n", pipe->mode.dbl12);
> +			v4l2_info(sd, "\tsoft_bpp: %u\n", pipe->mode.soft_bpp);
> +			v4l2_info(sd, "\tbpp: %u\n", pipe->mode.bpp);
> +		}
> +		if (ser->ops->log_pipe_status) {
> +			ret =3D ser->ops->log_pipe_status(ser, pipe);
> +			if (ret)
> +				return ret;
> +		}
> +		v4l2_info(sd, "\n");
> +	}
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		v4l2_info(sd, "phy: %u\n", phy->index);
> +		v4l2_info(sd, "\tenabled: %u\n", phy->enabled);
> +
> +		if (!phy->enabled) {
> +			v4l2_info(sd, "\n");
> +			continue;
> +		}
> +
> +		v4l2_info(sd, "\tactive: %u\n", phy->active);
> +		v4l2_info(sd, "\tnum_data_lanes: %u\n", phy->mipi.num_data_lanes);
> +		v4l2_info(sd, "\tclock_lane: %u\n", phy->mipi.clock_lane);
> +		v4l2_info(sd, "\tnoncontinuous_clock: %u\n",
> +			=C2=A0 !!(phy->mipi.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK));
> +		if (ser->ops->log_phy_status) {
> +			ret =3D ser->ops->log_phy_status(ser, phy);
> +			if (ret)
> +				return ret;
> +		}
> +		v4l2_info(sd, "\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_ser_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_ser_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		ser->tpg_pattern =3D ctrl->val;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int max_ser_enum_frame_interval(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_frame_interv=
al_enum *fie)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	if (!max_ser_pad_is_tpg(ser, fie->pad) ||
> +	=C2=A0=C2=A0=C2=A0 fie->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, fie->index, fie->width, fie->heig=
ht,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fie->code, fie->interval.denomi=
nator,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fie->interval.numerator);
> +	if (!entry)
> +		return -EINVAL;
> +
> +	fie->interval.numerator =3D entry->interval.numerator;
> +	fie->interval.denominator =3D entry->interval.denominator;
> +
> +	return 0;
> +}
> +
> +static int max_ser_set_frame_interval(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_frame_interval *fi=
)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_fract *in;
> +
> +	if (!max_ser_pad_is_tpg(ser, fi->pad) ||
> +	=C2=A0=C2=A0=C2=A0 fi->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	if (fi->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
> +		return -EBUSY;
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, fi->pad, fi->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	entry =3D max_ser_find_tpg_entry(ser, 0, fmt->width, fmt->height,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->code, fi->interval.denomin=
ator,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi->interval.numerator);
> +	if (!entry)
> +		return -EINVAL;
> +
> +	in =3D v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
> +	if (!in)
> +		return -EINVAL;
> +
> +	in->numerator =3D fi->interval.numerator;
> +	in->denominator =3D fi->interval.denominator;
> +
> +	return 0;
> +}
> +
> +static int max_ser_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	if (!max_ser_pad_is_source(ser, pad))
> +		return -ENOENT;
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +
> +		if (pad !=3D route->source_pad)
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_ser_get_frame_desc(struct v4l2_subdev *sd, unsigned int p=
ad,
> +				=C2=A0 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(&priv->sd);
> +
> +	ret =3D max_ser_get_frame_desc_state(sd, state, fd, pad);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int max_ser_set_tpg_routing(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 struct v4l2_subdev_krouting *routing)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_mbus_framefmt fmt =3D { 0 };
> +	int ret;
> +
> +	ret =3D max_serdes_validate_tpg_routing(routing);
> +	if (ret)
> +		return ret;
> +
> +	entry =3D &ser->ops->tpg_entries.entries[0];
> +
> +	fmt.width =3D entry->width;
> +	fmt.height =3D entry->height;
> +	fmt.code =3D entry->code;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &fmt);
> +}
> +
> +static int max_ser_set_routing(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum v4l2_subdev_format_whence w=
hich,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_krouting *rou=
ting)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	bool is_tpg =3D false;
> +	int ret;
> +
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
> +		return -EBUSY;
> +
> +	ret =3D v4l2_subdev_routing_validate(sd, routing,
> +					=C2=A0=C2=A0 V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					=C2=A0=C2=A0 V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
> +	if (ret)
> +		return ret;
> +
> +	for_each_active_route(routing, route) {
> +		if (max_ser_pad_is_tpg(ser, route->sink_pad)) {
> +			is_tpg =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (is_tpg)
> +		return max_ser_set_tpg_routing(sd, state, routing);
> +
> +	return v4l2_subdev_set_routing(sd, state, routing);
> +}
> +
> +static int max_ser_get_pipe_vcs_dts(struct max_ser_priv *priv,
> +				=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0 struct max_ser_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0 unsigned int *vcs,
> +				=C2=A0=C2=A0=C2=A0 unsigned int *dts, unsigned int *num_dts,
> +				=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	*vcs =3D 0;
> +	*num_dts =3D 0;
> +
> +	if (ser->mode !=3D MAX_SERDES_GMSL_PIXEL_MODE)
> +		return 0;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +		unsigned int vc, dt;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		vc =3D hw.entry.bus.csi2.vc;
> +		dt =3D hw.entry.bus.csi2.dt;
> +
> +		if (vc >=3D MAX_SERDES_VC_ID_NUM)
> +			return -E2BIG;
> +
> +		*vcs |=3D BIT(vc);
> +
> +		/* Skip already added DT. */
> +		for (i =3D 0; i < *num_dts; i++)
> +			if (dts[i] =3D=3D dt)
> +				break;
> +
> +		if (i < *num_dts)
> +			continue;
> +
> +		dts[*num_dts] =3D dt;
> +		(*num_dts)++;
> +	}
> +
> +	/*
> +	 * Hardware cannot distinguish between different pairs of VC and DT,
> +	 * issue a warning.
> +	 */
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +		unsigned int vc, dt;
> +
> +		/*
> +		 * Skip enabled streams, we only want to check for leaks
> +		 * among the disabled streams.
> +		 */
> +		if ((BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		vc =3D hw.entry.bus.csi2.vc;
> +		dt =3D hw.entry.bus.csi2.dt;
> +
> +		if (vc >=3D MAX_SERDES_VC_ID_NUM)
> +			return -E2BIG;
> +
> +		if (!(*vcs & BIT(vc)))
> +			continue;
> +
> +		for (i =3D 0; i < *num_dts; i++)
> +			if (dts[i] =3D=3D dt)
> +				break;
> +
> +		if (i =3D=3D *num_dts)
> +			continue;
> +
> +		dev_warn(priv->dev, "Leaked disabled stream %u:%u with VC: %u, DT: %u"=
,
> +			 route->source_pad, route->source_stream, vc, dt);
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_ser_get_pipe_mode(struct max_ser_priv *priv,
> +				 struct v4l2_subdev_state *state,
> +				 struct max_ser_pipe *pipe,
> +				 struct max_ser_pipe_mode *mode)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct max_ser *ser =3D priv->ser;
> +	bool force_set_bpp =3D false;
> +	unsigned int doubled_bpp;
> +	unsigned int min_bpp;
> +	unsigned int max_bpp;
> +	u32 bpps =3D 0;
> +	int ret;
> +
> +	if (ser->mode !=3D MAX_SERDES_GMSL_PIXEL_MODE)
> +		return 0;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +		unsigned int bpp;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		if (hw.is_tpg)
> +			force_set_bpp =3D true;
> +
> +		ret =3D max_serdes_get_fd_bpp(&hw.entry, &bpp);
> +		if (ret)
> +			return ret;
> +
> +		bpps |=3D BIT(bpp);
> +	}
> +
> +	ret =3D max_serdes_process_bpps(priv->dev, bpps, priv->double_bpps, &do=
ubled_bpp);
> +	if (ret)
> +		return ret;
> +
> +	if (doubled_bpp =3D=3D 8)
> +		mode->dbl8 =3D true;
> +	else if (doubled_bpp =3D=3D 10)
> +		mode->dbl10 =3D true;
> +	else if (doubled_bpp =3D=3D 12)
> +		mode->dbl12 =3D true;
> +
> +	if (doubled_bpp) {
> +		bpps &=3D ~BIT(doubled_bpp);
> +		bpps |=3D BIT(doubled_bpp * 2);
> +	}
> +
> +	min_bpp =3D __ffs(bpps);
> +	max_bpp =3D __fls(bpps);
> +
> +	if (doubled_bpp)
> +		mode->soft_bpp =3D min_bpp;
> +
> +	if (min_bpp !=3D max_bpp || force_set_bpp)
> +		mode->bpp =3D max_bpp;
> +
> +	return 0;
> +}
> +
> +static int max_ser_update_pipe_enable(struct max_ser_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	bool enable =3D false;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		enable =3D true;
> +		break;
> +	}
> +
> +	if (enable =3D=3D pipe->enabled)
> +		return 0;
> +
> +	ret =3D ser->ops->set_pipe_enable(ser, pipe, enable);
> +	if (ret)
> +		return ret;
> +
> +	pipe->enabled =3D enable;
> +
> +	return 0;
> +}
> +
> +static int max_ser_update_pipe(struct max_ser_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe_mode mode =3D { 0 };
> +	unsigned int num_dts;
> +	unsigned int *dts;
> +	unsigned int vcs;
> +	int ret;
> +
> +	if (!ser->ops->num_dts_per_pipe)
> +		return 0;
> +
> +	dts =3D devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts=
),
> +			=C2=A0=C2=A0 GFP_KERNEL);
> +	if (!dts)
> +		return -ENOMEM;
> +
> +	ret =3D max_ser_get_pipe_vcs_dts(priv, state, pipe, &vcs, dts, &num_dts=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 streams_masks);
> +	if (ret)
> +		goto err_free_dts;
> +
> +	ret =3D max_ser_get_pipe_mode(priv, state, pipe, &mode);
> +	if (ret)
> +		goto err_free_dts;
> +
> +	if (ser->ops->set_pipe_vcs) {
> +		ret =3D ser->ops->set_pipe_vcs(ser, pipe, vcs);
> +		if (ret)
> +			goto err_free_dts;
> +	}
> +
> +	ret =3D max_ser_set_pipe_mode(priv, pipe, &mode);
> +	if (ret)
> +		goto err_revert_vcs;
> +
> +	ret =3D max_ser_set_pipe_dts(priv, pipe, dts, num_dts);
> +	if (ret)
> +		goto err_revert_mode;
> +
> +	pipe->vcs =3D vcs;
> +	pipe->mode =3D mode;
> +
> +	if (pipe->dts)
> +		devm_kfree(priv->dev, pipe->dts);
> +
> +	pipe->dts =3D dts;
> +	pipe->num_dts =3D num_dts;
> +
> +	return 0;
> +
> +err_revert_mode:
> +	max_ser_set_pipe_mode(priv, pipe, &pipe->mode);
> +
> +err_revert_vcs:
> +	if (ser->ops->set_pipe_vcs)
> +		ser->ops->set_pipe_vcs(ser, pipe, pipe->vcs);
> +
> +err_free_dts:
> +	devm_kfree(priv->dev, dts);
> +
> +	return ret;
> +}
> +
> +static int max_ser_update_phy(struct max_ser_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_phy *phy, u64 *streams_=
masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	bool enable_changed =3D !streams_masks[pad] !=3D !priv->streams_masks[p=
ad];
> +	bool enable =3D !!streams_masks[pad];
> +	struct max_ser_pipe *pipe;
> +	int ret;
> +
> +	pipe =3D max_ser_find_phy_pipe(ser, phy);
> +	if (!pipe)
> +		return -ENOENT;
> +
> +	if (!enable && enable_changed) {
> +		ret =3D max_ser_phy_set_active(ser, phy, enable);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D max_ser_update_pipe(priv, pipe, state, streams_masks);
> +	if (ret)
> +		goto err_revert_phy_disable;
> +
> +	ret =3D max_ser_update_pipe_enable(priv, pipe, state, streams_masks);
> +	if (ret)
> +		goto err_revert_pipe_update;
> +
> +	if (enable && enable_changed) {
> +		ret =3D max_ser_phy_set_active(ser, phy, enable);
> +		if (ret)
> +			goto err_revert_update_pipe_enable;
> +	}
> +
> +	return 0;
> +
> +err_revert_update_pipe_enable:
> +	max_ser_update_pipe_enable(priv, pipe, state, priv->streams_masks);
> +
> +err_revert_pipe_update:
> +	max_ser_update_pipe(priv, pipe, state, priv->streams_masks);
> +
> +err_revert_phy_disable:
> +	if (!enable && enable_changed)
> +		max_ser_phy_set_active(ser, phy, !enable);
> +
> +	return ret;
> +}
> +
> +static int max_ser_update_phys(struct max_ser_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int failed_update_phy_id =3D ser->ops->num_phys;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		ret =3D max_ser_update_phy(priv, state, phy, streams_masks);
> +		if (ret) {
> +			failed_update_phy_id =3D i;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i =3D 0; i < failed_update_phy_id; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		max_ser_update_phy(priv, state, phy, priv->streams_masks);
> +	}
> +
> +	return ret;
> +}
> +
> +static int max_ser_enable_disable_streams(struct max_ser_priv *priv,
> +					=C2=A0 struct v4l2_subdev_state *state,
> +					=C2=A0 u32 pad, u64 updated_streams_mask,
> +					=C2=A0 bool enable)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +
> +	return max_serdes_xlate_enable_disable_streams(priv->sources, 0, state,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad, updated_streams_mask, 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ser->ops->num_phys, enable);
> +}
> +
> +static bool max_ser_is_tpg_routed(struct max_ser_priv *priv,
> +				=C2=A0 struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return false;
> +
> +		if (hw.is_tpg)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int max_ser_update_tpg(struct max_ser_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	const struct max_serdes_tpg_entry *entry =3D NULL;
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_ser_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_ser_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.is_tpg)
> +			continue;
> +
> +		entry =3D max_ser_find_state_tpg_entry(ser, state, route->sink_pad);
> +		break;
> +	}
> +
> +	if (entry =3D=3D ser->tpg_entry)
> +		return 0;
> +
> +	ret =3D ser->ops->set_tpg(ser, entry);
> +	if (ret)
> +		return ret;
> +
> +	ser->tpg_entry =3D entry;
> +
> +	return 0;
> +}
> +
> +static int max_ser_update_streams(struct v4l2_subdev *sd,
> +				=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0 u32 pad, u64 updated_streams_mask, bool enable)
> +{
> +	struct max_ser_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	u64 *streams_masks;
> +	int ret;
> +
> +	ret =3D max_serdes_get_streams_masks(priv->dev, state, pad, updated_str=
eams_mask,
> +					=C2=A0=C2=A0 num_pads, priv->streams_masks, &streams_masks,
> +					=C2=A0=C2=A0 enable);
> +	if (ret)
> +		return ret;
> +
> +	if (!enable) {
> +		ret =3D max_ser_enable_disable_streams(priv, state, pad,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, enable);
> +		if (ret)
> +			goto err_free_streams_masks;
> +	}
> +
> +	ret =3D max_ser_update_tpg(priv, state, streams_masks);
> +	if (ret)
> +		goto err_revert_streams_disable;
> +
> +	ret =3D max_ser_update_phys(priv, state, streams_masks);
> +	if (ret)
> +		goto err_revert_update_tpg;
> +
> +	if (enable) {
> +		ret =3D max_ser_enable_disable_streams(priv, state, pad,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, enable);
> +		if (ret)
> +			goto err_revert_phys_update;
> +	}
> +
> +	devm_kfree(priv->dev, priv->streams_masks);
> +	priv->streams_masks =3D streams_masks;
> +	ser->active =3D !!streams_masks[pad];
> +
> +	return 0;
> +
> +err_revert_phys_update:
> +	max_ser_update_phys(priv, state, priv->streams_masks);
> +
> +err_revert_update_tpg:
> +	max_ser_update_tpg(priv, state, priv->streams_masks);
> +
> +err_revert_streams_disable:
> +	if (!enable)
> +		max_ser_enable_disable_streams(priv, state, pad,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, !enable)=
;
> +
> +err_free_streams_masks:
> +	devm_kfree(priv->dev, streams_masks);
> +
> +	return ret;
> +}
> +
> +static int max_ser_enable_streams(struct v4l2_subdev *sd,
> +				=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0 u32 pad, u64 streams_mask)
> +{
> +	return max_ser_update_streams(sd, state, pad, streams_mask, true);
> +}
> +
> +static int max_ser_disable_streams(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 u32 pad, u64 streams_mask)
> +{
> +	return max_ser_update_streams(sd, state, pad, streams_mask, false);
> +}
> +
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int max_ser_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_re=
gister *reg)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D ser->ops->reg_read(ser, reg->reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	reg->val =3D val;
> +	reg->size =3D 1;
> +
> +	return 0;
> +}
> +
> +static int max_ser_s_register(struct v4l2_subdev *sd, const struct v4l2_=
dbg_register *reg)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	return ser->ops->reg_write(ser, reg->reg, reg->val);
> +}
> +#endif
> +
> +static const struct v4l2_subdev_core_ops max_ser_core_ops =3D {
> +	.log_status =3D max_ser_log_status,
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.g_register =3D max_ser_g_register,
> +	.s_register =3D max_ser_s_register,
> +#endif
> +};
> +
> +static const struct v4l2_ctrl_ops max_ser_ctrl_ops =3D {
> +	.s_ctrl =3D max_ser_s_ctrl,
> +};
> +
> +static const struct v4l2_subdev_pad_ops max_ser_pad_ops =3D {
> +	.enable_streams =3D max_ser_enable_streams,
> +	.disable_streams =3D max_ser_disable_streams,
> +
> +	.set_routing =3D max_ser_set_routing,
> +	.get_frame_desc =3D max_ser_get_frame_desc,
> +
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D max_ser_set_fmt,
> +
> +	.enum_frame_interval =3D max_ser_enum_frame_interval,
> +	.get_frame_interval =3D v4l2_subdev_get_frame_interval,
> +	.set_frame_interval =3D max_ser_set_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_ops max_ser_subdev_ops =3D {
> +	.core =3D &max_ser_core_ops,
> +	.pad =3D &max_ser_pad_ops,
> +};
> +
> +static const struct media_entity_operations max_ser_media_ops =3D {
> +	.link_validate =3D v4l2_subdev_link_validate,
> +	.get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int max_ser_init(struct max_ser_priv *priv)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	if (ser->ops->init) {
> +		ret =3D ser->ops->init(ser);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (ser->ops->set_tunnel_enable) {
> +		ret =3D ser->ops->set_tunnel_enable(ser, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +
> +		if (phy->enabled) {
> +			ret =3D ser->ops->init_phy(ser, phy);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (ser->ops->set_phy_active) {
> +			ret =3D ser->ops->set_phy_active(ser, phy, false);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	for (i =3D 0; i < ser->ops->num_pipes; i++) {
> +		struct max_ser_pipe *pipe =3D &ser->pipes[i];
> +		struct max_ser_phy *phy =3D &ser->phys[pipe->phy_id];
> +
> +		ret =3D ser->ops->set_pipe_enable(ser, pipe, false);
> +		if (ret)
> +			return ret;
> +
> +		if (ser->ops->set_pipe_stream_id) {
> +			ret =3D ser->ops->set_pipe_stream_id(ser, pipe, pipe->stream_id);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (ser->ops->set_pipe_phy) {
> +			ret =3D ser->ops->set_pipe_phy(ser, pipe, phy);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (ser->ops->set_pipe_vcs) {
> +			ret =3D ser->ops->set_pipe_vcs(ser, pipe, 0);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (ser->ops->set_pipe_mode) {
> +			ret =3D ser->ops->set_pipe_mode(ser, pipe, &pipe->mode);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D max_ser_set_pipe_dts(priv, pipe, NULL, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_ser_notify_bound(struct v4l2_async_notifier *nf,
> +				struct v4l2_subdev *subdev,
> +				struct v4l2_async_connection *base_asc)
> +{
> +	struct max_ser_priv *priv =3D nf_to_priv(nf);
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +	u32 pad =3D source->index;
> +	int ret;
> +
> +	ret =3D media_entity_get_fwnode_pad(&subdev->entity,
> +					=C2=A0 source->ep_fwnode,
> +					=C2=A0 MEDIA_PAD_FL_SOURCE);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
> +		return ret;
> +	}
> +
> +	source->sd =3D subdev;
> +	source->pad =3D ret;
> +
> +	ret =3D media_create_pad_link(&source->sd->entity, source->pad,
> +				=C2=A0=C2=A0=C2=A0 &priv->sd.entity, pad,
> +				=C2=A0=C2=A0=C2=A0 MEDIA_LNK_FL_ENABLED |
> +				=C2=A0=C2=A0=C2=A0 MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(priv->dev, "Unable to link %s:%u -> %s:%u\n",
> +			source->sd->name, source->pad, priv->sd.name, pad);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max_ser_notify_unbind(struct v4l2_async_notifier *nf,
> +				=C2=A0 struct v4l2_subdev *subdev,
> +				=C2=A0 struct v4l2_async_connection *base_asc)
> +{
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +
> +	source->sd =3D NULL;
> +}
> +
> +static const struct v4l2_async_notifier_operations max_ser_notify_ops =
=3D {
> +	.bound =3D max_ser_notify_bound,
> +	.unbind =3D max_ser_notify_unbind,
> +};
> +
> +static int max_ser_v4l2_notifier_register(struct max_ser_priv *priv)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&priv->nf, &priv->sd);
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +		struct max_serdes_source *source;
> +		struct max_serdes_asc *asc;
> +
> +		source =3D max_ser_get_phy_source(priv, phy);
> +		if (!source->ep_fwnode)
> +			continue;
> +
> +		asc =3D v4l2_async_nf_add_fwnode(&priv->nf, source->ep_fwnode,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_asc);
> +		if (IS_ERR(asc)) {
> +			dev_err(priv->dev,
> +				"Failed to add subdev for source %u: %pe", i,
> +				asc);
> +
> +			v4l2_async_nf_cleanup(&priv->nf);
> +
> +			return PTR_ERR(asc);
> +		}
> +
> +		asc->source =3D source;
> +	}
> +
> +	priv->nf.ops =3D &max_ser_notify_ops;
> +
> +	ret =3D v4l2_async_nf_register(&priv->nf);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to register subdev notifier");
> +		v4l2_async_nf_cleanup(&priv->nf);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max_ser_v4l2_notifier_unregister(struct max_ser_priv *priv)
> +{
> +	v4l2_async_nf_unregister(&priv->nf);
> +	v4l2_async_nf_cleanup(&priv->nf);
> +}
> +
> +static int max_ser_v4l2_register(struct max_ser_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +	struct max_ser *ser =3D priv->ser;
> +	void *data =3D i2c_get_clientdata(priv->client);
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_i2c_subdev_init(sd, priv->client, &max_ser_subdev_ops);
> +	i2c_set_clientdata(priv->client, data);
> +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops =3D &max_ser_media_ops;
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +
I was expecting to see sd->internal_ops to be able to set some default rout=
es.
When the device is probed we have no default routing table, so the user hav=
e to set the
route manually, which is only possible by modifying and recompiling your ke=
rnel to turn on
the experimental v4l2_subdev_enable_streams_api.

Please add a default route "0/0 -> 1/0 [1]" so we cover the basic use cases=
. (same for the
deserializers)

> +	priv->pads =3D devm_kcalloc(priv->dev, num_pads, sizeof(*priv->pads), G=
FP_KERNEL);
> +	if (!priv->pads)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_pads; i++) {
> +		if (max_ser_pad_is_sink(ser, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SINK;
> +		else if (max_ser_pad_is_source(ser, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> +		else if (max_ser_pad_is_tpg(ser, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SINK |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MEDIA_PAD_FL_INTERNAL;
> +		else
> +			return -EINVAL;
> +	}
> +
> +	v4l2_set_subdevdata(sd, priv);
> +
> +	if (ser->ops->tpg_patterns) {
> +		v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> +		priv->sd.ctrl_handler =3D &priv->ctrl_handler;
> +
> +		v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &max_ser_ctrl_ops,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_TEST_PATTERN,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SERDES_TPG_PATTERN_MAX,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 ~ser->ops->tpg_patterns,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 __ffs(ser->ops->tpg_patterns),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 max_serdes_tpg_patterns);
> +		if (priv->ctrl_handler.error) {
> +			ret =3D priv->ctrl_handler.error;
> +			goto err_free_ctrl;
> +		}
> +	}
> +
> +	ret =3D media_entity_pads_init(&sd->entity, num_pads, priv->pads);
> +	if (ret)
> +		goto err_free_ctrl;
> +
> +	ret =3D max_ser_v4l2_notifier_register(priv);
> +	if (ret)
> +		goto err_media_entity_cleanup;
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_nf_cleanup;
> +
> +	ret =3D v4l2_async_register_subdev(sd);
> +	if (ret)
> +		goto err_sd_cleanup;
> +
> +	return 0;
> +
> +err_sd_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_nf_cleanup:
> +	max_ser_v4l2_notifier_unregister(priv);
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err_free_ctrl:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static void max_ser_v4l2_unregister(struct max_ser_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +
> +	max_ser_v4l2_notifier_unregister(priv);
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +}
> +
> +static int max_ser_parse_sink_dt_endpoint(struct max_ser_priv *priv,
> +					=C2=A0 struct max_ser_phy *phy,
> +					=C2=A0 struct max_serdes_source *source,
> +					=C2=A0 struct fwnode_handle *fwnode)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	u32 pad =3D max_ser_phy_to_pad(ser, phy);
> +	struct v4l2_fwnode_endpoint v4l2_ep =3D { .bus_type =3D V4L2_MBUS_CSI2_=
DPHY };
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	source->ep_fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> +	if (!source->ep_fwnode) {
> +		dev_err(priv->dev,
> +			"Failed to get remote endpoint on port %u\n", pad);
> +		return -EINVAL;
> +	}
> +
> +	ret =3D v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
> +		return ret;
> +	}
> +
> +	phy->mipi =3D v4l2_ep.bus.mipi_csi2;
> +	phy->enabled =3D true;
> +
> +	return 0;
> +}
> +
> +static int max_ser_find_phys_config(struct max_ser_priv *priv)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	const struct max_serdes_phys_configs *configs =3D &ser->ops->phys_confi=
gs;
> +	struct max_ser_phy *phy;
> +	unsigned int i, j;
> +
> +	if (!configs->num_configs)
> +		return 0;
> +
> +	for (i =3D 0; i < configs->num_configs; i++) {
> +		const struct max_serdes_phys_config *config =3D &configs->configs[i];
> +		bool matching =3D true;
> +
> +		for (j =3D 0; j < ser->ops->num_phys; j++) {
> +			phy =3D &ser->phys[j];
> +
> +			if (!phy->enabled)
> +				continue;
> +
> +			if (phy->mipi.num_data_lanes <=3D config->lanes[j])
> +				continue;
> +
> +			matching =3D false;
> +
> +			break;
> +		}
> +
> +		if (matching)
> +			break;
> +	}
> +
> +	if (i =3D=3D configs->num_configs) {
> +		dev_err(priv->dev, "Invalid lane configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	ser->phys_config =3D i;
> +
> +	return 0;
> +}
> +
> +static int max_ser_parse_dt(struct max_ser_priv *priv)
> +{
> +	struct fwnode_handle *fwnode =3D dev_fwnode(priv->dev);
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe *pipe;
> +	struct max_ser_phy *phy;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		phy =3D &ser->phys[i];
> +		phy->index =3D i;
> +	}
> +
> +	for (i =3D 0; i < ser->ops->num_pipes; i++) {
> +		pipe =3D &ser->pipes[i];
> +		pipe->index =3D i;
> +		pipe->phy_id =3D i % ser->ops->num_phys;
> +		pipe->stream_id =3D i % MAX_SERDES_STREAMS_NUM;
> +	}
> +
> +	for (i =3D 0; i < ser->ops->num_phys; i++) {
> +		struct max_ser_phy *phy =3D &ser->phys[i];
> +		struct max_serdes_source *source;
> +
> +		source =3D max_ser_get_phy_source(priv, phy);
> +		source->index =3D i;
> +
> +		ret =3D max_ser_parse_sink_dt_endpoint(priv, phy, source, fwnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return max_ser_find_phys_config(priv);
> +}
> +
> +static int max_ser_allocate(struct max_ser_priv *priv)
> +{
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int num_pads =3D max_ser_num_pads(ser);
> +
> +	ser->phys =3D devm_kcalloc(priv->dev, ser->ops->num_phys,
> +				 sizeof(*ser->phys), GFP_KERNEL);
> +	if (!ser->phys)
> +		return -ENOMEM;
> +
> +	ser->pipes =3D devm_kcalloc(priv->dev, ser->ops->num_pipes,
> +				=C2=A0 sizeof(*ser->pipes), GFP_KERNEL);
> +	if (!ser->pipes)
> +		return -ENOMEM;
> +
> +	ser->vc_remaps =3D devm_kcalloc(priv->dev, ser->ops->num_vc_remaps,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*ser->vc_remaps), GFP_KERNEL);
> +	if (!ser->vc_remaps)
> +		return -ENOMEM;
> +
> +	ser->i2c_xlates =3D devm_kcalloc(priv->dev, ser->ops->num_i2c_xlates,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*ser->i2c_xlates), GFP_K=
ERNEL);
> +	if (!ser->i2c_xlates)
> +		return -ENOMEM;
> +
> +	priv->sources =3D devm_kcalloc(priv->dev, ser->ops->num_phys,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*priv->sources), GFP_KERNEL);
> +	if (!priv->sources)
> +		return -ENOMEM;
> +
> +	priv->streams_masks =3D devm_kcalloc(priv->dev, num_pads,
> +					=C2=A0=C2=A0 sizeof(*priv->streams_masks),
> +					=C2=A0=C2=A0 GFP_KERNEL);
> +	if (!priv->streams_masks)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int max_ser_probe(struct i2c_client *client, struct max_ser *ser)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct max_ser_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client =3D client;
> +	priv->dev =3D dev;
> +	priv->ser =3D ser;
> +	ser->priv =3D priv;
> +
> +	ret =3D max_ser_allocate(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_parse_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_i2c_adapter_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_v4l2_register(priv);
> +	if (ret)
> +		goto err_i2c_adapter_deinit;
> +
> +	return 0;
> +
> +err_i2c_adapter_deinit:
> +	max_ser_i2c_adapter_deinit(priv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_probe);
> +
> +int max_ser_remove(struct max_ser *ser)
> +{
> +	struct max_ser_priv *priv =3D ser->priv;
> +
> +	max_ser_v4l2_unregister(priv);
> +
> +	max_ser_i2c_adapter_deinit(priv);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_remove);
> +
> +int max_ser_set_double_bpps(struct v4l2_subdev *sd, u32 double_bpps)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +
> +	priv->double_bpps =3D double_bpps;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_set_double_bpps);
> +
> +int max_ser_set_stream_id(struct v4l2_subdev *sd, unsigned int stream_id=
)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe *pipe =3D &ser->pipes[0];
> +
> +	if (!ser->ops->set_pipe_stream_id)
> +		return -EOPNOTSUPP;
> +
> +	return ser->ops->set_pipe_stream_id(ser, pipe, stream_id);
> +}
> +EXPORT_SYMBOL_GPL(max_ser_set_stream_id);
> +
> +int max_ser_get_stream_id(struct v4l2_subdev *sd, unsigned int *stream_i=
d)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct max_ser_pipe *pipe =3D &ser->pipes[0];
> +
> +	if (!ser->ops->get_pipe_stream_id)
> +		return -EOPNOTSUPP;
> +
> +	*stream_id =3D ser->ops->get_pipe_stream_id(ser, pipe);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_get_stream_id);
> +
> +unsigned int max_ser_get_supported_modes(struct v4l2_subdev *sd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	struct v4l2_subdev_state *state;
> +	unsigned int modes =3D ser->ops->modes;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(&priv->sd);
> +
> +	if (max_ser_is_tpg_routed(priv, state))
> +		modes =3D BIT(ser->ops->tpg_mode);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return modes;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_get_supported_modes);
> +
> +bool max_ser_supports_vc_remap(struct v4l2_subdev *sd)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +
> +	return !!ser->ops->set_vc_remap;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_supports_vc_remap);
> +
> +int max_ser_set_mode(struct v4l2_subdev *sd, enum max_serdes_gmsl_mode m=
ode)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	int ret;
> +
> +	if (!(ser->ops->modes & BIT(mode)))
> +		return -EINVAL;
> +
> +	if (ser->mode =3D=3D mode)
> +		return 0;
> +
> +	if (ser->ops->set_tunnel_enable) {
> +		bool tunnel_enable =3D mode =3D=3D MAX_SERDES_GMSL_TUNNEL_MODE;
> +
> +		ret =3D ser->ops->set_tunnel_enable(ser, tunnel_enable);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ser->mode =3D mode;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_set_mode);
> +
> +int max_ser_set_vc_remaps(struct v4l2_subdev *sd,
> +			=C2=A0 struct max_serdes_vc_remap *vc_remaps,
> +			=C2=A0 int num_vc_remaps)
> +{
> +	struct max_ser_priv *priv =3D sd_to_priv(sd);
> +	struct max_ser *ser =3D priv->ser;
> +	unsigned int mask =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!ser->ops->set_vc_remap)
> +		return -EOPNOTSUPP;
> +
> +	if (num_vc_remaps > ser->ops->num_vc_remaps)
> +		return -E2BIG;
> +
> +	for (i =3D 0; i < num_vc_remaps; i++) {
> +		ret =3D ser->ops->set_vc_remap(ser, i, &vc_remaps[i]);
> +		if (ret)
> +			return ret;
> +
> +		mask |=3D BIT(i);
> +	}
> +
> +	ret =3D ser->ops->set_vc_remaps_enable(ser, mask);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < num_vc_remaps; i++)
> +		ser->vc_remaps[i] =3D vc_remaps[i];
> +
> +	ser->num_vc_remaps =3D num_vc_remaps;
> +
> +	return 0;
> +}
> +
> +static int max_ser_read_reg(struct i2c_adapter *adapter, u8 addr,
> +			=C2=A0=C2=A0=C2=A0 u16 reg, u8 *val)
> +{
> +	u8 buf[2] =3D { reg >> 8, reg & 0xff };
> +	struct i2c_msg msg[2] =3D {
> +		{
> +			.addr =3D addr,
> +			.flags =3D 0,
> +			.buf =3D buf,
> +			.len =3D sizeof(buf),
> +		},
> +		{
> +			.addr =3D addr,
> +			.flags =3D I2C_M_RD,
> +			.buf =3D buf,
> +			.len =3D 1,
> +		},
> +	};
> +	int ret;
> +
> +	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D buf[0];
> +
> +	return 0;
> +}
> +
> +static int max_ser_write_reg(struct i2c_adapter *adapter, u8 addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 u16 reg, u8 val)
> +{
> +	u8 buf[3] =3D { reg >> 8, reg & 0xff, val };
> +	struct i2c_msg msg[1] =3D {
> +		{
> +			.addr =3D addr,
> +			.flags =3D 0,
> +			.buf =3D buf,
> +			.len =3D sizeof(buf),
> +		},
> +	};
> +	int ret;
> +
> +	ret =3D i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +int max_ser_reset(struct i2c_adapter *adapter, u8 addr)
> +{
> +	int ret;
> +	u8 val;
> +
> +	ret =3D max_ser_read_reg(adapter, addr, MAX_SER_CTRL0, &val);
> +	if (ret)
> +		return ret;
> +
> +	val |=3D MAX_SER_CTRL0_RESET_ALL;
> +
> +	return max_ser_write_reg(adapter, addr, MAX_SER_CTRL0, val);
> +}
> +EXPORT_SYMBOL_GPL(max_ser_reset);
> +
> +int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_addrs, u8 *current_ad=
dr)
> +{
> +	unsigned int i, j;
> +	int ret =3D 0;
> +	u8 val;
> +
> +	for (i =3D 0; i < 10; i++) {
> +		for (j =3D 0; j < num_addrs; j++) {
> +			ret =3D max_ser_read_reg(adapter, addrs[j], MAX_SER_REG0, &val);
> +			if (!ret && val) {
> +				*current_addr =3D addrs[j];
> +				return 0;
> +			}
> +
> +			msleep(100);
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_wait_for_multiple);
> +
> +int max_ser_wait(struct i2c_adapter *adapter, u8 addr)
> +{
> +	u8 current_addr;
> +
> +	return max_ser_wait_for_multiple(adapter, &addr, 1, &current_addr);
> +}
> +EXPORT_SYMBOL_GPL(max_ser_wait);
> +
> +int max_ser_fix_tx_ids(struct i2c_adapter *adapter, u8 addr)
> +{
> +	unsigned int addr_regs[] =3D {
> +		MAX_SER_CFGI_INFOFR_TR3,
> +		MAX_SER_CFGL_SPI_TR3,
> +		MAX_SER_CFGC_CC_TR3,
> +		MAX_SER_CFGC_GPIO_TR3,
> +		MAX_SER_CFGL_IIC_X_TR3,
> +		MAX_SER_CFGL_IIC_Y_TR3,
> +	};
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(addr_regs); i++) {
> +		ret =3D max_ser_write_reg(adapter, addr, addr_regs[i], addr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_ser_fix_tx_ids);
> +
> +int max_ser_change_address(struct i2c_adapter *adapter, u8 addr, u8 new_=
addr)
> +{
> +	u8 val =3D FIELD_PREP(MAX_SER_REG0_DEV_ADDR, new_addr);
> +
> +	return max_ser_write_reg(adapter, addr, MAX_SER_REG0, val);
> +}
> +EXPORT_SYMBOL_GPL(max_ser_change_address);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("I2C_ATR");
> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.h b/drivers/media/i2c=
/maxim-serdes/max_ser.h
> new file mode 100644
> index 000000000000..2cf57c755e0e
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.h
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#ifndef MAX_SER_H
> +#define MAX_SER_H
> +
> +#include <linux/i2c.h>
> +
> +#include <media/v4l2-mediabus.h>
> +
> +#include "max_serdes.h"
> +
> +#define MAX_SER_REG0				0x0
> +#define MAX_SER_REG0_DEV_ADDR			GENMASK(7, 1)
> +
> +#define MAX_SER_CTRL0				0x10
> +#define MAX_SER_CTRL0_RESET_ALL			BIT(7)
> +
> +#define MAX_SER_CFGI_INFOFR_TR3			0x7b
> +#define MAX_SER_CFGL_SPI_TR3			0x83
> +#define MAX_SER_CFGC_CC_TR3			0x8b
> +#define MAX_SER_CFGC_GPIO_TR3			0x93
> +#define MAX_SER_CFGL_IIC_X_TR3			0xa3
> +#define MAX_SER_CFGL_IIC_Y_TR3			0xab
> +
> +struct max_ser_phy {
> +	unsigned int index;
> +	struct v4l2_mbus_config_mipi_csi2 mipi;
> +	bool enabled;
> +	bool active;
> +};
> +
> +struct max_ser_pipe_mode {
> +	unsigned int soft_bpp;
> +	unsigned int bpp;
> +	bool dbl8;
> +	bool dbl10;
> +	bool dbl12;
> +};
> +
> +struct max_ser_pipe {
> +	unsigned int index;
> +	unsigned int phy_id;
> +	unsigned int stream_id;
> +	unsigned int *dts;
> +	unsigned int num_dts;
> +	unsigned int vcs;
> +	struct max_ser_pipe_mode mode;
> +	bool enabled;
> +};
> +
> +struct max_ser;
> +
> +struct max_ser_ops {
> +	unsigned int modes;
> +	unsigned int num_pipes;
> +	unsigned int num_dts_per_pipe;
> +	unsigned int num_phys;
> +	unsigned int num_i2c_xlates;
> +	unsigned int num_vc_remaps;
> +
> +	struct max_serdes_phys_configs phys_configs;
> +	struct max_serdes_tpg_entries tpg_entries;
> +	enum max_serdes_gmsl_mode tpg_mode;
> +	unsigned int tpg_patterns;
> +
> +	int (*reg_read)(struct max_ser *ser, unsigned int reg, unsigned int *va=
l);
> +	int (*reg_write)(struct max_ser *ser, unsigned int reg, unsigned int va=
l);
> +	int (*log_status)(struct max_ser *ser);
> +	int (*log_pipe_status)(struct max_ser *ser, struct max_ser_pipe *pipe);
> +	int (*log_phy_status)(struct max_ser *ser, struct max_ser_phy *phy);
> +	int (*init)(struct max_ser *ser);
> +	int (*set_i2c_xlate)(struct max_ser *ser, unsigned int i,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_i2c_xlate *i2c_xlate);
> +	int (*set_tunnel_enable)(struct max_ser *ser, bool enable);
> +	int (*set_tpg)(struct max_ser *ser, const struct max_serdes_tpg_entry *=
entry);
> +	int (*init_phy)(struct max_ser *ser, struct max_ser_phy *phy);
> +	int (*set_phy_active)(struct max_ser *ser, struct max_ser_phy *phy,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);
> +	int (*set_pipe_enable)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);
> +	int (*set_pipe_dt)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0 unsigned int i, unsigned int dt);
> +	int (*set_pipe_dt_en)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, bool enable);
> +	int (*set_pipe_vcs)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0 unsigned int vcs);
> +	int (*set_pipe_mode)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct max_ser_pipe_mode *mode);
> +	int (*set_vc_remap)(struct max_ser *ser, unsigned int i,
> +			=C2=A0=C2=A0=C2=A0 struct max_serdes_vc_remap *vc_remap);
> +	int (*set_vc_remaps_enable)(struct max_ser *ser, unsigned int mask);
> +	int (*set_pipe_stream_id)(struct max_ser *ser, struct max_ser_pipe *pip=
e,
> +				=C2=A0 unsigned int stream_id);
> +	unsigned int (*get_pipe_stream_id)(struct max_ser *ser, struct max_ser_=
pipe *pipe);
> +	int (*set_pipe_phy)(struct max_ser *ser, struct max_ser_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0 struct max_ser_phy *phy);
> +};
> +
> +struct max_ser_priv;
> +
> +struct max_ser {
> +	struct max_ser_priv *priv;
> +
> +	const struct max_ser_ops *ops;
> +
> +	struct max_serdes_i2c_xlate *i2c_xlates;
> +
> +	struct max_ser_phy *phys;
> +	struct max_ser_pipe *pipes;
> +	const struct max_serdes_tpg_entry *tpg_entry;
> +	enum max_serdes_tpg_pattern tpg_pattern;
> +
> +	struct max_serdes_vc_remap *vc_remaps;
> +	unsigned int num_vc_remaps;
> +
> +	unsigned int phys_config;
> +	unsigned int active;
> +	enum max_serdes_gmsl_mode mode;
> +};
> +
> +int max_ser_probe(struct i2c_client *client, struct max_ser *ser);
> +
> +int max_ser_remove(struct max_ser *ser);
> +
> +int max_ser_set_double_bpps(struct v4l2_subdev *sd, u32 double_bpps);
> +unsigned int max_ser_get_supported_modes(struct v4l2_subdev *sd);
> +int max_ser_set_mode(struct v4l2_subdev *sd, enum max_serdes_gmsl_mode m=
ode);
> +bool max_ser_supports_vc_remap(struct v4l2_subdev *sd);
> +int max_ser_set_stream_id(struct v4l2_subdev *sd, unsigned int stream_id=
);
> +int max_ser_get_stream_id(struct v4l2_subdev *sd, unsigned int *stream_i=
d);
> +int max_ser_set_vc_remaps(struct v4l2_subdev *sd, struct max_serdes_vc_r=
emap *vc_remaps,
> +			=C2=A0 int num_vc_remaps);
> +
> +int max_ser_reset(struct i2c_adapter *adapter, u8 addr);
> +int max_ser_wait(struct i2c_adapter *adapter, u8 addr);
> +int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_addrs, u8 *current_ad=
dr);
> +
> +int max_ser_change_address(struct i2c_adapter *adapter, u8 addr, u8 new_=
addr);
> +int max_ser_fix_tx_ids(struct i2c_adapter *adapter, u8 addr);
> +
> +#endif // MAX_SER_H

-- =20
Julien

