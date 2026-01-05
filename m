Return-Path: <linux-gpio+bounces-30125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D0CF2991
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2C830590CB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DAD32D431;
	Mon,  5 Jan 2026 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeILhTjT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAB32B991
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603712; cv=none; b=OirnlcsBfWBFec8gnkFD8bx0u/ks1P3LPlrxAhrvzAWW0RMKXiYnT6Bo9rj/kpjWGznhV9W5x5jD9qspgFCXjRdKFgYKnhcE1J9T/lsofxzgrF22YDfNIpv+Bs4rJ7Yw2OUzFEMXZfgv1f79AHEE7byilufJ3p3M4BiBOFukKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603712; c=relaxed/simple;
	bh=/tB8dmlRTUO4vkh5GgVdehbK8ogjmNaFBOWomDp+6hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpvgyEXQDE4S6ImJqFWQzLIdf6ns6M5rd74yL7qA+cmzrbnAyJQo8XR3D0lvHt0tXXoRuC79uQuEi1tw0ZBO6/ts0iE+3kWlEkMkiS5w3jlCgfFpN1H3CzZTABuQNvQgRKxYBc6YHRL7wJM+9xOYcvn7vMCmMpsjcOd8jINayHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xeILhTjT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so3391329966b.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603705; x=1768208505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=xeILhTjTnEITvwcysj5y7P+xrKFkYsEnvHDs9SvrN1dzIV/OkLhuErzsKWIB4XsyW+
         YBdUh+uIGk3qrQtowNfkPggYQE7WGIpKtJSLMlJ5TZ0auGqZZRUcaJKgTMP6yJR+ohit
         rmoINV0k51Nq19zcgb1TKtEoP46EGIUA72Ut2+/0LX/Wsax31VhnSFX2HZdXryxBrcQt
         udRhKhXlZFdIqTiy7E69N/nmkke7mxuhj9/dGZmn1yFf0UjwFCFsRU/4YwxzvI/Bv43A
         9NxsIHQctgMzMdYpfrdsemFhFw4YbGIFyv2GMXFT4DbvJjOPP5Q1zSBfGE0I+iJ+jS57
         pvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603705; x=1768208505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcAewfHh0ra+es5CHo0kMIivfjkLmLaLZDMh7cCTg/g=;
        b=kbbr92JrIeg2Hc5XdWxXZwB4gwP+BRL8X2wnNV7Uhq8IxBWIPYMrwY3XEVsLWWLatb
         ocBVY6cib6XQy3lWN63e9RyBQCDN0ZjNHw7pQEXlcgT8vaAkS+XE12aIIFR6IOU4qiI2
         WbHY1VbFiUslu1Lq+NQRJc/t68vj+/AA60a9J81QnEqpg9pjHMru6fgdCWKxBYoiI3rY
         Tcy2ylfQuairJwHgRnvrIVaXhcswVeuqNn9GOCiSS+swPMqk8dQ4jKfYjZJb4AQqai2M
         ROB+eutv4jPhI9YKaIXVWeqkdj6bHon7yiw1bWoFUrLwBV7nzhA+tXkzD6u9ZPKvRQ3e
         gZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTc/1aYMZP3qr7E3oaLG2k9tb/Y+cssn2KcN33uMiUDHDj0bcFGO3audHEpWwFR5NcCB7wheiHFISX@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAmyYAk8TZB2oIui/i/gE8o/Bz49XKfObd5VwjjnPT0M72nTE
	P/eItvl26i8fCwz1MX6jwX1bU0LB4PUxJYiewaNNCRuA+FKao1bQrTKtJ8cp73vKar4=
X-Gm-Gg: AY/fxX7EdbE4Kzch+K34wnc8Gp6k0eD/cj7Ks2mwwyrwvZ3vqKDwEubkLvndGw845t4
	d9nri0iqfd6t8G9gtoN6mssMska+oHNjK3EZ+GOR4ZE4VDwUO28ptFh4LA4wasK7ZzFgTrg8MvR
	yiUwYGub7hgZUAjortssaxNY/AkFAt6JDsEszY6vVJbr69F8btPk1dgWeMiSA6LTREZyRYulC1P
	5J1dl/7S1EF/eBxd9ff6gOJaQgEHNJU2Xh8WZ89EqU8ZP8dhbkKcnj4yIb77dE4BPe3YY0j2gyk
	flURu6oE199d/I6oV+HkDhZsxyQI7ZZYl5t+2kgD4B96+Bf3rlOoDlmh7r0nbRW1ZMP+VKqngTJ
	I8WOBiC6sDED/X8zXL4xprkuVIRcPnha0q+k5uheG4Zt2hQy6jPJ55YVhF5QMhlMIX0YcdWZMJx
	rtsGATLxETqyLeAeUaVqLjgR+eIeQ/tpCAekv5mgt1G/9t1Wk3fVBQ3oxpKC3eD/piXhQv1bozI
	Et4SA==
X-Google-Smtp-Source: AGHT+IF/CJPT01K+lN7oSi7PevRwGsCCriwWOuhAB/HKhWPK5/pKnCMo9T9pQaKGATPI5BY11XjZrg==
X-Received: by 2002:a17:907:2d28:b0:b6d:9576:3890 with SMTP id a640c23a62f3a-b8037193c4amr4758339566b.45.1767603700764;
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:37 +0000
Subject: [PATCH v6 01/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-1-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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


