Return-Path: <linux-gpio+bounces-13870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967E9F13B2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01BA0283BEF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068B91E570B;
	Fri, 13 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGAVCfR/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A3C632;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111176; cv=none; b=CuoMHRps3v0j/4RiydO1q9H0GVE4NRmZNp9SS/DRdTqRRFiCvj1hQGl0wXDkUPHONs+CCMzhU8nHqKqxxdqpsjtY9wHJVAGyXPBDc95ssI9D1aFCWvdMQpVVEEWVeqKLkr+Dhf4qj8Ljrg2OW7JArAwSFQmReTdUkv7ihpgGF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111176; c=relaxed/simple;
	bh=lJEKgDelnzJ/bRVH+G+3ZU4n1kpliDSjZnLzDu3+33A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BoHOD5FgPiwLpcv/Dmp5m7BayRYVZkH0N7QlQr+3czjK/81TA5Z2SFLATr/XRvsi0E8S8+e0GTwGG63ouLDljB7qpP5KUE/ayUtuQBy+DTxWcqN8EF4pGuxYIhnwW3JfOqHWI1RtQP9N6ImLOyG8xau/e+IdsyBZfjssS+g7N98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGAVCfR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44030C4CED0;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111176;
	bh=lJEKgDelnzJ/bRVH+G+3ZU4n1kpliDSjZnLzDu3+33A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cGAVCfR/uAfT9dLY19FHb+1dtrm0fMJQfGxX2+jkpsIvw/dY+694BI0L5SBkR6PzR
	 xwOJh+JaDbWAXzBVctV0cCoR+z5+ZfR1b4szp6gM0VAUvVxDz0DawVi4PBfPRY8rN+
	 sVG+tiCqPXRFvLGMHSpZ5WggPbmpsCqyub2Yh8wfx2ZJO/a6qV7Ddj8vQukqURz9mD
	 WXP79jyR+GFMFnU9OUPY51V9bJqTGC4yijCbe/aVn7k6341zw6ocQfl59fZS/olNyF
	 glf4LbrZIDs3htcsNKTBShQfjtRgAw6/ZYR9J6FuRdoHYRBZKxXj64NVYFTNwapuF+
	 kPMZwHJ0Wau/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BB6E7717F;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/4] gpio: 74HC595 / 74x164 shift register improvements
Date: Fri, 13 Dec 2024 18:32:46 +0100
Message-Id: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL5vXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3fSCzHxzE10zs9REY+OURBMTsxQloOKCotS0zAqwQdGxtbUA7th
 OyVgAAAA=
X-Change-ID: 20241213-gpio74-66ea33da446d
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734111175; l=830;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=lJEKgDelnzJ/bRVH+G+3ZU4n1kpliDSjZnLzDu3+33A=;
 b=nCylNQ9tjXA6uUAwnCBq5dw+48WODp8/N7kS8h/0jbZgk5k5HJTueBtpi5Od4mgQCuuApSund
 CIZ4mxGAhW5BsZv0355VczPRgi/Saf3+MfRulcTSzWL9kST1Gp3ZOUK
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

This patchset adds a compatible string for another part, and adds the
ability to specify and use the latch clock pin on 74x164-compatible
shift registers.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (4):
      dt-bindings: gpio: fairchild,74hc595: Add On Semi MC74HC595A compat
      dt-bindings: gpio: fairchild,74hc595: Add latch-gpios property
      gpio: 74x164: Add On Semi MC74HC595A compat
      gpio: 74x164: Add latch GPIO support

 .../bindings/gpio/fairchild,74hc595.yaml           |  5 +++++
 drivers/gpio/gpio-74x164.c                         | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-gpio74-66ea33da446d

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



