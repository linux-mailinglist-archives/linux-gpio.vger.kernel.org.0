Return-Path: <linux-gpio+bounces-17306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFC2A57D14
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA0416780D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6487D217645;
	Sat,  8 Mar 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLSxRFH3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460C216618;
	Sat,  8 Mar 2025 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458944; cv=none; b=eRtY1DeayXrZ1lcNb8E92cWLAep9UX9lM69Zfltq0u38kI+jFWjy6Kl98s+tVAaivWLs3qqq5R6oCRRVNXaEznGF2lIl12FJE4YnQsMCsWs0sMzLCFIOSZoNaCJktfYEzPV/zKF0WZ6I1PlURSAAEho8xEsqOkBolS4gwuTGjsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458944; c=relaxed/simple;
	bh=PSA5fazrZYGh2STXG+59g+TiLDvJm5XnM9PxyZImEvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ik/n7ODSRuzPLjBAGcY9znvn3qniK+4zcUozJvA+I92PoowEZ2sER3SSDzV1Po9aeYjoXguyTfz8Np+dB8jIps/B7M/6NarP8VavFLqmoKFaR6g/MkBGVeAVwMZyNx2ZeRnK1JIjXgo9TAautDdFLMlPJktBWJfsA1boE7WZDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLSxRFH3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac289147833so20665066b.2;
        Sat, 08 Mar 2025 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458939; x=1742063739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=TLSxRFH3CjZcpJe1ypT8NIzR6hnlr4nZCaXwcW6MghKOdHwNDT2H3LZfXyPEAIyqQi
         fv4554xtrsQ1qkgGGK5Rxp+lUYO15ayhEujEFlgPSPfx6P/g8aNoMbk3fu5u/gFoAk5P
         c0R1lwSTT44ofY7YQuDZlmLP6CRMT1f8IqJK7D5cf0iVDXUfDjSgVmKoxh2AVYca9uhT
         xmP5OwL/beaQ2hrQOyDJqLk2Fp3gagiav6Bpj2p/EAbuQb6Bn7U3hV4dpV2vTBy4e8DT
         aK0iVZHOpcL4PcwjJk/ww5hZPLYRa1tEtwx8gkAVkx7JQ3MdIxSlepU1VM2kvRRa/RYT
         cbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458939; x=1742063739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cOgPHAoL12m9EBozXzMPJw28vDXvvK81+CTquR3Aqw=;
        b=V/8JW9Ym6uz/5Xw8VU30UkBcZ25rRSxTtfqDdkiIGJXOwZQKePvHxW187kLma5XJ8u
         DIuDpKr61ixOUYoi9wiSHB6ydFSh2GW6rzCeXVN+j64zXBx8jiPPY3F5ApdDfFEUqZtU
         3NcdA6oZH7yq8UQWBD++cUh+Oumiwr4oqOIGjsE4dfW130KQlGiprPtw/zfmia2ixYIG
         ieL8xN0pzsjRyVlOrrWIYdN45qf7t6hKPOGSKynoL6Xa0HaNR1DY9ojBOxav85Pf9xMU
         o9H316OXVXPL6qllgbimVs3dVeqeoJQuY8LnOnBdCbaV2p64IbG4UQangsPGz9A9bZq5
         72NA==
X-Forwarded-Encrypted: i=1; AJvYcCWXZXrbEByfD1U6EJuSe4N86hkUE/KvAJGoKIS+tqrKEwEgGNz0P6qgHvsnM2nr9kS0U0nbT3XV8ixdWw==@vger.kernel.org, AJvYcCXhnOVqyU8lc0L/9l0iePcXIkiwIYW8Bv4lRmXgKEg+uEQtvI1mnRPoFSS9Ojqgu940a0LCYL93+HtSgdg=@vger.kernel.org, AJvYcCXr6+z3+H1SgA2dSEHpbP5Rbrwz+2Ly/CyWG0b8Q5fya6XqcZa/c54C3VdE/XBBmfzfZ5oeoNyRmbAblyzq@vger.kernel.org, AJvYcCXu2TKhkD4ZVSfilNvypvdkt7Wne/TSMJPDyPHDGSV2+gg2MDQkPneb9xjdZH6oqlZN6TZFT3fs+iRr@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGCHFkL9GexqiH2YSMgbkGOm6Dsb+vXgwXFBBK8id63WLok6x
	+tK9dY8HbSLbyv+mrSVGn89yF2mefPnB3bwMH62+bXZakrHFHuCs
X-Gm-Gg: ASbGnct7eAzdMxYcg1rwDBiqcRShCqrT+rPYZLilbxhKxiXzFAnX3TS/RoR1S6MdijM
	F1wspuGy9DpoXHsqOcsoLPN0ESSs2Ojla/reLQtlnm30R3gAWbbmUOnzlCNkHwPfM4okGWEVXYx
	GBdE02gcByAFEG+s2uu+euRDB/3z959OJ0vvB91rZs4N+o+szc77kKpVHo2acB4yBGpw0qP6cJv
	1ptHDEaiikTb0ahcVCrs8z+forYDXrxDcYubXz8N0cBTWYXhD0pTKjsW8P+EmBrXkyo5rW2rXjO
	r2zi7dt2JHeh+m97NseTU24jNQ4n63mkQYx2qhx10IcoxFL9rjY6kVRCUQ==
X-Google-Smtp-Source: AGHT+IHcPwKF5eB7VgOS8H61Ng0ywU+slTryB/Bsve8lxLP4Zc7Uc+Ntz4kGcsZJIup2zLzGgH7gHw==
X-Received: by 2002:a17:906:5ac8:b0:ac2:7a6d:c918 with SMTP id a640c23a62f3a-ac27a6dd696mr229761566b.57.1741458939203;
        Sat, 08 Mar 2025 10:35:39 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:38 -0800 (PST)
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
Subject: [RFC PATCH 16/24] dt-bindings: media: i2c: max96712: use pattern properties for input ports
Date: Sat,  8 Mar 2025 20:33:45 +0200
Message-ID: <20250308183410.3013996-17-demonsingur@gmail.com>
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

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml     | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..148d196b9acc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,22 +40,10 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      port@[0-3]:
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
+        description: GMSL Input port
 
       port@4:
         $ref: /schemas/graph.yaml#/$defs/port-base
-- 
2.48.1


