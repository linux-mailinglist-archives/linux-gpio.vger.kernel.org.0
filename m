Return-Path: <linux-gpio+bounces-18007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4AA718CC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5897C177A05
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09ED1F416D;
	Wed, 26 Mar 2025 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEUA68lK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38AD1F1913;
	Wed, 26 Mar 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000002; cv=none; b=mAOO0ej5OaE3Q+YrUSRxRTsdCB3iaLtJPRZ+8+88ViJsD6l73Qasrhyas79OdLuPN0jSr4w6jENLibzflnsQR0NKxO7GaU0SQ35+B+NmAan4KdydXqHvr/G4MS+AatJFyCVk3eIGAqn6jZ/WWNWbGai7f2K1evbrQmMbVY9Dykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000002; c=relaxed/simple;
	bh=7vCNq+PJfD/+eHeHiuVF3uWMbin5NurgpyFpFUAKSSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNOQrpuCqQ037WOSXrUZMmacEId5LfeD5T23In4t3oiM/mtnwwcxArU8LZIMxd4+urIGfBAZoeF2AZUgx88ZPQVCRfT4hA8Ik79hb1VdgKEoHM0rZZk/DmRwbY/1rK7nR31eUxq6RDnw7WmDzhpW/+bVejmHkA70b2E8Q89A54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEUA68lK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso44071165e9.3;
        Wed, 26 Mar 2025 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742999999; x=1743604799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo8yUbF4wUa+z6nQkW7SJ0WhcUVRPGZ8Y1rGgvU8CHY=;
        b=EEUA68lK5MJosoJuX2zv+Z6Pg5nWn0Oz91kvuxHtx4GS3QY8jZMae9yEaaRC46ozxf
         kAFY1TvTyqIV5+5BsPRSEmDo7xlNOAG9+hMJsr6MuV1ToONylwtk/2Jvtj7IRHZhZVzv
         e6NDFLGztZH5pAfpevO0uffBy4oJqh5+H8iLYbDNQnF6Us9bfxwGFQkPA6WNcJsv6lkA
         7UqqIq3ZfR+PwCtaBJxZ64Z2mbVT9Y0kuBOPlwOSJ9ZzVcoyl9Abcq6r8zNEz9ojXGVD
         FHrUdQ4BkFCqCeCrEn5VqN5mitLvCm4d+imydJAZpK6lomRXe9IOfEYrQceckLG8kvwE
         o0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999999; x=1743604799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo8yUbF4wUa+z6nQkW7SJ0WhcUVRPGZ8Y1rGgvU8CHY=;
        b=LdT6/Dagcfi+y8FYj5kQNo340EZMzaNkR1hP4ARsP3qHo/5gPcZfYOKgDhxt/4ZxEr
         zU4Hr0RMHr2zqSXKssr15CQ1uaGG5PhFkZr4xIzHc1d++FddO9sWmGeO5zJNXzJ0fg9A
         9sVNJXCLkJKG44gBPCzxm1eYOdnPetCB6qB9a453QAiiscNHZOzLSux+/deX15MKUrah
         zf86mfoO5KPsXaTwqVcg8JITr3Ap75BfW7Yi2pmCaY5IdeZDluPQO5cGOmPwMrvOO5qi
         WnwzxFpdvloxZtt/ouLLJKOsyBTsgD3+uqv9ZkkGyWW2M4l1vqCoX/buqcOCZMQ7X08e
         +k1g==
X-Forwarded-Encrypted: i=1; AJvYcCU+pdo2SsYtobqbUGVESvEZzsT1CNA+diRsvy882Q8FHNOwFk55keGZlCzJXXvxajjkljs6RHCrmhPD@vger.kernel.org, AJvYcCU62a3LJBKNbVLbk454FHeMZ1auuqoBa7wog3FLB6N+Yd0g0ELCVGP8Og9uqzHwKhWRaCd7CP1HpJAmWfZ6@vger.kernel.org, AJvYcCUbHWh45u728x7SCvAeB2W9nnXj1OqVmExmc2Y8efaRGIzsqUTKxO/O66tak6TLq8qenC5BZQ9xe2rhhVPX@vger.kernel.org, AJvYcCVQVYBYoxSYPEKS+XPXkHfdkFlGWSN+A25WVWDmF4THpJRAglIVC5C0i8ABhYFcSlmbEVIkBvn71UsOuA==@vger.kernel.org, AJvYcCWej8iZ8xePvIYGJYzCKGCvRemhMFE614FJAMS99Li3aEDBTg4xBdV02lKYc4AqpJht2mqqanahtleq@vger.kernel.org, AJvYcCWhL+wNnQp1cath3rySfDN2HS3zhEH6GqV7qaRMdpJslnNLAiPxIkLLrQk92hTrlVfQ5aq1E5Dr8iqj@vger.kernel.org
X-Gm-Message-State: AOJu0YxHnD6gAejEr6SBstIn5MseqL5SECRaYHR6nwgoO9QOF/v2buHG
	GoMoIBM0cbzJa/FyNg8JG8j8ZxCgGBOFfI/YCgeccWzUMJCsVe5Y
X-Gm-Gg: ASbGncs8Dbyi1CaF76f1dp+31LbpQXM+PCUu+CmXRW+QBx08FVprDIKnXTqDnkrPJ1A
	W8RyGAVeW+3hBcZaUBA9Gk5uNF/ugWXaUueSOimovtCAQLlElJOroWzpDBYW+Vf5xdqLur0yDQb
	Q5iGfO89q9W8TL3z6y0tZ/5/fJ6n3GVxCKJmN6DDyy3HB2i28RJK+/zyBAG2ICNwtBa/qct2Z6+
	NRQUGgLZ8Mm3xNjgHV5D1sNS9fdl7mlUt1YOPdvsJ1KFmpeWKw+rxOL582Q2nGa7sDUbtL0fAOi
	Vd2bk8ehqP4SXTQ7h/3XfqcfEdNyv+Wy/kSgEsdqTd+F669mPFGAyQtzmQSyh0An43HPXqeABs6
	FAiI=
X-Google-Smtp-Source: AGHT+IE6Rp51RN1LfJrB6Bp9z+UyJ9P34RFiyRNq4eRxazayC6Uni7bHPn19MEPTytWoioXjDEuABQ==
X-Received: by 2002:a05:6000:2d08:b0:391:306f:57e4 with SMTP id ffacd0b85a97d-3997f92dcf5mr11606091f8f.34.1742999998593;
        Wed, 26 Mar 2025 07:39:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:39:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/15] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
Date: Wed, 26 Mar 2025 14:39:31 +0000
Message-ID: <20250326143945.82142-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document Renesas RZ/V2N (R9A09G056) SoC variants.

Add compatible strings for different RZ/V2N variants, distinguishing
between configurations with and without specific hardware features
such as GPU, ISP, and cryptographic extensions.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 51a4c48eea6d..3e61ce372a57 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -551,6 +551,19 @@ properties:
               - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
           - const: renesas,r9a09g047
 
+      - description: RZ/V2N (R9A09G056)
+        items:
+          - enum:
+              - renesas,r9a09g056n41 # RZ/V2N
+              - renesas,r9a09g056n42 # RZ/V2N with Mali-G31 support
+              - renesas,r9a09g056n43 # RZ/V2N with Mali-C55 support
+              - renesas,r9a09g056n44 # RZ/V2N with Mali-G31 + Mali-C55 support
+              - renesas,r9a09g056n45 # RZ/V2N with cryptographic extension support
+              - renesas,r9a09g056n46 # RZ/V2N with Mali-G31 + cryptographic extension support
+              - renesas,r9a09g056n47 # RZ/V2N with Mali-C55 + cryptographic extension support
+              - renesas,r9a09g056n48 # RZ/V2N with Mali-G31 + Mali-C55 + cryptographic extension support
+          - const: renesas,r9a09g056
+
       - description: RZ/V2H(P) (R9A09G057)
         items:
           - enum:
-- 
2.49.0


