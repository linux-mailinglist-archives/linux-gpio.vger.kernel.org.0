Return-Path: <linux-gpio+bounces-17303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F120CA57D08
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2865B167385
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E392163BB;
	Sat,  8 Mar 2025 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4wHhwks"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D482163B3;
	Sat,  8 Mar 2025 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458922; cv=none; b=GqUXA4NsVIdjQaXu5zM7M02rhv3UjNwSwRbH/cKqchaa2QX9y2r2cH1tv+DPG/71l8Y6Jep3/r1RtVeE2LJ4NWSjqn3XeYVkhS1Ap7tSAGUdbCX9QnXOvHs+65OXPSujarEJMVpnPuiQayefR+4GRDpowl0Xkz2U1aKIP0fnOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458922; c=relaxed/simple;
	bh=8ZE9rC+k0ylA9+L3TmlcZKYr0Wjz0Tht4eUfO+AkCjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGz9sOarVsj4elJhGXKkycxvRmEOdRVytWO2d+tnjrZ89n2sY3wny01L/cKw+1QBcGvxTkQqUzeFh7K79JmUn2oXEkLXJZiJU4gZ0Z0TujmH8JV1JmXzA8cjYs6w6Mbm5mOJXM/A7mlkyLyQjaYVW0UUm6fW+FgLStO/fBPBscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4wHhwks; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25d2b2354so253093066b.1;
        Sat, 08 Mar 2025 10:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458917; x=1742063717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=R4wHhwksWUzhH6DqcOkY7QgJdwQG4txMLotYnVDRBriGxaZNz63bca75/QwRTbsC2l
         fxlTNXBp656MBJSWbE89aDlz8YJSs/ErQHHA9i2saSahIkgXFccAZ9kTlTsjOvyvN/s+
         mzgpqnCIuebgJD3OFdJG3jrkgWrviz+0iaGnNN4yTZjZ2VYu54YXd8HFPK2ZUtZjtx6m
         NyaHioPykhrUSIDMpypiyHGDWUu5IDTKpUxsxPCijd8EjCVCNqx/TwAhdL7Xhl/SVwiz
         lac7M1UuUNvKy57Ye6uDynKZe8rbXVGjQ9LNgLxHNpJ9QeXmWYV1Tw+U0BQJynFUJL3k
         l4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458917; x=1742063717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0nLPR7+Nln01PT5ZZw1hoLmM980Fwy2kz6sbBJysY=;
        b=BeKzKBx+Hi+KZxiXQ/KbKEKWBWfpCg3RQiVTkiVf9sWiqvLrgLRxjRahIovwEUiT3U
         SRl3nB+iNk/emaA7pIy36/K9wnMjKoIePog+0qmDBP9DGbTr8zL7gTmnyfdw5An5471F
         Pt738UuEmazchkVw9AN02UHZYb7b9f2LKr8MJ510sGKaRJXcBWUl+y2BoTevE6ztuUEW
         Q/1m6qeSjaDcaeyzEneycdThiiwimU8qoQp1H6O1EWWMWQMfxCQHUzBDIoGxP+l6bjy1
         YLAYZkTCT4WHDFFzemxlxPHY4H52C4bUeazREfW74dGNVeY9GHQPczyQWYpw0RsPY80e
         Fadw==
X-Forwarded-Encrypted: i=1; AJvYcCU66ZNNHWAChGin2rm2kefzT7Eu6TENZeNYFrX+OT/lNThPzU6VcAlRgthWekqYS/jZ/hIYkl2zDQoeeWzp@vger.kernel.org, AJvYcCUCo8dRc17rfFSORHsENHwF1BX8zeCCspZofj6WTycu9J0LwCBGoYTrSTEyLaeOa85T+fU5DevJ2eMf3w==@vger.kernel.org, AJvYcCUJurkbmoP9fMINDYJOA88JOKv88U3ZSxDCKBWx2Q/uOr/PG5NzW1kgda4M62v1HczxXEHXqUSBZX4K@vger.kernel.org, AJvYcCUKZ1H7s3Yrm3OIior01Vw31yPXxXotMixmKSFIAadD03OiWaoF7udTCzzZOYhzgKW/mD5orZQPX6Fe47c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLO6X/p5P5WuH+7kRdyJ2xlWrZoZ1XEsvHmdsSJbtw/xUUjmV9
	07RsnE5EoWtO64tb/HynGvo8fWEIr+p1l4srnsQgFEVk9gzQ9s7t
X-Gm-Gg: ASbGncun7NcYbzMyPMoh/omKoGYvDf7qW6OGeHVcJ7bkAqO7rI2b7nVk7CApb2CrG/2
	gE0MaEY99NnkruKjHUzVzprfOlNFsEvlhtcHddRdVn2FwpEfcBSpAYKzAjD0sWX9Z+PRQK7TNXa
	4uIk3RZN7QFRJWJ/01dAA6wJ56RcgO7UPydVpKbXrfQ8jl+ViqDb06gxY20G9tbDBxs4TlHkHh6
	oosMcZEf7MxONx6NWrJBbaLXhhdR6E+JFmHoBUdL+Pw+enXMTL7hgNHNuJHRt3X5vT6TzuGKHtH
	SKdf7U3AWBDZHV/FfrVnm3zi0EpV5H8pjLYJJKywlHduzW5Ig0lwMKoHe/3dC0u8cLW+
X-Google-Smtp-Source: AGHT+IFxa4QmBw7Ig6TbMkCdhDiwKrrIoEA173KNNedZZ1zvVFLBlc4GfcP9AWrjoYPa9kZijnAFSw==
X-Received: by 2002:a17:907:15d4:b0:ac1:fb27:d3b7 with SMTP id a640c23a62f3a-ac2527048a6mr603962566b.21.1741458917335;
        Sat, 08 Mar 2025 10:35:17 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:16 -0800 (PST)
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
Subject: [RFC PATCH 13/24] dt-bindings: media: i2c: max96714: add support for MAX96716A
Date: Sat,  8 Mar 2025 20:33:42 +0200
Message-ID: <20250308183410.3013996-14-demonsingur@gmail.com>
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

MAX96716A is a newer variant of the MAX9296A which supports both pixel
and tunnel mode.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 9c6c79a770ed..d4055ecf673f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -25,12 +25,14 @@ description:
 
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
+  MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
       - const: maxim,max9296a
       - const: maxim,max96714f
+      - const: maxim,max96716a
       - items:
           - enum:
               - maxim,max96714
@@ -136,12 +138,31 @@ allOf:
                     min: 0
                     max: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: maxim,max96716a
+    then:
+      properties:
+        i2c-mux:
+          $ref: /schemas/i2c/i2c-mux.yaml#
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96716a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1


