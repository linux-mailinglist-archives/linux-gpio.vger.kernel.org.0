Return-Path: <linux-gpio+bounces-8122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A592B7B2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 13:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B219284906
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045B01586C6;
	Tue,  9 Jul 2024 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xb1PCr3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C3146D53
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720524356; cv=none; b=CWbfMiRsTKS+IrgDxK+IkyYTPo4ZBco0uZ5wc54ihyQBNiFSAgfVKm36CqAYq14ZNV1iO/43ly/ZrxduqAmAjQwZRgLX8R11Jn2UGmR0E+Q+fGvjmDKyyoeWZ5Yil46xT7I1jym3gExaK6hQ2Ubpx5UHHnoKPAjzZtS/+YgBMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720524356; c=relaxed/simple;
	bh=vvcwRkM3OuNTwdiB+rwHmWDHQxrEcGpnnFXILUWOzkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RAu0Lhc6Fc23dPeA0R7Sfy2Mc0Yp8d0rgLquxovgmDEW5LXAXY1CQIirDHah1tLuUDCzZQSmIxhB2a311/J7snPKRVdlUEkacliYHWkVS8z3xTcLLoqBerjMiv+5z3UtUpjabelIioM7n0lnemHvw1M2Fn51taqWorLTRzY5bfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xb1PCr3Q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso6439985e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720524354; x=1721129154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfvGjeFG4a32Sifih9R0O4zMufu9Pz8z2RfvikPSPHY=;
        b=xb1PCr3Q5SlATkx0icGFBSkllrJrS5sb53tLnukqOpmzRE6pw0+27j3kEK0ujlSndZ
         KyFjjN8Jwm173NOiSoV+1mlxeCz+1w9bhsEDQDoX7Bb9kZRCg7ocKOMtPACWXUs1JeiR
         TCsMA45huAQhNYcts9TWuyelr+SHnAvFFZipLg/lAmXjWxlcPavrKlJS9+UTGyQrn9r3
         hzXvpOmeh753KXvWUsKKYGp4f0AQbD5gymP8fqj5rhcS+s+XhFHxNwxo3NWn76umRLx1
         Yc6+jN7w5HauGYqSkx+ZBzS/svY+YkumzbQeNlOe1BnzJPfzaqbSlRC3SBqkFHzC0XeR
         F5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720524354; x=1721129154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfvGjeFG4a32Sifih9R0O4zMufu9Pz8z2RfvikPSPHY=;
        b=QYTl60jKXSR6S0yhAnPTXq7O6bSgzRBcXybmJAToxhIIQ9ItoUyiop5YMqLED1AXuA
         YRGDnKaJKTiB7OTfMJJPjvnlRtJ7x3lcc1oRR2LuS0vjSIr8T7o7Sea9OEec+u45PZ77
         FQwYMXEBk/qqULf38/tTG+OiRkVuFziOCzTh/zQZSIidw2nqTef9ibA4dAH3OcloOy4E
         LUG80BGeVT1nd0lP+pvmyna72mulPfKfbJz8X1jHKJKwf+2jmsB78RZolDUZ/ZoFQ4Dy
         0xXRuiYv2i9/NP+MRF9/xFsAMHpBbpu3qikkCHd20W5EyYWrArK+Tnb3ZtVXoRBfutOM
         OLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPziuVu2m5ELZP+bxjj4Ii/+LryVSxRXKXI54ZAU5/eKRPhBaOuqigOt58jJv6tjkdrXr9F5VXImHTyNhdI0c2hcb8W+RlD01abQ==
X-Gm-Message-State: AOJu0YyRqO2/WDjbMkNZy78mRwNrwtTfzd0XmEVDFtKESrz/wVj++qXA
	+6CfNbl1iCm3aHXMzE9uOWTzBZEXVzT2mlL+TkBiNz7NrKHqYznfbHG5wtl/OvI=
X-Google-Smtp-Source: AGHT+IEwiUV54wszrwv/TVpmnu4opeBXJ7Hz9ZlHIOaHbIMMziKYWgHtgwNOIGC1RqDnTBuWbmkq/Q==
X-Received: by 2002:a5d:54d2:0:b0:367:40b9:e9e6 with SMTP id ffacd0b85a97d-367cea67e6dmr1515785f8f.21.1720524353582;
        Tue, 09 Jul 2024 04:25:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e039sm2307724f8f.2.2024.07.09.04.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:25:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	arnd@arndb.de,
	durai.manickamkr@microchip.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Date: Tue,  9 Jul 2024 13:25:51 +0200
Message-ID: <172052434347.27822.16864713604407945517.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709092354.191643-5-manikandan.m@microchip.com>
References: <20240709092354.191643-1-manikandan.m@microchip.com> <20240709092354.191643-5-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Jul 2024 14:53:53 +0530, Manikandan Muralidharan wrote:
> Convert the Atmel GPIO controller binding document to DT schema format
> using json-schema.
> The at91 pinctrl driver uses "atmel,at91rm9200-gpio" compatible string
> to find the number of active GPIO banks and identify the pinmux nodes.
> "atmel,at91sam9x5-gpio" and "microchip,sam9x60-gpio" have additional
> registers to handle drive-strength, slew-rate,  pull-down to drive the
> pinmux configs.
> The new compatible string "microchip,sam9x7-gpio" is added.
> 
> [...]

Applied, thanks!

[4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
      commit: 337049890b8cbbb4fb527c58976ea19f4dc747a0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

