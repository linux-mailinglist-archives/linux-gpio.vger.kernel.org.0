Return-Path: <linux-gpio+bounces-22719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A8AF736B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E07DF560C11
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508FC2E49A7;
	Thu,  3 Jul 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cb1oEjfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001B2E3AFF;
	Thu,  3 Jul 2025 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544794; cv=none; b=mpa9/M2KFLL80yuzMxKr7AEKEvFKIUBAkOEpItFoz3m8B0hsHqX7Zki83w9oIp+DFxJHBm8DcF19ZVVsAg16sIgr9smZGgqk8KFyNToA7FmjkJkBDIq8fzp1cB2vAk+LJtoI2Oq1WAFY9WtbAi78b7mGe2H+s2E38Cwiwe4zE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544794; c=relaxed/simple;
	bh=3fsfyJoHy5FlZapcl7jg4zzlWjbX7A1n0nLjIB4M9Zs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vkge+0huYJHhu440JN6l+dgX4pSBBsw8kd1DunTJrhT4//MRyOR+d1pjAn13URMFpgEC0TUfjHs7pS/0M05QgsLYgKs92w5RWvTbpyYrR2SixxO3x7WAVYTzt+DNhIt8If9yGx35hzraGtdOTqN2XbP9XXiVlT7yY90E3XC6IVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cb1oEjfK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544786;
	bh=3fsfyJoHy5FlZapcl7jg4zzlWjbX7A1n0nLjIB4M9Zs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cb1oEjfKXYGz98fULoHaAUN16a2rmU+AGpwxRmudI/e+R5/DRFSS04Y1ICKAGOcKb
	 6qc1bwtDXyW31VV+SoZ/KDG/jHT9DIa2k3NoAR8a309dhAOxdFkc9CjuJb1Qrx1VeI
	 rVio/p3atEZdsPnXTEABPzF5PToK/QuVg1aY2qv4/zLQli0OoYIG+KWhoIHm715oZy
	 SKU//GTaREhj1GLjkPbArHJFOtk+6TEdTLCRvOmdEhxWD74E2guHU6Kc7bj88MfCid
	 I6Oaqf5bkuHIchc2pXKyKO/v6TmLMRzfnRylOkbr+P5KDy8Jx5AQ0baSQkQLnfizX6
	 ziBcSJeEDCPaQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85Cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E89B617E059B;
	Thu,  3 Jul 2025 14:13:05 +0200 (CEST)
Message-ID: <85b9936d12f17783552ddf2571c264584bb00030.camel@collabora.com>
Subject: Re: [PATCH v5 17/24] media: i2c: add Maxim GMSL2/3 deserializer
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
Date: Thu, 03 Jul 2025 14:13:05 +0200
In-Reply-To: <20250702132104.1537926-18-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
	 <20250702132104.1537926-18-demonsingur@gmail.com>
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
> GMSL2/3 deserializer.
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
> =C2=A0drivers/media/i2c/maxim-serdes/max_des.c | 3111 +++++++++++++++++++=
+++
> =C2=A0drivers/media/i2c/maxim-serdes/max_des.h |=C2=A0 151 ++
> =C2=A03 files changed, 3263 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
> =C2=A0create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
>=20
> diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/=
maxim-serdes/Makefile
> index 17511cb03369..b54326a5c81b 100644
> --- a/drivers/media/i2c/maxim-serdes/Makefile
> +++ b/drivers/media/i2c/maxim-serdes/Makefile
> @@ -1,3 +1,3 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> -max-serdes-objs :=3D max_serdes.o max_ser.o
> +max-serdes-objs :=3D max_serdes.o max_ser.o max_des.o
> =C2=A0obj-$(CONFIG_VIDEO_MAXIM_SERDES) +=3D max-serdes.o
> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c=
/maxim-serdes/max_des.c
> new file mode 100644
> index 000000000000..2941fcc890c4
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> @@ -0,0 +1,3111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim GMSL2 Deserializer Driver
> + *
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c-atr.h>
> +#include <linux/i2c-mux.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "max_des.h"
> +#include "max_ser.h"
> +#include "max_serdes.h"
> +
> +#define MAX_DES_LINK_FREQUENCY_MIN		100000000ull
> +#define MAX_DES_LINK_FREQUENCY_DEFAULT		750000000ull
> +#define MAX_DES_LINK_FREQUENCY_MAX		1250000000ull
> +
> +#define MAX_DES_PHYS_NUM			4
> +#define MAX_DES_PIPES_NUM			8
> +
> +struct max_des_priv {
> +	struct max_des *des;
> +
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct i2c_atr *atr;
> +	struct i2c_mux_core *mux;
> +
> +	struct media_pad *pads;
> +	struct regulator **pocs;
> +	struct max_serdes_source *sources;
> +	u64 *streams_masks;
> +
> +	struct notifier_block i2c_nb;
> +	struct v4l2_subdev sd;
> +	struct v4l2_async_notifier nf;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +
> +	struct max_des_phy *unused_phy;
> +};
> +
> +struct max_des_remap_context {
> +	enum max_serdes_gmsl_mode mode;
> +	/* Mark whether TPG is enabled */
> +	bool tpg;
> +	/* Mark the PHYs to which each pipe is mapped. */
> +	unsigned long pipe_phy_masks[MAX_DES_PIPES_NUM];
> +	/* Mark the pipes in use. */
> +	bool pipe_in_use[MAX_DES_PIPES_NUM];
> +	/* Mark whether pipe has remapped VC ids. */
> +	bool vc_ids_remapped[MAX_DES_PIPES_NUM];
> +	/* Map between pipe VC ids and PHY VC ids. */
> +	unsigned int vc_ids_map[MAX_DES_PIPES_NUM][MAX_DES_PHYS_NUM][MAX_SERDES=
_VC_ID_NUM];
> +	/* Mark whether a pipe VC id has been mapped to a PHY VC id. */
> +	unsigned long vc_ids_masks[MAX_DES_PIPES_NUM][MAX_DES_PHYS_NUM];
> +	/* Mark whether a PHY VC id has been mapped. */
> +	unsigned long dst_vc_ids_masks[MAX_DES_PHYS_NUM];
> +};
> +
> +struct max_des_mode_context {
> +	bool phys_bpp8_shared_with_16[MAX_DES_PHYS_NUM];
> +	bool pipes_bpp8_shared_with_16[MAX_DES_PIPES_NUM];
> +	u32 phys_double_bpps[MAX_DES_PHYS_NUM];
> +	u32 pipes_double_bpps[MAX_DES_PIPES_NUM];
> +};
> +
> +struct max_des_route_hw {
> +	struct max_serdes_source *source;
> +	struct max_des_pipe *pipe;
> +	struct max_des_phy *phy;
> +	struct v4l2_mbus_frame_desc_entry entry;
> +	bool is_tpg;
> +};
> +
> +struct max_des_link_hw {
> +	struct max_serdes_source *source;
> +	struct max_des_link *link;
> +	struct max_des_pipe *pipe;
> +};
> +
> +static inline struct max_des_priv *sd_to_priv(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct max_des_priv, sd);
> +}
> +
> +static inline struct max_des_priv *nf_to_priv(struct v4l2_async_notifier=
 *nf)
> +{
> +	return container_of(nf, struct max_des_priv, nf);
> +}
> +
> +static inline struct max_des_priv *ctrl_to_priv(struct v4l2_ctrl_handler=
 *handler)
> +{
> +	return container_of(handler, struct max_des_priv, ctrl_handler);
> +}
> +
> +static inline bool max_des_pad_is_sink(struct max_des *des, u32 pad)
> +{
> +	return pad < des->ops->num_links;
> +}
> +
> +static inline bool max_des_pad_is_source(struct max_des *des, u32 pad)
> +{
> +	return pad >=3D des->ops->num_links &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad < des->ops->num_links + des->o=
ps->num_phys;
> +}
> +
> +static inline bool max_des_pad_is_tpg(struct max_des *des, u32 pad)
> +{
> +	return pad =3D=3D des->ops->num_links + des->ops->num_phys;
> +}
> +
> +static inline unsigned int max_des_link_to_pad(struct max_des *des,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link)
> +{
> +	return link->index;
> +}
> +
> +static inline unsigned int max_des_phy_to_pad(struct max_des *des,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_phy *phy)
> +{
> +	return phy->index + des->ops->num_links;
> +}
> +
> +static inline unsigned int max_des_num_pads(struct max_des *des)
> +{
> +	return des->ops->num_links + des->ops->num_phys +
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (des->ops->set_tpg ? 1 : 0);
> +}
> +
> +static struct max_des_phy *max_des_pad_to_phy(struct max_des *des, u32 p=
ad)
> +{
> +	if (!max_des_pad_is_source(des, pad))
> +		return NULL;
> +
> +	return &des->phys[pad - des->ops->num_links];
> +}
> +
> +static struct max_des_link *max_des_pad_to_link(struct max_des *des, u32=
 pad)
> +{
> +	if (!max_des_pad_is_sink(des, pad))
> +		return NULL;
> +
> +	return &des->links[pad];
> +}
> +
> +static struct max_des_pipe *
> +max_des_find_link_pipe(struct max_des *des, struct max_des_link *link)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +
> +		if (pipe->link_id =3D=3D link->index)
> +			return pipe;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct max_serdes_source *
> +max_des_get_link_source(struct max_des_priv *priv, struct max_des_link *=
link)
> +{
> +	return &priv->sources[link->index];
> +}
> +
> +static const struct max_serdes_tpg_entry *
> +max_des_find_tpg_entry(struct max_des *des, u32 target_index,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height, u32 code,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 numerator, u32 denominator)
> +{
> +	const struct max_serdes_tpg_entry *entry;
> +	unsigned int index =3D 0;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < des->ops->tpg_entries.num_entries; i++) {
> +		entry =3D &des->ops->tpg_entries.entries[i];
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
> +	if (i =3D=3D des->ops->tpg_entries.num_entries)
> +		return NULL;
> +
> +	return &des->ops->tpg_entries.entries[i];
> +}
> +
> +static const struct max_serdes_tpg_entry *
> +max_des_find_state_tpg_entry(struct max_des *des, struct v4l2_subdev_sta=
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
> +	return max_des_find_tpg_entry(des, 0, fmt->width, fmt->height, fmt->cod=
e,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in->numerator, in->denominator);
> +}
> +
> +static int max_des_get_tpg_fd_entry_state(struct max_des *des,
> +					=C2=A0 struct v4l2_subdev_state *state,
> +					=C2=A0 struct v4l2_mbus_frame_desc_entry *fd_entry,
> +					=C2=A0 unsigned int pad)
> +{
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	entry =3D max_des_find_state_tpg_entry(des, state, pad);
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
> +static int max_des_tpg_route_to_hw(struct max_des_priv *priv,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 struct v4l2_subdev_route *route,
> +				=C2=A0=C2=A0 struct max_des_route_hw *hw)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	/* TPG injects its data into all pipes, but use pipe 0 for simplicity. =
*/
> +	hw->pipe =3D &des->pipes[0];
> +
> +	hw->phy =3D max_des_pad_to_phy(des, route->source_pad);
> +	if (!hw->phy)
> +		return -ENOENT;
> +
> +	return max_des_get_tpg_fd_entry_state(des, state, &hw->entry,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 route->sink_pad);
> +}
> +
> +static int max_des_route_to_hw(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_route *route,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_route_hw *hw)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct max_des_link *link;
> +	unsigned int i;
> +	int ret;
> +
> +	memset(hw, 0, sizeof(*hw));
> +
> +	hw->is_tpg =3D max_des_pad_is_tpg(des, route->sink_pad);
> +	if (hw->is_tpg)
> +		return max_des_tpg_route_to_hw(priv, state, route, hw);
> +
> +	link =3D max_des_pad_to_link(des, route->sink_pad);
> +	if (!link)
> +		return -ENOENT;
> +
> +	hw->phy =3D max_des_pad_to_phy(des, route->source_pad);
> +	if (!hw->phy)
> +		return -ENOENT;
> +
> +	hw->pipe =3D max_des_find_link_pipe(des, link);
> +	if (!hw->pipe)
> +		return -ENOENT;
> +
> +	hw->source =3D max_des_get_link_source(priv, link);
> +	if (!hw->source->sd)
> +		return 0;
> +
> +	ret =3D v4l2_subdev_call(hw->source->sd, pad, get_frame_desc,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->source->pad, &fd);
> +	if (ret)
> +		return ret;
Are we still supporting sensors that doesn't implement the get_frame_desc ?

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
> +static int max_des_link_to_hw(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link_hw *hw)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	memset(hw, 0, sizeof(*hw));
> +
> +	hw->link =3D link;
> +
> +	hw->pipe =3D max_des_find_link_pipe(des, hw->link);
> +	if (!hw->pipe)
> +		return -ENOENT;
> +
> +	hw->source =3D max_des_get_link_source(priv, hw->link);
> +
> +	return 0;
> +}
> +
> +static int max_des_link_index_to_hw(struct max_des_priv *priv, unsigned =
int i,
> +				=C2=A0=C2=A0=C2=A0 struct max_des_link_hw *hw)
> +{
> +	return max_des_link_to_hw(priv, &priv->des->links[i], hw);
> +}
> +
> +static int max_des_set_pipe_remaps(struct max_des_priv *priv,
> +				=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0 struct max_des_remap *remaps,
> +				=C2=A0=C2=A0 unsigned int num_remaps)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int mask =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!des->ops->set_pipe_remap)
> +		return 0;
> +
> +	for (i =3D 0; i < num_remaps; i++) {
> +		ret =3D des->ops->set_pipe_remap(des, pipe, i, &remaps[i]);
> +		if (ret)
> +			return ret;
> +
> +		mask |=3D BIT(i);
> +	}
> +
> +	return des->ops->set_pipe_remaps_enable(des, pipe, mask);
> +}
> +
> +static int max_des_set_pipe_vc_remaps(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_vc_remap *vc_remaps=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_vc_remaps)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int mask =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < num_vc_remaps; i++) {
> +		ret =3D des->ops->set_pipe_vc_remap(des, pipe, i, &vc_remaps[i]);
> +		if (ret)
> +			return ret;
> +
> +		mask |=3D BIT(i);
> +	}
> +
> +	return des->ops->set_pipe_vc_remaps_enable(des, pipe, mask);
> +}
> +
> +static int max_des_map_src_dst_vc_id(struct max_des_remap_context *conte=
xt,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pipe_id, unsigned int phy_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int src_vc_id, bool keep_vc)
> +{
> +	unsigned int vc_id;
> +
> +	if (src_vc_id >=3D MAX_SERDES_VC_ID_NUM)
> +		return -E2BIG;
> +
> +	if (context->vc_ids_masks[pipe_id][phy_id] & BIT(src_vc_id))
> +		return 0;
> +
> +	if (keep_vc && !(context->dst_vc_ids_masks[phy_id] & BIT(src_vc_id)))
> +		vc_id =3D src_vc_id;
> +	else
> +		vc_id =3D ffz(context->dst_vc_ids_masks[phy_id]);
> +
> +	if (vc_id !=3D src_vc_id)
> +		context->vc_ids_remapped[pipe_id] =3D true;
> +
> +	if (vc_id >=3D MAX_SERDES_VC_ID_NUM)
> +		return -E2BIG;
> +
> +	context->pipe_phy_masks[pipe_id] |=3D BIT(phy_id);
> +	context->dst_vc_ids_masks[phy_id] |=3D BIT(vc_id);
> +
> +	context->vc_ids_map[pipe_id][phy_id][src_vc_id] =3D vc_id;
> +	context->vc_ids_masks[pipe_id][phy_id] |=3D BIT(src_vc_id);
> +
> +	return 0;
> +}
> +
> +static int max_des_get_src_dst_vc_id(struct max_des_remap_context *conte=
xt,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int pipe_id, unsigned int phy_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int src_vc_id, unsigned int *dst_v=
c_id)
> +{
> +	if (!(context->vc_ids_masks[pipe_id][phy_id] & BIT(src_vc_id)))
> +		return -ENOENT;
> +
> +	*dst_vc_id =3D context->vc_ids_map[pipe_id][phy_id][src_vc_id];
> +
> +	return 0;
> +}
> +
> +static int max_des_populate_remap_usage(struct max_des_priv *priv,
> +					struct max_des_remap_context *context,
> +					struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.is_tpg)
> +			context->tpg =3D true;
> +
> +		context->pipe_in_use[hw.pipe->index] =3D true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_get_supported_modes(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *c=
ontext,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *modes)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	*modes =3D des->ops->modes;
> +
> +	if (context->tpg)
> +		*modes =3D BIT(des->ops->tpg_mode);
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link_hw hw;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		if (!context->pipe_in_use[hw.pipe->index])
> +			continue;
> +
> +		*modes &=3D max_ser_get_supported_modes(hw.source->sd);
> +	}
> +
> +	/*
> +	 * Serializers need to all be in the same mode because of hardware
> +	 * issues when running them in mixed modes.
> +	 */
> +	if (!*modes)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int max_des_populate_remap_context_mode(struct max_des_priv *priv=
,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *=
context,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int modes)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	context->mode =3D MAX_SERDES_GMSL_PIXEL_MODE;
> +
> +	/*
> +	 * If pixel mode is the only supported mode, do not try to see if
> +	 * tunnel mode can be used.
> +	 */
> +	if (modes =3D=3D BIT(MAX_SERDES_GMSL_PIXEL_MODE))
> +		return 0;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link_hw hw;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		if (!context->pipe_in_use[hw.pipe->index])
> +			continue;
> +
> +		if (hweight_long(context->pipe_phy_masks[hw.pipe->index]) =3D=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 (!context->vc_ids_remapped[hw.pipe->index] ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 max_ser_supports_vc_remap(hw.source->sd) ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 des->ops->set_pipe_vc_remap))
> +			continue;
> +
> +		return 0;
> +	}
> +
> +	context->mode =3D MAX_SERDES_GMSL_TUNNEL_MODE;
> +
> +	return 0;
> +}
> +
> +static int max_des_should_keep_vc(struct max_des_priv *priv,
> +				=C2=A0 struct max_des_route_hw *hw,
> +				=C2=A0 unsigned int modes)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	/* Pixel mode deserializers always have the ability to remap VCs. */
> +	if (modes =3D=3D BIT(MAX_SERDES_GMSL_PIXEL_MODE))
> +		return false;
> +
> +	if (des->ops->set_pipe_vc_remap)
> +		return false;
> +
> +	if (!hw->is_tpg && hw->source && hw->source->sd &&
> +	=C2=A0=C2=A0=C2=A0 max_ser_supports_vc_remap(hw->source->sd))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int max_des_populate_remap_context(struct max_des_priv *priv,
> +					=C2=A0 struct max_des_remap_context *context,
> +					=C2=A0 struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route *route;
> +	unsigned int modes;
> +	int ret;
> +
> +	ret =3D max_des_populate_remap_usage(priv, context, state);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_get_supported_modes(priv, context, &modes);
> +	if (ret)
> +		return ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		bool keep_vc;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		keep_vc =3D max_des_should_keep_vc(priv, &hw, modes);
> +
> +		ret =3D max_des_map_src_dst_vc_id(context, hw.pipe->index, hw.phy->ind=
ex,
> +						hw.entry.bus.csi2.vc, keep_vc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return max_des_populate_remap_context_mode(priv, context, modes);
> +}
> +
> +static int max_des_populate_mode_context(struct max_des_priv *priv,
> +					 struct max_des_mode_context *context,
> +					 struct v4l2_subdev_state *state,
> +					 enum max_serdes_gmsl_mode mode)
> +{
> +	bool bpp8_not_shared_with_16_phys[MAX_DES_PHYS_NUM] =3D { 0 };
> +	u32 undoubled_bpps_phys[MAX_DES_PHYS_NUM] =3D { 0 };
> +	u32 bpps_pipes[MAX_DES_PIPES_NUM] =3D { 0 };
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	unsigned int i;
> +	int ret;
> +
> +	if (mode !=3D MAX_SERDES_GMSL_PIXEL_MODE)
> +		return 0;
> +
> +	/*
> +	 * Go over all streams and gather the bpps for all pipes.
> +	 *
> +	 * Then, go over all the streams again and check if the
> +	 * current stream is doubled.
> +	 *
> +	 * If the current stream is doubled, add it to a doubled mask for both
> +	 * the pipe and the PHY.
> +	 *
> +	 * If the current stream is not doubled, add it to a local undoubled
> +	 * mask for the PHY.
> +	 *
> +	 * Also, track whether an 8bpp stream is shared with any bpp > 8 on bot=
h
> +	 * the PHYs and the pipes, since that needs to be special cased.
> +	 *
> +	 * After going over all the streams, remove the undoubled streams from
> +	 * the doubled ones. Doubled and undoubled streams cannot be streamed
> +	 * over the same PHY.
> +	 *
> +	 * Then, do a second pass to remove the undoubled streams from the pipe=
s.
> +	 *
> +	 * This operation cannot be done in a single pass because any pipe migh=
t
> +	 * generate an undoubled stream for a specific bpp, causing already
> +	 * processed pipes to need to have their doubled bpps updated.
> +	 */
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int bpp;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_serdes_get_fd_bpp(&hw.entry, &bpp);
> +		if (ret)
> +			return ret;
> +
> +		bpps_pipes[hw.pipe->index] |=3D BIT(bpp);
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		unsigned int bpp, min_bpp, max_bpp, doubled_bpp;
> +		unsigned int pipe_id, phy_id;
> +		struct max_des_route_hw hw;
> +		u32 sink_bpps;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_serdes_get_fd_bpp(&hw.entry, &bpp);
> +		if (ret)
> +			return ret;
> +
> +		sink_bpps =3D bpps_pipes[hw.pipe->index];
> +
> +		ret =3D max_serdes_process_bpps(priv->dev, sink_bpps, ~0U, &doubled_bp=
p);
> +		if (ret)
> +			return ret;
> +
> +		min_bpp =3D __ffs(sink_bpps);
> +		max_bpp =3D __fls(sink_bpps);
> +		pipe_id =3D hw.pipe->index;
> +		phy_id =3D hw.phy->index;
> +
> +		if (bpp =3D=3D doubled_bpp) {
> +			context->phys_double_bpps[phy_id] |=3D BIT(bpp);
> +			context->pipes_double_bpps[pipe_id] |=3D BIT(bpp);
> +		} else {
> +			undoubled_bpps_phys[phy_id] |=3D BIT(bpp);
> +		}
> +
> +		if (min_bpp =3D=3D 8 && max_bpp > 8) {
> +			context->phys_bpp8_shared_with_16[phy_id] =3D true;
> +			context->pipes_bpp8_shared_with_16[pipe_id] =3D true;
> +		} else if (min_bpp =3D=3D 8 && max_bpp =3D=3D 8) {
> +			bpp8_not_shared_with_16_phys[phy_id] =3D true;
> +		}
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		if (context->phys_bpp8_shared_with_16[i] && bpp8_not_shared_with_16_ph=
ys[i]) {
> +			dev_err(priv->dev,
> +				"Cannot stream 8bpp coming from pipes padded to 16bpp "
> +				"and pipes not padded to 16bpp on the same PHY\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++)
> +		context->phys_double_bpps[i] &=3D ~undoubled_bpps_phys[i];
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		context->pipes_double_bpps[hw.pipe->index] &=3D
> +			context->phys_double_bpps[hw.phy->index];
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_add_vc_remap(struct max_des *des, struct max_serdes_v=
c_remap *vc_remaps,
> +				unsigned int *num_vc_remaps, unsigned int src_vc_id,
> +				unsigned int dst_vc_id)
> +{
> +	struct max_serdes_vc_remap *vc_remap;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < *num_vc_remaps; i++) {
> +		vc_remap =3D &vc_remaps[i];
> +
> +		if (vc_remap->src =3D=3D src_vc_id && vc_remap->dst =3D=3D dst_vc_id)
> +			return 0;
> +	}
> +
> +	if (*num_vc_remaps =3D=3D MAX_SERDES_VC_ID_NUM)
> +		return -E2BIG;
> +
> +	vc_remaps[*num_vc_remaps].src =3D src_vc_id;
> +	vc_remaps[*num_vc_remaps].dst =3D dst_vc_id;
> +
> +	(*num_vc_remaps)++;
> +
> +	return 0;
> +}
> +
> +static int max_des_get_pipe_vc_remaps(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *context=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_serdes_vc_remap *vc_remaps=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *num_vc_remaps,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks, bool with_tpg)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	*num_vc_remaps =3D 0;
> +
> +	if (context->mode !=3D MAX_SERDES_GMSL_TUNNEL_MODE)
> +		return 0;
> +
> +	for_each_active_route(&state->routing, route) {
> +		unsigned int src_vc_id, dst_vc_id;
> +		struct max_des_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!with_tpg && hw.is_tpg)
> +			continue;
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		src_vc_id =3D hw.entry.bus.csi2.vc;
> +
> +		ret =3D max_des_get_src_dst_vc_id(context, pipe->index, hw.phy->index,
> +						src_vc_id, &dst_vc_id);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_des_add_vc_remap(des, vc_remaps, num_vc_remaps,
> +					=C2=A0=C2=A0 src_vc_id, dst_vc_id);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max_des_get_pipe_mode(struct max_des_mode_context *context,
> +				=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0 struct max_des_pipe_mode *mode)
> +{
> +	u32 double_bpps =3D context->pipes_double_bpps[pipe->index];
> +
> +	if ((double_bpps & BIT(8)) &&
> +	=C2=A0=C2=A0=C2=A0 !context->pipes_bpp8_shared_with_16[pipe->index]) {
> +		mode->dbl8 =3D true;
> +		mode->dbl8mode =3D true;
> +	}
> +}
> +
> +static void max_des_get_phy_mode(struct max_des_mode_context *context,
> +				 struct max_des_phy *phy,
> +				 struct max_des_phy_mode *mode)
> +{
> +	bool bpp8_pipe_shared_with_16 =3D context->phys_bpp8_shared_with_16[phy=
->index];
> +	u32 double_bpps =3D context->phys_double_bpps[phy->index];
> +
> +	if (BIT(8) & double_bpps) {
> +		if (bpp8_pipe_shared_with_16)
> +			mode->alt2_mem_map8 =3D true;
> +		else
> +			mode->alt_mem_map8 =3D true;
> +	}
> +
> +	if (BIT(10) & double_bpps)
> +		mode->alt_mem_map10 =3D true;
> +
> +	if (BIT(12) & double_bpps)
> +		mode->alt_mem_map12 =3D true;
> +}
> +
> +static int max_des_set_modes(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_mode_context *context)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		struct max_des_phy *phy =3D &des->phys[i];
> +		struct max_des_phy_mode mode =3D { 0 };
> +
> +		max_des_get_phy_mode(context, phy, &mode);
> +
> +		if (phy->mode.alt_mem_map8 =3D=3D mode.alt_mem_map8 &&
> +		=C2=A0=C2=A0=C2=A0 phy->mode.alt_mem_map10 =3D=3D mode.alt_mem_map10 &=
&
> +		=C2=A0=C2=A0=C2=A0 phy->mode.alt_mem_map12 =3D=3D mode.alt_mem_map12 &=
&
> +		=C2=A0=C2=A0=C2=A0 phy->mode.alt2_mem_map8 =3D=3D mode.alt2_mem_map8)
> +			continue;
> +
> +		if (des->ops->set_phy_mode) {
> +			ret =3D des->ops->set_phy_mode(des, phy, &mode);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		phy->mode =3D mode;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +		struct max_des_pipe_mode mode =3D { 0 };
> +
> +		max_des_get_pipe_mode(context, pipe, &mode);
> +
> +		if (pipe->mode.dbl8 =3D=3D mode.dbl8 &&
> +		=C2=A0=C2=A0=C2=A0 pipe->mode.dbl10 =3D=3D mode.dbl10 &&
> +		=C2=A0=C2=A0=C2=A0 pipe->mode.dbl12 =3D=3D mode.dbl12 &&
> +		=C2=A0=C2=A0=C2=A0 pipe->mode.dbl8mode =3D=3D mode.dbl8mode &&
> +		=C2=A0=C2=A0=C2=A0 pipe->mode.dbl10mode =3D=3D mode.dbl10mode)
> +			continue;
> +
> +		if (des->ops->set_pipe_mode) {
> +			ret =3D des->ops->set_pipe_mode(des, pipe, &mode);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		pipe->mode =3D mode;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link_hw hw;
> +		u32 pipe_double_bpps =3D 0;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		pipe_double_bpps =3D context->pipes_double_bpps[hw.pipe->index];
> +
> +		ret =3D max_ser_set_double_bpps(hw.source->sd, pipe_double_bpps);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_set_tunnel(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *context)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->ops->set_pipe_tunnel_enable) {
> +		for (i =3D 0; i < des->ops->num_pipes; i++) {
> +			struct max_des_pipe *pipe =3D &des->pipes[i];
> +			bool tunnel_mode =3D context->mode =3D=3D MAX_SERDES_GMSL_TUNNEL_MODE=
;
> +
> +			ret =3D des->ops->set_pipe_tunnel_enable(des, pipe, tunnel_mode);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link_hw hw;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		if (!context->pipe_in_use[hw.pipe->index])
> +			continue;
> +
> +		ret =3D max_ser_set_mode(hw.source->sd, context->mode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	des->mode =3D context->mode;
> +
> +	return 0;
> +}
> +
> +static int max_des_set_vc_remaps(struct max_des_priv *priv,
> +				 struct max_des_remap_context *context,
> +				 struct v4l2_subdev_state *state,
> +				 u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->ops->set_pipe_vc_remap)
> +		return 0;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_serdes_vc_remap vc_remaps[MAX_SERDES_VC_ID_NUM];
> +		struct max_des_link_hw hw;
> +		unsigned int num_vc_remaps;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		if (!max_ser_supports_vc_remap(hw.source->sd))
> +			continue;
> +
> +		ret =3D max_des_get_pipe_vc_remaps(priv, context, hw.pipe,
> +						 vc_remaps, &num_vc_remaps,
> +						 state, streams_masks, false);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_ser_set_vc_remaps(hw.source->sd, vc_remaps, num_vc_remaps)=
;
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_set_pipes_stream_id(struct max_des_priv *priv)
> +{
> +	bool stream_id_usage[MAX_SERDES_STREAMS_NUM] =3D { 0 };
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link_hw hw;
> +		unsigned int stream_id;
> +
> +		ret =3D max_des_link_index_to_hw(priv, i, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.link->enabled)
> +			continue;
> +
> +		if (!hw.source->sd)
> +			continue;
> +
> +		stream_id =3D hw.pipe->stream_id;
> +
> +		ret =3D max_ser_set_stream_id(hw.source->sd, stream_id);
> +		if (ret =3D=3D -EOPNOTSUPP) {
> +			/*
> +			 * Serializer does not support setting the stream id, retrieve
> +			 * its hardcoded stream id.
> +			 */
> +			ret =3D max_ser_get_stream_id(hw.source->sd, &stream_id);
> +		}
> +
> +		if (ret)
> +			return ret;
> +
> +		if (stream_id_usage[stream_id] && des->ops->needs_unique_stream_id) {
> +			dev_err(priv->dev, "Duplicate stream id %u\n", stream_id);
> +			return -EINVAL;
> +		}
> +
> +		ret =3D des->ops->set_pipe_stream_id(des, hw.pipe, stream_id);
> +		if (ret)
> +			return ret;
> +
> +		stream_id_usage[stream_id] =3D true;
> +		hw.pipe->stream_id =3D stream_id;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_set_pipes_phy(struct max_des_priv *priv,
> +				 struct max_des_remap_context *context)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!des->ops->set_pipe_phy && !des->ops->set_pipe_tunnel_phy)
> +		return 0;
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +		struct max_des_phy *phy;
> +		unsigned int phy_id;
> +
> +		phy_id =3D find_first_bit(&context->pipe_phy_masks[pipe->index],
> +					des->ops->num_phys);
> +
> +		if (priv->unused_phy &&
> +		=C2=A0=C2=A0=C2=A0 (context->mode !=3D MAX_SERDES_GMSL_TUNNEL_MODE ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 phy_id =3D=3D des->ops->num_phys))
> +			phy_id =3D priv->unused_phy->index;
> +
> +		if (phy_id !=3D des->ops->num_phys) {
> +			phy =3D &des->phys[phy_id];
> +
> +			if (context->mode =3D=3D MAX_SERDES_GMSL_PIXEL_MODE &&
> +			=C2=A0=C2=A0=C2=A0 des->ops->set_pipe_phy)
> +				ret =3D des->ops->set_pipe_phy(des, pipe, phy);
> +			else if (context->mode =3D=3D MAX_SERDES_GMSL_TUNNEL_MODE &&
> +				 des->ops->set_pipe_tunnel_phy)
> +				ret =3D des->ops->set_pipe_tunnel_phy(des, pipe, phy);
> +			else
> +				ret =3D 0;
> +
> +			if (ret)
> +				return ret;
> +		}
> +
> +		pipe->phy_id =3D phy_id;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_add_remap(struct max_des *des, struct max_des_remap *=
remaps,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *num_remaps, unsigned int phy_i=
d,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int src_vc_id, unsigned int dst_vc_=
id,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int dt)
> +{
> +	struct max_des_remap *remap;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < *num_remaps; i++) {
> +		remap =3D &remaps[i];
> +
> +		if (remap->from_dt =3D=3D dt && remap->to_dt =3D=3D dt &&
> +		=C2=A0=C2=A0=C2=A0 remap->from_vc =3D=3D src_vc_id && remap->to_vc =3D=
=3D dst_vc_id &&
> +		=C2=A0=C2=A0=C2=A0 remap->phy =3D=3D phy_id)
> +			return 0;
> +	}
> +
> +	if (*num_remaps =3D=3D des->ops->num_remaps_per_pipe)
> +		return -E2BIG;
> +
> +	remap =3D &remaps[*num_remaps];
> +	remap->from_dt =3D dt;
> +	remap->from_vc =3D src_vc_id;
> +	remap->to_dt =3D dt;
> +	remap->to_vc =3D dst_vc_id;
> +	remap->phy =3D phy_id;
> +
> +	(*num_remaps)++;
> +
> +	return 0;
> +}
> +
> +static int max_des_add_remaps(struct max_des *des, struct max_des_remap =
*remaps,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *num_remaps, unsigned int=
 phy_id,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int src_vc_id, unsigned int d=
st_vc_id,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int dt)
> +{
> +	int ret;
> +
> +	ret =3D max_des_add_remap(des, remaps, num_remaps, phy_id,
> +				src_vc_id, dst_vc_id, dt);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_add_remap(des, remaps, num_remaps, phy_id,
> +				src_vc_id, dst_vc_id, MIPI_CSI2_DT_FS);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_add_remap(des, remaps, num_remaps, phy_id,
> +				src_vc_id, dst_vc_id, MIPI_CSI2_DT_FE);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int max_des_get_pipe_remaps(struct max_des_priv *priv,
> +				=C2=A0=C2=A0 struct max_des_remap_context *context,
> +				=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0 struct max_des_remap *remaps,
> +				=C2=A0=C2=A0 unsigned int *num_remaps,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct v4l2_mbus_frame_desc_entry tpg_entry =3D { 0 };
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	bool is_tpg_pipe =3D true;
> +	int ret;
> +
> +	*num_remaps =3D 0;
> +
> +	if (context->mode !=3D MAX_SERDES_GMSL_PIXEL_MODE)
> +		return 0;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int src_vc_id, dst_vc_id;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (hw.is_tpg && hw.pipe !=3D pipe) {
> +			is_tpg_pipe =3D false;
> +			tpg_entry =3D hw.entry;
> +		}
> +
> +		if (hw.pipe !=3D pipe)
> +			continue;
> +
> +		src_vc_id =3D hw.entry.bus.csi2.vc;
> +
> +		ret =3D max_des_get_src_dst_vc_id(context, pipe->index, hw.phy->index,
> +						src_vc_id, &dst_vc_id);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_des_add_remaps(des, remaps, num_remaps, hw.phy->index,
> +					 src_vc_id, dst_vc_id,
> +					 hw.entry.bus.csi2.dt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * TPG mode is only handled on pipe 0, but the TPG pollutes other pipes
> +	 * with the same data.
> +	 * For devices that do not support setting the default PHY of a pipe,
> +	 * we want to filter out this data so it does not end up on the wrong
> +	 * PHY.
> +	 * Devices that support setting the default PHY of a pipe already use i=
t
> +	 * to route unused pipes to an unused PHY.
> +	 */
> +	if (context->tpg && !is_tpg_pipe && !des->ops->set_pipe_phy &&
> +	=C2=A0=C2=A0=C2=A0 priv->unused_phy) {
> +		ret =3D max_des_add_remaps(des, remaps, num_remaps,
> +					 priv->unused_phy->index,
> +					 tpg_entry.bus.csi2.vc,
> +					 tpg_entry.bus.csi2.vc,
> +					 tpg_entry.bus.csi2.dt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_update_pipe_vc_remaps(struct max_des_priv *priv,
> +					 struct max_des_remap_context *context,
> +					 struct max_des_pipe *pipe,
> +					 struct v4l2_subdev_state *state,
> +					 u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_serdes_vc_remap *vc_remaps;
> +	unsigned int num_vc_remaps;
> +	int ret;
> +
> +	if (!des->ops->set_pipe_vc_remap)
> +		return 0;
> +
> +	vc_remaps =3D devm_kcalloc(priv->dev, MAX_SERDES_VC_ID_NUM,
> +				 sizeof(*vc_remaps), GFP_KERNEL);
> +	if (!vc_remaps)
> +		return -ENOMEM;
> +
> +	ret =3D max_des_get_pipe_vc_remaps(priv, context, pipe, vc_remaps, &num=
_vc_remaps,
> +					 state, streams_masks, true);
> +	if (ret)
> +		goto err_free_new_vc_remaps;
> +
> +	ret =3D max_des_set_pipe_vc_remaps(priv, pipe, vc_remaps, num_vc_remaps=
);
> +	if (ret)
> +		goto err_free_new_vc_remaps;
> +
> +	if (pipe->num_vc_remaps)
> +		devm_kfree(priv->dev, pipe->vc_remaps);
> +
> +	pipe->vc_remaps =3D vc_remaps;
> +	pipe->num_vc_remaps =3D num_vc_remaps;
> +
> +	return 0;
> +
> +err_free_new_vc_remaps:
> +	devm_kfree(priv->dev, vc_remaps);
> +
> +	return ret;
> +}
> +
> +static int max_des_update_pipe_remaps(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *context=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_des_remap *remaps;
> +	unsigned int num_remaps;
> +	int ret;
> +
> +	if (!des->ops->set_pipe_remap)
> +		return 0;
> +
> +	remaps =3D devm_kcalloc(priv->dev, des->ops->num_remaps_per_pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*remaps), GFP_KERNEL);
> +	if (!remaps)
> +		return -ENOMEM;
> +
> +	ret =3D max_des_get_pipe_remaps(priv, context, pipe, remaps, &num_remap=
s,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state, streams_masks);
> +	if (ret)
> +		goto err_free_new_remaps;
> +
> +	ret =3D max_des_set_pipe_remaps(priv, pipe, remaps, num_remaps);
> +	if (ret)
> +		goto err_free_new_remaps;
> +
> +	if (pipe->remaps)
> +		devm_kfree(priv->dev, pipe->remaps);
> +
> +	pipe->remaps =3D remaps;
> +	pipe->num_remaps =3D num_remaps;
> +
> +	return 0;
> +
> +err_free_new_remaps:
> +	devm_kfree(priv->dev, remaps);
> +
> +	return ret;
> +}
> +
> +static int max_des_update_pipe_enable(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	bool enable =3D false;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
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
> +	ret =3D des->ops->set_pipe_enable(des, pipe, enable);
> +	if (ret)
> +		return ret;
> +
> +	pipe->enabled =3D enable;
> +
> +	return 0;
> +}
> +
> +static int max_des_update_pipe(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *co=
ntext,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	int ret;
> +
> +	ret =3D max_des_update_pipe_remaps(priv, context, pipe,
> +					 state, streams_masks);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_update_pipe_vc_remaps(priv, context, pipe, state,
> +					=C2=A0=C2=A0=C2=A0 streams_masks);
> +	if (ret)
> +		goto err_revert_update_pipe_remaps;
> +
> +	ret =3D max_des_update_pipe_enable(priv, pipe, state, streams_masks);
> +	if (ret)
> +		goto err_revert_update_pipe_vc_remaps;
> +
> +	return 0;
> +
> +err_revert_update_pipe_vc_remaps:
> +	max_des_update_pipe_vc_remaps(priv, context, pipe, state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->streams_masks);
> +
> +err_revert_update_pipe_remaps:
> +	max_des_update_pipe_remaps(priv, context, pipe, state,
> +				=C2=A0=C2=A0 priv->streams_masks);
> +
> +	return ret;
> +}
> +
> +static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adapter,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 power_up_addr, u8 new_addr)
> +{
> +	struct max_des *des =3D priv->des;
> +	u8 addrs[] =3D { power_up_addr, new_addr };
> +	u8 current_addr;
> +	int ret;
> +
> +	ret =3D des->ops->select_links(des, BIT(link->index));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> +					&current_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x or 0x%02x: %d\n",
> +			power_up_addr, new_addr, ret);
> +		return ret;
> +	}
> +
> +	ret =3D max_ser_reset(adapter, current_addr);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to reset serializer: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D max_ser_wait(adapter, power_up_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x: %d\n",
> +			power_up_addr, ret);
> +		return ret;
> +	}
> +
> +	ret =3D max_ser_change_address(adapter, power_up_addr, new_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to change serializer from 0x%02x to 0x%02x: %d\n",
> +			power_up_addr, new_addr, ret);
> +		return ret;
> +	}
> +
> +	ret =3D max_ser_wait(adapter, new_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x: %d\n",
> +			new_addr, ret);
> +		return ret;
> +	}
> +
> +	if (des->ops->fix_tx_ids) {
> +		ret =3D max_ser_fix_tx_ids(adapter, new_addr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int max_des_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->ops->init) {
> +		ret =3D des->ops->init(des);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (des->ops->set_enable) {
> +		ret =3D des->ops->set_enable(des, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		struct max_des_phy *phy =3D &des->phys[i];
> +
> +		if (phy->enabled) {
> +			ret =3D des->ops->init_phy(des, phy);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D des->ops->set_phy_enable(des, phy, phy->enabled);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +		struct max_des_link *link =3D &des->links[pipe->link_id];
> +
> +		ret =3D des->ops->set_pipe_enable(des, pipe, false);
> +		if (ret)
> +			return ret;
> +
> +		if (des->ops->set_pipe_tunnel_enable) {
> +			ret =3D des->ops->set_pipe_tunnel_enable(des, pipe, false);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (des->ops->set_pipe_stream_id) {
> +			ret =3D des->ops->set_pipe_stream_id(des, pipe, pipe->stream_id);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (des->ops->set_pipe_link) {
> +			ret =3D des->ops->set_pipe_link(des, pipe, link);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D max_des_set_pipe_remaps(priv, pipe, pipe->remaps,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipe->num_remaps);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!des->ops->init_link)
> +		return 0;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		ret =3D des->ops->init_link(des, link);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max_des_ser_find_version_range(struct max_des *des, int *min=
, int *max)
> +{
> +	unsigned int i;
> +
> +	*min =3D MAX_SERDES_GMSL_MIN;
> +	*max =3D MAX_SERDES_GMSL_MAX;
> +
> +	if (!des->ops->needs_single_link_version)
> +		return;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		if (!link->ser_xlate.en)
> +			continue;
> +
> +		*min =3D *max =3D link->version;
> +
> +		return;
> +	}
> +}
> +
> +static int max_des_ser_attach_addr(struct max_des_priv *priv, u32 chan_i=
d,
> +				=C2=A0=C2=A0 u16 addr, u16 alias)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_des_link *link =3D &des->links[chan_id];
> +	int i, min, max;
> +	int ret =3D 0;
> +
> +	max_des_ser_find_version_range(des, &min, &max);
> +
> +	if (link->ser_xlate.en) {
> +		dev_err(priv->dev, "Serializer for link %u already bound\n",
> +			link->index);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D max; i >=3D min; i--) {
> +		if (!(des->ops->versions & BIT(i)))
> +			continue;
> +
> +		if (des->ops->set_link_version) {
> +			ret =3D des->ops->set_link_version(des, link, i);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret =3D max_des_init_link_ser_xlate(priv, link, priv->client->adapter,
> +						=C2=A0 addr, alias);
> +		if (!ret)
> +			break;
> +	}
> +
> +	if (ret) {
> +		dev_err(priv->dev, "Cannot find serializer for link %u\n",
> +			link->index);
> +		return -ENOENT;
> +	}
> +
> +	link->version =3D i;
> +	link->ser_xlate.src =3D alias;
> +	link->ser_xlate.dst =3D addr;
> +	link->ser_xlate.en =3D true;
> +
> +	return 0;
> +}
> +
> +static int max_des_ser_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 addr, u16 alias)
> +{
> +	struct max_des_priv *priv =3D i2c_atr_get_driver_data(atr);
> +
> +	return max_des_ser_attach_addr(priv, chan_id, addr, alias);
> +}
> +
> +static void max_des_ser_atr_detach_addr(struct i2c_atr *atr, u32 chan_id=
, u16 addr)
> +{
> +	/* Don't do anything. */
> +}
> +
> +static const struct i2c_atr_ops max_des_i2c_atr_ops =3D {
> +	.attach_addr =3D max_des_ser_atr_attach_addr,
> +	.detach_addr =3D max_des_ser_atr_detach_addr,
> +};
> +
> +static void max_des_i2c_atr_deinit(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		/* Deleting adapters that haven't been added does no harm. */
> +		i2c_atr_del_adapter(priv->atr, link->index);
> +	}
> +
> +	i2c_atr_delete(priv->atr);
> +}
> +
> +static int max_des_i2c_atr_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int mask =3D 0;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!i2c_check_functionality(priv->client->adapter,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +		return -ENODEV;
> +
> +	priv->atr =3D i2c_atr_new(priv->client->adapter, priv->dev,
> +				&max_des_i2c_atr_ops, des->ops->num_links,
> +				I2C_ATR_F_STATIC | I2C_ATR_F_PASSTHROUGH);
> +	if (IS_ERR(priv->atr))
> +		return PTR_ERR(priv->atr);
> +
> +	i2c_atr_set_driver_data(priv->atr, priv);
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +		struct i2c_atr_adap_desc desc =3D {
> +			.chan_id =3D i,
> +		};
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		ret =3D i2c_atr_add_adapter(priv->atr, &desc);
> +		if (ret)
> +			goto err_add_adapters;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		mask |=3D BIT(link->index);
> +	}
> +
> +	return des->ops->select_links(des, mask);
> +
> +err_add_adapters:
> +	max_des_i2c_atr_deinit(priv);
> +
> +	return ret;
> +}
> +
> +static void max_des_i2c_mux_deinit(struct max_des_priv *priv)
> +{
> +	i2c_mux_del_adapters(priv->mux);
> +	bus_unregister_notifier(&i2c_bus_type, &priv->i2c_nb);
> +}
> +
> +static int max_des_i2c_mux_bus_notifier_call(struct notifier_block *nb,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long event, void *device)
> +{
> +	struct max_des_priv *priv =3D container_of(nb, struct max_des_priv, i2c=
_nb);
> +	struct device *dev =3D device;
> +	struct i2c_client *client;
> +	u32 chan_id;
> +
> +	/*
> +	 * Ideally, we would want to negotiate the GMSL version on
> +	 * BUS_NOTIFY_ADD_DEVICE, but the adapters list is only populated with
> +	 * the new adapter after BUS_NOTIFY_ADD_DEVICE is issued.
> +	 */
> +	if (event !=3D BUS_NOTIFY_BIND_DRIVER)
> +		return NOTIFY_DONE;
> +
> +	client =3D i2c_verify_client(dev);
> +	if (!client)
> +		return NOTIFY_DONE;
> +
> +	for (chan_id =3D 0; chan_id < priv->mux->max_adapters; ++chan_id) {
> +		if (client->adapter =3D=3D priv->mux->adapter[chan_id])
> +			break;
> +	}
> +
> +	if (chan_id =3D=3D priv->mux->max_adapters)
> +		return NOTIFY_DONE;
> +
> +	max_des_ser_attach_addr(priv, chan_id, client->addr, client->addr);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int max_des_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
> +{
> +	struct max_des_priv *priv =3D i2c_mux_priv(muxc);
> +	struct max_des *des =3D priv->des;
> +
> +	if (!des->ops->select_links)
> +		return 0;
> +
> +	return des->ops->select_links(des, BIT(chan));
> +}
> +
> +static int max_des_i2c_mux_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	u32 flags =3D I2C_MUX_LOCKED;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->ops->num_links =3D=3D 1)
> +		flags |=3D I2C_MUX_GATE;
> +
> +	priv->mux =3D i2c_mux_alloc(priv->client->adapter, priv->dev,
> +				=C2=A0 des->ops->num_links, 0, flags,
> +				=C2=A0 max_des_i2c_mux_select, NULL);
> +	if (!priv->mux)
> +		return -ENOMEM;
> +
> +	priv->mux->priv =3D priv;
> +
> +	priv->i2c_nb.notifier_call =3D max_des_i2c_mux_bus_notifier_call;
> +	ret =3D bus_register_notifier(&i2c_bus_type, &priv->i2c_nb);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		ret =3D i2c_mux_add_adapter(priv->mux, 0, i);
> +		if (ret)
> +			goto err_add_adapters;
> +	}
> +
> +	return 0;
> +
> +err_add_adapters:
> +	max_des_i2c_mux_deinit(priv);
> +
> +	return ret;
> +}
> +
> +static void max_des_i2c_adapter_deinit(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	if (des->ops->use_atr)
> +		return max_des_i2c_atr_deinit(priv);
> +	else
> +		return max_des_i2c_mux_deinit(priv);
> +}
> +
> +static int max_des_i2c_adapter_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	if (des->ops->use_atr)
> +		return max_des_i2c_atr_init(priv);
> +	else
> +		return max_des_i2c_mux_init(priv);
> +
> +	return 0;
> +}
> +
> +static int max_des_set_tpg_fmt(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format *forma=
t)
> +{
> +	struct v4l2_mbus_framefmt *fmt =3D &format->format;
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_fract *in;
> +
> +	if (format->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
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
> +static int max_des_set_fmt(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0 struct v4l2_subdev_format *format)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && des->active)
> +		return -EBUSY;
> +
> +	/* No transcoding, source and sink formats must match. */
> +	if (max_des_pad_is_source(des, format->pad))
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	if (max_des_pad_is_tpg(des, format->pad)) {
> +		ret =3D max_des_set_tpg_fmt(sd, state, format);
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
> +static int max_des_enum_frame_interval(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_frame_interv=
al_enum *fie)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +
> +	if (!max_des_pad_is_tpg(des, fie->pad) ||
> +	=C2=A0=C2=A0=C2=A0 fie->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	entry =3D max_des_find_tpg_entry(des, fie->index, fie->width, fie->heig=
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
> +static int max_des_set_frame_interval(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_frame_interval *fi=
)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_fract *in;
> +
> +	if (!max_des_pad_is_tpg(des, fi->pad) ||
> +	=C2=A0=C2=A0=C2=A0 fi->stream !=3D MAX_SERDES_TPG_STREAM)
> +		return -EINVAL;
> +
> +	if (fi->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && des->active)
> +		return -EBUSY;
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, fi->pad, fi->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	entry =3D max_des_find_tpg_entry(des, 0, fmt->width, fmt->height,
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
> +static int max_des_log_status(struct v4l2_subdev *sd)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	unsigned int i, j;
> +	int ret;
> +
> +	v4l2_info(sd, "active: %u\n", des->active);
> +	v4l2_info(sd, "mode: %s", max_serdes_gmsl_mode_str(des->mode));
> +	if (des->ops->set_tpg) {
> +		const struct max_serdes_tpg_entry *entry =3D des->tpg_entry;
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
> +	if (des->ops->log_status) {
> +		ret =3D des->ops->log_status(des);
> +		if (ret)
> +			return ret;
> +	}
> +	v4l2_info(sd, "\n");
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		v4l2_info(sd, "link: %u\n", link->index);
> +		v4l2_info(sd, "\tenabled: %u\n", link->enabled);
> +
> +		if (!link->enabled) {
> +			v4l2_info(sd, "\n");
> +			continue;
> +		}
> +
> +		v4l2_info(sd, "\tversion: %s\n", max_serdes_gmsl_version_str(link->ver=
sion));
> +		v4l2_info(sd, "\tser_xlate: en: %u, src: 0x%02x dst: 0x%02x\n",
> +			=C2=A0 link->ser_xlate.en, link->ser_xlate.src,
> +			=C2=A0 link->ser_xlate.dst);
> +		v4l2_info(sd, "\n");
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		struct max_des_pipe *pipe =3D &des->pipes[i];
> +
> +		v4l2_info(sd, "pipe: %u\n", pipe->index);
> +		v4l2_info(sd, "\tenabled: %u\n", pipe->enabled);
> +		if (pipe->phy_id =3D=3D des->ops->num_phys ||
> +		=C2=A0=C2=A0=C2=A0 (priv->unused_phy && pipe->phy_id =3D=3D priv->unus=
ed_phy->index))
> +			v4l2_info(sd, "\tphy_id: invalid\n");
> +		else
> +			v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
> +		v4l2_info(sd, "\tlink_id: %u\n", pipe->link_id);
> +		if (des->ops->set_pipe_stream_id)
> +			v4l2_info(sd, "\tstream_id: %u\n", pipe->stream_id);
> +		if (des->ops->set_pipe_mode) {
> +			v4l2_info(sd, "\tdbl8: %u\n", pipe->mode.dbl8);
> +			v4l2_info(sd, "\tdbl8mode: %u\n", pipe->mode.dbl8mode);
> +			v4l2_info(sd, "\tdbl10: %u\n", pipe->mode.dbl10);
> +			v4l2_info(sd, "\tdbl10mode: %u\n", pipe->mode.dbl10mode);
> +			v4l2_info(sd, "\tdbl12: %u\n", pipe->mode.dbl12);
> +		}
> +		if (des->ops->set_pipe_remap) {
> +			v4l2_info(sd, "\tremaps: %u\n", pipe->num_remaps);
> +			for (j =3D 0; j < pipe->num_remaps; j++) {
> +				struct max_des_remap *remap =3D &pipe->remaps[j];
> +
> +				v4l2_info(sd, "\t\tremap: from: vc: %u, dt: 0x%02x\n",
> +					=C2=A0 remap->from_vc, remap->from_dt);
> +				v4l2_info(sd, "\t\t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to:=C2=A0=C2=
=A0 vc: %u, dt: 0x%02x, phy: %u\n",
> +					=C2=A0 remap->to_vc, remap->to_dt, remap->phy);
> +			}
> +		}
> +		if (des->ops->set_pipe_vc_remap) {
> +			v4l2_info(sd, "\tvc_remaps: %u\n", pipe->num_vc_remaps);
> +			for (j =3D 0; j < pipe->num_vc_remaps; j++) {
> +				v4l2_info(sd, "\t\tvc_remap: src: %u, dst: %u\n",
> +					=C2=A0 pipe->vc_remaps[j].src, pipe->vc_remaps[j].dst);
> +			}
> +		}
> +		if (des->ops->log_pipe_status) {
> +			ret =3D des->ops->log_pipe_status(des, pipe);
> +			if (ret)
> +				return ret;
> +		}
> +		v4l2_info(sd, "\n");
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		struct max_des_phy *phy =3D &des->phys[i];
> +
> +		v4l2_info(sd, "phy: %u\n", phy->index);
> +		v4l2_info(sd, "\tenabled: %u\n", phy->enabled);
> +
> +		if (!phy->enabled) {
> +			v4l2_info(sd, "\n");
> +			continue;
> +		}
> +
> +		v4l2_info(sd, "\tlink_frequency: %llu\n", phy->link_frequency);
> +		v4l2_info(sd, "\tnum_data_lanes: %u\n", phy->mipi.num_data_lanes);
> +		v4l2_info(sd, "\tclock_lane: %u\n", phy->mipi.clock_lane);
> +		if (des->ops->set_phy_mode) {
> +			v4l2_info(sd, "\talt_mem_map8: %u\n", phy->mode.alt_mem_map8);
> +			v4l2_info(sd, "\talt2_mem_map8: %u\n", phy->mode.alt2_mem_map8);
> +			v4l2_info(sd, "\talt_mem_map10: %u\n", phy->mode.alt_mem_map10);
> +			v4l2_info(sd, "\talt_mem_map12: %u\n", phy->mode.alt_mem_map12);
> +		}
> +		if (des->ops->log_phy_status) {
> +			ret =3D des->ops->log_phy_status(des, phy);
> +			if (ret)
> +				return ret;
> +		}
> +		v4l2_info(sd, "\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max_des_priv *priv =3D ctrl_to_priv(ctrl->handler);
> +	struct max_des *des =3D priv->des;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		des->tpg_pattern =3D ctrl->val;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_mbus_frame_desc *fd,
> +					unsigned int pad)
> +{
> +	struct max_des_remap_context context =3D { 0 };
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	ret =3D max_des_populate_remap_context(priv, &context, state);
> +	if (ret)
> +		return ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +		unsigned int dst_vc_id;
> +
> +		if (pad !=3D route->source_pad)
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D max_des_get_src_dst_vc_id(&context, hw.pipe->index, hw.phy->in=
dex,
> +						hw.entry.bus.csi2.vc, &dst_vc_id);
> +		if (ret)
> +			return ret;
> +
> +		hw.entry.bus.csi2.vc =3D dst_vc_id;
> +		hw.entry.stream =3D route->source_stream;
> +
> +		fd->entry[fd->num_entries++] =3D hw.entry;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_get_frame_desc(struct v4l2_subdev *sd, unsigned int p=
ad,
> +				=C2=A0 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(&priv->sd);
> +
> +	ret =3D max_des_get_frame_desc_state(sd, state, fd, pad);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int max_des_get_mbus_config(struct v4l2_subdev *sd, unsigned int =
pad,
> +				=C2=A0=C2=A0 struct v4l2_mbus_config *cfg)
> +{
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct max_des *des =3D priv->des;
> +	struct max_des_phy *phy;
> +
> +	phy =3D max_des_pad_to_phy(des, pad);
> +	if (!phy)
> +		return -EINVAL;
> +
> +	cfg->type =3D phy->bus_type;
> +	cfg->bus.mipi_csi2 =3D phy->mipi;
> +	cfg->link_freq =3D phy->link_frequency;
> +
> +	return 0;
> +}
> +
> +static int max_des_set_tpg_routing(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 struct v4l2_subdev_krouting *routing)
> +{
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_tpg_entry *entry;
> +	struct v4l2_mbus_framefmt fmt =3D { 0 };
> +	int ret;
> +
> +	ret =3D max_serdes_validate_tpg_routing(routing);
> +	if (ret)
> +		return ret;
> +
> +	entry =3D &des->ops->tpg_entries.entries[0];
> +
> +	fmt.width =3D entry->width;
> +	fmt.height =3D entry->height;
> +	fmt.code =3D entry->code;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &fmt);
> +}
> +
> +static int max_des_set_routing(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum v4l2_subdev_format_whence w=
hich,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_krouting *rou=
ting)
> +{
> +	struct max_des_priv *priv =3D sd_to_priv(sd);
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	bool is_tpg =3D false;
> +	int ret;
> +
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && des->active)
> +		return -EBUSY;
> +
> +	ret =3D v4l2_subdev_routing_validate(sd, routing,
> +					=C2=A0=C2=A0 V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					=C2=A0=C2=A0 V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
> +	if (ret)
> +		return ret;
> +
> +	for_each_active_route(routing, route) {
> +		if (max_des_pad_is_tpg(des, route->sink_pad)) {
> +			is_tpg =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (is_tpg)
> +		return max_des_set_tpg_routing(sd, state, routing);
> +
> +	return v4l2_subdev_set_routing(sd, state, routing);
> +}
> +
> +static int max_des_update_link(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_remap_context *co=
ntext,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	struct max_des_pipe *pipe;
> +	int ret;
> +
> +	pipe =3D max_des_find_link_pipe(des, link);
> +	if (!pipe)
> +		return -ENOENT;
> +
> +	ret =3D max_des_update_pipe(priv, context, pipe, state, streams_masks);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int max_des_update_tpg(struct max_des_priv *priv,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *streams_masks)
> +{
> +	const struct max_serdes_tpg_entry *entry =3D NULL;
> +	struct max_des *des =3D priv->des;
> +	struct v4l2_subdev_route *route;
> +	int ret;
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct max_des_route_hw hw;
> +
> +		if (!(BIT_ULL(route->sink_stream) & streams_masks[route->sink_pad]))
> +			continue;
> +
> +		ret =3D max_des_route_to_hw(priv, state, route, &hw);
> +		if (ret)
> +			return ret;
> +
> +		if (!hw.is_tpg)
> +			continue;
> +
> +		entry =3D max_des_find_state_tpg_entry(des, state, route->sink_pad);
> +		break;
> +	}
> +
> +	if (entry =3D=3D des->tpg_entry)
> +		return 0;
> +
> +	ret =3D des->ops->set_tpg(des, entry);
> +	if (ret)
> +		return ret;
> +
> +	des->tpg_entry =3D entry;
> +
> +	return 0;
> +}
> +
> +static int max_des_update_active(struct max_des_priv *priv, u64 *streams=
_masks,
> +				 bool expected_active)
> +{
> +	struct max_des *des =3D priv->des;
> +	bool active =3D false;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		struct max_des_phy *phy =3D &des->phys[i];
> +		u32 pad =3D max_des_phy_to_pad(des, phy);
> +
> +		if (streams_masks[pad]) {
> +			active =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (active !=3D expected_active || des->active =3D=3D active)
> +		return 0;
> +
> +	if (des->ops->set_enable) {
> +		ret =3D des->ops->set_enable(des, active);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	des->active =3D active;
> +
> +	return 0;
> +}
> +
> +static int max_des_update_links(struct max_des_priv *priv,
> +				struct max_des_remap_context *context,
> +				struct v4l2_subdev_state *state,
> +				u64 *streams_masks)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int failed_update_link_id =3D des->ops->num_links;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		ret =3D max_des_update_link(priv, context, link, state,
> +					=C2=A0 streams_masks);
> +		if (ret) {
> +			failed_update_link_id =3D i;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	for (i =3D 0; i < failed_update_link_id; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		max_des_update_link(priv, context, link, state,
> +				=C2=A0=C2=A0=C2=A0 priv->streams_masks);
> +	}
> +
> +	return ret;
> +}
> +
> +static int max_des_enable_disable_streams(struct max_des_priv *priv,
> +					=C2=A0 struct v4l2_subdev_state *state,
> +					=C2=A0 u32 pad, u64 updated_streams_mask,
> +					=C2=A0 bool enable)
> +{
> +	struct max_des *des =3D priv->des;
> +
> +	return max_serdes_xlate_enable_disable_streams(priv->sources, 0, state,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pad, updated_streams_mask, 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des->ops->num_links, enable);
> +}
> +
> +static int max_des_update_streams(struct v4l2_subdev *sd,
> +				=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0 u32 pad, u64 updated_streams_mask, bool enable)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des_remap_context context =3D { 0 };
> +	struct max_des_mode_context mode_context =3D { 0 };
> +	struct max_des *des =3D priv->des;
> +	unsigned int num_pads =3D max_des_num_pads(des);
> +	u64 *streams_masks;
> +	int ret;
> +
> +	ret =3D max_des_populate_remap_context(priv, &context, state);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_populate_mode_context(priv, &mode_context, state, conte=
xt.mode);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_serdes_get_streams_masks(priv->dev, state, pad, updated_str=
eams_mask,
> +					=C2=A0=C2=A0 num_pads, priv->streams_masks, &streams_masks,
> +					=C2=A0=C2=A0 enable);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_set_pipes_phy(priv, &context);
> +	if (ret)
> +		goto err_free_streams_masks;
> +
> +	ret =3D max_des_set_tunnel(priv, &context);
> +	if (ret)
> +		goto err_free_streams_masks;
> +
> +	ret =3D max_des_set_modes(priv, &mode_context);
> +	if (ret)
> +		goto err_free_streams_masks;
> +
> +	ret =3D max_des_set_vc_remaps(priv, &context, state, streams_masks);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_set_pipes_stream_id(priv);
> +	if (ret)
> +		goto err_free_streams_masks;
> +
> +	if (!enable) {
> +		ret =3D max_des_enable_disable_streams(priv, state, pad,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, enable);
> +		if (ret)
> +			goto err_free_streams_masks;
> +	}
> +
> +	ret =3D max_des_update_active(priv, streams_masks, false);
> +	if (ret)
> +		goto err_revert_streams_disable;
> +
> +	ret =3D max_des_update_links(priv, &context, state, streams_masks);
> +	if (ret)
> +		goto err_revert_active_disable;
> +
> +	ret =3D max_des_update_tpg(priv, state, streams_masks);
> +	if (ret)
> +		goto err_revert_links_update;
> +
> +	ret =3D max_des_update_active(priv, streams_masks, true);
> +	if (ret)
> +		goto err_revert_tpg_update;
> +
> +	if (enable) {
> +		ret =3D max_des_enable_disable_streams(priv, state, pad,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, enable);
> +		if (ret)
> +			goto err_revert_active_enable;
> +	}
> +
> +	devm_kfree(priv->dev, priv->streams_masks);
> +	priv->streams_masks =3D streams_masks;
> +
> +	return 0;
> +
> +err_revert_active_enable:
> +	max_des_update_active(priv, priv->streams_masks, false);
> +
> +err_revert_tpg_update:
> +	max_des_update_tpg(priv, state, priv->streams_masks);
> +
> +err_revert_links_update:
> +	max_des_update_links(priv, &context, state, priv->streams_masks);
> +
> +err_revert_active_disable:
> +	max_des_update_active(priv, priv->streams_masks, true);
> +
> +err_revert_streams_disable:
> +	if (!enable)
> +		max_des_enable_disable_streams(priv, state, pad,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 updated_streams_mask, !enable)=
;
> +
> +err_free_streams_masks:
> +	devm_kfree(priv->dev, streams_masks);
> +
> +	return ret;
> +}
> +
> +static int max_des_enable_streams(struct v4l2_subdev *sd,
> +				=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0 u32 pad, u64 streams_mask)
> +{
> +	return max_des_update_streams(sd, state, pad, streams_mask, true);
> +}
> +
> +static int max_des_disable_streams(struct v4l2_subdev *sd,
> +				=C2=A0=C2=A0 struct v4l2_subdev_state *state,
> +				=C2=A0=C2=A0 u32 pad, u64 streams_mask)
> +{
> +	return max_des_update_streams(sd, state, pad, streams_mask, false);
> +}
> +
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +static int max_des_g_register(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_dbg_register *reg)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D des->ops->reg_read(des, reg->reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	reg->val =3D val;
> +	reg->size =3D 1;
> +
> +	return 0;
> +}
> +
> +static int max_des_s_register(struct v4l2_subdev *sd,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_dbg_register *reg)
> +{
> +	struct max_des_priv *priv =3D v4l2_get_subdevdata(sd);
> +	struct max_des *des =3D priv->des;
> +
> +	return des->ops->reg_write(des, reg->reg, reg->val);
> +}
> +#endif
> +
> +static const struct v4l2_subdev_core_ops max_des_core_ops =3D {
> +	.log_status =3D max_des_log_status,
> +#ifdef CONFIG_VIDEO_ADV_DEBUG
> +	.g_register =3D max_des_g_register,
> +	.s_register =3D max_des_s_register,
> +#endif
> +};
> +
> +static const struct v4l2_ctrl_ops max_des_ctrl_ops =3D {
> +	.s_ctrl =3D max_des_s_ctrl,
> +};
> +
> +static const struct v4l2_subdev_pad_ops max_des_pad_ops =3D {
> +	.enable_streams =3D max_des_enable_streams,
> +	.disable_streams =3D max_des_disable_streams,
> +
> +	.set_routing =3D max_des_set_routing,
> +	.get_frame_desc =3D max_des_get_frame_desc,
> +
> +	.get_mbus_config =3D max_des_get_mbus_config,
> +
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D max_des_set_fmt,
> +
> +	.enum_frame_interval =3D max_des_enum_frame_interval,
> +	.get_frame_interval =3D v4l2_subdev_get_frame_interval,
> +	.set_frame_interval =3D max_des_set_frame_interval,
> +};
> +
> +static const struct v4l2_subdev_ops max_des_subdev_ops =3D {
> +	.core =3D &max_des_core_ops,
> +	.pad =3D &max_des_pad_ops,
> +};
> +
> +static const struct media_entity_operations max_des_media_ops =3D {
> +	.link_validate =3D v4l2_subdev_link_validate,
> +	.get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int max_des_notify_bound(struct v4l2_async_notifier *nf,
> +				struct v4l2_subdev *subdev,
> +				struct v4l2_async_connection *base_asc)
> +{
> +	struct max_des_priv *priv =3D nf_to_priv(nf);
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +	struct max_des *des =3D priv->des;
> +	struct max_des_link *link =3D &des->links[source->index];
> +	u32 pad =3D max_des_link_to_pad(des, link);
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
> +static void max_des_notify_unbind(struct v4l2_async_notifier *nf,
> +				=C2=A0 struct v4l2_subdev *subdev,
> +				=C2=A0 struct v4l2_async_connection *base_asc)
> +{
> +	struct max_serdes_asc *asc =3D asc_to_max(base_asc);
> +	struct max_serdes_source *source =3D asc->source;
> +
> +	source->sd =3D NULL;
> +}
> +
> +static const struct v4l2_async_notifier_operations max_des_notify_ops =
=3D {
> +	.bound =3D max_des_notify_bound,
> +	.unbind =3D max_des_notify_unbind,
> +};
> +
> +static int max_des_v4l2_notifier_register(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&priv->nf, &priv->sd);
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +		struct max_serdes_source *source;
> +		struct max_serdes_asc *asc;
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		source =3D max_des_get_link_source(priv, link);
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
> +	priv->nf.ops =3D &max_des_notify_ops;
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
> +static void max_des_v4l2_notifier_unregister(struct max_des_priv *priv)
> +{
> +	v4l2_async_nf_unregister(&priv->nf);
> +	v4l2_async_nf_cleanup(&priv->nf);
> +}
> +
> +static int max_des_v4l2_register(struct max_des_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +	struct max_des *des =3D priv->des;
> +	void *data =3D i2c_get_clientdata(priv->client);
> +	unsigned int num_pads =3D max_des_num_pads(des);
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_i2c_subdev_init(sd, priv->client, &max_des_subdev_ops);
> +	i2c_set_clientdata(priv->client, data);
> +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops =3D &max_des_media_ops;
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +

Same than for serializer, please initialize some default routes
e.g 0/0 -> 1/0 for simple deserializer such as max96714, 0/0 -> 2/0, 1/0 ->=
 3/0 for dual one.

> +	for (i =3D 0; i < num_pads; i++) {
> +		if (max_des_pad_is_sink(des, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SINK;
> +		else if (max_des_pad_is_source(des, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> +		else if (max_des_pad_is_tpg(des, i))
> +			priv->pads[i].flags =3D MEDIA_PAD_FL_SINK |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MEDIA_PAD_FL_INTERNAL;
> +		else
> +			return -EINVAL;
> +	}
> +
> +	v4l2_set_subdevdata(sd, priv);
> +
> +	if (des->ops->tpg_patterns) {
> +		v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> +		priv->sd.ctrl_handler =3D &priv->ctrl_handler;
> +
> +		v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &max_des_ctrl_ops,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_TEST_PATTERN,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SERDES_TPG_PATTERN_MAX,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 ~des->ops->tpg_patterns,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 __ffs(des->ops->tpg_patterns),
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
> +	ret =3D max_des_v4l2_notifier_register(priv);
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
> +	max_des_v4l2_notifier_unregister(priv);
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err_free_ctrl:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static void max_des_v4l2_unregister(struct max_des_priv *priv)
> +{
> +	struct v4l2_subdev *sd =3D &priv->sd;
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	max_des_v4l2_notifier_unregister(priv);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +}
> +
> +static int max_des_update_pocs(struct max_des_priv *priv, bool enable)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		if (!priv->pocs[i])
> +			continue;
> +
> +		if (enable)
> +			ret =3D regulator_enable(priv->pocs[i]);
> +		else
> +			ret =3D regulator_disable(priv->pocs[i]);
> +
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to set POC supply to %u: %u\n",
> +				enable, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_parse_sink_dt_endpoint(struct max_des_priv *priv,
> +					=C2=A0 struct max_des_link *link,
> +					=C2=A0 struct max_serdes_source *source,
> +					=C2=A0 struct fwnode_handle *fwnode)
> +{
> +	struct max_des *des =3D priv->des;
> +	u32 pad =3D max_des_link_to_pad(des, link);
> +	unsigned int index =3D link->index;
> +	struct fwnode_handle *ep;
> +	char poc_name[10];
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	source->ep_fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
> +	if (!source->ep_fwnode) {
> +		dev_err(priv->dev,
> +			"Failed to get remote endpoint on port %u\n", pad);
> +		return -ENODEV;
> +	}
> +
> +	snprintf(poc_name, sizeof(poc_name), "port%u-poc", index);
> +	priv->pocs[index] =3D devm_regulator_get_optional(priv->dev, poc_name);
> +	if (IS_ERR(priv->pocs[index])) {
> +		ret =3D PTR_ERR(priv->pocs[index]);
> +		if (ret !=3D -ENODEV) {
> +			dev_err(priv->dev,
> +				"Failed to get POC supply on port %u: %d\n",
> +				index, ret);
> +			goto err_put_source_ep_fwnode;
> +		}
> +
> +		priv->pocs[index] =3D NULL;
> +	}
> +
> +	link->enabled =3D true;
> +
> +	return 0;
> +
> +err_put_source_ep_fwnode:
> +	fwnode_handle_put(source->ep_fwnode);
> +
> +	return ret;
> +}
> +
> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
> +					 struct max_des_phy *phy,
> +					 struct fwnode_handle *fwnode)
> +{
> +	struct max_des *des =3D priv->des;
> +	u32 pad =3D max_des_phy_to_pad(des, phy);
> +	struct v4l2_fwnode_endpoint v4l2_ep =3D { .bus_type =3D V4L2_MBUS_UNKNO=
WN };
> +	struct v4l2_mbus_config_mipi_csi2 *mipi =3D &v4l2_ep.bus.mipi_csi2;
> +	enum v4l2_mbus_type bus_type;
> +	struct fwnode_handle *ep;
> +	u64 link_frequency;
> +	unsigned int i;
> +	int ret;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
> +	if (!ep)
> +		return 0;
> +
> +	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &v4l2_ep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
> +		return ret;
> +	}
> +
> +	bus_type =3D v4l2_ep.bus_type;
> +	if (bus_type !=3D V4L2_MBUS_CSI2_DPHY &&
> +	=C2=A0=C2=A0=C2=A0 bus_type !=3D V4L2_MBUS_CSI2_CPHY) {
> +		v4l2_fwnode_endpoint_free(&v4l2_ep);
> +		dev_err(priv->dev, "Unsupported bus-type %u on port %u\n",
> +			pad, bus_type);
> +		return -EINVAL;
> +	}
> +
> +	if (v4l2_ep.nr_of_link_frequencies =3D=3D 0)
> +		link_frequency =3D MAX_DES_LINK_FREQUENCY_DEFAULT;
> +	else if (v4l2_ep.nr_of_link_frequencies =3D=3D 1)
> +		link_frequency =3D v4l2_ep.link_frequencies[0];
> +	else
> +		ret =3D -EINVAL;
> +
> +	v4l2_fwnode_endpoint_free(&v4l2_ep);
> +
> +	if (ret) {
> +		dev_err(priv->dev, "Invalid link frequencies %u on port %u\n",
> +			v4l2_ep.nr_of_link_frequencies, pad);
> +		return -EINVAL;
> +	}
> +
> +	if (link_frequency < MAX_DES_LINK_FREQUENCY_MIN ||
> +	=C2=A0=C2=A0=C2=A0 link_frequency > MAX_DES_LINK_FREQUENCY_MAX) {
> +		dev_err(priv->dev, "Invalid link frequency %llu on port %u\n",
> +			link_frequency, pad);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D 0; i < mipi->num_data_lanes; i++) {
> +		if (mipi->data_lanes[i] > mipi->num_data_lanes) {
> +			dev_err(priv->dev, "Invalid data lane %u on port %u\n",
> +				mipi->data_lanes[i], pad);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	phy->bus_type =3D bus_type;
> +	phy->mipi =3D *mipi;
> +	phy->link_frequency =3D link_frequency;
> +	phy->enabled =3D true;
> +
> +	return 0;
> +}
> +
> +int max_des_phy_hw_data_lanes(struct max_des *des, struct max_des_phy *p=
hy)
> +{
> +	const struct max_serdes_phys_configs *configs =3D &des->ops->phys_confi=
gs;
> +	const struct max_serdes_phys_config *config =3D
> +		&configs->configs[des->phys_config];
> +
> +	return config->lanes[phy->index];
> +}
> +EXPORT_SYMBOL_GPL(max_des_phy_hw_data_lanes);
> +
> +static int max_des_find_phys_config(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	const struct max_serdes_phys_configs *configs =3D &des->ops->phys_confi=
gs;
> +	struct max_des_phy *phy;
> +	unsigned int i, j;
> +
> +	if (!configs->num_configs)
> +		return 0;
> +
> +	for (i =3D 0; i < configs->num_configs; i++) {
> +		const struct max_serdes_phys_config *config =3D &configs->configs[i];
> +		bool matching =3D true;
> +
> +		for (j =3D 0; j < des->ops->num_phys; j++) {
> +			phy =3D &des->phys[j];
> +
> +			if (!phy->enabled)
> +				continue;
> +
> +			if (phy->mipi.num_data_lanes <=3D config->lanes[j] &&
> +			=C2=A0=C2=A0=C2=A0 phy->mipi.clock_lane =3D=3D config->clock_lane[j])
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
> +	des->phys_config =3D i;
> +
> +	return 0;
> +}
> +
> +static int max_des_parse_dt(struct max_des_priv *priv)
> +{
> +	struct fwnode_handle *fwnode =3D dev_fwnode(priv->dev);
> +	struct max_des *des =3D priv->des;
> +	struct max_des_link *link;
> +	struct max_des_pipe *pipe;
> +	struct max_des_phy *phy;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		phy =3D &des->phys[i];
> +		phy->index =3D i;
> +
> +		ret =3D max_des_parse_src_dt_endpoint(priv, phy, fwnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D max_des_find_phys_config(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Find an unsed PHY to send unampped data to. */
> +	for (i =3D 0; i < des->ops->num_phys; i++) {
> +		phy =3D &des->phys[i];
> +
> +		if (!phy->enabled) {
> +			priv->unused_phy =3D phy;
> +			break;
> +		}
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_pipes; i++) {
> +		pipe =3D &des->pipes[i];
> +		pipe->index =3D i;
> +
> +		/*
> +		 * Serializers can send data on different stream ids over the
> +		 * same link, and some deserializers support stream id autoselect
> +		 * allowing them to receive data from all stream ids.
> +		 * Deserializers that support that feature should enable it.
> +		 * Deserializers that support per-link stream ids do not need
> +		 * to assign unique stream ids to each serializer.
> +		 */
> +		if (des->ops->needs_unique_stream_id)
> +			pipe->stream_id =3D i;
> +		else
> +			pipe->stream_id =3D 0;
> +
> +		/*
> +		 * We already checked that num_pipes >=3D num_links.
> +		 * Set up pipe to receive data from the link with the same index.
> +		 * This is already the default for most chips, and some of them
> +		 * don't even support receiving pipe data from a different link.
> +		 */
> +		pipe->link_id =3D i % des->ops->num_links;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		link =3D &des->links[i];
> +		link->index =3D i;
> +	}
> +
> +	for (i =3D 0; i < des->ops->num_links; i++) {
> +		struct max_des_link *link =3D &des->links[i];
> +		struct max_serdes_source *source;
> +
> +		source =3D max_des_get_link_source(priv, link);
> +		source->index =3D i;
> +
> +		ret =3D max_des_parse_sink_dt_endpoint(priv, link, source, fwnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max_des_allocate(struct max_des_priv *priv)
> +{
> +	struct max_des *des =3D priv->des;
> +	unsigned int num_pads =3D max_des_num_pads(des);
> +
> +	des->phys =3D devm_kcalloc(priv->dev, des->ops->num_phys,
> +				 sizeof(*des->phys), GFP_KERNEL);
> +	if (!des->phys)
> +		return -ENOMEM;
> +
> +	des->pipes =3D devm_kcalloc(priv->dev, des->ops->num_pipes,
> +				=C2=A0 sizeof(*des->pipes), GFP_KERNEL);
> +	if (!des->pipes)
> +		return -ENOMEM;
> +
> +	des->links =3D devm_kcalloc(priv->dev, des->ops->num_links,
> +				=C2=A0 sizeof(*des->links), GFP_KERNEL);
> +	if (!des->links)
> +		return -ENOMEM;
> +
> +	priv->sources =3D devm_kcalloc(priv->dev, des->ops->num_links,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*priv->sources), GFP_KERNEL);
> +	if (!priv->sources)
> +		return -ENOMEM;
> +
> +	priv->pocs =3D devm_kcalloc(priv->dev, des->ops->num_links,
> +				=C2=A0 sizeof(*priv->pocs), GFP_KERNEL);
> +	if (!priv->pocs)
> +		return -ENOMEM;
> +
> +	priv->pads =3D devm_kcalloc(priv->dev, num_pads,
> +				=C2=A0 sizeof(*priv->pads), GFP_KERNEL);
> +	if (!priv->pads)
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
> +int max_des_probe(struct i2c_client *client, struct max_des *des)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct max_des_priv *priv;
> +	int ret;
> +
> +	if (des->ops->num_phys > MAX_DES_PHYS_NUM)
> +		return -E2BIG;
> +
> +	if (des->ops->num_pipes > MAX_DES_PIPES_NUM)
> +		return -E2BIG;
> +
> +	if (des->ops->num_links > des->ops->num_pipes)
> +		return -E2BIG;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (des->ops->set_link_version && !des->ops->select_links) {
> +		dev_err(dev,
> +			"Cannot implement .select_link_version() without .select_links()\n");
> +		return -EINVAL;
> +	}
> +
> +	if (hweight_long(des->ops->versions) >=3D 1 &&
> +	=C2=A0=C2=A0=C2=A0 !des->ops->set_link_version) {
> +		dev_err(dev, "Multiple version without .select_link_version()\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->client =3D client;
> +	priv->dev =3D dev;
> +	priv->des =3D des;
> +	des->priv =3D priv;
> +
> +	ret =3D max_des_allocate(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_parse_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_update_pocs(priv, true);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D max_des_i2c_adapter_init(priv);
> +	if (ret)
> +		goto err_disable_pocs;
> +
> +	ret =3D max_des_v4l2_register(priv);
> +	if (ret)
> +		goto err_i2c_adapter_deinit;
> +
> +	return 0;
> +
> +err_i2c_adapter_deinit:
> +	max_des_i2c_adapter_deinit(priv);
> +
> +err_disable_pocs:
> +	max_des_update_pocs(priv, false);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(max_des_probe);
> +
> +int max_des_remove(struct max_des *des)
> +{
> +	struct max_des_priv *priv =3D des->priv;
> +
> +	max_des_v4l2_unregister(priv);
> +
> +	max_des_i2c_adapter_deinit(priv);
> +
> +	max_des_update_pocs(priv, false);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(max_des_remove);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("I2C_ATR");
> diff --git a/drivers/media/i2c/maxim-serdes/max_des.h b/drivers/media/i2c=
/maxim-serdes/max_des.h
> new file mode 100644
> index 000000000000..6c86dd79be98
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max_des.h
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Analog Devices Inc.
> + */
> +
> +#ifndef MAX_DES_H
> +#define MAX_DES_H
> +
> +#include <media/v4l2-mediabus.h>
> +
> +#include "max_serdes.h"
> +
> +#define MAX_DES_DT_VC(dt, vc) (((vc) & 0x3) << 6 | ((dt) & 0x3f))
> +
> +struct max_des_remap {
> +	u8 from_dt;
> +	u8 from_vc;
> +	u8 to_dt;
> +	u8 to_vc;
> +	u8 phy;
> +};
> +
> +struct max_des_link {
> +	unsigned int index;
> +	bool enabled;
> +	enum max_serdes_gmsl_version version;
> +	struct max_serdes_i2c_xlate ser_xlate;
> +};
> +
> +struct max_des_pipe_mode {
> +	bool dbl8;
> +	bool dbl10;
> +	bool dbl12;
> +	bool dbl8mode;
> +	bool dbl10mode;
> +};
> +
> +struct max_des_pipe {
> +	unsigned int index;
> +	unsigned int stream_id;
> +	unsigned int link_id;
> +	unsigned int phy_id;
> +	struct max_des_remap *remaps;
> +	unsigned int num_remaps;
> +	struct max_serdes_vc_remap *vc_remaps;
> +	unsigned int num_vc_remaps;
> +	struct max_des_pipe_mode mode;
> +	bool enabled;
> +};
> +
> +struct max_des_phy_mode {
> +	bool alt_mem_map8;
> +	bool alt2_mem_map8;
> +	bool alt_mem_map10;
> +	bool alt_mem_map12;
> +};
> +
> +struct max_des_phy {
> +	unsigned int index;
> +	s64 link_frequency;
> +	struct v4l2_mbus_config_mipi_csi2 mipi;
> +	enum v4l2_mbus_type bus_type;
> +	struct max_des_phy_mode mode;
> +	bool enabled;
> +};
> +
> +struct max_des;
> +
> +struct max_des_ops {
> +	unsigned int num_phys;
> +	unsigned int num_pipes;
> +	unsigned int num_links;
> +	unsigned int num_remaps_per_pipe;
> +	unsigned int versions;
> +	unsigned int modes;
> +	bool fix_tx_ids;
> +	bool use_atr;
> +	bool needs_single_link_version;
> +	bool needs_unique_stream_id;
> +
> +	struct max_serdes_phys_configs phys_configs;
> +	struct max_serdes_tpg_entries tpg_entries;
> +	enum max_serdes_gmsl_mode tpg_mode;
> +	unsigned int tpg_patterns;
> +
> +	int (*reg_read)(struct max_des *des, unsigned int reg, unsigned int *va=
l);
> +	int (*reg_write)(struct max_des *des, unsigned int reg, unsigned int va=
l);
> +	int (*log_status)(struct max_des *des);
> +	int (*log_pipe_status)(struct max_des *des, struct max_des_pipe *pipe);
> +	int (*log_phy_status)(struct max_des *des, struct max_des_phy *phy);
> +	int (*set_enable)(struct max_des *des, bool enable);
> +	int (*set_tpg)(struct max_des *des, const struct max_serdes_tpg_entry *=
entry);
> +	int (*init)(struct max_des *des);
> +	int (*init_phy)(struct max_des *des, struct max_des_phy *phy);
> +	int (*set_phy_mode)(struct max_des *des, struct max_des_phy *phy,
> +			=C2=A0=C2=A0=C2=A0 struct max_des_phy_mode *mode);
> +	int (*set_phy_enable)(struct max_des *des, struct max_des_phy *phy,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool active);
> +	int (*set_pipe_stream_id)(struct max_des *des, struct max_des_pipe *pip=
e,
> +				=C2=A0 unsigned int stream_id);
> +	int (*set_pipe_link)(struct max_des *des, struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_link *link);
> +	int (*set_pipe_phy)(struct max_des *des, struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0 struct max_des_phy *phy);
> +	int (*set_pipe_tunnel_phy)(struct max_des *des, struct max_des_pipe *pi=
pe,
> +				=C2=A0=C2=A0 struct max_des_phy *phy);
> +	int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);
> +	int (*set_pipe_remap)(struct max_des *des, struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, struct max_des_remap *=
remap);
> +	int (*set_pipe_remaps_enable)(struct max_des *des, struct max_des_pipe =
*pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask);
> +	int (*set_pipe_vc_remap)(struct max_des *des, struct max_des_pipe *pipe=
,
> +				 unsigned int i, struct max_serdes_vc_remap *vc_remap);
> +	int (*set_pipe_vc_remaps_enable)(struct max_des *des, struct max_des_pi=
pe *pipe,
> +					 unsigned int mask);
> +	int (*set_pipe_mode)(struct max_des *des, struct max_des_pipe *pipe,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct max_des_pipe_mode *mode);
> +	int (*set_pipe_tunnel_enable)(struct max_des *des, struct max_des_pipe =
*pipe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool enable);
> +	int (*init_link)(struct max_des *des, struct max_des_link *link);
> +	int (*select_links)(struct max_des *des, unsigned int mask);
> +	int (*set_link_version)(struct max_des *des, struct max_des_link *link,
> +				enum max_serdes_gmsl_version version);
> +};
> +
> +struct max_des_priv;
> +
> +struct max_des {
> +	struct max_des_priv *priv;
> +
> +	const struct max_des_ops *ops;
> +
> +	struct max_des_phy *phys;
> +	struct max_des_pipe *pipes;
> +	struct max_des_link *links;
> +	const struct max_serdes_tpg_entry *tpg_entry;
> +	enum max_serdes_tpg_pattern tpg_pattern;
> +
> +	unsigned int phys_config;
> +	enum max_serdes_gmsl_mode mode;
> +	bool active;
> +};
> +
> +int max_des_probe(struct i2c_client *client, struct max_des *des);
> +
> +int max_des_remove(struct max_des *des);
> +
> +int max_des_phy_hw_data_lanes(struct max_des *des, struct max_des_phy *p=
hy);
> +
> +#endif // MAX_DES_H

Regards,
--=20
Julien

