Return-Path: <linux-gpio+bounces-22647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB38AF5B8E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 16:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D442D483B51
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 14:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B22309DDD;
	Wed,  2 Jul 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NktXbBCQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZqNGs0kO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7297307ADA;
	Wed,  2 Jul 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467715; cv=none; b=Gh5Zu4ATEPeAHkXWvUm5NRJjYR/dmjYaQ2sXaqWql4EW+mRQ78BidsVP+2zLNcSyNpbdyhnlNbTmr8ZJYQjDXn6O3CYnYSXc/gKwwuMv8BBxqDU+xms2BwB+3jUkzyk/LR3diriCqJcDpmIrl+bGyAKxH7LUBKzV5BVNmHAC1Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467715; c=relaxed/simple;
	bh=OJSky9+TnF9uuKuFfWAPA49oo+yEqXMgqp8bXPVKQwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKKfTOuczTSjqMvXwaWzXKlsY4fu1ax5+vrgduyyWL97J4PoiumMGOA11GVyLtlaWLTWh8DPKQ2D+R1yC/GCSvkcQxftUqmc/YYiYNM75NB8QQtX3f1N8GXCVwJhzMaoxBjQY4v+TkNcU9UM3vkZhOoUU5T4koXxgexE4teufSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NktXbBCQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZqNGs0kO; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B14027A021F;
	Wed,  2 Jul 2025 10:48:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 02 Jul 2025 10:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751467712;
	 x=1751554112; bh=JSJYrNhgOhppZDmysPyu0LnxuGVuTI+omogB4HqJOVc=; b=
	NktXbBCQByuFoajc90Lz1m3A1h+qLS7ZwtyC6gzEBsdbXOyK2zDpYraaSHu7rutR
	827B+6NKnNsbW89Cu0OgwGi0KEA7ksLCNf9S6h1R1yeiW73FFnciMXR5D49NWM9H
	CoWo/FfQxFdxmx8JnJHF2DC7HhBqfwKezE7MdwMZ2ecGgkOVf0vF0fn2A36VrMGQ
	GpFLY++jDNQaG4oFBXo+Q+Ujc3JdQ+3r2ga/XNWmZ9QhOUGt+aObEe7WyTp9VxOz
	4U/YENf24uLFoW2boqRRgSz+tl5oLNkJc+GUouTmbu2Izqcksz079AmBYpFqNS48
	Zc1sc0Rz9WZGIMgpS2A3aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751467712; x=
	1751554112; bh=JSJYrNhgOhppZDmysPyu0LnxuGVuTI+omogB4HqJOVc=; b=Z
	qNGs0kOX1IHcxh7vMz1eqLsB6yhG2SOG7kVPEOYTKHJdmKoTV4u7On/0qObG+c8o
	9GJoJo+Ca6xu1rnrcWWQO5sI4cDbC49q2HUjH3b8MKGcFHVjF2IH2w/kFcvTOU9W
	IUfAzKrNC5Yy+Op+vtIxYo2efBqolTWyWu6gciQ4yOfn5v9iZ+WJL+AP3FqFjP+g
	GJFUx+0Ak0YIDTofYNLc2tS48sVKBvBpMS+Ae6qfQzeQPf4ePokmaPC7Q5MWNYoe
	KUQETEYfxRtLwInJFltZiy1y0Rxd+zBrtLnHJ259B5WLZYvMwAYHZV3URKt2DK2o
	kBvvND96oj2UxffEqLFQw==
X-ME-Sender: <xms:wEZlaKB5dT21vap6UcE6raQn-bA7W3s7rX6jAsLYFDS5XBNigTVDeQ>
    <xme:wEZlaEilwN26rmoCxOMaI198S34UM7ZsetjSGbHvPIN9FtqZ6vUIJlGAiiZkGMt84
    oO6QheP2mp52sQkVzM>
X-ME-Received: <xmr:wEZlaNlnRUXGAn52zK-25djw86qOreo789JU8OTD-96S6MUq0EcSlQMM-xgy30cptuQnuhSLqnrYMNq4i6lHC6wNLINU1Lvz0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopeguvghmohhnshhinhhguhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    tghoshhmihhnrdhtrghnihhslhgrvhesrghnrghlohhgrdgtohhmpdhrtghpthhtohepth
    homhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhulhhivghnrdhmrghs
    shhothestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilh
    husheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepghhrvg
    hgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:wEZlaIyZyQiQZkqckgp3ruj70dNn1_pYhleQAoCWwA-NNX2WUjbqcQ>
    <xmx:wEZlaPTsHQ-T2nPzTfUU_Mon87pYTd57mzQsDLmHHk80LT5gm5xnpQ>
    <xmx:wEZlaDa4d9zA3f7HeaOgn1h7VeZA8P7c1lVq_7DrCtuq90SNF-Y9bg>
    <xmx:wEZlaISE34Y3nX3ENQBmX1yuz3pYTGpWGc2sffmZrsS3jTkXhnmA5g>
    <xmx:wEZlaGANUj28khHrizasaaSNc9LBrBmioGRvwoW6uNnYZTZ_Ge2lKFzG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 10:48:31 -0400 (EDT)
Date: Wed, 2 Jul 2025 16:48:30 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 21/24] arm64: defconfig: disable deprecated MAX96712
 driver
Message-ID: <20250702144830.GC3830050@ragnatech.se>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-22-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702132104.1537926-22-demonsingur@gmail.com>

HI Cosmin,

Thanks for your work.

On 2025-07-02 16:20:47 +0300, Cosmin Tanislav wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a9..6f4254f562da 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

I wonder, should this not be replaced with the new symbol 
CONFIG_VIDEO_MAX96724?

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y
> -- 
> 2.50.0
> 

-- 
Kind Regards,
Niklas Söderlund

