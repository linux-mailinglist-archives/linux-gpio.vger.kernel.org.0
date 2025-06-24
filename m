Return-Path: <linux-gpio+bounces-22074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1A1AE6B83
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 17:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53665174D95
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0E4274B40;
	Tue, 24 Jun 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPYjcGkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD6274B3E;
	Tue, 24 Jun 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779309; cv=none; b=MBjxq6PXg5Ohhkg3hYb6b9yAMuoxmxE9GX6wV8C95y/nJLWksEJzCC5KLAsyBvfeP+pvPJhcTUo/w93QtzbpdUliP6W9707HET04Jed+Yojg/YzUHcko19ekFwMkf0cXksQNO48N6aFZeW1gAhkc5LmFUBpiDFkKOR2cOAk3r0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779309; c=relaxed/simple;
	bh=1HUxxCYLFrqk9fOqAtlEf05Tsq5YZPh0/z8kiPbJoyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5wfXDmVuUyVSr/DN+k8aEe0MgbqxOYFbQSKdjLi0SiM7Bl4BDZ9aGqmo9zIfR1OJn5xxFWSn1GfjpAlGWlqoxiJYn4mpR9SJhLDQiGDKRQkJKQYNmXKiu8RH6X/9uQAhUq2sQXpZqpORebSk6LRZ+V31c7Mdg7DF0boQtzs5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPYjcGkO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade30256175so977053666b.1;
        Tue, 24 Jun 2025 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750779306; x=1751384106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjxr0DWMFDYRX+nr+frdmAXuPqrd6N6eH3MNM9mRgUs=;
        b=kPYjcGkOXh/eKPCT61EWBtdz16iVaWkJxiDbGCoBZkryC2Nn2iLJbMiZM9tS+fsD9N
         1FUDmfKLBNE6D/Etn7RjLg+Tg0FuZt9S3wx9D+BRA/KCpKpCry7qjthGGn7iK1sIkaBv
         M0gDYWoLdXdFZaBGG45jpqiXIzgKuer+YA9kdEG7qlip4BMsCeurqqxdkHXBFIYGPfha
         2Layw6ZyXnHwyswD1MeePv+meN2kOAcakSa43GATzsd/tlETKNjGBd3y2K2HxTJBhCDS
         pyEY9dDmafdTU5KU/l6n449cwhrz8Lr7brhMPdeq6RwpiS2svd2FZhmsGijmY0lFSjIC
         yxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779306; x=1751384106;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjxr0DWMFDYRX+nr+frdmAXuPqrd6N6eH3MNM9mRgUs=;
        b=cYM460B06GAVnqRhp1m+r0Ktg4QNW182LT4Rm19cW+aWCUDU3B++kVV1IP/YbZDOcc
         r+Zgvg7oMF4sagEgjeZp9dF3iBNH+yrmqDpmh0icZcAw6ACt8JNWMKwQ5k9tke4robUa
         2LA+hIp06jBnSGWMyzFCbTYrR9M7rNaLxKdn+zsrPsmEWCbWznMGBPSh6DL0QKDdeZG2
         ePZZ3vxJJLaS5HbJQxBFYYlaL5gFHat0wWGcPXIwyv/4/xRvQ3oIVeXZRnXC/s0N9GBQ
         UH92kZSoGdGVPyEr+ulub+B54MJc6o48+/9PWky0WOLgTXvQteVc4eCfaH+49IRPVnBT
         oQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR764VAECs0dK/zPZeK/xH5AcXSLkQH0Y88e0oFlV42hDYNaiQvghZNpTvl1VZeFgzYRMtN2TGHV1DGQ==@vger.kernel.org, AJvYcCVkndRsTXuIyK9ZOBD6sz27BdL8wRxtk5JtbZp8g1GdtqOjBsNtzdsVXiLFznV/Jm/OyaNCveOPm/cfXK6T@vger.kernel.org, AJvYcCVuXcKVvM2UU3cb4ngm5BDY5ZO/NMrlFERtKMkOkPcIAcHTPGN/WSPlpyFewwV3295U3xtBYOhkB01UHEw=@vger.kernel.org, AJvYcCWca8gq4q9SrOiCreU7SpQ2Z98OvQnwrB7pDpCl4hLInUJVkf4THLDQRckgPfdoaQkuh2z3lUmJpsLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjjhwxI7N247c761qqdB4tljfTBPxgACVlr7bpYTXmzaKlqTP
	Lt8GM4XRrsyU6bf8sg2wJmQbhLELL/LaghEGrviou6J4vTsZVmEGBXij
X-Gm-Gg: ASbGnct5vhTa/yolsXtibsDwnzgsOd9zQhEc7ifz3eKR5ozDVqIqaP+ybn01zU+n4M+
	tBf8QHGmYrUAR4zx/wHVf6EdBXVqOUfFeLyemeG51lgQq8iVdWghGrBH94Yw6tUz2DRg/3C/OsW
	lfgO8zMm48cRbtG4WzXnxhLYYKI+PZ/sr+u5oFFHI2f9/OI21lux02vJJhY5CGcz6OwktVfIQap
	zVAn4ogTJkHBxGAmCE8aI5Tk72OVdVljD37vfJI/FWf1gJTqK8XGJ5Gfq22/m3P6uc1i/k02UdR
	acQLFttnOSOD6RsQ4W5B9Vk5CN8DkuYoSRQzOfMUYP79qUMFXS/I/cTteBwyA9020LbV
X-Google-Smtp-Source: AGHT+IFMf6c08eRNogrQBTupf94hSj3WK35oGshLvdYZh9ALEZnOXrZJBqFGAgxlC8Ri8V449wZhGA==
X-Received: by 2002:a17:907:7f1f:b0:ae0:ba6f:35b9 with SMTP id a640c23a62f3a-ae0ba6f393dmr79982366b.28.1750779305215;
        Tue, 24 Jun 2025 08:35:05 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0540833fasm902150766b.103.2025.06.24.08.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:35:04 -0700 (PDT)
Message-ID: <42fdeee8-a23e-4499-83c6-77d50418cff2@gmail.com>
Date: Tue, 24 Jun 2025 18:34:58 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-16-demonsingur@gmail.com>
 <aFpnU8EHGt14UMHC@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aFpnU8EHGt14UMHC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/25 11:52 AM, Sakari Ailus wrote:
 > Hi Cosmin,
 >
 > Thanks for the set.
 >
 > This patch is pretty massive. Could you split it into the serialiser and
 > deserialiser frameworks and then invididual drivers using it (six-ish
 > patches in total)?
 >

I'll try to split it up for easier review, thanks.

I'll strip some of the context so I can answer easier.

The comments I stripped out are things I'll do without discussion.

...

 >> +struct max9296a_chip_info {
 >> +	unsigned int max_register;
 >> +	unsigned int versions;
 >> +	unsigned int modes;
 >> +	unsigned int num_pipes;
 >> +	unsigned int pipe_hw_ids[MAX9296A_PIPES_NUM];
 >> +	unsigned int phy_hw_ids[MAX9296A_PHYS_NUM];
 >> +	unsigned int num_phys;
 >> +	unsigned int num_links;
 >> +	struct max_phys_configs phys_configs;
 >> +	bool use_atr;
 >> +	bool has_per_link_reset;
 >> +	bool phy0_lanes_0_1_on_second_phy;
 >> +	bool polarity_on_physical_lanes;
 >> +	bool needs_single_link_version;
 >> +	bool needs_unique_stream_id;
 >> +	bool supports_cphy;
 >> +	bool supports_phy_log;
 >> +	bool adjust_rlms;
 >> +	bool fix_tx_ids;
 >> +
 >> +	enum max_gmsl_mode tpg_mode;
 >> +
 >> +	int (*set_pipe_stream_id)(struct max_des *des, struct max_des_pipe 
*pipe,
 >> +				  unsigned int stream_id);
 >> +	int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe *pipe,
 >> +			       bool enable);
 >> +	int (*set_pipe_link)(struct max_des *des, struct max_des_pipe *pipe,
 >> +			     struct max_des_link *link);
 >> +	int (*set_pipe_tunnel_phy)(struct max_des *des, struct 
max_des_pipe *pipe,
 >> +				   struct max_des_phy *phy);
 >> +	int (*set_pipe_tunnel_enable)(struct max_des *des, struct 
max_des_pipe *pipe,
 >> +				      bool enable);
 >
 > Given this many callbacks, having an operations struct for them seems
 > appropriate.
 >

Are you proposing adding another struct just to put these ops inside?

What I could do is use the existing struct max_des_ops and assign the
appropriate members in it, and then put whatever is left that's not
needed for the common framework in struct max9296a_chip_info, and add
a pointer to the struct max_des_ops instance it struct
max9296a_chip_info.

...

 >> +static int max9296a_log_phy_status(struct max_des *des,
 >> +				   struct max_des_phy *phy, const char *name)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +	unsigned int index = phy->index;
 >> +	unsigned int val;
 >> +	int ret;
 >> +
 >> +	if (!priv->info->supports_phy_log)
 >> +		return 0;
 >> +
 >> +	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
 >> +	if (ret)
 >> +		return ret;
 >> +
 >> +	pr_info("%s: \tcsi2_pkt_cnt: %lu\n", name,
 >> +		field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
 >> +
 >> +	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY20(index), &val);
 >> +	if (ret)
 >> +		return ret;
 >> +
 >> +	pr_info("%s: \tphy_pkt_cnt: %u\n", name, val);
 >
 > dev_info()?
 >

I initially used pr_info() with the subdev name passed from core
framwork to be consistent with the rest of the prints which use
v4l2_info().

I'll see how using dev_info() looks like, it would be nice if it would
match the v4l2_info() format, even though v4l2-ctl --log-status doesn't
care since all it looks for is `START STATUS`.

 >> +
 >> +	return 0;
 >> +}
 >> +
 >> +static int max9296a_set_enable(struct max_des *des, bool enable)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +
 >> +	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP12,
 >> +				  MAX9296A_BACKTOP12_CSI_OUT_EN, enable);
 >> +}
 >> +
 >> +static int max9296a_init_phy(struct max_des *des, struct 
max_des_phy *phy)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
 >> +	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
 >> +	unsigned int dpll_freq = phy->link_frequency * 2;
 >> +	unsigned int num_hw_data_lanes;
 >> +	unsigned int hw_index = max9296a_phy_id(priv, phy);
 >> +	unsigned int index = phy->index;
 >> +	unsigned int used_data_lanes = 0;
 >> +	unsigned int val;
 >
 > For register values, please use a type that explicitly specifies the 
number
 > of bits, e.g. u32.
 >

I used the type of the argument received by the regmap methods.

...

 >> +static int max9296a_reset_link(struct max9296a_priv *priv, unsigned 
int index)
 >> +{
 >> +	unsigned int reg, mask;
 >> +
 >> +	if (index == 0) {
 >> +		reg = MAX9296A_CTRL0;
 >> +		mask = MAX9296A_CTRL0_RESET_ONESHOT;
 >> +	} else {
 >> +		reg = MAX9296A_CTRL2;
 >> +		mask = MAX9296A_CTRL2_RESET_ONESHOT_B;
 >> +	}
 >
 > I might use an array for this.
 >
 > Is index guaranteed to be 0 or 1?
 >

Should be, yes, but using an array for just two indices would cause a
bit of indirection when looking at the code. If it was more I would have
used one.

 >> +
 >> +	return regmap_set_bits(priv->regmap, reg, mask);
 >> +}
 >> +
 >> +static int max9296a_init_link_rlms(struct max9296a_priv *priv,
 >> +				   struct max_des_link *link)
 >> +{
 >> +	unsigned int index = link->index;
 >> +	int ret;
 >> +
 >> +	/*
 >> +	 * These settings are described as required on datasheet page 53
 >> +	 * for MAX96714.
 >> +	 */
 >> +
 >> +	ret = regmap_write(priv->regmap, MAX9296A_RLMS3E(index), 0xfd);
 >> +	if (ret)
 >> +		return ret;
 >
 > You could also do:
 >
 > 	if (!ret)
 > 		ret = ...;
 >
 > And return ret at the end. It's one line less per call. Up to you.
 >
 >> +
 >> +	ret = regmap_write(priv->regmap, MAX9296A_RLMS3F(index), 0x3d);
 >
 > What are these magic numbers? Could we have human-readable names for 
them?
 >
 > The register names seem pretty opaque, too. Some explanation here would
 > seem reasonable.
 >

They're extracted from the datasheet of MAX96714, the values are
undocumented, but they're necessary to "optimize performance" of the
GMSL link. I'll add a comment stating the datasheet page and section.

...

 >> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c 
b/drivers/media/i2c/maxim-serdes/max_des.c
 >> new file mode 100644
 >> index 000000000000..6a45f42fe033
 >> --- /dev/null
 >> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
 >> @@ -0,0 +1,3108 @@
 >> +// SPDX-License-Identifier: GPL-2.0
 >> +/*
 >> + * Maxim GMSL2 Deserializer Driver
 >
 > How about naming the file maxim-deserialiser? I'd use e.g. "maxim_des"
 > prefix for the functions. Just "max" is quite generic.
 >

max_des seems explicit enough. The max naming comes from the common
prefix in the name of the chips, eg: MAX96724, MAX96717, not from Maxim.

If I intended it to come from maxim, I would have obviously used maxim_,
since that's what vendor-prefixes.yaml specifies.

Although they were initially made by Maxim, Analog Devices bought Maxim,
so using maxim_ would make as much sense as using adi_.

Switching to maxim_ would only lengthen the name of the functions,
types, symbols, macros, etc, and at least register/masks macros are
already extremely long.

...

 >> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
 >> +					 struct max_des_phy *phy,
 >> +					 struct fwnode_handle *fwnode)
 >> +{
 >> +	struct max_des *des = priv->des;
 >> +	u32 pad = max_des_phy_to_pad(des, phy);
 >> +	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 
V4L2_MBUS_UNKNOWN };
 >> +	struct v4l2_mbus_config_mipi_csi2 *mipi = &v4l2_ep.bus.mipi_csi2;
 >> +	enum v4l2_mbus_type bus_type;
 >> +	struct fwnode_handle *ep;
 >> +	u64 link_frequency;
 >> +	unsigned int i;
 >> +	int ret;
 >> +
 >> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
 >> +	if (!ep)
 >> +		return 0;
 >> +
 >> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &v4l2_ep);
 >> +	fwnode_handle_put(ep);
 >> +	if (ret) {
 >> +		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
 >> +		return ret;
 >> +	}
 >> +
 >> +	bus_type = v4l2_ep.bus_type;
 >> +	if (bus_type != V4L2_MBUS_CSI2_DPHY &&
 >> +	    bus_type != V4L2_MBUS_CSI2_CPHY) {
 >> +		v4l2_fwnode_endpoint_free(&v4l2_ep);
 >> +		dev_err(priv->dev, "Unsupported bus-type %u on port %u\n",
 >> +			pad, bus_type);
 >> +		return -EINVAL;
 >> +	}
 >> +
 >> +	ret = 0;
 >
 > ret is already 0 here.
 >
 >> +	if (v4l2_ep.nr_of_link_frequencies == 0)
 >> +		link_frequency = MAX_DES_LINK_FREQUENCY_DEFAULT;
 >
 > Isn't this required in DT?
 >

Required from a schema standpoint or a code standpoint?

Code:

rval = fwnode_property_count_u64(fwnode, "link-frequencies");
if (rval > 0) {
}

No rval <= 0 case.

And I don't think I made it required in the schema.

...

