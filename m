Return-Path: <linux-gpio+bounces-15325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A8A271F9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687CE1615C6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D1921147F;
	Tue,  4 Feb 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="b7kI/tKT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jWWCZNAH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02A25A620;
	Tue,  4 Feb 2025 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672780; cv=none; b=j7pIUMrN3g+0nwrOh41TvHdCFfYwyPSx15NjUbep8aqHUhKjjJJ8JgHQWeU+X83KqExhspPROl6gbAKPyTSAII9SCUuoS+KpMpt/QAd2nT6Ge+8ATQqI+FLJgYWxrzMQOfthoTXnxsGfC8XX+A+4azie06xH4LTU4JuyE43h7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672780; c=relaxed/simple;
	bh=C+WW04rOkNf9/3ddJyzFOngTsJFYSfBkPZb9JcPjaO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcMRvP7zFw46Iqjouff5mNEQOF6AXuTAXQXD1sjrsp2utDW7b5hQ28OpTZWlYbhN/Ac8VEWCSaz+kHCsmjDO5FngUYaiFGdgUY8Y/qzypoBQbDaLQqhBt6FGORSrCjYs8LU4iX/bjkdTZW0RHGo9D+wmn8rYq/240/whwXl/9NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=b7kI/tKT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jWWCZNAH; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 27F75138029F;
	Tue,  4 Feb 2025 07:39:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Feb 2025 07:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738672776;
	 x=1738759176; bh=YbVXoTpDaqORN+HVxnshz48Sy0diKVLvnlQjJs9SqrU=; b=
	b7kI/tKTx/NZEI0DCACLiXHAf1LmrvyAWzkW0I4xuRubr2f+l2eiEVPjG2nqhxnQ
	99E2ipMLZfuisPpdKeqGdEcDXP3ScwGBKhbjxR3VkEQGP9HqEIhmkiEpZ8xmIGHY
	yzppI5KIF88/1yJQdrV6VRLtDTUR+uly9tti9NjaTyUnlGDk8UbfCi1XH/l27zSd
	kQeHirGo8dQslOSqlmPYx7rJbAKJc6YiNSL9neaU6tTox2oxL2PqVCpSnIBc15n5
	e1neelWGpC1k2/dqdeiNj0ULqK3CkesLEALC05nhkiurcaM2UoAo6bf4RE2NdeDQ
	7i7tOIDGurMKkdKtBau5zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738672776; x=
	1738759176; bh=YbVXoTpDaqORN+HVxnshz48Sy0diKVLvnlQjJs9SqrU=; b=j
	WWCZNAHeAGDXUTzkt00/RBGhPbFxP0gnj2GOfFJtb9WT137Dx0kcZ+q49lrtnTX+
	zFhBwLCgusNr3jBOYPCD4AR8REKBm2wd6kjumIJkdavFSqzYrSzHVSMVQlThcfDA
	QiJrc1NigdJ9VB8kQ1KvTXUlrxpu4EZOeNLF/5/TUuxQ0tCJEpnVbY1y9WeAhcP0
	M2poduWy0VcBjPKZYE1OJiTy9nqBwhAenoX6g+kJIFaDnEu1D5hglwMT8Y27W0De
	6z6eaEaDlm4yoNZ0hev6ObaV9c6fWUqpn1+PKveMyJ3LgkEd+FdI8KWm4JRq06Sq
	ROodb2sTOHwzcAOvXP6rA==
X-ME-Sender: <xms:hgqiZ-OcP1J5Th6C_6oiRLRnJmHDLpDY2_RvwtBC8fE5sWA6hNb9gg>
    <xme:hgqiZ8_aQ-8ahTh2B1b41iOp04o5KDsgS2dzJJOMRPfPcX2gxXmAGcLnxx1Imx9QW
    pjFJDzS02a4VYSrIJ4>
X-ME-Received: <xmr:hgqiZ1R8rgaHkKuOzMn01meV8pwlAL8RHnlhazvIytHAh1d1LTQFA5LAQh8BlyYcwswRD6vOLyRI4-d8l4pgARXkEy3h2t0-qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephffh
    ueeuhfdugfetvdeutdfhteekkeejtddtkeefuedtfefghfetkeehiedvfeefnecuffhomh
    grihhnpedvhedruggvvhdplhhinhhugihtvhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnug
    esrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheplhgruhhrvghnthhiuhdrphgrlhgtuhesohhsshdrnhigph
    drtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgs
    ohgrrhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrth
    hiohhnrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhho
    rdhorhhg
X-ME-Proxy: <xmx:hgqiZ-vTUVZD888UlcsSJ4m9w9Fz_wgo0UU_OGwNttKrzGmZ6cdHow>
    <xmx:hgqiZ2chJKiVamuS32oAfcmmSOxCBKhwDARcis9mMUNml6TqdoDK7A>
    <xmx:hgqiZy1fP6uFUb8PLwGfD1A0F2sr_wxnNyHkYBoL2sXlaYKvX28scg>
    <xmx:hgqiZ6-Flw_vuwSCMSm7Gxtv2RfZYA4ShGGfbIXcEqGil29Z2RJWcQ>
    <xmx:iAqiZy-xmfm8enQJwZC9ER_tNyyPFd9xXPGFafFGI83TVyWdY28qzw-m>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Feb 2025 07:39:34 -0500 (EST)
Date: Tue, 4 Feb 2025 13:39:25 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RFC 00/12] staging: media: max96712: Add support for streams
 and multiple sensors
Message-ID: <20250204123925.GA3720681@ragnatech.se>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thanks for your work. I'm happy someone with a both GMSL cameras and a 
max96712 found time to work on this driver.

On 2025-01-31 18:33:54 +0200, Laurentiu Palcu wrote:
> Hi,
> 
> This series adds more functionality to the existing max96712 staging
> driver allowing multiple sensors to be connected through other
> compatible serializers. I tried to split the changes in smaller logical
> changes to make them easier to review while not altering the existing
> VPG functionality but I could squash all of them together if needed.

With this series and it's listed dependencies applied my CI tests using 
the VPG breaks. The controls to select test-pattern seems to be invalid,

    $ yavta --set-control '0x009f0903 0' /dev/v4l-subdev6
    Device /dev/v4l-subdev6 opened.
    unable to set control 0x009f0903: Permission denied (13).
    Unable to get format: Inappropriate ioctl for device (25).

    (/dev/v4l-subdev6 here is max96712 1-0049)

    $ yavta -c10 --file=/tmp/vin-capture/isp0-checkerboard-#.bin /dev/video0
    Device /dev/video0 opened.
    Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
    Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
    8 buffers requested.
    length: 8294400 offset: 0 timestamp type/source: mono/EoF
    Buffer 0/0 mapped at address 0xffffbe5d7000.
    length: 8294400 offset: 32768 timestamp type/source: mono/EoF
    Buffer 1/0 mapped at address 0xffffbddee000.
    length: 8294400 offset: 65536 timestamp type/source: mono/EoF
    Buffer 2/0 mapped at address 0xffffbd605000.
    length: 8294400 offset: 98304 timestamp type/source: mono/EoF
    Buffer 3/0 mapped at address 0xffffbce1c000.
    length: 8294400 offset: 131072 timestamp type/source: mono/EoF
    Buffer 4/0 mapped at address 0xffffbc633000.
    length: 8294400 offset: 163840 timestamp type/source: mono/EoF
    Buffer 5/0 mapped at address 0xffffbbe4a000.
    length: 8294400 offset: 196608 timestamp type/source: mono/EoF
    Buffer 6/0 mapped at address 0xffffbb661000.
    length: 8294400 offset: 229376 timestamp type/source: mono/EoF
    Buffer 7/0 mapped at address 0xffffbae78000.
    Unable to start streaming: Invalid argument (22).

I read in patch 12/12 "The user can also switch over to testing the test 
pattern by configuring the routes accordingly", but not how to do that 
to achieve the same functionality as the staging driver. Inspecting the 
media graph gives little help. Would it be possible to extend the cover 
letter with this information?

To be clear, I don't care about the change in behavior as this driver 
obviously primary aim should be to  support GMSL2 cameras, not 
test-pattern generation. It is important for me that it is possible to 
enable the test pattern generation $somehow at runtime (i.e. no DTS 
changes). As this is the only method I have to test a bunch of boards.

It would also be nice if the patterns generated (output frames) as 
closely as possible would resembles what is generated today. That way I 
don't have to alter my CI pipelines too much :-)

> 
> The series only supports tunneling mode and uses the first MIPI-CSI
> port. Support for more functionality can be added later, if needed.
> 
> I sent the set as a RFC because it depends on Sakari's pending internal
> pads patch which is needed if we want to have an elegant solution for
> allowing the user to switch between streaming from sensors or just
> video pattern generation.
> 
> Also, the set depends on my previous series which was not yet merged:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=14255
> 
> Thanks,
> Laurentiu
> 
> Laurentiu Palcu (11):
>   dt-bindings: i2c: maxim,max96712: add a couple of new properties
>   staging: media: max96712: convert to using CCI register access helpers
>   staging: media: max96712: change DT parsing routine
>   staging: media: max96712: add link frequency V4L2 control
>   staging: media: max96712: add I2C mux support
>   staging: media: max96712: add support for streams
>   staging: media: max96712: allow enumerating MBUS codes
>   staging: media: max96712: add set_fmt routine
>   staging: media: max96712: add gpiochip functionality
>   staging: media: max96712: add fsync support
>   staging: media: max96712: allow streaming from connected sensors
> 
> Sakari Ailus (1):
>   media: mc: Add INTERNAL pad flag
> 
>  .../bindings/media/i2c/maxim,max96712.yaml    |   45 +
>  .../media/mediactl/media-types.rst            |    8 +
>  drivers/media/mc/mc-entity.c                  |   10 +-
>  drivers/staging/media/max96712/max96712.c     | 1406 +++++++++++++++--
>  include/uapi/linux/media.h                    |    1 +
>  5 files changed, 1352 insertions(+), 118 deletions(-)
> 
> -- 
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

