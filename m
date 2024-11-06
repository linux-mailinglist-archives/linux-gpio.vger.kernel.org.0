Return-Path: <linux-gpio+bounces-12649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E439BF8DD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 23:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CA01C21C08
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 22:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBAE20C313;
	Wed,  6 Nov 2024 22:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4cM9EmH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25053824A3;
	Wed,  6 Nov 2024 22:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930737; cv=none; b=skaeDuqHQ3/naDblNPr6S1JIUpRWZdIvPMqACHtOk/ndaf2O6jF0U5HmWtEWIu6W64Ov0+x2Jl0lj/r5jh5imZDx3wPt7DgztEXLeyVBRMKr7IGmtV1aOpn/gmAChsrLXOec2LasmGY/A2eAn3YFC4VRLVf0CnwlgWIYXtvpKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930737; c=relaxed/simple;
	bh=5hIr4DqH344QQRXKlkjp641JXAdj+t2BweafuQTt1EA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VtKy5JTK8KYES9I2tcfX+xvBpyeqQc2PE7TK8KxwaYYm4Kbrezgc+k8Ph22A7/A/PPPRP9N+wbG9qWu5jJXwbh8rkclZamUYj9jPKlVupF8t6kWUrULCqodyVd5Pd6gt1MAy75whfS9RupzZkJynDpXPadhVRuaxB3LEsC99Mx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4cM9EmH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43161c0068bso2677335e9.1;
        Wed, 06 Nov 2024 14:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930734; x=1731535534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqklnXtcZ0T+lSHc7mcdxj8FxKGKc9PBldQlZBXC1T4=;
        b=J4cM9EmHIeRIhoKGWro6p5eGqXMMux6VZdTz5G0T0kYEW0682kBl9o550LMymKfnKD
         9CDyQkcV2yy41qIblZL47ytUXr7DCwT0MJqQmsNdOKxGBU0rak9J5cEZvn4+luj8iFJF
         ydnf560ct8UVJojGOjg+u496dN6Da+wtfzcTUGn1Q90QjeYC054yELVQtNySfaarC9k5
         UwSm28BMHbrKuZvFZYQ3SVSkCnkfS4htvLP2RdBltvKYctNNKNog8aGLnVRCiYICJHBe
         PqcxG249vbD4KR5U2MAGG/C28UY+docyvTlsxuhW7snhTjZgMlXTUG5/CsvOUeftSdI/
         pDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930734; x=1731535534;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqklnXtcZ0T+lSHc7mcdxj8FxKGKc9PBldQlZBXC1T4=;
        b=TCeNp7aAGA9KMywYe0LdVzoyDPoRC31dbJHtm0y0V8w6QZF3YxKUPrmhhKmwYUDbWp
         /Ct0hreUkco3dKvybUY/bhFlBKnQXI8p4s/sSaw8cJ/eWHPWKp83xLGgRTdQk+vDV4Rn
         KOqBjA4iX8dcvR9UD6u6kGVlWijSdjIttqjR/o/a9YLsocmx+U+eFoI/YOprA7PQCLCm
         C2xSs5DKeJ8bu5iYXKYm1AI//0rcTBtTwvrcpM7ZraoUY/RaqlmlqaIudWUMQ/a6jKp6
         5LSthQBi0HoTGakfu35KKwtZaJk9omvxqKfvEFM7RB9Tmnudcqf7LehFKjN757pHi+JF
         k0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUQr/zpUBSsuZzWsaR5q+EPKT5mbK+x6zvWJ2n4KRw5aNXg9WFlaijx0XJD763TQ4kx6dRuLuXHQG7h@vger.kernel.org, AJvYcCVUrbN2or5tyLSjky/FeblpR2s0MIupRViQfJONm3bUnejNDtgeTiAi/mAVcKKZRVeMdPpzn5FO@vger.kernel.org, AJvYcCXGvrX+z2+BO60m8oIWtjbdaXL/HxkPhiDyllTGXx7eKKpou0AQKJFaKTivMTuGAT66Rw2xp26/v7u8/l8R7biEaqE=@vger.kernel.org, AJvYcCXrkcbkgfZk/RfcTSAaLGGmeL8MKW3OWYdKGlnz2YKNLm0Xn5R2nvnjrvKiFKJEb/QrCkETeIl+7rCa00tR@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4piGKxmByDw8LhuxFuWNTbh4onbzejn1cCx9bxxMqyggPhLw
	Nri+RhaHGkm6fsmwy11yY4YsJ4rDpoXqmPbHckZz5chgK+yQ2+Y8OM053A==
X-Google-Smtp-Source: AGHT+IE6Y7ubo9iP0AJhvaqbFPGr9/zv6r/DCkyqFoxY8CAAbQQy/4bGLHV4b4+wJnMD6OeaRvp01Q==
X-Received: by 2002:a05:600c:4f06:b0:431:5f1b:a7c6 with SMTP id 5b1f17b1804b1-432832965d2mr183460825e9.30.1730930734049;
        Wed, 06 Nov 2024 14:05:34 -0800 (PST)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-20b4-40af-8ae8-9c61.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:20b4:40af:8ae8:9c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b0eesm20288493f8f.106.2024.11.06.14.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 14:05:33 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] pinctrl: samsung: fix fwnode refcount cleanup in error
 path and update comment
Date: Wed, 06 Nov 2024 23:04:38 +0100
Message-Id: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbnK2cC/x3MTQ5AMBBA4avIrE2i9ReuIhZVg0mopoNIxN01l
 t/ivQeEApNAmzwQ6GLh3UWoNAG7GDcT8hgNOtOFUlmFYjY53YyenT3Civ480A5NnZu8pKnUEEs
 faOL7v3b9+3723MfqZQAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730930732; l=794;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=5hIr4DqH344QQRXKlkjp641JXAdj+t2BweafuQTt1EA=;
 b=UW8O+ZSbS9ocVYCoSiiqQ02rZTe+4QqvnvDRkzg7Zoadme/L5yho3KU7WsPQfax8iYAh3Wjym
 Cm+YahsvW+wDrI/MVuRCI05vflLgW6STYBl4o08MbpZsAZio+qsk7xP
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The first patch completes a previous fix where one error path stayed as
a direct return after the child nodes were acquired, and the second,
completely trivial, updates the function name used in the comment to
indicate where the references are released.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
change-id: 20241106-samsung-pinctrl-put-cb973a35ef52

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


