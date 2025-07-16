Return-Path: <linux-gpio+bounces-23365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5FB07DA3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D451F7ACF49
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A287288517;
	Wed, 16 Jul 2025 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK6Qg+fH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234C1D555;
	Wed, 16 Jul 2025 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694285; cv=none; b=eaRyHaXw0aS7m3OvPNfWhNOgEdyDE0SE2QhPYXmgC1kRkck7xSqI8CquBjR0OjjlDKX0egzH79kco1f6TB0ehVj/AumH2cdt1L95ESYlhrIgCMfWKM/R+lvr6Gfm7RJGEcZEYdjPCRbUTa0uoUXJjmexG8DlHbv0WjwMsGpXaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694285; c=relaxed/simple;
	bh=GuxewSAt2DvZILp/vRjj4UEBBIe3L0yP/yFku8tvICU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RunvtejQ7PgieuVq579iyU9umJuaKCqG5s4HYMIJ7CDtKtDneRZuF8JzgpcJWA7HsIac6dKZqFnwH7mNb747VkDjJsSBfh+nVsevKvGn1A8Z+Dikmnbm3t2YDB5RvMWdH9cZLVmBJlxo0vi2mOt+St4vBXMM1LDJq00gLTsfF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK6Qg+fH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so35793566b.1;
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694282; x=1753299082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62kYYru/vLhnTY/AcdRkclOdH8pRlY3148JaIXYpvvU=;
        b=hK6Qg+fHXJw3sdqwYclSDvOWXxXxrpf9Q8lEVMAUXuaUKj0yWDS7Q93JKnFC0Fnk3g
         iZJV7hAOjBd/iNXszFZDVWFmsDv6IZob37keHLjLQ2fXzPqVd0ieRctxQ91DZyPheGVk
         JlKevnt/DmySBBj7Lw9HnGnRtJ5mzZPifX+C+R/AuUMLTZeiC7X3xeTOPLjXt7Z1EK9m
         Xf4mHlCiOZ4qfIxz9TgnglrfvJsX0H4cMwiMvry0XORjbVPU+v7ok93a1wm2+VILmLUg
         cLU9RCVZ173eXCJ+U5o9p4urO8HiF4IHy4UeCr9MRFpJKe1PlqFPTJk+5SnmBNBZkhhq
         0bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694282; x=1753299082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62kYYru/vLhnTY/AcdRkclOdH8pRlY3148JaIXYpvvU=;
        b=afY6L0fASMbqLvOxtLAtJhvsxGnLJhAhqyGNy/LFyWcQS+wUs6MPLL7tC+XiNWKqEk
         9WU+7A70tcgHZD7L4rAWZBjqpCUReSTudz6gzhzuL87QanScc38CqTmxhkCB9WL6nPNm
         wrCP/ZMGZRJ0NciXNbfG0itLwS0qxzWeMAqCmoRNrdeS9GwDtxbfXhcJCbTpIvDt+H0Q
         7tGO84o1i3CqHlFyPwRqkR4sggkfZ3KYahXwwa/Jb7OYATD5hrtUJQgWuGC85hmaL0ZP
         x1RnahpeF6JfoumzCG3O70bkdLpFMpAgHA5sIajIc5NoxaJ2ZIhTPgj+hk6oem5fSa7A
         o0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCe6mmfQXBV/FsXs0mVXb2AJTqWomy9mXzNXcn9BfSqiSGhVmTgokLnegZUimw0G/qUVwHhELSypfb@vger.kernel.org, AJvYcCVJAHqfh4RZvwGbrpVlCeUf+fthnuSj8jBHnYYAHFhVVORwu5Ww3+0EsbAUPx2SOAJK/wRLjx31mXD4kFZE@vger.kernel.org, AJvYcCVkpa1vvCEhhDtjSo0jcwHUhziA1yXVDYDxLGXfRu46ct1pninIKkCD8Pj7KtBM3GH7s/2TyD6qvnC1rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkW79DH5pOHKyVl1KvpjrpoB3LB+Qqvl/XxjbHZBSb+nPQIEH
	qSZJT2w6AdMMNBnuEsCCxBWzItu4vgk/iyip5oIZ6iiAW1Ca1z6H4/XK
X-Gm-Gg: ASbGnctDQQoq8R//qwQov89f9g5E8m0vi6RzodV7hGpf9kqAqiepwYgp1jeSI6G/vNP
	PqpEplnG828A/LoYOZJmyeJCPH1ZO9j2yCCjJknn3L7/EVPkq/lVjFOED/4UmjzF4JEQn77qxbM
	gDZVPWgsLCJuo99zMLFnolu64FaiCvSZ3g7W9QkbuL6ABK6xuM3undJT8rHRxADTDOoyTlSMhaj
	1wS/ubY/ZnyvAEK9algUIA0aSZ84/JzLHtqZDrfTVWYJW7d5tu5m/tXDeDof2EwgUXf2y3Nwlhk
	E7k6UYnXxtNgaUpO5XaWJrq/qMZv8NiXa4lV/ZTMxMBsTn5hd6gPKF8KFdOWKOhx5mVH1GDf9SZ
	Retn9BcttWVztPQlYhOq0t1eFvJTO4AfJ5Qb41qEJm2Q42A==
X-Google-Smtp-Source: AGHT+IF2KgST1YOWGCHpDSnm8YUWYoSXDo44w4X04F9uMYnYEijsiW/Rg1fcOU9JgL2jBRpnug2x+g==
X-Received: by 2002:a17:907:c1e:b0:ae1:a6a0:f2fe with SMTP id a640c23a62f3a-ae9c9af85e4mr472886966b.36.1752694281528;
        Wed, 16 Jul 2025 12:31:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:21 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 00/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Wed, 16 Jul 2025 22:30:45 +0300
Message-ID: <20250716193111.942217-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
replacing the few GMSL2 drivers already in upstream, and introducing a
common framework that can be used to implement such GMSL chips, which
avoids code duplication while also adding support for previously
unsupported features.

While the normally acceptable and polite way would be to extend the
current mainline drivers, the choice was made here to add a totally new
set of drivers. The current drivers support only a small subset of the
possible features, and only a few devices, so the end result after
extending them would in any case be essentially fully rewritten, new
drivers.

This series depends on support for internal pads, for which a patch has
been added.

The previous version is at:
https://lore.kernel.org/lkml/20250702132104.1537926-1-demonsingur@gmail.com

The following deserializers are supported:
 * MAX96712 (already exists in staging)
 * MAX96714 (already exists)
 * MAX96714F (already exists)
 * MAX96714R (GMSL2)
 * MAX96716 (GMSL2)
 * MAX96724 (already exists as part of existing MAX96712 driver)
 * MAX96724F (GMSL2)
 * MAX96724R (GMSL2)
 * MAX9296A (GMSL2)
 * MAX96792A (GMSL3)

The following serializers are supported:
 * MAX96717 (already exists)
 * MAX9295A (GMSL2)
 * MAX96793 (GMSL3)

The following list enumerates new features that are supported by the
common framework and their respective chip-specific drivers:
 * Full Streams API support. Most deserializers have support for more
   than one link, and more than one PHY. Streams support allows
   configuration of routing between these links and PHYs.

 * .get_frame_desc() support. Both the serializers and deserializers
   implement this to query and provide frame descriptor data. This is
   used in features explained in-depth below.

 * .get_mbus_config() support. The deserializers implement this to allow
   upstream devices to query the link frequency of its pads.

 * Address translation with I2C ATR for the serializers.

 * I2C ATR translation - some deserializers cannot do muxing since I2C
   communication channel masking is not available per-link, and the only
   other way to select links is to turn them off, causing link resets.
   For such cases, I2C ATR is used to change the address of the
   serializers at probe time.

 * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
   3Gbps.

 * Automatic stream id selection for deserializers which need serializers to
   stream on unique stream ids.

 * Automatic VC remapping on the deserializers. VCs are picked so that
   if they were unique on the sink pad, they will end up as unique on
   the source pad they are routed to too, prioritizing using the same
   VC ID as the sink pad, to facilitate the possibility of using tunnel
   mode.

 * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
   when VC IDs do not need to be changed and all hardware supports
   tunnel mode, otherwise, pixel mode is used. The serializers are
   automatically switched between the two by using a private API.

 * Automatic double mode selection. In pixel mode, double mode can be
   used to pack two pixels into a single data unit, optimizing bandwidth
   usage. The serializers are automatically set up to support the double
   modes determined by the deserializers using a private API.

 * Automatic data padding. In pixel mode, if the data being transferred
   uses two different BPPs, data needs to be padded. The serializers
   automatically set this up depending on the configured double mode
   settings and incoming data types.

 * Logging. Both the deserializers and serializers implement the V4L2
   .log_status() ops to allow debugging of the internal state and
   important chip status registers.

 * PHY modes. Deserializer chips commonly have more than a single PHY.
   The firmware ports are parsed to determine the modes in which to
   configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
   fewer lanes).

 * Serializer pinctrl. Serializers implement pinctrl to allow setting
   configs which would otherwise be inaccessible through GPIO: TX/RX via
   GMSL link, pull-up & pull-down (with strength), open-drain &
   push-pull, slew rate, RCLK pin selection.

 * TPG with selectable formats, resolutions and framerates for both
   serializers and deserializers.

The drivers have been tested on the following hardware combinations, but
further testing is welcome to ensure no / minimal breakage:
 * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
 * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
 * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
 * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
 * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219

Analog Devices is taking responsibility for the maintenance of these
drivers and common framework, and plans to add support for new
broad-market chips on top of them.

Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
for testing the drivers, helping debug and coming up with ideas /
implementations for various features.

V6:
 * max9296a: put rlms sequence in max9296a_chip_info
 * max_des: reflow stream id a comment
 * max_ser: remove exported symbols not used in other modules
 * max_ser: init mode to a supported value
 * add default routing
 * MAX_SERDES_GMSL_3 -> MAX_SERDES_GMSL_3_12GBPS
 * guard reg_read/write with CONFIG_VIDEO_ADV_DEBUG
 * put exported symbols in MAXIM_SERDES namespace

V5:
 * dt-bindings: max96717: restrict RCLKOUT to pins 2 & 4
 * dt-bindings: max96717: remove confusing rclksel pinconf property
 * dt-bindings: max96717: remove maxim,gmsl-tx/rx pinconf property
 * dt-bindings: max96717: remove gmsl prefix from maxim,gmsl-tx-id/rx-id
 * dt-bindings: max96717: remove minimum: 0
 * dt-bindings: max96717: better document slew-rate
 * dt-bindings: max96717: better document maxim,jitter-compensation
 * dt-bindings: max96717: better document maxim,tx-id/rx-id

 * max_serdes: add default TPG values
 * max_serdes: remove MAX_MIPI_FMT macro
 * max_serdes: EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
 * max_serdes: remove EXPORT_SYMBOL_GPL from symbols not used in other
   modules
 * max_serdes: rename symbols/macros/types to have max_serdes prefix
 * max_serdes: slim down TPG functions

 * max_des: fix may be used uninitialized errors
 * max_des: fix misplaced TPG validation
 * max_des: fix setting pipe PHY in tunnel mode for chips that support
   both set_pipe_phy() and set_pipe_tunnel_phy()
 * max_des: move doubled_bpp/sink_bpps variables to usage place
 * max_des: do not dynamically control PHY enable, letting lanes be in
   LP-11 when not streaming
 * max_des: refactor get/set_pipe_stream_id() logic
 * max_des: remove explicit ret = 0

 * max_ser: make VC remaps not pipe-specific, allocate dynamically

 * max9296a: add missing 1080p30 TPG entry
 * max9296a: move BIT() left shift into macro
 * max9296a: move BIT() ternary into macro
 * max9296a: reuse max_des_ops for chip-specific ops\
 * max9296a: document and compress RLMS register writes

 * max96717: restrict RCLKOUT to pins 2 & 4 because of hardware
   capabilities
 * max96717: add support for XTAL/1, XTAL/2, XTAL/4 clocks
 * max96717: set RX_EN/TX_EN automatically
 * max96717: reorder custom pinconf flags
 * max96717: drop OF dependency

 * drop of_match_ptr
 * re-do some indentation
 * implement TPG pattern control
 * remove pr_info() usage
 * inline lane polarity val = 0
 * inline returns
 * rewrite some Kconfig docs
 * split up patches for easier review

V4:
 * max_des: fix infinite version loop
 * max_des: fix pipe link id when there are more pipes than links
 * max_des: implement setting pipe link
 * max_des: do not pass routing to phy update
 * max_des: move GMSL version strings to max_serdes
 * max_des: split finding existing VC remap from adding a new one
 * max_des: add tracking for in-use pipes
 * max_des: skip unused pipes when finding / setting pixel/tunnel mode
 * max_des: simplify remap code
 * max_des: split set_pipe_phy() into set_pipe_tunnel_phy()

 * max_ser: clean up i2c_xlates printing
 * max_ser: fix changing serializer address
 * max_ser: move non-continuous mode check into max96717 driver

 * max96724: use regmap_set_bits for STREAM_SEL_ALL
 * max96724: match surrounding indent for MAX96724_PHY1_ALT_CLOCK
 * max96724: fix setting invalid PHY to 1 when PHY 0 is in 4-lane mode
 * max96724: remove support for setting pipe phy from max96712
 * max96724: fix setting double mode on pipes 4-7
 * max96724: drop powerdown gpios

 * max96717: use gpio_chip's set_rv

 * max9296a: switch versions to unsigned int
 * max9296a: remove parantheses from MAX9296A_MIPI_PHY18/20
 * max9296a: fix printing of PHY packet counts
 * max9296a: fix phy_hw_ids size

 * remove usage of cammel case in defines
 * move field_get/prep to max_serdes.h
 * rework stream id setup
 * rework tunnel/pixel mode finding
 * rework bpps retrieval
 * pass whole subdev state around
 * add helper for retrieving a route's hw components / frame desc
 * update pipe enable based on active routes
 * add support for tunnel-only chips and VC remaps in tunnel mode
 * simplify max_get_streams_masks()
 * add support for TPG

V3:
 * dt-bindings: drop reflow text patches

 * dt-bindings: max96717: move pinctrl configuration into main file
 * dt-bindings: max96717: allow a single level of pins configuration
 * dt-bindings: max96717: use regex for matching pins nodes
 * dt-bindings: max96717: drop extra allOf in pinctrl configuration
 * dt-bindings: max96717: fix i2c-atr channel name regex
 * dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
 * dt-bindings: max96717: limit pins for gpio / rclkout
 * dt-bindings: max96717: add description for bias-pull-up/down
 * dt-bindings: max96717: require pins and function properties
 * dt-bindings: max96717: turn single compatible strings into an enum

 * dt-bindings: max9296a: include indices in port descriptions
 * dt-bindings: max9296a: remove property-less schema from input ports
 * dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX entirely

 * dt-bindings: max96712: include indices in port descriptions
 * dt-bindings: max96712: deprecate enable-gpios in favor of powerdown-gpios
 * dt-bindings: max96712: switch from MUX to ATR

 * dt-bindings: max96714: add support for MAX96714R

 * max_des: fix POC NULL check
 * max_des: remove index var in POC enable
 * max_des: fix writing empty remaps
 * max_des: skip mode setting in tunnel mode
 * max_des: remove a duplicate source->sd NULL check
 * max_des: set pipe tunnel mode even for disabled links

 * max_ser: apply TX ID changes irrespective of serializer ID

 * max9296a: fix typo in BACKTOP22
 * max9296a: make register macros more consistent
 * max9296a: switch MAX96716 from MUX to ATR
 * max9296a: deduplicate max9296a_phy_id() logic
 * max9296a: use proper PHY id in remaps
 * max9296a: fix DPLL reset clear
 * max9296a: limit MAX96714F to GMSL2 3Gbps
 * max9296a: add support for MAX96714R
 * max9296a: do not write GMSL3 link select registers in GMSL2 devices
 * max9296a: use field_prep when setting RX_RATE
 * max9296a: simplify setting SEL_STREAM for MAX96714
 * max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
 * max9296a: fix off-by-one in lane polarity when using
   polarity_on_physical_lanes

 * max96724: fix typo in BACKTOP22
 * max96724: switch from MUX to ATR
 * max96724: add support for powerdown GPIO
 * max96724: remove support for tunneling from MAX96712
 * max96724: only set tunnel-related bits when in tunnel mode
 * max96724: add support for MAX96724F/R
 * max96724: oneshot reset links after link selection

 * remove GMSL2 version defaults, set all supported versions explicitly
 * reorder GMSL versions to start from 0
 * add support for GMSL2 3Gbps
 * support GMSL version finding for devices using MUX / GATE
 * add support for deserializers which don't have individual control
   of each link's GMSL version
 * add support for deserializers that need unique stream ids across all
   serializers
 * select_link_version -> set_link_version
 * select_resets_link -> use_atr

V2:
 * add missing compatible for MAX96717F
 * fix embarrassing dt-bindings mistakes
 * move MAX9296A/MAX96716/MAX96792A to a separate file as they have two
   links / PHYs, and adding those conditionally seems impossible

Cosmin Tanislav (23):
  dt-bindings: media: i2c: max96717: add myself as maintainer
  dt-bindings: media: i2c: max96717: add support for I2C ATR
  dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
  dt-bindings: media: i2c: max96717: add support for MAX9295A
  dt-bindings: media: i2c: max96717: add support for MAX96793
  dt-bindings: media: i2c: max96712: add myself as maintainer
  dt-bindings: media: i2c: max96712: use pattern properties for ports
  dt-bindings: media: i2c: max96712: add support for I2C ATR
  dt-bindings: media: i2c: max96712: add support for POC supplies
  dt-bindings: media: i2c: max96712: add support for MAX96724F/R
  dt-bindings: media: i2c: max96714: add myself as maintainer
  dt-bindings: media: i2c: max96714: add support for MAX96714R
  dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
  media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
  media: i2c: add Maxim GMSL2/3 serializer framework
  media: i2c: add Maxim GMSL2/3 deserializer framework
  media: i2c: maxim-serdes: add MAX96717 driver
  media: i2c: maxim-serdes: add MAX96724 driver
  media: i2c: maxim-serdes: add MAX9296A driver
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

Sakari Ailus (1):
  media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max9296a.yaml    |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml    |   70 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |    6 +-
 .../bindings/media/i2c/maxim,max96717.yaml    |  155 +-
 .../media/mediactl/media-types.rst            |    8 +
 MAINTAINERS                                   |   13 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1017 ------
 drivers/media/i2c/max96717.c                  | 1102 ------
 drivers/media/i2c/maxim-serdes/Kconfig        |   55 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1344 +++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1688 +++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     | 1183 ++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 3180 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  153 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 2130 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  147 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  413 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |  183 +
 drivers/media/mc/mc-entity.c                  |   10 +-
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ---
 include/uapi/linux/media.h                    |    1 +
 29 files changed, 10963 insertions(+), 2687 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
 delete mode 100644 drivers/media/i2c/max96714.c
 delete mode 100644 drivers/media/i2c/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

-- 
2.50.1


