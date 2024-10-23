Return-Path: <linux-gpio+bounces-11799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFF9ABD13
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E95285061
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC90D13CFB6;
	Wed, 23 Oct 2024 04:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyTyfV28"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3813CABC;
	Wed, 23 Oct 2024 04:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658696; cv=none; b=dJL7crKz08yttU/LpTyXCftMPsAL4lFsraSAQzTNxk/3tYKRxe/757M6jPYb3GtOBFhcMbo6xAnBGLKyNhNycM0XGlWj+oEKSBWVECEWu4i3neBCdAjOAptbdDQRq5t8YNKuqXZyMJSEwaHld3ho57QDz0eMBB86j9Crh2vmnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658696; c=relaxed/simple;
	bh=oEG6p+vWkAWs7zrYdXJAcLsli3rmOydvcpIRQN95zb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7fCxixgnpq1T/S0fE1BY2GpgUTqERQyGg3XtgM/EVkHv4pSlGtujCmUB62WrIvHaicwWrYts1n43MLEVIpO/oLYgU2l0Cwd/UTxrWpN/cPR8K8WRU2o5pYg0j3gRxyQGfeCh8tNUQ2W1bfGdchhW26mg2Ngat0hgw/SI1ZaQyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyTyfV28; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ca1b6a80aso61121865ad.2;
        Tue, 22 Oct 2024 21:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658694; x=1730263494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAdYfBN+Mf10zH0eoCFYz9vxHGOsv0094bye20ACE5Q=;
        b=fyTyfV28kN6WMQtbuNRJicL0GDYGrbIcMXXPUr/B9+FyIDNiNWH7vUirAoXNf7np76
         sITvl6/7A9i1bSvn3a38/LsFlkCkXGNNPSN4tfDSEZPNcx7oyE4Tk89Ru8wKSCDl8c6h
         YWXutLNnGJQ3MHFiSsyq5ZnAvGvs4KoFPIkPgUfOLUsXlKAOvFau+q1trsZSSTI+GBFt
         GL32lkiCyHPmd5tXSHBCKoxk1OtIyIsLipbLuBuQP0iMayljLpmLxOL4wtu0WLjxXSet
         1GR4bwdYBXpSXE+D+q7xXeTlcV794S9auJw9p0xU/hqa/DEkNU3M09cQG6B4XnlKttQ0
         mMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658694; x=1730263494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAdYfBN+Mf10zH0eoCFYz9vxHGOsv0094bye20ACE5Q=;
        b=Vxsmqe6mM45cZyKWh+C42AT97BJvNWdGn7FjdZyf/0MnZ0a2kGXKAvIfrSE7Fo7DGN
         /XBwjvwycIaEYzSh2HpSzIo5o7xgiwR9fR28P8VlVitJ2n1d1+Z+yhqbpx3d5ygMlI8b
         s/emvAAttQFy5fQVOKd/TFGke+d6BDacSYeafxkSAmCjV6OdobQXsToL2CBQAnDb2OXN
         ayFKIVaf8F3x8Nu2ebrb7OjG2cqclKsP82PlyqN0eqI47dxw7pCqpa1qZU/zKluLkrHx
         9j2mpSJcyGCcYhfkew5+MXNwaXBIiju6jTEKkDq+45MzxPckJLkiLmiB5p204nT1tq5q
         ohUA==
X-Forwarded-Encrypted: i=1; AJvYcCUbBPEmVt7Fd+0ebiATlR/Q3jUu0IiDJHERizlwIpRGCD2uEAyqGy/0hvFvZ9n6x1w1QSBD4K2ByjpiHwv7hts=@vger.kernel.org, AJvYcCUoIhO9o0wn7m9cpAkqQfa30yOakE2a8TdRCpKV77GWXs5Hczpjj+mDc2rv4oNUdYsUpKe/c4+dikx4i5Uy@vger.kernel.org, AJvYcCVNwTOiGpdc6ySv3ozAczz2r7Gt7FbisRUZTO3Z1pIgXqmFAWW744o1khe75PYJVpKkrxVlf+a4d9w4Og==@vger.kernel.org, AJvYcCX7KCsBcn+kOJMx3UINDyNOX7vpE44ruzfcIdfl5FAcjojmZ0Yq9TMzTMvMRbSHMy+vq6yIU8iw782I@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUBZ5zin+ixZn1aWs/52MMjHgxi1U9xDf9am/Phi0G84fPQID
	J3RI58sfQqiUYEeTDgZ6ePxSb7SIoFQqCHsmt0Y8+49y+wNPkwff
X-Google-Smtp-Source: AGHT+IFR5NkdGICd7s9c2//F6zkeu11cFy3HP0c2fdOAiP6AGF9wRnepLtOrmAX5Q8qGU1rxNE+5JQ==
X-Received: by 2002:a17:902:d4c3:b0:20b:8bd0:7387 with SMTP id d9443c01a7336-20fab307224mr19637715ad.52.1729658694457;
        Tue, 22 Oct 2024 21:44:54 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:54 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Wed, 23 Oct 2024 12:40:37 +0800
Message-ID: <20241023044423.18294-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
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
2.47.0


