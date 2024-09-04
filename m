Return-Path: <linux-gpio+bounces-9733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5A96AD45
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 02:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72BE28611E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 00:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145B0804;
	Wed,  4 Sep 2024 00:27:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F7391;
	Wed,  4 Sep 2024 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409673; cv=none; b=W3hN3d2+NMwWQiqE+VYSgsYpR5roNTwuL0UHYO3512B6mcfNlckAAVzwonXSEobwXu6b7JK0EPGH9hCtpq07kEBcHlWfOTjGmNGqW/KlF0yg7CPZfMWAhSXIOc6sZbnn5yaNnkW5LmWJWYnffrBnIk21SwQgutW8WRlTr9LmSMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409673; c=relaxed/simple;
	bh=6onhXgV1s1mDjlTMHyC+Ggv07yKIGjKsJnRg82UX0m0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DhQLnLjE5Y5o+PxkF3SMyaLv7EghHUq9pWQG5dQpzqTyHzDNbGT71wnbH5h/CbhiGQhlQssG6XBgB4KsR3lNyznJJibxFPVSnfOtzi7fxU9ciWk3zcV6rRqxaMXPpqmgzeC+IrENX7ZO9qtU2g4IZE2hiUkteBMLm8C/Qx4BfRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Wed, 04 Sep 2024 00:27:22 +0000
Message-Id: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGup12YC/02OQWrDMBBFr2K0rmBmJE9tX6VkIY1HqWhjO7JrC
 iF3r5wU2uX78B7/ZlYtWVczNDdTdM9rnqcK+NIYeQ/TWW0eKxsC8tBRZ8HZD7TnJc+WMaaeUg+
 OxFRhKZry9yP2dnpy0etXbW7P8S85NI8gEx81QBvDmsWOm8UQHKpqlJGGvTX/j/xar1Bv0CEue
 ZKtfFoXKIIKOgQcdn9INahW5sslb0PjHQqyZ8XUcex9n4LjrtUkLURmqOSFIpvT/f4DGisaJxM
 BAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=6onhXgV1s1mDjlTMHyC+Ggv07yKIGjKsJnRg82UX0m0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm16l2KunxRkOS7t5zOG8f0JH+VIHbba4RUAHEF
 f7si38Obi+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtepdl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ZL7EACG6R6SWRwmFXnCib
 1Xo0iAQSJZHYzudSqhQC3EXT1wuEThyod3yu+g+rzpSpX+tNpBOinudlJY0lYudYujiVxQI4jJr
 5hL5jiGZzbTUG2t6/XgYBaRd0JgZm0Cd0swGUghOH2Dp0blkHi9bHcQzmsPDplwi/HB+X5V4nJl
 2E9EaGZZySQ5RkK4mgY9cA+A7wt4WgGdFX6rmqwFuVZVeCQtmn9FyrfJrGtCqxApwe815anj3Fy
 VeAwzFB8ZsgoaNheOubn5kwHnkK2nSEjFLabNPuYVJzdewmbRINOxWZcIWdHb2z6XF+JJQA8grR
 PoZ0NbTHgahivcKYteEjZuAfvRPO/XnE6YsDPDPBEd763w0XvLpGBifa2J4k46WR54jYm49Y8ar
 fyHbYZdnO6jzzVcI5dDAPqlH/bAKn9MnvWw9xxmqoSsUGOnvDfrB4hmq5QtaE+yyaVGOqPt1r4O
 rLt5yoTfbNW+GSvBFPrvS6GYKd+L/msl4rmAisPsaC2TdnU6pTAsOoZJ6jnaUquRtbpqvVhI8/I
 086vjWh5yRFw7Afg+CnGgf5IlZOmjRENz+0LMfkDFQ3vHln5e9WI0XGHjXoRkhFQXolW/svfd2Y
 JIkdTO2gTMDz/Cs+Y0A1DC6vyB2CZ4F6bVFdWHf4nRKAz2efDeKp2tpnS13hN0qJ53Fg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, failing edge,
or both. There are four GPIO banks, each consisting of 32 pins.

The GPIO driver request one clock source from APBC block,
In this series, I haven't added the clock support, instead plan
to fix it after clock driver is implemented/merged.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch need two prerequisite series, basic dt[2] and pinctrl[3]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (3):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  95 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 454 +++++++++++++++++++++
 5 files changed, 570 insertions(+)
---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
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
prerequisite-change-id: 20240708-02-k1-pinctrl-3a2b0ec13101:v4
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
prerequisite-patch-id: 75272e3a60f76c6dc417ecb3f56626e663918668
prerequisite-patch-id: b93bb35db82d199d4d30deefbc34b8413539cf32

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


