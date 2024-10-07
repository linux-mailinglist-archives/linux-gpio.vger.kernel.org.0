Return-Path: <linux-gpio+bounces-10913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E0992563
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F86B282ACB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F61741C9;
	Mon,  7 Oct 2024 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO7xIXzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBB16D9C2;
	Mon,  7 Oct 2024 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284923; cv=none; b=ltXcsnUHw9fiykbrR/BrZVt8pV2nPg23lg0sCkqrUL/ukMkZjMBFA1lc0ZmDjfri38cDfT1tEDALQJ3hdt5GixWrwwUbjxbR8aZlGaecrtnmfMG2v1GzY5f3hcZEWy8Mchi4Qk90zDzOv+AN84+1CStafLYk71mz1w7FUMN4RP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284923; c=relaxed/simple;
	bh=9Tg3Bkt19fijmprbRN5ab7iuTDQrl1bvi51xLf2XZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCwuf0jgREKhriikpmyrP3e94N86IlZc7LgWxA2+IO3XPqbPiPTqj6iS9Qkd/pfl7M/055Jh9+dCjxEEuBHqOiRf3eEPnMQnJqfEOefSdgVivin6yYo7F+KMmAWnGiBfXJMR7POpuq4A2bEvW/myyKuzATSs5B09vDCxDcBavmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO7xIXzz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dfc78d6ddso1107103b3a.0;
        Mon, 07 Oct 2024 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284921; x=1728889721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIm2zrJ4mPm8LcDwJ8/Lhrxl8OYUMqqT6Rs6EnJw4s4=;
        b=fO7xIXzzPNurpQe3xyBJgxocDqcz+KkdZtEIimjiJ4BKc0SZ8MMtV5zz53BBs1+VgD
         wbakstnwe1W/q6CYyUm2KtLc6y614E589skSseD0cTJbyLNvzCpuQrqPPkyEQBR98Rd4
         by7mrcfuPNn/iYyjnrq44P30zRF05PtTgRLiNffesNH0YjvFXbXQAjp2HTZbL0TZ6tlP
         EL5F5EYIjPPa7+Ql7gzSyCsIbD7i/GSqHq3WnBJSYhtMRjDqZKeD1VI0GyE90sTAKvdg
         vEIOjKRjRebziqMig4+ejULBdBNRnf5PhFY/UZ6sZ5qWIn0p4Z97XtkaWCpvK1vAZnmL
         1Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284921; x=1728889721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIm2zrJ4mPm8LcDwJ8/Lhrxl8OYUMqqT6Rs6EnJw4s4=;
        b=srtghuKSyqwrkRUWooZvxihYX9kRyvyIyprVc0wFkCMXcyMa2eVn5BMtAaQvDvaIdv
         Cs6x40oMrV5FzozxFe2TefATAjTDvEN4ih3enPRzf1aUMztJ9YiZFgnNegxPSCKczUlD
         SYiuGbpn7ek58l9PgsVTWt21Z0TD1TTZwCkoM7v74H53X5ykvJD1CH3R8XXSSWdugxJS
         eAd6DdzUH4jsJjKBLjAXmBVcm44NSEZ1z0kTQNS7jow1MVugavfOMFFVEFD0CxrlITMD
         X5VEr3SXnBJdOr7vWmIJo/nHy24NE1IZBGjNJMzNFagJqOqpHYoSr41QiUsbevDvNwuO
         mQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCUTGfSIHuUJvzbO+Xna+ihGRkmzZ+NuYRg2jnPMiWyU2wlYtLqN+WExwybjhuozC4N0nKGxWyfB21A3@vger.kernel.org, AJvYcCVKrLtE9qdX5rkddkbxFWrX1U+oJXLI0Fw+BDephuQN86g+v9Icsx5LZl9o1SF3JCROiyB7njb6T8A8f7eLuGI=@vger.kernel.org, AJvYcCVWbtakMZ9dSSSwfZpbHcGvv+f87eP3yCCBqehDP298h1On+rC25LwuNwY3xo1d8dbrk4c7BtFcv9C3/Q==@vger.kernel.org, AJvYcCVwHCNg+kPmeKDvSkVBC15rKQmiAggOIl4vO2vW5PS8z/zLy2py9faUDEe5s6S/Vnr4nzuQWzOEtLzX++y6@vger.kernel.org
X-Gm-Message-State: AOJu0YwySrKSABZcGPQIxUG3KQDfV2VTWreqL4OR2cCJYDvdSFDl7rPp
	rLSAZnD5iED7IMol06F7IEyXqau9rfd4D1NRkGqzPUD7HmHgdvBY
X-Google-Smtp-Source: AGHT+IHB47DfkPIG6EABi7c3A4sZkbbs5h6c9kgYfhjhgGCwt12i673zqIXuCwiVGpye+ETlK7eIXQ==
X-Received: by 2002:a05:6a00:3e0f:b0:71d:f012:6de7 with SMTP id d2e1a72fcca58-71df0127189mr10460413b3a.27.1728284921533;
        Mon, 07 Oct 2024 00:08:41 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Mon,  7 Oct 2024 15:05:26 +0800
Message-ID: <20241007070758.9961-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index e41a8aec6066..3035985f275e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.2


