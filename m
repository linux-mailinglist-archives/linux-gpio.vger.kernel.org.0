Return-Path: <linux-gpio+bounces-17327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09323A58243
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9A877A560C
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84921B87FD;
	Sun,  9 Mar 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsB1+eXn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA321B4226;
	Sun,  9 Mar 2025 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510130; cv=none; b=DgrHJTnUp/tclg8fVQUj7QxTzmNcTTFLOvfFy5YEwJRJRlB+2hQl5xyFddEmvdUr24ysVlbKeTrtIDwKuJSAbIPzCsZoS0H04ZTJ5xYR08IPwqP20D9umBPZ50Xl99LsBPGHuaorHtX/Z7HFu7pSRIfVeJHcnw00kRoEbt0ast8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510130; c=relaxed/simple;
	bh=AzgRF+jbMhC+vfx7CPem6eqzqNZ3Z2lH4KyJ+16TxOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAvF3kk7ap+UDUyBbP5BJHvH/YxxRH7uWXVXgQcTUAv24YQ9wGDeDLXSdQmvVKFx92LK9qVwL20sYrRGpmHpeZbJUgORz9QzcjTiE6aL6JbmlxFA0EQ4jSu+JogOOTLR6kfchlM7ZZVRXXMVegyEV+qmam63/8pGeEPvf1m5x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsB1+eXn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so5060860a12.3;
        Sun, 09 Mar 2025 00:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510126; x=1742114926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=OsB1+eXnMcc9lHnQWWG48ZjBf+VwdMYhhcthxbhhncm6I7y+x+i/Tv1scR8rXVNZzP
         R9sziJIMqVxqjo2E2d03oqhOYqIYlSHtP6X1Potc4Fb3XK3l0vldfEJ46FktZcVcN2SP
         oHJRS1NfQn7gh2XpfGxh7v3ecBrfAT3RLRcjWEKn4aSHlpmBlRYtBJOSRmUquZYkYAA7
         XazFlQK0v1sX8M2YxONnbaUIwplqIGrupvUYp3SaJWRhjbFEO4AjaKKPyF+lpatIb9jf
         5ijvl5syRA2QpfQ4HGDFXYmEHK/UcVcYWARDQAswxsK+PlyrGiaa3+qOtD8hP0q9pq55
         +tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510126; x=1742114926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNEKDUXXNxdZ3aoZYUXXrkyQwTuziw3tR5vOmFxFPD8=;
        b=mud/ELQUQ+7A0wZ3LMBQCcVRk96/X7NRoUfRFUcWEv6cFGVsrVFCNc2HXEZtHouHXp
         BWclgmz7KMkYTTKXJo2hxI4ujD2eCb+8KCwxZO3GzllB3xddDMtFP5kYC5ujw4G1fl1P
         YOwuYKHYhLFEMRQq4C682eeUA33En8pLhRFYWQOAyKTWsq1u4zc3nf2o94fNRnPlypb6
         A8Xx0jJvovdyztzPUekPoHHmJHolvqWtcKtq56/ZM5BNpEcQrXO6zWP/eKBapr0QpFqU
         Nqn1z2Qscg6qetFCVkZBBc16AVHVSFKf/EYMyASKvh6tIFyQM9/TMr2qCLp2kuWY3Ch0
         lKjA==
X-Forwarded-Encrypted: i=1; AJvYcCUNiN/bXBsDeFjCSTFnXFpSk6Jo9LLoH9AWgmwrX3JgdMIcerrGiAWuVISX5ME5URtJz8KXnpa79Jwi@vger.kernel.org, AJvYcCV64bxt6OyIO11FFNZd6QvQWu7aHiKyWvNA1Tknrq+yxuhC775INVymMrmfap331Zkq2/rsPIYyWDdxMA==@vger.kernel.org, AJvYcCWBB+MH9rIrO56DowGEPQrpuGIExLp2hzLB3DDMcxKF4CfKZG/UvQss9qZg3HIZEgFtczjrCt7WmV0nLuP7@vger.kernel.org, AJvYcCXykyaIlkg28tFAMv5TegP775ro+wakvfjRRiuIb/RuBb7BS5C32ClANewVRnebEUWKsX0FlzsDVBalCWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzak9RSuoUvwclBZ9sw3pUMlBeJJt7wAs3oDKA/1lEzNfIkbTln
	1G1usKguBX+2FGp6qP3iJoDcq60kK7DHlHat/TcWREg2GJCE1SWb
X-Gm-Gg: ASbGnctkldI3S+JAqCoZYeEJhdCrppXqA8fD+YfLhEzAyiHYumPekOoxu4oncBPcVIP
	4vS1iadafR+cQfmQZiLGLtE1Gele3jhvUmbnWdA3Jhh2szfqQrTopv7JQZbqpS0b+CpDwFg7Alw
	/Yy06fqzMRSOmvhF8f6M8P+vgE6icu1qCqK3/gh8UDcpPjt3o+Z5piKCHxg9R1yywNWuzEq5EZL
	8gYCVtwKZZyxdE0qlYIVm8gq5dMOLzX5H1BQF/zovxcS+gSWBM81VqwZJinuXh5LBbpLm37EiL2
	yXOLYRPeLiZdu8QuvlDq9n/b7lzfQcq344n7h/8ZxskSWsIGd3L0wnVmxA==
X-Google-Smtp-Source: AGHT+IFd4OXwST2S8J6EVuRFcvfp8HeWmw8/swAHhqOkgPPhysWXT9icPKoNrSp/fqbd/dZ8XFRNhw==
X-Received: by 2002:a17:907:9719:b0:abf:46cd:5e3f with SMTP id a640c23a62f3a-ac252a9d6acmr1037408766b.16.1741510126320;
        Sun, 09 Mar 2025 00:48:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:45 -0800 (PST)
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
Subject: [RFC PATCH v2 07/16] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:59 +0200
Message-ID: <20250309084814.3114794-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
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
index f8ffb7cff9c5..abf3afc95fc9 100644
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


