Return-Path: <linux-gpio+bounces-11884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0929AD7BE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560111F25295
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA612003DF;
	Wed, 23 Oct 2024 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws2AOFws"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523EF1FE100;
	Wed, 23 Oct 2024 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723042; cv=none; b=WcfJIa5Pqv7Z+hs03noOo3Nvv+9n2bxBroklZrCJeZBDd9hierWe10IhmORU/7wDI4x0xWFlc5NLYgKjw58qy0Ril0+fWA+Dfu8+LEdQMpIVp345+qM211Oy9F9Pc4AReeWi/sEADuiDPAY+JveLF6XYykwI3c+0Jz6vc0cKoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723042; c=relaxed/simple;
	bh=7H6VJtJFgWBJwnqC87mXAK1t9DhYQWbUHewXwVI/pEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9ltBswGp8bWuWk3azvtb2KGGTyd/71gL06skeTNdOTo/IqgNwhLwH3Gy+9Nwfqf5PYKGzV1VcdePT6QwlucbUYG1oGNXvYzx8Cj9Xf+4KfKmRk+Iaq5zoxBeOg5PzKA/yq3wvTKtNY3nByhU6kp8dR6IBwZvOn4MmP6MYcPN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws2AOFws; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso332685a12.3;
        Wed, 23 Oct 2024 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723039; x=1730327839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqsIVZZa/U0N6/VUDWdRU6ufmGmH+Nhcx+B/uA68Obs=;
        b=Ws2AOFws8tBz/jwKkL0c8MtgLBeW/9LAxKiCaZiz0Du8PC6J5WtellnbpMQjJBmyYQ
         l75EZ1fnd39z9x/1pv5mYJ43xse2cm5cQmbptCbuLGTkG+q1zvhSpIBC7lz5983BLWlx
         zPSbNsyP4L+2nMI0MzflZ9ZyPPIyBqAqUDH9CKaGIMXu4ST9dqJSgEfnDVsWh4DO+bIS
         KNI7a9RCEWN6lvzXj8KEhjNl5Ph3v9+o2dGxW5n5riG2BDZ06rl+OzXnjl28FExnhM6i
         kQ+HXTAbusLbH9bz3fTn1Eo4OHLQl5bwwVUa4KGiTSG6ubXh3Vx3sf+Ed2Gc2wAEEETT
         ZFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723039; x=1730327839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqsIVZZa/U0N6/VUDWdRU6ufmGmH+Nhcx+B/uA68Obs=;
        b=mQbivz4KVidwHR+8cnvVIXi1fQWZ7QPj4EfxJeCCECDg/ToliyFFaarGMML2Kf8kH4
         oJrMuiIn79iVm4kLYWMY7DTvxnuuUq92dy1SZegldma1pAqSwucw87ylOLrcf0FZNylR
         IupocvKT96ONbhpl9aD0edE9xWbG9g9Yq/9cYjrEyQ0DsmUncxVoRi6q2zVH4cv9Sysh
         7FWQ/BznaKHAKyDQvuohuPUQglsG8K0k3Kq5l2qEfAaUoDHZ3fI3hPrOzc6MXBFwerxo
         kOfxNPi1nJkOIoSj1mOqp24EB43VXCGiEKgS1qkOyUkwLxc3/+1XS/H5xiHJYV2xG3DK
         21nw==
X-Forwarded-Encrypted: i=1; AJvYcCULgelwqvtBaWsrBuSsmBOIMvQVB5cxLjip3407bjaZkPoqwAAFyMam+L2Bw1yJgAo4nuHcetNy2HGaoLTF@vger.kernel.org, AJvYcCUkdBeZ2w2k9g3k7IuTdM/7oilyTcyYaXZIcunU7nGkhozzAkXEE82EfjhcAcA6KGnQ/r1/j6gywRvM@vger.kernel.org, AJvYcCXd/uQMa32xS0JHAsel9hCTEvvKe+nhbBnRYlONtTS/EbsER8edOovM5EXdkDUPrNSsYNM8JABEjat1Q+tfhqUXC8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcRF/YVWfWXHrDF54WI73z6Ylm/0Ro7TJMiWVtWLuncr9RixV
	sJKXi4MVI29+T2ly1Fni53JldLfqAKZ4Y7ra/y29Asqw5lJ77xBr
X-Google-Smtp-Source: AGHT+IEoQzCmWtUmspfTlIND7cTu5IdZanZZbCzIh7COe/LtmuTSwHdea/4nRvUfCfZcZ5SxWklmIg==
X-Received: by 2002:a05:6402:13cc:b0:5c5:b9bb:c65a with SMTP id 4fb4d7f45d1cf-5cb8ac2d6fbmr3132944a12.1.1729723038599;
        Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:18 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:35 +0300
Subject: [PATCH 04/12] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-4-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1084;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=7H6VJtJFgWBJwnqC87mXAK1t9DhYQWbUHewXwVI/pEw=;
 b=erQFkuiY537nV6Oskge00QJ7SJyLbWLjp1lUt6Nm7JR+k8rWGNo+DDdqiqpzjcdfDxjYE5EIZ
 a8f4+kWVObYBxotF6PFP4rax7mUZrBhtLprZ9O7ZdGo7DcSehtKE+sS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 pinctrl eint block to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


