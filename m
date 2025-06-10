Return-Path: <linux-gpio+bounces-21230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0826AD3B49
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B738E3A4507
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A38A1E520F;
	Tue, 10 Jun 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HkbFtcr2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638C1AAA29
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566312; cv=none; b=qHDXGIswmjvS+qRnyyxKQhvgda2R1G9b2wd7br7BEFm8jZobLoKWJ8+kiqoJm6hmJh6BtSDql7VI7uRzZrInAwP2M/43Si0+JXXPLrZsKAfsKuImrCu0uS/rPWs7TpadrQSgk8enx/OMk/y5LOtfhfReye7ZN7l6SVmzCi3dVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566312; c=relaxed/simple;
	bh=y6btqwIDw//7bl16rRxqja+q+WLuFh516AhK3+npkAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8hYAj+3BDHnZ/UeWEgWjxOjWoZH9vKGRKd9zEeLKVR3X6V0czsWRaNb8XZQ7NTSs/8Wv+DuF6MtuF5V5CNTIltobQn7EM4AE/LkNBAL3JVy9kzaGZacL8kbS/WhZUfPQWjq03kRaGZnQbUfCAVhMudcXSbLytGldb2fwocB8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HkbFtcr2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so44446765e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566310; x=1750171110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9jr3lI5fcVvceMahRG3Hmp3DwAffmrkbyN3OMLcVqA=;
        b=HkbFtcr2ivqBZ0buQ9RBYYMxsee99Pdf+9RARVryKDhLj3fo/wfhI1JjPqKdiNGVA6
         JO4sovID/zLs8oXVru13FNuERjIbPTeNgBnfgVHJORdfJgA7POTUC0Fy9KmhOq2NIdpy
         Qumkq5hOm3kYiqCPxamWpwILY/UFREji1+UH9R3izQkwHAD794e4VnBJkOd0abwGf1Uj
         l9bxrSWA/WNEvaA9b/UrYpVWMbg1Y1W9NKhL6ubbQKYVVmUNOztEJ9sD/pblZZaIb7Vj
         WscmK7UcqDYBVNQL+WaqpmeLS6jgJAhaM81mUyIbdkLXEoNXTKfjFNMJOkQV+7RJtQOS
         CMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566310; x=1750171110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9jr3lI5fcVvceMahRG3Hmp3DwAffmrkbyN3OMLcVqA=;
        b=A2ZZyCk/4J0chmJfhWCcGCWnFtiYJhv05jBobpc4TwWKtrpSEe85Uq5ySDlmDPMkag
         bBERSPnnZ601DRfE6oTuTZAh9hFvZtRiRRE3dYEKIvQ725yZSI0uF915x0zikSJmje6l
         aRhW02HU3nCjl8FQTCrPSIwKyV7l0YEVSC3D2NhEiQ5F47qh91o1l3QTaLVLCtSI3lV+
         /+5/X3/BkBTfnq94feHrKg/nMP4mEkKmHKMSTzTFYr++mk8iESYcoTCJ7y9LPHIyO85s
         LjmmWE65iDZfYJrL8xGnmhLVTiXr50rbhPDxvbZtwKsObO6a7vw/5gdeRv4xoiXHdhvS
         bEPA==
X-Gm-Message-State: AOJu0YyARBAiPEDaLhaD7b7vUjP296Pvgd1pw3SDjJU4LzGQI6vMUm5t
	o4BffNrseBzVn/4HZL74kMIUNma0dg1KPkqNj5mFfnf3l7+96n5ASbubTepZLq6UFsBkUxJJTyT
	ekIix
X-Gm-Gg: ASbGncs93O05K12US62WxVh/2rcDNj7sQJMRfeFS8X8gnTEYeHdHXmuBrTxJvAU0cXW
	rJ2343ewwnHHM3Gb4CuBr6jy3UR7/xaad8FMMlVwh5CGpOQ42V7qk04ZZG0uEzwus79ZAbQdUB/
	pjQ6C7qYBRdnYlhmnDisE9JvZhOMJjY+BtLXl7iNYgu+yQj2ICw7qjRdhDE2FEJ38cyH7GVyOns
	MHqazyIn7VNchVq3jUstjytXOHB2qEJWXS2vlX0+gQD/iTjsTsLMzXTvGzw8ggBp+L5I0KbMzuG
	doYq79t0hoPe8tUOZQubbFVcduvONazyThTUP1421riP1cP0b/7B
X-Google-Smtp-Source: AGHT+IFMEdpRiKRmCdxKw8aCmuhUo9l3ENL3IL5N0Xs2JkX6tBt5+XQbLM+8pkMJbmwyZUTaEW9/sw==
X-Received: by 2002:a05:600c:4589:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4531ce8bfe6mr37487515e9.2.1749566309544;
        Tue, 10 Jun 2025 07:38:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:17 +0200
Subject: [PATCH RFC/RFT 02/15] Documentation: gpio: document the active_low
 field in the sysfs ABI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-2-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xbj6qfG37TGxyivMvX+Q5Wvm9h4Ic80LNPUC37eB3xI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENfAUhmYNB9q24XAtLcEN+gyGiI6/HDChX3M
 DKS93JGMVOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDXwAKCRARpy6gFHHX
 cnc5D/0TxSKlKzXvrMYuyQdHutExksJDL94m5z2oHjqNRxZkCzYAhxNO/GUiDkGwLuoUKkLX3IF
 rx1e8JDkmlQaOjhO4MLwfe5ICGBx16aYDJCl06JWfRQu44bwMTUY22ps+cxV8R8i1kYR+hxO05X
 LIECT0ko1GMiAM/7PxFRz/8o5G1GshisUcEyGXyaAc+xwico5tnSspuL4NNif0lLhloFf6eGJI2
 b71Ox1+XaH6rq+rPbTzRWnAD2RkHch8OWucu2tq3lnkVvyTLUn70ekEc0k/QzuC6nfK44wlkKJB
 u/NV8HtcjP2PchH7zSpaJeRo38uf8S5KXecxaNdqZpi4DVCmBnk5A2ssiqPXgZWz223WjnqnYsN
 kUxhg5PUE9nEqgaV605YHIfBULNOueGC5rZSqq6yM5QGevdEdPMAXgOuD9KEaX2/8XwxOR5TzNA
 vfhI3hHAtr84vrTO+L7sndowv0fHrhkxCMx/SXhU5HhfzFp/J6/RIc8kq4iWwhQEhJkUxqy1VSH
 eYRCsZNa4rjZQTXm4K9JLFYgk79r3gqSKSuEnn4c8mJenAbBO18UMu5s2dBFy6hI35yt2BMiFZJ
 r0LmiQDxc6V1VhA7JDNzuKxaLqGmcsyOSQWCRYvB6tA7OA7KIrecYq61r9OgrAHjcaEKWhpQSB8
 3DxHLUqWbbzBwvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Exported GPIO lines also have the active_low attribute which is not
documented. Add a short mention for it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index 8203bc2128db7eb9ea6724884e680ed4b669853c..480316fee6d80fb7a0ed61706559838591ec0932 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -22,6 +22,7 @@ Description:
 	    /value ... always readable, writes fail for input GPIOs
 	    /direction ... r/w as: in, out (default low); write: high, low
 	    /edge ... r/w as: none, falling, rising, both
+	    /active_low ... r/w as: 0, 1
 	/gpiochipN ... for each gpiochip; #N is its first GPIO
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive, not necessarily unique

-- 
2.48.1


