Return-Path: <linux-gpio+bounces-16979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1787A4CD09
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8ED173CFB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007C823A9A6;
	Mon,  3 Mar 2025 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUUow0NY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AEF238D31;
	Mon,  3 Mar 2025 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035299; cv=none; b=MwqB3pReT9Me5v3J+GU0myl0XPmsG6CkNC6dDz48iVzT0LIAt7tgngGoghx1HUVCFUs5BPNrqzlbs40a58vvDmVwcZBfHt7QndV7Ks/KtA6UFtecOwWV2g2PFbw0aTLXwjxNnjMKhvj/TAsceRJt7tlJt6v9JndQ6vxghccZiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035299; c=relaxed/simple;
	bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKbZDzf2cXMzRm34Tbdj1GcG99T7t0Ku8nWgrWLd2jtektcmBE5KTGOZGgJJSNKR0YEOGLmwZgvZOVkA+6AJak2jze+4ZnOarcmFZWFyjhdKQAqJNXqiAmjKquEY4vg6hxp0iuXw+QGYThDOP2/MJ9wNjH2pUDtvVEelb4vUqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUUow0NY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf3d64849dso411151466b.3;
        Mon, 03 Mar 2025 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035296; x=1741640096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=PUUow0NYM/BkDYHefp7055dnMr8vLzrdZHlwueRFgVqs5phYOuT3K+IlGD4s2vsYpd
         Fp+UX1fHtovA5PrgW0qbg7H1jxZM4hQZcIMTQYghDHyddMpN5B+Wn8XhrWvttu/vJJCm
         dT6pFpLSaB/fsMGHZCQpQRiWGqznGl3DnM3ndEZY7bHNe3aEXnUHBU82i+m0XQeVqh3U
         eVz3Q2lg3ivXMnE9CHuw8gMRqSqTBNB4pfgjUkKHVoilHugSUB+/8HMmtY2iPYCTXZ71
         FrzkikVzBvEFyMmg97z8keTMS5b4c38bQ3KmtcYASF7g/evOF3cNuOSGDUBirZ3lt8rC
         vrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035296; x=1741640096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=fatfhxqRWOXKxaFuiUMLNGLwwFjwanZJlM5U6kMApUbbuqhlQWqrsqyvyfqAq15J/u
         ABykoBGbY4a3F1TBZJmUUmSSC8/s0ad+gvc5gRmWGSShp6qONdgF8n9blBO9B7wkVJCW
         OzjuoZHoVv1oBbZ7GpT+PL8zTKTs95PRHikGB6knEDKGxVq70UHzN6OZVi7KcQI9kEv9
         gsNH9Q9NAq/O2bLg8DWbbSBVVs/mF5S86l2cfoOdE89td/NNSaUSBVRyFwVkKOOhRhMk
         qIag66W1JD+BMtmR49vbrXNusZwbA/rtMproMKdUdrfDjM66tVodowaw7yVXZVFZS6wA
         RxoA==
X-Forwarded-Encrypted: i=1; AJvYcCURhiwcMa/gMTSd/bVW00G8QX13jjt5DxRws5tSQqoSKlse+SlcCJSCV1RIPshiuckrUhXo5xBuUWgo@vger.kernel.org, AJvYcCXtIgBYhteKi4zNqIJqxzaV2WwcMfFzsOPeltBgLhYlwKlbaSaJvFMTOj8SpcruP9e3OC92JpJe9YW/Sc/Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5wC7vzOLLOmZoM7NeC6npwkODBExFiriSwCiw4uLUkB9QEkx
	0CBmXK4Eh8TAju16hoeiXrrsdypAhvR01XFxvLduyTb9jhHw/6Z/
X-Gm-Gg: ASbGnctGbYlqEJ5pMwaWEPdOdoKJ28ILY1zhIsr5yy3h8RjNqOb/qDBltVBc/3O8GX+
	sk1pu57wmGQ3TvwrWPVtE7mpp4qfdkX9KDACki+4HjiETW+8HkHq/MZeykQcSG+Hy9XxbjRre3p
	hfwqupXt9jQLXRJIyZXzpno0HlXFpc5JJi448JGO6WXNagbNNjHhfrvfVYtDnLlxZULIlP4yh87
	Je7PYg+y8UxXf9YGJVBsIDmJ4v/DU93mFYgKnAJlryvXPl64rM+0Z5rmx3nfx6mR+lK0rSfcw3c
	raBXXyreh5Cl+gTjnJG8YHgVks48tv+OBEaPvMh7CR9coGvyf20h4Sp64f41YoMJFojCs32Sddm
	ELIOfag0pnLthxRU=
X-Google-Smtp-Source: AGHT+IGDI7pPv3lVt+rtcFBB5IROIltZWrNOe4w/ZJaBmmY15fTDvPfbBtSNP4sxXGInWKldhjFdgA==
X-Received: by 2002:a05:6402:274b:b0:5e4:d2c9:456c with SMTP id 4fb4d7f45d1cf-5e4d6b4c7c3mr40715061a12.22.1741035296337;
        Mon, 03 Mar 2025 12:54:56 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:50 +0100
Subject: [PATCH v3 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=HQJVvUGSXwOhIIYSvhAUlGH8JPKIWUXzeLz6tFP8Ll3GDEsJg1ztwXI+2rQDG0fau3eHN+lGR
 y4cb5BGlq2aCLM7KnhcV1N0l0k390A3EFWxFn8zbCCboIhienRugbS/
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Now that the pinctrl driver supports the BCM21664, add a node for
pinctrl in the DTS to allow for controlling pinmux pins.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index 87180b7fd695e65b52c52743e6315cbcca385fba..d4b412ac8b0343bd3773f50c59a20fa00a3923f8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -46,6 +46,11 @@ gpio: gpio@1003000 {
 			interrupt-controller;
 		};
 
+		pinctrl: pinctrl@1004800 {
+			compatible = "brcm,bcm21664-pinctrl";
+			reg = <0x01004800 0x7f4>;
+		};
+
 		timer@1006000 {
 			compatible = "brcm,kona-timer";
 			reg = <0x01006000 0x1c>;

-- 
2.48.1


