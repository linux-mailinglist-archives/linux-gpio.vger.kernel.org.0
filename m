Return-Path: <linux-gpio+bounces-36544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HXBMFzMAWqgjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:32:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154450DE14
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBC5B3091A7B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31693A3833;
	Mon, 11 May 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDClmUzX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565123939B0;
	Mon, 11 May 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502404; cv=none; b=ZU5PWSW8uWu4axe+sSM4Rh5pfpDtMdDgd32muuH6F9FRRYGE/+QBF9RtNVXtPovcvoeW5Y1IINawDq8UpVm9CxyhB4GJH7Bvg92cEJas0gT3GSJs3Bj4XC3oXTRnxg0XOFuCjbpvaFdVE7I/XnetL+E7wDVshqR4cqZT6TBFEpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502404; c=relaxed/simple;
	bh=2SffxXx6+XCIgb1TpZncu9YH1DzHXjlduZb+EdR7NlU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vo9lKlU781N5yihA25xvIXxId8dTVlp9D2pnhjiuwI2ZK7zsGptg4qCHt06N+MsudMs/A+vzTMLpKrcHzPFxofMhgNSWuOD8JqbBM7d49DySfWDhjr1BznSHJtF3bkf3IZRYVQDyCNzIsEPMnZPpPCbwXl4zanr/4vrF+VbSeb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDClmUzX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDA15C2BCF7;
	Mon, 11 May 2026 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778502403;
	bh=2SffxXx6+XCIgb1TpZncu9YH1DzHXjlduZb+EdR7NlU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pDClmUzXOcsUpaHOfbtplNjonzB9Z/t6YIJ/Czj29PZaO4u47EVoUByKXzvJlkvqg
	 suytXXqgDJiguB14pRArIgRpToYAZmmpMjujQDsjDPljAKxqgaddH8BVZNY7NlEDkp
	 AGwDU/dYqWywdheVx62k8mHgAdGjdnXV8IPDhhUw9Mgxa/7MRsRahBMM3V+cMeJBmj
	 5wDr+A3IazkY2RRF7TexORKN56hn6wAiAHne/1tXvqkXlgxSTuAwxzdxMKLGQTL8hQ
	 RWbgHT0sPggLQcrc1+mHdTp0Fu06E0w5n2zE0aI07v54dqpASuHxrD2woMv/D4wOY6
	 2aqyvzYIppZ4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB02ACD4842;
	Mon, 11 May 2026 12:26:43 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Subject: [PATCH v11 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Date: Mon, 11 May 2026 15:26:23 +0300
Message-Id: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO/KAWoC/2XN3QqCQBCG4VuRPW5jZt1Vp6PuIyJsf3TBn3BDC
 vHeW6WI8vAbeJ+ZWLCDt4EdkokNdvTB910ciLuE6brsKsu9iQcmQChEyHnVhkbw9BJDYwNPnbg
 WhRJAOmUxug3W+ccqns5x1z7c++G5PhiL5fqmUP5TY8GBy1wSGYKcCI5lVzZ9tdd9yxZrpE+fQ
 Yq46WnpMfYOCEC6TY/wBSRkGwAhCplUKgNnjS7VjzDP8wsEnf4yMAEAAA==
X-Change-ID: 20251107-gmsl2-3_serdes-3f2b885209c3
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>, 
 Vivekananda Dayananda <vivekana@amd.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>, Cory Keitz <ckeitz@amazon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778502401; l=18739;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=2SffxXx6+XCIgb1TpZncu9YH1DzHXjlduZb+EdR7NlU=;
 b=M7s4PNDQUu3ALC/MkrVluu2Qz4/aD95lPczXwVUMXPgEbnt40EXhboXVjANOT3JrTEd3VWWBG
 Sa7UUOysYwQD88uncSszi/6gZFit37cfNKIcb0iFK1gBEYSt8TpeYbe
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com
X-Rspamd-Queue-Id: 5154450DE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36544-lists,linux-gpio=lfdr.de,dumitru.ceclan.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,ideasonboard.com,amd.com,analog.com,amazon.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	HAS_REPLYTO(0.00)[dumitru.ceclan@analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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
v10: https://lore.kernel.org/r/20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com

Since the previous series, Cosmin has left Analog Devices.
Because included changes from previous version are trivial, his sign-off
and tags were retained.

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

Special thanks go to Tomi Valkeinen <
tomi.valkeinen+renesas@ideasonboard.com>
for testing the drivers, helping debug and coming up with ideas /
implementations for various features.

V11:
* max96724: preserve cc_port_cfg in select_links()

V10:
* dt-bindings: add control-channel property
* max96724: add configurable control-channel port selection
* max-ser/max-des: fix VIDIOC_SUBDEV_G/S_FMT, detect ~0U format
 (v4l2-test-subdevs.cpp:448: s_fmt.format.code == ~0U)
* max-ser/max-des: fix VIDIOC_SUBDEV_G/S_FRAME_INTERVAL fail:
	 add max_(ser/des)_get_frame_interval returning -ENOTTY
	for non-TPG pads and streams
 (v4l2-test-subdevs.cpp:302: node->enum_frame_interval_pad != (int)pad)

V9:
* split max_des_ops into *_info and *_ops
* use read_poll_timeout macro in *_wait_for_device()
* return read_poll_timeout error -ETIMEDOUT in *_wait_for_device()
* remove use_atr duplicate from max9296a_chip_info, present in max_des_info
* fix max9296a DPLL register offset
* fix C-PHY DPLL frequency in max9296a and max96724
    reported by: Cory Keitz <ckeitz@amazon.com>
* use MAX9296A_COMMON_INFO and MAX9296A_COMMON_OPS to simplify
  probe ops init
* fix borked patches in previous version, actually remove MAX96717 and
  MAX96714 drivers

V8:
* max96717: use the renamed PIN_CONFIG_OUTPUT to _LEVEL
* max96717: use the renamed set_rv ops from struct gpio_chip
* dt-bindings: set minItems lane-polarities to 2
* dt-bindings: "add myself as maintainer" commits were removed
* max_des & max_ser: use a default format for set_routing
* max_des & max_ser: return ENNOTTY in *_frame_interval for non-TPG pads

V7:
* dt-bindings: max9296a: use full max96717 compatible
* max9296a: make max96714_rlms_reg_sequence static
* explicitly include linux/bitfield.h
* explicitly depend on I2C and PINCTRL
* sort media_entity_operations
* add has_pad_interdep to media_entity_operations

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

---
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Cc: Martin Hecht <Martin.Hecht@avnet.eu>

---
Cosmin Tanislav (20):
      dt-bindings: media: i2c: max96717: add support for I2C ATR
      dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
      dt-bindings: media: i2c: max96717: add support for MAX9295A
      dt-bindings: media: i2c: max96717: add support for MAX96793
      dt-bindings: media: i2c: max96712: use pattern properties for ports
      dt-bindings: media: i2c: max96712: add support for I2C ATR
      dt-bindings: media: i2c: max96712: add support for POC supplies
      dt-bindings: media: i2c: max96712: add support for MAX96724F/R
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

Dumitru Ceclan (1):
      dt-bindings: media: i2c: max96712: add control-channel-port property

Sakari Ailus (1):
      media: mc: Add INTERNAL pad flag

 .../bindings/media/i2c/maxim,max9296a.yaml         |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml         |   73 +-
 .../bindings/media/i2c/maxim,max96714.yaml         |    5 +-
 .../bindings/media/i2c/maxim,max96717.yaml         |  154 +-
 .../userspace-api/media/mediactl/media-types.rst   |    9 +
 MAINTAINERS                                        |   10 +-
 arch/arm64/configs/defconfig                       |    1 -
 drivers/media/i2c/Kconfig                          |   34 +-
 drivers/media/i2c/Makefile                         |    3 +-
 drivers/media/i2c/max96714.c                       | 1017 -------
 drivers/media/i2c/max96717.c                       | 1102 -------
 drivers/media/i2c/maxim-serdes/Kconfig             |   60 +
 drivers/media/i2c/maxim-serdes/Makefile            |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c          | 1358 +++++++++
 drivers/media/i2c/maxim-serdes/max96717.c          | 1686 ++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c          | 1261 ++++++++
 drivers/media/i2c/maxim-serdes/max_des.c           | 3205 ++++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h           |  156 +
 drivers/media/i2c/maxim-serdes/max_ser.c           | 2155 +++++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h           |  147 +
 drivers/media/i2c/maxim-serdes/max_serdes.c        |  413 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h        |  183 ++
 drivers/media/mc/mc-entity.c                       |   15 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/max96712/Kconfig             |   14 -
 drivers/staging/media/max96712/Makefile            |    2 -
 drivers/staging/media/max96712/max96712.c          |  487 ---
 include/uapi/linux/media.h                         |    1 +
 29 files changed, 11116 insertions(+), 2686 deletions(-)
---
base-commit: a15a902a91b78f1544760fb52ef0151f83815f81
change-id: 20251107-gmsl2-3_serdes-3f2b885209c3

Best regards,
-- 
Dumitru Ceclan <dumitru.ceclan@analog.com>



