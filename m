Return-Path: <linux-gpio+bounces-27464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9DBFC52A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE1B621380
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEB434CFAA;
	Wed, 22 Oct 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NUV8QiKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1ED34C9AE
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140486; cv=none; b=ecee7b27z3QsWWx/V78tlKJ8m7gOp0QqRdsp4FZe3BSCKfgcE0Ax89aai0fRMHgtu195+bOc8d9bXhkjPqfABE3VvT6zMMSUlf6FLcRBBk8Yu5+MfyNc7W0CcJqrESI6x/a1LAfE5Nvc77cwbw1Xszfy6C+uEudaT8vS/+BvMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140486; c=relaxed/simple;
	bh=Wl1fhQY1rGkK0sqqeQ919W8Y5zt1r+WQd1ilNvMu78k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHmT/IPCx/H9a2Jrtnjse3jvpLUoOQjA6sUqDYScYhNWkpxrprxiCcLpkB83TkN6hrHh66pZpo7/XvOEPKSlu6OCplwI68i6euIuLrqqtyO0+tx0HRDSOGpbHom5wGKg6mbWkrV9Dk3KU8I1Vt/Q4IxY3/+jyJj/6uATWJnipho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NUV8QiKp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-426ff694c1fso1866783f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140483; x=1761745283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fka4GOWd2iYzDb7Bo8GvMcm+GI6H6Wo/3syX0K5IZL4=;
        b=NUV8QiKpOtbAQ0bzcabcLV6DlEW/38wt48oLA9hAY1ayRwRhQghzxaRVNXwyeNdON4
         gGLx6cTmuZ1d+L9RNRS0HkUdi78x8888kwH/z8TE//YB4q6zPVgpuz8k+ekS2gSYqDCg
         Gxch3osEbxX6KB3Nigq9fwSdyVR7fwE8x7QIw2fCw5h/VJJE9ni4Thw2Z85S2OttCFjB
         nm9fHC+4UB76B9ZVPBr6kizfNNu87E6fBZSyouEVeKAns/4qEwnaBA+SRFPPqaPQnA9u
         JTFLsxmqfk7T3LH64OGwg9gdszrV7lXtHzur56FtgSKSISEhHCffOWqGeI4liB34dtAO
         qg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140483; x=1761745283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fka4GOWd2iYzDb7Bo8GvMcm+GI6H6Wo/3syX0K5IZL4=;
        b=J3dWREYSDsn1+Pw7NcTVN56qz/Dd8xpmrBrGuhrjPRITPlle8hUFKTKuPCLpW35ekH
         Tupl7s1fUsXcSipYn07UMbn/zMpb7l2kRzBtqSe/lzeh/AEjHoVJFkh8oWGI77N6Cjyk
         RrtqiuX1L6q5Df2zMoJUVbM74C3nAmNdQL4TUBkeZ7CZgl0KvshoIkv/jcu3n6NAus0U
         02KkQfGn9AwVSewmwgd2BPi87mI4GXsiIPWSJU3cP0dIle/rGbfw+S6TKlDYcaT1lI0u
         ygpoyh63HnOxxoDWQBsjzsVVCYHMKTj+C74NiLvsNzpxNniA8M1IWZ0asm+HqGGMRd5b
         mllQ==
X-Gm-Message-State: AOJu0Yyd9TUnX1lg5KBCxbDzD/pZXzPkYK2XEnVI0BlI6eIcU88rKXPe
	zIQenb6dYHJYUe+fZ5RDWtZzCK+Bf/x+9HjX4mb83vxTTReYktPGWEYUvaQ0fUFSTks=
X-Gm-Gg: ASbGnct8xJKfU5KxMpG8LUYk/GoB3TgdkU7gr6F7ba0q4+IcgjqG9pUUD/joENEOKjZ
	bhsWWZLiOem6uukFnYzj2BOrfSbp3UMABEkWowx1eolPhXyc154K0rq7jy/z1UAJh4u4bq+GBbf
	WuBcu3VcJ+AtJEisvpTFHeeuCzyJfEEuuFvii+bSxMCOGCq32iGsuptUogj8rGw6XOqonWzcRgB
	nQeCZS3WM27I1eVQaTz8FYPGmWcKu/uy74DHL92AacfJxxEIphQs6mmUTXDznAbMVQ3D11TcD7b
	TmY5/5+3Z6unRU9nf5NyG6kpc6GaWiQviccqn7egJ0BciXOLgpeMINt8MjKAlpesDPaZ6lFJdrn
	cA+ZIkvpFPgiZPbA6JP2cWHHbkSK96HB6qm9B/zONBiamrDSdiU9msHNVioplHywhaAI9lkuD8Y
	q9Fwt2oQ==
X-Google-Smtp-Source: AGHT+IFtGxupvrrz0hEyPkQmR4lio3If/UgF1vzWJPCwH83IGY2c2Ss0pfjXFwLXK63D78jhlQy8rA==
X-Received: by 2002:a05:6000:2884:b0:428:3f70:4b3 with SMTP id ffacd0b85a97d-4283f7007b9mr10981225f8f.59.1761140483451;
        Wed, 22 Oct 2025 06:41:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:05 +0200
Subject: [PATCH v2 6/9] reset: order includes alphabetically in
 reset/core.c
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-6-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5npitvf0JoMP1eHJw/QnxV2d5U00sUQL86r2ZKFzddU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N7zY2qos47RUa57cJk9XHOVpyhKy3o6I02yJ
 GbC3D581tGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje8wAKCRARpy6gFHHX
 cjIpEACPoNgcXFMZIb0kvxXvdKY4SoRGAPldi97mlODq1eEuXwycrzwrttSfai2AmUL6CjWDRSp
 GV/GEG7ibAvQUl6c8cnILE2zS12LA3ooGFhIBherTTe1Acx+JDnsMCJHNxdzFUWiWfxYAkFee4G
 qo0gJLv7iv5ezTuoYNyXlh0/PeKa6uqmmj1rLHmS+a9ZXyW/tjaNPZMmEY6SpeXjIWfxgw/dX75
 05ubxROI0yIsMjUp1O/BbYzFux/CPvLEXzfSdlxiEK85+Fw4xtsKVNfYxi3QBBs5lvGkg/OCHbh
 YXbjorgDSp37ROMyPDboqwj1JlgzYIfOZjBLTZusE9ZCp6D91Wn8K2kBKbI/IRVxev1wAjDC+xQ
 nKSDwl7Vf+MjEbRSu/zoFonzq24CcQrEbzfJUmoRD4jCVA+pgMnYzjhzFrvaBsBh1DeK7qTvfcD
 sJl1+zluX8rWMQDaYhbcD+s6qbaUxq0bZPjRbUEl8GitTlAHWkeDovPFaTXa7U/qTJ+L79WJqc9
 FdD/Ix2bizs3AnKLJbkrC600gvBil5Dosh7t7/mb//FE5oHJRACQ0HQgXPfkFAmSbsr9G8B/gE1
 cwRLIb2p7JARNhsuBjhyl8nrYNxXj4JtL4FBztjKV8OkT/sP6iKVidJtK71KEFkSu3m8+rINnCD
 m2RKYnOkKVSxo2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability and easier maintenance order the includes
alphabetically.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/reset/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 22f67fc77ae531c6efba3ce92cc73a2d57397762..5a696e2dbcc224a633e2b321da53b7bc699cb5f3 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -4,19 +4,20 @@
  *
  * Copyright 2013 Philipp Zabel, Pengutronix
  */
+
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/kernel.h>
-#include <linux/kref.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>

-- 
2.48.1


