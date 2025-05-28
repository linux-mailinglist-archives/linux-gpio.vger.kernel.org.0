Return-Path: <linux-gpio+bounces-20633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EE5AC65B5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 11:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9055016F589
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E0277029;
	Wed, 28 May 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECxbcPC1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7AF24634F
	for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424133; cv=none; b=N7GnSYjDMKUI347SlTZBW4yyxp9/evySWBB0S228fqvw4wDaPGLMtPtkAU/0J1vAR4wWs5hKJuZe1lhXFAy+yhK5JRRzcx2WlIQU4liwkkP/17Ouz1t+bpHXUDCfdG5Qo+G/z31N/EudOa5CdAB47ufiooPYRuYDBIX5qFt6be0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424133; c=relaxed/simple;
	bh=NBrvQMrhx/6hLM6e+tUOgjMzy9y+05NeL0rQjwNG5cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nntjn2ECDbsyq2NtrIN1GG/62LyCmvfecU8BgrtpqcKJRhq0kXwyMYVuWO4ipKLmfIa9q3DgR2Zuyx3fHjeQGnIaOU4/SlUW39L9YsIHQvd5/Ps7zKu+wWuCO66TYJ1pns7cJ2PZOhDqzafVV45L+iR3WeHHZ3K0d82Qz4vLqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECxbcPC1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so459216f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748424129; x=1749028929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=ECxbcPC1ydBl4yLBQgv/GGSpkdnxTqo+47dQCTLN17F3tHi7wbu5/1KtGkvny8tAT1
         uoXban1vEGgzL55napFURZbapa1c84rVkLwcWOQv0CD5VE9SeM3YFQKvjtzAG9hWsxVT
         Oy50027rbutS3az3vTy116YKiXYnT5C9+BlcOiXG52EwE6ylTDbJGCZobZgSg9ElBN09
         S9DlMST/oPLT9AAXoT4cQ7pcgQGquUBpVzr8hmkZ82+ZVQj4bZsZJXl2Dkc1LN6B7FGE
         PqtTXV4W/oko5hzUDLsDQkYZ6l/Kr2tmzZxkTE9Spu4yu6zgTCcubC2m6n0gslXrNEFn
         Mb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424129; x=1749028929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rx2tOr2eY+H+fF6DPR+iLBfDIJ9wmmt75sHUbD+GTn4=;
        b=HC1fe87r4n64k6pI/u0snoCRk3VQMqpWyE47y11Xbzz5rU7I6bqd21n0zBSE01+RQr
         uOuwAyf6PMXq1duTiu6AvsZZcY71pjKmuwEaW/7VjmpWE0jkD6NuJz9AeSr18zD7sMSh
         Ndl8mEe3ECjmG/a2X1atgAWrfTrlLdLImMjC5/MGqXKrWqYDSVKWI6KSRdRBCPBOJAOX
         8s9sc/5cSdl9+WCRMk+Ru10KO2jq9XHq61w44ZHube3JYZQ8aOjaymOLnbeD1vNwhGkY
         NWsCHK6sdjLsSeeg+SI6+bzG+l0hoOYLxw5izttAb/GCQr4zec/XgQie6bqTgERQTm7W
         /Khg==
X-Forwarded-Encrypted: i=1; AJvYcCVCOfPruRryTwcIcf9s9PehfZGxPqzOmd0jV/J3GOBfDVASgoV8Un0roEA5lyQL+HbhD4lNqCERbtT3@vger.kernel.org
X-Gm-Message-State: AOJu0YwyqoajgXt+LuuOnkw3x7rZoZLgXADA77a7wQ2cKdSsjBmF1K6C
	Fh5zjsyBxuW4mUJslUrP0UVOt2o2YtLztbhVphRuIKzlAbq4pn8Ikah0wVDY8YhBk1Q=
X-Gm-Gg: ASbGncvbJHCqdokwSziZomyW+0btntF9zNS+5zV/Pk5Wz+r3gC3A3am6FyD3xKhwZOW
	nUJ+35bGQRMEMVtb2t1Gr+P3QxSrK33C4wymyheQEyGMMobbY1KOU42U5tTL7fMays9gMCmbAZ2
	mWijDT3rnZvasXAWFdYhalsL3DgxLpiszGMQFbq5jRAvoTsRYrHTRuqHEUvrr922S4IEUAt0CZe
	LDKbBi1xF3LKyCKWJpdnKKVZP0wtJwjc7Pn/E6Wc1hEpD/S52EZF3VuqkOwuwR76Yq1fk5u6oKC
	2OOhFRvlO0jvLx45hnkjlGo+nxgVlwHEQ3r7vZel0RW4GguVaJi8xk/1gJNNQA==
X-Google-Smtp-Source: AGHT+IH5TQnhBjLCtJ2q/cfEBit7Ui0hALJWg1qthF8GaTLBAj1glOoq4NR08mgOFCiTUbTFHl0ZOQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr53578465e9.9.1748424129243;
        Wed, 28 May 2025 02:22:09 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787d3be4sm11249795e9.35.2025.05.28.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:22:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
Date: Wed, 28 May 2025 11:22:02 +0200
Message-ID: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NBrvQMrhx/6hLM6e+tUOgjMzy9y+05NeL0rQjwNG5cg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNtW5SA81tOIk5iN4B9Z+3BqC9/qHt646YY3YJ
 uI9jWgBt8WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDbVuQAKCRDBN2bmhouD
 19i9D/0eBMcTsNOBBePfRl2DZ3L4ypubeOhVG44mTQpYX2zsIdOEgGmwhjuOd077CghdZii0sJk
 qdSkTwdpZ28eXWCuOkwDDskSzmWCaZF/9Ex5OQFRSEsJQe337Ltz4y3+KFb/E5hh09XzvuVMbCG
 aPwR0jTfawKW8vW72lIZ70d/gyNq2gM9/pRpb6Nci1v8b7d1f0RNr623SXEO9fd6ELCz8aKP83k
 mJ3aoCIqhO6iXRbo2mwKoEmdyI5x6qqyWlYZrDsC+UsgNNiPS6nzSUq7Dvbg1i90WdlEylZGv8M
 cl6GK84UxYlWEmYX5abbyMAdsT0O0/MTHOua6jdDgbjZapsX+ypR/cBmzjjcVwVuJvr4j0PYjrX
 pVY5fxYML23Z60GMa+8SSNTHEZgQZ9p+CUqmEdV3KBWStCv5ufMECiXT8tnYpbnWaaUrr9ggYd9
 sB69rRw2YhtFFpAj00TrAkfzVzHyDRBo6LgDCu82aOjC6wInFLqaLOeCSkVEn8NHWgDcGs80eL5
 rILPvqvOCf45rWEOVgDTL/i42dseGOcwN0CjxDZ5p2foOGCt3EYQdn6RewBhkmhviwZIcWA7a3c
 JgiZtccCOEtRxwsNF8G6PLwEecG4yqwi7MZIbcK/AI3iNZIkIx9G41SX9Iy9kjb35LpddAxw/6G eIDbZeugPNeCrQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static inline st_gpio_bank() function is not referenced:

  pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wunused-function]

Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db..8a2ef74862d3 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -374,11 +374,6 @@ static struct st_pio_control *st_get_pio_control(
 }
 
 /* Low level functions.. */
-static inline int st_gpio_bank(int gpio)
-{
-	return gpio/ST_GPIO_PINS_PER_BANK;
-}
-
 static inline int st_gpio_pin(int gpio)
 {
 	return gpio%ST_GPIO_PINS_PER_BANK;
-- 
2.45.2


