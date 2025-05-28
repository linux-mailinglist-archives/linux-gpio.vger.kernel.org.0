Return-Path: <linux-gpio+bounces-20653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E79CAC67A3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB6C3A3F10
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B3F27F160;
	Wed, 28 May 2025 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xX75Pjfl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DB27A906
	for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429146; cv=none; b=p5vf6ymDtYQwQGgaJKuv712s8gsfum9On7DkOTRwjBtbFUtlC3Q+1enWL5ilE8Rzl8IzX/eaWcDfXt6R6Nqz5534HDumuqoTRXqfUaKjm9+mLUaxl5LY60wP8Qp4SJJvESio7GOBzvkOU4n6blSy8dMvKSSDT6wbGMXY/EnqIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429146; c=relaxed/simple;
	bh=WNBlDSISNr5rKZ8xmsunf2YPelq9fQ0/mDnde8HKsf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K02kILQPMMHwcW0FUZA5dG2jV8lJC6u9fAliv688dd6+GFnL0s+FgqbXENkpc3LPr1isg18oLTXr7A2G/CnC+PoOT62l1jrTzibbzhG5up7fc0CJkhAdnhGKVegnG0zHOH9W8v/lkAUoHySItbQeapqgUQ3SP0GyUDCCYvdi67k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xX75Pjfl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso879220a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748429142; x=1749033942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtDcxZbG0zU13QY7UbKwVwW+Mbm4F+j186r81Car6U4=;
        b=xX75PjflHJOj8CtgjmUTqMs/ychFP5QEu57v85bYvmY44npb4aLozHzL+jFTnF3Xko
         Y9LCL7vzQmLmQcgcl/A50qsLv+BpkFcG/MblOMbvtd+/nbr68814P3hC2mUVDsnkTSIe
         YUY6SAPFbCKaXgQyzHvGlcij+cPV2eIO7Z1nE4Nw+jZZibVkoeoXyTJQ7USUMQaltrqH
         omd7HKpMuxzqhCoWLsHMqwrW7mIQfY5AbEPFmyW85aeT//RcoypDlhdK1FFED1W5JieT
         9qI/hzn7G9uptR/KjwivzzaBHBQgpX0sfL9vLBJRT0CI0Vpcf77QXfhrOCPr3dLEXjgn
         uK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429142; x=1749033942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtDcxZbG0zU13QY7UbKwVwW+Mbm4F+j186r81Car6U4=;
        b=ErS0UPPaAU0TXhJHMEvcNEbYzKinOYOXLlvdmhjn1JHlwTrFlvJL6zlhfv57uFuDu5
         1Q2BIa53T54qyAoqU4QZsZgj+im9DYPXvDbHMbHqGPdqzv7torD1PwLFhB7bnsvmT6fN
         xiw0GdJtwGcLdycdrTtNGsDMTKyypqbdH9RRHov5i/1aNB8pEBgze7EToRpMHd1oTl1S
         AIGHHP5EeqSu5anKELrH2UVwXdet7qMvuFmK3YX3QEo0EnKXYQmcVDXpdQvm6tzFAYuy
         RO60xkmWsosE35WX0ivwXHrx/9/QKjRgyVx0Jr6BIvy8SxbZ/NUtQgsnM3hCEm9b5U2E
         yh6A==
X-Forwarded-Encrypted: i=1; AJvYcCX7IAsikjI41s7djtsV9voiRHa4zVbcCE+Il/jE1py0QWGJeEAfYjVcW1d+tKKkDS5JJ7P7/Q3iVsGn@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxdIs2a3sM/9pRz1HzH4Nrd32A7oP4ERZoUWqqE7iC6HTsQwS
	Ckm4Efwc1u2gY/W4ZD8bMNXcJYETQL3Fem34ly/zuXkWrGqqjltz1IyZ0Vtg7dhEJe8=
X-Gm-Gg: ASbGncuYDI5ZmMW54/YDM5DjRIB6Kreo3ZJbVB1QT3DC9GBcKovNzYEwYY1FoSjbJim
	/SDD9v8Epl26VulwB0OUgRg7YLrVA9P8+uI2MXnhF2PO17rHx6StLyxYmTDc2PZv1RVhat2RSTB
	BG9IhubAy2/34lZb9L6oQ6+FshMqWHr0fsbNp+Sj6Uh+VeGBLhDYlTtnmvPSujEQxdBAeDnC35S
	rtj/vcUGL7fLaGNIfdSguXiFO0NMfcZaGBjSPJOPs+Df20sGjWb2ASEXPE/uUCkIun98EkW321x
	S5fVulBskriEF/xvC9v8PRzFG3vtV9wmPfoGRswlMdP0RfOAk30zjyJxprJabQ==
X-Google-Smtp-Source: AGHT+IG8X9g0RKfdSK4PqNdy9GQldoxC4TaqYDMdsaCwuPIFrydbyErQBIHxXyGaX56fRVVumDyFvw==
X-Received: by 2002:a05:6402:40ca:b0:600:7698:f79 with SMTP id 4fb4d7f45d1cf-602d906683dmr5286829a12.4.1748429142217;
        Wed, 28 May 2025 03:45:42 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f2375sm608858a12.23.2025.05.28.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:45:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
Date: Wed, 28 May 2025 12:45:15 +0200
Message-ID: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=WNBlDSISNr5rKZ8xmsunf2YPelq9fQ0/mDnde8HKsf8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuk6td3utNc5lFqBWmZW/WBqH9jaO2wpVyO2O
 GKz7A2M5quJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDbpOgAKCRDBN2bmhouD
 1wTjD/9QOyX2QXQ1eQS3zCI3JIVMUBVm1xZ5KMkDyjdtLd6hUXBleXXqibnWUXqr+1kS7t03yy2
 kaOVZ2448OwaTRz/BhSFAR/Np6y2Hzop7z7kMjW4IyIVqa0w6HN5jy7Pmo1KQz2zUdmWQpdVS+R
 mO6KwrBKYrTEeuT0xr2BpKfnfsW8ZHiWjPMBungKLIbLGh38EIOvFKB15GlZY5YBq1eh3opR+CL
 Ubk4DL24a65NJKA9zDZ77sVMPY6NU77a/bnWopY0To5b3074+g/KhmfCd1AqM0McZtuJ4Ih4mjG
 a76cDBfpf/03S3e4dUc1hh7lyfGXE6i0O2/NZSbsBujJEs7B0yT4283/ZiIXYHP1M5hJwomIWqp
 cppfKKypfrcEN5AjqEwl6SgFB+BFx0xMxDR659UgkyTk+4d7J3Qcq6EbyURrjRQK2Tz0U48HkY5
 4pP2C2KHeUqQwX2rcq1WMuRZumxPF5RJgjN5+rVP2Bix1fT8Gyrb6Dl5FjPwSucRrjhM4w2D3jw
 nzblSuUS8JO+epx3jnjlnXH31Uqrz1+oAF58anmVIG5Gxpxzkt3YCWtw3Oa3AzHW2v7nyxwzOpR
 Z/2icDAjLMkglMOuemUlY/LpmrZgwqTtIcNXRvUC7owHzq/j/jVfr6NTnFEeC64TPJ/Naex52ql wPWFfMLEFt0C0Qw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Emails to Jianlong Huang bounce since 9 months, so drop the person from
maintainers:

  550 5.4.1 Recipient address rejected: Access denied.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml           | 2 +-
 .../bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml           | 2 +-
 MAINTAINERS                                                     | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
index b470901f5f56..4dbef86bd958 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
@@ -15,7 +15,7 @@ description: |
   Some peripherals such as PWM have their I/O go through the 4 "GPIOs".
 
 maintainers:
-  - Jianlong Huang <jianlong.huang@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
index 222b9e240f8a..e2a25a20f6a6 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
@@ -18,7 +18,7 @@ description: |
   any GPIO can be set up to be controlled by any of the peripherals.
 
 maintainers:
-  - Jianlong Huang <jianlong.huang@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 properties:
   compatible:
diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..29545231f5d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23628,7 +23628,6 @@ F:	include/dt-bindings/clock/starfive?jh71*.h
 
 STARFIVE JH71X0 PINCTRL DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
-M:	Jianlong Huang <jianlong.huang@starfivetech.com>
 M:	Hal Feng <hal.feng@starfivetech.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-- 
2.45.2


