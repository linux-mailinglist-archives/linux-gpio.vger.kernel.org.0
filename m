Return-Path: <linux-gpio+bounces-8052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492A927D3B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 20:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E651F24676
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F5013698E;
	Thu,  4 Jul 2024 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqEuMRZu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC104964A;
	Thu,  4 Jul 2024 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720118217; cv=none; b=DK8vmO9urIWR5gPwUTgmrstFUDwY6b05ThhP+XQfeIfxViYkyhFDFmUyoR/AxKG/Y7xDHVDRx9uH4tjeK3HD/+xKgsf3jnKopSVhY/Lf8B3G5z9MrLK4lPRGj3ghi/flpkwAEgLxK3loJ5kT8WRvBP5T6UCGvj+fAvIfhw9sTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720118217; c=relaxed/simple;
	bh=c7S40WUNAozA4LBq97XpRYAkngPVHcA8SDToFY/bVWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbjs8h8Sf8KyEvti9BmeY826ac5rb/ztQvYc7IYerT6xVtMJWhDgi+6qCwnTZtzIEmaM9cRb/vF8J3Oxtg78MTwdxV/FqXgzKT7Fx+A3ri3Aop6WOCu5lZxiqcmYLbo9gPqHO7TBm7wOBsCBUXGbJl/bbRx/nmzwZ+0EApDba40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqEuMRZu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42565697036so12692455e9.1;
        Thu, 04 Jul 2024 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720118215; x=1720723015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EApMlZB0Bn6BMC+xW1w/8edmuKO/9yOt9I0H+x3T3ok=;
        b=KqEuMRZuRlwqhYP0FOpo9Z2Pzuze18UiXn8HU82aJKO0TIvSaySeV9vkwllQL2+Aou
         RGmoO8VTkQMuhM8VTs7xCCrfqT79Z00U4ys0Oo2QBRjwVKqak7ZV+a/gvkGy3OzqI+bX
         0XQR6+GzUvQt5wOAfCumfK1Lo4D4IJMVwJEXFFHg/aOHDWcsVOkVTQjWmSAEfWjP4MPe
         PXmpIuQGff0l/0FWBDt7zjHXiPauUErKEe3QUn1GPgDasLLb1FlmNJqyl32qm2WMe/bX
         Ouf4iC+ARrMByErAzI2qW6zyn59V/ihUA6TJcvkCthsJW9GjaYgagSOnGZODSvnZQ/6a
         wHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118215; x=1720723015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EApMlZB0Bn6BMC+xW1w/8edmuKO/9yOt9I0H+x3T3ok=;
        b=C/ILyKa9gMMONoG20DGih6u2vI/VuDQiP5d+1qv+ZqHiv1rc0uJhzIkjprfhdjgRFA
         4JHH7KnNM5uAIhhrGdBiYsHjcL8+3dj341r/PUvVqi4bf6STn8Pgub4RsemaKOl/cn6m
         elM+Lz4MUvqfH0TRT9HzXjico4u2ySzIEd4xAfIZFtDOsP2mbdfLyNlgTGhLqf6dEiIx
         lQuNMhG3GRH29hqN5WLMy9EllTN1cUIETgwA37zgyZpFWBSP1TRxTMYYeWvZgE1voNJ/
         4LLXImWblOJei1lhPGfw2EvCRuqykESq54Y+S0K8RXa/t/f7/d+L1+i5AaHBPPPvYM7t
         QKRw==
X-Forwarded-Encrypted: i=1; AJvYcCVPPSMdBHnRmo56Z89By4dXv4ST7ZZf6vlx3g/zAM4W3+/GS4kmRT/q6E2+xQFgnIaGo5ZNONjMVkQHhTkiam1zfhYYI9JSjcGEqM78
X-Gm-Message-State: AOJu0YwTv66YAEXoJJnpN9j+RwFqkhuhcMGfigJ66AqaTlIG4pqVkkNp
	GXlZM4Th6/qlL4k8LBfn3KiHYfB5C3N3W6Y0SRzIDMseW9a6L3KW/34U66wv
X-Google-Smtp-Source: AGHT+IHioqy727ooPBFi/SSChYgD1mPtL1gv7c3NGDX9RrcnTYpihsmYFYBg3EHsbXrHGOH7JSYxJw==
X-Received: by 2002:a05:600c:4d06:b0:421:805f:ab3c with SMTP id 5b1f17b1804b1-4264ea00679mr8268235e9.14.1720118214705;
        Thu, 04 Jul 2024 11:36:54 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-0b06-a203-2f25-a0f6.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b06:a203:2f25:a0f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a28333dsm33823075e9.40.2024.07.04.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 20:36:43 +0200
Subject: [PATCH 1/2] pinctrl: ti-iodelay: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-pinctrl-const-regmap_config-v1-1-9d5570f0b9f3@gmail.com>
References: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
In-Reply-To: <20240704-pinctrl-const-regmap_config-v1-0-9d5570f0b9f3@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720118212; l=1096;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=c7S40WUNAozA4LBq97XpRYAkngPVHcA8SDToFY/bVWQ=;
 b=U4waVxTPucg0FfZbSSNFLKnELb+GZ/25zPxYz7ON1U34Km57RYOyZR6MCBMYjL4NUNI4yYPWU
 buHm3j/g4C+AjBWAWMlzmrfUzOiNyXg+KztkVgIbZuMfWQhZCOMXQs6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`dra7_iodelay_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

The pointer used to reference that struct has been made const
accordingly.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index ef9758638501..08d785c8e0e3 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -82,7 +82,7 @@ struct ti_iodelay_reg_data {
 	u32 reg_start_offset;
 	u32 reg_nr_per_pin;
 
-	struct regmap_config *regmap_config;
+	const struct regmap_config *regmap_config;
 };
 
 /**
@@ -770,7 +770,7 @@ static int ti_iodelay_alloc_pins(struct device *dev,
 	return 0;
 }
 
-static struct regmap_config dra7_iodelay_regmap_config = {
+static const struct regmap_config dra7_iodelay_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.40.1


