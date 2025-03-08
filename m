Return-Path: <linux-gpio+bounces-17308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52FA57D25
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF6E3B0CD4
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75EA218E8B;
	Sat,  8 Mar 2025 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABvEsHfG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA5218AB7;
	Sat,  8 Mar 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458950; cv=none; b=k7r20A7NLoqEhtK2fzUnnefBUNpx+iwQ3+jZEI7T+6QYlkO4Y5R8GEkRY3JxbyhqWdwTmyAppCbBmnY1iDh2sNf36ePhNRZoVLzDyRG864f+cx2O8Hu15JS83b8uoAGwG7Fm17m+PtAZEziMfgVaZYjUfZw9F1bDsfaUj9QWgpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458950; c=relaxed/simple;
	bh=NYzMuVB3B9usgVKCiwjaVacmFf7hMikuoDeAMpRnNcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN5BoQtWlHPTDqy4VA2ZF08dqq7oYeotIzX1QSUdLtsKms+TAozTwkchMUfhE1KESA1p+wCcHtcKcOq1Wnz3/7/qtNhJ+Zq7FoWdRBsxb6ULk8Jb9OdfRl34BjlyabfsK1oIluXHlekL8duFAIrIaml8D7MS1OMwIaT0oVE+/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABvEsHfG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4249130a12.1;
        Sat, 08 Mar 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458947; x=1742063747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=ABvEsHfGc/0NElZ5yFStmfuO467VxeTwzqqZYhWrKZQe34+TxzwIkeZLWygT18KznU
         tyJL8vtfZShNw5d0aCvKX7KbKtuSF+nmOJ1y0cRD0tb3G5DM2NmiLC4PLdNn8aFn43Kn
         kxPHz7UROPqnHN4ONV/SziJAqQwEW5zzaOq4kBCDeAHF5ClqpfZErBd2WCDBfRys/Wy7
         sZx7qlzYFr5IYw5KqtZuvLOtzToTBtququvEo9CRAnJF1imm7fwyYwbnnauLUGmp3c3U
         UpTtibPY8zZ5VwelNUW+zAGzG9nwxaj06uJqmTvD0O66F/gkJLRR9/UGm6oi/oQxABwh
         Yh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458947; x=1742063747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=sMKZh2JU+r20F009jvMrz0X6Y9+T6ncL52HOQwzayY9vvqks17iO7P+CJciuXNwGbQ
         Hc9kCJBjEIdkuSwF6JNMrfUejNWvtHwW4uN0XeBKKyymgwmeOyaqpYk//wKWtWmxkiGB
         V0S/0+oaVrzk9iJzB4u/3tp0MGKyAB9FXU7h3IIJVmSNfe0AWS92wiEM3l2I05jcEAsO
         yshDIQAfuWOk0h8qHMEiBbJgcHNpuM43tUq5W4zqnPAN8YMUZYZRL8eMzPek/VOUHk0P
         JUiIpcOVp2il/wb8kUPUY5PVsolHOlT0e9gUcfGRVjwaa3AYpLHZ/5Lvt8TA5M5vMNcP
         MaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgWXH5KjWzv5Gq1pmmF1RTBFrtZuwVaFyXsUWX5lCRb5QNjf2uUb87Zt2oqsLPw8XyEI1iGKFiZcZh8w==@vger.kernel.org, AJvYcCW5GITBaPqpfQvJNvmuXvPkktdI7Nsie0jqKTJqllghgxTH1qr+BuvVhZsZacOTDjbx07SjgrYKPMw2@vger.kernel.org, AJvYcCWR3Q7PIbcykVYno2e586GtDy5WwvUMAa+57qe7gUht/hv7wqKiVP0kOy6cpMUmvf8kzLdkKjTdKdlfYlxQ@vger.kernel.org, AJvYcCWv3glNR1wc0SSMPMWhBvryjYJ8uWGWWOa2w9+Vw2SOGRJl8waBO+uzawHACNTW4+0V7yU+dV5pWADkbpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvTU72XI5BrKW3dHglTmgMi6OmSQpoqGcFNyrhd+Rhje1kmCR
	9yr/oSpM2naCN5A6YqOJeGtl6zUszUwpTK7cc4JqqNl/J3IX/DD+
X-Gm-Gg: ASbGncvMpQ8CkvvLSt9b0l/cfoEHrexLXWnrieHEPrXXaC8sF8M4R01u7wuUb5wY16f
	U5k4njnq6FxmwBWVCd0v26JE8Vhh/PNePjGn0qiTWJ7uSmqq54PnFX8//0weLZwK/8gGBSudMLo
	5JBau1VXzE+Bgb42y6EnyeXixpSwlskBNZTiSgmMCD23Pf7+NlsqOIW4LlkBB1r++YnTdiLYRFo
	Wl5RpnKHgV6w4C5a2GjrLQmnJnAPYBoCKH+upYsfBs7uJp6G+IfQIUPgqjQeB2EzTPX+SBwkvRc
	yGSt0qKfi2q18y6udmKKBbwzwnG9cF2KidYkQS9YUbcqN5aQlPl3qfgYIQ==
X-Google-Smtp-Source: AGHT+IGYYdE8ygjHkGbwYFxdRuN7/SMwMWgaOvxuGGIjcdc5JQxB3kxCPC7VbHX7VMiCBnhZf/DQyA==
X-Received: by 2002:a17:907:c313:b0:abf:27ac:2cf8 with SMTP id a640c23a62f3a-ac26cbc5b28mr427259166b.21.1741458946975;
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
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
Subject: [RFC PATCH 18/24] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sat,  8 Mar 2025 20:33:47 +0200
Message-ID: <20250308183410.3013996-19-demonsingur@gmail.com>
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer muxes the I2C
channels. Moreover, the serializers can have the same hardware attached
to their respective I2C bus.

The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
to facilitate communication to each of the connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 52b5603c2f53..4c4542d041cd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,17 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        properties:
+          reg:
+            items:
+              min: 0
+              max: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.48.1


