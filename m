Return-Path: <linux-gpio+bounces-22380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947FAECA04
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 21:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619FC177608
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 19:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE6126B94E;
	Sat, 28 Jun 2025 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA8kP2O+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA71D5147;
	Sat, 28 Jun 2025 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138647; cv=none; b=J1auYYvqZGXWmaZlfK6v9+x+1ZN+A/CvMb1QwC5mqoHeyGyo7sa+OfH+TkhD6WWerU1OTJ5d0ciMckrZYwecu4iI3ySjPnffElLhhvegZCkx65qeEKOxL4aVvYU4ulvjxi6Ni1+ekq3NM6uwza/cv8X6o5muVmjJ1qQpu6/4gQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138647; c=relaxed/simple;
	bh=Ro0FlmLrWinNnokFyHfNdQ0lgtJM4CNJNMoTbYRCWyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8DlyLcrNxqeKjF1TbeeshP2NSBw+ECO+MO6j8i70RXA+4DlU7+L2J2D2LXUyTGPz/CeI1J0rHA/0wzk/EwPoYIN7Xk5XAclgxs+Iecj8hEWJMDCW7dBu3OquRH8YqNNzX0DrIuBNuMMk5TpTzQ09KAPIDFf2XzCBIU3oVMhLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA8kP2O+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751138645; x=1782674645;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ro0FlmLrWinNnokFyHfNdQ0lgtJM4CNJNMoTbYRCWyU=;
  b=JA8kP2O+zLivpfqdTYgZwqhRxTVoOYK2kPrbiySQr2m6D++dfEtjJbtI
   v44ieVRAuul4m3t3X54gj0un3CzUvJwNOw6dqRC787nBtwQqW75os3+XQ
   P7+gV2k7mhmp6paMeMNuYOZlzE1tIdfVv3fKZdXexA0ZHsHd3N+AGmXxX
   B6EuAmIImtno5y/HL/110hYR/XTiS4Ty3aV4j7AA4T21H3sSdU0VknVkY
   9AlJZx8vgpJ4v367ifhQnP74adZKDUq6M1FCgx9dcndhGLw+1Ak7SYbMW
   QGiQVP/r2i2G0wpi3vKz6oqMO+eT20/oTb8b4xoXe+cUQGM2q4oEuRDZd
   A==;
X-CSE-ConnectionGUID: EJyQ+K42ThixT0Fq0RJ6NA==
X-CSE-MsgGUID: b6cSQiA9SzyJiXepkllyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64769805"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64769805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:24:04 -0700
X-CSE-ConnectionGUID: jXePO38bT0CHGprmdchIyw==
X-CSE-MsgGUID: JQD1j8FrRjiEqykhhgA7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153792123"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:24:00 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 9683E4435F;
	Sat, 28 Jun 2025 22:23:57 +0300 (EEST)
Message-ID: <66fd382c-6c6f-4d45-ad36-6308cea3e47f@linux.intel.com>
Date: Sat, 28 Jun 2025 21:10:47 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Content-Language: en-US
To: Cosmin Tanislav <demonsingur@gmail.com>
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
 <42fdeee8-a23e-4499-83c6-77d50418cff2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <42fdeee8-a23e-4499-83c6-77d50418cff2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cosmin,

On 6/24/25 18:34, Cosmin Tanislav wrote:
> On 6/24/25 11:52 AM, Sakari Ailus wrote:
>  >> +struct max9296a_chip_info {
>  >> +    unsigned int max_register;
>  >> +    unsigned int versions;
>  >> +    unsigned int modes;
>  >> +    unsigned int num_pipes;
>  >> +    unsigned int pipe_hw_ids[MAX9296A_PIPES_NUM];
>  >> +    unsigned int phy_hw_ids[MAX9296A_PHYS_NUM];
>  >> +    unsigned int num_phys;
>  >> +    unsigned int num_links;
>  >> +    struct max_phys_configs phys_configs;
>  >> +    bool use_atr;
>  >> +    bool has_per_link_reset;
>  >> +    bool phy0_lanes_0_1_on_second_phy;
>  >> +    bool polarity_on_physical_lanes;
>  >> +    bool needs_single_link_version;
>  >> +    bool needs_unique_stream_id;
>  >> +    bool supports_cphy;
>  >> +    bool supports_phy_log;
>  >> +    bool adjust_rlms;
>  >> +    bool fix_tx_ids;
>  >> +
>  >> +    enum max_gmsl_mode tpg_mode;
>  >> +
>  >> +    int (*set_pipe_stream_id)(struct max_des *des, struct 
> max_des_pipe *pipe,
>  >> +                  unsigned int stream_id);
>  >> +    int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe 
> *pipe,
>  >> +                   bool enable);
>  >> +    int (*set_pipe_link)(struct max_des *des, struct max_des_pipe 
> *pipe,
>  >> +                 struct max_des_link *link);
>  >> +    int (*set_pipe_tunnel_phy)(struct max_des *des, struct 
> max_des_pipe *pipe,
>  >> +                   struct max_des_phy *phy);
>  >> +    int (*set_pipe_tunnel_enable)(struct max_des *des, struct 
> max_des_pipe *pipe,
>  >> +                      bool enable);
>  >
>  > Given this many callbacks, having an operations struct for them seems
>  > appropriate.
>  >
> 
> Are you proposing adding another struct just to put these ops inside?
> 
> What I could do is use the existing struct max_des_ops and assign the
> appropriate members in it, and then put whatever is left that's not
> needed for the common framework in struct max9296a_chip_info, and add
> a pointer to the struct max_des_ops instance it struct
> max9296a_chip_info.

Ah, I missed this wasn't specific to a device. Please ignore the comment.

...

>  >> +static int max9296a_log_phy_status(struct max_des *des,
>  >> +                   struct max_des_phy *phy, const char *name)
>  >> +{
>  >> +    struct max9296a_priv *priv = des_to_priv(des);
>  >> +    unsigned int index = phy->index;
>  >> +    unsigned int val;
>  >> +    int ret;
>  >> +
>  >> +    if (!priv->info->supports_phy_log)
>  >> +        return 0;
>  >> +
>  >> +    ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
>  >> +    if (ret)
>  >> +        return ret;
>  >> +
>  >> +    pr_info("%s: \tcsi2_pkt_cnt: %lu\n", name,
>  >> +        field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
>  >> +
>  >> +    ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY20(index), &val);
>  >> +    if (ret)
>  >> +        return ret;
>  >> +
>  >> +    pr_info("%s: \tphy_pkt_cnt: %u\n", name, val);
>  >
>  > dev_info()?
>  >
> 
> I initially used pr_info() with the subdev name passed from core
> framwork to be consistent with the rest of the prints which use
> v4l2_info().
> 
> I'll see how using dev_info() looks like, it would be nice if it would
> match the v4l2_info() format, even though v4l2-ctl --log-status doesn't
> care since all it looks for is `START STATUS`.

Ok. Up to you.

...

>  >> +static int max9296a_init_phy(struct max_des *des, struct 
> max_des_phy *phy)
>  >> +{
>  >> +    struct max9296a_priv *priv = des_to_priv(des);
>  >> +    bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
>  >> +    unsigned int num_data_lanes = phy->mipi.num_data_lanes;
>  >> +    unsigned int dpll_freq = phy->link_frequency * 2;
>  >> +    unsigned int num_hw_data_lanes;
>  >> +    unsigned int hw_index = max9296a_phy_id(priv, phy);
>  >> +    unsigned int index = phy->index;
>  >> +    unsigned int used_data_lanes = 0;
>  >> +    unsigned int val;
>  >
>  > For register values, please use a type that explicitly specifies the 
> number
>  > of bits, e.g. u32.
>  >
> 
> I used the type of the argument received by the regmap methods.

Ack.

> 
> ...
> 
>  >> +static int max9296a_reset_link(struct max9296a_priv *priv, unsigned 
> int index)
>  >> +{
>  >> +    unsigned int reg, mask;
>  >> +
>  >> +    if (index == 0) {
>  >> +        reg = MAX9296A_CTRL0;
>  >> +        mask = MAX9296A_CTRL0_RESET_ONESHOT;
>  >> +    } else {
>  >> +        reg = MAX9296A_CTRL2;
>  >> +        mask = MAX9296A_CTRL2_RESET_ONESHOT_B;
>  >> +    }
>  >
>  > I might use an array for this.
>  >
>  > Is index guaranteed to be 0 or 1?
>  >
> 
> Should be, yes, but using an array for just two indices would cause a
> bit of indirection when looking at the code. If it was more I would have
> used one.

Ack.

> 
>  >> +
>  >> +    return regmap_set_bits(priv->regmap, reg, mask);
>  >> +}
>  >> +
>  >> +static int max9296a_init_link_rlms(struct max9296a_priv *priv,
>  >> +                   struct max_des_link *link)
>  >> +{
>  >> +    unsigned int index = link->index;
>  >> +    int ret;
>  >> +
>  >> +    /*
>  >> +     * These settings are described as required on datasheet page 53
>  >> +     * for MAX96714.
>  >> +     */
>  >> +
>  >> +    ret = regmap_write(priv->regmap, MAX9296A_RLMS3E(index), 0xfd);
>  >> +    if (ret)
>  >> +        return ret;
>  >
>  > You could also do:
>  >
>  >     if (!ret)
>  >         ret = ...;
>  >
>  > And return ret at the end. It's one line less per call. Up to you.
>  >
>  >> +
>  >> +    ret = regmap_write(priv->regmap, MAX9296A_RLMS3F(index), 0x3d);
>  >
>  > What are these magic numbers? Could we have human-readable names for 
> them?
>  >
>  > The register names seem pretty opaque, too. Some explanation here would
>  > seem reasonable.
>  >
> 
> They're extracted from the datasheet of MAX96714, the values are
> undocumented, but they're necessary to "optimize performance" of the
> GMSL link. I'll add a comment stating the datasheet page and section.

Ack, sounds good.

> 
> ...
> 
>  >> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/ 
> media/i2c/maxim-serdes/max_des.c
>  >> new file mode 100644
>  >> index 000000000000..6a45f42fe033
>  >> --- /dev/null
>  >> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
>  >> @@ -0,0 +1,3108 @@
>  >> +// SPDX-License-Identifier: GPL-2.0
>  >> +/*
>  >> + * Maxim GMSL2 Deserializer Driver
>  >
>  > How about naming the file maxim-deserialiser? I'd use e.g. "maxim_des"
>  > prefix for the functions. Just "max" is quite generic.
>  >
> 
> max_des seems explicit enough. The max naming comes from the common
> prefix in the name of the chips, eg: MAX96724, MAX96717, not from Maxim.

Yeah, the prefix Maxim uses for their chips is a bit unfortunate in 
naming context. I guess it's ok as it's not part of the UAPI.

> 
> If I intended it to come from maxim, I would have obviously used maxim_,
> since that's what vendor-prefixes.yaml specifies.
> 
> Although they were initially made by Maxim, Analog Devices bought Maxim,
> so using maxim_ would make as much sense as using adi_.
> 
> Switching to maxim_ would only lengthen the name of the functions,
> types, symbols, macros, etc, and at least register/masks macros are
> already extremely long.
> 
> ...
> 
>  >> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
>  >> +                     struct max_des_phy *phy,
>  >> +                     struct fwnode_handle *fwnode)
>  >> +{
>  >> +    struct max_des *des = priv->des;
>  >> +    u32 pad = max_des_phy_to_pad(des, phy);
>  >> +    struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 
> V4L2_MBUS_UNKNOWN };
>  >> +    struct v4l2_mbus_config_mipi_csi2 *mipi = &v4l2_ep.bus.mipi_csi2;
>  >> +    enum v4l2_mbus_type bus_type;
>  >> +    struct fwnode_handle *ep;
>  >> +    u64 link_frequency;
>  >> +    unsigned int i;
>  >> +    int ret;
>  >> +
>  >> +    ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
>  >> +    if (!ep)
>  >> +        return 0;
>  >> +
>  >> +    ret = v4l2_fwnode_endpoint_alloc_parse(ep, &v4l2_ep);
>  >> +    fwnode_handle_put(ep);
>  >> +    if (ret) {
>  >> +        dev_err(priv->dev, "Could not parse endpoint on port %u\n", 
> pad);
>  >> +        return ret;
>  >> +    }
>  >> +
>  >> +    bus_type = v4l2_ep.bus_type;
>  >> +    if (bus_type != V4L2_MBUS_CSI2_DPHY &&
>  >> +        bus_type != V4L2_MBUS_CSI2_CPHY) {
>  >> +        v4l2_fwnode_endpoint_free(&v4l2_ep);
>  >> +        dev_err(priv->dev, "Unsupported bus-type %u on port %u\n",
>  >> +            pad, bus_type);
>  >> +        return -EINVAL;
>  >> +    }
>  >> +
>  >> +    ret = 0;
>  >
>  > ret is already 0 here.
>  >
>  >> +    if (v4l2_ep.nr_of_link_frequencies == 0)
>  >> +        link_frequency = MAX_DES_LINK_FREQUENCY_DEFAULT;
>  >
>  > Isn't this required in DT?
>  >
> 
> Required from a schema standpoint or a code standpoint?
> 
> Code:
> 
> rval = fwnode_property_count_u64(fwnode, "link-frequencies");
> if (rval > 0) {
> }
> 
> No rval <= 0 case.
> 
> And I don't think I made it required in the schema.

I'd do that. The device requires this configuration to operate anyway. 
Also the concern of EMI may be lesser in environments serdes devices are 
used but I wouldn't say it's not there.

-- 
Regards,

Sakari Ailus


