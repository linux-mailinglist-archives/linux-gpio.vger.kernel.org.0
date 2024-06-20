Return-Path: <linux-gpio+bounces-7573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604D90FAE9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 03:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19421F2155F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 01:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E6E1DA4E;
	Thu, 20 Jun 2024 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnvG+Oro"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D81CD06;
	Thu, 20 Jun 2024 01:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718846852; cv=none; b=kqpOB+wZ8n58nOfETHzIop5fH0KahCltbUL21fHn1nivG0S9Gd2V11m9z+kwqfGtrGjEEZPUoOEEPHMqnzO3xB87P+6Z7RDFxdJ+fLkg38mkyxVJ8OtpSfY1XJ0CjNI31Z176lB+fwvUumyYvSZqrC0ex+H2fpfRa+U43zTelgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718846852; c=relaxed/simple;
	bh=P57YIC+SgQEffjk3moMXFCuPTKOKSdhXtV3HW35Rz9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IeZYCJRIulh0PEVEDjhNtsEY6vqrF/6tPQqQfRE8anZYJNJPcnoM02SWoLZURFi36Mm/Q5PI2/i0laUPh9sKoPvv30cqfFujAF1CZQqHeSf372CE7YevyijVJaiEnt1b5zo/LcNKsDVo311QeL1ufRDbgvGIacC7rx7FTpfTQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnvG+Oro; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-707040e3017so252901a12.3;
        Wed, 19 Jun 2024 18:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846850; x=1719451650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAvyobvqI2HxWlvdnAeJsCk7w3GvVzpbdy8jdNQhefo=;
        b=FnvG+OroOhUd6aKcdiOcNWv/okgRVymQFlc2tjcdBiHvhZ3cx6W3RWhfqX06h64Nnk
         wSXgFBJsxHZNTfCeLwc6D14YBt7TWZQCbD+GfqQ6vzJVxrvfUYUVDcFSGpBozoGIWRpP
         pl1Lz3kY7/F+L8aPIbe22/OMG6IEYVCOmcjujTd4GF3HjX52O52VZc2Tk4lixsVhHA4e
         VBedlzlKbhr0E21Y8n86zAIkLnLxAmP8DsgBKS0Xls8eFi+mfUDd49FR3ZW5dOixQtdA
         hkX7cXswYxJQGPyyCg1Wj3tCs1+qrXae9v+lBLa6GHOnXOqhfxoVhjxPmyt2/Uh6iKKC
         he9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846850; x=1719451650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAvyobvqI2HxWlvdnAeJsCk7w3GvVzpbdy8jdNQhefo=;
        b=ZxQkI9cYSAS92ip9+j7gAg5HL5Ak6wDMrA716B+rcC6MSq9Qh12vZPoqy/VoVAO+Q3
         zkwPon+C+t1SlFu5vifVoeLf+rVKaQ23yRMmT7+oawPjLuVBm1RU+sY/T2qbBmh42YuR
         YcDPrK5Xd5NYn4wDkQwfhc91fhb3URmrqJSIVdOc+AnLfD0braA68IaCqRoO55sywJuf
         7gf12+Up8/F0kDXxVvtVrsQoUxWsmWhXGiUBGrO8IZGQwP1vjO/ppDLtGTEYEIUhfeek
         57sLfa5F0OL456BzaEYH6eV3JCQZc4IgGTY5PPNk5l+Gfu7UHD/v1LEJz+LmQhaMJi4E
         ZoBg==
X-Forwarded-Encrypted: i=1; AJvYcCW4kk2C9oRRu/LpQM3oASH7fpSLFL2d06TKihKZhnjNM1qjNiPZb5AF1GPdzuqorGzycq2w8He9PkVSVU52+/Yiit2xbuf16iLQ4PSByYVDCaZLQ0e7QBedHkv9vDeC3ASwzhNhITIOqF8hR6p8r5OaXf32s8FY3yvMAtE5i/lkDi+Xc74=
X-Gm-Message-State: AOJu0YymOPlW/fvX0nTNduxBubffP2MuqQFh3BoNCMPiz4WMxCW/FIHo
	IWIQ3lzl9jGuSoSJTsCBHnj0o7qXzHmxSmwaSauw0R/F504ULRjLOrC7NJ+f
X-Google-Smtp-Source: AGHT+IHTJJRiCMllRxkLRs+jMBPLwCcjfhogsXVOVPuvtCI4VC6AcvlRfF/4zLL0cmyB5XBOJCHl4g==
X-Received: by 2002:a17:902:c40d:b0:1f7:126:5bab with SMTP id d9443c01a7336-1f9aa41228fmr47535535ad.40.1718846850068;
        Wed, 19 Jun 2024 18:27:30 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:29 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
Date: Thu, 20 Jun 2024 09:25:12 +0800
Message-Id: <20240620012512.3109518-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add NCSI group to distinguish the pin group between RMII and NCSI.

- RMII pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXRCLKO
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

- NCSI pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..3f02dc94a7ce2 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -337,6 +337,8 @@ additionalProperties:
         - MDIO2
         - MDIO3
         - MDIO4
+        - NCSI3
+        - NCSI4
         - NCTS1
         - NCTS2
         - NCTS3
-- 
2.31.1


