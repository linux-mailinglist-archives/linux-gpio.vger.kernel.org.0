Return-Path: <linux-gpio+bounces-21076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8EAD046D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33D53A8C8B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BCE289819;
	Fri,  6 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEyjJYcC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2519D07A
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222196; cv=none; b=rubxOOc7ow/7nefvO3U/4E1NQfOBfdVayRwMwSjmiYxE7/G6WN0Y87Bq0QBZ9VLqsw/Oie6PAxUHxaYK9fAo3Meaj7vJ6kWo+k7XnY6YI8IWohY+56jMLMPW2clXrF/R0ZMMZ+STPLT6dC3CfeCgE+NHJOED973igljgZ3sQUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222196; c=relaxed/simple;
	bh=7zSaIBi9uiibHWNuWKSeAbF5KYAWL6vX77slfEv5hbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKgooiRdW/twN3AdQ3FpGakWQ8RGUbnPX1p4Os6bKReBMnsA2kV7cfgeeOddqKJMvFwArXeQN5RBAP5u56aAozxjnKgYXQ9Mixl/XNdli9uyEncuX2lUWgi4IBnvLdtx12HrckNDL/Ob9OgBPV1eSlCXkjkOCkby1anI4OddmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEyjJYcC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so2763751a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222192; x=1749826992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCcZVL4U6ihTDzJ3VSPWudzlRqrxb23wPEKhLKoBA2s=;
        b=XEyjJYcCTUYSK6t2VRjMkTZj4v/Fg387qtOZ1N0NIpeHij3ULMSdoqfDpS/OxhfY5X
         crpQrHELA/1N0LZNfPkutklv1QgDvl9qVKupzTTbqV3qppWeWlvMlgnpVGbUvsh/r0Z6
         9FxjgyyAvdgWIHZ8nZWUVP4HhS2aGiCYUJopyRuSbtW2AL/Sueat+vEkJMQJUj1pYGs7
         +KT9zkK9pbIYa2oRgC/fcoaX3ty1JClXJPbGCZ658+dFz0xl+1+3RRgZ5eCkfpVu6NW+
         0WgUcOqLL+sPdZppvBCyH0PQUQOmsMrhy6vQUXcALK+BLb7JpKRCuhFD//QaaRCBX2fY
         di1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222192; x=1749826992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCcZVL4U6ihTDzJ3VSPWudzlRqrxb23wPEKhLKoBA2s=;
        b=eXMnjn3nxIQQNBaPm14JDBC1TmalipmQ1AaqHq2A5t2hp9NcjUuAB3bMX5GEyCq3rR
         lfzR6XGWh95uOxS5izoMiWVkddhoz+7oKVavpp1Ra6lug+wdGQpz3Z43gs1H/ng0tzZq
         YAsVCvUKR+nkF3Gt0/3c2L6n1M+kVasgUMJ4/NHZM3J4z6vdKw31OiMkqvRRqNxqQD9l
         kSGTZ4BmoC7cq0d1GP6WMusFtNcJNq/GAqoewGZCEdcAJzF9Nn7fuyGDZOrlG6r3OcU7
         ffYUKNrYyWMYucaic2MnWuVHgcWkKOc+3yQxqtTjZyUc6O6Z2BTkC3YglQMT04PbcpY9
         4LCA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMXFl/TiA0KdEF8QaQI9J/jmv/qyOIMCYSgU2EpKaKrhVO4FM6RNwnbRh7DuBbzJ59ppoKPaOdH0k@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SDITUr8upPV0FBkikQ1cBnAEom9wHz2VGc9/62k5eA0DX9gh
	dlb+O913C200On4RVi1n0NPzpZB9SSGpqUOS5MMTY0XFzKhbq/uJs2uD4s21vXNkxlw=
X-Gm-Gg: ASbGncu6yecAA5t+a3odYxmpsfz+t+LAAMZ+ipdJbpk6b4eEHSsQjFwpUvOTA78GxZN
	fYBeqQDQX3Hy6mUEKtrDNyiP5dRfpjMOVlNaeMxPkhvGuXLNK4nGqLt8f/bqPFhRWXkCLmMNNbY
	8LZZcONwqE2Uga6jAdP+r2Gf0zDquKjjwtFayxcfKfKw5doUvn+Ml8jY/eoRcMvd1QtH+NR5MZ2
	wJfIPACab++8QZEAXCcsTPL3/dV4AR7M1F+o0ub6kRSGzErjhz6uxapvcRiLIVyJ+vslOk1b6eZ
	hzvE5hHlT5Yz8VKJQS7Yj8GwSi8FKPeo3h4UhVbQ5sLl962kxJlFpWLFsyf9l7Vi6YJS+HU9hjS
	PoMRv6WwMZNx7G1EtD63PlYAhM/JeBHRIGDcs2IQ00V2o/g==
X-Google-Smtp-Source: AGHT+IF9JL8hjME8iUOhCNN7DFMjh4zd0yx4XgWB3wO5GrjhD+ZZ+DAVbctjpCTTiSCGzDKTRCksCg==
X-Received: by 2002:a17:906:c113:b0:ad8:8364:d4ab with SMTP id a640c23a62f3a-ade1aaf4eb4mr352597966b.49.1749222192110;
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:02:57 +0100
Subject: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
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
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..62a3a7dac5bd250a7f216c72f3315cd9632d93e1 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -64,7 +64,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -73,7 +73,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


