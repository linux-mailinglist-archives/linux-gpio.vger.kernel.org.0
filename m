Return-Path: <linux-gpio+bounces-17326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEE8A5823F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E123166D52
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F186A1AE863;
	Sun,  9 Mar 2025 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVsYcQIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70E1B2EF2;
	Sun,  9 Mar 2025 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510128; cv=none; b=jn2vZ+NgxCaaqr11++ZEtWU43bVs/HYZCCO6rcNBpV67QDiCeY4tWwPgeJavoncLecqaQZ9k6uQipsazezMZ1Pp/kizbPqxVo7aWabBEAsP3n46JuPVlc5cZ+p2dXXiNbFNtJdwQGzEX2k40mP5TFfbon/sI3ddfxboL78abjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510128; c=relaxed/simple;
	bh=dJ9ClzDi2quDwJUM9XQEVfvXpVITJrJZC+B9arryLKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9B6UappUzxg5rUNHKf9iJbevHcIktPoKb3RNNvUfjvHJ4Rx5lQp8UwrnKWkApevvPo68SjogA2S2xymnHgblX7+YhZbdv0wt20srlVcsFou2ptyZg6MO5WzJlLJs1VjF+W0ifCWRXU6sqHS7Hvje90fMwSJqIXibJl1BHwEQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVsYcQIp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac256f4b3ecso360594566b.0;
        Sun, 09 Mar 2025 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510125; x=1742114925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=dVsYcQIpPn7tSuxOF6oaYXbVIjlM22Hoe7897MYcXmM+pE4ag/bI0QrzSeehhDiddF
         VWdjDwawRpOlK7KrMVpKfhG5vpaJnt9Tj8DItXhMaqMtewEnopQpd6qQ7865N/Voa5/H
         366z95sNTb7NvP6orxxX3CVLAAxsON9p8zm6AeNZHSvehuVDQAnBsHtZenOZilUDkS5q
         kFJFgkiNXMALKtE5+/J/+ffri4OivoCR8zTjokKGI6d1PAVybAtG1423B5+bfcvoj0ao
         7//El05E9DCuAokDaMTrfPBaVa5ZdYtCPiAbkLOAjfBAfbpdNJD8/3eInsRIKDgl+3ck
         Mrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510125; x=1742114925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgEysl13OPBv6BFUaZyKQ7UjemHKnyK7wK7vWTFZ5dA=;
        b=pJmUNzq2IiMi5Y6Joeah0YXPbrBXZy+Kp6xCeLbiH2UJZcK3vByV6Q4RDf+c1BPBYZ
         Xm6btFXAU9/0dn8BHdV32+kVS2Dl8cL9AO3bGv2MzbRHaphknVY9a4tdmwroHd/eKBBs
         250e3eQIuxCQDfkeAtaJMCh8gUp+zynKn2EF1HqNfh0iec1MX3C/zT1ud4zXYM/AC4Mv
         ERyx/frR23SKhHqe6haS3MJ/Lxq+ktxiCJL6WL/IMr0qA/Arph5O7nVnYfN8u+t6uaZx
         GEY8XnY2KJqe7P8I9HnD9P8fBOplHScheZdjRCsepZbHDqueTFg/hyzI31lSXPS1bY7T
         jSiw==
X-Forwarded-Encrypted: i=1; AJvYcCU3cbV9BFmXVqjGIVuVjo1S9Kz3/WLuZqSPuhshPlRu7RijlCIRc6ijRuQWVzHH4tG+R093ur52Bu4a@vger.kernel.org, AJvYcCU8a9RvSe6bROqxaK/i8E+tVhcybZS/AEIDjQu+TlGfx87bH2685ojl33mM7QkSIZpanKuR62X3wdQfGg==@vger.kernel.org, AJvYcCUphWhxrZQu1OJ9eu4GUD8dUxSOyE9iTwwK+SVlDEjwIXbwk6s6X48f+UFT4Brbj44P16Af0SftwkAd06F6@vger.kernel.org, AJvYcCVHyZvqXu4CsnSG4yi8CXgyx3x5Gy4ZS1pFOgnxtU8LhIIlgpqcaWo6upPoYbpqM5eVTn04R1vxB+yZvSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXh2IWmycLumvf6cqhsu0NVp110MaRXYWGdHywOw/8IUCuSu3L
	P1oH0jiMrmORxAMc6JY9YWZRXwcguv8F+TLyrnVcNURlBpiOk/dL
X-Gm-Gg: ASbGncsbl3peUhgLKoVKL4Ku419vdEtX4EYpHibRUTYFKld7xY0ReUkunSbSDI7lvTI
	efuMIcg8GNp+OIkuDtxa/IdD1o6+1iQu8VP7UaohDOVyuIhD2r8K8wEePR9sfhxSFDNY3IXQ7SN
	8sUdHacsy/LsUM9g6urS9D59CPuPbgFrbKkotJPqMUcjJxUN6Nkl/3ZGf3QCdQAQNYf2Rm1VhIA
	evMZ2Ng9CP+DX5KgEDbvWRUONdUQbHabJ8M+xopGR7yMuBFKQ84BfZgVb+6JnIc0/PB82BvhZPE
	7QDz4VEwMHmXJQcySsUZEC7e0JRc/1ZisXNnL/+iVao7g+BAfX0J4IO1Zw==
X-Google-Smtp-Source: AGHT+IHJpkt6LaAM5QKyrUuU+iBRJp7mmLxht9TMjFEsX0Ab2stz5/9LcnbbS6wVDa34wHlHd/EPJg==
X-Received: by 2002:a17:907:7f23:b0:ac1:da09:5d3e with SMTP id a640c23a62f3a-ac26ca45477mr637973666b.12.1741510123537;
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sun,  9 Mar 2025 10:47:58 +0200
Message-ID: <20250309084814.3114794-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 31fb62debdc7..02857f0364c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -27,6 +27,7 @@ description:
 
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9295A only supports pixel mode.
+  MAX96793 also supports GMSL3 mode.
 
 properties:
   compatible:
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.48.1


