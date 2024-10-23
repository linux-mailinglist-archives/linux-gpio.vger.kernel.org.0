Return-Path: <linux-gpio+bounces-11883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145F9AD7B9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD9E1C211AC
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2A62003AA;
	Wed, 23 Oct 2024 22:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCYm3yMc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E7145B10;
	Wed, 23 Oct 2024 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723041; cv=none; b=CkzAL3geKk7N68aFE5YYAEyjOiwwm4r7DSPPCIH4g9/mNwqb1Xv1eSNlzMWXM1slXfHPN2yF9CtENsGwFkArRocAxmpWoTr2/ZhspUlx62DdNU+C0jRky/goWaraJ4VYw5th8LRe+cHd41aREZnvdp9V2HmqDwvet29H++m+EUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723041; c=relaxed/simple;
	bh=LDj646sRIM7Uye6b5RdWFtzBwFtKPZZl8lkysYdid7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LChd260X25ZDkA9DSxDnASUFt1SXic/XXsBeXc1dWtmN08aZuAd5WiR6eZyk9OjLvZC6D1s0IQeyQ2VbvG879AOeKLhcvcYKnF+T/do1oDO5Rex4Li9tqA10MC+1Iz55jzMTaUm6LFqxKKFDpCafKtyi4l984MkUb6oYOw8f7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCYm3yMc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso340855a12.1;
        Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723037; x=1730327837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qei8CZo1xxgUYcxPxXdEFDFdaNhWVZB63aMBYnQ5ovE=;
        b=cCYm3yMci9qthNZy6XJwtPHmpNLg9Gf3u2YhVUIonr1AjBx4sfutPWHlPwfMhSrsyY
         pYrZxks83QGBSGFdX9DqRW0Pzq/aqh2uo70WNop0VmMu/GTap+9O08eeszDqoLdO6NSV
         gYpRYxP6IMojlpkzI414LKRu4tjNuvgERZQTFsTuyIgVdPKStysZtq57JMV2pZ9Gt+MJ
         U0yyNJjmI/ucf+5fF94CkJNPkaDqPR0dtGkbbMw3LdD0Eo9loQMbI50xMwfVOl8E61AE
         XLJYlpdh2poG/9ElSe2IjgJ8/ZVZVOxTHeR7Nq6ruoZaFCep77VGZzDizqPHisMZ72rt
         4hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723037; x=1730327837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qei8CZo1xxgUYcxPxXdEFDFdaNhWVZB63aMBYnQ5ovE=;
        b=IVy56FKJklwoGTJeclUls3+aNkJzw366pbOSG7JRY027qAaOsmP2XFhBpvQ3KC/OUQ
         ip6YOEPVCERjiHfVFerQmACbW/wp1YSZeE0VexUXmLyfiY/Kp7BrV/K+AjeB8o8/ffHH
         noAhIUP172V3dRp4Ss0+iEeOJCRqptMl4JroLvuIPLvsvaUQ15EX7zcmS61rpwO4TFUK
         15s7QvBt2Yx1EAIhRvnPG+0R44hZ5/GsmGVYVi+g1i3miMKqYZ6/PMdlIrV0UlNbdLRX
         ux+N/y6zSUNLE6d9fAJanoaiiCfNS03pa5+VVDng1olj55fmSELmUM6qZq08q1fyCMHI
         o7qg==
X-Forwarded-Encrypted: i=1; AJvYcCWvyd8XwQ1IQeBUVIAidGErULuojZKZqaohQk9LnQuZSs7R83kG5yosKcKqx0EImcXKePfyqGAA1T9BfIN0@vger.kernel.org, AJvYcCXDO0WZD5WY1Sx9Wl5U8AvzMgboUt4sudltcS47wnLtpCAKdIJcYrVPrefaS0o/nx57BMnRwnnnx8oh@vger.kernel.org, AJvYcCXbR5EDZS3yvTJ1bK8QxphefFF4gaKjDH/YIdXH0f6IN2kTZs8HKIk8+5qrhdkmGPk9ECnIqd6Qpe79QUNh/Ghhc2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDx+2hgy4BaNvX6x0bGGceW1m4Bp5r1utxGqyYYxBILbtqrvb2
	bgeoVtjGhYZxdhy7NcBE/fMIN2+sn/zf/b4Ix8stN9aFreJcr1JW
X-Google-Smtp-Source: AGHT+IG2MlYAKZYlvMe94SbaRQkSxgeMpGIF4mteKz7fCGGulUtwUDypDLWpSOzDNJGwBfuhu3Nq7A==
X-Received: by 2002:a05:6402:2788:b0:5c9:55a8:7e86 with SMTP id 4fb4d7f45d1cf-5cb8ac7c2a8mr3706827a12.8.1729723037252;
        Wed, 23 Oct 2024 15:37:17 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:16 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:34 +0300
Subject: [PATCH 03/12] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-3-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=983;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=LDj646sRIM7Uye6b5RdWFtzBwFtKPZZl8lkysYdid7U=;
 b=kAEwpnMzOkTdaSE6neAoTeGyL1pqXstKKu3mWHnIj+Prn+7oSd5P+8qcN1ITXA5RZhJnuVEtn
 DL6spYCeW5aCQiu4WwNWXNJl631Z+tASjaRpY0AYdcJ1+E8VMM9GZfS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


