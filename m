Return-Path: <linux-gpio+bounces-2033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A582431C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 14:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC2E1C23EB6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jan 2024 13:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9682233E;
	Thu,  4 Jan 2024 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="huzcx9cV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D5224C1
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jan 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d858c56cbso5570235e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jan 2024 05:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704376261; x=1704981061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHnPIwYaIUyiEHw32i1Z1FFaA5YcTg9egjLOSfsl5NI=;
        b=huzcx9cVFXjWBeKkLiS9z3xMUxlnUhTk71j5/wft2lg67ey1fA5r9HUbyTUibSPnif
         QWi7XFUMpvYIawX3S7Nawlipeax7CqLqFi+lEJlqPJTvaYCklh+4W6vgcld8540qr70M
         5RbG1jAfOBJGyW3R5tWBTJuETl2529DDv/GA67G036cAcpfWf5hrXjuw08t0iaM8/ATN
         Lqa3CdMuKQdmJ+r5zJg4oUoFMPan0R2tBpvhzV9FEVdOIUfdRjRcZ0/8LX38VXoKBtfQ
         XpcSobpGjU2AibxcrxQ3KhZX3KxwzjU25WbkBW3KxgFrqwqbF7oghra+YbWOMFbxD7QW
         LEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376261; x=1704981061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHnPIwYaIUyiEHw32i1Z1FFaA5YcTg9egjLOSfsl5NI=;
        b=Vv9yInf7qJVUcfNn3u7kEnxIH8ZpD+UpKGSSRtjpFUDot8X+qXMH31GR8ps115g3ES
         eZSpqnEwIXhyafXhIc9qUd53gqeGfhTJ/zOEbJ8rBIvSa3NgcNUPQ1D8dVgTN5UYqKQW
         aXzT6yw+5GgJELgHuvGup8IumfQSSudPc/k9IGHFAGhGZSZuiaR4BGAEKeM9216pSnz7
         Jq2z7JA3jawK0HLY7Q5VSbvY2p+LPOscMzVAdvM+wDHfjify/g5BimCPGolRUGzEKK5K
         5WGN0R+TfA+qaO66Jpt30nG9Ymp0BquyCFK30Kt408kt3OtnmInn+xF8+45Ph9RvOVyT
         M5+w==
X-Gm-Message-State: AOJu0Yx5nHmOeSsohwZMH3B1CUDKoBnAHj9H+BPK1kaYupSA5/exn8Y0
	Ji3uufil3oU2X0clJzyQX2qFkKFIeOwgkA==
X-Google-Smtp-Source: AGHT+IGRHL+L6YS59bXwI0Mfzs5lNytxiJRXvBMa3SL3mezGR47W2MYGoqWy/Z/Cx5NfhFY1YUWGFA==
X-Received: by 2002:a05:600c:524e:b0:40d:609d:d62f with SMTP id fc14-20020a05600c524e00b0040d609dd62fmr372621wmb.87.1704376261534;
        Thu, 04 Jan 2024 05:51:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5b69:3768:8459:8fee])
        by smtp.gmail.com with ESMTPSA id k39-20020a05600c1ca700b0040d8af75e19sm5798567wms.24.2024.01.04.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:51:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
Subject: [libgpiod][PATCH] core: remove buggy flags sanitization from line-config
Date: Thu,  4 Jan 2024 14:50:58 +0100
Message-Id: <20240104135058.46703-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We try to drop potentially set output flags from line config if edge
detection is enabled but we use the library enum instead of the one from
the uAPI. In any case, we should actually loudly complain if user tries
to use the output mode with edge-detection (like we do currently) so just
remove offending lines entirely.

Reported-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/line-config.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index 2749a2a..9302c1b 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -381,18 +381,15 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_EDGE_FALLING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_RISING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	case GPIOD_LINE_EDGE_BOTH:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			  GPIO_V2_LINE_FLAG_EDGE_RISING |
 			  GPIO_V2_LINE_FLAG_INPUT);
-		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
 	default:
 		break;
-- 
2.40.1


