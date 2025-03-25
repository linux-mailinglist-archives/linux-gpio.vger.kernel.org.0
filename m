Return-Path: <linux-gpio+bounces-17964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C900A7036C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 15:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496AF3B0B41
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 14:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073A3259C90;
	Tue, 25 Mar 2025 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="EIKhy1Om"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E12566FA
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911998; cv=none; b=Lw/RAxfb4H+cA1/+iZ/MSrGjX2u6ZPCx8tGa9pagHn4qI2KHFD6DBdx/EfFybAHENmQvD5qM0BW9k+0blDfkSFM4XLQMvbSvmHv0pB5cFf7dO+B2EJFJnVHU+4qxhYNlRMFoUGMRUYRModWqn4YfUJ0AeDVvnznGnnQmVJ/p9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911998; c=relaxed/simple;
	bh=otuC/CFv+EroRezJqWlsIO+RTb56ZCo/gwA9TYGTy4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBpuafzMUpBbaMMSlTfQNMqn2VJq7Jxo0m5L4/p/GasV25NkaOkGEpRKfGOw9rF9YIlSwEie1xlsIZ38suXNl/i5RofR0HbiBHlzajyexKWPGs9V0yKaDdOSjGrbgQdOc18LWlfpkafTihgk8g1AHEk4m4CeE+okcLfpnuJRIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=EIKhy1Om; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9E55D3F342
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911994;
	bh=JaLEOuspohf9X4xUwz7GRTfjgrM6e47VPxpoP7GA8+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EIKhy1OmEbtnp3UYG+TjyDyiYHO5sHQSvhVlJYlw3lnXLo/xYpwNttMkQ7/v2Tjfr
	 RghPR70OMK7PVhBpedHWcsJ7dHbqpULfEQGyRjvTEHXfpmz/bx/JQmiEeC9oKJI24P
	 cafkGSad2uuqw3WVbLK96bNE6MYB3C0BgLl+RGLk2HEmEeZoBWXKyjKQklRPfc71GX
	 RDu87ArERxUPb2KBHdgrABC1X6fAcE+DLkdmz0tM+fRpM9B0giccl9BzYwe3uszdjL
	 2vyml5vEo4BDkOqUxQ7y+2hoXKi/UGz1ANjE6pfkdCxqBpa3EviQbtb74k6ZrEN2JK
	 xi/X2iZf5ODEA==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so1246865f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 07:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911994; x=1743516794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaLEOuspohf9X4xUwz7GRTfjgrM6e47VPxpoP7GA8+I=;
        b=NqVFHAfuAAhveS8tyHRGd+RwoagcU9P9BnQh2sMKR97+tyWX1z6+ycZ7ZY8xp3M2q8
         ZTfNo6+xBG+oPeAgpPuSgvNOWvnaufB7Yq6stMYWq6hDhPRwcI2f5oaHbFIVLH3P6+y0
         iPm5/ImccplU216tt7Nkbs84SRicocixtnXVrk0sG4mGPrlPyM605f9XvunSmYXuCk1k
         QH5dSTx7tbVnMLuAqERW7e8g9kgw1zsvrnx/z4wGMJI8JPENbhSSYtdp3YxWFJ8Pnzjl
         QLIlau6I1TI6EfoJq6h5nuf1SjcIoYVnARqNulTFUMIrrikdj/GcD+XzxT3GFKAI4g1x
         Cjwg==
X-Forwarded-Encrypted: i=1; AJvYcCWhSqMnDpovf3gDnH/cnRiQgCRVLuVCFev60hCJPkZhl40dfcrYpPqg+A0nX6Eujthw/0ajn0KoHZlA@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAdMkI+oG6Qh2gGPspevhmwY7vvJVIJQf6zEU2dom8OGwNu0W
	8xCYMOYI5nxrnrOq+ZOmOQ4FkFws/69SX1NT8suT6qGjrqNHIwv5TAfvA5rNQcS2E5AGLzX+/nG
	CJ3IU9MSuPCROSpiFZ6aJrInJEI3N52CSAWudstMPHXyBM6268kfxsamOcL+EDWnceaj9RtVyCK
	M=
X-Gm-Gg: ASbGncs851XtVgyR/low8j0+OlXDOSqm0nWFht06mTdLpyDpO1UomB90jrovcClctnR
	06H5eXVPirOkqGGu0y+q0qXRZkN4fUJz7JToDEhvwGdZqfoic3CqT2cG2xUR1QgKMT8mFcudxdA
	bUJPAOXjYb5xyUHWRZeGuf5ZczZ5s/9eMU5py3ekd/Pgi/QuEsglp/a6uc0fYWDg7MsBbWUe/TK
	ZAex0vJ48gnhiw/EE1OcYMdmIec/HZ4M5lvRzmi/5yTgT8ewiOkK5/z1vhasUSOAuaQiNKgMR4M
	xODCbenlwuwkwWMCVH/Rn+LCOlxVeQ==
X-Received: by 2002:a05:6000:2808:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39aca0cfb21mr1504914f8f.28.1742911994014;
        Tue, 25 Mar 2025 07:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9gu1kOTO2EMBz8bV0KvUy/lftump2d38xUsNj4Qewh4mTh1y9N8aE976C4YFTsdPfqCBOMQ==
X-Received: by 2002:a05:6000:2808:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39aca0cfb21mr1504872f8f.28.1742911993506;
        Tue, 25 Mar 2025 07:13:13 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:13 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/4] ESWIN EIC7700 pinctrl driver
Date: Tue, 25 Mar 2025 15:13:02 +0100
Message-ID: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Pinkesh et. al

It's great to see you've begun upstreaming support for the EIC7700. I
read some of the data sheet for the SoC and noticed the pinctrl is quite
simple and could benefit from using the same model as the TH1520 pinctrl
driver. This version should do the same as the vendor driver, but in
less than 2/3 the code.

I hope you'll consider switching to this version once the basic
support[1] lands. This patchset also depends on that series.

[1]: https://lore.kernel.org/all/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/

Emil Renner Berthing (4):
  dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
  pinctrl: Add driver for the ESWIN EIC7700 RISC-V SoC
  riscv: dts: Add EIC7700 pin controller node
  riscv: dts: eswin: Add HiFive Premier UART pin control

 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 +++
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  46 +
 arch/riscv/boot/dts/eswin/eic7700.dtsi        |  17 +
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-eic7700.c             | 802 ++++++++++++++++++
 6 files changed, 1021 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
prerequisite-patch-id: 2e5cc67f66a8cfe463ec73b98cd17130d4094a86
prerequisite-patch-id: e39d6867f89c605fd1e3621937c8c91a6cfbe7c8
prerequisite-patch-id: 5d2232bb3ce3d7d4e23477c2ad3db30424fee33c
prerequisite-patch-id: 946719f43a0cc23ffe82e996e076de2221dcd8db
prerequisite-patch-id: c2c2bc1b676b1e15165e107515b380318e9ca941
prerequisite-patch-id: aa4a955dd99d0796973fedb78bea269ebab73b6b
prerequisite-patch-id: 1cd27ddae721cc1e6c52723f8b360b09b5e712c7
prerequisite-patch-id: 237813218e54e0c7cbed8d72e30eb649ffd9ecd4
prerequisite-patch-id: 8e687755e898e71c80b0294b90deac71fe05c421
prerequisite-patch-id: 05622d10a27ba9cba36b3d194e51a2d8d7b7b783
-- 
2.43.0


