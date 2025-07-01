Return-Path: <linux-gpio+bounces-22470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A18AEF47B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1D627B11F0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 10:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4D8273D60;
	Tue,  1 Jul 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itSvZOop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9527381A;
	Tue,  1 Jul 2025 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364348; cv=none; b=BWmsvc9O674cLJSa0hRhNw6uzsj9boNNI0cU6y3tudEdL07hLd1g0w6HvlnUAi/xBEIH22pDWO8aTGG3rTOQPbtayCLJLFIwDPYkq6O270VmkpxTN8TiLeezY5TA07xS9mQbDt/PfG1y8EvoZzheHbQvThi00xFyne0/EjhquPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364348; c=relaxed/simple;
	bh=jBkWrmYg85LJDEJOzQbvK9KxHKJ2Rxy2fOsHy69Bk70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUpkwApcex1FYGmYlkDAdgDoXpRcIbjXrqSz2sx7pSzPr5Y2tBSdqaIwjmNkCbP9dETnxgAPlEfW1QpLt3QPTulrp/yHQoQESm9nUVYNbv3WdIuWDlc075CmRViS3N35XVlLcZeG76Wdbyt7ETxR0J521glgQcC1CNhuxUuRg/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itSvZOop; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade76b8356cso607339566b.2;
        Tue, 01 Jul 2025 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364345; x=1751969145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iadSvd9ADK8oMvjZilYGUvx8+bST1k9toFEmq4yiSaY=;
        b=itSvZOopTgPUTkkB/8SfgO1lRqsT10VqHNDnMoaZouWpIBjmJppthy+7yirK8dAJcG
         rZE2zWGOQB71ZRqzqgjggzoP/uWwJ8WATLvwcPYSps0h0dpaRUS3tfZohkDpGVdj24/l
         VF+RrhRXJA1mrLnr+0wujRdwdsaxjlDfO9e0B6aS+SmyCHuJmQOkSm1iuWGYHs1IiR0h
         hJX0DMMWa/hM+q3d6ENUe6I9fjdR2+HaqpUsx4X1hUSK7F0S5HKusQwCOQXHX/NwTUkH
         /R89dDIsbMjToUHPCU+ENLzMVnvmTG5UahJJPOSFBJORAl/fuio0nqPzl5dtBuWUqsQ7
         DN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364345; x=1751969145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iadSvd9ADK8oMvjZilYGUvx8+bST1k9toFEmq4yiSaY=;
        b=jWiMwdScNu0dfqoeDN+d1Qk6C9OSlXnSzMw7zMruU5y8RqhTjiN4TIq1XJf18WUfaR
         UtF/gzitrCTHgaWadk5rURej2yEyDyyVwr3y+5B3KP8mLGQFPmnUpbY7vqDgXukmG/32
         1f+43AzZugSkPK7DwgwkCu5CG+8l0DTId7k3KONJS1KsiRZE0moQ15DKu2NldQbGzGy6
         9W58Ie937bVGVkfLh67Xri7/s78D60VLNOQgDOLq3KnfSdFEM5mA3jH4wYCKrX8ltI1y
         c1pmm1GrWa0Yf0iv061AKliaZQW7uCPubINCQP/JZpsThfs365DS1hBeojoEN0Go7PTp
         22/g==
X-Forwarded-Encrypted: i=1; AJvYcCVZRNlwA0EJiTXwhO7f6/TWFd8+HfpPFOV3yRa0Np+GxNwzdKO4W0ca/zDt5axWL1pI+09mreRhZi/55ddZ@vger.kernel.org, AJvYcCW7JSd1QguCvx7yUlRHEO/SFjZnRADPfT5szcuW7gbX4zNdYfOCY4HEvD89AYieJpNcWdyTx77gxs/n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy2cplS43rEtsLVoOuRFo21YvSLvjOTyaKgsZ6FWNzPLK6HAHs
	U4rWKcK48osEWK1ofmY5V08VeyLtqbjgrycNgJifeZEMYm1ofBBMpOjfszY1ucHbs9k=
X-Gm-Gg: ASbGnctNcVnnf6vSImJ+pc4DzUBUPyekzQ2dzlrZhyp0iW9j5+08P0bO6DRTlFkTdLB
	ccunfRW8xOpaafabZCWWsLQUjghOQzZLTv5cKSqs7HooZD/siLm5FudqSaNA/j5odlywrrOBhbi
	lrxJDCeUweusRVulZ14mqbdxl3i4MiCHJVhY/dHgNyDtNRs5Yhpf2sJ0AkuHj09Ko2sqMSbCJp2
	KUEdWP89gVlY1O6k6CLLSFsBAC9QXtH8TFnEFUodjQ7n+oUh3BUyITwivMhD/HX6mDwa5zmh4I2
	U3aXnvMIJG52QpkjsH/6b5AhKnLWGihU8u0c210h9zQSiwnQiEpKID9rTrJevW1tJfno0DbH2LK
	xHWemmqkgo4VA1pCEQw==
X-Google-Smtp-Source: AGHT+IHQIGQ2Hch4gyaPW7HZupOC2DjnJn7l+GVqB7yhcz8qD/KnPlOuAVlsMHk5Rv61bStbPBh69w==
X-Received: by 2002:a17:907:96ab:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-ae3500f2822mr1907835166b.36.1751364344429;
        Tue, 01 Jul 2025 03:05:44 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a15fsm850718066b.55.2025.07.01.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:05:43 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH 0/2] *** Add support for TI TCA6418 GPIO chip ***
Date: Tue,  1 Jul 2025 12:05:35 +0200
Message-ID: <20250701100537.91491-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the Texas Instruments TCA6418 
GPIO expander chip, added to the gpio-pca953x driver. It also includes the 
necessary device tree binding definition.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
Changes in v2:
 - gpio-pca953x.c: address review feedback: remove some else statements, 
   turn some if-else statements into switch statements.
Maria Garcia (2):
  dt-bindings: gpio: pca95xx: add TI TCA6418
  gpio: pca953x: Add support for TI TCA6418

 .../bindings/gpio/gpio-pca95xx.yaml           |   1 +
 drivers/gpio/gpio-pca953x.c                   | 139 +++++++++++++++---
 2 files changed, 121 insertions(+), 19 deletions(-)

-- 
2.43.0


