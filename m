Return-Path: <linux-gpio+bounces-26103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF488B56804
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D22A3AF619
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EF7262FD8;
	Sun, 14 Sep 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMmpQjw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE0257820
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850307; cv=none; b=FhDtQJ0F5jCPfP7TdWKf7qkGwZVq7zg1nxDS5JO7ys3vdep5ZZH11167Vc+8MESZDPQPZCqPwIPEiW/Tr+M66kbEpmow7hEO4YNl4aKCGlFpt/rEdrxtr9+6DKWfDodtp/t+auHSeTHsHDvFOHBSaklbIoEIA8zXQ6UgzeV2dOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850307; c=relaxed/simple;
	bh=nnxWlv+OJi30txzuvQA8yOIXIEYLUlnbIbZsAeav1ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XafE64M9zGCAeY7zdRqJJ9v9pvHD3x+IYetY8+EpanqIJ71Uhb+uK+BHSBrqnTMg4sxuv44LoVhCKmj9w+b9IAdZCDkm5tLxUihQ7eCvLb+vRPc2wwog3zGH1DZbiIojUjUg5xDFUL+6Y1sRz0aZ2EE81Tt9ulVwpemxYq3AgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMmpQjw5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3dce6eed889so2946742f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850303; x=1758455103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=DMmpQjw5WkJ/wPCKXgTmLTpmIyFSS2UnR/CPcQ7BqP9O7YSaT7fwfsAhWnKp6vVurF
         5xYg5QD7ObwVcrMVXzr+Jost8bI5drLBnISACaYGXvMyISOwJ5DXfO6zdolmbLhHsj4x
         2nz68HO3UNunq3ZSsiGFbhzxQ9jDNRlg/jsshfhsfute9UQhGuFa3HzJQh5Hgk240Cg+
         q1/Mtai3iXDc8UGgWpQq9BdxIYZ7bv8u1wcSVu0DCSIRM8CdImErvcrZC//GmdVhMZ60
         l8McpjVNp6/ymyn5AXmfVYONdMGezd8pDXNJx4JNYkEEb14BAujlg4NHKNgPJ3N719x3
         crzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850303; x=1758455103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1jxxIyK9Ih5zhWAbEfQ/SUSMwO68aineNys1TdCPOI=;
        b=OeV1RhUjG6aiW5VZLPAtsRI0nHRn5Xx5HHvTnCKnrze9jt+iWU5AZfprBb7DGs6MTN
         lTpwan4F3h2oU0VprQfvm7JUxMIVsFR5joqy5ZOmfmUiplMCcSUHKGJY0K4IxSMd7UDq
         s1IzxlbIDKsZ0dd1dyl0CaIAYgUD8Gpq38Pb7FDKj+gUAINaH+Kp4LTi17YsFNBIY/90
         ICWoNjMTctpTDqFO8fU5bSiPtORSl5/dsrcRv5GiS33qq/hwN3IVm+MuJF/EthbhfCRn
         D1zB0jvxmVpEC/FJ+zseciH5j/Cl2hDWcwFwYrJ9lIRy7prkSoCENIauY+D0hyBcQNla
         l1tA==
X-Forwarded-Encrypted: i=1; AJvYcCV29U7kQDoO6YwEgtcIvEfDOTABc+rGiykLpGB83MWKMBOyX+erGYhF6EZmSU2JrALV1g+RAQtiGSkp@vger.kernel.org
X-Gm-Message-State: AOJu0YyvR6Is5qgAl/OJ/D2LkpiStxOFo2V5Ei/F3Fni6lEoHyKJnkSP
	BWU108PRi62J6/f2SR836c3XFuZE6GKtcm9oJbyzKfs4WEClmMgAO5m+
X-Gm-Gg: ASbGnctzhzCFdy36hJSUGIXbhDaXq/9apxah39+115HEN2sGywd6P/Iv9Rxa2M/sEcX
	R+2Ry7GEoIl/tgAZtiRb+Ty4ZBdcVcTjpxGbHeWGJu2Go3uz9iOKVHhclz2Fo/s+yEifLxvqAXK
	MLJVPlfchVBxWsVcUdknOMIN/iOAJA9ODCMW+K9PMmC3p4b4HpYJyQ4H8Pvo7BcVwKUvFoFPeAV
	RC5NXbWiOWr/OtAt10Mp8bepasEDd696qFVvh6cfnTHFspWblEiOWk3g+HFxEPyez3AmHBns+gh
	pVZZLuSFPUGQWCkZyxJYt53lKBWFY2WYCGN+pguxCJkBt8z4qy7/mFEYqs4ULbYNHg0xc6xA+iP
	jrM385+9HENESso8/7f2/YQmWSeOTs9ZZorsTMo6MEu5TSM5yI+obYz+At5w5z6W+NkPn55mSKQ
	1W7kcXo/SG
X-Google-Smtp-Source: AGHT+IE1BqJhX9iGCNG9Rwq5f7XlNdOwfaGHziUaIwwwVkNizVz8cQGq1fatGEsUFHWt7rHYFPM5cw==
X-Received: by 2002:a05:6000:2281:b0:3e7:1f63:6e7d with SMTP id ffacd0b85a97d-3e7659ee4e1mr10069982f8f.45.1757850302860;
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
Date: Sun, 14 Sep 2025 14:44:55 +0300
Message-ID: <20250914114457.2610013-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the pinctrl compatible for the exynos8890 SoC. Let the
driver handle our clocks for pinctrl as well.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856..ffd3e2dd2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
@@ -136,7 +137,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: google,gs101-pinctrl
+            enum:
+              - google,gs101-pinctrl
+              - samsung,exynos8890-pinctrl
     then:
       required:
         - clocks
-- 
2.43.0


