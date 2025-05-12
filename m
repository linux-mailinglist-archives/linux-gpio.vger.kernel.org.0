Return-Path: <linux-gpio+bounces-19982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B2AB462E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8597B161568
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC6529AB07;
	Mon, 12 May 2025 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5fCKdgP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7429AAE7;
	Mon, 12 May 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085344; cv=none; b=IKyEqeotJdh2IRGQ9RjhGYe+qFWChIVYnLtkvZz9uVSOgVqSPeqz6QNTn0qMqQictdkhDF4ZcRLjqCptiS7JtK5la+gXVIvAa8UOVqoL37N4xplQJ5DG9Kvl5w0sTc76Og6h9ZEV0t26rL3DlBGAFLuKPQDbQfzRahXH302Gt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085344; c=relaxed/simple;
	bh=dIGaZjQPQz6vrNCJA2N/2896GL/4RNOJuUvDGl1IyDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KadgLnpe51oSjXFiAQ4t2gEkKhb40JOQ6sbbtL2evJZfR5aGqjhQFcesq4yjF6oTuNvJrIV0hDWCu3/0f6G/pdXS6hno1A20BoW5WsWUcGnJKnh4ign+tpxWjL4MeaIyVmfc3ldrbN76j+xg5wCdwKHzFnsoLS6iJ8ih7hO8v7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5fCKdgP; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad216a5a59cso541987766b.3;
        Mon, 12 May 2025 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085341; x=1747690141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=J5fCKdgPefZ/d/s5Jl74NqYlMdnCvXaPsV93QbmuJkz/ZVZKbWfVnbjZazR7IAJ97W
         mN+q/Svq1yj7kSWI7pk8dH/X7x2QM+XO0JZolsM9df8sxw6Rm8LKML8/tcqqfJNOOKR/
         OTkxF8KwXnCA3aTGirO91ktVEE7JiRBx1m6/tKfscE6wVXU9HxJySwmAN+eRqK3gp+na
         5Mjxg5F59CAlhbWPMrfgJXMKNI3DR8CZSYmqQo08RZMhIf8kkWEjJsEN/b+JyN7pPAkw
         Ie7MIjIlEp3PExCitzAhtEzBQYOkI95ZCgSSQSi/UR+esK7Fc8rFQfFafj3wckThtPRU
         5VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085341; x=1747690141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=CIbvrAiuo0eTiYtVQIY/rXioG8BAY7qnjk6gOijR6Uif611ZVwckIsYf/JiMGttyRY
         M2m+aguze4KDjahEBCyGYklV8PZuhWJdCWM365nWVtusiz/JlThKsHX7EexQaquJVIX9
         bbdtYHboFqcT9Mp8+KiUzFkQWohq5L0FrvogzEzdh8vIX/mt8MrusGmZgAsOQkdu3Ep8
         rvMwqVJkxCjhhy+Ii3ZbG/5xW52be/S3cLnB7BIbLFRsigFn0LjalJqyGYs14AarLcLR
         S35q0Q+aHW2E2Hc9f5+12HBsqmxsUVuAE7qTYacy8jTi+s+j2ZEkWqsx/aauF7+wWM4u
         1FcA==
X-Forwarded-Encrypted: i=1; AJvYcCVBGR2wiByx42ndWDlVtkqFJbH+095xZ/PMTRCg6+OJDSRPqjYmwyAUYYW2nfDWoo47vkbLENBW65ml@vger.kernel.org, AJvYcCVX2ivpHdOKJw0Im7zsiMcOT89XCNj/A5eci8EYA2Lo3ij0+PMcZrPp7cdqRnoEsLhBeVFPlk+IK9h8Oog=@vger.kernel.org, AJvYcCVh/bQXvbFLbL4TsPH0omlza4MLYhp6SXrMv1ouFsYQKlb1vsK2r/Xx/MigfhSvby9Kwe4YxDha23RAhAvs@vger.kernel.org, AJvYcCWxLFN4Avaci+Bmfd8gaXbXc2EjnURFa7ViscOpOYYfyGlGJMWh4ID/yF13m4m99ngY3hsPgF0tSGjjwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywms+gcOQ4XTbtxcKKf2l36eu+3KcjotcUD9HGdD1ORTLr7GTQA
	R781xJFaMMTNYs+usTesq8sHN4YaQeHE4Ge1o5XT3lJifGh6952d
X-Gm-Gg: ASbGncuGft0L6/fe2ObzV3J4MzEVeVIESCrruygWIAXYTDwK9Y/yPjKmMvI/43B61KZ
	NBEyhCYA5heP3YEAVInLme6+lBn+6/7ttd057Y4toBB7+9kVh6p456FqtuA9eI3DNZ/mx+8X7kp
	xuNuXNLwqGSf8kIYoOz+VDe0tKMvDQkNwuR8K51BJVdogobldFLdFQcQ60WoT8jQaORB+0ZTkRQ
	OuYE1DqL30izSg4gj90xQ82uctSBsyT4iYdwedAXULGKnXHxqPnYbSiLyLCTkY/TSfHIySdkymX
	WGgL3YppXnvcF8lZnvIVR28hdNrI4lpvQ/Lhyow/9wnmqYS16x2HDfjKXwg5iR6g+d0rPRI1gg=
	=
X-Google-Smtp-Source: AGHT+IFOOtRWKQKAOEfYjriWhASXUPsC1Ft2pAi084Z0/XAKj0GzAdO7h997QXgzay9OEo+vZzgtoA==
X-Received: by 2002:a17:907:6a13:b0:acb:6746:8769 with SMTP id a640c23a62f3a-ad218f48713mr1441083566b.18.1747085341045;
        Mon, 12 May 2025 14:29:01 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:00 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 05/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Tue, 13 May 2025 00:28:14 +0300
Message-ID: <20250512212832.3674722-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.49.0


