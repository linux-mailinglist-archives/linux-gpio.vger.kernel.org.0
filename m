Return-Path: <linux-gpio+bounces-27454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C46BFC345
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD5355447B9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED9D320A34;
	Wed, 22 Oct 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrqLx2jX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267C347FE6
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140073; cv=none; b=bFX6gJxRI1wXADVcbuSFjyyU58PG6Uxy5K9w71Q/iTcB74JbHunXSxvLrAUuKNxgPtT1ydtDC5EIE3Ks3lRXJWb2fqhWp5BdydOdU8HbZKecm+nF9/woJXCRG7hXEiYo01mczD7RVHpCv5ITGH7cOZV4E/wa9xGWUZ4Xo3MNnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140073; c=relaxed/simple;
	bh=T0KheH9SmHYRG9S90aXs4rewCJfStqdviPw1bBq61oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ik4ww7rjQd73uIVdUdFDUQ+46Q0F1rw6emWPXGKwzB4EcqVGTyHS53sQoRLGfqnn3t3V7vNFppDBgU5wvSjB8WE16KIvMMbIqMw/RrqgdWUYcKziT4CInIse4YfjUc7tqZu+rrsxN/JUCt3Gn/Uv+RnqRv3gf1NaE8r7n1Qw/bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrqLx2jX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42844985499so478332f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761140069; x=1761744869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6bRIK7N0Lc6wOEz1pBT1Kkom/tSArzPgk5+y4nbPsU=;
        b=UrqLx2jXTyMJkQCoL6eYFx82cCydhZ2Q1yowuxxOpVg41IMr+b3AWk5Qzc0UOSptmH
         YLxG/0dZ46P76ApNmc9iuQraPntbthmKCmpcVSilrmE+bkVmkPhZr7p2Pd5jAsXrJVjW
         o01Thw29jYBLuYdhAiZ80H4qh8Htqr/Oa6UtjcPBsej7EHKJCZAVZHXK6ank9Y7gKzwx
         NfxMHZZg9OSdfBmvAZDTqTgCQkV9ty8fSE+UOqMbwBDnj8Z2yADlAYJdf5wEVkRJFxn5
         39GNn2Nk2Np80n3/4xnsbSV42CQQaibbirfFF2ajUD+VeElYu3ck4RlO6NywhD0zCSHN
         OoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140069; x=1761744869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6bRIK7N0Lc6wOEz1pBT1Kkom/tSArzPgk5+y4nbPsU=;
        b=DhPtEuqsrKuOiOR37xQg/Y4UWSu03f4n58CJgxas0ATbqvibZYWcBYR6SCg6id9Cgl
         M2xDfHpCpdQ/LHYbyOom+cWzrsGeR3tfbjSMHYPs8Jx36oaxb9i8aD6yUSkc4ymLzP2F
         SVQkNOF2Jq8x3c+XVWFgJtdZz4ZjVQKhLxPAAoCH0VmT9V2SRinDIoWRi8DLtDlZNqVR
         rhLipK38BClOdcrx+8QWZ48RoU+j2mWIdRO1nnKJuH+5qTBam6wNmbZX+mzCW+tuDyq8
         2cSL745HJc1qniVdfGw3P3VshXgho9/W4ajthP7AxINRxrbsQ24DKasRQpxmceR2sFHk
         ItWg==
X-Forwarded-Encrypted: i=1; AJvYcCU0oZGjxioVLhZnZ+ggyleZvkg526/Kb/OF0eg1At6Hw3QUBmt9uh0COQNSR2WeYoZhCCINswLEe4Xi@vger.kernel.org
X-Gm-Message-State: AOJu0YysgtYpzrsr7W4dyUR95mvwyZtuVy0ol7y71TNA2kjrtJsZjv18
	2k1CdDLfcUFAbUX6yNBYhBCkxZBIKvepJjdqu46AOBRRlicO/AZopk7e28PRxESyblA=
X-Gm-Gg: ASbGncuE2W/7NLAUlC2C0/2EXgx9VXvYkK8ZsrNGBKosta5ZI3ji1zUIXgeRyefqk5S
	lAEZosVGlRxPdWtcBft0DcqzeJFWuxhGsmuo+50jiKfT7bCMvwSpWcuPpBFVuvkArNsdDAClKEJ
	p2qlDYh3KHTXtRTf4XOUFXH6G+xLRkhROeqb3qWCfcK+gjr5cwKp/eSm5V/D1XVkw+DoHIwSdwW
	Pw4cR1FpUPkK2WpBtnWPkVpPtVkje09njUxZe6GH+LzgjFgJieOudnykYRIQPow2MhexgRsk9ni
	+Bg9EZUsFB8B8t4RhcodobxqJHUlq5Q/NBhbtkAm3byRMbdTj6vktTWcc5mSGkwzRZajX8UxQYr
	UnbKOIDFoT1hoaPT46BsymD/R0ZEw3QahlF2MVw4l9LIS9zjZFuKVeB0qd7E4YV1HB7XZu41R5p
	3fVgRKHDGHNCg3L2fBVYm2qA==
X-Google-Smtp-Source: AGHT+IH/eS0bO2rVpOyBa4Ba5RIcrattnMm2FYtHvflh6MkB0GWk0k3OOmlqwAxRAezHhj8eTykIgA==
X-Received: by 2002:a05:6000:184f:b0:425:86cf:43bb with SMTP id ffacd0b85a97d-4284e55735cmr2864362f8f.5.1761140069463;
        Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42855c2fb92sm2981201f8f.46.2025.10.22.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:34:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop redundant functions type
Date: Wed, 22 Oct 2025 15:34:27 +0200
Message-ID: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Referenced pinmux-node.yaml schema already defines type for "functions"
so $ref is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index ce04d2eadec9..0eff0a0ee9e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -42,7 +42,6 @@ patternProperties:
       function:
         description:
           Function to mux.
-        $ref: /schemas/types.yaml#/definitions/string
         enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
                spi0, spi1, spi2, spi3, spi4, spi5, spi6,
                uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
-- 
2.48.1


