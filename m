Return-Path: <linux-gpio+bounces-16697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BEA47C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA7421638C6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD4B22A4DE;
	Thu, 27 Feb 2025 11:25:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686E22836C;
	Thu, 27 Feb 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655523; cv=none; b=E8L/WL/zMEfXmo/orheuxMbONdMEI+dPEbuiyPOmb6zcUtsDOmZ6DpQVaba8nDnmNH4Fey6B+MFuNkbyZO1vHLxZUfrwCHWc8K5FE8kaFztZiRDsxSwYhLT6jMZq0ZkuF1WlUm6KITjpEy1DaKfXYO5nbT2jly0eoXhUzDdcEec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655523; c=relaxed/simple;
	bh=PYLYF/dGKIxYWh/3gfabjFbV0NyMK26qmfVNmoMxlxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o+EYHK8s4M8ei4ZGa66PV5cw587Ax6YPVXUOwC0heQ21RSI2RetCl6ZDhI3NumcqGLua/5Elw0nwSLzciw8bjsaZBm8+rzeCeLYibKaWL6vbNqyXEWQ//I8iVD/73uOc9nTUio1454S0pbhP++VxmqAsI8BRUjoXcrAvCcj5GNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C8961342F9D;
	Thu, 27 Feb 2025 11:25:16 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] gpio: irq: support describing three-cell interrupts
Date: Thu, 27 Feb 2025 19:24:58 +0800
Message-Id: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpLwGcC/02OywqDMBQFf0XuuoE8TIz+SnER440GfNREpSD+e
 6NuupwDZ5gDIgaPEarsgIC7j36eErBXBrY3U4fEt4mBUy4p5wWhOek+fiY+LGTtA6LFYSBKIUN
 aCKupgvT9BHT+e3vf9cMBly3p12eExkQkdh5Hv1YZpyy3pTQu2VBgoazJjVSlVKYUCrngWjgqG
 /jPum5XFCueonDtkbh5C3eTllpr03JWtqbaBdTn+QMIU5Sy7wAAAA==
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=PYLYF/dGKIxYWh/3gfabjFbV0NyMK26qmfVNmoMxlxM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnwEuSx8iKG0sz2u5bINgaoTFxMqT+83XiLhRqa
 olydrM1eTCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8BLkl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UeLD/9l9N+oAmWTukZ8iu
 BnMlGikNlF/ufOEdEO0PbTyAcLR/GnLgkngT2NBV47CttDj37y+HOT2ZvOA5JcKY/I13aELTSK2
 kU768Coq5u2euC5746HP+Z9f/6MbbyY9kMPSlcFW57bquxfpAAmLpholorRJQbpNVECGzOl9YlP
 LFXi37ANePnHCVBti2P+qB9jwV8UNczuvHQ1x/aEU32P59bAus7SUscGVPaBjU0YNRUGbzUi1Ds
 B3SJA5WEJ7BkgvU4qSLovuM9Qvvyx6iIP7hweummVvb23KvshfUpS/MAZFZq2z60FDvlMvRFnB1
 giDp0ZPBaGErFHQtSHnswrqgA4EX2tK5ltPQL2f4DvSC0DwgTGuVZ/2mopyY62gZrnQY2h5yjXm
 Z89Jf+F/wjNuWBq/vOFS1PcZ2jm3anpwbVRXtWwJ4nS0F/tsQBsw8XjX/MfMvdm3yseSLT091YX
 MOUq29Ml9uxpufvI+DkVBy0ZuuBxjR/dyr+22HOL9klupmesFoly3YV/7xnmPvNfscu9/610PzI
 Chf5z6k5MNj7qu/85JPJq8gevxSQ2DHNGqXxC3hNCywfog7KTma6lgdpbpK9tmsHlTY6sKgBBJg
 E4ACmjWMwgAchgG2PuxCGTIMp0s1EdWjS+fNhkoHPJjMDerRQsXfWNvoQYOup8cWG0RA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In this patch [1], the GPIO controller add support for describing
hardware with a three-cell scheme:

    gpios = <&gpio instance offset flags>;

It also result describing interrupts in three-cell as this in DT:

    node {
            interrupt-parent = <&gpio>;
            interrupts = <instance hwirq irqflag>;
    }

This series try to extend describing interrupts with three-cell scheme.
The first patch will parse interrupt irq and flag from last two cells,
the second patch support finding irqdomain with interrupt instance info.

Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      irqdomain: support three-cell scheme interrupts
      gpiolib: support parsing gpio three-cell interrupts scheme

 drivers/gpio/gpiolib.c | 19 +++++++++++++++++--
 kernel/irq/irqdomain.c | 11 +++++++++--
 2 files changed, 26 insertions(+), 4 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7

Best regards,
-- 
Yixun Lan


