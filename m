Return-Path: <linux-gpio+bounces-18430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCDA7F61B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B13817E9B0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545F82638BE;
	Tue,  8 Apr 2025 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZIIVnpyl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9972620E4
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096879; cv=none; b=iKBElkjdYn5Y12G90KBZjUv9G4hkax+CtCYo2UuzVrUMBS3kSD8cW0FSoPkt8Wr42aySaXEmqhXisrgvbC5H2816V4pJHfTDNnqF0SGknF47HvG2Q52gWW8gNju9eItXu4tVwaLyZnY32duPIiQoeEU85zJp44FUZdjSSBWyu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096879; c=relaxed/simple;
	bh=Z8NuRiiGre336HaXLG/p2D9NiyCslGW/FZNW9rsdegA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M888VZiF8ls5Lo7N1z8Olpx7wnA/58kZ0G6KkSC/a6zh5450lOt0+0w2pWydTaRVoBfnkNN+iaKbwpH+78imXoIqsVixDDFICIfXS2TfQ/xus02B0he/6vPq/K0jXYeJz3ZEl5amrNK1GZfAef7xI8LLD46VTczmeYlehCZZHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZIIVnpyl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so47292855e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096876; x=1744701676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=ZIIVnpylzxesCTIqs+EPKUi348pnFN7m+yGw7Fjp5hj12zguTNyQNKrW8ccnCw6zdZ
         BYQMkWzAPBWcgilvs4dK/weYpHLqmMB5IbOPv87Q5CbaoHLhP6rFjSJIXt/6f1Yc2bmv
         YDoer9pusvy5G2EQQKxKuIX+F3BFg4qI/TslcqYOGxZOL40P5cM3JR4pTUT5GLvMd10w
         H1eBIRsWeLWQ8Rqq/HkwnJV8OmliUYldt2/6mmw52kN1VvOrCvVfPFjdMhwMrDKqo7Fe
         9M4rk7CP66alTs+D7lWEdDYLi8CEg8R6ey3ykQw0GZkvxz7mD18ckKvsUkkWSul/xCpP
         6aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096876; x=1744701676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=dxHrs1zlImaHMV6vQOSfmcUm97PEO9NxRrtxsBAdk+ptrcB4CMZXH8MIg87qs09R9W
         QyHnGbFmu1UMLjDEg5KYUBqhEqOwEebeCvrOfNG0sZwaODsGGX6mmcj7M0ZgnrSmp8Nq
         ERVU0upmpRVyd+bjw+M42GR75B0oUBK++xQ5ddYgmeEgFZdSJQin3PCKwxCDVOG0eHYf
         EDiP7xBnv33wr3z1/NFMNYwYuagoRbhKAzLrkDeOZ8UeTYxaHN+PeC83X6d55wB2qPvY
         cOmYlHH1ROWnv7PrThmaBhm9PHuhl+ogR9QcYhQ0Q/3STs1K7htofERozyAzEWgYPllT
         BvfA==
X-Forwarded-Encrypted: i=1; AJvYcCVugejYm2JXuWlUVFmNmY5m+k9x0aKtLW6oIakjEsuOQCVIJYwRsVXqdvQ3VV+v9N2hOMt4AOfZ3IXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJCmXRus5FqRY/1kEOXCQDSAY6d6t0ZL7iluGhlHLBMy9/Q1We
	sjOqa3BzEh6qbhH98b3MlPTRIPpNHwhe7PNvcEMpxsUQPzZTTuJ2HfiqPRGSrhE=
X-Gm-Gg: ASbGncsQA8Jvvjii5modalhRcMSkeLh9q1WP4Sl+jQyqO0OAPDQ7EVgeyjQqQfm68iZ
	MX5NKorfoi16dx8Gn3Y7ioOcu8tjrtyRGBQO/ddGDo3NuLXr8FAGYJlJhCcmW2BNdDN/OB92aRZ
	fFJeICT9s4Nnx2lGPPYgHRaLPETv6pZ35D/nPLxmp85T3+qmHbDPB6n136nhamEJNwdDe4NdWAU
	oF0nkr9MpudWQifVMRDsgRvInNtlxK0v4lSYqhdZO4JactpPDzKJ+Z3nynizRIqgwBSFcP5QRlA
	4AbsiX7qoWjdvQ8cxPsfV7NGiyttb3vAoQKpyQ==
X-Google-Smtp-Source: AGHT+IH4VtW25T5J+PjGlIaZ6M22QPow4uOtnfupdUllT2Fkt12p4tk7DF0T4P47TDZZTHY0VBHcAw==
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43ecf89dd3emr156314595e9.12.1744096875649;
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:11 +0200
Subject: [PATCH 3/5] powerpc: 44x/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LL68VEJKE/MtZ6G9TyrymTnHIDLdTmXeqNGFDYstqEM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5msWyg7dgLldXdctL+ZK3AKOwzmS8REEK9k
 9AhwWrSKiaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 cigSD/9n9tAkmdjxn5eCjtFyUMEDYwobZytzV5we7jp4QTTClSMwVsjxPVdAuelo19SzpC5P1u0
 M63rtFA7UKIfwCv0qVMtTIjOfE5qekRqcE3rpWVC57w0YF1CCGAPPzX4gSvo4ldTxlu7j9Olyrg
 ZQn3QFnmn1IZKayoceAC15tLVl/eZ3IIX19k0JbnpHAUOesg3uiENYp7k5EMprGRKfUJp9sVGBi
 jw84x4E9W3dLHqOBTZgyxW8Ro/FZRteiUscoL10ecKjUZZ9toN1tt4dPuJr6U0hoGXZoVudteyo
 QSuCQ0tEqeHw4rm+fcKwwN/uE0U5ytmA3sr/g/eKPGTI487XQvuglX53vuusbrdEv8QlU4d3ReS
 Swe/4oyn+0HH1lqg1HVljkPFwE7PLSiRNCC5zvR2mqieXeCtTGiml4ml3rtCjWSnuwYP31q8ceh
 pDDlxxguynZwDlBEAy0HRpWqynT06o/p2vpwEpHkCKj71/iV/+H/3obtyjiI5e/WfMNvDBjszrg
 fl6TFPIiat950nUVd8hSd5ClC2Q8MY6OaTz6z5BdELRjbZy7cy3TDLR9zL+yfbANqQyfEVoJAWz
 wayOYSs1wPhwIm6pa0PfDng2DFrmIImzJSvnJrJTXLCD6abuuSpjIY7MGu2mTBoj2F5pJQiRBIh
 h/cCOIUgu6sJ2Qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/44x/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index e5f2319e5cbe..d540e261d85a 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->or, GPIO_MASK(gpio));
 }
 
-static void
-ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
 		gc->direction_input = ppc4xx_gpio_dir_in;
 		gc->direction_output = ppc4xx_gpio_dir_out;
 		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
+		gc->set_rv = ppc4xx_gpio_set;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
 		if (ret)

-- 
2.45.2


