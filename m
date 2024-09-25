Return-Path: <linux-gpio+bounces-10421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF29853C3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7607E1C234F8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F69F1581F0;
	Wed, 25 Sep 2024 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPsZiVbN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FD157E61;
	Wed, 25 Sep 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248844; cv=none; b=GqW40jnUhbIirKF5ao1Id/RYP7CePVdqiTEu23FUCdk/yaUrw5grO+iAhnusNj36knxAeqyysm8BQbOfPsw6lTUvMQm/tS9WZ6IddWgS0sPtpQfpo71lRH1pGEyD8KkXVbctXpp78aIQ7dsCngkGfJh7PsalMKe5wHibB2R3r6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248844; c=relaxed/simple;
	bh=TUET25mong/+XAx+SBHI2uP1U0asBB6//jzC1DiO2dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rglLUwedhpsY2mQtmjVL0KfjoqvqtMXDqvfIEYiOFekchAfU9dX/EMYw0jwvlP0cEZsab+g1oySKn8oeTA1hxS6iI1sUvqxSO8mwqkM6KiZUWVjsQCA7YQNbVjQSEfql3fkTIHGi5ccLF/Y+3f1EtkDOKhZBo4qROe0qC+TAdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPsZiVbN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71957eb256bso5558049b3a.3;
        Wed, 25 Sep 2024 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248842; x=1727853642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HVIJX3pW2E00fbuHP3pdXD9AoULDjYazv0lzUVjHz0=;
        b=aPsZiVbNSjXTWHU7wuBdBr0WW5tEBTDuICMfFbaerM7LJxqlJIYklHtEbOP9MODSr/
         NnOkGJKt2JEvZUY6IW6zXujp7uIkBoXKbfv4QPokl/BW5ggVcgciKEHgk8p17+cRu+g4
         DXam9YKDDSteWUJ0yPi8+ZTVjmiKA/zpFkoBgKIV3rmuvBFfdmfbE6I5UUSuJywhLOx/
         DS1x2PyNj8AZKLfskrg6vTz/lhGvajij2UIkrM7W26MoHYMk7tdLCoKnUl2lrj818gou
         bHUZiWvoSxyhBJu/OKTjkLOjQr6kz/tdEFGsvlOdTSXD2Gfj2kKzXwlgVOXf14+EthEh
         j6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248842; x=1727853642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HVIJX3pW2E00fbuHP3pdXD9AoULDjYazv0lzUVjHz0=;
        b=ND1nxfdGow0nOqgUuV8ZM4GJjr5UDLvUUTpeltryCvTkJiq3Q7rpyPxr1Sp9Vdrqbx
         PGNaWoTwyGlhbAoqOM4Ka/jVvzeZ9qPjAcyIPw533qe0CzTx6dtH5p3EZ7TmfD0dPC9V
         dwOzEf3Fbnj/xHT+4uAYVhqKmatnCbnm4Aa2NXdwQgteTA2C2BTCOx1djO0sF/b7UJXH
         jfb0OOSBtvTEbfEU9h85S7I1YyKLJPcz5TKm32I6Rg3/lZU6RnDMYowVwz+b9YLTHN18
         2QNyxLjKH6VB1x5rtfaAdqBI0v2fuoHpf7O0RN+uYbUlrrnOA8k8fxn3t3RypYoNCCYU
         OaxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV7mPVHYIwCYIef96iFVJNYjcivBLlPNFHlQzPuV6/zI0HIbdk6X8Nc7Ljnw9fdgaKVMNNH9UakqG4tZ3B++0=@vger.kernel.org, AJvYcCV44oEPIoDoye/L3B7ZSuryUch7saIWNXwSOq1w6flvzrAKgAPlW7Bnoz+HbmIWnp9GWaW20nZmsjsdjzgi@vger.kernel.org, AJvYcCWRhtwhAngvMgQKvDDVzJd6QgEpwkaztOnFowxe1llpP43M6GOB0exQ6TwDStDe969/6+kiAmqPz/b/eg==@vger.kernel.org, AJvYcCXmBNxipix4Rnxv1rXj0ykPjRlWuCs+G4bfoiyT7+J3YVLesaCGshiebc6lpB5TzWvqbAqNEhBSfsFu@vger.kernel.org
X-Gm-Message-State: AOJu0YwHU37UeP/wOm+Z8k7Q5iJbaRiGwN1HAxSFuHpkzjuoMGtXWbsd
	TF3zc6l7RufxgZq2sqmUeVLge/SloS9+S/9hKqki2OzGdTi6V4Go
X-Google-Smtp-Source: AGHT+IEZWtc+tDHEffwL3HGWNtEm0itHoQwT8jLsVdZQ8UR0xy2F0qH64eUPjjjoQkAQI1j8kG+RBA==
X-Received: by 2002:a05:6a20:ce4d:b0:1cf:21c7:2aff with SMTP id adf61e73a8af0-1d4d4ac5c81mr2888800637.23.1727248842256;
        Wed, 25 Sep 2024 00:20:42 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Wed, 25 Sep 2024 15:18:01 +0800
Message-ID: <20240925071939.6107-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.46.0


