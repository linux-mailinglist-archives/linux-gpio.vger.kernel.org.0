Return-Path: <linux-gpio+bounces-17291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A86A57CD9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C70D16D74F
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAE51E51EF;
	Sat,  8 Mar 2025 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg0/a2WV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071D1FDA69;
	Sat,  8 Mar 2025 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458876; cv=none; b=HfbmiB/l1dnNtN3cWTcjj15L54VV62x8HVtvDH6USV4nnxtAfLqh3uU0PphnsnYLltAwwC1heEZr13imhDlhQuTNimJGbaUnSZMKwDK/JALwJ3C8F7r26cCqUdDBKlUyteR3e6JOzUOnqVgoByEzuuU2rXPg+WSd5pL5FMB8xms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458876; c=relaxed/simple;
	bh=7z6smvZGWZK5IVexMzCPUepQOMHvMOYKwZikRSdeV8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEWGi0yt4LHShQwkpxHeSqdZcm/JC+aFlyjusVE+jkGy1+xYXnECz7ENmxX/dl1Syp1m9RiF6koGrHWg5F5jGzE7+Ue1hSyzR+ONYA5tkIi8Ksq1wBcXdbdyjXHqVmQOtFV3Uc4+e4ob17BJq3H/bblOcaaZXxVXtyzvchrX+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0/a2WV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7430e27b2so516737466b.3;
        Sat, 08 Mar 2025 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458873; x=1742063673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=Wg0/a2WVPddYiWNnmDiphEseMhWxkUuNuTg7ITo8WkPfDmgzVe1fPoQYBedVe/oU95
         TAByeYxvubJ5ykrWM/2oATCnR4AvqnhmGVN8DQtmGyxSOf337M77tqTow/ICKFLdDgD5
         Re1/8Fz6KvfvHGF7dYF4kXoDNg4tg/f0xO6N+3re1TH0Zopm55bS8MVAii2+FF3WvozX
         yiq5xixOMt7ZdZ0RARk6Ql5NE9AjvAva/BkeRKhWSd+UtrSVb+V+doiprcXGfNzv/Y9O
         BvSkgr6JzfpA8xKZd+eUgOXOnDqUqOTQRLYa9jSXJ6hB8gXtQe+8lSpesn2ZIQmEN9x6
         hWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458873; x=1742063673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLwWoHn8W9MlyVlWzzyNuJFztVqL0l+N+say9TiSqnw=;
        b=Szgr+Z833tMYwbekaCnjDIoQdYlf75rf6sAq0kLW+MZ0i5Mj0+YsT5Z5fEdeJgq3Dq
         QNL409Efp348fb8y2CGs0p8te3qNbUePEA9X4yk0ryuR5GRvrkDe7Vw8KoYZtgS/oQiJ
         jF77o/L+ZNE54pY8+B68SZT+QzQo4DysOmLiGyU1Dsfv4w6+ZOT4sm6cvtZlT9rfr0wc
         SnyJGsV3dJz262RIZGzLS/bcJiQQRS+O3XFkd+LZGxSBNOxCPu6ERRLaw1JZdfZf5Sak
         e0P2plS8sqbsSeGqeMIdRdMmRNs8xoZvHLpsW0aqSz85Y5uKSKdcKiyr7vuSylM9ti45
         uckQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVlqp2Ora+qc5jWhdfQO7qyWwLeFFLA7DvnJ7Rq0PMEZTk14yKwCj7z4JBdOcWRc32h4RKbAoDj0Ii5IK5@vger.kernel.org, AJvYcCUstHdc/XsFJdUhYwVhHbe3sHIReXLfZIL3U/PtQ0R9Uiu69T8ltPNUtYOLVFs7pNKScWMp2diktp4pT/k=@vger.kernel.org, AJvYcCXkmxnNpnw5kDkEF0Wehym6t55RAZIa1jZJtqmodhQI6pOrzeHtjtVHtp0arxxsBEnqcf5kXUPlUuuR+g==@vger.kernel.org, AJvYcCXmJ8LcGXEh5n68HyBNpQKO9om2utlX/CjfYXGgDRimrjFZKgyWSADvjFzLCuTCPoc0DbNlkfgNCDWl@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcrPT2cDRJ8sJck3FQJnbyy/w7CPkrKvpMELN4OpJ9dsgR5EO
	OJEE0APcw7ygE2O3r+HMQ8n45NJL2t7f3+VKe5ENjLMVaLZ3ZCkz
X-Gm-Gg: ASbGncsK4V4t4hfNz1Zgy3OVS9p3h606Iu9X7GfvU+SEHihE7b//PLeq15U6hQPbEez
	HxxrRYt7+FKk8AqXYgZV2wa9GBcWGFH9yY3JJ6Q+F+BOsbUF9o/d+Bxd+oOoYVGTIkoE99VuIo3
	WhhVI3MzAdgxR2D0QfigKoObuj32POc+UawFCBVT/Be4uFJl0lII6thXQ2pNXIlDPNdZL1BPGHE
	53uoR3VBvjJMrj0FJNg6Ks2yDOlmiFZ43iuFxcSiByvryv6nRFPPmaSI1sLZZ4N5KNxOtcleWgh
	NDKxFnHZYUYN2zkETwFYLu9lwcRqdoBq3+hr0ays+6IqsPiuzL/R+siVLA==
X-Google-Smtp-Source: AGHT+IHHxecPfjzvfdbEyvTYOJEPLEU7vh7wD68UjIC6rm0+kpYMQ2ocUKFfty06j22eXjZ3vEkUfQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1043960266b.31.1741458872544;
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:32 -0800 (PST)
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
Subject: [RFC PATCH 01/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:30 +0200
Message-ID: <20250308183410.3013996-2-demonsingur@gmail.com>
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


