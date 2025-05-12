Return-Path: <linux-gpio+bounces-20004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF37AB46D6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78081B41625
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0A5299A9F;
	Mon, 12 May 2025 21:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cPw8tsPD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n27djTRK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A04239E76;
	Mon, 12 May 2025 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087034; cv=none; b=JMx7VxP/7pRJ78OwuNzZxCfOCSxXbxXIsCShpBfeM0XNv+8aDyrjtcCtg3kjKAo5DXKkm9yb8G7csGD7zNKKzhyLLPgQHbGXNJ7FPX5lpxiItLnEBGJ/Pe+d6S0WN3gf4yJrBo/xzcCBmXNh4xyqFT4gBB+Ojdw/YYg0uuQ5C/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087034; c=relaxed/simple;
	bh=TTEjiDIx0M3k0rOBfp2JZvnY4jSXSd3HJ1fUDPc7GEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqP3AyFZHWIinkyKwfCFsQj8BKrRNr1Tl4Y+JkDpLmRP8cB5sXg86zAjtmgLO2101ETZ6R/g2kton1AOkYBE9wz40N+seT6ow2rFqA9QTxd6hK7MDRgo2hovvJSptdIyTjVWBzFmjGh+wAitKtJwejjyuVa6HqRJHQyO7iWLo8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cPw8tsPD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n27djTRK; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id DCE6A1D401EB;
	Mon, 12 May 2025 17:57:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 12 May 2025 17:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747087027;
	 x=1747094227; bh=3yt3TExMZdemejbW/an7dry873DpxH0sXY/XVImjyjc=; b=
	cPw8tsPD2enXXBDrLyMvZnelQ14bX6p9QXtAWC2BlF9EGKjR7Zn+cpNvkDIV2ZY9
	WV2aNLZ6i/xYy7QoyU/kxD1ibeFnp2OsnqGsh9aOfxHxmPKhDA8j1wJhdff4nesL
	7KD42ebF16tBFbTM1BMbOvQ7M38ERs8Mp5yXQafSc0WH+Gr6Ww4covsm/cJA4idV
	4sDQ3fF8Ftq7EUZSfWQw079KeDOVQVcPT1ykOYwVwVvRji2J5qJQxQ6bs++i8k4Z
	JjB4m+qIqZDa+MZ9iSrERnYry2gpU0n+BSVZxL/5RjKNa6sHbwPzpgmvS+f0dR/K
	acYfxVFB8CkqxKjP2KkCLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747087027; x=
	1747094227; bh=3yt3TExMZdemejbW/an7dry873DpxH0sXY/XVImjyjc=; b=n
	27djTRK+gDNbEGN2SGoPjNVdiEAIR61rvLi3Lh+HR1o61ZAyRLr8LnKsJe4ukv18
	3yk+B7uucIkiGpXvFyHwVZ6cuD2MrRn1QdjsWWDvUolTYpYQJ8KtjfS0L/h0yUBi
	Y0BuG6Srcu3q6sZMrR4kMhGcrT7cvBEvEXD+MVxpIF2xddiVBUDejogGP5BpNA1+
	bAP4CkWvPKJpr0vKuJD47spf3c2wGpQExBrR0XBygYbhfnCZySSU/HZmDduTUiyI
	YiETZ4ghhYc3bGDAyD9o69mraR08xCGmtJYfRIYcurUU70GyiEmnAy1h6yBhmMDL
	LjmAzvuxyxbsAne1bOaTg==
X-ME-Sender: <xms:sW4iaEPjTOLqb58AQIyuxeAAXUNm4yuUNAnRJuy4IzmEjgQ45pcnzg>
    <xme:sW4iaK8RpVI-zTVffxZCYxT_AU8YaWJoAD6X7NlcjJLxIQypaCq0jrqUJUedf7q5i
    cldTU7w8BSUQDR6Ir8>
X-ME-Received: <xmr:sW4iaLQZ4IRcKB9tYsENBFGnrCSvlxqv_FV28hoZJnCPPMA2rZdda88XsAdtWEq4-WDmJkO_335FwNWE3rhM3h31RcLqcQWviw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddvgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeff
    tdegfeevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgdpnhgspghrtghpthhtohepgedupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeguvghmohhnshhinhhguhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptg
    hoshhmihhnrdhtrghnihhslhgrvhesrghnrghlohhgrdgtohhmpdhrtghpthhtohepmhgt
    hhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhulhhivg
    hnrdhmrghsshhothestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegtrghtrghl
    ihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:sW4iaMsVVvkn2eII4tz6GJqrCpg0NOogXqTMGhG1HKvvgvbWBsfuZg>
    <xmx:sW4iaMdto979bVKs6UAI_DU1R_C5NJnuAwfJ3SCrt_XU7l8n9dI9pw>
    <xmx:sW4iaA0kkeaoWqxrRVCCeeHCP-kiZA9XeCS01rOaEUzAh13swIsWHg>
    <xmx:sW4iaA-ZyYaovvZ7OxhAyb3Mkr-D7cHkvyB1wwN6yseMpxs6jDc91g>
    <xmx:s24iaOjjLVWgRyYm3EFtAjkQ5mYcWyoybNlNOMlCB3rY35IScf47vprJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 17:57:04 -0400 (EDT)
Date: Mon, 12 May 2025 23:57:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 00/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <20250512215702.GA2702778@ragnatech.se>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>

Hi Cosmin,

Thanks for your work.

On 2025-05-13 00:28:09 +0300, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on:
> https://lore.kernel.org/lkml/20250507121917.2364416-1-demonsingur@gmail.com
> 
> The previous version is at:
> https://lore.kernel.org/lkml/20250309084814.3114794-1-demonsingur@gmail.com
> 
> The following deserializers are supported:
>  * MAX96712 (already exists in staging)
>  * MAX96714 (already exists)
>  * MAX96714F (already exists)
>  * MAX96714R (GMSL2)
>  * MAX96716 (GMSL2)
>  * MAX96724 (already exists as part of existing MAX96712 driver)
>  * MAX96724F (GMSL2)
>  * MAX96724R (GMSL2)
>  * MAX9296A (GMSL2)
>  * MAX96792A (GMSL3)
> 
> The following serializers are supported:
>  * MAX96717 (already exists)
>  * MAX9295A (GMSL2)
>  * MAX96793 (GMSL3)
> 
> Missing features:
>  * The current TPG implementation makes use of the V4L2_CID_TEST_PATTERN
>    V4L2 control. With V4L2 streams support added, we would like to hook
>    up TPG using the internal pad feature which has not been accepted
>    upstream yet. We decided to leave TPG out for the moment and add it
>    back after internal pads have been accepted.

I only have access to remote system using these devices, that's the 
reason the driver in staging only supports the TPG. So I can't test the 
CSI-2 side of the driver without this, but I would love to do so when 
the TPG feature works.

I make regular use of the TPG to test capture pipelines as this is my 
only video source on those systems. Please make sure the TPG is 
functioning before removing the staging driver.

> 
> Known backward compatibility breakages:
>  * No default routing. Default routing has been intentionally ommitted
>    as the devices support quite complex routing and it would be
>    unfeasible to provide sane defaults for multi-link deserialziers.
>    It is expected that userspace programs would set appropritate
>    routing. 
> 
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
>  * Full Streams API support. Most deserializers have support for more
>    than one link, and more than one PHY. Streams support allows
>    configuration of routing between these links and PHYs.
> 
>  * .get_frame_desc() support. Both the serializers and deserializers
>    implement this to query and provide frame descriptor data. This is
>    used in features explained in-depth below.
> 
>  * .get_mbus_config() support. The deserializers implement this to allow
>    upstream devices to query the link frequency of its pads.
> 
>  * Address translation with I2C ATR for the serializers.
> 
>  * I2C ATR translation - some deserializers cannot do muxing since I2C
>    communication channel masking is not available per-link, and the only
>    other way to select links is to turn them off, causing link resets.
>    For such cases, I2C ATR is used to change the address of the
>    serializers at probe time.
> 
>  * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
>    3Gbps.
> 
>  * Automatic stream id selection for deserializers which need serializers to
>    stream on unique stream ids.
> 
>  * Automatic VC remapping on the deserializers. VCs are picked so that
>    if they were unique on the sink pad, they will end up as unique on
>    the source pad they are routed to too, prioritizing using the same
>    VC ID as the sink pad, to facilitate the possibility of using tunnel
>    mode.
> 
>  * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
>    when VC IDs do not need to be changed and all hardware supports
>    tunnel mode, otherwise, pixel mode is used. The serializers are
>    automatically switched between the two by using a private API.
> 
>  * Automatic double mode selection. In pixel mode, double mode can be
>    used to pack two pixels into a single data unit, optimizing bandwidth
>    usage. The serializers are automatically set up to support the double
>    modes determined by the deserializers using a private API.
> 
>  * Automatic data padding. In pixel mode, if the data being transferred
>    uses two different BPPs, data needs to be padded. The serializers
>    automatically set this up depending on the configured double mode
>    settings and incoming data types.
> 
>  * Logging. Both the deserializers and serializers implement the V4L2
>    .log_status() ops to allow debugging of the internal state and
>    important chip status registers.
> 
>  * PHY modes. Deserializer chips commonly have more than a single PHY.
>    The firmware ports are parsed to determine the modes in which to
>    configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
>    fewer lanes).
> 
>  * Serializer pinctrl. Serializers implement pinctrl to allow setting
>    configs which would otherwise be inaccessible through GPIO: TX/RX via
>    GMSL link, pull-up & pull-down (with strength), open-drain &
>    push-pull, slew rate, RCLK pin selection.
> 
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
>  * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
>  * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
>  * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
>  * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
>  * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
>  * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219 
> 
> Analog Devices is taking responsibility for the maintenance of these
> drivers and common framework, and plans to add support for new
> broad-market chips on top of them.
> 
> Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> for testing the drivers, helping debug and coming up with ideas /
> implementations for various features.
> 
> V3:
>  * dt-bindings: drop reflow text patches
> 
>  * dt-bindings: max96717: move pinctrl configuration into main file
>  * dt-bindings: max96717: allow a single level of pins configuration
>  * dt-bindings: max96717: use regex for matching pins nodes
>  * dt-bindings: max96717: drop extra allOf in pinctrl configuration
>  * dt-bindings: max96717: fix i2c-atr channel name regex
>  * dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
>  * dt-bindings: max96717: limit pins for gpio / rclkout
>  * dt-bindings: max96717: add description for bias-pull-up/down
>  * dt-bindings: max96717: require pins and function properties
>  * dt-bindings: max96717: turn single compatible strings into an enum
> 
>  * dt-bindings: max9296a: include indices in port descriptions
>  * dt-bindings: max9296a: remove property-less schema from input ports
>  * dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX entirely
> 
>  * dt-bindings: max96712: include indices in port descriptions
>  * dt-bindings: max96712: deprecate enable-gpios in favor of powerdown-gpios
>  * dt-bindings: max96712: switch from MUX to ATR
> 
>  * dt-bindings: max96714: add support for MAX96714R
> 
>  * max_des: fix POC NULL check
>  * max_des: remove index var in POC enable
>  * max_des: fix writing empty remaps
>  * max_des: skip mode setting in tunnel mode
>  * max_des: remove a duplicate source->sd NULL check
>  * max_des: set pipe tunnel mode even for disabled links
> 
>  * max_ser: apply TX ID changes irrespective of serializer ID
> 
>  * max9296a: fix typo in BACKTOP22
>  * max9296a: make register macros more consistent
>  * max9296a: switch MAX96716 from MUX to ATR
>  * max9296a: deduplicate max9296a_phy_id() logic
>  * max9296a: use proper PHY id in remaps
>  * max9296a: fix DPLL reset clear
>  * max9296a: limit MAX96714F to GMSL2 3Gbps
>  * max9296a: add support for MAX96714R
>  * max9296a: do not write GMSL3 link select registers in GMSL2 devices
>  * max9296a: use field_prep when setting RX_RATE
>  * max9296a: simplify setting SEL_STREAM for MAX96714
>  * max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
>  * max9296a: fix off-by-one in lane polarity when using
>    polarity_on_physical_lanes
> 
>  * max96724: fix typo in BACKTOP22
>  * max96724: switch from MUX to ATR
>  * max96724: add support for powerdown GPIO
>  * max96724: remove support for tunneling from MAX96712
>  * max96724: only set tunnel-related bits when in tunnel mode
>  * max96724: add support for MAX96724F/R
>  * max96724: oneshot reset links after link selection
> 
>  * remove GMSL2 version defaults, set all supported versions explicitly
>  * reorder GMSL versions to start from 0
>  * add support for GMSL2 3Gbps
>  * support GMSL version finding for devices using MUX / GATE
>  * add support for deserializers which don't have individual control
>    of each link's GMSL version
>  * add support for deserializers that need unique stream ids across all
>    serializers
>  * select_link_version -> set_link_version
>  * select_resets_link -> use_atr
> 
> V2:
>  * add missing compatible for MAX96717F
>  * fix embarrassing dt-bindings mistakes
>  * move MAX9296A/MAX96716/MAX96792A to a separate file as they have two
>    links / PHYs, and adding those conditionally seems impossible
> 
> Cosmin Tanislav (19):
>   dt-bindings: media: i2c: max96717: add myself as maintainer
>   dt-bindings: media: i2c: max96717: add support for I2C ATR
>   dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
>   dt-bindings: media: i2c: max96717: add support for MAX9295A
>   dt-bindings: media: i2c: max96717: add support for MAX96793
>   dt-bindings: media: i2c: max96712: add myself as maintainer
>   dt-bindings: media: i2c: max96712: use pattern properties for ports
>   dt-bindings: media: i2c: max96712: add support for I2C ATR
>   dt-bindings: media: i2c: max96712: add support for POC supplies
>   dt-bindings: media: i2c: max96712: deprecate enable-gpios
>   dt-bindings: media: i2c: max96712: add support for MAX96724F/R
>   dt-bindings: media: i2c: max96714: add myself as maintainer
>   dt-bindings: media: i2c: max96714: add support for MAX96714R
>   dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
>   media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
>   arm64: defconfig: disable deprecated MAX96712 driver
>   staging: media: remove MAX96712 driver
>   media: i2c: remove MAX96717 driver
>   media: i2c: remove MAX96714 driver
> 
>  .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
>  .../bindings/media/i2c/maxim,max96712.yaml    |   80 +-
>  .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
>  .../bindings/media/i2c/maxim,max96717.yaml    |  160 +-
>  MAINTAINERS                                   |   14 +-
>  arch/arm64/configs/defconfig                  |    1 -
>  drivers/media/i2c/Kconfig                     |   34 +-
>  drivers/media/i2c/Makefile                    |    3 +-
>  drivers/media/i2c/max96714.c                  | 1024 -------
>  drivers/media/i2c/max96717.c                  | 1103 --------
>  drivers/media/i2c/maxim-serdes/Kconfig        |   53 +
>  drivers/media/i2c/maxim-serdes/Makefile       |    6 +
>  drivers/media/i2c/maxim-serdes/max9296a.c     | 1143 ++++++++
>  drivers/media/i2c/maxim-serdes/max96717.c     | 1501 ++++++++++
>  drivers/media/i2c/maxim-serdes/max96724.c     |  968 +++++++
>  drivers/media/i2c/maxim-serdes/max_des.c      | 2446 +++++++++++++++++
>  drivers/media/i2c/maxim-serdes/max_des.h      |  137 +
>  drivers/media/i2c/maxim-serdes/max_ser.c      | 1577 +++++++++++
>  drivers/media/i2c/maxim-serdes/max_ser.h      |  129 +
>  drivers/media/i2c/maxim-serdes/max_serdes.c   |  302 ++
>  drivers/media/i2c/maxim-serdes/max_serdes.h   |   89 +
>  drivers/staging/media/Kconfig                 |    2 -
>  drivers/staging/media/Makefile                |    1 -
>  drivers/staging/media/max96712/Kconfig        |   14 -
>  drivers/staging/media/max96712/Makefile       |    2 -
>  drivers/staging/media/max96712/max96712.c     |  487 ----
>  26 files changed, 8829 insertions(+), 2695 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>  delete mode 100644 drivers/media/i2c/max96714.c
>  delete mode 100644 drivers/media/i2c/max96717.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
>  create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
>  create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
>  create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
>  delete mode 100644 drivers/staging/media/max96712/Kconfig
>  delete mode 100644 drivers/staging/media/max96712/Makefile
>  delete mode 100644 drivers/staging/media/max96712/max96712.c
> 
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

