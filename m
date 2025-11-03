Return-Path: <linux-gpio+bounces-27969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35033C2DD15
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1249F4ECAE2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE2831C56A;
	Mon,  3 Nov 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHcHng2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9410296BCF
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197287; cv=none; b=e8e9rRgyKED5XE0VAU0+fO9By3VVNz4p3a5fEmhozI6nblbCbO4u/cMoYJG8CIeEohmd4LtBXp2vGRBCmYYi7wm+drsALxHAaw8aJ9G4cMAU3PxAaUsYhNj1URVdaLRzL9ZrXJ7vIe50HR67i6MeAJ10JzVSmPvO0NK3j4e3I2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197287; c=relaxed/simple;
	bh=ejj9kJsYojTy8kY0emUovee3HgANnA/sFYcyWzPbjL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZpElRBigPIyBooeHRc+Y7jQVx4H6cUKTgRbvwuAz81veGa/rYMMgYbGNXLaSED07s1H392kLaDehvEfJRZQ359Feac11hb2TdX/6MB4qAmdFWYQU69YnnaIn9E51jrkaxmqsKAMqa/WwpPlyaDU/6MBVO1AcNO1e6aQGcM09BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uHcHng2Q; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4f323cf89bso75960966b.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197284; x=1762802084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAD+8NeyQVmzpy451OsrQR3u3cBqGgc3vr3oTrRtuug=;
        b=uHcHng2QWSK+Z2p/UtkA7xpbHwoq5fAIaerhq4SwEb0/jepxhldfL5dVvQnp/18ou8
         H9hwbwD4uTBx1MynJHrlbOn1MI6u5554IKbVymh1QWQ//nhxy7HOISVRUVHZa6kNvrqD
         Gx4lSHh4EV1w5NrsjszbQyNZ0j0E/8FVDDAQGx6waNkHybbBHiRJFEVjsmaF5ZxUh51o
         UoJfr5PuF+xN6VzZWnwLU9oJwJdW6SRllhILl5tqpZrI+MIQG4L9pJent7xzl5XPRJRB
         KB+XmtJWutrNeS5GZmj7ExanfF4J2kQjv8JgHbOQobhGJQ259NrQ5cYuvKAPA9/ey6lv
         UH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197284; x=1762802084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAD+8NeyQVmzpy451OsrQR3u3cBqGgc3vr3oTrRtuug=;
        b=PDK2e3KlKIS24LaFHERNLLL+oNiRshTj4Goe8awWrmDIt5flavJ7Z1u5gaZh2i6+Xf
         CsWZuvDrg6Pxs7W8+R2VB4RRBkfJGmeRLwz0sRu/nYxyrApmW5y9gbKnwYIoAkV79qme
         aaGeE/dTKdGi3ipR8VajdcD6Cm/cI5kvKGsjGv9+GWIDJJwtgohMs+QforTrS/T71o5R
         543Tr6782KDPm6LkZD5u7fENPWqMqluuP5IH2kUM639RM/LXP47XrLA2K9MuUVJxT909
         mT33Ta4QDpB/Z9bmdKZf8k05lypigfCoTYXglGIREJf+w49ALWCABg8P49d2NNUgDY/D
         Azqw==
X-Forwarded-Encrypted: i=1; AJvYcCW8eHI8mM2RYaHAVYNrePgjZ4SnySAgKvVGVBFA/A1MeyNn654B42xKSlwjGwFm/6CaNW6EhZsCFa2f@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4NWj9OoW+RxpiAGEF7p9RFFbMKBX53AF74ieWJ6gRL0yCkjf
	bfltACTq+3IsopY/nxvXbPHpkW450m0PEatriAODH7H3v3ObPqJnUVLmigtigIiB1Uk=
X-Gm-Gg: ASbGncvK27LMU5cHA8WKs9jZ0Hh5LhvR/eJruvuseww5FNOOEzEDCaRQWs41VKf+3UM
	xqPIsKJeDH1svi8XBkUNa+oY3Yhmrx4f8hR5BQ9Dm9w4LP9s9mOauzEdmNRE6IACShjcL1XUzzc
	k7TsPmCRG7+Svtk+nTq6HhpdchnmhlR5aDySt9ITVe6n5ZmD89AZtSmPzIP0+wvgkhsoCbL1VKP
	vp3EOY/oWgUe1ZdNXlLPwLLwrpoeh1Abu5yr5iWq1MRpU+1DKUu2EzN1V4uyW1k7LfEKaX2n11V
	0TCqyKZJBCii3CfdZks7fgWWTYyKHWbGsGJEHOM3St7Ax0hoqk/Icgt9XSoEQrr4uhghOi6T/j8
	F7ng7Q0Q691PsNzWiwcPCVg+IfL5sbGHKDM9vpaKjsnfWSKBfAZYf3RdNsyS5YLcF9WIIvG0VBE
	cr2jpQ37STOp6bgKeYS5Y1SVhcnhfP5KhtLIv3lmMExhByNyrHYB9gPKql6r/iO/pv/G04l3I=
X-Google-Smtp-Source: AGHT+IH1Jz8fqW76WNvYz44wUTW1tTql//vRV5mtFjB41+gy5qQDi25+8ZqrUFo6A5byoIUzomDssQ==
X-Received: by 2002:a17:907:5ce:b0:b6d:5c4e:b0b8 with SMTP id a640c23a62f3a-b70700ad41dmr1309354266b.8.1762197283933;
        Mon, 03 Nov 2025 11:14:43 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:40 +0000
Subject: [PATCH v3 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-1-b8b96b79e058@linaro.org>
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
2.51.2.997.g839fc31de9-goog


