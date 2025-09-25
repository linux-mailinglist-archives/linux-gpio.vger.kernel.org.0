Return-Path: <linux-gpio+bounces-26585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7BBA0427
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89102A24C3
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33ED2FD7AE;
	Thu, 25 Sep 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS/rXfIy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E02F0C69
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813443; cv=none; b=tGVsn6fraYFRfROsrPP/NEg6NLvF1Y/FlwjFyvjroNl+YIu9vqsh6veGAzV31rF9i7B1SykpHP7zHhD9sLrKaUiyUmrv0L+1pRGoL6GvooWxZwcWQapL1f+Q2CHE7pH9u9bBj66oxWa4/60a/F2pcc6lvEfVYh5GMUNblJT9CQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813443; c=relaxed/simple;
	bh=pmC8gc0UmEUr7LvPdnrQX6KOLyuZeAx82zdJKSWgn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkLgSaePLXRfXdcQntm7pxjU6tfeTNRCZMj6jr6Z34h/9wMgjHZw50jo5gn0NP1Ko1FWtHS9gSx5NP66bZPXhGQKmJF3qQOgwystzNY5XlTaWQRiQT3Ro6bHL5sRfp1Wbt8DnJRqNCQ7Y7wNoRibu17XrpUBFuhP2i9OmT2W31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cS/rXfIy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57933d3e498so1186157e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813439; x=1759418239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
        b=cS/rXfIy2T5rHsjmPCMZkk0jdTw35peiUQZE0s9kQbMO0TJ+bXNxHcMv16KxGvEWzt
         jTE2lV43shmQuVfkpwIROC08oCctaF+YDFlCDgbLVXXk4Wk3qnxFwkxk+8rW5KWmkud5
         64RZpv31eL7CEm0K7XBio+xzKnvHDkY2MC1JdYhGP1HWObUuGva5N03fzBVXJDaxtpUJ
         IjXXhyIt87OmGQ/Soxwyb+fSmIZURRHckOTuZ5TukC4h+OvBggf2t/rRZNSI06tpvf1K
         vv4zW2i8sGoRjDpTtTfTyHV0Z2vInMxwk2DbdXm7R9zjeJgGk5WnXqp9zG8AiYyF10Jm
         ZzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813439; x=1759418239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
        b=DgHnze0Bbqnk8fO5jtVbtsmQLCQk+RhRg8ulW2wYheSAIXIT0ePzMQEaLMWLBNE/zS
         BQQLS1y+wFhMHX4t27GCh7lZRl7+2KrikgCyfG8S4nHp0kngeA+EaRK4VuEfCoMVbc5O
         kLKuFzDrLFu+ZVH4baKX6YMqVnnyTEVKtquCF1ajhdFlz0fnOsIE8BFuYLzEiSWxB5Un
         WPTrRKwmR7Nx3VeGRF4ce/d9QP3Er44cY56AsgU48XSzWo7cwLaG/DS7607WRBkK9waL
         teeqJfpDBWDiLwX3/eXNAfuP6mbfgosQYLt4ifNglOUqRmMY+lVtEoMnsrzT0K+ZpzyO
         DHPg==
X-Forwarded-Encrypted: i=1; AJvYcCU2n6al4RlM9rUIYUXA0EHpU6XeIhiyjfqDHqob3UoT3zHzBEPpV+sP4dHj5t5gYLawbNkZ2RNKAULA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1d+MoZuPy3CFAYUwQH5rflAlrUY5+FEEgR5aagMrSci/3+Ed
	tJXxNHflqou6TUORfy+7zGTwac6HujeuJiGizmZ+un6HWCZaighCh/pI
X-Gm-Gg: ASbGncsvQ/7LKrCEdSriKqP6SAau7wxGtRF0XuTbldayb3TYIZ5Jo/qbOANpGkSvNSW
	WGki5+SyrUyfb9nRU+c3eZfLxdv4OcvbDWly+b2dzwWAsmxjBlSXuUanDHHVncMy0YVcKgE+L9F
	wXrX8Y/XBLsk3/yhwKLXbwbw8o6zxbLaSAOuA50jw/cu9X6WcT5lquLXBeUqwZW0Fg8yM/1g2W0
	BhrFyk/bIWOrQd7vBpTlr5qO/+IdGtQESsuycAR7FgpImSfgD9KcMT8Nrn+OR5zbRG5VONA+J9m
	W46B9bfxMsOmM3sHZ3CwYUe6Wj0duJBN7vlWxLzHj0rH7/dH9kRf0Zeyn5frAQ5a3+Y2Lf1cMtx
	XxzBsf/cNCqHOwQ==
X-Google-Smtp-Source: AGHT+IGqaK5Z05hEk75mGW8qDiu630uMdDhjqt6kFcIL4trP2Pfk6uAyKaszBGaqiiXlJzv0dGCm8w==
X-Received: by 2002:a05:6512:104a:b0:57b:8675:e35b with SMTP id 2adb3069b0e04-582d073f694mr1192520e87.5.1758813438490;
        Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 04/22] dt-bindings: display: tegra: document Tegra30 VI and VIP
Date: Thu, 25 Sep 2025 18:16:30 +0300
Message-ID: <20250925151648.79510-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


