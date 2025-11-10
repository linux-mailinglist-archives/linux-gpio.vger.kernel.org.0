Return-Path: <linux-gpio+bounces-28307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE86C49059
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D0C634B136
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C460337B9E;
	Mon, 10 Nov 2025 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nm4pFbuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38A335573
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802946; cv=none; b=Mrfwi0aPqAcxf3LT3c5BiFdfEgd8aSqwRb36sWF8u2olwmhVG3qzaYlMFRBWN52629UeI6VJ4s5BuOsxUdhEEn5qkQD/kH3RRjGS4YcbwDhiJGCi8+hL4sDFuJs3uIO2LT66I4LSOGkKaEBI52CmcacNdYONwZaD0Jmsgc64CCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802946; c=relaxed/simple;
	bh=83VsTolNJs8TOx5t5je1+Dgh3QeYaZvyttBMyQSF5Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8T9Ddr3AVIleQf14ANfOtrj2uP+TKogxebzWlgny4tkQofjUyf35gJC/2pLHrsBqN3axa8VFvygpKty7p0QthuRwRdcXYJso+0rgNX82YKVkrS6tgDa8kNMilePi7ZHpc0tDJS63HBE3lT/EUjqTvxlwiUegeb9m4Q3i7gQrws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nm4pFbuo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so1857059a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802940; x=1763407740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfP9r+aA134P6xP9G9rUEiFSSucymGxSGs4llBYmBio=;
        b=Nm4pFbuobOQlggfIxdgG6t7pEXdzGehMljmEWDoqJNDp+QFWnWVqI0BINvqnhO0Ixm
         Sz5GSTFPiwTGdu25YcmYTpibFdkTE9Vfoh0bhjJgOyp0GVxoYGTRdl99V3eaioa5g0dg
         Lyn3kuzKh1Dzb5lcFWoAgOy1X+NentNRezsjJuT2xkn2aXPPLrBPQgXMlTZrI+j6itPu
         crZHd0e4kU1BwuMAr80Krxu8zQ1Ofmcd8HaU340O7KnkrR0XHGPfSYjpO0AAHaoD/Gsu
         l2hfWybKMf28JMSb2GxS6auBSKS0mckMhtdDrVVZmJSZlfLXuuJQDCMiYTSjOB/+86iH
         2znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802940; x=1763407740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfP9r+aA134P6xP9G9rUEiFSSucymGxSGs4llBYmBio=;
        b=mHJP/J9IjKCJJyYOBVRrMlb8DH6y449KKgp9dKk0KGjZNZbEWaq9VTXiLsd5+1UOK8
         +ER64B+mYqdftuhEE6iSOeiA9SXiaiOuBgImUlpzs0BRzmBnL1z7seNDwBwoIYt6LacB
         WRDqsAkcufqJiQQs+5XIy/ET45is/SzMqe7qepStf02Wq8xRI5W/gN+L7WNwMafn6wcF
         HyyJ+/ZPU/GzikCd4Ehp7jUY9Ki+eYKchYPJKfugshT/xEoBWbeURB+DNgDN8w5sUvZk
         mSYpawiB5rCCR4oltgU7FFiDajCP2irSlcwW2IvIoC8T4TctBq43t7oIGC5drUFVKaOS
         ZyMA==
X-Forwarded-Encrypted: i=1; AJvYcCXvag5me3eOOibxas3423ZFOrR/+FdZ+p7lKgj3drkow28d2WE/CQgxqGxNxHlqq8TPAmSkC5pmFsQk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36+473ghCl79j7/7KdGHKD/HAn/sfsaZkbWRQgWH2fGzCHV5z
	eRdxKuzurx29t5V5M1UfY/MlfnifVTsJfWD9sdbXKpp8CiQoLT0dj/3d7VvKjwuiObc=
X-Gm-Gg: ASbGnctMTw91X9xoWT8iKS3whSQx0kLhisT/eURoIgZ5fJ49Y41RUZhbb2bIG1wQ1lE
	/eQn57jQU3PeAo2BN70gbt99t9XXq4/eCHyhmL94y3fhnbY7eYZunPMpts8r5jtR8ZIomi+7jw8
	uRS027Ovyp7I69t5SxBUBxZF6+ZCrIYoL2xGNM8uCdo27hjSRlwoWMw2jJ7U5PjV2mkLdKHqyEQ
	0SVrQAIxLJH0RSVjuiHRTnrYkFZqW8gQhipd2UMFD3IzwXKCTUZ7Pessf6Zi3CHArSknjvkumqd
	TKCjG90Mr9BC0PthBpBw/te5EhdBz4ZTHkn2TREbD4YFOhbnwAoQlOgiKVWf8LKjbzkLT9/JRfX
	CXhTFN1kf+MSui4lOZoOiOlTImUWgVfczVdtu7MCclnx6NBacLHhJCSnHpix2nD/1lbku/NAqSv
	z8Qzsw34bJLatcjVw/tvxUJBN5ZDHzOXaXGs4ObPjOUOXhvA8bO5DfiRPYhvZVu9lRExCWDUZll
	+IwNdd//w==
X-Google-Smtp-Source: AGHT+IEZSSPtpeal08mT4JDkWnZNl6emyDrDOdTdmyu1o0WbaEe+XhWXtXX8M4p/UGGBXNH33FFv6g==
X-Received: by 2002:a17:907:6e8f:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b72e056cc6dmr966964766b.43.1762802940115;
        Mon, 10 Nov 2025 11:29:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:28:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:44 +0000
Subject: [PATCH v4 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-1-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -75,7 +75,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -84,7 +84,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.51.2.1041.gc1ab5b90ca-goog


