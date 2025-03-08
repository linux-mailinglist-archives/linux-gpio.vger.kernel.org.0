Return-Path: <linux-gpio+bounces-17305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39CA57D0E
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 766B41884870
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639191EFF86;
	Sat,  8 Mar 2025 18:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI6djEWy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE4120C029;
	Sat,  8 Mar 2025 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458939; cv=none; b=Rn5BhTmywQ+KnFZADZnVpB29Kx5qEkG/cp98Wcn1r5IzrcvYg/qg/ujKGxbqkvB+zzAMBBrzTsuDRpnM00TnQ7tEcy1amF8Lc1tcVJGY76gFi3ixI5E8kMDc1M5LNVQ9r83gNqYyOIFbtVU9hAwdTkiSqvUwjSKrzgezIpfNAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458939; c=relaxed/simple;
	bh=C3puY2gKJR/vIUjpUr7LiUyw0554VXVmNsc0xT2yhyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aun2JeUuMzTsmsTpmVKz72v1W6GUqVj7fdzNuNgk4f+hc+ggfF0faEL82I4p2vpTCohykol6wLSlGB3Inhip68td769K5Huh9HHSCqyAH0vlvuqEojzvO2G97tinSNMbkJ0Q/ucj4huoZIQfwgzai0Xw9mmoV38fBnP9jn7bwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI6djEWy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf48293ad0so469545966b.0;
        Sat, 08 Mar 2025 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458936; x=1742063736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=MI6djEWyQuAxy+D0xXpNyNQE8AgcvLXgnEr2W9GLN2ucDebSex/m3+VpftAs2ZPY3f
         E+NHzB3JLrWyhpRJaGdudWLZPmtw+V6Qp6Cu5NazxkeR7wZwGmc+VAjsQWVSQosRpORj
         C0rzmEBdlepMoOGp/s/Hl1IQ0FmoD3tCmcQ53UnLY+SKiYz3hLzIGXJwi6swGozPoKt2
         pZjjQ2Mtk6sla2OIxh+chsyEBUtDVt6InvpCH2pXM8MshI7Cm8WW4VeNNzc73CuNgFvP
         rXvd3UhiLaxWZeehQ/VNKhIIQQBhoVqMB9gDbn6XDmvGy1VmgwQibDrSQkqsJPin/YSG
         7uhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458936; x=1742063736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCsk/rfL/dXjGmxlvAv4Wmgs717Q0qsPD356Vdw2nxQ=;
        b=nCmPo+Kh1T9BnjEsvT1bq8iFLtkoAEattiJj7oeSRJrAFa4CY2Mfu8dtWro4GCVyDt
         zeghdymq0FEJ6yFA8b9Oe6lYUVlAuvoAXu57ZXvrKqsgn6MA92f7CICYwlohKhZTJXe7
         GVIKWzWvsMkmvL89g/IPe3ySX7nX1iTew/Z2ihNCghwfk/ZhmNJ+gtoVkdMuPTcWHhHK
         0/Dl5/ctlH8prBvBqfHhO2w7kCUwJpgKo75TDuFwcH6vPpRHc3VSan2QzjRyrfXYbG/2
         XBAm5U0YrJpOz78BVmLLkCJXRzH6dJNjCFbChVneiMFeswUKw/auQe8q5vQpLWUIhNZZ
         RNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV06byEyEu8WKQJ9mHuBva5KFTVvwGKYhLdIVZ8IPmFEal82+W3YCYrGmL+Vyo44314U5JCeWSmV5CU8wg=@vger.kernel.org, AJvYcCWk7Ly8RsoQ4QOwZhqn74jgQXze1Yx4oZe7rcRfC1rwfSoXTKaZf9cTWVrmr7H7oQM5btdlsw2WwX16p5Su@vger.kernel.org, AJvYcCXey4kslP5hNsqVHp4OpfD2Hxasbdmk7ro69ZWJmeZoXTDx4rOn44li+Q19QHjDZbRpceG8AgQw0bv/@vger.kernel.org, AJvYcCXsFWh8oLLGxDggB2oEKkIM0pb2gsErdU6yk6EAB94M1SbqnX1vcwEmw18FSoD2QpgYuEz9y94Kpqwk6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLvhXmg2XlB/FchliCgcdAKpARdk1HWuWsR99NrOC9z7uouMo
	1ii7tUE+hHdRglwNBE3G9p774GrSQ77YRp7deT0pZsqOBt+R8B0L
X-Gm-Gg: ASbGncts2kY0VLW0bE8Rmv0vT0UeOF5v/PGyoht/qKRKhFEhhxHuMRVim5deavEh7os
	hkd/S6ezVxn3mwQ+1f7kdhUUbFzb3GkzuARt9F7Nmf9TVWdYkOwsNILYj+k3Aeb3PXFGBILwRWm
	IlYk9FxlkwNgX9UP216bggaS/FJ2T1fG+/f6ZkKq1HnUlIlwhdxRff1TJw7s//RZje0qpcEvmx4
	mz7TLARj6dPNRbAYMX02x0LlpX9vVUjeu0cuMqf4tlBcVeCyNbqd5nO6Q+ED3Tzr+l9LZHQulXC
	hw1ZhudA3ED/zm6icNXycbPR/4SH+J7inA33OJoRI7Oep3ytJSIRDlj4wg==
X-Google-Smtp-Source: AGHT+IGuZkxoe/YU55gAOydwcd3lXHtaguNyV0TNC5ENcmXJiPj/O25J37irkr3OZx/XpOJhzTPfZQ==
X-Received: by 2002:a17:907:1c9c:b0:abf:69e6:438b with SMTP id a640c23a62f3a-ac2525e040bmr1055808066b.9.1741458935572;
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:35 -0800 (PST)
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
Subject: [RFC PATCH 15/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:44 +0200
Message-ID: <20250308183410.3013996-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index 7fcdcc57c8ba..84078626ed5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.48.1


