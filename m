Return-Path: <linux-gpio+bounces-13839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD079EFB2A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 19:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405E21885994
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27992226168;
	Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OWEZhnMG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C71223E7B
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028607; cv=none; b=R/82x9ZfXqAMfWh4gsaNh2f0iZV/gTaReQjr1iQUY3a1aIZZv8YbEkCKqyOJc0dUfAu7/WB/7RJeonHzxQC+pASLH5lkxjBTIZ0fbg2rVpe2FeS9XS6BDUjsLTtKxP9+Igi5gEecFFTQuCiLyWbKUvTL+ZhkXUw52Vepj0wz0/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028607; c=relaxed/simple;
	bh=z49WJ/Ecx3cRmoavwvCyrBSrNBZWdJ5YBE+eW9OtjMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8iD1YuzG8VB17X5qxwV0Ogl2yUDreDR6sj5vYzVd8fren7aXmeQjKVsT1ednD/BbkH1xEP53OAp4JfdIiFgneywBWPWIhZKj36hsKksI3ZD8fxr1XBremG+yjp5zTnvvCz2bpWTUqN5vFzJmMjMjBCccYnaNwB6FprpB+7vGKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OWEZhnMG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361c705434so7130195e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028604; x=1734633404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=OWEZhnMGAK9yBDpgjwg7iRP5XiRfNn8hq+4KOjmj/aDs9aeXUnTo0iiJo+LezV2WKo
         O4M8S6+WsLK3EnUIk5XE4QQLSFFIR74QdVAR05VUD7vIjD3Q7b/BvhCdwI/kTjpEpJw8
         hNKGw3LvdWDvZOOQLBF1HCF7nutna+CV/SOECHCEFZGI4v/ALyS8+XcOzJcpFHZiDZBb
         RMKX/KZuwwDjNWaToZFgrCv1ljg1PM0P5FJ/TurYNCDXfN82PNgAOWBGthI1PrewLHkW
         fGmfDNxmKfmkD6xlbDh3LPP6nFgzClacnPijbKG4hOchKWVH3XSKd0SVNFE4quV7x/0j
         fuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028604; x=1734633404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=kFfmZzfZ9juT59mh4TjqvFag8zkTA9wAHyX3rE+kKkQSRK2s9pal3Uk1krNmMwr/NR
         2FggCBEDRs3VHWWMwfexYR13k/oHwWKZPCIV+5Y6LWdE3yo99Mrfmo/Hfvzq3hMQOrvc
         Z8N4EpaeB2b0DWxZppVriW1RuYdMFwKZ/d0gRLiqIZVG/nUjRsJGL2ORbbpkRK7Ue+0C
         pR0KiDzGRs8UBuCqjljBaKv7Y0NT+RK8BnDwUnOio2kO4JMB7YBcWk3apEnoT28Cvz1i
         Qiv5i2mNr+j4Pu+4VbQKFP5eViJ5gSuMS9cnnRPk/9XdfjsUEeUhccpcNK/WjUMC6JaG
         3DyA==
X-Forwarded-Encrypted: i=1; AJvYcCWNzcBL3YeTsz3Srr+ssVTAY4uw5a+SNBviqr8kPJaL5zINe9uo4+ONQFhke+tFDR8WpEvXtnbSgg/M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+o/A/5/LK3dZjF9etXKO0QKS4zsdott1eqH6667eEc9Bdk3ih
	3CEaxTgLDAprXIUEK2q40Qs091tgd6n2H+TqUmX3qbctUICd8QaMBZTLVG+hOaQ=
X-Gm-Gg: ASbGncvZ/pr8/TJd6GhiudOAGnd6v8OHDEx5Y7SRMLaH/7Gh0qNhxUWqkio/RkCjaXf
	rleRCZgG0T+NDGFtN/L7yhFheN+St98plKSQCiQ2pAuulVqC51P940/yAfhdiYTFOuGKz7D4/Bg
	xdUAtWBVpoughzLj61c/+NnKP088YXgfY/iDklzBfNTnqrLrgq0tEWbc2sP4lez6x9mzNjTfPGa
	ik/LFXAgqp3gBRJ+WVxQQAia6+F/4uV1azEF64u1F4bjjb1
X-Google-Smtp-Source: AGHT+IFExc0XA8Xy/C4Mx5wK8VZwnwxFl/5BahFWH3EA4rW9cmekl8fnISqr+JRBJqWQX6UGHfnMOg==
X-Received: by 2002:a05:600c:4450:b0:436:1aa6:b8ee with SMTP id 5b1f17b1804b1-4361c346a7emr72222265e9.2.1734028604531;
        Thu, 12 Dec 2024 10:36:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:30 +0000
Subject: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

gpio-line-names is a generic property that can be supported by any
GPIO controller, so permit it through the binding.

It is permitted to have a variable number of GPIOs per node based
on brcm,gpio-bank-widths, so define an arbitrary maximum number of
items based on current users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..fbd69b4cecc7 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,10 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 128
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1


