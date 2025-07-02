Return-Path: <linux-gpio+bounces-22638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C239AF5912
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6F517B5BF7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AF129A33E;
	Wed,  2 Jul 2025 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZnF7uXa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB9D295519;
	Wed,  2 Jul 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462521; cv=none; b=o8zCiYc4584NNT0AyN6Ub6SAh7/L36HxyrwqJq4N2jxf5zvT8y3YglyiYG96kZNABnXMwhxUai+dFPIKLM7Uo42dTILuCE+X4j2n9AN7ZCJfAfSGSZmYD3UfbhBoSfghg3zDP/DF36z0C3hxHQEK3Cb02XtzwiKJzqgX5uPb78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462521; c=relaxed/simple;
	bh=rMxzYZ+ZhxUfDAbKl9a+wghm8sVhn8BbKeD6/4z1tTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1IUGOnCSNjixjCC6noqzGqgaavugETdsq11Rg+OODiFX1MQQhhfWP3eFsnypz1Txn+GskOzv2NXnicnwVldOmF2uuQv8Y85PdFK/Troh0xzVSADdyqs9g4mnz70GBUQsr4Rb5P+XxIVHOak3DL1+FGBtBAZGbiA8mPxI8ucOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZnF7uXa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so7492273a12.2;
        Wed, 02 Jul 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462517; x=1752067317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=GZnF7uXaV3znpNn8f5qkSFwd7EyVFIt6XeP/t9onns0fDhKiBFMQImai1613J4JEhI
         av9Kthk6F0VjZoiArr639YX7GW1yIa8C9BQrzPcMbeBlQTYXhEupsk3ty3JBc61WZqV/
         YrB88VsYyg0UISUTT52YQ+JHgWpTjbmcOTWR4kWLwuzhoJlMqP4dyHIysTxCiPLi5DDa
         C2jcsaOSA4jqZ5Rdq3gTinMnZZwM+0qBjYSEInEpnykKHaU90YHx+t5mOHRGWKPh/64I
         wEgSYX7RNnaWCFIO/jHj8Q6VdYljl8d1WfBW6go0Xawll11S2KE2ovgKHhuXEIooFJAO
         IuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462517; x=1752067317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=BKH1v/VgGJqwSdi0+RPFi3FlrSo2ulMF8OPiuAYzExJcxgbBDsrDyf9kGT132VQ9QC
         pH3292CzOosdPkOFGayp/+pmytqspsrp6BjDjTmjrUpUntEfPnSTdh5E0rf56AGJWgeo
         R7XCe4Su7vWuMk516lhoQjJ9q0FQaHRu0ZvxkMSJimMtRkssBDHTgkH/YUqjbUvgjuqz
         IpiM4vncWDdDPu2sXNvJSgdEOANAv6aAAuR+c1gfTPtNG/00zw7i26g2fmtyDjXzFBWY
         j/wTCVuoRFO3hWxeNAzYEf71QtKM0m9yQnF0UGpzOVnPxmygCdVTjzP47XNfSqw4mqqR
         OWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9rospokxxyq4lIt7bEQree/xowx/aTUwL+CP4V6E1893BEgNm9HLsELIrmDK0KoyhzJ36p6uhsYVGZQ==@vger.kernel.org, AJvYcCVj8C/1Xk5q5CD+KTddIVxW/ZgTQ+2/pI0BqF7JN+gahwix3P/AZsgFAwhpHSGQS6s09fd/XBe753/VNetw@vger.kernel.org, AJvYcCWiY2Ieovy6Hxjx3Wvm+pSuJF8x2CEhlTMosc2s27RntFViz9yQnHfqP9XUhnPISEpGIGkjK86QekDu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3eegHZnVuSt1yEQ/G68MlJ8JyQ8T+7yXnRwvyOuB4o2pGA2q
	YFgtf05Shs8IqWbJHBkjBHsxpwXe755RbFAezWBdgmIIAFDXwImkMuGP
X-Gm-Gg: ASbGnct5B40PPnjab/6b/QoaPjcjyepFt/iMOvHUT0MikABZuvN7cQ6rtedtpo+CTl3
	+sZzUDsau2gogsgYG2kqsw4id/dko01xThwzs6CysVlqeTpwWKBcT4Qyxjd3n5N373yX3foZ9jp
	E8LjeQDE5g2NhAokcHeEBzKvgK1v6wYBIx/ooEKWMVGx/1uWDbUAdo2KRz8uMIW12G8Vm9rrjnP
	4MBhpwNEqqeip7Qm7+4H6Sy5klFG/CJm6QduIKN/3wrnYItcFjt68T1nTDp8y447K/YhEQ81XOu
	Oow14BPFbqJ34bTaa2/gxMmW1ZXVTtJRULlUjWMtaeGIsnnGXRSkRyFtv6sIvgW+lyAnaD+PSEE
	=
X-Google-Smtp-Source: AGHT+IFvLZMhZjDSfshoFpRc939n2lwSc6MfwBSslCP+I3o/TmLmEUPehK/4SzQi266zJ8iQw+lKjg==
X-Received: by 2002:a17:906:c358:b0:ade:470b:d5ac with SMTP id a640c23a62f3a-ae3c2c7d588mr239742866b.56.1751462517204;
        Wed, 02 Jul 2025 06:21:57 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:56 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed,  2 Jul 2025 16:20:47 +0300
Message-ID: <20250702132104.1537926-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..6f4254f562da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.0


