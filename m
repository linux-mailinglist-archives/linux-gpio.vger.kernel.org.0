Return-Path: <linux-gpio+bounces-29571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 37440CBEFC9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCF94300F653
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E059D3375DC;
	Mon, 15 Dec 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mh3bUpSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04155335095
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816729; cv=none; b=fqSxUGFhY91F3qMZKaMlQTNbq6K85J3aWQHePoggoox8njTkBc/P4Zhjk7YejWVH2tKW5rudem2OVgTZ0Z2w4eGEJeY1tYwLE/xGp9p4ji2VpGD+wfVSpIOYiT7X36WJJA2RuGWQReAWfpDgPGEw0Aez9x1D+rpqKLFjyfn2I9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816729; c=relaxed/simple;
	bh=Wi9AS/Q9Z9rJWlYN+9bptQ35O1l7qMfPD8Nl+Hhabzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVeVAgxqT6Dggrkgqa8WJ1iIjfxwIcTmnZrrcO8qBxOn9FvYIehfZ42kRR5xOx8YVFxex6MAwWgPoWgxJjM8KG6pBy2OYgk3GPcyLGHG+fgsDLwLR39thvfPTjCjzw/2HcRMzBH3UQRmwsxXkz1qALyzcr7/X30TT3OCD06I/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mh3bUpSK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so37293255e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816721; x=1766421521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=mh3bUpSKu6JlE2ZCje7XOGuaHUYeu2cxxu+IFs9v1wVAGHi8paQTpFs9+NH5OVCp0N
         IaP1HdtWkevWI5zyVvTj1IT/ssgm7NUeftrGx6xtKwNhtFX3HeSnE2DO8hvKzvkvMeqK
         bZbhFfk/QeR0QJG8UnZ8noCrwYcXUu0soBEQ/4uABPC2yg0ey0hv1kKgLI3f4Li5fb48
         R22A9VIhPq666CCEvipUWez6Zxxu01uB+fdRWpn7Ka1i/uiypH1W0PqYYEw8+Rl34yz2
         JtFz/ipWF9b1RitIgLBKMqQMVUoZyjMQPSiOhcuTPsd90t1A2ohaklznD+C81YD7CK2a
         4eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816721; x=1766421521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=sx/EMWvOJ9HQ3OcSyX4nEI1Yaq77QhkS6dMbhmJl4Jq4d8VK0ntiK59eZnosy44+Qs
         lPB5tGGWqmtRDhH7XvGk6VdgNKNuX58JK9b0XmdoWoemtMdsqyeAGC5McAOBs3h9Tvqn
         CVxaT6AtzBloJyUA6CfF8jRnRiD0VouhMqNiAW0Mrv/5gYZXjd1Yv3JLKXMDq5zb95bv
         SvXa4jRS5fSrCwYWzyuknEKVIzsBaxFMnGGcAmVXNJzsNyRALhhXllNd5FmI/+v/+5qu
         AuHp0LpEPJEGbgQTMcaLLEojsHltHoyv1DiUaDA64I3xV+SQTT+LTaTz0QN8YcTPT4n4
         lO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVpq36y2Kyo3y4AUVJhah1dImjHuIbvz+35YPUubgWFYJWPjexlGCt2VF2JFggy5P9RePljUnMJVfR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxczan6uggMv76/0tpkpTEY/7jMQ8UOBxRF+rIdO8J7oXbtxFn+
	T+O+4TeD7U59Kc1Awus4TCsa/XOe7BltIOGIGm3Z/7nhKXW1GuMDZB40FQWX2XbnV8o=
X-Gm-Gg: AY/fxX7u+T+dJghKwH3g1l8LnNuKYh2jUvOpNv+2KDeysmsQ9PSXujjSwMjLg6L27xU
	/9J5uhw7Q9fW8o+vFIgjjmehoNu3Ex27CDKHzkmxzG5cIVItoWHk20GZCvPJjT7y/liGUhaWOQi
	+w4YIpnT07drAJq9uM/PZZJcvGl+m3ZDuc6UlkINIHgGIGxngATnE8UpinVIYCH1XQP2SK9zMoG
	xYLYkaEEStT+8hbVeJi6wXQK6PCUPcOCqjGoRODc6NwFT862/CCLlmjQzsN6G6wYOi+5zlyDBFf
	FGQdn023k4Rwk7CGM5yOTeCewasMdSuYnzqBe3PcM2YdF6R+LErUGFjbKoYspiZGGyKLz2hHR7r
	yfcXCHUMkqfg3T5N7D8P3dKTKdXs1sfB8rAJtQTEFbcRxBexUoN5OdCX3uPjdAy3/Qe87TzJOCz
	jfXk+96bMk5qoFdRcx96K8GW32Xu77xLHWsO7aviMbytzZ
X-Google-Smtp-Source: AGHT+IHVHrhWHHd5t7v+NK+1xDZQB9RPKOfbhSwk160Kp7+0yxWrCigeVebl1Gn8PfXk1Ze7IDyXTw==
X-Received: by 2002:a05:600c:64c5:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47a8f915607mr114002895e9.32.1765816721213;
        Mon, 15 Dec 2025 08:38:41 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:40 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 06/19] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 15 Dec 2025 17:35:23 +0100
Message-ID: <20251215163820.1584926-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


