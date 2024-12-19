Return-Path: <linux-gpio+bounces-13995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8779F753C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 384FC7A2734
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 07:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B31216E37;
	Thu, 19 Dec 2024 07:18:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300422163B7;
	Thu, 19 Dec 2024 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734592707; cv=none; b=IYIFQMEIo+e7diO5jw6A9b+jklPfo3uh0Ds/ioB7x1yY8Gxf5dLWXe9XaUC3p+3E/cA/ZRJcHyS8s1pyCiZiwFafqzzFV2r8Z2EfdUNGdl94mbxWhRqu4tSdNHzCMCWvhvNoonYTzR1f5sB5YaTF//j6ntlTcb5HchLG2GJbTDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734592707; c=relaxed/simple;
	bh=cSy/0z4rfqplmc3CfVSYLZJxU/ISPa5X+jCAM6Rw9tE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u5Ac3FEkKohgkdPfoSiziMzec5kWxnbn9lHQSV9STdPO2LnK6O9RexD5fuF6ls6Wr7MeLXSXr+cOurljq4X1E2jLuY6ssakY1nW3Xwxu8LrW9Q7kSblolliwdMeDzANoUkhjX+w44/ycv2Qg45wC2SIyVaaXza9nisuo2//1G3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 19 Dec 2024 15:17:42 +0800
Message-Id: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJfIY2cC/02Qy27DIBBFf8ViXaqZwe9V/6PKAvDgoDbGxdRKF
 Pnfi51IzezuSPfMgbtYOHpeRF/cReTVLz5MOdBbIexZTyNLP+QsCKiElloJSn6hHGcfZI3GdeQ
 6UGRFLsyRnb8esM/TI0f++c3M9Fj+I/OFHVhTvdMApdGLt3JIErVWyMzGDtSvlXgVebYayBq0F
 2c/2RS/pdJkgC0qBHyWMpClDZeLT33RtEPpVMmEWJkKG2ON44YtDICtyVO7zoBpxa599ksK8XZ
 8yYqH93G2g/L19Wv2ljU0xIbZaoaPkacUwnuIozht2/YHkExudFwBAAA=
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
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cSy/0z4rfqplmc3CfVSYLZJxU/ISPa5X+jCAM6Rw9tE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnY8iu1SI5F458BZDzsrLZY31MViz4vVG5jad+H
 d25lBaDkC6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2PIrl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UGND/0eGR5E20nhJs1p7j
 QykABAAfgoIOw3iOtI1+89p1Sag28+TTD4M/dKt4zPgev4rK+RQMqo3SKxai7qNzAefveaS0J8w
 3zT4iEUBVmkSL7dUYW+5RxD8wcoYOPZbaEMLQ9jnmsoOM/D7PvekAnNKj2ZMZte+gxbpmnhaP2t
 aHs4BAOMt97yFOciIBowztZuGQvCpPhQqZiBc3jtJoGpQ3xHjvTPxiE0mmPc+N/hYhXVq+1qVq+
 hXAuVGwFuDU7Rz8PnQuEKhtTqCtOOOK6zxraK/P8ZbN2KUhzeIz4Cb+qdspparTN73OplUIAukJ
 NyN38da9HJr6u5G5oJHfQAX2IQ6gcxgdFB4v0LcZUXkHecZqrS3CvDNN6n+2ViTzyT4r+kSxmYE
 pPsNFYFJxCDf1iduSbAg0sCIctTg8nrUUAVLItNhKtLBgOrU81K8PvWkbSrfUL4zuBtuX46jqqE
 MNg1zx/vP7Q6mUayY6dSN7qIzlSK1P663Jx9kGm6ElVHI8/h3UC/mSRmQZwdoscPxchEEaKTyOb
 PfnYDpVxeoPJpY282gFqo8dtxCT2+pf9lxjuxFgDM0+QGym8NXShFqwd/u+PFzIY/LARzR70X5a
 UjkeQC76rhMFvKwsU3/bLSDeE/lydoJAmuNbWg3Wvo4SjzxoS0h8qP92udFYkH1+mIcg==
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
Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (3):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  75 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 454 +++++++++++++++++++++
 5 files changed, 550 insertions(+)
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


