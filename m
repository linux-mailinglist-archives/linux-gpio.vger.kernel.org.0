Return-Path: <linux-gpio+bounces-21865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E57AE02AF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 12:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407E43AD315
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D473223302;
	Thu, 19 Jun 2025 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TJGRQL3I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KDw9h6T/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2F1E2312;
	Thu, 19 Jun 2025 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329093; cv=none; b=ArS4yO3mE0IJcCjGQx0rhYDGAcMXq/4w4QWMXFHNGiWiWglK14agleV6wYleQl8ZJpI7s9OFmLKkjqfACZGT+d88vnHND+Ad4oLLfuX0xVFKfzRrXufydhRUjOPAObfQKzWdc/yaCvk+dzX3gwVDkO+qQ84+mwD4JohQS8BXZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329093; c=relaxed/simple;
	bh=VYGJH0cgcNidgY2b5A18wUcmB0qOwAs6N639WSmFLY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8os/+mvR6XyLBW/s1Y1GdTL25AtF6mZKa1tOjzSySfl8y5ihv4eORdlnZMruEgaoEDB75X9vPY00JDssbmt43xwW02HYgDoe62Ja7mIo7KNsLZCQ2hf//uzRvlkZ9KWFj63AZ7XyloFJCyIr1o9kMbRhF73z2CPAq3hR37r5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TJGRQL3I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KDw9h6T/; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id CE3201380642;
	Thu, 19 Jun 2025 06:31:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 19 Jun 2025 06:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750329089;
	 x=1750415489; bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=
	TJGRQL3IigmqzKvAfzT0wXmFihWJZGSANSJH8RlXldFok9lQsRqVw2nO29suTFy9
	6F+wdYVjeKlY50FnK/54E6112q6g1izi0Ghmac1pbnPiOXDVqtXiTR47r6MHw97d
	0Ijlh8hRvEZJ47l9HpOHYNs3Liv9+0qQThxSi9yvA0qXt+qsUt21Y6QGcwJ7Ee7S
	EVhhh6vyN79PBfS/JhQ7RncOuO6CkRRpei3nsNHAtiwY6C0lqKVacLQD5gekmZnS
	qSu0kSAicre29/8JKBsGAEPcgeJ+l1w/S3Te8OQp3aT1T9p7c7++KXud3kdxTrot
	ovJ9MITuY1+ucOmoS3qUHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750329089; x=
	1750415489; bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=K
	Dw9h6T/hlSF8ahctV6Mcpd9PgqiLn7fFQLPB/RWJ7YTVX+t+tM332Ps7PBHhAPvP
	0PuXvoYU2HNKudQxs0iWzr+cjVgmk9eTnIOIrpDsRqaE7XWxV09hBtdSwnlvdnOx
	U4jgIl/dk+oTW5mvx0Ab7Y7H4b191er6uH20TTB2WY1X6eyA7zneIlE9Oxx2i53s
	21Evizc/s0ki7Ggb9c65QWWcoajD3bpz7FyedxNhwPPP/jU9I9RoReob+56IBfj2
	25xzLgBJotZYaPxqpLRa3UMSfxN8CboazgmZJ/mWDdTYeKYI5hvNX59w2mXwoC+c
	geM/DOBmdCw6FnjPlIGMw==
X-ME-Sender: <xms:AedTaLeW0leb5D-cJa8GpIjBR-MPvXQquummYaXnnBSAiFhOkymE2g>
    <xme:AedTaBOyvILu3SCbcMn5zHPWkslCmBygJwOsH06F5CHzesEEIoO5SCO_fDY57_WJS
    vWizvCi5Z4LZPtQUZM>
X-ME-Received: <xmr:AedTaEg8Oc06rLCnoSVR-HWbUDYbqqEJWS2dobqs2t4eeKmVHM56AE7QJk3eHdNeL-8KjoQEuIHlJSRn-xKFAbs2qBOTexWy1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhlihgvnhdrmhgrsh
    hsohhtsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrph
    hinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehgrhgv
    ghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuh
    hsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:AedTaM_GyhSJMaz8ECrJ04ALdo8cCGiQFwJAJ1FqFpVJIeyv1xl7Iw>
    <xmx:AedTaHtkDA7kZWBG14zDkTLrDJnncbi1tKt9J0CkN2RrekKpswsqRw>
    <xmx:AedTaLHm1-lAkmfYuzeHSzQrVC3VR0dHXd0K47mS1F-LXxMHUe3BdA>
    <xmx:AedTaOPQ-SUCnLA7bKcOjUg5_9eH9IF5p9ekSpitHt94pqslzhUjQg>
    <xmx:AedTaEdLHin6pIVyWVT-gbmxzf2BUMJ-lNNmZ3K-fqVeTJsLnPL78njD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 06:31:28 -0400 (EDT)
Date: Thu, 19 Jun 2025 12:31:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH v4 07/19] dt-bindings: media: i2c: max96712: add myself
 as maintainer
Message-ID: <20250619103126.GA2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-8-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-8-demonsingur@gmail.com>

Hi Cosmin,

Thanks for your patch.

On 2025-06-18 12:58:43 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 26f85151afbd..efdece2b33b9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
>  
>  maintainers:
>    - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
>  
>  description: |
>    The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01363fbcb9b3..77adb1f7ac9c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
>  
>  MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

