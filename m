Return-Path: <linux-gpio+bounces-12069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA09B0123
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529DC1C219DE
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE95202622;
	Fri, 25 Oct 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZpeO9cW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4892003A6;
	Fri, 25 Oct 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855514; cv=none; b=hA8KwVSSBXtMQ3JUXFb0D7qV1wnAXee4Yf1mKWsdUKNGCEUU0H+uAuUCV7E8c2GLbYfnnQV1IkhIggWaWvex7rO67gwSsQ2t+NopX/aEwGRhc9NWuRMEwtj9nQ37Zpml/p2lOl38AL+ZoP6Fz9+oP5pf86tY/wcezfMEXfEB5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855514; c=relaxed/simple;
	bh=5q28gk3qAfUZIRDnybYg994BnJdNE3X1MHgLAQpU+/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YR+9AOCWTg3BmSP5KMITVaNragV1hffOKPjh4l7ELtJM/WnQU7BSTnQGgXJNGIqC9MVpv2HNOtdluE5eq3dIKCqAX5gwcZ+j3usWBXSN56ArqlW7QLekjNqVMB+gydwOCzmxB0Za+Y3G+pCir0rKX9DsjNvFxjhlqZvEQkqcEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZpeO9cW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f1292a9bso2462856e87.2;
        Fri, 25 Oct 2024 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855510; x=1730460310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n31FK91HeIKxLr9ZjvHM0e9Nu8fhYX7UDQp+Ji5Y1y8=;
        b=cZpeO9cWw+yEYMYCU4iyCDti9QIEzFjzeoxa9tj/DFDA6HKb9rskgruRGQZWXmj4NM
         bbb8ssfJewx0au+vM1ri0SAHnGTMS7bhgiem+iUm5hWCpDv/KdZ48cTzz3yVt9VNaXIn
         z/kEOLd796ryxu5BwjDlLDw3IQwKAaKTkQ9vEb+Zlr1zA1a6UCtvkn6dPlTaXzDJkIAE
         0bFUKW+Wn1sKCdA9VavC6C28Q2ZUzLgfoUmaJdWSscB6zIlUSEEjVB46BSQGHHKQfa7Y
         Rv3SEHWtVjGiSBWrXghc7bCAoFo1V+aDryWGNsV+YNvOYy7lNEKaBT9W9VlyN7evQ5MI
         z6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855510; x=1730460310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n31FK91HeIKxLr9ZjvHM0e9Nu8fhYX7UDQp+Ji5Y1y8=;
        b=OZa0nvF4G99sHphMEMkBp+y+BU0xErIGSFmaCHywEb4w4biGIrPxMEVTFtUd0mhk3q
         IAiMIZwyxb6T/tLOlMvWDCaaXgFkqC3TUOID/kZJRYYOqS3MKmhSyLtoDHWyHVVstYr3
         aFqJJfxv/RKSPYgYwkan8bIH/HHinMxZpES5JWjvqMjoeZMS0ws01VGVczGM2rUhj79X
         YP5EjsCmUzBrX/cw3jCS4oK/53JP7etj/xDoQUe77vjcqi2xUalACYxCKIum1NvnxmWJ
         +FCPO64/t4yEdFNlThsdbx5mavg4z2zy+s/fDgsZH2HIjpDWgqE67fygiHYRSlbLWJNp
         vXFg==
X-Forwarded-Encrypted: i=1; AJvYcCVtgNPBSWFLGkqNGvNBoRhUJ0SqEli2oenvsUnN0r0kdbtF7UWmI/fJ/6/7ACHXBjeoU835YdkfDN5o@vger.kernel.org, AJvYcCW7Qu4g3MnXQFHO3+iVmxciIfAPTUgTxlP0IZEjYH08dmr8F8Cf1cKx9+am34rK0tEapVwKaG8333iIVXMN@vger.kernel.org, AJvYcCX8DfnZqqoBGp0cqLOITQM5qzwexkziUMXNb6f6A2XH7wyf+IUvg5KVm6vjyrboARDQJDewlOihjwv9o3pruhBEoV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4Tz6mDgdVEDGZbJThd1oebjaCuF0YDozhZuSlB8YUMYD4ql3
	JEMh7spkPXWOEWuKn606yD47f0b/nKwBKnPz1RK/L0CuNPJ7v6KnnBUo2Q==
X-Google-Smtp-Source: AGHT+IGB+97DmUjhobKZtZFZKzO3erQP6XakxXAE4z2q3ZIafndHZtXyuxWp4pz/XPYWWQEkKJdH9w==
X-Received: by 2002:a05:6512:33cd:b0:539:fd1b:baf5 with SMTP id 2adb3069b0e04-53b23df678emr3299322e87.16.1729855510200;
        Fri, 25 Oct 2024 04:25:10 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:09 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:48 +0300
Subject: [PATCH v2 01/12] dt-bindings: arm: cpus: Add Samsung Mongoose M3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-1-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=860;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=5q28gk3qAfUZIRDnybYg994BnJdNE3X1MHgLAQpU+/A=;
 b=Mr4netPYKpH6mR1BDJd56vc/yQdBg713KYkd0ZBApqwxS/yGyh2wVv0xoF9ubCKtmjhdFkhR5
 sHyDJeN19I9DLa713fffVjFx9WQFyZloOuwhaKHfjI1alVY3GKX9tjg
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Mongoose M3 CPU core to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


