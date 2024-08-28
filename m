Return-Path: <linux-gpio+bounces-9260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F7962612
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 13:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDE602823A1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43F2172BDC;
	Wed, 28 Aug 2024 11:31:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74211714CB;
	Wed, 28 Aug 2024 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724844679; cv=none; b=jWojhskYtC5DqzrEZDF4acg2gl6X2EQDaNUlkdw0USFqigv46mlkVoDNugq2XcYk8nBgGHfeggMWMjLCpw3fWiyuJWszYQsQSSf6r05cxh8lmXVsykF7DFoloVFGH0blKfNAwVGV2tHyPRotx1Dh1tS6OHpD8veidoQ2ZrQyOr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724844679; c=relaxed/simple;
	bh=S82pj7/LnMee3BQCJ5bCioZD5gySulDDB5Qfb87H/8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rK/YDVPH2K9HeeKHSeJHOdmC8vCSWFcSb+eK4pDJBOckZcrCVsdp2aWAj7c20dfAzf2GVaTR+i4oCNq7g4kHXHRk1GvWc6IqECpWNYzmbJcNsj4FxuRs1l5fkrLwY+QyJHONHgF9feMtGl4ljagUvhoFcDxvzAJpYhSlOQ0MmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/4] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed, 28 Aug 2024 11:30:22 +0000
Message-Id: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4Kz2YC/12Py27DIBBFf8ViXSqYMWB71f+ouuAxTlAbk2Bqt
 Yr878X2ImqWd0bn6N47mylHmtnQ3FmmJc4xTTXgS8P82U4n4jHUzEBAK4zouAD+Kfk1Tr7kL44
 WnCAvUQrJKnPNNMaf3ff+ceRMt++qLcfxYR2a3alBb0IhubNz9DwULq1FSUTOBxgWtXnrj7hPl
 0ssQ6McaRy97EdvbesBtUNhWhBth8p0Vum+0xYN2xqc41xS/t0HLnKvcGyR/dOWpbbggL31yhk
 Tgn470VRSek35tKsWeOAdqGccKh5CwM5iq4KEf/i6rn85y2uRbAEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=S82pj7/LnMee3BQCJ5bCioZD5gySulDDB5Qfb87H/8g=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwpx90hthoqlbewjr0x1+YGOrdXZGs4OZD5kH
 JdX0PlXM8eJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8KcV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XiYD/9HdnJJ9Dd/nf6ojN
 qtttuq+SLLJCcBSo8wsAHBpfsLibZTx4lVRL7lAcYdCmt/3m+lfQWS4oN8nOkJ0CQ43CWtSxKmR
 oTOvqXekhjqOootQNmvBTWTic/e4JZSm0CrS3PfRdsjGQ6sZ70BJuUKtt+Xwg6Gtigd2YJKUdy3
 WpOD7d+8JWgCMOrVzSrQ2KvfcUEseh34XGKCdD2bDPEy+JH83szzfZQvGY8qsn7JchjS/BeuaKL
 52nWup/EwCcWACtMSCnxj+WG0bAddNffQWs1NLOuaf4kyrmYOZKEoZ2W2wVtY0gS5TcgfEnvocI
 aDtHxIZKfTH2WRXwwskCWRXcf0zRNQIBg7lBQUgNWoqnqhTXnVNxpC3pE/oeNc520xCK74s0wON
 5YvuawWqQ+OJb4SfMKKhif9c8/eCkCg4Gooe8dRts3Bn+RZxXHaJCyAcOcijxgVG/JHP+cVvfI+
 pToQLtKYqYq8Lx8qlSYVlQCshcoB4unAMFlP3CfHaATBiXZm83tY7jQsxgJBhfkob9LIVIKg28Y
 tg3t6LJcBUIJu9R4PscK4KSp37G3aSfaVcfsj7BJPBgNlDlPUWqHM/kkB0ehBkrn2NNk5fnaPkZ
 kQRKJP74+stHm6YkZ4t/oz07DQpREgI5hesiQ0g34qOYKxPPpgM19LbMfTldz23LnxQg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series adds pinctrl support to SpacemiT's K1 SoC, the controller
uses a single register to describe all pin functions, including
bias pull up/down, drive strength, schmitter trigger, slew rate,
strong pull-up, mux mode. Later, we complete the pinctrl property of
uart device for the Bananapi-F3 board.

The pinctrl docs of K1 can be found here[1], and dts data of this series
are largely converted from vendor's code[2].

Note, we rewrite this series as an independent pinctrl driver for K1 SoC,
which mean it does not use pinctrl-single driver as the model anymore,
see the suggestion from Krzysztof at [3].

Link: https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]
Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x_pinctrl.dtsi [2]
Link: https://lore.kernel.org/all/b7a01cba-9f68-4a6f-9795-b9103ee81d8b@kernel.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- dt-bindings: drop vendor specific properties, fix format
- rework pinctrl's gpio request function
- fix logic of slew rate & drive strength
- add power-source check
- improve debugfs info
- Link to v2: https://lore.kernel.org/r/20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org

Changes in v2:
- drop using pinctrl-single driver for K1
- rewite as independent pinctrl driver
- rebase to v6.11-rc5
- Link to v1: https://lore.kernel.org/r/20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org

---
Yixun Lan (4):
      dt-bindings: pinctrl: spacemit: add support for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl support for K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 127 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  19 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.h          | 161 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   5 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/spacemit/Kconfig                   |  17 +
 drivers/pinctrl/spacemit/Makefile                  |   3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 978 +++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              | 180 ++++
 11 files changed, 1495 insertions(+)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240708-02-k1-pinctrl-3a2b0ec13101
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

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


