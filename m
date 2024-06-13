Return-Path: <linux-gpio+bounces-7410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A49906635
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1941D282729
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C485613D249;
	Thu, 13 Jun 2024 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqLqVpOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AC13BC0D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266180; cv=none; b=nebwJ/Sm5jtMXz6nizGSIFH8IpkTyej3CW2IoPi6l6yM91D68sEynPkx30brdVfrt9iS/ZX2DevNsK+/v6DTVFaU6fu6CrNKYZIw8WiLBT+YEd4HFRP54Czs+kmx/zJjk2vieOLorG+pcZ+3CuvWqy8NZkOFAEiFPZ/Nc8DZuJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266180; c=relaxed/simple;
	bh=uyzErR0jfrSwe/0i9vmgqsTZP67TNvMZucGWdnL0p6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cyDb/eAZmYFN2rmWAouHkoRXyzL/COBkLkxBsKwGzLB16PuzKgu+sG+uS/m2rFKHYiJ4Hgy9Vr0gg1COXyWh/Nl6ownlj4SVmZiN1O6ozVTQTfvYSwvLKkkYrs+rgTHZBMjlj/jlRgR6JXBsl7UiBP3QfH2KugzFkDwJJNr5e7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqLqVpOn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1081018e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718266177; x=1718870977; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJh8Ir0vft1w9SzxkS2NwBCQ6TB5aAmszybTHTdUIC0=;
        b=kqLqVpOnSpuHSXd14aZ2Tf6kk+doyakn5dhtoeXJ/scyl90eDMr3b60Qe+jrMmJywg
         iDdqAicwcEzAuNitNj1/YBSthasas1+L/ixFL/s9MgL2LDt3lQRMIEz/0KJw6TwdsJnr
         yaNcYH8Z5eiqS4LaWn0Ew2vtJNK+/RYal3golw36Cc8HmT2vZj/XszI8KJGlK6Z4AobQ
         UDESy0eG+rP9AkUyKhnlFUpPKsAFL5S5t2OoHdHunedaoRE5ixmsjkwad6SRh94Yleh9
         YCr3IpHWBKXXZdppb99VhEjIvKPUbipwRPKydN2NrJGHHye7FHtfWB6NDhBX7OARjbtd
         5mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266177; x=1718870977;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJh8Ir0vft1w9SzxkS2NwBCQ6TB5aAmszybTHTdUIC0=;
        b=cSKOgw2qlb0lq4saw/hApPNHJdH0oYnV2iCcJbuTYxwgM6jfq3qPEspiKLraLDwCEc
         EHQ4OHj+1eGP6htVer2f0g15W3lhnKef6C3Chbw7Fmk7NUBcepKkpDoPAVv/7UcHLdqA
         XsCNCZOx5aSK3+llQ5Lkrazi3Q3B3i53uKJJcd7qC5JjR/ACgM9K6XO0dFmKP0ikrJGb
         Vq+O6z2Yn7swphxPPTR/kySM43AXUWSsS/Qs4HwEOgehOjNuymN3Iw9ekM/4VobRQYXh
         VZDOaONx4WsQirrKIF/aJDl6RJ3h9wwWsvWOJiE2B0X49v/Xc7+Ns2JyEiofLDu4+x4k
         gfGQ==
X-Gm-Message-State: AOJu0YxkgOa0EvZAUcOdq6rx2CWyMyzM72Roqwd5iZVbMMuorfEokwLX
	h7YRfqxNS3Z0HMGB40PNHR1eZGIk8OTPponRvdXyOEOobFIqoFX0z5xxm/CcNTM=
X-Google-Smtp-Source: AGHT+IEZwNcXIVSt8akb+2YlU9hx0rkua5ijXT0WGfgKSe0eSzfvU3jfJnPuXkVAhZFxxJls0r5DeQ==
X-Received: by 2002:ac2:4344:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52c9a406871mr2129646e87.67.1718266176783;
        Thu, 13 Jun 2024 01:09:36 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825b38sm120532e87.24.2024.06.13.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 01:09:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:09:36 +0200
Subject: [PATCH] pinctrl: keembay: Fixed missing member check
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-fix-keembay-v1-1-5c188f900214@linaro.org>
X-B4-Tracking: v=1; b=H4sIAD+pamYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0Nj3bTMCt3s1NTcpMRK3WRzU9M0YwNLU0szQyWgjoKiVKA02LTo2Np
 aABwUrU9dAAAA
To: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

A bug in a refactoring caused a build failure, fix it up.

Fixes: 15d34374182a ("pinctrl: pinmux: Remove unused members from struct function_desc")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 245a74ed97ee..b693f4787044 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1627,7 +1627,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			}
 
 			/* Setup new function for this mux we didn't see before */
-			if (!fdesc->name) {
+			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
 				fdesc->data = &mux->mode;

---
base-commit: 1e37f761d0163cf99567fb81d9c59860ef255d9d
change-id: 20240613-fix-keembay-c755f3095961

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


