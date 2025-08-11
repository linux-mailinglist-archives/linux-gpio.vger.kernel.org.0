Return-Path: <linux-gpio+bounces-24205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0070B2127A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 18:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10141461D09
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEA029BD9B;
	Mon, 11 Aug 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="i0fGUEqG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C585296BA2;
	Mon, 11 Aug 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930303; cv=none; b=WtRRRAWLcagGvaGPS4VuIj92rH7kDHLcqhJCJTlDIkQmQICYt5HogngZRyCZC1YrPsZXMXzZUwMUxVZSF+yKOI6jHyHetUY8wuzb2mujpNR1F8bWeBPi8bPGOAaJQFow1+QsaVh/VuULND3Wz1/tMPc69kqIxSQS4rZ9xluObs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930303; c=relaxed/simple;
	bh=QJGJtDUL4rrKtgXcv1z7riQRc4jPp+6kVhyQlTJxqWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwKUaF/kR8bKRfnIiABtGPGwmt6ZyGdvcPuVHKNbJFvZ248plUXgbMF6Dyh9oyefnGis55TqdswqZDFdNtY9K7HUvKhYBVop0U1c101uBEJ1y27jpxjuY63o1eC3TUQ8LKHdtliirHiNxNsXUHisV9sVODACBVVIJz6YWNo4fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=i0fGUEqG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E99DE22C1F;
	Mon, 11 Aug 2025 18:38:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJKsrIQ9aSqQ; Mon, 11 Aug 2025 18:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754930298; bh=QJGJtDUL4rrKtgXcv1z7riQRc4jPp+6kVhyQlTJxqWQ=;
	h=From:To:Cc:Subject:Date;
	b=i0fGUEqG05RqLZIZQ88TbQqaTyhJXCN7S0QTf2NMRg3aeZBNZc0QcblTwq020doQp
	 97WjaWNO3jADtolaKg5rMWtQtixRhXOrZzA00YPEHQFJOl+ZWMJVGe7icejcXCHh4l
	 BccTNjyzpivnK5PTCBmCG8X6WObADw9KCnaPcr/WnKCuBRICDD3xaAN4QxliE0Or8T
	 B52ZPpcxJKq/f/eaC8TqHRP45bLUezJYmvfXLSzfn3leC0JPI/xBF2H+JSagyIS9bU
	 KJWFyRqr1jHx73owlCmqZySOsWa3V+iA6CqCcFs6iujQV9XkyW9Jm+fkckRYS2Ru/G
	 o4cnpeKu2Tl+g==
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/3] Support pinctrl for Loongson 2K0300 SoC
Date: Mon, 11 Aug 2025 16:37:47 +0000
Message-ID: <20250811163749.47028-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Loongson 2K0300's pin controller, which is
much different from the previous generation's one: pin multiplexing
could be done for each pin, instead of at units of pin groups. A new
driver, pinctrl-ls2k0300.c, is introduced to handle this.

This controller is also capable of drive-strength configuration for some
functions, with a limitation that all pins configured to the the same
function share the same drive-strength. Thus drive-strength is described
as a property of function, and is handled bypassing the generic pinconf
API for less complexity, since the pinconf API is based on the pingroups.

The devicetree patch depends on v3 of "Add clock support for Loongson
2K0300 SoC"[1] for applying. Further comments, especially on handling of
the only pinconf attribute, drive-strength, will be appreciated. Thanks
again for your time and review.

[1]: https://lore.kernel.org/all/20250805150147.25909-1-ziyao@disroot.org/

Yao Zi (3):
  dt-binding: pinctrl: Document Loongson 2K0300 pin controller
  pinctrl: ls2k0300: Support Loongson 2K0300 SoC
  LoongArch: dts: Add pinctrl configuration for Loongson 2K0300

 .../pinctrl/loongson,ls2k0300-pinctrl.yaml    |  92 ++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  39 ++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-ls2k0300.c            | 515 ++++++++++++++++++
 6 files changed, 668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-ls2k0300.c

-- 
2.50.1


