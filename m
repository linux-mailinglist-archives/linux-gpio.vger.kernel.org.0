Return-Path: <linux-gpio+bounces-10420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8A9853C0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6FA2863B2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8901591F0;
	Wed, 25 Sep 2024 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwX7pw1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F0158DCA;
	Wed, 25 Sep 2024 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248838; cv=none; b=ALEpEMSU5s5Xv+hkEmTx85z45dV9U81+RTr0c9h7hiKkqWHJm0A7ZKq0kDnelGXyErbSxJjhzVi8Rwnl5cwFaW94atZajKtFq2y6fn5Na5wmKHyaguOOHtTiPGn4plwuh7SXSSDY/g+9Fh/AtkkD6XJnS+bCscOUVfnbh6PjBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248838; c=relaxed/simple;
	bh=lQtFITJOuPvxbaWstT1RN3wF1VX1/vCX/p5vjoOyqxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdZWwZjo8Uw6OaghXbs9pPga2xbhBAZNrlC/i5akbQxVdloqGOxa4pqUOK4M4Voz2Rn7xw8hc2dDT/g6Ac3eYXTsXqzQuM6gIogvYwxgfa7l09EtgKSUgOtI2W8o0Vks3y44cpcwyrbuPVhWgmYuDNC/wao0CjaPid6WQJuZpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwX7pw1o; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db233cef22so5088593a12.0;
        Wed, 25 Sep 2024 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248836; x=1727853636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9X76GEZCSbbQMLh1zTwBYREf8Y/orIPTUNjYgvpcww=;
        b=YwX7pw1oc3HmXqz0C1LzPSZQWCJCpPvJExCe9OSTUa4kzLneA4EqKkkWk8+UItF7n0
         QhBB2Ee1n3nzSL8s+a5DaELQ2nnRYJ4mH75qzXI6lAoSgu+eKe+5HHb/hh5ATM23AbjL
         FcTsmLxZl4f8b6UXZzT/TYoKr0eOs+KCHeHYBhfBS5Z/botJorJnK6VxcporNht5aldH
         t2Sec2Fd+6vWTAeiEx28shAWgd8pN95mHct7UUWDenehpU+FltjvVaaaMWXI7Dj9qtj5
         HZVwc39psF0ZzZdD5ykhs6t4qk0i3SHJ1cthGRWmAotYiDm9qD++hnUmSu43K1uryyH1
         ypnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248836; x=1727853636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9X76GEZCSbbQMLh1zTwBYREf8Y/orIPTUNjYgvpcww=;
        b=sqhIQnHoB/YCru1J9RTrzOa+3Fg2NC+yIVxuH/vmLV2H18fKv4QZOOO57R/uqQKC1O
         85XJX+xNWpkmnAu//BflfTp19Hy2d3Ul793fQawTPMxSIuiTvw8F9WIWU2jHoihaLI1w
         vSLxcl/VQ4WVLrBksDAxDWdCOBr9TQCkGwzSYW5jTZCOvLJAxAVI9Mj5Y/CJcER1G2t6
         k2PQTvcWXh4PiyDulgBALZ8PjlkFJ6OCH7035OO4pK5j4e8zPt4s6phlNS+Pi3UKbUOM
         tYSlLuoqO5sAaezx3yXeUJbJOaWBmqamveo/NeZs5XCQeVoJmQhqM/UV7rKnHMnuU4wa
         0VEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02VIASqQ8ZYYT95PGENP2AR8J1qLGaj4rfCXAHNqYFU6MGX+tbCdHnA7XUrmfI132oqyP9XaXEVi8@vger.kernel.org, AJvYcCW6USaOP9CZDXo1uKGYHgPJ4KXCG248gtr4wE7pk72qtHHW1aAyfXi2KI1Wi9RmNd4t4TNrk1/bljznEij0@vger.kernel.org, AJvYcCX5LPa+EQ5rnOdeerPKKN/+AYCk8oAqU/5utltW+afFOPFbnbt3OgFLeuJzeruy/4EUxrXLzGrSTkivLjmXTkk=@vger.kernel.org, AJvYcCXObw9CTT3f75FvGcFb5o8oMRYY8wURgQaJgQxKke8AL31TxXzjh1Y2d3nrKMmUQtCOP3UomUFDu3astg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziN71o57jOo2fRhqLrEL25y5akDSNr1tUiEk2NxJhpj5Io0JlG
	wW2p51lifPHK9thGUTB7hmjMG4ikldsAqGbXULVD/tBYXNUT4jw1
X-Google-Smtp-Source: AGHT+IH4ZTOu3iwcMbsOiy8lnH932jmvb7oQHZvCphTqnx77rhJ9L/p07Unj+TBA82B6gWJ7zTsNRQ==
X-Received: by 2002:a05:6a20:d049:b0:1d2:e889:1513 with SMTP id adf61e73a8af0-1d4d4aaee41mr2386218637.17.1727248836160;
        Wed, 25 Sep 2024 00:20:36 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:35 -0700 (PDT)
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
Subject: [PATCH v5 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Wed, 25 Sep 2024 15:18:00 +0800
Message-ID: <20240925071939.6107-3-towinchenmi@gmail.com>
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

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.0


