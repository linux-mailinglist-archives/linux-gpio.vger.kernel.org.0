Return-Path: <linux-gpio+bounces-21741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE1ADE7ED
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE2D17B8C6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCEE2E92A5;
	Wed, 18 Jun 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF1DxbES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADEC2E8DE7;
	Wed, 18 Jun 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240803; cv=none; b=X5ZgnmMKcc+U4yTNC9LjWoeF4pS65OWVKeISqYUBwm6eWQtM9mA7SsRvRhwqUEN/tL48f4rSXQXZGic528/pNgCmjCojfLNMH55IsEWG9Y3lhRUOGF0YpKLhaovDP2UV2v8dU04hpDjMFJ5i+0scmDHbKO5AlKbroTirerGHz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240803; c=relaxed/simple;
	bh=keZ1faaIFvVOvInU7QqkuDNgyGg0bkTnRQ6lLbb2oBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF8ZysyOmGNuQBvvAmaoG8VSFySlSawCyLwL/kMqjH8uaeV/4KVGGBfZrnbL+jQfS5X/TioOf03HZyPeLeUnu3U5PE3x/bJrWZolG3vQ+ATwGZ/J+7Rtf7nuUsrdm/++GbgRshRiF26oBj9EAr1ZFhgR3IheavniaiSiELLzDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF1DxbES; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso3098558a12.2;
        Wed, 18 Jun 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240799; x=1750845599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=NF1DxbESayU8XoO1Ig6XIG2ufQk4ABx/hvXUeu/pU31iEWaQvc2R+W8GynB/AnJpa2
         4Pcz8vCKRQJnqcPEXgcvpP7JIGqOJKjg030BlMTplWcZEVAXfqYqhI+ebNxWbhG6uGKp
         idbPxyy2lYpJpWbdn0I9vns5RfbGUYTuNmZK5Q5lkHQuBj3oES2Gg0lwSux/ZdwkuoEe
         zpaUrYAK+u6qeoyv/dMmKWuq1RGtk9DP51Q8VsYGfEUjtTSfASCVNxlTZJTRgLTP/D7h
         HrVU7ag0ckqA8YFc3w+7FsRd1p3lNhehHRqTnOhq5rMTKCb+25b1UZuCxqvbT37Mpls7
         YUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240799; x=1750845599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=Wo3JSospyfXV9Zxm39+hPaGJAaztvw7oJOSeK/VXIDkOog1Z3sIgnuRMzACwqBlkvd
         WHHFWEbn31Ey0qbiqY/uzoH0HYpYt9+XpSqg8WN25qhP7bOx7hKITteJid70zJlqmr3M
         X0aOeYhqrLomuwxZ4iaHyDUVSMLGWJagQvQWxWw7mndl+9EEEJ6xzxEiral7QdffEjbx
         d4DvdGz78MNlaHnYwmrFRTg3+HvRUCyQIbuO+vlwGlKh6E2DXGZZauZi0xqNid5NV59u
         HIIwo+F41Yba0QyCwvClFSrB8kkEFbtbtAkfHlN0oPZK+N5h4v16P3gKblclQuigIdul
         AXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWavky9vpdEUhggf/WztpbqtZIJ2D+M3BB9uRAGZ6YprMw29YphpYF6YPZmxAlvUuniKUebB0Yvxf3Pzbsl@vger.kernel.org, AJvYcCXo+Un1i/6+Ic84r8j2gsXnYN+UXfVu5kJBAt3JzRuNXllZPR3uFpLM+KR3Ov0MkljIE/tqNAbSD66S@vger.kernel.org, AJvYcCXxHOgcm7wbsBbNWXsRKVTuoVAExztoHkcrKCPvY0J5RJguMP7Ej1eGdQ1BjSL/2s5mAZX55tdZxhZ2Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy312GE9rIDVGg9+c2I7pTyWrSG979+FDzJGD3Y5gnM0LqIfG1F
	ddwQNE0KpYZXDuWDmkzgT2lSxD9sQVcqMEwhWPAXowMyQLzxCxz+BEp5
X-Gm-Gg: ASbGncunrIAK1+AMGV4cv+U1CNtauBskUVBuKnhpxCOSVFrXO+T7UX+MrxGwQuAQgR1
	MUavFkg5tDp9ZD/CJi5Bq2fRy/tM5kBGJfNOqLhaE8B+P9siNYEmdaS0nHZkNgPtEj8EO0O4mLW
	gq89kNkAoqC8LNoBiX9ITfgxK483bKSfbYi/SrC9UakxQddpXEQKmveYijkCXAlR+WWd2+duC1P
	EJK/ymNeyAy/Q11zH0V1os/0ot5b8uuCVqL5BWZnS1qdMjSYMfzFQe0BUwZHlEOfYGpv05xzjoa
	2ayUQBlf1wzzIJK0ovubpPeWR/ake6qdj+R1eqN/UEkks+egpNyOQPrVauprZP1nWGxPZRzlBgY
	=
X-Google-Smtp-Source: AGHT+IEOr9zNV44WWLFTuOxIUvg/uRqUB3RWX2y9R/qoxpU2YJx9EhRm+2O/OmrkiW4wu8vIyE0epw==
X-Received: by 2002:a05:6402:2708:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-608d0948348mr15115181a12.19.1750240799157;
        Wed, 18 Jun 2025 02:59:59 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:58 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 18 Jun 2025 12:58:52 +0300
Message-ID: <20250618095858.2145209-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
2.49.0


