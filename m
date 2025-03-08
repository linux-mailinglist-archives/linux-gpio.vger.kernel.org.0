Return-Path: <linux-gpio+bounces-17292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB2A57CDD
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C963A9642
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D3920968E;
	Sat,  8 Mar 2025 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AepU1L1W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BCE207640;
	Sat,  8 Mar 2025 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458880; cv=none; b=jcMDx+7OCNONgsWmXEnOerMEiL6mpAETp1UpQgHC7nFWHJD5xSlwf2CCD/RH4UOxSPG3vsB4Q4gb2KNFlIiQ//SNNVHvYak93kGLpD2ccl6MdgGXgH54QbCP9+QI0KN9E3yhFdh3w+iPf4J2EXY+DgTh9HbRxBvh3O7ggShnUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458880; c=relaxed/simple;
	bh=AbuPWLIU45qyQVYNe0RinxFUH4fVcFJyxnkCgDaB8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEaq2BLIuqeIvcCehLYWtHecN6fvxHbxTP4SYeFXBIAmgRrSRVBuaYKSEMODC3zNmTJyy6j4YDKVnqhPJnWtu3OihCNxlRxKDDxCnygPT1loyDKVyX+rIEQ7S43LC9CSAvHaUtETDdD5fzagnqfmSTwASh0tFLLPKZGtFbQ95OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AepU1L1W; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf3d64849dso340607266b.3;
        Sat, 08 Mar 2025 10:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458876; x=1742063676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=AepU1L1WpsMBlvdCU7rX6TsIttmWPUmmaVEE7GpCbVEQsqJhoPmycvlayYTh9a6jjU
         8JbZyvutG67gIv4WNXb1k3+vGBQqpIYYuLs28QPu0ybZoeieTBmbvBb4WV4tn+2vrHyp
         WSE0YKKwXRk86MWcAmgz1bYMD5q9BJL1AE7e2VLIypZmXzKei4Py2X/ARihAmYpxJepa
         Z7c/2LwSdMEa8hVO60WOJCKQ2bnuSLo67Vm/o1ywZIcI0K2+DodSrWF6a4HbNYJ+ghFK
         jgohcLmaaV63H8s31J/yvvkCx2wripXXO521gJ4RLhyGVcdVwft2NIYPFSvViQDrVfYw
         aIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458876; x=1742063676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=xS6HT98hQSI/MqDOHRrD6XhWzsRpGbfaiNKNunc5f1J/EDsv30QggBcDfcDWo7BZzc
         zXfWe1K50G2b0pcbQdKR9G+IaU5/nfWGVGhNa6D9AOkvZTzoYnwbx4ZbIcfmckcCp+e5
         EB18mJ1Av2gRBdxOOeBTm6GJxEyLXZc7R7zdIz0K2Mu7OF5S8yetMXd9yw4sPcPs6Wo+
         CFfyiMLXPmYQ/QF+npwF5z7QNmiHjhZSG+s30FgSU+mGjH3L1NEAo7PRj5/PwQbnO7gz
         u6TawqYPVfcmZhH07xzj/ernC0SeRvGXz4blguk39NJshGTcn5w9xKpC5l87dutIiGHO
         wMsg==
X-Forwarded-Encrypted: i=1; AJvYcCUvJiU99TJaZEnKctOCULYyPGoeRzGCUp+FDSxU5opz/WkPcnlzV7X3ffiBcA4ms8iFMPHEmXecelwo@vger.kernel.org, AJvYcCVngJlJoFfhV5ca9bNRXI7rZoNmjQbwzQlhRhfjkc+HfG5bAno6rN2GcUV1d1O8LGN3DWRecHj97lfHUeE=@vger.kernel.org, AJvYcCXgEtA22dtVtcQVhob1mAP25kHWc0SWxfBD1VsS5un4FaoN6OuC3mLPGUi0Af8eju8FUQwDeIQcqjhFswne@vger.kernel.org, AJvYcCXsi4T8nfU5D5T5SmVPucSgchCstdVoBk33qbCGVwxb+LUUcanP1GATi3nhQxByWhk1KVfbIzBgMOKT5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4eSBc9H2a1ucwhgiKoA395wOsEOvG0QkWlKt+CFPpOE7b3kTy
	kwHBmxOD/pDbCAUclkPYf/a+lPNMfEWQP+LF4/OrmadHGyJJMcQS
X-Gm-Gg: ASbGncvahdKcHtCH5NTzvHoGcJTLpRpid7GFw8VsuEeV/nbi2WJq/PBJFYwfO5Bsv+q
	tLDEeRv1bU/Cv7qIzcGn91ptS2GdLptxe2ZNuou7QV0aAGYWxBhnHS7pKpgMQHhCHMNsQYU2TqM
	Ij0nt3x53wD7bWIHQ+eHfp9hnvdWSguBO+M9XCGLZzyMMnIhQIrIiqbOVa9fUhcNUNLVNY1DN2Q
	S6ahpftWwtcmn9Htek7wn1BoWVlP4euDxgQSAR9rFnoBfWjSsXEnWQd1hRm5gSuAKU4RIBa8VdO
	czmjOdFettfIt3bqLCFBS1rrL4C9BcKyKk9Upx5bobHUDoOQTwPKt9CwcSvf2CJmWpO7
X-Google-Smtp-Source: AGHT+IEFo+JxS1fGfKbCZ1KRjt4dKQZjHo5NR/dqzrNE9XeFG/awZJXR120fbdrpTpOmQk9ld8OSKA==
X-Received: by 2002:a05:6402:518f:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e5e246875fmr19328628a12.24.1741458876037;
        Sat, 08 Mar 2025 10:34:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 02/24] dt-bindings: media: i2c: max96717: reflow text
Date: Sat,  8 Mar 2025 20:33:31 +0200
Message-ID: <20250308183410.3013996-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..1026678a17a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -12,16 +12,15 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
-  into GMSL2 serial outputs. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96717 can connect to one
-  remotely located deserializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
-  data received by the serializer.
-  The MAX96717 supports Reference Over Reverse (channel),
-  to generate a clock output for the sensor from the GMSL reverse channel.
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
+  serial outputs. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96717 can connect to one remotely located deserializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
+  the tunnel mode forward all the MIPI data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
+  output for the sensor from the GMSL reverse channel.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1


