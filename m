Return-Path: <linux-gpio+bounces-20024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A496AB4FE3
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9873A8B25
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6BF238C35;
	Tue, 13 May 2025 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiZcK8Ie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2521C9F6;
	Tue, 13 May 2025 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128804; cv=none; b=cDYqlFPY9E86ilHKfieHYZD7PKqtGjltaJNyOEYq2iVuwC5S55ONCw5icSRaeN8JLwsz4Cy5uJiQ+kqRjlFl8pU9aE71y3U041wcdh0SqNi4IVFRboXHrebdg63nPdDRJYJLtfEUNnWHge28+/4QpLa2eX4MlSwVZCBx2Syc+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128804; c=relaxed/simple;
	bh=CHTP6dpT07NDM9L0gZh+nx6sawTcL1T+nc1DCX2bMPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKEnSH0UafgOPwRT7JGSsYcF2+bcKNiUw2igTDOMjnh5Aktzw/d/qjcm0HaHCMfasWtHAUqOAMzL9rsBKUhDCLvU3+NZW8osN569RV5QmD/5TaEO9eP7YQgTeFkRJ6LdtDA4hfxgVosvyBo8IgMU8PkUBFSoAWb60Y0DNUY5WZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiZcK8Ie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B362C4CEE4;
	Tue, 13 May 2025 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747128802;
	bh=CHTP6dpT07NDM9L0gZh+nx6sawTcL1T+nc1DCX2bMPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiZcK8IeDs0Syz7MBpBwr2V1a/v8Pxb9AitjsXBWD9V94SQSKB2cEPKTpimvds+/7
	 aHHTBqXFD/1YDBBCAPpkLs0hCu02qw1uXLw7LneBZKQRbAiRAjqe2HRjDtrAGqFr7o
	 qWJ5MJG3sv7mTJBkigtO4hmIqodABdL7i03YVpMhYLlEWfv9Pt9ynn+9625714Zj/5
	 prmVnJXI9klIUzFSSXb3ssruvhkQRWgCHIKoVq6F5vWVPXW5IcUBxQVnUFCnTTY5vj
	 4ifT7kVYLYb5a7hnX7onEntI1EkfFLluWU+YS41FKzkmG8TMGEytpI8LIpDVUegnmB
	 LZqZ8xzYG815w==
Date: Tue, 13 May 2025 10:33:16 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, GPIO and NVMEM due for the
 v6.16 merge window 
Message-ID: <20250513093316.GD2936510@google.com>
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-nvmem-v6.16

for you to fetch changes up to 8824dc7f947ac5916cf166bb8289af48c2b50bc7:

  nvmem: max77759: Add Maxim MAX77759 NVMEM driver (2025-05-09 15:23:18 +0100)

----------------------------------------------------------------
Immutable branch between MFD, GPIO and NVMEM due for the v6.16 merge window

----------------------------------------------------------------
André Draszik (6):
      dt-bindings: gpio: Add max77759 binding
      dt-bindings: nvmem: Add max77759 binding
      dt-bindings: mfd: Add max77759 binding
      mfd: max77759: Add Maxim MAX77759 core driver
      gpio: max77759: Add Maxim MAX77759 gpio driver
      nvmem: max77759: Add Maxim MAX77759 NVMEM driver

 .../bindings/gpio/maxim,max77759-gpio.yaml         |  44 ++
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  99 +++
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |  32 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  13 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77759.c                       | 530 ++++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 690 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 145 +++++
 include/linux/mfd/max77759.h                       | 165 +++++
 14 files changed, 1764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
 create mode 100644 drivers/gpio/gpio-max77759.c
 create mode 100644 drivers/mfd/max77759.c
 create mode 100644 drivers/nvmem/max77759-nvmem.c
 create mode 100644 include/linux/mfd/max77759.h

-- 
Lee Jones [李琼斯]

