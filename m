Return-Path: <linux-gpio+bounces-17321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCDDA5822B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61BB188C7DA
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7D7199EB2;
	Sun,  9 Mar 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq9X/0LM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCA192B8C;
	Sun,  9 Mar 2025 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510111; cv=none; b=WtvmYFNyU++UNGkYM6GtPYVQBLGjGN/xYd/9wDc/C2BuUXazWNTILvW7dwZH7EeC2jtasOaj/WRFpTBjXv4hTF/rD0pDwSbeVoGl374tHveAokUIj0N0wXniTlw2x6qIzO63ZdIbhPuanRJ+TF3//8OA+2qSjJ62b+SGK6FkYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510111; c=relaxed/simple;
	bh=7z6smvZGWZK5IVexMzCPUepQOMHvMOYKwZikRSdeV8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfItMhIKGsr6bbDcx4OZLGn5Ys+jhtcwcWs93Ou61LrHRby0cOJFoac8TKGRXDNIBFm0TLpBb7p4ztHQfSQEBZIJGkk0PZKyYw0ljtqTmIoWE+GaPISP/YFGjplWJFuK9Mv0gYy7AAZKyLyCvD3cEXhitd6bVy0Gf/wVtkGTpro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tq9X/0LM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so3012040a12.3;
        Sun, 09 Mar 2025 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510108; x=1742114908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=Tq9X/0LMAlF1/KScfHuRJzof0aQMZui6Vk7V62o+YSlOXg6V+LsfWvv1+J1gcnPbAd
         NwDVLfTMuR2JLX50FQ0paomFBcFwoHyK4c7rc+vxgwkRjUihV4kFpY+vS8IvXYMkjDw8
         O970azxtj/e35OftSfxlYKREHqa4qAND8ClhzzWwbBMk0LU9JiSUwY4ApNCj3Unw0Uyx
         6QHqaeZPzlbuWjxCa9MRn6KiKTHXxi5zzc8yLnHRSnzBhXh7mfB7qpCqqOepdQyix8pf
         tUIpgOO9dYYKSayUukRhHCOWRgX/ccGLu7j2iloOuQZM2zVLXoDyoyof5MIKgOycs+8b
         zzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510108; x=1742114908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=j8Bf5nhXy09hnGhw36uMOnxEeDCL13aCvvgzdQNtQplApK0iD71VjxbCyHRM3n+zX0
         ZH2ARt12IH88moJsib9Ctuj0ERQT2vj+uixKlFlUosv9PZKd+aI7c07xHV6sjkpLKZsd
         1SRPOWazv3tYLAwOYCN3/I4g8VpwhC0wGX0Aw5PsZ1VWIC5yknVKllVCTx8NRueSckZA
         jSH1YAB9p9r0zmd6QXJ5QG4EnbS9yiMgfWTv4v6rkjOrKev5UaQqT5tHQlpiniLT6GXI
         dqBsmO9Bs/Yg76F+K4lTLVD2Q7o/8nq0h9P7OX1Eg4z0zoqt0bxXCM3Lgoi/R1omDaLf
         JCwg==
X-Forwarded-Encrypted: i=1; AJvYcCW7g+pFwU5QGkV/k0okl7SukzDpePgab2pLkG0lFtyg8Y1X6nUoCt7mFRopGDmeZgz8njcb8BrRCAT7@vger.kernel.org, AJvYcCW8rHKaVg/65lBGbU9xVFlosVnqP6dLtmv65hWJOmbZCoy1K11tV9trmKAoV23HbnZtaeySI81jX43VzsI=@vger.kernel.org, AJvYcCWdB55KtWsGqXCk+io3MJRrVfFZLa0VRRv1Pvl29l3Bfr7+9mQZM+iwwSefam3Q7XznDkx9rw+gSbyHsg==@vger.kernel.org, AJvYcCXP1+cm3gbZJ9M6XyaJ9a9wDQwQJOahBOXXh473pt7+XylenmVFHQvTok/vJ4UK53Av6+ggWLxpnHWGOIL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8QP6i7nsuLX+yrQeex90Z8LDfA/gSeGfxvW9DfQqYHCS32ci
	WXoKZ5o3htjAvn7mxH5YF4dJFKq/j03ZCRhQ0vf7VgheNWp/IPfX
X-Gm-Gg: ASbGnctV2g1hPYLq+vqPLw791si25O56Pz5gHNtu8CaqST2uSwRb1x2t/uqKmNFLNTA
	XGdW6pf5wJYAwsINUj/UGxI1myyfD4ZqtHhUJd7TUCZ043A9m0n8ZcH6cVQy62Xp+x6XCIDJi2R
	KV5ZXhYE5SvN9pAvuG9z5tdjQZDBGd/ZUlkpmuuLt4lQ8rUNHwXjBvrS+snJK4wnJnfogCiTy8a
	+kuo3tC9rrbWyDK1MLD5SKhFfeRfLiDcXJVV9VBeau1z56CwvO4fAlX18IAP12QY22Yc/mlCQLw
	6aSnbomRU0+ScwV7NU7mqBTOFZEHyOhOp4sqbHwt4rUbCw7hA76gvjjrDQ==
X-Google-Smtp-Source: AGHT+IGVFkKRzT6+IwXblZWULuiCcIjFTpIaLv4LnJDpvJxC9xj4WrXnY/iTgXKB48kvflgou5SSnw==
X-Received: by 2002:a17:907:7255:b0:abf:51b7:608a with SMTP id a640c23a62f3a-ac252738131mr996109666b.5.1741510107207;
        Sun, 09 Mar 2025 00:48:27 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:26 -0800 (PST)
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
Subject: [RFC PATCH v2 01/16] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sun,  9 Mar 2025 10:47:53 +0200
Message-ID: <20250309084814.3114794-2-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.48.1


