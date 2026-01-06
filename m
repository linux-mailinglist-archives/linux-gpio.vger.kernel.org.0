Return-Path: <linux-gpio+bounces-30175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15ACF68EE
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 04:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13F2D3008C4F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 03:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43FC21A92F;
	Tue,  6 Jan 2026 03:09:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6F3A1E95;
	Tue,  6 Jan 2026 03:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668993; cv=none; b=YUYlUAHGwgBULcxONHXf/Ogw4wMPMevdBWXlI1stjBxW5DEKwYmPm5GFRpyNbMQGD80/XnV409phlFL2kk8+rKyNyae11SB1+kZYfyGlDlEpzohYUgsCeFsFF9jZxzHc+86d4DNj6wErQ0aiO9dU7ln83LGWryO4YP6+X8gTECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668993; c=relaxed/simple;
	bh=KD1oy6BZNEd6FReBRpFkWMij6GCuCmsGS/RrQ5+b7sQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DeO7xNeAX7gd+56gS6A2qxLszvzghmex2vnXWn2QM3TG5zoajPmJ65CJiSsM8/MAz4tEcFm4/827r6TMHtU0AT1fBkXIwnCyi9u91BKPtbpGs/YwPVwdsFda1nW7c4gicsunGwtNWJHBZ2GVR/oZVnCrg18JjgqSzZSyLO9fazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B789340ED8;
	Tue, 06 Jan 2026 03:09:47 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Tue, 06 Jan 2026 11:09:31 +0800
Message-Id: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOt8XGkC/23MSwrDIBSF4a0Ux71Fr1VjR91H6SCPGyOFGDRIS
 8jeawIdBDo8B75/YYmip8Rup4VFyj75MJYhzyfWDvXoCHxXNkOOSiBa4AgvCW7yASrbaLKq7Xq
 tWAFTpN6/99jjWfbg0xziZ29nsb1/M1kAB9SWjDaVqpvm7micQ7iE6NjWyfizmgt+PVgslhtpj
 JFWVaI+2HVdv+lY+ejhAAAA
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KD1oy6BZNEd6FReBRpFkWMij6GCuCmsGS/RrQ5+b7sQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpXHzys7SYXHsuJ+qzfW4i9RLnYCerTUdT97kfA
 xQ8ZmC8+I6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVx88hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1Bng/8CkIoBd5fnVv5W2zXHkECrMh24tL+3muE1GfQ9Y7ggNKMuMhGOdo7/
 QnsumQ/8fYml0PghxlcM2eEAOEjKdDBUquZHMP6FEX7YgVrAecmqmPARtUrHgUXAGSvT0sKXdrZ
 3svP5Ax7TrFGIG7l5a4EWHtdPrWL+fgeS1K7bcKahSRGiOvrsiaugV2qvfJnK/iYFnRB/UuDzm6
 wr01+Qe/9F0W24iss0bSibNqbMHM2vKDhfGdaEaRrLaZQT9WgMnbjJe9e81NN3lYCqYFDbmQRNq
 nbYGd/a/fAdm1/N0GtcUvyMe85oh4P63g9J4nPTyjyUwPYx7nVV8/1G9xVprz4LKEx77FUZsfhx
 kKhF6ANTgXqVuzrGp3bm4lgHqGYIn1gvZD+AnsH8MDzTJrE2vVr3hZ6AsQyyRbsz5A9bqSN2c+k
 nRayOiK5liodR3j04vCBGKVqdJbZ778QMdBOO4R7TICBLjvfBpQn4APr3i5RguPiLlnLJOi0RmO
 O6Z4qBH/lYZKGESgO0q8Jsq1DohIyhh163TX0zVYvY0R30xAqrAkW0JSAEHvLHB5Vx2yeChI4th
 G6Y8vgFAggtp0isM8Z0OKCwEkyM2JhbVAV2lgmWi2+Khi4sYhB7n7UP9z0LlXY7KakFXx3wymvv
 FCzNuScFhEMA3j8ih0g4X29eCUD92c=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce gpio support for SpacemiT K3 SoC, the gpio controller
changes its register layout and bank offset, while mostly shares
other IP logic, so adjust the driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- fix enum coding style
- Link to v2: https://lore.kernel.org/r/20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org

Changes in v2:
- collect tags
- refactor gpio register read/write, introduce helper function
- Link to v1: https://lore.kernel.org/r/20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org

---
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 163 +++++++++++++++------
 2 files changed, 120 insertions(+), 47 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-02-k3-gpio-89b6e95cdf65

Best regards,
-- 
Yixun Lan


