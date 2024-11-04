Return-Path: <linux-gpio+bounces-12509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 983369BB03E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C60328269F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7CE1AF0B5;
	Mon,  4 Nov 2024 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="av9N3dOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BF1ABEDC
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713785; cv=none; b=Md8/Pifqq5cB7KbYAGELuCnIDg03LdbKS1CcLD2sqBfizrN9z01Yf8qKaDJ/ymUvXaTE1OK125+anv5Ab8EkJ1MFOA6RTinxtG5EavG2q6XNTjrG9dA4dIw9cICGkSHmhesgMSIHzEfakeAiiT+4jdx+jwQ+upmLXBweGtexqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713785; c=relaxed/simple;
	bh=yewdgCBeNDS5X0UqwIbubwQkv4OaD91dZIv8bx/l//o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU+/4bWj4HBvr7F3Yre4VecZr17IX5zJZGXo4lEOcJ55NTdZuCZDFXeI+zlcNzYZPYarkNKqgNH+5yIyo0psQRWW+Qy0ZP72PLFlXcqxypp07phJvLdEC+zO6sVaOiaeBYSWpPAmvsyn7jlN1o9smHy9sN1ujQf1NktFQ8rT5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=av9N3dOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B8DC4CECE;
	Mon,  4 Nov 2024 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730713784;
	bh=yewdgCBeNDS5X0UqwIbubwQkv4OaD91dZIv8bx/l//o=;
	h=From:To:Cc:Subject:Date:From;
	b=av9N3dOKfiuyWQK8Uv1/ToD50rlua9XeNgqrnZ1lutpGGqsHrZ3zB2xsVEYJC7nXB
	 g56ponzXC70/69h8ufJ4wZ3m4YXbTAleBvEC5s/2TqVa83mm7Ko0aYlEq/1+GXq5T8
	 iS+/1Xc2g88EY9uswcsrkw7aktm/1aFFb/gmB6rgpat6bS/loCHVwRQ5B23PG6jtAo
	 BGr7frgsIYQ7Gc1sBs8uWQWA9HqwNp1vmYtvg5DUxlrB4k2PUFSXMB7vX7mZ7f0wSP
	 GCZWr2w4WPGsPtZV6HNh3QQ3UI9eMejh10BJC/PbcFrw11cwIS7+BCauD5lhqyuHME
	 qxN0k8XMy+0ug==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v10 0/1] Polarfire SoC GPIO support
Date: Mon,  4 Nov 2024 09:49:32 +0000
Message-ID: <20241104-obtain-grandly-1daad5ac36b9@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WW+Fda9YluU8RwKFsNk2JpPnRNYNkB+lYch3Qi3ZtMA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkaM9a0He/xebn8nB6bSXTZvoS2pD3yoYI5rGrnvA4r5 eaXTz3aUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInwHmb4pxBeanAhsOXe5a4J h3Krj+zX46xl2tcce/HHyrkRkREM9xj+CjlJ+Zw/H5ny3HimjW8j15kV6VrBxw+o1dbUTm54n7u FEwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

Lewis is no longer at Microchip, so I've taken over the GPIO controller
patchset that he had been working on prior to that:
https://lore.kernel.org/linux-gpio/20220815120834.1562544-1-lewis.hanly@microchip.com/

One thing that was wrong with Lewis' series was that it could only,
depending on the iteration of the series, support GPIOs that had their
interrupts muxed or GPIOs that had dedicated interrupts at the
parent interrupt controller. I found that to be problematic, because the
hardware itself always has a mix of muxed and dedicated interrupts and
so there was always a controller rendered unusable for interrupts.
I attempted to fix this by remodelling how the interrupt hierarchy in
the devicetree is described, with a mux added between the GPIO
controllers and the platform's interrupt controller. v7 introduced an
irqchip driver for the mux between the GPIO controllers and PLIC to handle
that problem.

After some discussion with Linus on v7, I've opted to strip out the
interrupt handling entirely, in order to upstream this piecemeal.
Interrupt controller support will be added at a later date, when I've
sorted out the bits that Thomas did not approve of.

The binding for this GPIO controller is already upstream, so there's
just one patch here now.

Cheers,
Conor.

v7: https://lore.kernel.org/linux-gpio/20240723-supervise-drown-d5d3b303e7fd@wendy/

CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: valentina.fernandezalanis@microchip.com
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>

Lewis Hanly (1):
  gpio: mpfs: add polarfire soc gpio support

 drivers/gpio/Kconfig     |   6 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 160 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.45.2


