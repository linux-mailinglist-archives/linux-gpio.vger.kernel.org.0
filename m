Return-Path: <linux-gpio+bounces-14222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799D9FC2F5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 01:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1CE8165077
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 00:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DA26116;
	Wed, 25 Dec 2024 00:33:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F712581;
	Wed, 25 Dec 2024 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735086801; cv=none; b=NFZTjFzSBZU5P0tYWaj5h/r3zl1p2sSU730CvL1NjY4ww0YmxgWmvtSQWPvCdw1V8FAF6l7fsG/63AH2OgRvJ9AXw34cDKYBjgzb8JTPpa3EV+4FK2bLezIEDXvm+RPUgWObzH65AtRj66APEvAK2A+wpiy4hSBZKQS1PyHD/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735086801; c=relaxed/simple;
	bh=cxl3ajAlJqTFZVJYcvm63By6WB5fDAr1GHfv0IxtB/Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EK65e61nlvKb2KcW6OQ9bdSXZWKqbKO2GCg2tBP8BBB007yhZq9DTOblvpsTFpbW/l/b6KFkcKbGmiMcDeBnnfTinTVAxTm3x/tfkey51Wr5mheD4c4GMhjSagjrGJ1aUDrP/e/6QEna/C7ccbdbKJ9pc45RL9JTohRzc64n9ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Wed, 25 Dec 2024 08:32:38 +0800
Message-Id: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdSa2cC/1WQy27EIAxFfyViXSrbkOeq/1F1EcBkUDshJWnUa
 pR/L8mM2hl2F+kcX/siZk6BZ9EVF5F4DXOIYw7qqRD21I8Dy+ByFgSkoaFGgpLvKIcpRFmh8S3
 5FhRZkYEpsQ/fh+z17ZoTf35l53L9/Fd2xSGsqNptgNL0c7DSLRL7XiEzG+uoW0txX+RG1ZBr0
 A5OYbRL+pCqJwNsUSHgDcpCljaez2Hpirpx2ivNhFiaEmtjjeeaLTjAxuRX+daAacRe+xTmJaa
 f4yQrHr2PsS3o++3X3FtWUBMbZtszvAw8LjE+xzQcnpX+WCRsH1jKLDVaa++I0LoHdtu2Xx+J6
 haYAQAA
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cxl3ajAlJqTFZVJYcvm63By6WB5fDAr1GHfv0IxtB/Q=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBna1K64x9Qk83DaIIseh3eAA9yHstXGjOvGDmsK
 pH3yjgh8S2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2tSul8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RahD/9uuI9FpmUE2tmQb/
 Csw7MdmVqGup9rJ8afzNy/hVOdpx05/43R9NJrBjON+PGfwcVJXwxSE2u7BE4eG+CwwAeOGMwSH
 HPmx/kIYpG0OuFnBgEOSLD1ZzCkY8abcvM41/UbHIOkT2JQtjUezkCEaWtlPI0TXyxEBcvJKpks
 dgoD5cGLyzPBzR4p1xsViWXN2n0DQr0zQksIcdT5x2eEigYp+WexiZ94w61peYhaU3CBmvAArdt
 Alo9HuZ8YUgZ/E3WogVfJGGEyq5gESxrFu1Xb/WoXe7VbncUs284z6KRKg/qPS0Wa+73f8T05g+
 GJP1aT3AAYy5B8+p6FOOkzviMW9ekm9FBMSI5G6p+vQYU6BM7TU6YWPPFmWenI4hJres0IzZduQ
 ousCLgQN9avMOQlMlI/bpTbIDhEdb9wTmCUz8ktnQkuxa58ziJ5r3Z565Nk78QhFOjuxf5u9z69
 SkZk7At+v4g0s794eil/vPP45DEJdbvlFLZgneCGYoi6p07jMwl/LKUbmNHBtc494L+0VUUHzac
 tNY5/VRoO8bu2G9rEBQZCWJ9IRyXje9o2sy3SgqZwjuQV0MMpwXV8zjFWiXmposSidV5Obhplw/
 TSVPrSqyK0RbdIMjVN9afTF8T/pyV/qFsLBzj6Xc4fVpn18t2o7kuWD7DHvkbKekSwHw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO banks, each consisting of 32 pins.

The GPIO driver request the clock source from APBC block,
In this series, I haven't added the clock support, but plan
to fix it after clock driver is implemented/merged.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch need two prerequisite series, basic dt[2] and pinctrl[3]

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- dt: drop ranges, interrupt-names property
- Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org

Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (3):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  69 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 454 +++++++++++++++++++++
 5 files changed, 543 insertions(+)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20240828-03-k1-gpio-61bf92f9032c
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
prerequisite-change-id: 20240708-02-k1-pinctrl-3a2b0ec13101:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
prerequisite-patch-id: 238db182251f2f79a947d16f0112a958d0837878
prerequisite-patch-id: 8c2cff9ceb9d062c91a34a39add45555bff2d545
prerequisite-patch-id: b93bb35db82d199d4d30deefbc34b8413539cf32

Best regards,
-- 
Yixun Lan


