Return-Path: <linux-gpio+bounces-26955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E4BCB1AC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 00:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5572E3A2A2D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 22:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64D72868BA;
	Thu,  9 Oct 2025 22:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q40beSaX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB5D283FF4
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760049321; cv=none; b=Ty45H+NGpVoeUP/9gHV7niYX0pzSGdWtwxj2267dwSvXCHCQlBuLd0v1vfX2mmTpTmX0+MILj0JrTMn1ZdoLujA/j4zWqbBl0WdLLrq1TesR2RZDDMd6BPyadr5LhMFrE9URswlF5y4Ogghqed8DDW6jImR8lcVed4XjPZOcHOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760049321; c=relaxed/simple;
	bh=cxpNA5DjQamcNftEvxB6pspok56jCqqNj0uUfOooVr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E86ojp+J85OaBAkaJB21IIXcouI5rPbJW/k9U/iqM/UPvPdGgexS+RfbdcLPFSea9rkfzbWwxtkTqcYoPTZ+t4lcYfy83w8GxGTx/8D6cjKR1pYrLx6jaOSqgVSM9w7Eohu3I9/zHQhQVUYMgbcJ4usQbXFzfxuF15pRiaqcQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q40beSaX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3da3b34950so235258166b.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760049318; x=1760654118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWTu8TQiZuRHgB1GXUGo29TcN0XiMZ7bJ/R8fZdV4D0=;
        b=Q40beSaXsjflZrKuB2jr87ylPDSrrzVSzNtuHGZJxEs7Q4+nblSjgd2TphVgHP0Moz
         f+CAXf72l+qa9tECGhzCFdUH0zFIzbNtfuvy1DyEIga+BKAe2Lv67xReOj+2lhboZB8Y
         W7wbku0N4QXU/Lc1HAYdXp4mjLXLCoUBbT+TdYwRGxVi/nGanKpEd6eVZc4cwBIAIyD2
         TWDDz0+jVtl6zVbfxnZAvjACd2cHs7VvobV3NhgQCyrudRDf/WFu0yYUjk+uNZG/0Igx
         pkGlGgmTWKWt0YcgSM/KXvAJh9wyI+KMmcP86AOOupWm3XOdKEDcDgRkx1fpXXssgka1
         oB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049318; x=1760654118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWTu8TQiZuRHgB1GXUGo29TcN0XiMZ7bJ/R8fZdV4D0=;
        b=sLEMzoPLTyfWSlbdoMlDXTqYgKZRmm3/WRqOrTvX68cK2IKgnGAGPV2f3yP+zDBJWA
         AWkkYZtFP0vS7RpP57rrh3P5ZvZDsiM68nwvRvR25bTWM/V7dneQuuS9ITwm/ofHQfRP
         T4OHMGQxR9pXzOiK8QjdYybftc4bdm7tW1PWmoGgnr0XhD6iNkbdJyz3St9GzodOE+jg
         mBsJ86AZJ5Nchlu3Z4bG2pHXVF55JzZko6TPU/g43pnCPPGELN3HBLKahXMOqLoQ0Cjh
         SaqvmiZ0B+nqrStLFE+bz+6nsBkf1QlaTxJnb87chc7BKoIk9Io48U449pS75jQhyPKS
         fzBA==
X-Gm-Message-State: AOJu0Yz7ue+hOmGu+MwV0mrZwf/vqfmS/ZjQWWuavLlOS1JvKIALLQqV
	0we58C6bfFvUMbCRX/7RO41z7WzoGPCIZ5eKNIhiC/9LG4eQi24DHhidzM+RQg==
X-Gm-Gg: ASbGncsOKonN+N5rvDoJZn/x4u3nMKxj2eImvyH9QDsTyA0WRdqtEom6N3chKrsYTmP
	cTnMpGiDku6RDzuTSjKPSvgPQcCnCk6oR00CZvf9c+WtNvXyWoxrZ4hU7ATRJMYFPk+DGltbDyx
	Ops7sLqBRW7kWd6I+GCN2mCh2vRZ2CaKCKdHmBaVrTDMUS4XGFkS6vYpjUFwD9RPPRa0ZQg4V8c
	SqNRlpoTeEJ14VxQguf6ezmNMXizbP9LgViDPI+6E5WfbU9TATz3AQh211M9thCBCsDcAcj/+dp
	NUUZXbe05N0JckyFWgvmREIoEXUG4EK8kBLoCQTQcv00Lh/rU/FtAcPEwc4c6qkjEdjBCTjArQ4
	FFQqPScS9NEGEc2myasTRk/gpQoweqdbDNiwW+5Plg5Nycbe5Ww==
X-Google-Smtp-Source: AGHT+IHAbkVf7T0KiGC5vS8hyWfQ+8wkd5YDjN9kv+xf5lsOzv51+LjDmnqyTit4TD5wYPvsNvnZtg==
X-Received: by 2002:a17:907:2da3:b0:b3e:e244:1d8 with SMTP id a640c23a62f3a-b50abaa44c8mr956762566b.34.1760049317698;
        Thu, 09 Oct 2025 15:35:17 -0700 (PDT)
Received: from builder.. ([2001:9e8:f121:c116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad80bsm74383766b.16.2025.10.09.15.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:35:17 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [RFC PATCH v1 0/2] add support for splitting GPIOs
Date: Thu,  9 Oct 2025 22:34:59 +0000
Message-ID: <20251009223501.570949-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hereby I propose a new type of virtual GPIO controller and corresponding
driver for splitting GPIOs using a multiplexer for different usecases.
Existing drivers apparently do not serve the purpose for what I need.

I came across an issue with a switch device from Zyxel which has two
SFP+ cages. Most similar switches either wire up the SFP signals
(RX_LOS, MOD_ABS, TX_FAULT, TX_DISABLE) directly to the SoC (if it has
enough GPIOs) or two a GPIO expander (for which a driver usually
exists). However, Zyxel decided to do it differently in the following
way:
  The signals RX_LOS, MOD_ABS and TX_FAULT share a single GPIO line to
  the SoC. Which one is actually connected to that GPIO line at a time
  is controlled by a separate multiplexer, a GPIO multiplexer in this
  case (which uses two other GPIOs). Only the TX_DISABLE is separate.

The SFP core/driver doesn't seem to support such a usecase for now, for
each signal one needs to specify a separate GPIO like:

  los-gpio = <&gpio0 0 GPIO_ACTIVE_HIGH>;
  mod-def0-gpio = <&gpio0 1 GPIO_ACTIVE_LOW>;
  ...

But for my device, I actually need to directly specify multiplexing
behavior in the SFP node or provide a mux-controller with 'mux-control'.

To fill this gap, I created a dt-schema and a working driver which
exactly does what is needed. It takes a phandle to a mux-controller and
the 'shared' gpio, and provides several virtual GPIOs based on the
children nodes defined for the gpio-split controller, each with a
mux-state which is used on access.

This virtual gpio-controller can then be referenced in the '-gpio'
properties of the SFP node (or other nodes depending on the usecase) as
usual and do not require any modification to the SFP core/driver.

--
Jonas Jelonek (2):
  dt-bindings: gpio: add gpio-split controller
  gpio: add gpio-split driver

 .../devicetree/bindings/gpio/gpio-split.yaml  |  77 +++++++
 MAINTAINERS                                   |   6 +
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-split.c                     | 210 ++++++++++++++++++
 5 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-split.yaml
 create mode 100644 drivers/gpio/gpio-split.c


base-commit: bc061143637532c08d9fc657eec93fdc2588068e
-- 
2.48.1


