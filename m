Return-Path: <linux-gpio+bounces-22524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830DAEFF6D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 18:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E80486C45
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 16:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0CD27E7DE;
	Tue,  1 Jul 2025 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arD/iPIW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1827BF84;
	Tue,  1 Jul 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386618; cv=none; b=udyeoFR82zE081xSSALgsh84kn9LOoyhH/PdN+DFjPLK0wacQ2/HnbilqGSn66V1kvkULXsIVaJaHJMwUYSt5r6l7Q8KjALaWJkISOgl9NlJnninFfvOj7jCEWFybMirSGfHWSDUE907OgPZn1ZwfDihNiS/Ju+HoFIuCwTkakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386618; c=relaxed/simple;
	bh=/nuqxa/ILnXCe22BXynLdnDgeySQEaO9Y992jK3M8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeLRRI8wq4rpsxD7A1SsHNguSApmq7MaLVFRfbtCJHYEoTUHr1fsQg7Q4PuVbgd0/qGGW446BSDsqQW7a9HFH8TD9qOFzVD6qgeN5w92yA5yt9nyD3EjcvlePsHSWbmqz1b/qK7M+9V0eOfra3vhR/V0YX5nIwI/BSCU6pI9iMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arD/iPIW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so600045966b.2;
        Tue, 01 Jul 2025 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751386614; x=1751991414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR6cvLWrkJQnQk+tQxKGEbYe0TZ4qvAI7uF+63w+eJs=;
        b=arD/iPIWQ0Ej11L/IhZ+mlYe62YFeEiNORBimE1Ew5IS4qho/J98Gy2uTAJmLrtZ3X
         m5TsvI/xHgcEWzqSSv4EQyaUEeLyjrgdQ1ktKRf0/qDLGo1Tr/+iv+MyuZjYp6r6xtAb
         BeNgCvaPpVa5vT+8RYCTQxDz9CWP1Z/X3k0ooQXsOfaq9BQygaQb/A0DwX2Rqh2JGzPm
         MfMKfw2phdIGCSWckOk9ce5Q3CzuqHTE07cSUXTZoaRUxQP+u9ZWPUCR26BI4z6/Vuo9
         AbG/vmXAxXZJvc4Raf9QQYXECJGjeX6NwN8lQfF8ZLz7qYyC2lLzXBMvau9PSKgOauzy
         7I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386614; x=1751991414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR6cvLWrkJQnQk+tQxKGEbYe0TZ4qvAI7uF+63w+eJs=;
        b=fLpkETBY/Nb0HNIGdg8Ot+r7IImI/uNE20NKr1GdV5yUP9sh/ZW/4DklliXrqb3MRF
         dHdrsejgvkFRITk1Ma9tow7WV0ruKjrzL192JSlmxOl1iMQa3JzImdPPbPh0/IPVld2p
         7snEmjgSHc/mKp0FteN5vNL0CdLr0LNK2tWyoa7uj38z1Q2ZTUxqb9rtO/Stbfn4hGAd
         p1OTpEdqufje1jAvPyK/iTg1NDDSMIgpka3dEBHEw43zGcJ4+4EN7Q0Pv/vmRU/OqUDk
         PZLmmpy487eq6X3PmXMK9SmwBwVCTzBkWJiiFAnsd34LLA1aQyUHIUL6+61C+fnXJGRg
         1x/g==
X-Forwarded-Encrypted: i=1; AJvYcCUDZ+63r6715MN3ZTbCAc8vC8Y+mhLryWDatKROK8bJYe0HLOilNJ4ejOnbOXSh4Rys7veUkEo3HIKV@vger.kernel.org, AJvYcCW1p3X15ogGCTH8camkFZFTaZ9jDKfAb89c4tNWlb98u7/EhJ+OKHifJxKmmxuuBuQRpY7Iv3xcK9whvx51@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RmLMfC9tJRz5IhABzEqZJ+DDaC8x4IJb8cy7JjeFYwOgjWMb
	hjV1B3CuA0/hEG3IkszPUChDGuXpqumrtL3rwcnATtjmMwLyoinIcQWDIZEvuszbgdU=
X-Gm-Gg: ASbGncsjyP+QVr6dNTQyq4f89bdWsIGP4YeiAFZmYabanjoVazneERmUzLcyxC1upFQ
	0HBhNTki8pkc1uI30A7Rqa8htXB8Utd7MdJoiaoskWyosqJP5fZs470nc7CbNOwm9/7VWe9KHSw
	/9rtTpQ4E/G1CKMgn9PbmyRi3Q81PXwAojL+FLXQUy57ZYEdZOJIi5lbnD277jpvqhw6l7bdV0h
	ZEMzd9fVuvF2ItytiFL0IVFjdEnHz9EVnApycc2vpvQLN8zDG6nHS+LhfQecFe5jIW1sr9BdEmx
	vL5qVMGCECtgQwpn9zgY0Fi/C3pAWiF7R/BH8Old4x+zjOJbH++LVkKzS0vYeMxa3ipJVxka8om
	NR192owBfEwB9BOyJdw==
X-Google-Smtp-Source: AGHT+IFwdy27ICM9vDT6R7Z5Aks4K9vOBF5PkY+VZtbuuCb0lfqWwX5dfyl3v+7suQ7kjs1TGxj+Jw==
X-Received: by 2002:a17:907:97c7:b0:ae0:c8f9:4529 with SMTP id a640c23a62f3a-ae350103238mr1624599566b.49.1751386614020;
        Tue, 01 Jul 2025 09:16:54 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1cc9sm885869366b.168.2025.07.01.09.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:16:53 -0700 (PDT)
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
	Maria Garcia <mgarcia@qblox.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Date: Tue,  1 Jul 2025 18:16:28 +0200
Message-ID: <20250701161629.9782-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701161629.9782-1-mariagarcia7293@gmail.com>
References: <20250701161629.9782-1-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TCA6418E is a 18-channel I2C I/O expander with integrated ESD
protection.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4d3f52f8d1b8..12134c737ad8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -68,6 +68,7 @@ properties:
               - ti,pca9536
               - ti,tca6408
               - ti,tca6416
+              - ti,tca6418
               - ti,tca6424
               - ti,tca9535
               - ti,tca9538
-- 
2.43.0


