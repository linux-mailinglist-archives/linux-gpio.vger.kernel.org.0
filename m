Return-Path: <linux-gpio+bounces-17307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A154A57D19
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA34188D721
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9745021766F;
	Sat,  8 Mar 2025 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYf8NqtP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79020F073;
	Sat,  8 Mar 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458946; cv=none; b=j2/tVvqVSBCWDIDJFbOyHBk3w1TbgiGSRqEjoL/fw8x7Px91o/btMy2Mtp6x6E1Xl4BhaX8CKTNMFz7eSCtTaChp5M3toC2qFV+v7Ikg1YaRalOonO0gHMB/RRUi/rlybHrRFUMNeLIsyyMNty44HXQMOaPxpar7x8lI3YMKT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458946; c=relaxed/simple;
	bh=ht5ypYiEkwHxwMKy5bQfucXh4XtSV3csZ6nPeORtxLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUW2cM4UW1dm8noxGvdA9BXrJFbnNV1yGqBilkbxWGHUldCeV/g3l1tqwiw+1K9watX1GQEcMtoo8ETDnvobIjqAzPc8ZcQ2l2JTcyJW0rzB8DsMTzHaEpKJfyoJ57A2yzzSQPRGVWjbdS0toFJ7Vx3NdVmN8YXa1/a5HcttUPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYf8NqtP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2385927a12.1;
        Sat, 08 Mar 2025 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458943; x=1742063743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=RYf8NqtPOq4dpM9xfiq0s80hk4elUFooYEfeody6cUorzBPatau222D26V7gZrK6b8
         01lqRQ5eSLN0F9wT0YKmzsPfW/4QseIK+X/0rY7xyl3i7+oGuWOBfTcsZyj2vP2jJw+C
         046tf+KXoWNjdFk64vcQ3m+cFwJ5ZdEawK5pzc/XLlEW9YSCw+LFLJYU+xeo7fm9qdlH
         ZP7C/dz4clHVdhPJz/rlgm94OGtInSjtwLk7vz+FsiN+Kb0WraazB8MNoTbzW1azpVD8
         dQH74W+Yy0L0cMOBJgE2w9NUVtItasPfvfIqHBTYC9rqr+/xPaC2nDBvrlm36ZI4K7/q
         AAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458943; x=1742063743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAHmn6rG6ETfCx5uG55oa9NiQsZ2fVF1iLru44ItkPk=;
        b=sk7tzFGU4NK6+/Vs4Vnn6vxehiUwGmJOWEc7/mABtYRtJPmCsaebwiXQPFKUUyo82A
         NfBgGPdT6xHm/QPSzJ6nQ7id/ftsZ2oB6l84rI3fjNHv6UJrgNC3eoN8mLVPX3svHo/4
         XnkQjnfWBe0Hr/zZOraDvt2bXw5vH0WCdj4WpqAmvb6/PO9bsrQs4Zsf4GPeihl0cUwA
         87h4ivfwIsMObuaR8rA/y7LJlhZt40ruGr9D0iYwltdzu4rYxKLNcTHnX+Mmqdm/ltIi
         /QDytEDJ9wnhiimsncT0PtOxAAUKKuaQB54cT0oiCqgrGtK+G47ZIr4rC29golB1YLT2
         h7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUYn+Me+3Rz0dekqzgZ24K/QkLTuKzYSRDchgQFe2Y9CFpp1+MdaEoUBBHHdsZS81irhG3KPmoYDvPKaETt@vger.kernel.org, AJvYcCVy/2ZhGC9nFhfs9VqlfaPDmuz8rpLpZjz6zedAz7MrNY89EX8l0WqKQ+GhmRfjVRvfzb8wZMeLyLagoQ==@vger.kernel.org, AJvYcCWxmZYm/EjYjnQRRY6BCAxCshNOHGA5t6mGG1j1Bb/qNqFr+msExcrvkolbojdoPvZ2xDkzR3MvDGnL@vger.kernel.org, AJvYcCX0HnSWN2yBol25lSLjaYihnbVRcCBScllgiHDbD4RI4t8P3Onj1Hr/5UOljW+gw3CmQUu/mxhzmZw2aIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywHQpsVV1PsD0HeNJWwYI8uGQyvzJkQdFd1v2ciFI1gB/FKarO
	f9KOFN3EwzNb2f4E+YoaRaO6xfyNi0Br9+uKaNWr1/B/GkC81jW4
X-Gm-Gg: ASbGnctOAG6huOXWgPKg+bClqiHPIQWZfCxtPmua0wvQ6obaRt6gL42NO6g/7LlbGwP
	Jwge/ST5VlSkwn1VfAfzPNP/UsUKBTENyxuCUjfipC5musb+K1iImXqjoLe6tDrylctX1hTCKM7
	KYV6IpEEEX40+7l35glufJRrVHsaVN8m9cvdXf051SjnNQy//Ru7EQggFeIKRCp4IsKYpmQ8+Pv
	XE909SRG1KSvZr0E8eOO5Pi/IU6Syhh9+9dDQVGoyAJqU8Q+uDaZG1GKec9HETDX6J8yHDIC2++
	wUd9neXqABgSmB9IEQqBUMGlKngWblAINsqHmMieflQ4zUwpI03VV1Lrhw==
X-Google-Smtp-Source: AGHT+IGrMwcZh0pY9ViCetXCuLx6l8flR98nHFGVJmFE5NhrBR9RFuGiHgNwfMO7DQSkLgJr5+3lrA==
X-Received: by 2002:a05:6402:845:b0:5e5:c76f:c019 with SMTP id 4fb4d7f45d1cf-5e5e22d8d92mr22199896a12.17.1741458942777;
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:42 -0800 (PST)
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
Subject: [RFC PATCH 17/24] dt-bindings: media: i2c: max96712: increase number of output ports
Date: Sat,  8 Mar 2025 20:33:46 +0200
Message-ID: <20250308183410.3013996-18-demonsingur@gmail.com>
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration.

Document this possibility by increasing the number of output ports.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 148d196b9acc..52b5603c2f53 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -45,10 +45,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: GMSL Input port
 
-      port@4:
+      port@[4-7]:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -66,8 +66,15 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required:
+          - port@4
+      - required:
+          - port@5
+      - required:
+          - port@6
+      - required:
+          - port@7
 
 required:
   - compatible
-- 
2.48.1


