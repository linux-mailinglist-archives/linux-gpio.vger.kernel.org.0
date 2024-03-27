Return-Path: <linux-gpio+bounces-4685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B388D9CF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 10:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 415EB1C22CD4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 09:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26204376EB;
	Wed, 27 Mar 2024 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gKYgg1ic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0191C11
	for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530824; cv=none; b=UpXf+YLdndm0/JcFIBVfNMRyeozLdbqtS42D7RZdcz/9MdNrKOQCdvCSIKHJluDqKLi4WU2SwCRqMT+OSQoKQiaLXOOytfYC0nDPSxOmRyJ4lfvpJ2N5ptS2XdI1F/lvzLgs2/JNuMsUsF7DAWgFImakVGiPTGkWwFyv/Hywnio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530824; c=relaxed/simple;
	bh=j/C0SCAAOc716GeWq9CRGrnpPBh/Os9U7D52YdIVHpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hE8ZyFHJZeNsyNSbcp159gsVCZGNnvcMOLyY0cDz4Y9nsgKvIVBrW7q1TSMhRa9AkLJN1Ejp7KJV9ASwv8wXKEQrA3aZ7aIyVD3l/2vFAAihuKuBQTy4Ye/uWhVKmXuafDTg5iwM1ejs9fmqroqoICFYF0aftu3ekpHtEY0ng0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gKYgg1ic; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so5400509b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711530823; x=1712135623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCP1xxVL+2XFFuRCnhWKsh1+37AXhGb+RDaWbRieDPQ=;
        b=gKYgg1icNJ7+cKeEiFs+Ash7jz3s1dulAxcoZ+zsBlaLyMoEKzMfgmTZc4ryTZV47a
         PDv9BVVi4prA6odyC0faQGacLotLB5UVUN92kGNfsvDbKckBrA0kmEPFXdIsaNt0U91n
         wmEfZH87++dBjlA6v1phk7AXkEu9RSWImFiNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530823; x=1712135623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCP1xxVL+2XFFuRCnhWKsh1+37AXhGb+RDaWbRieDPQ=;
        b=Nq8HJ4C2fjLiI/nQFpuB1GVxfSATljAxVqWby8c7FmPvjJCBWKc94eHsVL2GwqFyTY
         Rogwou6ZNnyWQi1opntVwKcmNe5UTzyUxqTOE2zHslJO5/uhRkcYOCEURrPeK1YvQvrZ
         d//y8D2cFTbpXdWqPI5Ee/ABm/XzPlSY2TouOp3URbOlkHUN8ipGIVqWY8s47rcgm55b
         D3V4uKQQkXLA7+I3oqwqc3TjImmEmCSUh5W1NX+KRW0lWJz3qvasJrLcuKpqqgpWw3tE
         1EXzjw+2/T9VjvdPtYM6d3G2xt0uU7CKRmgRrBTeKXqR3wDc3R6PCyAf2WIt3ps9mAnj
         4D1w==
X-Forwarded-Encrypted: i=1; AJvYcCXnBugFNuzSOsyug0B1OXlxeNeeUcU7CPZ0xQOCwrMK+nSyn9V17wdT0RpZFVK7JX5+JWkZaYWYK/dYX24rfYpBsmEhC+g1yKWwRA==
X-Gm-Message-State: AOJu0YwNwCY7HeK97gQv5ru0pEUlA4EjK+TCFlskoCVsGbUJZpxi+9VC
	3YsF+cKCLOzYqbSmMugRKEvejKJCjwZkYhBQJ6LuS6Q/viYbtOphZ6gTSNPJdQ==
X-Google-Smtp-Source: AGHT+IGO/q6xt1tiCf12rN/iTWiDaEhcezoHgM4FVnnPfonMbt9q2BCRE5wf+w6mxtmS4gbOe5GCww==
X-Received: by 2002:a05:6a00:cc1:b0:6ea:c46a:3b66 with SMTP id b1-20020a056a000cc100b006eac46a3b66mr2396932pfv.16.1711530822949;
        Wed, 27 Mar 2024 02:13:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74c2:3606:170b:52f3])
        by smtp.gmail.com with ESMTPSA id fa31-20020a056a002d1f00b006e69cb93585sm7342911pfb.83.2024.03.27.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
Date: Wed, 27 Mar 2024 17:13:33 +0800
Message-ID: <20240327091336.3434141-2-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240327091336.3434141-1-wenst@chromium.org>
References: <20240327091336.3434141-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the generic pin config library, readback of some options are handled
differently compared to the setting of those options: the argument value
is used to convey enable/disable of an option in the set path, but
success or -EINVAL is used to convey if an option is enabled or disabled
in the debugfs readback path.

PIN_CONFIG_INPUT_SCHMITT_ENABLE is one such option. Fix the readback of
the option in the mediatek-paris library, so that the debugfs dump is
not showing "input schmitt enabled" for pins that don't have it enabled.

Fixes: 1bea6afbc842 ("pinctrl: mediatek: Refine mtk_pinconf_get()")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b6bc31abd2b0..9353f78a52f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -193,6 +193,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		}
 
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
+		if (!ret)
+			err = -EINVAL;
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		if (!hw->soc->drive_get)
-- 
2.44.0.396.g6e790dbe36-goog


