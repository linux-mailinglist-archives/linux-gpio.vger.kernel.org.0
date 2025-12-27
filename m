Return-Path: <linux-gpio+bounces-29924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF563CDFA32
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D0113000977
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85CA32E6BA;
	Sat, 27 Dec 2025 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT7COl8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABE32E723
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838270; cv=none; b=k9fGbnL+0Z9KM29F2mIAmQNoF4V9+BNdFIeBmT8ZgWTs0IDlR69wwQtKUh4mAB54voDCDj9wnoD9RP2sR0JNXh3ai258HSQ8O5a5+9jDS1+MIBOWfA8dejEBehLj+8kJ6I5MH+eSZzxzCv9RU4ijccdB5HRqPdzgW9tsSeQ010o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838270; c=relaxed/simple;
	bh=/tB8dmlRTUO4vkh5GgVdehbK8ogjmNaFBOWomDp+6hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5Cj9atj9QPpx9/u6K82QiwEHh6bR4EjukwnxrVJ6worPX6Pn/9SeAwmQClRfU/AB20iWBPYVPW1qvhz1Q5VuB8ksX6+5QmW9yt0PCts1Nv/aIWutmpKfMKcPFz4+nq9AEsmDzc4srZJUDeAKszYXdNiBpLaA6eFJPEG2+K8Krk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kT7COl8P; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so9097652a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838267; x=1767443067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=kT7COl8PmHd00JLE9uJz44LGaWNGl76KzUAlWv+Z3ctrMo9Om9n4ZJr0ZYUZr7XUqu
         pt8bLFBZNLLxHmThCesk7e5gAQE5Jhu0Ss5DtepF796tRurfHy+yG2RML8J5SnRt3Q3r
         D8+pXbCzqfR0B4DAjCsg9rqxcZlZhnlP30Xrj6goDZe64yDiCKlByrLGRm0enzyLadQq
         zGxTQgasMQBWCE3tPpCW9EqtwfR53MBdhOaEwX5weIY0TJ2GkiLgrx7+vH8SQZIGmqeA
         09p9ZFAC9fhiDMy7dR0rMyEbS/byFYI4kQrCzcUieAoumO20sWeWa1LUzDbm4199ce75
         uGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838267; x=1767443067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=jyvc/l7kLLUPF9KE5xRtCdjOfVrW+aBV7qu5ymSDaUPIc8tu6XGShfTN9SsnjqJKOM
         vRu2A3AEdQyOm5P6byYzpLG8SV69q3KQbZc3M79pK8kSXJ5DwflVShizG8KSJ0isRWh2
         K0Ox6/jtZMCqzNwHHl0OSpc/kyO01vGtYkvefMKe8axvuErpGJO5klV0aL1HDaFMfU/N
         CP7q6Pkbgx3seq9ftdIFqsxM+DnzDOMCXDs+Qayswox6BBAZFwqo+ksMxIvKtRBLRUCs
         kqv1DoRsDfUYTTIYyr05s63Ubg90cV+h3TOgd914cLXM9lNEa3h9+nr7q7ITAUAbAlQL
         9q3A==
X-Forwarded-Encrypted: i=1; AJvYcCXtWgxvj0WW9qtjx5hFBOSFTyRBsu0jT8KdhS5WJ1M9otqXoE90G1NicWrTYM10CVxlhO/QFBtUGXD+@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZjqq6BsgQRihr6jr8WgMNzEkwEnpVewg/ZMskxZjwhHbRAmN
	i6qStNDPt1ksK34uVCum46kUkEFqk8BTpdLx5xePjCa1DdwIxIpTNLHD+o5rwNR+sG8=
X-Gm-Gg: AY/fxX7o8DlKMnzQRkRhpvF3HryXRLtVjsfp/EacJ6pkVngqQqD6UTh6tobEAk8cswX
	r1vizML24tx0ENsoi+5ccC4KqZXpR73OCn3UqnInDCshlYrK+OxIEDfv00HfGf+CgozDRWCtlos
	A86DXjhCrjPW7wblCHreiOrr9w2jy86Z9wwBbhLUBAd7U6vZ4ZxWSRLqG9Tlc+RrlIK0gGk12vq
	WCZ+0waMqV08q4hZkaaQjJ3sjcWnC44urufv85zYC6py6d7qb9bPq5Rw4cmtYmhFfk1AEVqo6KI
	S0DpO1m8ui1g5IqDqpgAYvOcZkAvxDXCXdKGO2dBTjPGomTqDguWcz6u3f7Z2AzI8QrEwPvyeY9
	7gDogrJQQi5kfHMMGl22Q4tmyJehdmaMqZw+62H7f2LYpPBGlx+nEBix8m+LdG+LrGdVLcW3C5t
	cR5ant1Da7RZUGrVwbEoCGbcd0TDTcgTJXFX8a4He8xyEchqnNr3dUPqqAeFYqQNKiTUXGgD+CN
	vW10l98FhJ3tMIP
X-Google-Smtp-Source: AGHT+IHfxIKkawssFAmJbt6V7WKCqao0Obp/Ho9JCvRAUKVxzP0PR8MNZQXegHjF1wJtOlHsDcU6Gw==
X-Received: by 2002:a05:6402:5107:b0:64b:474a:d295 with SMTP id 4fb4d7f45d1cf-64b8eb619bamr23379736a12.18.1766838266916;
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:23 +0000
Subject: [PATCH v5 01/21] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-1-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
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
2.52.0.351.gbe84eed79e-goog


