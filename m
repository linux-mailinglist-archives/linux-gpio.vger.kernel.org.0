Return-Path: <linux-gpio+bounces-22763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE0AF825A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FD31170578
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231832BE64D;
	Thu,  3 Jul 2025 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmSGe9EH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493D2BE63B;
	Thu,  3 Jul 2025 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576289; cv=none; b=FVuoi60k+0XUC4wE1kLo0nrRMX/oBU16DH9mYzF87AXB70S7E0T0sx5+rhrHaoDEBnjpLlcqZUdarM42ii9qIY2JVc1pzddHNsJb+AC5s9O/HS9AAJH+oKsa6FcRGJDG40bjrNinODS7ACce+p02+wxaR7AU4wLvVpOcisOVQH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576289; c=relaxed/simple;
	bh=/nuqxa/ILnXCe22BXynLdnDgeySQEaO9Y992jK3M8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZIm26FTO9kWrCOTpVkHmcKZMrAETd8gw0DJ+4ubQgGmiQ097fhiJPE/F935Dd2xDP6WQ91OG0zD1p9HehfWFNECAjOqGClcu8zsVhvwWTPK9n7ARGlQjmN5OZ49Uopm1RhBmS2jXdbM7upWxMxzrMX9WAJtAZXoH/jp4As+OwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmSGe9EH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so2326078a12.0;
        Thu, 03 Jul 2025 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751576286; x=1752181086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR6cvLWrkJQnQk+tQxKGEbYe0TZ4qvAI7uF+63w+eJs=;
        b=fmSGe9EH/kJw6F5wJJS5DeLBZ9LM0fKr5AudOLR/jDhf3Mwmr0FPMNQz08Rdkv5au0
         LKAB6kqf7SmRbyn4glVN4d5vmF4ytbJfspWvaYghIzIwHH59YS5Yuss819FLiuIlLX0R
         Oy429EIqYC6QjnJkk+sIvd4rEBRKbZNjCKo7slxLwq9tn22q81ka/ZUpp6db8IZMfy6i
         uz6gNuW9MKTAtCV466J3Q6zM5ThdtU0AYrZDv9qdMb12TKnU7+N5nb5SInlNwTPYrcqz
         YloIPXVwwnLKsQk+nR7IIn4NgNrCAzuqouw9h2uwRKKHwsfFDfz6WHkzffY5c+9CzXGH
         +7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576286; x=1752181086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR6cvLWrkJQnQk+tQxKGEbYe0TZ4qvAI7uF+63w+eJs=;
        b=ICOlv51r6KCRu2qKKhbk2jz7fkJ0q/00I16gpfYOQ2spUPAJe6y+3Iyq0IWqOyCtWt
         WwgoePY0jfr/r6DAvASRdKdC11VCHjvCd2pebFgREYUkP2SEMVomzhhAXX2t0jcnvLAU
         Uwgv/xdVjWdHTvxPWGnRGF2TDFcoL3qt8EtL93iDoCIw1MQzC2SasIBJENId3Z5A2ia5
         ZJVvhgYcJHcDz72VZnOTOypJzHdp/KFXEvliKyCqH8ckpaBwR6V67GX4bM4x8Vo4iLr/
         0JHNgLkylr1AtZvihoDbc24v3Vowwoq6WsPV7cwb/onFgmHvj4eu7/Vjs8yhXgtvxC/o
         2Exg==
X-Forwarded-Encrypted: i=1; AJvYcCUq4iKSRpsK8Dl+E1HnQQBPUZerh7TadbuGot03VPQXQz7LMCtfxQKty19TrY6E2RhrT0CakrZte7jMaHPV@vger.kernel.org, AJvYcCWmuE5QV7u9X5qH6i7DYBEksqdTHNM6sQG9bCoPDrCpob6ujIDMg+T5LsN3le8CL7Qy9d15/6U4VV/+@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfp6L2uGskdJbldQ6RQrORVoErYvSw1bKjdx5koCXi3SLK1gG
	21GpKDZClJd2ROw2Y8O9jUaofHpW7iMnc4v4R85OQsQAxfb+ybfA4SZNpA9a9RiRruU=
X-Gm-Gg: ASbGncso0awZDDz/PdvScSoXkTjo3P7WvQqWR/77A9Sa/hIx4aBjLnuV3BHXjaELbzd
	hMIm6Zfpy5bcg4kHAZDAv3nHCa+MlKOgEZ6Y+0vx60Z1LnKw2vzOxOzgg7sKOqqTMW6WWRZuDnw
	Q3BTPQUXvSd9aAWB9nKvgcNG4gVl5EiUV0+DqdB0613ZW/YCigDEADSo/l/9VYkBNczJKKah/dG
	QVvN4TVZcFNKbNjpYYD0ULNsdIPDh7y8PEw7tkO6TrYS4Y04pn/hh26rtNU9aU/G1zFr+CeHlUk
	wzDhBnuPpwpXbWTtK+SFZ7KUrJ06nB08pNEnKkvTYHl+J3+d/Cm/khmND9RtaPfS7YWbfOb5IiD
	+0xyvPN69XsDQIeFHf1xLuls2ptHa
X-Google-Smtp-Source: AGHT+IEl6VZoJLD7n2Y7R1MQ2jPxtbh9Uw6Vzg4iLjrmCZBv1J4pJf0zKMtjIgjvQrDXbSUdPeshyg==
X-Received: by 2002:a17:906:3144:b0:ae0:ace9:67eb with SMTP id a640c23a62f3a-ae3f82d6384mr48970566b.14.1751576285353;
        Thu, 03 Jul 2025 13:58:05 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm38750366b.107.2025.07.03.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 13:58:04 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Date: Thu,  3 Jul 2025 22:57:39 +0200
Message-ID: <20250703205740.45385-2-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703205740.45385-1-mariagarcia7293@gmail.com>
References: <20250703205740.45385-1-mariagarcia7293@gmail.com>
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


