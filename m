Return-Path: <linux-gpio+bounces-15974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60161A3530A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 01:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF1B3A98E1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21275228;
	Fri, 14 Feb 2025 00:40:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F6817E;
	Fri, 14 Feb 2025 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493601; cv=none; b=HjEXMulHIfAmGn857CPNXOZBjsJqG2plLdY6MJ7f0IlI4FYr9m17e3S2BzcP7PpUnsv7X/lxNZuIzsAlzFugrd+trQUA9L35OUgnpZ6Xx9rWCMbnggw35PDM+SZBl7LQ0Stv93jAZtC0Ureb6m5mBx0uvrILV/fv8TLlhwQpNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493601; c=relaxed/simple;
	bh=zVJ9AXi59NjvpEsIyReOwPvu32g3DtmAWla1WGnYUqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rE+bAvabCzPmQynXWitSUUuhpp7p7FWc+pustCL/388e6PQ+hEI40WTwRdunfCifBUc49RWEcgBLlbpvdu1fzUS9362QP9P04ay8ZHQDaZH1KBRMYrH1XqqBaxYnCOfYtICqRU7z/07gaZw8FHRyzKJDs2HIWaidR88kS+tiVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68D1113E;
	Thu, 13 Feb 2025 16:40:19 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EBD23F5A1;
	Thu, 13 Feb 2025 16:39:57 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] pinctrl: sunxi: Add Allwinner A523 support
Date: Fri, 14 Feb 2025 00:37:26 +0000
Message-ID: <20250214003734.14944-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the second drop of the series introducing pinctrl support for the
Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
Aside from being (trivially) rebased on v6.14-rc1, this series just
contains two fixes, for using all 11 GPIO banks on the A525/T527, and
adds a more elaborate comment for the new pinctrl code. Also the DT
binding is now in a separate file.
It looks like we reached consensus that this approach of losing the
pinctrl table in the kernel source is better than using the one used for
Apple Silicon SoCs, so hopefully this gets reviewed and makes it into the
tree. For a changelog see below.

The first four patches extend the sunxi pinctrl core code to deal with
some specialities of the new SoC: it uses every of the 11 possible banks
except the first one, which required some register remapping. The first
patch here is some cleanup, which we should take regardless, I think,
since it fixes some hack we introduced with the D1 support.

The main feature is actually patch 5, which introduces a new way to
express the required pinmux values for each function/pin pair. 
Traditionally, we dumped a rather large table of data into the (single
image!) kernel for that, but this approach now puts that value into
the DT, and builds the table at runtime. This patch was posted twice
before [2][3], the last time LinusW seemed to be fine with the idea,
just complained about the abuse of the generic pinmux property. I changed
that to allwinner,pinmux now.

The rest of the patches are the usual suspects: the two files for the
two pinctrl instances of the new SoC (now very small), and the DT
binding.

Based on v6.14-rc1. Please have a look, review and test!

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20221110014255.20711-1-andre.przywara@arm.com/

Changelog v1 .. v2:
- rebased on v6.14-rc1
- extend regulator array to cover PortK as well
- increase number of pins in A523 PortJ from 18 to 28
- extend comment for new pinctrl DT code
- move DT binding into separate yaml file
- Add Jernej's Reviewed-by (with thanks!)

Andre Przywara (8):
  pinctrl: sunxi: refactor pinctrl variants into flags
  pinctrl: sunxi: increase number of GPIO bank regulators
  pinctrl: sunxi: move bank K register offset
  pinctrl: sunxi: support moved power configuration registers
  pinctrl: sunxi: allow reading mux values from DT
  dt-bindings: pinctrl: add compatible for Allwinner A523/T527
  pinctrl: sunxi: Add support for the Allwinner A523
  pinctrl: sunxi: Add support for the secondary A523 GPIO ports

 .../allwinner,sun55i-a523-pinctrl.yaml        | 177 +++++++++
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun5i.c         |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     |   7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      | 374 ++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  54 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  47 ++-
 13 files changed, 760 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

-- 
2.46.3


