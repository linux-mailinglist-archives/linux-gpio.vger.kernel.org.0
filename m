Return-Path: <linux-gpio+bounces-27979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38346C2DD81
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E2C14EEC8B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EBA32570F;
	Mon,  3 Nov 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggpNOXEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D1C320CCC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197296; cv=none; b=GAWtslch/5PsXwa/QOe5NzvNEGm78eJ0r/PIObTfpQiKPOCIuwk2DRXqamPiZlDgy3T6md3vBfBmuP2bas2XiacO6h7zN9pKsACAKB3Qys2lZTwx2I454CqiG/h+79Xyucu0im+FzPH9UQbbVPpCPynQ2yZU8RO9f9zjHZmHyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197296; c=relaxed/simple;
	bh=BzOY7xFqFUUnN3PD+Nik686oui3xmNMlf7Dt/c4aSB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uv6u/9OqxOfkVaRfie3I9cfuDOTNSvHbaCSN72tW/Uoh43EF4q6D5ePz5rfpG5Kx/9bEwhi6p3eh9tvJZ5YioAXZSMtbPJKS6Gzs1lWg5O02ND42yC+tqDR1Z5wgpZrhWbc/yVtxb3aAuYnLJ0RuW9RMykodERm0zg9gwGzB2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggpNOXEC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso1181152666b.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197288; x=1762802088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+H9s1G6YtgeqluWZseo7SuZhZNZyldAYEc85O7etNJ0=;
        b=ggpNOXECDGMlgIwPSzOb8a8yxZJSFajxHfelynNZzMdhgK7O+DPMqu4gpRd0KYqvEE
         LBJ6yBg/WUXKYJsdj4JRHSmnDkdbjN+OAbQ6MI5qnlQ1eT26KXWyMt8UVWrocqjvLwap
         jnH5wPh+9HeR3w3pLbqtvyYR5xmZfmSuirbD26TGd+Etd6I7HMmlkdI3D/KBTp/ril/U
         MYtF7DRdI8WkEi2VmURQDklA+Jk3zfg6nyZiGNibHJp5udV7YdRA30+5WY7H61YmtZl5
         D+2t+5+BaXxG7gqH1ZGkdtTNjcZGb0/EKR0007qCrRo1Oc3ikzlP5rx/JfBupJaY5/QU
         +e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197288; x=1762802088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H9s1G6YtgeqluWZseo7SuZhZNZyldAYEc85O7etNJ0=;
        b=Sv3s+I5lT3NbY9unfsCvJXNImDbBShU/mmsfvt0YNwBiQxzHjcrgY/Hr6u6Vnmfq9D
         /tTqUliMMndCrl9y/fqstxQAgDfwdLG9zhTpY7JflHh6kZT6oiD6DP2a+2VORFM3NbdH
         IA+/gPiLziWj9qoMpBgwfEgIAzj6jlb9wLpi+DRGy1laZhU9sdBSAuMcxa8K6bhim88f
         FLH5oyz1zhFgkP6WCJcvRRSt8NPAF+wp4MVZ8n1oNEym0gp3sInYRt8F1SbQG7P4rRVu
         VCGdKZ1v7cbdKOsIdOPAuQnPvR2GKLlP5NhmbBk5Bkdr17OhtTGI/urZX/2b8pStkyDL
         ScKA==
X-Forwarded-Encrypted: i=1; AJvYcCX7llqxtPmXnAWvS6AGXhjz7pexCXGTC+Xlj1dQfCkzh8xP602FS6kkc7EVXTSNRLMTKrlkgNfwIkFC@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2Bj/7UOvyp/nrvbYH0WU0XiXyZeQhuSbn4FFjUIrKDnjLBOR
	mJsga6QU/frS+A1EPfcwfSm3DBEAVLvjSy263tACWxuTKPDPFcJqoXKemL/0aPwNym8=
X-Gm-Gg: ASbGncsduPtit21HZynJWonX+zSo+djhzMAbguhyGZuZYweMNfEl0SsrgfgwfAAETZi
	K2V4bzBn3/ZhPTCnCEzZLKxVV35bIDUWwfAnh432Yhl0OtkmozYgsga4EE5TRuVr7FN0rMHj9gP
	cFRd55LjXfDBsvKGyjPtTHrZLucAUDwKOKDrbzW6yMUc8ANWo42Cl79OswhFua57tES45Kpamd7
	JSV1cnIH2VuUpxRNzwPl9PW+t3EAC9LRgAU9QWKtvxVRbnD2dfXayo7FAydtMSfKeA/GTZc/eVJ
	YMat4zE6eOamFegXkoMDnn5Vve4uwhH5FZJSm8IpN3SZSkYTgH6OaHLPJn7BGS2vj1qhpS5r8gb
	tVjKdWjZFtHQt2jOI9hgoLjPvP0/KCVdiZI54nBM3xdsF9DIrBTkwDdNcIc/nyi5+in0Bz37f3d
	QAeJt6P3wbfaCX1In1pkEavTcL4U8GeF/5/rnniurqhBOBHgPs4QrHpVGTdMxfLyve6bFNEKE=
X-Google-Smtp-Source: AGHT+IHrMiuYLZd0vMCvo+Ek4nTQVztiZC07CKVGfY4NotHksO5aFELwrIdhsXO+9Y0y3M22E4+puQ==
X-Received: by 2002:a17:906:dc92:b0:b3e:c99b:c77f with SMTP id a640c23a62f3a-b7217387225mr57792566b.24.1762197288276;
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:49 +0000
Subject: [PATCH v3 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-10-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
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

REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
allows a more natural declaration of a voltage range for a regulator,
in that it expects the minimum and maximum values as voltages rather
than as selectors.

Using voltages arguably makes this macro easier to use by drivers and
code using it can become easier to read compared to
REGULATOR_LINEAR_RANGE.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
While this commit doesn't introduce any users, the upcoming s2mpg10 and
s2mpg11 drivers are using it.

v3:
- new patch
---
 include/linux/regulator/driver.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 978cf593b6624228fe1fd9c2a3e186b53ef172f8..977755db64c6dfaea7246067eab0d9a2971caa01 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -53,6 +53,11 @@ enum regulator_detection_severity {
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 	LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)
 
+/* Initialize struct linear_range using voltages, not selectors */
+#define REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+	LINEAR_RANGE(_min_uV, ((_min_uV) - (_offs_uV)) / (_step_uV),	\
+		     ((_max_uV) - (_offs_uV)) / (_step_uV), _step_uV)
+
 /**
  * struct regulator_ops - regulator operations.
  *

-- 
2.51.2.997.g839fc31de9-goog


