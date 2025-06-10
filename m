Return-Path: <linux-gpio+bounces-21204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F421AD372C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296CB189CC2C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A736129A339;
	Tue, 10 Jun 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NOGLGM/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1246293474
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559136; cv=none; b=FiZ94r9nz04S65NNXrimgr5Lfi4cBk/R7AVTEQSij5CYmpiUEZ+vE14ZolDllwYQI/63t9KEgtwkjN+l+GL+V7NScRgWP3NSQQs6lfpcNBtU2NAB9gqV6Opq74iLhe0wKUWBTkZGuyBTESZcHrYbxQc4CU4ZFe4eHpmTQLDAMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559136; c=relaxed/simple;
	bh=ewtm5UHhaYBtJ4WANu7XBZXh+LRAOxMJKB+2yTNHhJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDlYODud7Dl3G7OltJ+4ioTJMZFqyUr2lAb4tL5R2cK8g1IzYjlgT+2J8gcZohbYvBmI6L5WZ307IQGF6AJ5pWgW2/VM8PcTKM1acT+LrjmVpWrnAqVFb1QOyMAna8voTuysBds+ODCLkq8H1SYUxbNiHK8buLD94rPDFSLsNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NOGLGM/Q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2259378f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559133; x=1750163933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=NOGLGM/QSXx/P2C8JC3wvnlRpwRJvRXKK+hlhgJ50MDGdoI5ziZR+mxXfngZ43zkVl
         xllW+Eh+MYMlmcCjmoEq5R9vmK/PaHHBteXyYAtcIeSc8oZvttN/nb69WHCGu7zNEzA1
         /fxF2qTnxZ+orxINNfZdq30kUQOAmC65gp39h+MI55yrhC4cyc+rK4I/ezVa1cojrRMM
         xLfpKT16RH1KXG1N7NPVatgXuC6aDDzghbI4vXbj+UhB84ReRtG1CDY9G2Nu9fCyHmBY
         rGLwBIQhRPtocddD6Rq856nQaQOUNiFbFppm+eg3Xb+4+jlcF0f4UhPTggzP9K9/pASl
         IGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559133; x=1750163933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=kaxB2MaIFvlI9g58CyxwonAqYtG0cm9SpoV6FQtppdAR28hUNkpNblaCV4MqUPXpLe
         WS8lZv2Qkz52KbWlRjI3ETmePawG91YPaCEAKLsHl+C1T2SkXC/84r49cySkHIhVS/+o
         9WDMDsQwOgjuxWEzoJfhAgMZ7pu8Bju9E6SJi+f3o63JGn1dNdu3zxZxmAC9zgXrNWnO
         yeTtbB593lUtp7FePad5BLV1CwqRLd9qpVPbt+++1K+CQT2Mj0XWQOKMyURstZmUA12B
         aXurtYDi8O/H7PV5Bz42vXl0OuSKF/0hQNK45Ggn1DuXQtcfYvdI4GvJqy0g/h3sC9Bh
         0WjA==
X-Forwarded-Encrypted: i=1; AJvYcCUtFk1se0Z/POuixboJ7eX1xoIuA8JHoiA7CD1jjlJztGdRQXKGO63SG8BsWJ25pQEfEyZKRQOzDNvp@vger.kernel.org
X-Gm-Message-State: AOJu0YwUasNDEpZIBVDiTS1MikbzL5vDv2+Ji3rkwFxy4KoATMsDkfo/
	yAV77UgIakfvJlpMa2LTDdKHmLqqC7muWVDwj45Mq9VsrL4n/zmZJB+nMy0KeqeyFLc=
X-Gm-Gg: ASbGncu6XxfNQo2wTUQyrdRctDskEv6wUaF/eAAkDgPrAWf3KIxaBBKe8icg6ckAeYU
	AFUJHD+M8JkWKaNqEBRvxFKL8ERGOB3aqdN/xcg/NuyjKJvRt1eGYJaDNgnR9iJnvDKdAllxO6Y
	YxIzsHX0PyL2F2rMRPFVJv6dO6RCZUBON0ehckIlvDalu82BWS6yvZ/VbWavl6HxSxP9RFRFtJv
	H+PRifIJ1f7TI7kudvtka3Y544IOiFWWLXBiIEM0EPfHqRVjKieCAzMJlEJeL9/2hcuLNuTxpuO
	nIWXnGh8SUXqTbI0Ba9ZWEKa6sCnUCXhbEdRTUKB9MRhSuaVAb7n
X-Google-Smtp-Source: AGHT+IHJRkQOc9mKKTqisqkycJt9sb/TgcpVTi9hUVKLOOQP54qkbtSmSLteeeLcL9Fl+UGpgwdsKw==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr2256652f8f.21.1749559133197;
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:50 +0200
Subject: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MWRLVrsy5tNHMi8wmFGL8LdEv5y9p4ltDubDqUCng8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbgSaqAglGw/fi7XTf6vhd7I5rjcyoaZ7sg
 u/b0JAesI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cphAEADbU+UhlxQiORUaofwF5dUuYRA9iVQv3yEvZ+lXlQEGEXL4mX5gYjUS9d/xWjS8CHSJ7Cq
 +UUe2xk0NLgsm1fE9SV5Hp9SGQqqcFdilBX5lGIJE6tLOzFdGjtU7fYNlmPPebz7glzebbg04jE
 ETaOEIJoVn9KS+yaFocnqrbFTt3PqOHhjVGrwcZSxuni3nf4iy9Yn6Gg9RjT4sZD7LbZpvPIu+q
 VSJ+OiSJrKaKNK5BWfpVcUBV9ozDfUURkd8lrj1eN9zVE1/NTQJtKzVkfS2kpgOOq+DQajEzPiL
 9oez1XcOjWsvIfe9qQQSofbZtZz3kG94oqWNrr/VOpx6LGzqwgol7ozx4fGlykaa5QiTn5sjxcV
 zrNQpp0DoIf1xjwAovdNq8vE/SKPAPYAwQNlpG4Xjp7WZEkJxxmN6fbikV2Ob9wkRDAgy3Xo1gG
 yYH2FlibMDX7OGlZ0/QrG0cjBY4OyPJN3UUJUimhaU7SG+orUxraxwl9IA6V2WwLq4NliXgLm5u
 8SwuKGtvYzhiFoyiBDDCnKRrkWFC+s4ZLD+GnjEobklVaxgM2/ctCUotBi/brbm13+YbqYOUiUd
 clq8mYqQHWeM1/nbk74TqSGNVNjSm6iFxQ3CZjMr4FgR0E12kdYKX8d1UgJ6kye0WkNWDRCGsSN
 4YqcJKc35stS1uA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/fsl/qe/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7509dc5eb840f344 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
 
-static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static void qe_gpio_set_multiple(struct gpio_chip *gc,
@@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_input = qe_gpio_dir_in;
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
+		gc->set_rv = qe_gpio_set;
 		gc->set_multiple = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

-- 
2.48.1


