Return-Path: <linux-gpio+bounces-36340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE2gGR9L/GmZNwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:19:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FE4E4A6F
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8201300DA64
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF16F35C1B0;
	Thu,  7 May 2026 08:18:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68E34B1A3;
	Thu,  7 May 2026 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141894; cv=none; b=JVq5FPNlbkfeH8KyjKPihccRRV/t3a8PZDAGKWSdO8FKIlrbJO1KeQquXKNO3bCY9tywwGwvN1x/1XuwovkRF2H6YcOU4m8fVI5bT+WAHolXT+vHBXt+FgL5O3uqpMtoL2MHL5jlH5FhvKr+4uIl9YGYsGu0sn895jiva/AzMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141894; c=relaxed/simple;
	bh=Vfqx5Qig1dY1qweO77x2zmBW12n5J5vgS6VngqGdlZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAubX/XnWuiSdkFtnvcU0OwSzSKY93nPnKH5x4WmDsHWuUuhOipJ/QhtKmjODLCbt62Ix8369z8KGWPKxeEFbfvX8o4EBTKk+gwW7pzL5MWZjIkKE8wQriTmgJeoL5HfE13hMUzEK7VIwwwHCBzSJCu5Xl/4BUilpyyyqYJEedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S2;
	Thu, 07 May 2026 16:17:16 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 00/12] Add TH1520 USB support
Date: Thu,  7 May 2026 16:16:58 +0800
Message-ID: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr45Xw17JF4kCw4fGF1xZrb_yoW5GrWkpa
	9xGF4SyF1qqFnIgr4fJw1UCryFqa18Zrn8Kw13Ga4UZw1a9rW3Xa9IgasrZrWDK3Wxur42
	kFn8WF17C3WYyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: 263FE4E4A6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36340-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This patchset adds support for T-Head TH1520's USB functionality, and
enabled it on the Lichee Pi 4A board.

The first 3 patches add support for the MISC subsystem clock
contrtoller, which contains some USB clocks.

The next 2 patches add support for the USB PHY of T-Head TH1520, which
is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
the controller itself is a properly configured DWC3 controller with sane
default register values set.

Then one patch adds the USB PHY and controller nodes to the TH1520 DTSI
file.

The remaining half of this patchset dedicates to enablement of USB on
TH1520, because of the onboard hub of that board -- its USB2 signals are
behind a switch that needs to be toggled on, and Vbus supplies for both
the hub itself and downstream ports are managed via I2C-expanded GPIOs
(because the SoC does not have enough GPIO pins).

Emil Renner Berthing (1):
  riscv: dts: thead: Add Lichee Pi 4A IO expansions

Icenowy Zheng (10):
  dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
  clk: thead: th1520-ap: add support for MISC subsys clocks
  riscv: dts: thead: add device tree node for MISC clock controller
  dt-bindings: phy: add binding for T-Head TH1520 USB PHY
  phy: add a driver for T-Head TH1520 USB PHY
  riscv: dts: thead: add device nodes for USB
  dt-bindings: gpio: dwapb: allow GPIO hogs
  dt-bindings: usb: vialab,vl817: allow ports property
  riscv: dts: thead: lpi4a: sort nodes
  riscv: dts: thead: enable USB3 ports on Lichee Pi 4A

Thomas Bonnefille (1):
  riscv: dts: thead: Add TH1520 I2C nodes

 .../bindings/clock/thead,th1520-clk-ap.yaml   |   5 +-
 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   6 +
 .../bindings/phy/thead,th1520-usb-phy.yaml    |  74 ++++
 .../devicetree/bindings/usb/vialab,vl817.yaml |   4 +-
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  15 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 362 +++++++++++++++++-
 arch/riscv/boot/dts/thead/th1520.dtsi         | 106 ++++-
 drivers/clk/thead/clk-th1520-ap.c             |  64 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/thead/Kconfig                     |  12 +
 drivers/phy/thead/Makefile                    |   2 +
 drivers/phy/thead/phy-th1520-usb.c            | 197 ++++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  10 +
 14 files changed, 840 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

-- 
2.52.0


