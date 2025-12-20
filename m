Return-Path: <linux-gpio+bounces-29776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B5CD2D17
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 11:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84293016CDD
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 10:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB08307494;
	Sat, 20 Dec 2025 10:15:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192B2609E3;
	Sat, 20 Dec 2025 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225736; cv=none; b=OXAlWoXWW7Oc2wouX9VQDzmL18ExoZjSitMkf6zEVHvM/jvySHYm3gQfusYZA8/EyeSC4+eDxdzgmE0u5tTyejON8oCBmIZwL6dMJdFzEjmQBg5txRV2Q/Ujltaz7uMMcgO/tRyKS6HKwqT6atSrGke4yVVQzXv1tSZjktpI3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225736; c=relaxed/simple;
	bh=CWrajBOGSouuszgbzBF2LrNrwqQq9PQ6TusWyaPtx+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sImN9fX95xN0d44LNFGNZKLcY1+FPfn5vHCjUMgipzEvRzdq5LhEvVdUASdfEremF3Zt2H5fTXDiNt/G2N4JZ8GFwBoLcoEgTLybrUTmCfw2apxqlLR/d3yzhjTYiUYRCeM4Z0wj//KMndsAJltlOXcyUXnHGF6JrZQt0kSSHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 83605340DD9;
	Sat, 20 Dec 2025 10:15:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC 0/3] pinctrl: spacemit: add support for K3 SoC
Date: Sat, 20 Dec 2025 18:14:52 +0800
Message-Id: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB13RmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNTXQMj3Wxj3YLMvOSSohxdc2OL5KSUlKRUE8sUJaCegqLUtMwKsHn
 RSkFuzkqxtbUAdHHQYmQAAAA=
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CWrajBOGSouuszgbzBF2LrNrwqQq9PQ6TusWyaPtx+Y=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRnc1IYiyHDAw0s9avPJXNC57Vz9j5yjYhkvmp
 r8H7jw7N8eJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUZ3NRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+39KxAAlGg9cKah8u40Gq/cIw9w78SLxP9OzFytJvedh837+XVanDD32avjW
 buvoT150qcLlm/XppSiVaYU11T2arSyhy6A1BtTCsHSm9SPXqoOqd31+Te248g+KAmnUwWylO/g
 M7e09nOx+a4qUns1z7C2J69egEtmyGIUPJrz0Ocz0V1ysKCHIlWK8ey8JAWdDbovR6iwXNBbmDO
 GsMivrpuazzpGhWbyuDtyjSfGfbkp+MYf3576jSQjSX3hIl4VuOk5dG/aS5vQxELJJh64mE/rdw
 UvkaV/cV1fC1OmGL1WluFO1zZu4okjFo6Gep2+WLAxnIGgl4vgntPhMHOn/YqnExjXtPIrs0QOi
 RJZsp421KshqtsT9h+E+5y/K4zQLr5NxvtFrtViBDn624xb4VDplHuAQnU26CERvbG6AYjA8E8j
 0EKDAgFCRstJOqiky4dDMQT9B3XIcMz1fnXKOzRqFuGUayEOXZnDhuSOrUAkppsQLm5ZViiCA6T
 H26tZGIcvkpDOfwEmGuksepw/OR+LXeETbSgZoX9Il57K+qsb/UTqHGjLnNgWSnt7B5HUVgr4VM
 8R9obMqh/nDaLNEbyQGgbnlWDXJq5E3DAQzEobe378ksmT+vqtPsh0Eblpo71gaW0+nl3yPx0Nr
 2/tucQGJXRLufw1NVj3xcAeP+rQj1g=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series attempt to add pinctrl support for SpacemiT K3 SoC,

I'm marking this series as RFC for now, as the driver is verified on K1
SoC platform, but only tested on K3 FPGA, since K3 production SoC isn't ready.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

The patch #1 try to add pin support which should handle pin mux, while patch #2
adjust drive strength and schmitter trigger settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   4 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 471 insertions(+), 54 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251125-02-k3-pinctrl-738cbddbe49d

Best regards,
-- 
Yixun Lan


