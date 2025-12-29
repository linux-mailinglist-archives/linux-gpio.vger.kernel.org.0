Return-Path: <linux-gpio+bounces-29978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FDCE6C32
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C95D300996C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 12:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6C731327A;
	Mon, 29 Dec 2025 12:47:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30FC30F934;
	Mon, 29 Dec 2025 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012442; cv=none; b=A7i0RLta1iE8jQXeR58IgDL0AER5Gj8byK1IBvxv6G7brMQJTkZMHoyB1HY4DuJq+bXwD4NgHF+5bBYv6AFPVcwN0KMdQ3gXI95BOPkm3AwtZ68AjDfTvOiWMSER8SAkDIJo3eJ2Y0Oa7k2ObrCVb4B/f7d9OKBDeO1bIhndo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012442; c=relaxed/simple;
	bh=DvF/P/1gjL65Zy3gYiCJA7NSnSH5fV+faqeQ1r4BicU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f13p67kUT6PPJXOS9cnhf6YMh/VT3PqlOtswJXEP9FCx+sZdjOocbv0AlfOobRdFdln+wJKQ0ZQrYOg1sH4k/SHL1kZ3prISHHZPxM43uB7bZtGBmD0zGXzEx0Fsa7qcv+dQIZWhMuGTJKXaoxApJzZ0eaga3LZyZ1HfeHQylWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0AC9A340E0F;
	Mon, 29 Dec 2025 12:47:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Mon, 29 Dec 2025 20:46:37 +0800
Message-Id: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC14UmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNLXQMj3Wxj3fSCzHxdC8sks1RL0+SUNDNTJaCGgqLUtMwKsGHRsbW
 1AO0+2JpcAAAA
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=DvF/P/1gjL65Zy3gYiCJA7NSnSH5fV+faqeQ1r4BicU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpUnhJMZXvUgQB1WyFvfptVeu3MYAZQtR3fPzAN
 DU08sZsvb6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVJ4SRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+35eBAAnlvUGasHhjZStZlVMpBsmUD8mklplKz53hGmV3Z9FvMMC3iMvD5yF
 /j6LIKjJNouAM/QQGqR6Gs3OXAm389MaZxyUjUWD4JMwfuB1UZJnI74wA70V7581K3jLRKtuwC4
 mIdv2fhLfoBxuq7gZjXp1lRGmzTjY+wpES7xIOTKe5lGFpoBmH17PKsCXiTvFNSguicFeOdZMk2
 xb/fNrdbhvDC1ILPi5iL+90XjFpg/JGpvQolayEb78ZgLMNqSE0qcNGElTNmvKi9yeTtDkaS3w/
 oXV421W/NlM6Qss0hDrIMAlmAdMIZI7d4RMj9g0vqQzbykDYHNzpWI1HuvQYLcc6WmBW177Es9z
 QpeJo0cMzaEWAHhtY/EoI5zG82t6+w8Pl7PS0+m9foswvDW6jVyLZ4LKCdiPCdVBLWl1x0uefbF
 bgKEQUPDxkHW4qr3roKFF4mQntF9AF0ZoXcfHiuiCMI9/FKSrEvy6JYw1ulIxYPrboso6NGBw8g
 RkfNLQxWrBKQN0QnV/Fd8Atuxxc8+CN1sZ0YdXeIxqBzHJfuRIlAgMJO0OA2S16JTwWtdONpfWN
 FAOfm4hF3Skdtq2GpbblMRfl6w0VrTRaD1yqs3+0tlBJZWvQFmwTHRpfN/aO6BK9D4PFraUzKsk
 nFdkOVU5Ycb2w12aIHzr1+Ymz8P29E=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce gpio support for SpacemiT K3 SoC, the gpio controller
changes its register layout and bank offset, while mostly shares
other IP logic, so adjust the driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 150 +++++++++++++++------
 2 files changed, 109 insertions(+), 45 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-02-k3-gpio-89b6e95cdf65

Best regards,
-- 
Yixun Lan


