Return-Path: <linux-gpio+bounces-17298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20CA57CF5
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBAE3AA048
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071B1215076;
	Sat,  8 Mar 2025 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbolt3CS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BE7214A9C;
	Sat,  8 Mar 2025 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458902; cv=none; b=Q9/0EOLKFDdSOSEds6DwlvQLw7Mrl7IS5nvtxVgTm0ytNIdBN3P7cGaYS/tQngRHlo3Beai994R1dFYzHrkldwp1inTFXzp3uED8YOoYMKdiXZvPbFHk8kX0nAZOFeBBgzRg2jEkLkBylq2/tryceSHOFjucEaX4mepBAHlAFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458902; c=relaxed/simple;
	bh=IbJ825DoJSnWvL66nJwG6v88Bdb2MBA2bKmwG3S/oCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtVY/6/sNrE5OyMtFllog1UkpQjKFfnNNaz1/7Ei2QGmXoQoC2RePDxHKeE5B36/iPSF1DAz32sDFIidUcD9769MdDjZz4TGodFsxjxo23b8P3GgBrr2fkS/qohYG2rMoG/YV7xR0fB9DC6C1llNdWteHR6tw0cW0VMQycHdFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbolt3CS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaedd529ba1so361110766b.1;
        Sat, 08 Mar 2025 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458899; x=1742063699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=Sbolt3CSxz4R30yp/3Oz/nXZDIMJ6m6r3bsUS/g5ekbEIBm4EvCGo/8ckjb1xF5zw7
         SmEgDmtJL4k4nFi/ZriFQSmQ6ZO9Lg7x7zQ5WHaoLUAAIHFx8OQNErYoc2kQcyIEKSDB
         Ibfs+HG2ChycKmBUGxw+TKwp1etZz86QLDBST7HAUAPM79j9fwotqdKKHHrHHHCiKqJH
         WhgU5q2ER0mgxNrv8G/QyKC+1/i0mokp3UlbXgLI2CmJ06n6ThzJ7uHJaQ2jIZaavTtt
         Siq9U/I5KIqnRWxV/ISsiwC8xeFGGAoMrrsbGWDO+wic8DhJNgVeyWG+KkFpFJZ5Z7kB
         4inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458899; x=1742063699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=X3Gts9hwGfpKJBDrQSUqCy0E0I7IltowzKvLBBJ9j0YjqZHkBLA2jgDo6P+p9xCYo3
         JJVykNt+8BWHPa+ecevPeqkmBvAzTrb+ouPDmyBynfhBaosYT0IZ5bgDrDf+g4ZMH72k
         H299yCowTKzFLoI0jPCA+us1FFHYAvfv+fVjxEKI26IFSoIQIdzHj6TrC2JQ8kFdEACv
         eOoZGQlyaTsq9Vt1ZpxcJKhGOKhP8+7nU7PGTTWUh9n1rFoaT4+uzAQPevt0WffG1DZv
         TiLWZwebueUZr4xDoXWFd/zbDJA6fZZ5/fKF9Ka1/sXNFLj/A7URyktelVln9DccAS6M
         6O2g==
X-Forwarded-Encrypted: i=1; AJvYcCUC2884r2cWZ6+0wWAf4rIy0e+M8yN2y1uQdgBsBNAISo/xtHayvvOttocmvhXHrdGgSquPei19l99LAg==@vger.kernel.org, AJvYcCXJw6ZsV7ED3vpIL5AqVSP/a5gfBIC4L/coYJv+FyFPcEH79dZIxd5y9ZGXPnPTzQjm2ITaFhrBSpufThA=@vger.kernel.org, AJvYcCXR1uRL3S+356vACjAEdEw3BSGMXrZjJuRL2VBcwKZnv784kAlG05ZwWpv8fREnxNTo61TtPDL1oID79fvk@vger.kernel.org, AJvYcCXxDj9qpxgo7WMXsSou+Fsd7sfwrhC3+UsoDlD0329/UjtNa40mpJg1JCyjd1zkLkw5jWpZngswl3cj@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEUnF7cFYxtRiztlU4CkAOh1SwmHsyTK4t9NvWO9/pgewbBcv
	ZvyfHU2q4H4qjvRdlCCvmGiLblpTVmxDDYb4GWca2vGVe4P6j9NR
X-Gm-Gg: ASbGnctbdHalwkHxD682+GVutFVh/x2pua2l/5DiUe0wG9uF1KJuBGrQ4FFqhh1NXgA
	SoFqtZ889/SUlIra8gk4RJ2pPRx+Dk1eKia+siQqxzrHHGKMVdtfuiNVVQxhuH61Bo1mxgFQ7DB
	GJOrNvEQbk+43BwU9qSYBIIUA6zW/edVFjhZMHSWwZNMTyi56b/+M8IuhDLJPm9WJGa5Mm3r8V7
	GylhAFnup5ChUNcL2KOTl1yg/OVzJme28yXXyNWffaWwFVLYjd8sn3YRJFBJiNYIfg/3AW8d7fh
	T95zD68V6n4cb3j7nZLAXdMQvheeFQ5gcH1fJ2h5QnF4YkTde4i8SmSYWQ==
X-Google-Smtp-Source: AGHT+IH2YosUhqi+STAQ/nY4ti7PQvH7nJrNeEszlj7Q84z3kvlLkPrCo3BZtLhHfeHuHBAcm4ROyg==
X-Received: by 2002:a05:6402:4617:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5e617d7bb68mr11479433a12.18.1741458899040;
        Sat, 08 Mar 2025 10:34:59 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:58 -0800 (PST)
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
Subject: [RFC PATCH 08/24] dt-bindings: media: i2c: max96714: reflow text
Date: Sat,  8 Mar 2025 20:33:37 +0200
Message-ID: <20250308183410.3013996-9-demonsingur@gmail.com>
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
 .../bindings/media/i2c/maxim,max96714.yaml        | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 44667b74296c..2f453189338f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -12,14 +12,13 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
-  CSI-2 D-PHY formatted output. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96714 can connect to one
-  remotely located serializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96714 can select individual video stream, while the tunnel mode forward all
-  the MIPI data received by the serializer.
+  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI CSI-2 D-PHY
+  formatted output. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96714 can connect to one remotely located serializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96714 can select individual video stream,
+  while the tunnel mode forward all the MIPI data received by the serializer.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1


