Return-Path: <linux-gpio+bounces-11392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C399FD98
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 03:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FA61F21AB3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 01:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D041531E6;
	Wed, 16 Oct 2024 01:00:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58554D8A3;
	Wed, 16 Oct 2024 01:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040414; cv=none; b=bTl1gFBLj0NVGegTHS6vwbuonnCTnEaVqAA4anIJ3EG1E6Ubiq1ULytnZ6P1wtz0YDdG6XVullp5K7yxLxx1S9/RtUjhDocLbhKFYnauNZMkpz3xulAtsdedfLRhqXJfVXBmCtZdYN/sHUh0T6jhy/l60/wxLkX4dsXGVKDyYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040414; c=relaxed/simple;
	bh=m1VUI+EZECZcevasXOFd/3h0Gr5jZb+DGduOzbAYbnA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nIto/uE/H1cJlNhN1jrwXN6Af1u+drZBVdUKy7y5xbse3SLjW801t5bq8JO9Ea3CNo9odDqspKTtUIpuC7EKyKcYsQYDQREl4aKgUoV06fHL4v00S7KBqnx5Zv2VoRtKLBZk5vT7Q9ZN0MpNSgIx/cN6y3pjK//vNmEdiqJ35GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5 0/3] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed, 16 Oct 2024 08:59:40 +0800
Message-Id: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwPD2cC/2WQy26DMBBFfwV5XVee8QPMqv9RdeHHJLHaQGooa
 hXx7zWwoCXLa+sc3+s7GygnGlhb3VmmKQ2p70rQTxULF9ediadYMkOBStSi4QL5O/Bb6sKYP7h
 06AUFkCCAFeaW6ZS+V9/r25YzfX4V7bgd7ta2Wp0GzSIUwL0bUuBx5OCcBCLyIWI76cVb7oiH/
 npNY1s1ZNEGr5UhUhisMxBRnRwZYYQmSxIsSq3Y0uCShrHPP+vACdYK2xawhy1TacFRWhe0r+s
 YzcuZurHvn/t8XlUT7niD+ohjwWOMsnFS6Qj4gMu/+PEnJ1lwOFE0DtGTbR5wteNWyCOultdrE
 4RwUnr0//B5nn8Bn6oYAOoBAAA=
X-Change-ID: 20240708-02-k1-pinctrl-3a2b0ec13101
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <mr.bossman075@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=m1VUI+EZECZcevasXOFd/3h0Gr5jZb+DGduOzbAYbnA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAKDEkO1hSwheR+MyEDdoWYi/VA1UQtVrNEp
 QEJPIeNz/mJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QCl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aEMD/oCwkOX7Sg4hz/jAT
 NhxuO0OMoZtOaimxVnbbmmu47WN5xlrC82n8EJL4Y1aOE/L9PlSNuiwrrjbPH+DIeB38C0rtMhf
 JhTb4b7dLLImJdc9OAcM7Hud0JDIzSDI+sdVWAbM5r9YNGq52sptHMJtJVmei6ZBdFfM9nfTnoI
 OPDiKpVoTM1PIxjQ/+/azPu47602PwBNHQyqs9BaaQlVV2x1k335UeTMfd/8KQ2IP22W4I5+6Di
 LB6sFFUFzwIaHfRpboTm+vynisb+sllD3FbpRcuGX0jQZMhneFgI08yXpgwrMCeM02J9rdtxOeu
 ilE6Z45r3gvjnYoLUXhcnZSFVJroVE5kUIFNZtrMvrlvLnIi/FGOof+X7Ky8Ar7qC3r73d2Jn73
 xlu9Lf+fXkmcFGW28PtzvwVX/vGw1QfWq2bgnnwVPJRcdR1IY1pUOtyw0swHVd2v0pNVfQWZ3ve
 EObktGj0P8Kwy88b5AQ86ZXKPzD9ZILQbV+F1iDtmKGvyM36Ig5Sfz/6lycp+9+iqsFAl3k17mb
 8EHatpXVDhcMZq3/20mcZV00bHM+lt5jLPj98T0WNO1n9ORO2nU/l7mFIxeUMdkt7MDCn+l6pZ5
 7cuCzR51ld2TUUaCXF63q49xXeDvRcb3yy013hxf3GcbZipXAdfuOV2et35HKcBJGO2g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series adds pinctrl support to SpacemiT's K1 SoC, the controller
uses a single register to describe all pin functions, including
bias pull up/down, drive strength, schmitter trigger, slew rate,
strong pull-up, mux mode. In patch #3, we add the pinctrl property of
uart device for the Bananapi-F3 board.

You can find the pinctrl docs of K1 here[1], and the original vendor's 
pinctrl dts data here[2].

Note, we rewrite this series as an independent pinctrl driver for K1 SoC,
which means it does not use pinctrl-single driver as the model anymore,
see the suggestion from Krzysztof at [3].

Link: https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]
Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x_pinctrl.dtsi [2]
Link: https://lore.kernel.org/all/b7a01cba-9f68-4a6f-9795-b9103ee81d8b@kernel.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v5:
- drop unused include header files
- convert to xx_of_node_scoped() function
- use u16 type, drop genmask
- use scoped guard lock
- Link to v4: https://lore.kernel.org/r/20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org

Changes in v4:
- squash dts patch (drop patch #3)
- collect review tags
- Patch #2
 - fix pin id mapping
 - improve pinconf debugfs
- Link to v3: https://lore.kernel.org/r/20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org

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
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add support for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  124 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |    3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |    5 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/spacemit/Kconfig                   |   17 +
 drivers/pinctrl/spacemit/Makefile                  |    3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1051 ++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   40 +
 10 files changed, 1265 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
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


