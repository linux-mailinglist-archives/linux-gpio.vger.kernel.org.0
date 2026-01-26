Return-Path: <linux-gpio+bounces-31056-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJM5NnQ6d2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31056-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:57:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF4864A7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3884302304B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 09:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D92932E151;
	Mon, 26 Jan 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGEzj6Sh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115432D7F9
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421353; cv=none; b=uDYXoLZieoZRrpWil5nVdtudQCPt9oqIUCMR61J2PnrW8rYOCDG9lqPKHOnMUEbOrEjr2kWwPG3IZxGLY5msPBJK4bpYLDqrtE1tBBVOXQz1vOfMgDgjJpr87GC0v9ireO9MVp36ROARY2QZg2L0ux7CQEMzHGbX1O1jc88JKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421353; c=relaxed/simple;
	bh=jwk9yBux6+536fldnVhhGFBsCSDNKxtCSJzdLGo7hTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR4Dz6LuYad6TPvxJj99SpCADN1oFUTyFC6c7mdhIHyfAvVG6sAeT01Xif6s+vtNmcmTHUYTHeCIUym4QJg4hiSNF1uEpBypnerZzMQHin5ZeVzLBCL82hfcDRM2vLq/jeeLZJqR0Qp1FLs1QCPOb3ZsrRJtcciZa5tFsinXXOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGEzj6Sh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee2715254so21739615e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421350; x=1770026150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=bGEzj6ShO2vlMGpWhlsDs2UcxIAJKZoaC4CN9O1L/foW5Ss3ZkZCsDHQy7yD78i1Fs
         Xb7st0edPF+6tiJau0vPp1k8dKSGjrkHxgf/t6f2D13oq8KwN/9cgQVOX2/MIyNnP+wE
         0WHv8vAmCw/kt1bp+yY06ExeTjs4rQe/9QGZqNXazhw7aXvu5AxIYl2PJPtjMN1RsSVe
         iJzFVaUm75k/ERLrb91lrKEZ7BF2ITrayyZkrlP7PeO6pk6Un20TY4pNZvTyYUXI+DL6
         oU/AO0dNQro4mtZ91s5mPOX7W6OGA4RglTv4FIiEFr0KEPvVyJgTFZhqmhF2oxBk6iNv
         ZgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421350; x=1770026150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=FCz0RZ0QaTg1P8j9wavRaHttkfVpbha+KOXLnIZ9HwCtZsg2Fr71gyW7DeUy6VjQD+
         31+XlwI2KLesKepduYhGX8wvFnAXN2okyJpElpoJg/nyGlnzUkAFiuOuu8+A4xFVaVGx
         ApLYkXcN+dD6tVUYRMtAgMnMciNqhxhnAhNE6+3eE8aHaN0HvyBts7qitxX3lyKwT2Ev
         a/wbndfGkCAJJJkZ9WInLZdC7aZoByjVK+XlkK1F7FFonzU/J7l9NC7jWTfVuySVy142
         PA2lmtRA373CKMb/DYBeJtoLDT11Ra3pf4sUZgwFu6rSoS7LScbY4uyXXaGGKT+RgcXn
         qPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVARdsfxvlDD+UqjvvgdtsVbx/z4PhrnvFSgnZ3EYSA/hnhFQOtKSpwGIVjmGiZwADmlnXYXOYd1UAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIsXNdecK7aW3079/ZczrMwZFxgjaExPCx2SMl5DyvQDLXv6YW
	7qN13Mzam37HYShBTy/oRRULkf2RY9TX3e6m7AC7SilO8YPHZoohmKvl
X-Gm-Gg: AZuq6aInBF40/kJIz2V9BNFvsKQTWCOLqCMPWfk2/FHwLAHYLpqJ/5Jp95dgZbKckPO
	bfpth12+lB9p08ZisRDq5j6gv3s5tNm2HzqRE+wOgpABMeD4eDaACZHmot72qgl/jWYp7juAHLE
	4ESG5c4OZV6Rkl9+rQ/N3bicHGa5W8kc32GiOuppfJziTRhMtSm1Y8Sc/zLh5C/AccwmJyOMlUG
	jRjDISRa1eywInv4LlNqnU/j+lTv1EIeQtjXOgqLeigJsj+x5HQf+m65jgWc8IKe8tQ97tQOBTo
	tMp58Ly2NvIxNREzlD17qr2Vxx/pDKdpsg4pihTF/3loRCmpdxP1kCloKoMX1agUgS9sxQTRdxb
	eK5YOJ7Ll2Cen4jeQsK9R0UoTe8twD/IErQXUzlbskBIFDwi8TkvHM7Jxot0gSnALUYyFEoYfjR
	E2vUCG1Fvql2A7FKFxHpc7fvW6Oiuysg2PA1cxsg716846+BZU
X-Received: by 2002:a05:600c:314f:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-4805cf669b2mr55811755e9.18.1769421349631;
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74942sm27922186f8f.36.2026.01.26.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Message-ID: <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
Date: Mon, 26 Jan 2026 11:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-staging@lists.linux.dev, Cosmin Tanislav <demonsingur@gmail.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31056-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitrutzceclan@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78FF4864A7
X-Rspamd-Action: no action



On 1/20/26 3:34 PM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
>> +	*ops = max9296a_common_ops;
>> +
>> +	ops->versions = priv->info->ops->versions;
>> +	ops->modes = priv->info->ops->modes;
>> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
>> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
>> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
>> +	ops->num_phys = priv->info->ops->num_phys;
>> +	ops->num_pipes = priv->info->ops->num_pipes;
>> +	ops->num_links = priv->info->ops->num_links;
>> +	ops->phys_configs = priv->info->ops->phys_configs;
>> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
>> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
>> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
>> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
>> +	ops->use_atr = priv->info->ops->use_atr;
>> +	ops->tpg_mode = priv->info->ops->tpg_mode;
> 
> What's the reason for doing these assignments and a copy of the memory? Why
> not to just keep a pointer to the struct memory instead? I think there's
> another case of the same.
> 
Would this be alright:
#define MAX9296A_COMMON_OPS					\

	.num_remaps_per_pipe = 16,				\

	.tpg_entries = { ... },					\

	.init = max9296a_init,					\

	.set_enable = max9296a_set_enable,			\


static const struct max_des_ops max9296a_ops = {

	MAX9296A_COMMON_OPS,

	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |

		    BIT(MAX_SERDES_GMSL_2_6GBPS),
	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
	/* ... */

	};



static int max9296a_probe(struct i2c_client *client)

{

	/* ... */

	priv->des.ops = priv->info->ops;

	/* ... */

}

