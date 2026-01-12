Return-Path: <linux-gpio+bounces-30444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD3D11CD8
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C4803006592
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A971C701F;
	Mon, 12 Jan 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYLFfQTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97AA27CB35;
	Mon, 12 Jan 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213235; cv=none; b=KiDDbpy16WvRNWr2FhhTZ98EGBkdfcohih/R1ZpisS1lIJZhnhEwnYTdJmS+IRYJhFGaZ1ppe3ycyFkHIYayA1be8HtzcVbHXz3QkUU99XUyXQyOZ/4JgJXPqeUy327RfQLM5fIGPy8FkBWUzyxJkGr7dSaVIFzSRO33GnOTbzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213235; c=relaxed/simple;
	bh=sB66Cur7cnTTnuSA0LW+FqIiIPtXnYjfOUw28gPpuXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFJzjWiygDy5jMgkxrTuEadL+hsuLIAEO7/GjqBycTwR48MfkkdKVRECggXHzJiVp23KtGAPMDxuWhFZr1FgBle/054E2yXYBvbxc88v//icc5MlZmUF91SVYUcOWzNDxia19vMhe4JprNSdEob7vB4jVnoP9ffr/Zq8r0YCMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYLFfQTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C003EC16AAE;
	Mon, 12 Jan 2026 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213235;
	bh=sB66Cur7cnTTnuSA0LW+FqIiIPtXnYjfOUw28gPpuXI=;
	h=From:Subject:Date:To:Cc:From;
	b=eYLFfQTQcM8Qj/PwiENE9IA1QZICoXSelI4YAM1GMDKmt0qnjcZA6hcmjR/hCAWUW
	 PPPa9d1WN+ixod/n2CQ+qYX1xwOLFdzb2rUWkphARBs3YDibZ7WY+8hrm9EdWngcQt
	 BLILaEf52ULORbhSnwXFKCDoHrWP3ZoV045p0TcVwUR4EOBiBdYy4UlFH1mzf9Vlde
	 Z4Emd92ErMfRTvu3l34nJLQaM36ivi7bkasD/MBxVHBxikRTA8TKjvY/p5G9+UDr5g
	 0dDtC/p/vVr2HJmqRoMvKt7lmVocIO91cms+1juWxlAqMfitxKDLYXzunGakeEQ9GT
	 +eYh7im8EzUtQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
Date: Mon, 12 Jan 2026 11:20:30 +0100
Message-Id: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ6CMBBGr0Jm7ZgOCP6svIdhUWCAiaStUyUaw
 t2tHMDle8n3vgUiq3CES7aA8ixRvEuQ7zJoR+sGRukSQ27yyhAR2hAmRuUHDkE89i/XYmHItPZ
 QWqITpGVQ7uW9VW914lHi0+tnO5npZ//3ZkKDVccNNdW5LI50vbM6nvZeB6jXdf0C/JONbLcAA
 AA=
X-Change-ID: 20260111-apple-req-gpio-func-3010ca45a118
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This fixes some uses of the "unsigned" type to "unsigned int"
then propose to implement the .function_is_gpio() callback.

The Apple pin control maintainers can comment on this: I
am not sure that "mode 0" is GPIO on this hardware but I
find it likely.

Toggling a pin between a certain function mode and GPIO
mode happens on any sufficiently advanced system sooner or
later and this callback was implemented because Qualcomm
ran into it, so let's add it to the Apple driver before
the users turn up.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- function_is_gpio() returns bool not int, fixed it up.
- Collected ACKs.
- Moved driver patch out of RFC.
- Link to v1: https://lore.kernel.org/r/20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org

---
Linus Walleij (2):
      pinctrl: apple: Use unsigned int instead of unsigned
      pinctrl: apple: Implement GPIO func check callback

 drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-apple-req-gpio-func-3010ca45a118

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


