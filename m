Return-Path: <linux-gpio+bounces-18902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A9A8AC85
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 02:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A413BDE3D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAE11598F4;
	Wed, 16 Apr 2025 00:15:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333E156C69;
	Wed, 16 Apr 2025 00:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762557; cv=none; b=eITgtoy3MDDkh67ovR4QvoM5GPfViIiEphcXRBK6SyhEqYZO8abokIIO1azEGWkblGYdDfgrTLlOBc6Fka2EG7cXFBiKBi36XB9PCls3hPgJSsxLrXdi0sYnylY+JoTI5JQNyRlZpj1lHM/JGqa32JdH5MtH/9HebG+ZqOQWn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762557; c=relaxed/simple;
	bh=qlJ8Tc2gUqt6w0CMZd9qhlIpyo4QUot0tlRIcFaOaCw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iyDWazqjzV8pjj9g0zm0FKCQ7ouVEnnBbp2eM8hpWE+MsmvUOmObn9/z4vmwpVZsEm57kMWd+EIUd17CijwpxOV8+4/5yUqdKiPnM2UYGMszAee4OvUVTc9GHSt58XK3/IWWXrTbxamyHbKWqaraqFBUJ/rBg7qLSup2ZU0naRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A4E5F34300A;
	Wed, 16 Apr 2025 00:15:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
Date: Wed, 16 Apr 2025 08:15:26 +0800
Message-Id: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/2/mcC/33OTW7DIBCG4atYs+5UMCYUsuo9qiz4GTsoiUmBW
 q0i373U2Xf5jjSPvgdULokrHIcHFF5TTXnpQS8DhLNbZsYUewMJOgglCQXhReI9LaGVK4brBa1
 WNmoXiYKC/ncvPKXv3fw4Pbvw51en2/MI3lXGkG+31I6DcBNN2rP0iowczcFraYI3XbRKc+Qoj
 HXBwJ91TrXl8rPPXeWO/bNslSiQR/s2KiWto/g+89Jyfs1lhtO2bb/Gl930/wAAAA==
X-Change-ID: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qlJ8Tc2gUqt6w0CMZd9qhlIpyo4QUot0tlRIcFaOaCw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn/vasfKVKApe4VDYSxefpZgPabZvNwvE1uKWK+
 rjFQz47MPSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/72rF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277deMEACFs485MdGS+XOS4e
 RMwkTCVIfA7OzDzWERRAmScNVaFUbp1o6d4fhGgwH6hwyCzkI28+YzjdHraMEmvRBMhw+0DE+hJ
 G4IHHsBFPAWCNMPsUDj8U/KDMmMmwSpJKr1raL8qroNyNxzJRv26icOgB6UTpELgxt0EEzOoqSy
 nIGrC7y+T1Hz1t6fcEevOOTQlAj6LOU8PJljYw/d+LFu3gpXZHhzsfi572nEq2XuzYNBS1vdFjM
 pEIyZzkZSVTc5jA7ry5WSUYdo7yOaiWod+gJvkXI500FqIDQpU2TCwGYKNgoE1AXtO7RXyfCOAI
 jcmEqMxpv2g4nDjGjD1gQV+iPPqPi3ApXGIGIGaByvt3dHbCRnpQLjuOD8WWyIxqxuL8MgIxHC2
 yp7n+B1ggmVDYQQhjLMyfiAK+GpIuZ/cSPbEKXYksC1Rl7xyyxroJs1jk483WGNlygQZF7kDIdm
 fDA/Y7e2krbGshjAya0Au5T+3EXVEcz4DxPhzdH/k5BN0hbmdAdS0oyNA3WAvfSZ/7OwJsGyyvp
 ArAkbffeaVQ0wbwL8Zfl8mlmwKMyxLGVPVnTe+aL9KMq0vu4vieJSQuOouaaSz3WcpHbqEGBFEg
 E6TzdRz9U6SJ2MFjfwZ30tjVVebfEmn74wkBoM41THMrE4ztPuGH1OhFuqJCHMcrUC2Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K1 pinctrl requires two clocks in order to be functional,
also one reset line from hardware persepective.

In this series, adding clock property in dt-binding, and activate
them in the driver. But for reset, making it optional for now.

For DT part patch, I plan to submit after clock driver merged.
This may result dtb warnings in this version due to the mising
clock property in pinctrl dt node.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- fix typo
- drop the _optional_ API
- Link to v1: https://lore.kernel.org/r/20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org

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


