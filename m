Return-Path: <linux-gpio+bounces-17332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F8A58257
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ED9E3AD986
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB6E148827;
	Sun,  9 Mar 2025 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRT/QDF1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B88A1A3A95;
	Sun,  9 Mar 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510150; cv=none; b=fpfBsNpBGo3mPSN+Ugx/Y8LBFJ7NDcwhid8uaTcw+nwjqaEbB1HSupLpuNI31qR8jePaKawpR2EVN3EdjhJ973CZ92reBvMHTJEljxafU7xa9YLlEtNx8JWLEVxLTv+kBQMJI9GdxeapCdGOJMZWSCt3CFV1q0O3i7g//zR/Uxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510150; c=relaxed/simple;
	bh=9o7dWxkAzzvkB2Imojs5J6AXrsEiMQLNW5n5ACM0GTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy9BnGPKzZYFdc83N/kkU1wf7TuvabV3aI7GCsVqHQw60eVpJewgBZzU2f4EkIy7uA4WdUsWIMNAS8fw+DC4Kew9EuWwjFjyLjuUTmpDSEPqZpkpkcKO/uh+46dat3QyMvnWkCDx1x82zdnjxGlj+1yt7Yn/IcVyKv9VhS2FZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRT/QDF1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6112239a12.1;
        Sun, 09 Mar 2025 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510147; x=1742114947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=eRT/QDF1Ez/i40aQe4NGFJN+za/mxsCLQUhmOZbkyvyS1Ha9MIdU53C6mmr4JnLPiz
         FbLZ1hymbyBQvNkuMrKcd+oosAmVCR1+eRwhn+XlVFJVGjbgiGLxH7A2YRVVMGhm2dFI
         GWXunKmRJ7R7p/x4DZqlzH5y+9WWzYvXduIoMj3TxdeIkMuzWRECTmg+M6hA7BwSyU0K
         PhmdVbFXDbuliSugw1FqUz+FwwpMCIk214wfZa3sPkgn802hoIEyEtrDwuSiIedG6ZOC
         9CeUwoLmbei7LWyB+AD8aFSE/+wEVaHGiQnLS/puGjs/kFxitgdV4cOjlu0DEAK9rP+A
         P2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510147; x=1742114947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=cqXkG5wVthzRW2z/qXQEOVP/4+rS3VaxR8K+aY3ZK6TipOwA7NA36FnisuZMHOfWzU
         5VSXMHLcEHeseoiHEP68aUecU1BofsYT6DsT04mXBpaY6YYSyah91qP/EdbIMgZoIvuC
         ifhuPz3kRSK+sS5Dd3HmBbAUzryoizh5hQLa2qNBRe/T7DU+8sMNdoMn+crDH/D6tnP4
         Ubgz8ZjRw4YbjHwNLFYNunEuEzlChWFKuHl2onqsf5YdZzJtCw8/vzv8RBcWkRsUGc/P
         R3bW0DxVg4PGKye+sQV4daOzqbrO5Qysk3jpKFrDl+PBgbOeUefPSJJ938BAGIK76r+T
         EQPg==
X-Forwarded-Encrypted: i=1; AJvYcCUa/vD3PvrGmVr3jhu37v63Ryp01nNynrnLiuIFBOjbYW3UMSN+NplAP4As7V7Yfi/T2NpQfCJNnLgHvu8=@vger.kernel.org, AJvYcCUfv7uolAl1sKJ8d7gDtNYe+npWV7PKtd4y6ibsz/OT9y8NwGO0EWmLeyIdY/WeG89uEpyqqCZZtGFG@vger.kernel.org, AJvYcCVkKwB2uowuwvaPqzZwoIm80/NGjtX2C6/WU0wHNDkX/Yb0QH8g21J44ZWCiOIRrg5oRpWvt8s3hMiS2A==@vger.kernel.org, AJvYcCVyDzkRBMlFyuouTXOkY8opaWtZKmtqtbaZiVxfpe5Jn6JnMAK4kvD1mxZLMF/QAqPdxkM9uKAJwIzhR584@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4NCZQbL8JcTSaf7WIYrDD10o0wRDrUbZcIbHeIuq5M0QLH7Z
	cM0ZnjMcj5vOhs4fxCqcAbbNaaVW7QCdfkrbDz/ZoI4hhhhzPYaK
X-Gm-Gg: ASbGncsVzm7hGAiB7jSDF5oyAVHaPOcyBc/FmPvamVjru65BxA1gPsbtukrJutJTMp6
	EbGuFyc88u/rJFJVRRyCB6Xl6GCIPOhEghN5Hl8p+oocZ7O+n/MwwMkP7ai4ASlZtDWeAnDlu1B
	MXJGEcKAeUG4eZ9jADQ2q6iqAsvRbVG8eM73R2TRJoljILMZjOoyKet1hL5XudWDrQ/gvnpEB/9
	M3H5KE0tbn+hG+FnZcN8u0F2bdWcg2hjxG279Kwhn/7kpkrnjbNHNdUQQrwtOpIwkeqqsW3/Hkb
	BaTpWeA+WgT3QMNM9yemWeowZlNEqL3x8Oe9dvmz1jLYam3U+c4KzV1uFQ==
X-Google-Smtp-Source: AGHT+IEtJgNKkcfiGC5STawEzBHIltzLZ/lVjlnump5VNRcZ/7ElRKFxJl72L3LSI0tucNmXfakjug==
X-Received: by 2002:a17:906:f594:b0:ac1:e00c:a564 with SMTP id a640c23a62f3a-ac252ba468cmr1117297966b.38.1741510147444;
        Sun, 09 Mar 2025 00:49:07 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:49:06 -0800 (PST)
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
Subject: [RFC PATCH v2 13/16] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sun,  9 Mar 2025 10:48:05 +0200
Message-ID: <20250309084814.3114794-14-demonsingur@gmail.com>
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1


