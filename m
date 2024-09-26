Return-Path: <linux-gpio+bounces-10464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F332987714
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 17:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA0E1C213FC
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 15:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D1815748F;
	Thu, 26 Sep 2024 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PkBXIQ5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D6B14AD25;
	Thu, 26 Sep 2024 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366307; cv=none; b=cIPQBbB44PPoVktM7ytsgi1z+2P6L0YOS3UcoJHMODlG/Vb+9zjm9r624ksBYGlmNys5re0CJMn8ZsziXFUJLqMLRD8aoq8FzSZQzUakXItlNYbw3mwVVaBiDgftVAaKwTQnSd2BgxVR0rXWHzQvSuP8cJVQA3TMeSNDVuVtmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366307; c=relaxed/simple;
	bh=Z74RK6GDCBvqMvBn80RCm+M97q5yuOtMvrMvDAcm1wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QepXQIHw5mp7ECfpfuQ3A8rSWYL0KWavfhz8JPFvldnplSFJceB6VZb3TyTiJFiLZxuWD4qal4G+wrthSkLviRnjVZ5GET1mij5NKzOxK551eiaOIGzxjgLP/6UTLYANZlWtGJpE/4dgKN+k4FEu8IDhKwP16UWKdRP7UQMASGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PkBXIQ5z; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=KWDkrjoA6/ykzZxErd71KJi/pEVk7YvEBlCsaqgAFKM=;
	b=PkBXIQ5zu92i0OEw8adPlMF+Ud/z15PUZAcQIUxpQw0zuTrwxCICTJUxBvkspu
	yPRElNL9gwbQvBlcEDgaJ0YV09IqY6m1NBGHDreVp4AlrE8IGUrKD48g8/k/hqkV
	9cQ1vatY22Qfrx0icLtX7D+WsPJUqAdtKiuTl7ikbDP1o=
Received: from [127.0.0.1] (unknown [27.18.107.33])
	by gzsmtp3 (Coremail) with SMTP id sigvCgBHA3OFhPVmTIX3AA--.42449S2;
	Thu, 26 Sep 2024 23:57:57 +0800 (CST)
From: Ze Huang <18771902331@163.com>
Subject: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
Date: Thu, 26 Sep 2024 23:57:42 +0800
Message-Id: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHeE9WYC/yWO0W4CIRREf2XDczFwYQU2TVOx3Z9oTINwbYkuu
 oCNifHfpfp4JpkzcyUFc8RChu5KMv7FEo+pAbx0xP+69IM0hsYEGEhmQNA9CEZPMfmaD1Q4AWI
 bVO8UklY5ZdzFy0P3tXlyxvncrPUZkq0rSP1xmmIdOobojFZMawcQlAiao1nqgEpI5YNX2Bu5U
 /CvnrAU97gzdK8Vk8dUvwHsiknorfwY+XrFFRd2CZ9SglhzO9pRM/M+z4s2+EY2t9sdQpfY8e8
 AAAA=
X-Change-ID: 20240923-k230-pinctrl-3a323bd75a7e
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ze Huang <18771902331@163.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366277; l=2748;
 i=18771902331@163.com; s=20240926; h=from:subject:message-id;
 bh=Z74RK6GDCBvqMvBn80RCm+M97q5yuOtMvrMvDAcm1wE=;
 b=RiVDUFaEWj4AaVpU1CxiOgApYCNY08NOdG4SO0RuHdUkQ0OkbPPblamkd5lVL6sXcCtc9mk+j
 39RFaDcgePpCI5z7QNAxg6r0MfKSMzfLhD7xOAQnQnuHwNPNIWFi4In
X-Developer-Key: i=18771902331@163.com; a=ed25519;
 pk=M4cXLTlQ3syp0aIw4PNbFtajcroq/y7WBxK2F/jsUWI=
X-CM-TRANSID:sigvCgBHA3OFhPVmTIX3AA--.42449S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry5uF48uw1kArW7Gw48WFg_yoW5Xw15pa
	yakFZxCr1rJr4xtrWS9r4jkryaq3Z5Jr1Yg3W3K34DXF45uryDtws3Kr42qrWDGr4ayrWY
	vr4DJryxur17ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPCztUUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJw1momb1fqM32QAAsO

This patch series introduces support for the pinctrl driver of the Canaan
K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
for up to five different functions.

The controller manages the entire pin configuration and multiplexing
through a single register, which control features such as schmitt trigger,
drive strength, bias pull-up/down, input/output enable, power source, and
mux mode.

The changes have been tested on CanMV-K230-V1.1 board.

The pin function definition can be found here [1], and most of the DTS data
was converted from the vendor's code [2].

Changes since v1:
- bindings: drop unecessary ref and drop unused labels in dt example
- driver: set remap_config to const
- driver: fix double free of of_node_put
- driver: move probe-related code closer to the probe() function
- driver: drop unlikely MMIO error message and handle correctly minor errors
- driver: replace `for_each_child_of_node` with `for_each_child_of_node_scoped`
- dts: place pinctrl nodes in canmv board level file

Link to v1: https://lore.kernel.org/linux-riscv/20240916063021.311721-1-18771902331@163.com/

Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]

Signed-off-by: Ze Huang <18771902331@163.com>
---
Ze Huang (3):
      dt-bindings: pinctrl: Add support for canaan,k230 SoC
      pinctrl: canaan: Add support for k230 SoC
      riscv: dts: canaan: Add k230's pinctrl node

 .../bindings/pinctrl/canaan,k230-pinctrl.yaml      | 127 ++++
 arch/riscv/boot/dts/canaan/k230-canmv.dts          | 304 ++++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h          |  18 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   6 +
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-k230.c                     | 643 +++++++++++++++++++++
 7 files changed, 1109 insertions(+)
---
base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
change-id: 20240923-k230-pinctrl-3a323bd75a7e
prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944

Best regards,
-- 
Ze Huang <18771902331@163.com>


