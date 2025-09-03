Return-Path: <linux-gpio+bounces-25471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9EB41B1B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 12:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7CAB1886647
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2252E92D1;
	Wed,  3 Sep 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs8xSQ4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7D277CA4;
	Wed,  3 Sep 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893882; cv=none; b=TKnMOAenS8JIRp2dXCSjeU2og+SCvj7UN1KlbV1xKMfgoz8yDoF3nRJVzDfOX12NyZRL3R+P/RQbX7Mt9LzXiU7e+LDgi9RM/XapdREciwchKN9PlTVojJO1R7U3bZHN2M3ioxxnKO4D/s1e+eK4EPncferkuF7zPJFyXSZJl8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893882; c=relaxed/simple;
	bh=jJDm398o/PQUOO/PqYBt0YkNR5iks/1VGE1vFW3OeEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpzPEsEDhjxa2IqzrVjtnfQuzWKt0yijbjjQ3GAAS06fxNoYJASqDByhejtMuU0UJNZoK/uFmdFXtYotRCcaX3mOJ47K5+MbLJs4EHxa6Tsibet4XT3idznLvkfwnX5XNLNHLhqOrDRuSdGUJ2ITdbANdaUuf5jH5CziFbgJO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs8xSQ4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F398EC4CEF0;
	Wed,  3 Sep 2025 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756893882;
	bh=jJDm398o/PQUOO/PqYBt0YkNR5iks/1VGE1vFW3OeEc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Qs8xSQ4NlnkmhZNK6yKruo+dvSjSptQp7I9Qoo4JrreIncgDbmoth4/0eau9gZo+j
	 3BSjyyXEr7404RX9WBZQdw00sxAYEdu76CZoGKlvKy7fWE4FUD5aHkfDFaVLPnoHD7
	 Kh9lfHrocFs23zD88KaC9jK8/SAtCsznwJ9rtM+4+mFcZqKQFzH9yhGZWijf7Pw4U3
	 03mTm7oUb2dzKxF9ZXwek5ooZ2Bu42AAMqBo78Dzfj2SUNGDPxxY8iXl1nE3+NsdyU
	 A6x2bj8wYR5S2U6wKQDXLSoT09brbAoBBMkO1vB7xcL6vWSokarncnMWpM/Y2OxQtp
	 byPfOOY8YJViw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0649CA0FF2;
	Wed,  3 Sep 2025 10:04:41 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v2 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Wed, 03 Sep 2025 11:04:58 +0100
Message-Id: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMoSuGgC/2WNQQ6CMBBFr0JmbQ0MCNWV9zAsyjhAE6RNWxsN6
 d2tJK5cvpf89zfw7DR7uBQbOI7aa7NmwEMBNKt1YqHvmQFLPJWyQrEEalDWwj+tNS4I7EhSw+2
 Z2gHyyjoe9Wsv3vrMs/bBuPd+EKuv/bWav1asRCmkHJB47Lp6xKta1WKmI5kH9CmlDz6FV4avA
 AAA
X-Change-ID: 20250812-ltc4283-support-27c8c4e69c6b
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756893904; l=1868;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jJDm398o/PQUOO/PqYBt0YkNR5iks/1VGE1vFW3OeEc=;
 b=eJjKsNbH0FJuhzg4gT9i/d0rAuEi9J84idpe5trIcPOXe5Vvzz+nFebIcK4T2IJ7zcZRdPe4h
 jzV/YMFZBJjAebyqCREHSJsg7vFXpQ0fMR7l9bFIF2WM5sLAV67ppyx
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

This is v2 for the LTC4283 how swap controller. Main change is that I'm
now using the auxiliary bus for adding the GPIO device (done depending
on FW properties).

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes. 

I also feels this is basically "v1" so the changelog will be a bit more
generic.

Linus, I'm not using the gpio-regmap helpers because I'm using the
.init_valid_mask() callback and I don't think we can use it with the
gpio-regmap interface (unless I missed something). If you feel you
should change the interface to allow it, I can think on something for
v3.. 

---
Changes in v2:
- Dropped MFD related patches and bindings (now just one binding file
  for the hwmon device);
- Moved to the auxiliary bus; 
- Link to v1: https://lore.kernel.org/r/20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com

---
Nuno Sá (3):
      dt-binbings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  280 ++++
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  217 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1748 ++++++++++++++++++++
 9 files changed, 2544 insertions(+)
---
base-commit: 9703c672af8dd3573c76ce509dfff26bf6c4768d
change-id: 20250812-ltc4283-support-27c8c4e69c6b
--

Thanks!
- Nuno Sá



