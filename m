Return-Path: <linux-gpio+bounces-27522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A682C00C72
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1561B3AD952
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D91230DD2F;
	Thu, 23 Oct 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="k7h6MOsa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0922D3737
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219159; cv=none; b=H/TImp8aj+BboD4QC5Ae9dFcdHRHeC2Rco5MO/nT1DiFASO/UYSYO6V2iWCGfnzrUuHvIfzKlw2HmI5drUFhAwy46xRWooyM1xbqlsuhpfpQBwoHh/kv7z2N3I8g1EZByKsn27nqprE/65fDY1DVNMiPyQLPoNDYI3EAcGGh7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219159; c=relaxed/simple;
	bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFgrHZvq2gF7sF+60g47tmskDKnCFWblri3lucbTHyDrbCnqGC9fXsC4PJSrau5s6FT9fMUCAwojAVVPOXQ6CA03gBhcE/8bnIFv4Oiq2IFZtpaZ909DJ3kK2wd0YISMCGPfZ7fWCVV+C4vMxkSNeGcJ3HAjB+CPaxjzCPOUQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=k7h6MOsa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so57197966b.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219155; x=1761823955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=k7h6MOsaOMD202hiBcaDQ0SqMtcXCNh/RCsUmN6q486K68eJwO7MJYW2g3+kBVktMj
         +mntqtWE8o7/tdXODOJW/OT317Z8ZJer1lqkZ74ke3FOWEmGUaGFo3403vFQDccmplCK
         /ZF2Z0z+LoJkFD9HxtVenwX37MShXoqH0UvxsAktcoejIkmQqsOyBNHsLgHWX2DWEiZz
         OFl3ogWByE1XBjVFtdzDU/XzoYCiXCGCS+RBKG7nYrK+TaqxdEEyEFGPHyUlnTMbam+i
         bgqk+DWQol8yjcTor+JQ16wUQnKH4lahhg/w4uT6aHNZoAecipohogGMKW7uu4r7UPOX
         nAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219155; x=1761823955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDmWPTg7/WzUkcF+6ZlKfYsF25od0Ln4c+tVV2LpT0A=;
        b=UkO9vYds2SC6cerzDlAnvNFPBtWRh7RgA4rtIKwfjw50zo+R5rKAONEUc3BElds+HU
         4nxcBaT4KVf1Q3c7yQn5aJRozfRjlme8F8J7SG/M20jetUDe2IY5wbcQt3yKOoO3FPcS
         u46Q9k4Rmj3nIYXpKq1SikEdU1yMv47sbCk1pkHM+AtHW7NG0bHdPsYBCvPQe8BP+Miv
         D83uHhMW14GvahDtNVdX21sBkJL5h4IZMG9Vwv7kOkMXC6jxer4LkLVSFpY4RSIGTbbB
         OH08U0egi4EmycvKzOBzr5vpe3b8D5YzWtWgBCTXwcjopvborQqaK3xF/MikHlBwpJ/m
         fsZg==
X-Forwarded-Encrypted: i=1; AJvYcCWc7965XkGpS/2cZsiTTbZbgzxhp7HbTxQvC93GxmHa3IbUa1M6/eMWEELa5yuHRDyQCzF9ZRIA97ym@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnvdYKwDJO8jtzufMzoCUfm1XioXUFI7tph1BZxZm6I6HzXE2
	40M3zlDwEV6j/9g7UEo05nyeyZvEDIGI0bQqHZUVvL+PIxu4gGocY7sCcCLwltFqmaw=
X-Gm-Gg: ASbGnctiytwY+W1oCK2fWnY/44zxQI2lPJ0jEeCYV5El/rH0kjDe1z1DjE5TM7S2zB2
	eeoRKn2CD3SQjBMupePCFy0FIyAtZPW0fVWUzuKxdDy6kUF/ttzSSsWB9Nx29Wpw5jjH7X0txYc
	1SEQ9Dvx4FAAUyr6CFXb0yPqGzHd9CaLT5Pq0nlCR/EO29QYLq+tMApWV4y99GotqMRWmdMLNie
	mdyjUtrPJC57NVT6tEXKkFMkv16b7Ndu8XQq3lbf2duFHr+DNQLPm3Pv6mNVKVf3mbr6raEgf2e
	ynwVjvlRRoH9P9CO7IF2cGxV2mZS3hBQYMpnk5lJmP0I4W+YBT3ItypAYYTkfOssGd0duaC3UwZ
	+BkQmuvq03Sqll6KGY5yLY1p7UJ2ux1rHU8U9CwO9QGd5z+OE9EEsOSKVoGA2i3hOFLtnqphVdD
	vUv5dfwJTeCFMiMa5n4jfgppDFKLBzhivVKOOAYdGWvbctlTXtrYZ2mwSc
X-Google-Smtp-Source: AGHT+IGyvy+vosOGhAVyW26FRy5VuLmJAby6oQyCi95CiOh6ji/6s6+Drjmz7GBaGHKaPJ1tX6zb6A==
X-Received: by 2002:a17:906:fe09:b0:b46:57fd:8443 with SMTP id a640c23a62f3a-b6d2c780045mr842584766b.24.1761219155404;
        Thu, 23 Oct 2025 04:32:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:32:25 +0200
Subject: [PATCH v3 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=888;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g+3CeFyje36vUYiPPwLlKha+0xvRznsvxy3KI+MrI2Y=;
 b=j89EwbY2JAhGXJpHxxGsH6u2oxbgZtWs6paN5vbiIuiZHuJEhqK/8I5HYQqEYX6szI52SCm3Y
 Da0QHu8QSSpD5Ppa/++qNNAHGINmzpw9AJwY/tzlF50tZIr7ncN9jqB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PM7550 Torch and Flash LED controller.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57e..05250aefd385 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,pm6150l-flash-led
           - qcom,pm660l-flash-led
+          - qcom,pm7550-flash-led
           - qcom,pm8150c-flash-led
           - qcom,pm8150l-flash-led
           - qcom,pm8350c-flash-led

-- 
2.51.1


