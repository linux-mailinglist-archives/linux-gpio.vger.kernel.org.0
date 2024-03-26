Return-Path: <linux-gpio+bounces-4624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C688B658
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 01:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA721C37DB3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 00:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C1D1BDE6;
	Tue, 26 Mar 2024 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LN5TZGHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A11BF27;
	Tue, 26 Mar 2024 00:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711414156; cv=none; b=ixpJcckJCNXlQqPsx7HPzXcTYy/tV/R7ea6U1IZnfnItZNUQA3quCu93pIvQadChUXpiiaRk/QWvVO+yUn3/uY2nvJnGoZD+dahEzcYTchA4zqwVguPBwjN54PgvVnrMkcB/BV6BG2UQNXlF0GB4FOXlBEBUUbbKozAEe5Kgsys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711414156; c=relaxed/simple;
	bh=EC9HhPXerzp5Fo0AF0k/kBYIkC/0aEGnQvwHNhkYz3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/2e4KWZv+E/EmDnup1n8JjHTKWdXy+xLoJsLKD1xSnWzQmWVSrE+dqW+XA+CU6YeBxTWHSxB9fFZwgdOxqLRQNLkecWnCslWIBuXNibsJ/gXXUtO2NAyevS4zgcM8+Q8S1bSZeQ0jH+PmKobPMQ9femBntGv8XKVj0FFpKcwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LN5TZGHm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D95463B;
	Tue, 26 Mar 2024 01:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711414120;
	bh=EC9HhPXerzp5Fo0AF0k/kBYIkC/0aEGnQvwHNhkYz3c=;
	h=From:To:Cc:Subject:Date:From;
	b=LN5TZGHmtFjQ0wccl33XzbHuWR3hJ4+Iw7xEwzqmvSBXjRz1SmcBWHP9ues16wj0R
	 bgW0XLZXqNyZJvAf1pyEcfc8W4u3iVIV3cKCLGx6ZgwX/ooVZsUnQOKoG0w1ehcpow
	 sNZU8dKvfqm5OxKINkBxLQP46gvvea5AmHKk2uyI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Drive-by fixes
Date: Tue, 26 Mar 2024 02:49:00 +0200
Message-ID: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small series includes two drive-by fixes to the
raspberrypi,bcm2835-firmware DT bindings that fix validation errors with
the Raspberry Pi 4 device tree sources. I noticed those issues when
working on the Raspberry Pi Unicam driver, but two patches are
independent of that work, they can thus be applied separately.

Laurent Pinchart (2):
  dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add missing
    properties
  dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add gpio child
    node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 45 +++++++++++++++++++
 .../gpio/raspberrypi,firmware-gpio.txt        | 30 -------------
 2 files changed, 45 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt

-- 
Regards,

Laurent Pinchart


