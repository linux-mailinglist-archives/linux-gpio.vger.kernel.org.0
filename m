Return-Path: <linux-gpio+bounces-30038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5FCEDBF2
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 08:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22F83024D62
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 07:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DF72D2496;
	Fri,  2 Jan 2026 07:01:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D912D2389;
	Fri,  2 Jan 2026 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337270; cv=none; b=HGvKY8ooG/XwnNof0LiSyEifSLPRh3T4Gy4QcLHr66/HOya5itHIULNWuhiqR8Pqux7FO36V5ESPQ37OFEtw6pgkI+4TJFNZ57NqZkOaBfHwfygpYlG9ruaq8FJcV4YL0JspmKohvHtUTFPumoHb00pGJM4GCCh9vyEGHH7geUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337270; c=relaxed/simple;
	bh=69PQLPKoqWb6cQvuGJn9afGQVIg+yBDRX1uUJsZpzgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oKFYoDwaA/j8zffZoVp4lMc6wy8PEv6uzr2hgUbp/94abmc/GDSTgWBDIEDcruPosrf5d1ut8hfuyd6ErYjjWvYdqhACtucuIenZjkal4aVjefSKHzpkLcr+y8c1C/kV7ITur2nBVAL1NU6gIUHhrmhw9ZJFX/hMAq09NRrKnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 27798340B10;
	Fri, 02 Jan 2026 07:01:03 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/4] pinctrl: spacemit: add support for K3 SoC
Date: Fri, 02 Jan 2026 15:00:21 +0800
Message-Id: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZtV2kC/13MQQ6DIBRF0a0YxqWBj6J21H00HaB8lLQBA4a0M
 e69aCetw/eSexYSMViM5FIsJGCy0XqXhzgVpB+VG5BanTcBBhXnUFEG9CHoZF0/hyetRdN3Wnd
 YtprkZgpo7Gv3bve8RxtnH947n/j2fiUAdpASp4waaUqFSjLVmeuAbvb+7MNANirBby6POeS84
 jWItkbZCP6Xr+v6AW5ZYaDqAAAA
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=69PQLPKoqWb6cQvuGJn9afGQVIg+yBDRX1uUJsZpzgc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20fvSmFcJ+gdXUQ4veXnZMfiCg7QkDEKvOt7
 aJw5npNG0KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtHxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0iDhAAg+cH2Tsc5vxW94yBuFrbq89p0wqJJqP7Me0Ke20VAd6yjIUHG3fED
 eiA7XBPX3KlQ46Xruw24iP4l7MDesnUBmvHlF/kpgjNPMnSlcKdWml8P1qvp6ieVK09XUwku9Ni
 8mw1paUhjfmwuPzvwfuXciWwAwIziuHqWERRKgbPjdeA/5cH71cs1bwMV9rsXF42k1/4FYsnPrO
 EaM+85WDyq3QOgFGgLIwFpr2FJZdOV/QnFdjY1w4WSGrzaoVLv3PAHZ2He+bp6pR3Of/RSZJETs
 57/O41KcjDpHerO6I8KD8HdsESDcCJWCns+XuepxqFoo8+WkmybyZgeeMq1/hIrL89o7uW8VBrh
 kBPz5JzinAuS70hCo/1OZpAJuN0Z72tynamxtyPE2/Q9ontSHmJz2d+6YBIeNCNja0TLk/Up3d1
 RkaVi7NRoPQ9ceOFzEHIRTnlS0bM5+gqhmY5/iinSGVV8ChfUq8+kYcJlWCwmOxIQkELmsapstG
 /DwTnH4F7TG8YPwLo7E7vb8xe9kW7tIWvJo1zDoBpRyE+nYr5dIdk141Y1BQECLhHMzQCH2a+sy
 hqLSsdMrFE2OceEo0O6le8SC3z//qNfoAp9dpNrTXfFSjjt7yeVtx9lrQiHknYLVNIner4y0WNU
 RVmvCEUMkP2odenpPXURFla+wgmNsw=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series attempt to add pinctrl support for SpacemiT K3 SoC,

I've removed the RFC tag as the driver is tested on K3 SoC.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

Patch #1 convert the dt-binding's drive-strength property from free text to
a more standard schema format, then patch #2 try to add pin support which
should handle pin mux, while patch #3 adjust drive strength and schmitter trigger
settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- convert drive-strength to schema format
- Link to v2: https://lore.kernel.org/r/20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org

Changes in v2:
- RFC tag removed
- update dt-binding docs for drive strength
- fix wrong argument for drive strength
- Link to v1: https://lore.kernel.org/r/20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org

---
Yixun Lan (4):
      dt-bindings: pinctrl: spacemit: convert drive strength to schema format
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  22 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 485 insertions(+), 58 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251125-02-k3-pinctrl-738cbddbe49d

Best regards,
-- 
Yixun Lan


