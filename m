Return-Path: <linux-gpio+bounces-9125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639995E37B
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 15:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78FF6B210A7
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 13:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7E3154456;
	Sun, 25 Aug 2024 13:10:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D129CEF;
	Sun, 25 Aug 2024 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591444; cv=none; b=Vx3YCY0G7A9RSS6jwmEzHC1TDm/gTxXI0JpevdqEbgzd1DcCxFQ/TrgEgnvztCcLBgxIERpHEPMP5QRHESKHm99cFSiUV3Q+4goLxNT+FJEYxsh0LPkuKzt5fOmj6GKni9p1dDu/u7Jv2GRwD0wCKjoovpULN0kbuC17s8Nr8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591444; c=relaxed/simple;
	bh=Mb2l/czd6BaayP/ofbPCL9dm1Wu0Kio9yNMkYFZ5ohQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=naoEjH+eONr5cjB7zERtV/ld9ir8/EAmn2bcOipCRARVNYgmps06D4QiOLKdwR3QOp6uool0zGOAHpIdvfsdBwZRyZGRYRhaTnx/kBBrrgO/tfRX+OXXPoVkKqF2vN4Bj7X1LMhpePPIXH6qy5psUPgT/59tVgwv3VHJuYFDI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/4] riscv: spacemit: add pinctrl support to K1 SoC
Date: Sun, 25 Aug 2024 13:10:01 +0000
Message-Id: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkty2YC/12Py26EMAxFfwVlXVdxAgmw6n9Us8jDMFE7ZCZJU
 asR/94Ai0pdXls+PvfJMqVAmY3NkyVaQw5xqUG8NMxdzTITBF8zE1y0XPMeuIAPhHtYXEmfII2
 wnBxK5MjqzT3RFL4P3vvlzIkeXxVbzuEftT7ZmUqoHcgRrMnBgS+AxkgkIuu8GNdu59YdgYu3W
 yhj01lScnI4TM6Y1gmprOS6FbztZad706mhV0ZqthtcQy4x/RwFVzwUzi44/OuyVgsQcjCus1p
 7r95mWkqMrzHN7LJt2y8RxdaHLQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Mb2l/czd6BaayP/ofbPCL9dm1Wu0Kio9yNMkYFZ5ohQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy0+A+C8AVtH97JWOv0N6fm/REYW1Z+2mlBhv
 tWuSBXXD1iJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstPl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dyKD/4yb+nUy1tuI3F2DJ
 YEP5LSyuSHjmb6XKB4Nnr9UO6LAjJ6JVq3w3Q69k6CoaGFFzQZ3myWOU2BsfXHP3usJK740EPMc
 JIoPYAihX47pwlTcDgwOAWef8K2HQl8gFYH9oSyj80369W5cxAbCwBO3BWGhEaQhmU5eLBx3Rnh
 nLDAYnn9DvYCRhVDwNNYQAL4tWsd/CcZNsCR2d/ThwEcKHZkQ9YRcsIMbU0GhJFpGOQxAsvLaEj
 2tu9xOhYy6nMNwuT3+f4+4tk4LejJ9EEcxND5O85aTFH+CoseKyfHqRYx7yhZZ58K5Vl41cSAfE
 NNp8JfxJ0v9wmzISAX1XZgFzG8iBBLNdUXl8Rxoxer3pKqNRO6LXeMlXohJlWNIerzj2JiHqmlP
 FWOVJun3tP7xVolgzD7186CJluZLmo35nWXxmuG3nxTr/0vOT/Mc+Vh5Hi6xzfaJGn0B9Et/r6y
 Lx7k4CGSmRyDU06to6if2ptONOsyI2wmU7L0WKeQTEjuQ+s8GyTmncnGf3E1ftYUNinbAYtGRFE
 nNzM5RMH1bw+8tKCVf0MD68g/r9uN/+K5eP/DRJzHgeEOuSB+VMvvulj6fVqmQNXeq0wvlkgyqS
 S0VgblZdwa3MFtGANm57A6ruwAY8B8dl+Eef48OyJrT3GFdd0jnNDMU0+wF36HZsYZ1Q==
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
Changes in v2:
- drop using pinctrl-single driver for K1
- rewite as independent pinctrl driver
- rebase to v6.11-rc5
- Link to v1: https://lore.kernel.org/r/20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org

---
Yixun Lan (4):
      dt-binding: pinctrl: spacemit: add documents for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl support for K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  134 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |    3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   19 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |    5 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/spacemit/Kconfig                   |   17 +
 drivers/pinctrl/spacemit/Makefile                  |    3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1012 ++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   36 +
 include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  |  161 ++++
 11 files changed, 1392 insertions(+)
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


