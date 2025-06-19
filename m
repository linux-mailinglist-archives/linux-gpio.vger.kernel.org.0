Return-Path: <linux-gpio+bounces-21867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC66AE0341
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 923417A1368
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605FD2264DD;
	Thu, 19 Jun 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QxoBD6F9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fNZRVtxi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536093085A3;
	Thu, 19 Jun 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331863; cv=none; b=NfjQSnrKZkwe2OrDL4rHZ9YuUsr++fNhaqi4DARNZUW87naYllVmqTbLMhQ30yJbx0p9/5s9bLTPlWc+FCc8teciM6dHgOoWS6gD8sRUmenH91WV43JTbb5NqzzvORHABj2r5ED6lN3WOk5kgAKtxwPMiqZ14sj3YrDubJofpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331863; c=relaxed/simple;
	bh=idEaRLaE+RSP54+r+HxyaDCbVp+NLBacsXNT6fb4CPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEDgPHI0HjDh8IcH32iruckA3QNrqOfxmpsN552f10p7bvrKXN8ee7i47o6BF6be8Ye3FUTE2Sum+UQ8izB95UNZNa8pnLGUaGvNgHnEA4Wu4lQmH3BP0UglqGZH0gQjdzWxpjz/IRnbgrXhixqzT+bgjejHvzHB+CZGLsVzwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QxoBD6F9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fNZRVtxi; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2D7138062F;
	Thu, 19 Jun 2025 07:17:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 19 Jun 2025 07:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750331860;
	 x=1750418260; bh=ElPYPQY0AhEUWeQHjSRbpNvkdQSFvBUnJdyvmsTl2Jw=; b=
	QxoBD6F9lhYXLFS8dh8BbJDQ9t2ZaRWjdlUYdkcZQZJKCb3o+ZHFgCuFYBMJTDG4
	ICHugXFZ+durrqdLgL2LcWaZSWvBYG+aiRMASc0jOJ9K3SqfmXZLOf/kvh4UftzZ
	DnfK4hEoq+z4pRmGynx/McZAnpLU2k9ZtFhzHOO/4o4epoUjzWgg454/QPJv/N9z
	4TkygF2tEJUxOWtwttWWJn5QbSM+Bc7fOM++0JPmImHNC4vnHV7thXxd1xTcXNYj
	LHZh7H5tXOZJzKAAs7RW1uxmV6zDwNztYQ1JU+3rICFBq/qXaD/v19hIoT19tBqS
	wSJhknxYpK3mEj3Y21723w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750331860; x=
	1750418260; bh=ElPYPQY0AhEUWeQHjSRbpNvkdQSFvBUnJdyvmsTl2Jw=; b=f
	NZRVtxioYOpyfqjzUmGtm3v8N0fIe67JK6VVdODfn+e+XB+hgpINwdsJZDvkbd5y
	P8y578MUwvhEr3H0Zy2k+7QDDf5qYaPVzyTRRvDqJ0cS+Kgw9SEgs5+lTpLANQH+
	z/X/uYK773jUpNu1sflTFiwTagGWvNitW/yyVspxdHKeGruQxANfn3sDaDFCu+Em
	O4ylUM1IKAxNawBJ2D9Yz1DelRm/miizBXxCEHsqIzNOvHrD/PmBVBIRPClRqTZC
	kddgqBdqQixQZXuU3wjByND8PPoouB2JPuR+8XOLbkPc3ebkoBdAeCDb+lBpzD8h
	aLaGTT1iffC5zQS7Eo3/A==
X-ME-Sender: <xms:0_FTaL7FfDSDc7sBj15KinQ7mwYrCtfL0mSZvtp6_YcBsHN8W4XVUg>
    <xme:0_FTaA4C58mUVgnVnEoHExCMTVRvbpBI0VnK7TIErj-lVIlhTcFDNdD2j_MrxipDi
    J-JjEkRio84-hxObB0>
X-ME-Received: <xmr:0_FTaCfMfINw9uR8yrr4wYAF63ZO-AOBNady8o0n8ePVN59t_sRL4XA2wWtUA0qNp7OarPwh_wb3xQTIAvxM_1aZ1G-ytqutoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehfeekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:0_FTaMJiZWaTFk-YJK9ay3-CFEBjRuteXGnZZr8d4D5Ah_zp8bAwMQ>
    <xmx:1PFTaPIcATMfx_p1l81YeFgmZtNgHIgpowsI4hXXieSv0Zuvy4IE8A>
    <xmx:1PFTaFxbecPjOQ5SIqjGd8JZszAPBaJ75nFWPwORTyMAI3v6l4xJvQ>
    <xmx:1PFTaLIfLrZs9WINNZZ1rTQtHbmBI0rBbMtykD8MSRAHJKYnYXDGUw>
    <xmx:1PFTaB6A6YclWYdCVuO3x2AntqqpZ2SjApFoW2IKUAt1a-_OUOXd5odF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 07:17:39 -0400 (EDT)
Date: Thu, 19 Jun 2025 13:17:37 +0200
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
Subject: Re: [PATCH v4 08/19] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Message-ID: <20250619111737.GB2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-9-demonsingur@gmail.com>

Hi Cosmin,

Thanks for your work.

On 2025-06-18 12:58:44 +0300, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index efdece2b33b9..f712d7cfc35f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -40,27 +40,15 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -    properties:
> -      port@0:
> +    patternProperties:
> +      '^port@[0-3]$':
>          $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 0
> +        description: GMSL Input ports 0-3
>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 1
> -
> -      port@2:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 2
> -
> -      port@3:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 3
> -
> -      port@4:
> +      '^port@[4-7]$':
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: CSI-2 Output
> +        description: CSI-2 Output port 0-3
>  
>          properties:
>            endpoint:
> @@ -78,8 +66,11 @@ properties:
>                - data-lanes
>                - bus-type
>  
> -    required:
> -      - port@4
> +    anyOf:
> +      - required: [port@4]
> +      - required: [port@5]
> +      - required: [port@6]
> +      - required: [port@7]
>  
>  required:
>    - compatible
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

