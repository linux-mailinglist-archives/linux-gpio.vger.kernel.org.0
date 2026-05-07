Return-Path: <linux-gpio+bounces-36367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBISMYB+/GnXQgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 13:58:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865D4E7DE0
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 13:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B82E3017C3B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F163D812C;
	Thu,  7 May 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b="DzJSxsSN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E73E92A7
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154634; cv=pass; b=cgP24nIpy3wGE6hdv+lK6a56CqY2sYTKOwU/Nu7KOv2yoUy1JyjanFjVnh2se6fvkRE+exomWGiY0f5wXl+n2+bg4M001vrBtkGnxQAtMv1kR037OEMlFGtonra5WQGADV3a6DS+oSODf2YokViwGV5kCz3W+t5oi4xcnLOtJNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154634; c=relaxed/simple;
	bh=hJUpkJFy4pFgHUpAc4l5g4rVqSQXJgujCikzsRw1LI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UL/jHQuDIadQm1vB0WjWqscHGDfOXawVo2jvBbLMFZYPZ7FyyeAL0w6rao05SXyOE2DtA6LoJHR+U+20++AqHTYgSoOymNtx0zLBQ1HOY8sqeY+PAr46AlGLXBMFT1DEcnp1r1jXarnwFYQXzQSfLj5gPNxbJXWYVUHsSm70PKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b=DzJSxsSN; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba21d32776so5076295ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 04:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154632; cv=none;
        d=google.com; s=arc-20240605;
        b=KpQd1rwB+K0uxj5H0x6UKeIYsVixd98KNcxHew5/Y4+mXJr4xPq8OHYsGlG0lXUCWT
         rXPr9Fot6AJMXoZJOai0I7WYQ2Zx8saduQPqU/Qf9wsKKb56wRdO9pIewM53KdS9lDqD
         tJma3SNOwxWM/iuwEtwIS11BIBDmy05kIrtFjWPV0yl+SzvEhwxqw00wlNbgrinF5iqc
         6zUVPQW8eSiuK7wn9iWLVNX3+9kHRcs4ubUdF91HDxeDcnTkGXbJQD30Gcd8ByblbJ9o
         rjaDUQV6VSMxgkG3KjCSkYopZQe+tlMmfXUup4p5aZ2G2zd6SwVsjeQ7oeHNC8ZAcDjt
         QgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        fh=eAoRKC1g7IuygiKn0VlXFKKvaqA9Usei7Nz3+Y8dSMs=;
        b=WaCRr+2YetYMLhYOt4bZsv13+qw2MJKENOpEyecRJoYJUEQs2k+ryvHaYMNLUGU7F+
         5ujuHmgf0MsiL0d0D+RJZxqAuafWa1C7Xeg46gWx1jrinEbv8tXWe2m0F8dQVqiHzw1g
         1LH6uP3NSvQ+BQyeTbmgJmrO6L7ud8Ek4wfaUFlPlhLzOECKM7OTc9oma7Ws2WvLzTFr
         qyvxRsTxQXLBDEb0FHUuV64Z+kRQKWa5ZGgcS5snhoAgJMH9MRQsQ5V9eRAFLGHn6p4/
         9c9Rg49SX6qKMBICU9pH6/KHKu+qE6DooqtiXE8QApI7V3izjhdmJ/RRzT72JL8hzJDF
         HpLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20251104.gappssmtp.com; s=20251104; t=1778154632; x=1778759432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=DzJSxsSNP/VWY5lK6umxFg1DGouQ86rOkTJYFr2Ns/8EdanrJbwUbsr5bvp8I061Vw
         e6COf4HrXiFqHU3HRrSH7sM45Xe5egV0ldwdROslQ0YFINjxqEw6NcR7CLyRPfCaN4GV
         ScxEepF3FgKzZERcz8a4iEaS4vjPLuap84GhyLodYO2d0ItcTjJk3+X1VuJeCkCCwAh1
         NQDyxUSsSgvMui6fKAX3sDaeAp4F+dYVLnlyikJblL7PLzi/JRAP978NmdvtOGtLkQTw
         vFKn4lDry7qwexNyxILBRZLvD9F5o4gmEN6x1U2IqlwiEnQ1t2+zGLr8WoYblzIHw44S
         xepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154632; x=1778759432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=pBP9JTYns0KNogSRsLl3fYosVoS3Rw3OIOXLe5zxycRZTU3vDWc88NArzLZaWXdMDQ
         dCDaA1aFnLN2Ne9tKBJp/mOOKSfw/z34MvxXqeN+cgA6yQjOtBGaMMEMq8BXlmJ/7pe8
         L4oPETP/JzPFF5dDxon4+iiynOZXX1I690hytnrYOTmTDchhR2JDqJlq8N7LOpTVF8nq
         vmTXNZMGTsp7ZzOiadvh8orz5H7/wvTV8WAxVuOhq9lZVtcb0B94zcSsDfEbfC3Y7N1H
         8hespZGaTM7NxnjcV1KfGxs1GOJly6mIBQxy/jS/hVaBlwqIzv3p32HA6rc/vGP2OrQ6
         R4vA==
X-Forwarded-Encrypted: i=1; AFNElJ/5kpou5ggWD30MxPzCnB5vqGkpw4GcvRIQ26K1KVLdhNJeBIhjuGTg9U9IaIMjs6bEeknegZaCrvF7@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfkZKLdtnuTU3QAMY9qDA5sGIMlABlXwqTmHsEVDw2kFUPJ35
	b51uvp1thQNORJT4wq0l8qEmG58ZkllzX1TmDqN7whdDSizSCekyCytCD7SgwjtOrqglHt8TunF
	dHNcjZND3+0Obomj0IPvJa5zz5zioeb3iL9ROBbfhhw==
X-Gm-Gg: AeBDietnnrAVS5tDvxoh4h9K7EVqpZlgp2AUfx2tVMzMgCR3b0PdcL3zQ4524pPFNC9
	zOwLWnRnqdrmGQcjpodTjw4f1b3jXBTI7YGgsK7waThTdtHYNAb/pr7amfvLenLZEUd466ThCjL
	0xQhOnUUpsGlYHM6q56z8RJ4UXsd8+ZGCqbXI+G/2U5OReUKVQa1yGfvu5m6GghZ2lvchs/Mit8
	NouOZgR+XRCrY10FmRPJTd3+cfD8Vqor93gei7OVYy0ptVGi9FbwJKWJwYtlyWHMX8tpATgama5
	wVzcNQRWshCW7ywXs0aZQ9mVWCT1MyTak2kbT3rdXvPUUh78EWemkcvtmRvKGr+w8M8dADqGjT4
	0EQTUT5zNaazW0+Ol7Ln1Zo/DnjfdRaA0XmfvDGCHaYG2BqK0QuNlkI0BOEP2h8vKNXSBIVl7kM
	kIEVDz
X-Received: by 2002:a17:903:32d0:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2ba79287840mr74956165ad.22.1778154631740; Thu, 07 May 2026
 04:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Thu, 7 May 2026 17:20:18 +0530
X-Gm-Features: AVHnY4ImNfDSCtiszfUjpZiS_xnG2D7LfpDRWViLHXt-m2rR-PMYp3ZtRPQUAUI
Message-ID: <CA+VMnFwV6gH+W=5UdpPJ2t8J=C0hpZ8M_gmKok_DpmCkJOWo=g@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4865D4E7DE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36367-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[edgeble-ai.20251104.gappssmtp.com:s=20251104];
	DMARC_NA(0.00)[edgeble.ai];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amd.com,amazon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.42:email,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagan@edgeble.ai,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[edgeble-ai.20251104.gappssmtp.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.813];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,mail.gmail.com:mid,0.0.0.2:email,0.0.0.37:email]
X-Rspamd-Action: no action

On Tue, 7 Apr 2026 at 01:47, Dumitru Ceclan via B4 Relay
<devnull+dumitru.ceclan.analog.com@kernel.org> wrote:
>
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
> This series depends on support for internal pads, for which a patch has
> been added.
>
> The previous version is at:
> v9: https://lore.kernel.org/r/20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com
>
> Since the previous series, Cosmin has left Analog Devices.
> Because included changes from previous version are trivial, his sign-off
> and tags were retained.
>
> The following deserializers are supported:
> * MAX96712 (already exists in staging)
> * MAX96714 (already exists)
> * MAX96714F (already exists)
> * MAX96714R (GMSL2)
> * MAX96716 (GMSL2)
> * MAX96724 (already exists as part of existing MAX96712 driver)
> * MAX96724F (GMSL2)
> * MAX96724R (GMSL2)
> * MAX9296A (GMSL2)
> * MAX96792A (GMSL3)
>
> The following serializers are supported:
> * MAX96717 (already exists)
> * MAX9295A (GMSL2)
> * MAX96793 (GMSL3)
>
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
> * Full Streams API support. Most deserializers have support for more
> than one link, and more than one PHY. Streams support allows
> configuration of routing between these links and PHYs.
>
> * .get_frame_desc() support. Both the serializers and deserializers
> implement this to query and provide frame descriptor data. This is
> used in features explained in-depth below.
>
> * .get_mbus_config() support. The deserializers implement this to allow
> upstream devices to query the link frequency of its pads.
>
> * Address translation with I2C ATR for the serializers.
>
> * I2C ATR translation - some deserializers cannot do muxing since I2C
> communication channel masking is not available per-link, and the only
> other way to select links is to turn them off, causing link resets.
> For such cases, I2C ATR is used to change the address of the
> serializers at probe time.
>
> * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
> 3Gbps.
>
> * Automatic stream id selection for deserializers which need serializers to
> stream on unique stream ids.
>
> * Automatic VC remapping on the deserializers. VCs are picked so that
> if they were unique on the sink pad, they will end up as unique on
> the source pad they are routed to too, prioritizing using the same
> VC ID as the sink pad, to facilitate the possibility of using tunnel
> mode.
>
> * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
> when VC IDs do not need to be changed and all hardware supports
> tunnel mode, otherwise, pixel mode is used. The serializers are
> automatically switched between the two by using a private API.
>
> * Automatic double mode selection. In pixel mode, double mode can be
> used to pack two pixels into a single data unit, optimizing bandwidth
> usage. The serializers are automatically set up to support the double
> modes determined by the deserializers using a private API.
>
> * Automatic data padding. In pixel mode, if the data being transferred
> uses two different BPPs, data needs to be padded. The serializers
> automatically set this up depending on the configured double mode
> settings and incoming data types.
>
> * Logging. Both the deserializers and serializers implement the V4L2
> .log_status() ops to allow debugging of the internal state and
> important chip status registers.
>
> * PHY modes. Deserializer chips commonly have more than a single PHY.
> The firmware ports are parsed to determine the modes in which to
> configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
> fewer lanes).
>
> * Serializer pinctrl. Serializers implement pinctrl to allow setting
> configs which would otherwise be inaccessible through GPIO: TX/RX via
> GMSL link, pull-up & pull-down (with strength), open-drain &
> push-pull, slew rate, RCLK pin selection.
>
> * TPG with selectable formats, resolutions and framerates for both
> serializers and deserializers.
>
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219

Thanks for the series. For validation, could you share the DT binding
used while testing this configuration (Raspberry Pi 5 + MAX96714 +
1xMAX96717 + 1xIMX219)?

I used the same with imx415 but, cannot detect the sensor ID.

[   12.768891] max9296a 7-004c: DT source ports parsed
[   12.768903] max9296a 7-004c: DT physical configuration selected: 0
[   12.768909] max9296a 7-004c: DT pipe defaults initialized
[   12.768919] max9296a 7-004c: DT sink port 0 present
[   12.768926] max9296a 7-004c: Looking up port0-poc-supply from device tree
[   12.768978] max9296a 7-004c: DT sink port 0 enabled
[   12.768989] max9296a 7-004c: DT sink ports parsed
[   12.768995] max9296a 7-004c: Initializing deserializer core
[   12.769000] max9296a 7-004c: Applying RLMS adjust sequence (2 regs)
[   12.770660] max9296a 7-004c: Enabled link A remote control channel
[   12.771745] max9296a 7-004c: Enabled on-die LDO2
[   12.771755] max9296a 7-004c: Skipping TPG init for this variant
[   12.771762] max9296a 7-004c: Disabling deserializer output during init
[   12.793066] max9296a 7-004c: Link 0 serializer xlate start:
power-up 0x42 alias 0x40
[   12.793081] max9296a 7-004c: Selecting links mask 0x1
[   12.796294] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.108806] max9296a 7-004c: Link 0 serializer responded at 0x40 before reset
[   13.216637] max9296a 7-004c: Link 0 serializer xlate complete: 0x42 -> 0x40
[   13.216817] max9296a 7-004c: Selecting links mask 0x1
[   13.219683] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.425486] max9296a 7-004c: Consider updating driver max9296a to
match on endpoints
[   13.425503] rockchip-csi2-dphy csi2-dcphy0: dphy0 matches max9296a
7-004c:bus type 5
[   13.499022] max96717 10-0042: Allocated serializer core state
[   13.499081] max96717 10-0042: Parsed serializer DT
[   13.524495] max96717 10-0042: Initialized serializer core state
[   13.524511] max96717 10-0042: Initializing serializer i2c-atr adapter
[   13.527562] max96717 10-0042: Initialized serializer child I2C adapter
[   13.527587] max96717 10-0042: Registering serializer notifier
[   13.527598] max96717 10-0042: Added serializer source notifier for phy 0
[   13.527607] max96717 10-0042: Registered serializer notifier
[   13.527619] max96717 10-0042: Consider updating driver max96717 to
match on endpoints
[   13.527635] max96717 10-0042: Registered serializer V4L2 subdevice
[   13.540303] imx415 11-0037: detect imx415 lane 4
[   13.540310] imx415 11-0037: current mode 2, cfg_num 12
[   13.540356] imx415 11-0037: Failed to get reset-gpios
[   13.540369] imx415 11-0037: Failed to get power-gpios
[   13.540377] imx415 11-0037: no pinctrl
[   13.540385] imx415 11-0037: Looking up dvdd-supply from device tree
[   13.540450] imx415 11-0037: Looking up dovdd-supply from device tree
[   13.540495] imx415 11-0037: Looking up avdd-supply from device tree
[   13.580898] imx415 11-0037: Requested xvclk=24000000 actual=24000000
[   13.630800] imx415 11-0037: Read chip ID reg 0x311a = 0x00 (ret=0)
[   13.630815] imx415 11-0037: Sensor state: 0x3000=0x00 0x3001=0x00
0x311b=0x00 0x311c=0x00 0x311d=0x00
[   13.630825] imx415 11-0037: Unexpected sensor id(000000), ret(0)

DT:
&i2c7 {
    #address-cells = <1>;
    #size-cells = <0>;
    status = "okay";

    max96718_dcphy0: deserializer@4c {
        compatible = "maxim,max96718";
        reg = <0x4c>;

        port0-poc-supply = <&vcc_3v3_adapter>;
        i2c-alias-pool = <0x40>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;

                max96718_link0_in: endpoint {
                    remote-endpoint = <&max96717_gmsl_out>;
                };
            };

            port@2 {
                reg = <2>;

                max96718_csi_out: endpoint {
                    remote-endpoint = <&mipidcphy0_in>;
                    data-lanes = <1 2 3 4>;
                    link-frequencies = /bits/ 64 <400000000>;
                };
            };
        };

        i2c-atr {
            #address-cells = <1>;
            #size-cells = <0>;

            i2c@0 {
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0>;

                max96717_0: serializer@42 {
                    compatible = "maxim,max96717f";
                    reg = <0x42>;
                    gpio-controller;
                    #gpio-cells = <2>;
                    #clock-cells = <0>;
                    i2c-alias-pool = <0x11 0x12>;
                    pinctrl-names = "default";
                    pinctrl-0 = <&max96717_0_pwen_pins
&max96717_0_rclkout_pins>;

                    max96717_0_pwen_pins: pwen-pins {
                        function = "gpio";
                        pins = "mfp0";
                        drive-push-pull;
                        bias-disable;
                        output-high;
                    };

                    max96717_0_rclkout_pins: rclkout-pins {
                        function = "rclkout";
                        pins = "mfp4";
                    };

                    ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                            reg = <0>;

                            max96717_csi_in: endpoint {
                                remote-endpoint = <&imx415_0_out0>;
                                data-lanes = <1 2 3 4>;
                            };
                        };

                        port@1 {
                            reg = <1>;

                            max96717_gmsl_out: endpoint {
                                remote-endpoint = <&max96718_link0_in>;
                            };
                        };
                    };

                    i2c-atr {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        i2c@0 {
                            #address-cells = <1>;
                            #size-cells = <0>;
                            reg = <0>;

                            sensor@37 {
                                compatible = "sony,imx415";
                                reg = <0x37>;
                                rpi-global-reg-list;
                                clocks = <&max96717_0>;
                                clock-names = "xvclk";
                                avdd-supply = <&avdd_2v9_cam0>;
                                dovdd-supply = <&dovdd_1v8_cam0>;
                                dvdd-supply = <&dvdd_1v1_cam0>;

                                port {
                                    imx415_0_out0: endpoint {
                                        remote-endpoint = <&max96717_csi_in>;
                                        data-lanes = <1 2 3 4>;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

Did I miss anything on the sensor side or in the DT?

Thanks,
Jagan.

