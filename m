Return-Path: <linux-gpio+bounces-18540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA3A8205A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 10:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF69C4C5CBB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9E225D214;
	Wed,  9 Apr 2025 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="idiVMP5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10DE25D210
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188049; cv=none; b=PT9GLl3neZliyqtGWfvw0rvUM5+7rL4oG60xQN+y17rkg8+krw5z/ifcKyd6kQrSjIsjcHRDIAfRvS8jz9Utsy7PciBzN4HAa0RP8B4VOW5gMYR3pW7mBbAiMipdR1kevtBkg4/15mB0Vomj5B+UJ5+2CLb9L5U5TH2m42xgDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188049; c=relaxed/simple;
	bh=1VmSF1FsDxlYv2R/Yfi5O2efY79iuhVVKCImNUHwSDM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c6jGU8fbSHTE3tykO4lgpZbkSJZAafkdxm6eKpG703Dvx9mASKln6gBQfG8t+lHMvEcjxNXxSN+EClkDDTOA5uZ2iBZa/OrilPqodj8SgXgUoJNZ8pSUnRPYYsWwGNlz0yHZ7E1QJpFeagRUMjUOd1e5J4s1A2/F6+uUa3eHTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=idiVMP5Z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3818839f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188046; x=1744792846; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfgRSjZMirwP4A4DT85B9dRR+tHIO2UwmfqRGQoebTc=;
        b=idiVMP5ZxGM5uy5Lqg9/I8DHqtaXTshcRlICrYnn3Lc40+k90GSYwtAuUrjKVCiwlK
         vuWTA0dSZzIWBOOEfPbcYutTuo1BSNvoKTMROXtJ30y3vR3r655//VajQlPVo8mucsAs
         k4iXtcj6X5Senz+UJhUIXAx9TKf8F0j60MLNTmfSeqeCYaGpd8S+7rOdarUat7a+sRe1
         ztGJm6pKAF8kqXIxgL9boP8aCJS40SlBZgTJW7NOCjzBIlZOXpCpkBHCpUJgCA0X/xJN
         p4cbm2kBVx5xggm4ap5csZFIr5uNsJeNCrnSLLMR40LVxS1lX2fEtTHRmGW0CbX7HVFs
         I4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188046; x=1744792846;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfgRSjZMirwP4A4DT85B9dRR+tHIO2UwmfqRGQoebTc=;
        b=qT0/324UKER979wqqzhgYgdft7DSoZUhYBzDI5T5KHsj6Pfau/cF5g2wls9qkoi1eM
         lh40mk0UjRgJkXFUMQSi+mRaqEqKILKP+FBewtO8fvC3twZ6XOMO9r6GQTkEAATMBPmO
         NeoaQzyNZbmSLPLPsINa0F1ADv8NV73ULS+08c3zruL1HRO+5bcTUUsCcK2l5kIOKyUz
         LsxervfxPDV3uv/SZg5LuUAlrgNUjvFryL8GpP/+HYEFa2GztjCXu29G9epAsPog5wCZ
         CnOMJcwUpFG709iMwgrSlifggb8CE7LaiGahMHjB8x5bxkDPF/6PAs6I87cLm7wWSbhe
         dZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7cFml5iMacxymRTseccc+03PSjcbF3ci8nAByl9l+YKneIcG/pfONC/qKE2FLJaMaLa5MOTAOY9VO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DXsIJtHUbQAf9I3RjhVlQeSZDAZOKwMEVL7sCxzk+YqxoEk1
	mYkOQ3/dmkInobq6yddpZ2VR4Fdmtmu1QGYd0wzNe2wyExF72G4V+4L0R/1UhTo=
X-Gm-Gg: ASbGncthsSnnvLDOGvl2nglHDQroY9BoYBOvaYasFRS7meCqqqXrcn1I/SEkl0yW4s2
	XqRFFl/ZqKn5Yz9DgiEu+qGfg1cTuV6JMObHWt+glZfheCSw8X6+K4y0zVDsiPe2YAH9+XVpCnv
	SvMgozeS2ulBgArBbu/sfWF96HjK5rNIQ2Cg1fvuMnzZPgJgksL5+rkMOsMrp/+YWKMwow26Qmp
	c2+5U6XJz7kWFSGKALhMVH4cL57vZZOgjve+Da/m2NmjYDYQl/FH+CuMrLzSrjfrt7wXpl8BQTH
	gYJmsVV9ctmexq4fPCWjGzS59CH3CtNnlT/YEPgj28oK
X-Google-Smtp-Source: AGHT+IG/uLzpRERbCl1zMbJkXY/9e21B4Oye6Db7RIlllWZzhZho8vNAYbf9zIjaFjjXBvnoPW3ZfQ==
X-Received: by 2002:a05:6000:4009:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-39d87ab6642mr1445941f8f.25.1744188046123;
        Wed, 09 Apr 2025 01:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/7] iio: convert GPIO chips to using new value setters
Date: Wed, 09 Apr 2025 10:40:38 +0200
Message-Id: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYy9mcC/22NQQ6CMBBFr0Jm7ZgpLaKuvIdhAWWESQwlU9JoC
 He3krhz+V7y318hsgpHuBYrKCeJEqYM5aEAP7bTwCh9ZiiprMiRwWGW4EeZMfKCmlAkYEcn59n
 Z+mJ6yMtZ+SGvvXpvMo8Sl6Dv/SSZr/316r+9ZJDw7KzpiGxrXHV7ytRqOAYdoNm27QPDd74Vt
 wAAAA==
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1VmSF1FsDxlYv2R/Yfi5O2efY79iuhVVKCImNUHwSDM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKL4ZxP/or07B09bNRWDnOGUJzJeTfjcs1xc
 42EVnXNzv6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyiwAKCRARpy6gFHHX
 ckkZEACfY8X9eP3FTD7PsTbprsHNKdiedrNEre7r1anPs+AIMIiioakugWK8lLaKg/b0Oq6EL9A
 iHk9z5hacSoe6g1CNB1DyC1QnXre0cYOwDScwvRjz9qfShj603Vjc+k+90JMdv61gQMKMsELcY8
 Iir8y+VHhI1yNhk7SI0lWwsRra0jrg1gsAHcE2M3DECmWXicFYuLofI6/12i4B8hDWu9TjquYLp
 PuT3jKMlJLz3ez2d+ukBGVnkNSFi/cx7n2CaV29RuhLy1SKTIgZ4j8gUlq8qg3RFPvwWL0lS/du
 /iA1MfeP4VJI/yEx1zpnGVGd8U1u3E/vpza0Eg8fHbl6ucXPFIv13zz+BfkkaipxzLPMUfvM7fl
 4d/Kdr6obV74gUzBCswJHGUjQRX0zulefhXy54u2qyS6OMpV/xwZLx8sXXudahrC3kO4EG+SAcT
 Cnn51si0tPt/LDHOJ4RVkK4Cooda0mpm4zf+e1zqlxyPS8YgGc+Uf3tgn+M81YRPss/mPjE6oWN
 OHyvG7X2BMIPUTI4Rhwq3b0V8m1yNodxzeBNoeI+jZ247HpmarrknhbASt5M84HznC5M2EkEScD
 GU74ckqRtNrsPzVDQ1/fo1o5Md+OULTwqVnRI/CGMZOWKumNFixNnCYDHZHGGwXG8DlcdCEEp2J
 sABS+CKuL2MV9Ww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the IIO GPIO controllers and also contains some additional
refactoring patches for ad5592r in preparation for the conversion.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- move devm_mutex_init() earlier in probe() to avoid using a goto
- rework returning on error in ad5592r_set_channel_modes(): return
  immediately instead of saving the return value and going to the bottom
  of the function
- use scoped_guard() in one more place to fix a build warning reported
  by the build bot
- Link to v1: https://lore.kernel.org/r/20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org

---
Bartosz Golaszewski (7):
      iio: dac: ad5592r: destroy mutexes in detach paths
      iio: dac: ad5592r: use lock guards
      iio: dac: ad5592r: use new GPIO line value setter callbacks
      iio: adc: ti-ads7950: use new GPIO line value setter callbacks
      iio: adc: ad4130: use new GPIO line value setter callbacks
      iio: addac: ad74413r: use new GPIO line value setter callbacks
      iio: addac: ad74115: use new GPIO line value setter callbacks

 drivers/iio/adc/ad4130.c       |  10 +--
 drivers/iio/adc/ti-ads7950.c   |  17 +++--
 drivers/iio/addac/ad74115.c    |  18 +++--
 drivers/iio/addac/ad74413r.c   |  28 ++++----
 drivers/iio/dac/ad5592r-base.c | 147 ++++++++++++++++++-----------------------
 5 files changed, 103 insertions(+), 117 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-iio-b064ce43791d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


