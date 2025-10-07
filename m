Return-Path: <linux-gpio+bounces-26876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A8BC1779
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0326419A29E6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590B02DC32A;
	Tue,  7 Oct 2025 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDt1HBFF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C93A1DF982
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843134; cv=none; b=AwNth2oLqhOpfuwAwYtc0WgIpJqre4kL74SbU/P1DltaGJa7b2D9E60Z7UgDvlm+erSfv3HNMCkQHVkHzdzP785xJ6ViO8L3Ie9pa0FBZZotiEZfNHEEucS8MOpS09HsLWREZhstJmSPAzjngujEP6mDezC+Ynu8arPkcQuP0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843134; c=relaxed/simple;
	bh=BSqoMya0AJUlmlWcX8U+e7/UMGEzq1d9TAX/x/1XsmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZzUSRqXFOB8urP+g36qu/GeYwPfS6dnDKXQbjaboYosJhskIvkdEfSDLpBHapqDty9he2UZzoE155gPQequoExiCXqV0bW7BkpgYV4R4k6zIZhFUKorxz5tUsb/95xzNHGm8wlr1V8ursFLD8KCMhzOEHWG8CHMUGEd0nCBz3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PDt1HBFF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so7461739e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759843130; x=1760447930; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajbHWTHE9uQYw3vfR8RbF+tNtVDiIRA70g0ujJyyOWo=;
        b=PDt1HBFFv2czRewptBV0j5bUHIAcIGaTxMNe8PcdoiI3h/wrLepVM0gNP5SPrXIO98
         J9GiJVzwmI0lP4DskKB4zh22baCzKjtuVqDS1kv1dydgzbZcknN7QfdqoNhwQSsPDnty
         7pIsxxfCh7zjCTI6gHYuraHpCgueMBBzxMg+S0QzpzTpqul4czBQngCjQpLAIQ2WsR+h
         66CdS9yEFUd9OmWo1+02dB5rxOfIIGG0rnBdCaHpftHs8AGqYHO1IE3+4fBzSdeV4iG7
         eiQOEI95hG9Rygl0mXTHHxvM23SJEwSxRU4LpJ/dGol7SWbbqVtWI61YRo8ZkI/M7doj
         dlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843130; x=1760447930;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajbHWTHE9uQYw3vfR8RbF+tNtVDiIRA70g0ujJyyOWo=;
        b=Ef9lTPfii0TSbyPEq9ktnKfWUcRn6pTbKNYkDZACESwKX4U9YvxHFLgHBFvFM6BzF2
         /RdEWp2SkX+t/X+vRqvl3ib2lca3IbfueQkNdRHb4rBbulC6aT6eOacnw2gvKv/VlXjo
         hbEK6/y5gJjCB9LALJOaNEKdNdPzXdveez2cLwDcSyDH043w1u9n1CI/ItmcRkV9LrLL
         lX3nRq1Fk+jMm7ZIh/QJnytzw7j01OZCjPCNqpk2PkFr9Y8MdLpou6IDwE5lOZumpQgM
         MCe53MvuE7dNnGoHYW7EeK3/Y5xvq4JdEVz+16qhndGXhLCNZNUMtQyOFi0xjpRkFnii
         /03A==
X-Gm-Message-State: AOJu0YznrK/sPML9EkF25vOXmzDonhOcrMeSCLi9Q5kt9R0ZiQ+Ez0oM
	+46BvB0XOFV5QBHOFOVq3bAc/CCW7KI1raPdYuksRSUyBZ7PKOj6sd0mbXRHIF3OZ7k=
X-Gm-Gg: ASbGncuRjvjzxi6fsMlHXzQ/DzJm/1WlAf12afKwYIvCj9V5Vu6QqyeGex8b8wTtyGV
	IV0shBGVMk6bQrOmOMK0bPsFIkWU8cz8a7gLLhDkT8TAJC8uBEtNtXlxRSzIks7KX9zEq8pKrYy
	XNx5jMDPp4I6zmTSnB0DYz/kmcCjIi/gAUJrOaRH2c7q5dImgkW0lKzdyP6oF14f5TvqaHo5xX2
	IPV7Y5whzsAHlKa9TLsKyvywqDvtSN+Giqp0lWWVjWOLBZwUluG04+wkMGhHrHJgSnSV0OpkPZv
	FY33hzzjk28Sbn3TUOd5eXHX3/RQPsNBgRNSxp8s6hbRrDNRtsBZwM792P+XIBxJZDJJ/KrNe6I
	3mUwSjU5zAaxXFtcWJkpUC7cQH78gdlDWZH+3o4pnYUHAvs0nfcm6FhHCaMBmZQ==
X-Google-Smtp-Source: AGHT+IHDv3Zjlc8YEk/MOaGe0FXf0zsPzQjoGH1NOeEiNlTVYYPWdc+1Ii90bcMEt0vtg05NcLYPyg==
X-Received: by 2002:a05:6512:10cd:b0:57d:9f0b:fd4b with SMTP id 2adb3069b0e04-58cb956b7f3mr4828529e87.6.1759843130367;
        Tue, 07 Oct 2025 06:18:50 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a9154sm6082460e87.115.2025.10.07.06.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:18:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Oct 2025 15:18:50 +0200
Subject: [PATCH] pinctrl: Demote subsystem banner message
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-pinctrl-drop-advert-v1-1-df16410680af@linaro.org>
X-B4-Tracking: v=1; b=H4sIADkT5WgC/x3MMQqAMAxA0atIZgNtsYheRRzERA1IW9Iignh3i
 +Mb/n8gswpnGJsHlC/JEkOFbRtYjyXsjELV4Izz1pgek4S16ImkMeFCF2tBstYb6pwfOge1TMq
 b3P91mt/3A9Vnj4tlAAAA
X-Change-ID: 20251007-pinctrl-drop-advert-d1150d425942
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

There is no reason to print any "hello world" from pin control
unless (maybe) if we are debugging.

Drop the banner.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c5dbf4e9db84424ae9ceb90ed3681341654d1871..157510157d47aad96b459abf68cc0e4eed957f2d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2416,7 +2416,7 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_unregister);
 
 static int __init pinctrl_init(void)
 {
-	pr_info("initialized pinctrl subsystem\n");
+	pr_debug("initialized pinctrl subsystem\n");
 	pinctrl_init_debugfs();
 	return 0;
 }

---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20251007-pinctrl-drop-advert-d1150d425942

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


