Return-Path: <linux-gpio+bounces-18117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B8A762DC
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C441886DA0
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACBF1DE3BE;
	Mon, 31 Mar 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NFOzpKXd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19D1D95A9
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411624; cv=none; b=qTrqFxniTS/kB6AVYBRRc1lZ+A+VcfM5g/DQSVd6FERfLN2hr2nnkTaUhOBpWVH4YnrVDyuzDYE8LgWmMtZYKMGHRpsUZ7DqMJ0wvOoFB55/SvfDMuHYoJSvPDAINJmF5No9h3O4nGlvTSxLD3DFYfOp9Be/Q2dhUkimxeeFZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411624; c=relaxed/simple;
	bh=KkRFufY5Ts+zVGgNkDwwY3VcAWm7yp0NyJKdmp1IZHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4201qK18AfDKhSavY0suvmX0kv1dGPIZkTLaTVQsrbYGJXly4P+9l41SeOqURpsofvdXT7Eub7cKdbh9ZLcJBVGxE6DImejRkzQ4fWXKTQnUWNRNPZsIn5XPnqRnVbcWCZfQn/1/VKprhjPj11ofl180HM7t93UsTMXzPqJnBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NFOzpKXd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso40101185e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743411621; x=1744016421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gU9d2edF/TcfFjNhfV+s5sv+p1cRKxf8Q4mg9Tq9aM=;
        b=NFOzpKXd2QIjpp4zGKt2i1DEtiu3FczDK0iFBcntBduHbCcX+R/pvqPGHtuMSY1K4o
         pA+MFCcT6miWXwz2LBuzx0rvFcmMwv72Hhmg3sOHXugPP0z3sk6Q49w9Icr28EPIhNva
         DP3AubYcfnLwKB1GYhCXNIEVjcZg5PSoI4Uc0wQNNjZ3vCyngrFUB4LcQUe2Fuo75JNk
         jG80SgTBtf9JPLHVQazF8NEpUvNEYZDuRbE+FnL6fYayy+kyshlqwOoVhCzNyMw4y+9b
         vrO8GTUMRSJ17DxI9+opi+HiA0tQDMHvl5rDGvQbH8+/NyaiBcsj+yYwTg4uI9wRIjVZ
         5VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411621; x=1744016421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gU9d2edF/TcfFjNhfV+s5sv+p1cRKxf8Q4mg9Tq9aM=;
        b=LqmegLvlaZTIRXx2ibY3iN9uU/qHnqb9aED+AuY23WgZ+RgeLd69tudRMrOttMSjIC
         Oiq2wBcdnCJS7IAn6uOqxMJuOr0uCIDNKsYpGPikOknqOsjbCi41nVgvJrmI257/F2da
         RlNVltG2YJUUyohANlcVCXs8WGp4xqnxu1jLcWXlVTQK2UIKPqbeg+VGnqOvedtkeFQT
         L7lfemUx2Kvgb1bkWlHRhYeSBKbiTcRUChkHsgozh+mVgondcHgchAXmkx2bpQAz6173
         /fW8tz/o/10wVhQkY+e1Q99VEQ88P/0K0dMKyQLD0evK4xrXIKcCHUInUUZ2NoKT6T9E
         In3Q==
X-Gm-Message-State: AOJu0Yxqu/BQMmpcu0hpQETEbwhvTXkagWfYYmF5qJf5KQdB4IN08VaI
	YkM3FGAgm4y/DwIOMLKWm91Vf7nDP2u7vxApE+wguxZDCL3mINUjU9QzwnkasQ0=
X-Gm-Gg: ASbGncsddVf1Iib45MGxVuYB3LNTpqzEa27jE6lSEgGGkQSc/ecFke4Tcrp9DJYghqq
	ZJ96GcdQTsUgn0gDTc+b45hs6UOMUbIWDCRwT8zdSuKaScAW7z3j2lPJSPaLNsdHwYemSy4SKOY
	vhTVM26MOlnjiT917LB3S1DFqhZjPHjoNWGOJLB7bFYnOmrleRuslABQvNQ9qwR748/4LxUtZkW
	g5FgH8EKaZl3KmXDRdYt8zg6EAswRxq0retWIj4vFp+D46QDyJHXeZiVlGfAX5gv5iV+16i+XKB
	ernY9gEdXRHHkvNiYgZrGmtFoW8hQS8hm62ltw==
X-Google-Smtp-Source: AGHT+IEStqE2imkZKCVOni8vtak8UsMyTnJwvRU8JdYGxMnj5yqkz+BBihM4i3xZ3GfGqZJM/ix8iw==
X-Received: by 2002:a05:600c:8117:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43e8e3cf858mr68600035e9.16.1743411620707;
        Mon, 31 Mar 2025 02:00:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1db:ad07:29d1:fc13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm114534115e9.28.2025.03.31.02.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:00:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 31 Mar 2025 11:00:11 +0200
Subject: [PATCH 3/3] gpio: TODO: track the removal of
 GPIOD_FLAGS_BIT_NONEXCLUSIVE
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iAdiwXabC0rfncJfYhFBfY2gfOqHblTIkJxpJLdIhgU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6lmg0f2pBtZkeNx/FZUwtjrRm+MM3Q9PCGjkI
 3vgL2p1wqiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+pZoAAKCRARpy6gFHHX
 cluAD/47jVqvFgNvLUQIHKrXUnUuPtqvVey1pvj1zofgk2Sh9K7PYAPCl71v0B+ymYKvTYvUWEL
 yvabOnzuf0XZhyFRKSrMNu3n8YXLNK/Qc2gbKABJ37zP1U6prNLdz5S4cim8EtvCK2bWGBj54Ty
 9FFgKoJywbOLMVoAuxy7d+m8uBZ+FR63a4ZnjtPttzL1YLKyp8NtGMi76+pRcOQY4TKnFZBsBIO
 NaCQspZ29P4/HaoQjpSRN/Z/eeahBHxSAmdH03QG/FwjY7LEPxBK9hYRVIXXvq3CsxqDD6nQUVL
 B5svL1XXUzayKr/oXtGKnQUEaNxUdwTJgUTRQBW+BY3jEPakMfJHYLdtAsdUWKAXLnWdkNY1FKZ
 3GaPA4uuBCL2zZtLOt+6jC67Tja6LlTcUOM8UpCmqtzCvqmxE+WvvAkpuGtagh4t5cxv/junLfD
 XG/FugkhgjLfq6+F5rp16aFpkcnVetNYim9oGW7Q+WfKz0cCoBz+mXTq3rp2dP/z7U5vMhLP7qT
 JUyVwpmhph7QV60qpYZ5JnPZKHiHTe9CCI1YW3Q1N1VAu+lOfLEHusL6bEAPlRZgPMbmMRK5nzH
 XGGoGFZBwReiI8hsNdSZJqyHlmPk/r3RlheThMKr0WywyIFupzqz2JA31r7YIS3YQ+EgVwVABIJ
 pl3dcrxD6rcLAnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This flag should be replaced by a better mechanism that counts the users
and properly manages the resources. The pwrseq subsystem is a good
candidate. GPIOs themselves should remain a unique resource. Add a task
for tracking the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index b5f0a7a2e1bf1..5385071901993 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -186,3 +186,17 @@ their hardware offsets within the chip.
 
 Encourage users to switch to using them and eventually remove the existing
 global export/unexport attribues.
+
+-------------------------------------------------------------------------------
+
+Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
+
+This flag is an awful workaround that was created for some regulator
+corner-cases but got out of hand and is now used in at least 33 places
+treewide. Unlike what the intuition may tell users, it's not a reference
+counted mechanisms like what clocks or regulators use but just a raw access
+to the same GPIO descriptor from multiple places with no synchronization (other
+than what the underying driver offers). It doesn't even correctly support
+releasing the supposedly non-exclusive GPIOs. This whole thing should go and be
+replaced with a better solution - for exampe: using the relatively new power
+sequencing subsystem.

-- 
2.45.2


