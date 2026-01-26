Return-Path: <linux-gpio+bounces-31066-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJoLFeVLd2msdwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31066-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:11:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB84F8784F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5713D3012C69
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB56B3321A5;
	Mon, 26 Jan 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNAtPeSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BA238C15
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425878; cv=none; b=gqA6BMOQ7xsVdC3Qo6cgNWrIARdEVTOt6aQwQpFyc+nTP3H2bnm/9y7YcOGapbJ1PL5+1v/m1ktdIeLhaKZesOaNMZdMLWMCeAWF9USrSDqYZYOYSUzjCCDWJnBJ/21JBOme3XurcCSI2TUWt8HHJEGZraTcopvuhZHsgE9j8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425878; c=relaxed/simple;
	bh=6FB0arrczo1kAehTkyA/0p8mh0g59QVZvIExUPdL92c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u9FolSiAF/X9Qkjmkr7rUhUhhAuzSXBBX0OCyuDoK7KwFO2dcs+Pu46PJWsWI900ljn8oMGTgQXZs4kVPIJY7vMDtjQHWAckZmbfXTpC0VvQM14mC7Snfs7rUrMOa7q6AfrItMoUV/IlGSqvI7lGAVC0yxfULECPa1RnQdGkJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNAtPeSD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee2715254so22209595e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425874; x=1770030674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMfQPmWBkGs6B3W9EZ66X9JXLz5zHb4VAsfmHmE9rV8=;
        b=PNAtPeSD3LxqN+KPR4XS+dxBGmUNUhwyygSZNKB/UayMBt244cjLICKP2ES3F383Zq
         wzzgLZwwqVhlh6ihQSomOdK+QhK8quVYLCduLdG9qZ7mgta5IuS9Np3R5MTmnRBcPRhu
         laKTSrjWqax/pxLpLycvCm9ztwlYIbIWfUgbN8IsWjUBgWLN//dv2HVFNBdSI4iu9IdY
         /4mK4LGRHG3O7XcP4N8NUhIRHmLaCjRyARXihabDHSu8p3Y+jsynKXMPWAIUwmqWJCMw
         +o41JKcF8Uq5hgiUxRXPAW4QVOV//cbQTf9DYrYjuK2vLY3F9TQWYun4MgSV/YX8YFJ3
         lwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425874; x=1770030674;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMfQPmWBkGs6B3W9EZ66X9JXLz5zHb4VAsfmHmE9rV8=;
        b=q0KkLgoxvHov0vNpHuH+BJnWNEY13i4++3endm3GqFTaYyx8rGCEKM77YS9Mv9BkXK
         A6YRih2SU4LCOYVmwUp1wN3b/DQejtsYCFx6JrjTv4EjZ8MbtOQXrIvzRY8jSFcMRcH4
         eOq9DB4iN9/EGsYxNMlUo8pYkNClzQcHX2v6rzNZhSlfHl5e5BZfjfkGWRZ2TsAy4X/Z
         sU8sG+FZ5H1H7ISJvY8rxG7VysCkGScYMdm7e84P5auUpkbEIvU4xgvGZ/NMgz04B4Uh
         fme24TapaBsU3gswXR01U45f1TjJpQ70c9/IW0UBStWWghuIPuxGZnE2bhNzuz64mfSd
         Y9hw==
X-Forwarded-Encrypted: i=1; AJvYcCWLAFI08YpFRi2aklGgKAXD5lU3DGPrZHt+ye3gXmC0TIGW1WMsYbDy0xFmhaslDpbhVLuIkv9EVIda@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCfR/ASzF0crhrAsP1JE7miu2KwAYHOYucjACNXLVf0xRuYKw
	oz5XhwftG3lnV1nCW6mLFSyBLv295oSgPV9NyIk+mFImFaBhHIpbJO3G
X-Gm-Gg: AZuq6aKp0TU1GFcAryg6djzplRceScbP8kFvKEwK2qna+OgZ/16Im9e+3Duop7X5YM+
	8FqQGJFRACr7HmTg/nd+ADsG2qqq8BOYmPM+JXvWvEE48PM2wPkfshtHaRgEgPneoGkwDJqNVbQ
	2GjiIpreQtbst91PoEGNYEXCYZtHfHJcfyQfJwuAZ/1+Ez4vJatvNMfk2+AMssN5wSm84foGMnU
	GLjIkveWU5Au5Bj8qE7fu6xhSKdPdn9T1lokx1yrhqR/DI/kh9ax8f0+jfnfY8lX1qJ0GUzluPv
	h7jHV7vDMHgVXG6VQBAcI2zZxk7+USnA6PW3JIDZmxSeJyCm0/RXKnBCNZkal9drounPGMoOp8S
	+rCxcF9SvHXlJu16JprATz41bVFWrhUW9r2ZGOZQwxvXw1pTMZ3r57TjuxfqApVJ+PdwNToSves
	jFXABeZxkX7oBIyrQb21I6Sc2cdAzh
X-Received: by 2002:a05:600c:8706:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-4805ce3ffdemr71874835e9.6.1769425873482;
        Mon, 26 Jan 2026 03:11:13 -0800 (PST)
Received: from [192.168.0.100] ([188.27.128.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm29305746f8f.30.2026.01.26.03.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:11:13 -0800 (PST)
Message-ID: <edd6a420-9958-43a2-a761-bed5ec547591@gmail.com>
Date: Mon, 26 Jan 2026 13:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ceclan Dumitru <mitrutzceclan@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
 <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
 <20260126100153.GB593812@killaraus>
Content-Language: en-US
In-Reply-To: <20260126100153.GB593812@killaraus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31066-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[demonsingur@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB84F8784F
X-Rspamd-Action: no action

Hi Laurent, Sakari. As this is code written by me I can provide some
clarifications.

On 1/26/26 12:01 PM, Laurent Pinchart wrote:
> On Mon, Jan 26, 2026 at 11:55:47AM +0200, Ceclan Dumitru wrote:
>>
>>
>> On 1/20/26 3:34 PM, Sakari Ailus wrote:
>>> Hi Dumitru,
>>>
>>> On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
>>>> +	*ops = max9296a_common_ops;
>>>> +
>>>> +	ops->versions = priv->info->ops->versions;
>>>> +	ops->modes = priv->info->ops->modes;
>>>> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
>>>> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
>>>> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
>>>> +	ops->num_phys = priv->info->ops->num_phys;
>>>> +	ops->num_pipes = priv->info->ops->num_pipes;
>>>> +	ops->num_links = priv->info->ops->num_links;
>>>> +	ops->phys_configs = priv->info->ops->phys_configs;
>>>> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
>>>> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
>>>> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
>>>> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
>>>> +	ops->use_atr = priv->info->ops->use_atr;
>>>> +	ops->tpg_mode = priv->info->ops->tpg_mode;
>>>
>>> What's the reason for doing these assignments and a copy of the memory? Why
>>> not to just keep a pointer to the struct memory instead? I think there's
>>> another case of the same.

Copy of the memory is to assign the common parts of the ops, while the
assignments add the ops that need to be chip-specific on top.

>>>
>> Would this be alright:
>> #define MAX9296A_COMMON_OPS					\
>>
>> 	.num_remaps_per_pipe = 16,				\
>>
>> 	.tpg_entries = { ... },					\
>>
>> 	.init = max9296a_init,					\
>>
>> 	.set_enable = max9296a_set_enable,			\
>>
>>
>> static const struct max_des_ops max9296a_ops = {
>>
>> 	MAX9296A_COMMON_OPS,
>>
>> 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
>>
>> 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
>> 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
>> 	/* ... */
>>
>> 	};
>>
>>
>>
>> static int max9296a_probe(struct i2c_client *client)
>>
>> {
>>
>> 	/* ... */
>>
>> 	priv->des.ops = priv->info->ops;
>>
>> 	/* ... */
>>
>> }
> 
> That's still a copy. Why is a copy needed, why can't you write
> 
>   	priv->des.ops = &priv->info->ops;
>

priv->des.ops is a pointer, so is priv->info->ops, in the current code,
so this would not be a copy of the ops, just a pointer assignment.

See the struct definitions below.

struct max_des {
	struct max_des_priv *priv;

	const struct max_des_ops *ops;
	...
};


struct max9296a_chip_info {
	const struct max_des_ops *ops;
	...
};


struct max9296a_priv {
	struct max_des des;
	const struct max9296a_chip_info *info;
	...
};

> or event replace priv->des.ops with priv->info->ops through the code ?

max9296a_chip_info is the chip-specific struct for this driver, it's
retrieved using device_get_match_data().

max9296a_priv is the private driver data.

max_des is the data available for both the core framework and the
drivers implementing it.

max_des_priv is the private data of the core framework, containing
implementation details that are not really related to the chip itself
but more about how to expose the chip capabilities to the user,
eg. V4L2.

Because of this, priv->info->ops cannot be used through out the code
as priv is private to the driver, and so is info, while ops are used
in the core framework.

> Is there anything in the ops structure that needs to be modified at
> runtime ?

No, there is not. I think it would be fine for a MAX9296A_COMMON_OPS
macro be added which contains all the common ops, and then place it
as the first member of each instance of struct max_des_ops.

I'm sending some code inline as a proof-of-concept, maybe it would be
clearer how the current code will have to be changed. A similar thing
would have to be done for the other chip drivers.

Thank you for your feedback.

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2c/maxim-serdes/max9296a.c
index a67692b2f5ee0..e9d6322c302f0 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -1038,49 +1038,48 @@ static const struct max_serdes_tpg_entry max9296a_tpg_entries[] = {
 	MAX_TPG_ENTRY_1920X1080P60_RGB888,
 };
 
-static const struct max_des_ops max9296a_common_ops = {
-	.num_remaps_per_pipe = 16,
-	.tpg_entries = {
-		.num_entries = ARRAY_SIZE(max9296a_tpg_entries),
-		.entries = max9296a_tpg_entries,
-	},
-	.tpg_patterns = BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |
-			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	.reg_read = max9296a_reg_read,
+#define MAX9296A_COMMON_OPS_DEBUG					\
+	.reg_read = max9296a_reg_read,					\
 	.reg_write = max9296a_reg_write,
+#else
+#define MAX9296A_COMMON_OPS_DEBUG
 #endif
-	.log_pipe_status = max9626a_log_pipe_status,
-	.log_phy_status = max9296a_log_phy_status,
-	.set_enable = max9296a_set_enable,
-	.init = max9296a_init,
-	.init_phy = max9296a_init_phy,
-	.set_phy_mode = max9296a_set_phy_mode,
-	.set_phy_enable = max9296a_set_phy_enable,
-	.set_pipe_remap = max9296a_set_pipe_remap,
-	.set_pipe_remaps_enable = max9296a_set_pipe_remaps_enable,
-	.set_pipe_mode = max9296a_set_pipe_mode,
-	.set_tpg = max9296a_set_tpg,
-	.select_links = max9296a_select_links,
-	.set_link_version = max9296a_set_link_version,
-};
+
+#define MAX9296A_COMMON_OPS					\
+	MAX9296A_COMMON_OPS_DEBUG				\
+	.num_remaps_per_pipe = 16,				\
+	.tpg_entries = { 					\
+		.num_entries = ARRAY_SIZE(max9296a_tpg_entries),\
+		.entries = max9296a_tpg_entries,		\
+	},							\
+	.tpg_patterns = BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |\
+			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),	\
+	.log_pipe_status = max9626a_log_pipe_status,		\
+	.log_phy_status = max9296a_log_phy_status,		\
+	.set_enable = max9296a_set_enable,			\
+	.init = max9296a_init,					\
+	.init_phy = max9296a_init_phy,				\
+	.set_phy_mode = max9296a_set_phy_mode,			\
+	.set_phy_enable = max9296a_set_phy_enable,		\
+	.set_pipe_remap = max9296a_set_pipe_remap,		\
+	.set_pipe_remaps_enable = max9296a_set_pipe_remaps_enable,\
+	.set_pipe_mode = max9296a_set_pipe_mode,		\
+	.set_tpg = max9296a_set_tpg,				\
+	.select_links = max9296a_select_links,			\
+	.set_link_version = max9296a_set_link_version
 
 static int max9296a_probe(struct i2c_client *client)
 {
 	struct regmap_config i2c_regmap = max9296a_i2c_regmap;
 	struct device *dev = &client->dev;
 	struct max9296a_priv *priv;
-	struct max_des_ops *ops;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
-	if (!ops)
-		return -ENOMEM;
-
 	priv->info = device_get_match_data(dev);
 	if (!priv->info) {
 		dev_err(dev, "Failed to get match data\n");
@@ -1110,24 +1109,7 @@ static int max9296a_probe(struct i2c_client *client)
 		usleep_range(4000, 5000);
 	}
 
-	*ops = max9296a_common_ops;
-
-	ops->versions = priv->info->ops->versions;
-	ops->modes = priv->info->ops->modes;
-	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
-	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
-	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
-	ops->num_phys = priv->info->ops->num_phys;
-	ops->num_pipes = priv->info->ops->num_pipes;
-	ops->num_links = priv->info->ops->num_links;
-	ops->phys_configs = priv->info->ops->phys_configs;
-	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
-	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
-	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
-	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
-	ops->use_atr = priv->info->ops->use_atr;
-	ops->tpg_mode = priv->info->ops->tpg_mode;
-	priv->des.ops = ops;
+	priv->des.ops = priv->info->ops;
 
 	ret = max9296a_reset(priv);
 	if (ret)
@@ -1154,6 +1136,7 @@ static const struct max_serdes_phys_config max96714_phys_configs[] = {
 };
 
 static const struct max_des_ops max9296a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
@@ -1181,6 +1164,7 @@ static const struct max9296a_chip_info max9296a_info = {
 };
 
 static const struct max_des_ops max96714_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
@@ -1226,6 +1210,7 @@ static const struct max9296a_chip_info max96714_info = {
 };
 
 static const struct max_des_ops max96714f_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
 		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
@@ -1254,6 +1239,7 @@ static const struct max9296a_chip_info max96714f_info = {
 };
 
 static const struct max_des_ops max96716a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
@@ -1286,6 +1272,7 @@ static const struct max9296a_chip_info max96716a_info = {
 };
 
 static const struct max_des_ops max96792a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS) |
 		    BIT(MAX_SERDES_GMSL_3_12GBPS),


