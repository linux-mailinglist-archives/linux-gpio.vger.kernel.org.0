Return-Path: <linux-gpio+bounces-18727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC3A86B68
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 08:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094A21B82614
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 06:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C071925A0;
	Sat, 12 Apr 2025 06:58:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1628635D;
	Sat, 12 Apr 2025 06:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441116; cv=none; b=SzpRWiohIBCZyx0V9aTCJ7e6obUZ/n3l0KdtbiQC1m7ENkcZ9ahsOHClasr5plSZMOjjCiWVneX4O2INFf4v0sjmgMB+jpndHDw6aIIffMBscHMSpS2quSePVXCREZ875OYCy7yO99BP+U3cpB2lHsu2OjxYaalqJdW7CluF7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441116; c=relaxed/simple;
	bh=QsbjXf9g0KHcl2pW2oeDCXs+ggm19RHnbgB0Jzpj7qA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SBvfAsctEVux4ZhV1ro2IuHQMUzc75NY2jCVkyo1KHDYpHZX/9FiDQZEDQkgXoodwmmmG2fRU0FIhIQzdRwBt9Rdn3xSM+AG4tJ4dAlS2zY/LPumfDVz2NW1RZQGJJZGy2IQ/sEuIYelSVfs+J29fWmqZJCbpLedmfvF9Kw1wvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 83F6134375E;
	Sat, 12 Apr 2025 06:58:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] pinctrl: spacemit: add clock/reset support
Date: Sat, 12 Apr 2025 14:58:09 +0800
Message-Id: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAEP+mcC/yXMywrCMBCF4VcpszaQjGlI+irSRS5THXrTpIpQ+
 u4Gu/wPnG+HQpmpQNfskOnDhdelhro0EB9+uZPgVBtQYiu1QiFRjEo8eYlbnkScRuGMdsn4hBg
 11N8z08Dfv3nrz870eld6O0cIvpCI6zzz1jXSDziYQCpotOpq22CUjcFW0WlDiZK0zkcL/XH8A
 Epo7/KvAAAA
X-Change-ID: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QsbjXf9g0KHcl2pW2oeDCXs+ggm19RHnbgB0Jzpj7qA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8MCzI4xaMkCaGqmhNnl4gmZ0/osJbfjon2/
 pBZDSlZ5WWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPDF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aXPD/9svBo5ReNzesn1DC
 jmQYaxMpduobLF5moqyjeGAjXr5wuJ9sEgBCb7yN9IDYtHiXzne03GirwGAAApzyrURJZ7LlA9a
 RkqVPMZwGfnj1gxO7IBbj3rGvOWYB8p8D0j/3X8ZePDLXap1svdcvNFZWSHcsafFC6MBz6lrzBc
 IFJHhD0O/sNUKuIt8FYeZ8WTq+aDjCoKFCMmCxiU0wnn7Tpw7hOEwgwtDbf+tQVAFJ1ZzMx4OF0
 Uxg2vAHEJK8M3TM+iP7l8ATnOetfybw3myF+hbMHAKX47SB21wr3ADkkHg5DSvX6FDSkFr4+JzJ
 Slpi8nFXlbO6aEXe2D1lnijNdrqb95xlPECCJN0k1pmRSet0/Z2ZDCVWtIg6Bg/i312ftf0lu3Z
 +Zv/Gvx7T7x4EcaBm5MBANopZ5k1LxXABSpBoYOweSoCYjjZDDUam4Ee+sbAkeOTws4V65IMPh9
 7G0eTwMnj61QhvrujUrvfVEYCFKZGnEHPxvTiwgKA0E9gzqCj6viSrwsZiXZv7gpJS//sLWFrth
 xptM+xhkRlcz/HXf1dyi6iO+Nbf2f23jmZeeMXwFw5c7hfZtGGxJWnbbl0hDkAkVinu9mCbPmuD
 cyVIlucKZ608TnWYtqwIWixliFsWOzG4uw8r7XIGa5txNFK1LHs6X8R+6QAyIwGubeFQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K1 pinctrl requires two clocks in order to be functional,
also one reset line from hardware persepective.

In this series, adding clock property in dt-binding, and activate
them in the driver. But for reset, making it optional for now.

Notice that, devm_clk_get_optional_enabled() API has be choosed,
which will make old dtb blob still functioinal with new kernel.

For DT part patch, I plan to submit after clock driver merged.
This may result dtb warnings in this version due to the mising
clock property in pinctrl dt node.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add clock and reset property
      pinctrl: spacemit: add clock support for K1 SoC

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.c                  | 10 ++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250412-02-k1-pinctrl-clk-9649d6ad22c4

Best regards,
-- 
Yixun Lan


