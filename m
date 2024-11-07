Return-Path: <linux-gpio+bounces-12664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E449C0272
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 692FCB21401
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5B01EF943;
	Thu,  7 Nov 2024 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="st8QtLEi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F91EBFE4;
	Thu,  7 Nov 2024 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975634; cv=none; b=du6ueEo6R+X9cwQnmEwiuyiCie4I9ZpKPUX/tUUyyQDPBjhAsSNQ/NK4vdAGMpoW/AljV4JbUMLS3I/eG7Wzrv1qP2J2p99s6VlLEN2wE8uVdBVbRYrALhAgrrm1g8U66HmjNPjMaoLUOr36f8VIz0KuyJx8ASksGri8natoYIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975634; c=relaxed/simple;
	bh=/SHNdVb3iqreTq7YqcqYvk2I7A/Btpfa1SVV5nSIMko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmSMqSe9EFYhJdgP0AKfCF3cetkXBc/6PlYn4ZxV2ozckvfewirTF439TnBYTcwLhqUVFJ+DXrSWN5kyvl1sRORL8dvLeZ7zKaWI0XigpcBxO6kxFyPo1X81Nr/fszPCIi2V17EEFR8eTyiWQ/M+t4etbX0AVjWStGdGOdLZLQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=st8QtLEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E0AC4CED0;
	Thu,  7 Nov 2024 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730975633;
	bh=/SHNdVb3iqreTq7YqcqYvk2I7A/Btpfa1SVV5nSIMko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=st8QtLEiQKDugQRLzQHwtUdZKWuWHndfhJm6A5isLt4uaKQxzr75kLg6JdHJa6pP+
	 fMH7Tt0hYXamdQiZoP0PgLSSQSWb/5pTQdEmxglTJH1dnSLf4YUq+SCEjRkkBb4N68
	 mVZEI254SXh23emOJDln87mIS4NOJKYvcg7Tl3SC0XeC9cuCUtz+3193XhOzzPmYDp
	 N82jkkRfHutbJfVSqEH0dyqe5KRLM3+7R7DxBpfvkQDdUzzBO3iMX6QmXuUizht/LZ
	 9ssS8egAfsb768HqagFUh9tRsoZhKCbGYH28pL1mQIDaYgRIl7fwGLsnXM/g3Pf5+A
	 1b5ou6uKBECBA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] MAINTAINERS: add gpio driver to PolarFire entry
Date: Thu,  7 Nov 2024 10:33:41 +0000
Message-ID: <20241107-chewable-spoiler-3e7dd58d3e8d@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107-avatar-clapper-93eb34ad0e0c@spud>
References: <20241107-avatar-clapper-93eb34ad0e0c@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tjx+KUo79J6Ay39V+4yggVrpVN6p0ZJUyoyr1f8RSzA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOk605s3sz6vjTddGzLV3n658nkHn/nmJ+M1NC7xn7aef KP9YfL0jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEKZ/hn8XCqlfPfp1atXNC vOpyucmNHquYr3VtzJ8ZImqVq6OwopvhD3eR2pG61j9Pwi7yTlzD++vwZOZJ1QJZFeavLhqn/T7 uzA0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Lewis' original GPIO driver patchset didn't add MAINTAINERS coverage of
the driver and I forgot to add it to the existing entry. Make up for the
minimal amount of lost time.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d6aca7ffc0a..e73a0b848bf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19837,6 +19837,7 @@ F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs*.c
 F:	drivers/firmware/microchip/mpfs-auto-update.c
+F:	drivers/gpio/gpio-mpfs.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/plda/pcie-microchip-host.c
-- 
2.45.2


