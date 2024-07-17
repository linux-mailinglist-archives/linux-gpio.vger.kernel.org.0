Return-Path: <linux-gpio+bounces-8246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09552933C6D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 13:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23DC1F215D0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 11:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6083B17F4FC;
	Wed, 17 Jul 2024 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh5jCxyX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90B17F4F4
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216284; cv=none; b=MJZHxyIknJMasZ59HtzMykaxe9LGHteX+hS+OATVEU++2YEuekLMcSq/Pu7x44x7HuzfLdeRlobslRJ/Q61751OZ8bctZtj7LFa6YEnhg0UTfHgS5bZzkYSYZ/2wv7uuDT0AZywBKrI/e5OCEuzTeuLljmN2Q/ipfvhA0LHoBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216284; c=relaxed/simple;
	bh=28uHdYU7bou+GcCZWKwcmy7jqxAWnvFc5h0JxdXaHXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTgLqpQDmb3as5sm3HJpQCVsmQU7CXKqLVkViulHKx3+W6d2MGQmNJ2r8XDF5xF3tOJPMnchRJQNcjcbSaNrx1kKOdLvEUBKa4/pMCxcwWDm7pUzi2bMeEWXS1iHpgNYYUcQm+BUWbwNlR3D91y1d+AVqPhL0kRJakXsS0QvIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh5jCxyX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427b4c621b9so19942235e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216281; x=1721821081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0j8GcEh/iFICfcRQgHpVxnMyyzW5tywJ0dsUXrPo9U=;
        b=dh5jCxyXpUT51Gr/GOrYYKJMQphKcU4yHGQYtqXpeA53fQFvMG1PTky0fNTXn1bgdp
         vgx9s/6VXbxqHZEFCWudR6SBF27t+GbRi2KM+0Qp/SjFHToFS9JJhn3Na7ihrwtBAWmf
         Wet4MMxfkkUsuQ+2WN5lDqiVM0orVQ682zInn20BmPAQtLF6VZobOi4lMtYIxtQLTTFF
         fbDf2Ji9TCoLXjv6HN5l8JfeEmjlEEBihLQZGhIUsk8uOxNy0gKrrDL+Bb8R4Rkevy2U
         vcUN+R+tq1LWMuCeTMbYwX6lHx0njQBjnm2P24WP16Kj1B+sN/Lw/0dBgn/MjLABQQcv
         SJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216281; x=1721821081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0j8GcEh/iFICfcRQgHpVxnMyyzW5tywJ0dsUXrPo9U=;
        b=owFSY9yyHk/z0l0QGlN/7ceosrQtLqfvlU0gkSpNTatUbU4ozW0gH6YXOBVNjh+kvS
         VYZos2iJiuHj7iw4JuFKbFNArNDJen1OuaXwwSje8SWkaurGCdOVH4gv/6sDVtLvYrhd
         /TkOmWbq6oKw4XUTF5N1ApS8/aWkIryKs8t8M+uQgZ62M25mBr7lgz7uTsPSCy5wts6c
         3bQ3SN7scSW5CueeBtrr16+BwDmpeV9GXU7RyPoIA98LP1XHG/kVXaqMpNc80ly/TexW
         xZ1MNIA9SNNkHu6/CSVJs71dD+99Qq/QhuBxI0AzoUYW5ju1RFh9Uj59sRwAINeHIXXt
         N9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJtQR9+T9mW24G9ZHbAjWKOY0HWMQMVdHE0h9sjqqbY/OVEXEYExBft3e3FTFwlLhArS0D/rSP4XfrgUNgTl0jFT2zeJo32otT6w==
X-Gm-Message-State: AOJu0Yy8fUwdA8LoJ9GeNB/r0juEJJX5r2AQISm7EVGY8Xy7p4sIEo+x
	CC+aByym/w0JsuokF5+UyBHvIOlBI5hMRHkBKYSt7D3p9gnCBiWe+jXPmKMX
X-Google-Smtp-Source: AGHT+IEJFpModZFeoiscwJTh7+SvIx2I1Shl4dLM2Fnmwz+CGz0u247LK6wdhFghZqJbUb4LIyIK/w==
X-Received: by 2002:a05:600c:4f05:b0:426:67f0:b4eb with SMTP id 5b1f17b1804b1-427c6ba4cedmr213645e9.2.1721216281139;
        Wed, 17 Jul 2024 04:38:01 -0700 (PDT)
Received: from localhost.localdomain ([67.218.244.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm165705635e9.41.2024.07.17.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:38:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH 4/4] tools: free to avoid leak
Date: Wed, 17 Jul 2024 13:36:44 +0200
Message-ID: <6d1ebaa522b58e8cf7b990c5fff3964971f4a443.1721039339.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721039339.git.ikerpedrosam@gmail.com>
References: <cover.1721039339.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`info` variable is allocated, but never freed when the loop continues.
Free it so that it isn't leaked.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 tools/gpioinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 44d1c8c..d5e4751 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -195,8 +195,10 @@ static void list_lines(struct line_resolver *resolver, struct gpiod_chip *chip,
 				   offset, gpiod_chip_info_get_name(chip_info));
 
 		if (resolver->num_lines &&
-		    !resolve_line(resolver, info, chip_num))
+		    !resolve_line(resolver, info, chip_num)) {
+			gpiod_line_info_free(info);
 			continue;
+		}
 
 		if (resolver->num_lines) {
 			printf("%s %u", gpiod_chip_info_get_name(chip_info),
-- 
2.45.2


