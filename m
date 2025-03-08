Return-Path: <linux-gpio+bounces-17301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD664A57CFF
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB15616E5B6
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EA7215F4A;
	Sat,  8 Mar 2025 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hx2PqbwI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EA21577A;
	Sat,  8 Mar 2025 18:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458913; cv=none; b=gSXwXUZfcxrSvO/ZqKz2CFzOrv03GXOqZnDDF9qLUCYb+xban924MuAMy5juUhaBOtsInN1gQugjVSfWeD+sMvlQtxsqlXFQfjqDQ5nyuPyUdsRWmswMXarwtucrM/f0szc9LCuLigu0VAdTOcoyZ/5C1DuFcdTiWTikCsjHmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458913; c=relaxed/simple;
	bh=o05S0tGp3dvRdH5lVO/ozpjjZ4Bgkp1SlZ/e2LGGMnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBJA1nVkqQOPfsGSQIlmcDg8DycFvL0rK5u2hyWAKbD6AUEwbETQsBtj5p4p3kjT+DL13uZKk49YPhK30j92sOb0LoB5k7opyDy/BOQk19Xg2AJOkVXC7xdrl27E48YngL1BypB96Uwm/zxd5+uGYyoGyfSjoeb8IZ9QxSVE37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hx2PqbwI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaec111762bso550656166b.2;
        Sat, 08 Mar 2025 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458910; x=1742063710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=hx2PqbwIwtuehseHUPlzj90raV+XLIhFxiEMywXwSzQkGA8xsUipezTueqC5oipvtN
         FtQfpna+nrtxFV+EPlGvgBHP33TDQ2kTXQ6bbMYbNj0KJYmSvCJSAJuwodcVkNNgJ6n2
         SkHz7bcGlrN7tDg7JSHQ512SffG5VK40X9FBs8YKvsTLlrZ3yEWDZClScZe2SkHXUUnD
         MijZo1evraRBAjgdZjJyXKu4t8H9HBSb8qIXAuXexhqB24OPaVTOrfEgoVMx4B8YDJK8
         /VzCgNcV+Q9Cg36xcqFMFKYdTLi3e3bUfvozEqYvkGad68oztfMOnLECBq2wy2ZY92ut
         UCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458910; x=1742063710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=Qp5l/BJidnUsmcJPqWPrvKKtan3nw6++sSMWffMMauljBOT3jiMDZgH5eXzhFw0OXh
         SYTTlvliDlwPc+MouYKoZrq2zTwMoCVPaoQIAcCFnxAzhX+PCv8XpJWQiD+V5WnIlzDW
         FUuFs0J2C5IlaeKwG6crR56UjHhzTfFwLhO5YdsWqYc6LujHKere/JqxlHeCGzGyoldc
         TLtuJ9WeM/x08BARCOjd0WX4qD3xOXeQF7B6zrthlAElxJ/zg1PUAgGbCIUEjXuLd1cP
         NkAom5yM3ZDr7F9C9KV17ajcZ61tPgn0RCkFQ/1XBbXEN0t3Uvyh9cTEYytDctasjv0O
         qXqA==
X-Forwarded-Encrypted: i=1; AJvYcCVMI+oJHdmXxmzmWUjtg0UTyc9mLQzYAYN1zz1UjUuCltN3dr5kHjWhXjMCTqy8s4WbxAqPy7Fj31ZddGLC@vger.kernel.org, AJvYcCWdcyZf5eBn8Lwc9cE7LMLM36kxFU1F5Ju14SYuETLklZZlVgwrzA1DMZiYyAogK+BbI0vgnTXcI2gk3w==@vger.kernel.org, AJvYcCWeDh5h7j4Ni4EOM13+pWvRhw5rtrlknKeBLh5dYdu+vt5hdzmoHXnH5TllPFnSHJOSp1JxlJ+y6wFFtuo=@vger.kernel.org, AJvYcCX+QhFuVZkkwUzbdYK/2PJvtaZqhHYCuxeiKyAWVw9hVj1PStWNZR4WMPX5nhXZAzJeC/OGbWE4SIUk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5imau+3o86rSHzUytFbIjKz6sdvLgCvHqMWPnwk0yYa56JPB0
	zxRVHwzCCwfkRWmARvKMayCdVxHvctDivKNrm1/k97hNdZkIl7KF
X-Gm-Gg: ASbGncstMJKmWoVAtMQXR09sgX18tcYQkV/JHBXmk7txYrvty4X5jkirhiqK/pUKfTx
	WXoDNmjSKzz8o21CpDqFQF4uNB5i8UnjDbJo3cVg4pgIvz5owJTPlCoFFIMD4+EH59o9Pg5gNl2
	lS4ZzSkbUd2iarT8Rvs5sHuCl2sqluw+e3F0Y6w/w+kEAcHDBQ489wzLyfm5WZi8jxqf9PxNGcO
	xO9K1iheVzCGg/cC0pa2Sa/tqBXRDMh26ocIPTQpK2J+f5epv20s06+VTGvpWH6DxQZ1g9FK90o
	T4s2NDnCu7tG87dQwaZZjo1ziqiUiwwG9kzgrvmk0DzcVbJW0MU4hVkJow==
X-Google-Smtp-Source: AGHT+IFkml8eKK0tt9HJFaDP4zPVB3vHkGahRibCFcb1VL1+aECeQ55QqNbdYqCYjZhicTjwIyr4zA==
X-Received: by 2002:a17:907:1b16:b0:abf:742e:1fca with SMTP id a640c23a62f3a-ac252a9e1e0mr879939566b.18.1741458910140;
        Sat, 08 Mar 2025 10:35:10 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:09 -0800 (PST)
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
Subject: [RFC PATCH 11/24] dt-bindings: media: i2c: max96714: make supply conditional on compatible
Date: Sat,  8 Mar 2025 20:33:40 +0200
Message-ID: <20250308183410.3013996-12-demonsingur@gmail.com>
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

Devices to be added in following patches have more input ports, and,
implicitly, more POC supplies.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f0ae069c93b5..5bbd36c55ab4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,9 +41,6 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  port0-poc-supply:
-    description: Regulator providing Power over Coax for the GMSL port
-
 required:
   - compatible
   - reg
@@ -62,6 +59,9 @@ allOf:
         - ports
 
       properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for the GMSL port
+
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
-- 
2.48.1


