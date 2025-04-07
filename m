Return-Path: <linux-gpio+bounces-18265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16149A7D4F5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D13188ED75
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA5A225408;
	Mon,  7 Apr 2025 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Khajtm4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8064642D
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009702; cv=none; b=bJcXp75Am+kcOAv37XpcJvFWnpzGuhsy0puFqifpQmMhjNk/gqEDuK12uXsYNRI1JVIvNGowN/TcN6WqeD6kpCGh2uwEru/J4b0BrTTJF+EjqtY2gUZeQHxC1JSZkKBTrpjLH94c6kJXLtwwlQMANvhAS5q5eOryPd+92rjlsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009702; c=relaxed/simple;
	bh=MiAn22hVOlbyctRX8oGNYTYKDM1ndcm2wEoP27vdd+k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mer2BYktrNu++Rwrs8ONTY5nZX0vys5zxKuqNngKlhxFm4S4tzY17LRyCIgusPIFnrej+leMVTKOyn1z90cG+aitciIvkFnOVcrk6r8OLtKb4KpNhgvCLBrkCBrX1InfYM0e/m2CAWAiJauOPg6WZ9Jy3guXF4Lpqp+YR6/sf7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Khajtm4I; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so36176925e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009699; x=1744614499; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94uulewHBtBiAX8+sjCLPZDDfGw+bHXEtaYMLwCyL4k=;
        b=Khajtm4IEZ5dbQBTmAdYqj1PV8mp8Xi6CHbfX99wEfTszhhuzRA+1QBJr1WrpBB9VQ
         QEqDsvnGb08nOBUmqMk+zJ/1U8bQWDub8ACnT9/jLbHLQV5yvbnqlZeqq6RuFydst6kr
         QGLICnMTnURG8W0XdYyly6W1s3bJZrCz4lF3aIOm1R+0CmdlpDFsKnpy1oFUGZH3FfAb
         9ZFybjCjyyqazFYlhenuQ18h/Pot5Ap2GWV9aZP6hl6tp42cgGT7QpFNCdvfFv2rhQUq
         VkSj+S0P7JtcR2t1u9jJb0682cmE0BEqQXIiX7Yx9pacXjZ/NUbw7Vdt+qnurKzU4XC9
         hOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009699; x=1744614499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94uulewHBtBiAX8+sjCLPZDDfGw+bHXEtaYMLwCyL4k=;
        b=g8BUzdcVMvSEd1vzgfNMuNcBlnuZ7mHjMQQKDJy4Dzmf+3hBSKoG14I9wJlJ5hoizd
         jY+5Fl/L1tzvj2ZdJAk6aenDZw7Q4OjfiNUN+e2coYRgux+QW/yv0nsN0gO1nI6vvTFU
         LEeznuevJNVnFcnmpOiLWtPYu8TJT1cyB82W798ObaP8nlml27jJ1+qILm+EZtqvSoAW
         KQr/U0P3abeSYKnkGGinf3oQQNICduHB3ErsoHSeW1cvtLwRLGj5mSwhNCQ5fvtBvqMM
         onmP52I5lFJg06ojmKk1KAGzUI9CaWYTb03e+z1b57YOTvEASFbfzdaRvpSemCkaeb6l
         1xrQ==
X-Gm-Message-State: AOJu0YzVJT1wj1XAXApH2+oIpGq8O7KbMcuPcmNJot1BsM/dheA5Q5mA
	nMotkKM5EJTiLHkuPkD/VHwxJ4Lri8Mvx2fBQHPsCF/sYHVmuyPivgwt8X5Ecu4=
X-Gm-Gg: ASbGnctbNE8NAGqHKmioLEAdfs6jvDXxfBGLafImddr164O+jZrZhEn/HUv0812DMXW
	rLsr/rjMvya/TWlXumSVNzOqibQ0/aExj7+SaAZtVOoOyE0FFuXHcVmAHe2HBDcaX2y7e8D9dAK
	KDeKy+HjamXXRw9W0AH5WZcvB9JKoVuiWJQhVrHLlNRcWSXtMFtetaThkVnn/uoV3iBtOOooori
	NVKGG+aDBwSJH6pR/VlTbPWJHaseQy3Zd9saI9FosTHpJXlzBiO3NsmINtyXOL4KrEmG19XHlnU
	0yrMcDPnq3N+KIaGL+n3g4jmi05eBVhlAMw7Ug==
X-Google-Smtp-Source: AGHT+IHsDO5T6QTUODhFHp9jeIVrLiy1mu+ZRUwoCX9Nr2pzViT94X6QV/rU86xPbYvymCc9KZpRkg==
X-Received: by 2002:a05:600c:34d3:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-43ee0780603mr66466995e9.29.1744009698575;
        Mon, 07 Apr 2025 00:08:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm124328775e9.23.2025.04.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:08:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] gpio: don't compare raw GPIO descriptor pointers
 directly
Date: Mon, 07 Apr 2025 09:08:13 +0200
Message-Id: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1582cC/x3MQQqAIBBA0avErBuwwUC6SrTQnGogtJQikO6et
 HyL/wtkTsIZhqZA4luyxFDRtQ3Mmw0ro/hqIEW90opwPSR6lIx8XnZHzWScM9YZTVCjI/Eizz8
 cp/f9AI9gWd5gAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MiAn22hVOlbyctRX8oGNYTYKDM1ndcm2wEoP27vdd+k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83nh53Bgrj7VQXtV75cpLmt5US1HQnlw523cX
 mNQz8zShzSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N54QAKCRARpy6gFHHX
 cm5qEADIl0j/rCHlQj/2+Bwg3T1DSwXvpDiG4AlBG/8FVxQzuX0cMLsvIpPdSSJFf5Hm6HKkDUF
 U0kKdAvGrRCOJZ3u2gERMQlp6y5M0Yaph/Qf1hSZsd88Z4BHCk9GVbGYILCipiEyE01tlPp5xFy
 +EjK/UGMtfo8ziMIAkvHlJhnf5vdxtUCBRM9d+V4gdTV9NYP0I6NDePrFZT8dGcKsxwrz8rUjtR
 D2UU9n8JGmCj9XQ3rW+xviZuZDf5sHwOuxNKcbqKpPhQzjcP5g+JK+gKjd/22A1q49wAAv7g8fo
 vUAw2qLU1izoWWWFwH3VHwJtDyTx/YzOOeJ2DlPFx/PahSTQOrwMKLw/9+FaVG2DkIdH4/P3Zj+
 CfnoKUlu91MeCl+kgndMScWjrEiwY7o/kYoyeUTWVhRM6dQk0P8qTAeIh4h6kb3NWdBmwor7w24
 kyIggs9BplgtvJP2UCawEKFbo4OTwC9p3I8uT5kndTiOL0ZYeheR9v9zyai4Zi2OdtUe6FxunBC
 3m4UiKXC/wj05/k1NxbbG0NVAElz19Q1O/08TQ5OWzPH+9WFA9K48qtTEkPSctasU7yZw574XDl
 KyxxZsNLEwu3SlQBqXzdhBTJ0a42saIkjqEULN0EHlu5qJIubZfpPsEx6lvs/hBFpyRH21QhG4Q
 BpMJrkIPGWx+7JA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Handling of shared GPIOs in the kernel needs some improvements. Let's
start with a simple change of not comparing GPIO descriptor pointers
directly as there's nothing that guarantees that the same physical pin
will always be represented by a single GPIO descriptor obtained by
calling gpiod_get().

For merging: I suggest to take patch 1/2 through the GPIO tree and
provide an immutable tag for the regulator tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      gpio: provide gpiod_is_equal()
      regulator: don't compare raw GPIO descriptor pointers

 drivers/gpio/gpiolib.c        | 14 ++++++++++++++
 drivers/regulator/core.c      |  2 +-
 include/linux/gpio/consumer.h |  9 +++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250402-gpiod-is-equal-4e28bb8ab842

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


