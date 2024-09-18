Return-Path: <linux-gpio+bounces-10244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDB97BBF3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 14:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF43284103
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 12:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48686189B8D;
	Wed, 18 Sep 2024 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMpMR6IU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF47188A13;
	Wed, 18 Sep 2024 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726661382; cv=none; b=XWmKiGEaZF20Y2yRA49bv1hQvP8rg9zmjsV1QzdJFmfwwUhOdQpU8OouFTh98Xc5h4zWL3p8M20j3l6L71vekQUIlfGgEA5bWwOA4OUnBTk5ruL8+wv13y+xc8nG50hmX43WyweVRNwxKvDhRwzNKtj+1JiQdPrgd4RDXlv5JCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726661382; c=relaxed/simple;
	bh=nsFuT/RPY5yKV7QFORLga2MU9fpRk8MVuxk4nfNTF+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/pjldC5TavPj9crr/ge5eja3ihgodUeHZ2A6W+qw2xusRroWHgePpWT58kEzXYyj/9iCFnY86Zduiy9CHEeACG8uZr0w44dSM7///vto2RSSK3mDYClsGQTL4xXzm5bsnsnOfOjhyymAyROg96N5/Umv+Y+YkHp1YrTU2VUTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMpMR6IU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso1054880866b.0;
        Wed, 18 Sep 2024 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726661379; x=1727266179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilSPXGtdAFeqeh3roNI3Fv/3uj9DqjQnpz8zlgqT+jE=;
        b=UMpMR6IUl3eXBRoIohlpEhPuDd0KINHulD44ifB1Lw7qem3LeUcsGxgSdlo3gEajnK
         bhgwaEyMIcwDv3WEguIqnrKzpkqRpMeWLcrJqIWqLlBfSN9m1fmiErtZvi8ryZHHN/4J
         to6bvdCveHq4EuqH7wwH3ewMuSbX+dg2y3Teol5Vd40Zv5xvgMsoFufVpGKsNGHPjv4J
         FGOqNhrf4qaI9aJz1iS/mn8wHHwYxEeme40qLT9mR+epzd1KmYNBKZwMsBLRE75TCWhZ
         wx28KYb8NPR0YtbQaNHj/A1TEVS2cCEWOH7aOcnFsSODPmRqEpKysNHKiqoOvRBaibZw
         pHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726661379; x=1727266179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilSPXGtdAFeqeh3roNI3Fv/3uj9DqjQnpz8zlgqT+jE=;
        b=WXhEcUgUqb7uR4K6nAcWpp7iDdYtRi7UDINpulkkDNqKR9cNFDQOSU/VFSBvtatvNG
         cwUKdgOdTSrYvZeohgtcLZFLH9Z+37m8E2OE+ZLjK44TwW6pslbh8ZqOcw9X5f1tNrL5
         TfiOrwtw21ZzYmOu+IqnizHXsFTGuqvV7r5ZlJV2ow8l8oAnls2MyGlJ4mrGufEEXPPd
         JSCMrKHcT1Wd2mJk6AyxuOVpkIwIiOKSNFPhYL+gY9JX9Am1klpRMB0HFG/0/YOLfV7/
         Xi37okdNv3D3rly11YXMgO7EeLeftnrGU9pKFxuCgmCLpKs4nKp6lalG2n5h/RfKHnoS
         9SQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJWvGLF8xN+qE/UKXAO4PYA+BlSYLlLeBPORp7QnMQv5u+7QvwTtKC1FF9EajZ5c/PINcNIU9dpTcOX7Uv@vger.kernel.org, AJvYcCXQ28SBJuNti7kWYSKaHgPmmG0+L787b0s4LoVdQ1zRscqmjqCaIuFx9X3nHpdcKeQ364ydLyNKEw8J@vger.kernel.org, AJvYcCXcUAMwPKyKyBkxvCnVXG5U0y+v2zYalrZfTNzzLcHpaUgTaVqrNY+IeVUPEHV9nGmk5nF3EEA6zYMQjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/6SWp5X9GNwZXc4PEgsMry7AXwglW35iVrEGZPMLVlqv+4WK
	HWhc9R2TqtUeVN7gbL6ualevPtocNVWmJfPuV6lgrzxrfIJILLge
X-Google-Smtp-Source: AGHT+IF+P1rP0fcR8jLlXURR542fmyBz8cNaZH7lHxWKtQGiMMJNnTRqoVjPQ9fBIbAkZUxBISfI2w==
X-Received: by 2002:a17:907:d3cf:b0:a8d:5472:b591 with SMTP id a640c23a62f3a-a90294ac957mr2332249766b.5.1726661378404;
        Wed, 18 Sep 2024 05:09:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b384fsm584440366b.142.2024.09.18.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:09:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow 'input-schmitt-{enable,disable}' and 'drive-open-drain' properties
Date: Wed, 18 Sep 2024 13:09:07 +0100
Message-Id: <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}'
and 'drive-open-drain' of multiplexed pins. Update the binding
documentation to include these properties.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 56d90c8e1fa3..745794597e93 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -119,6 +119,9 @@ additionalProperties:
         bias-disable: true
         bias-pull-down: true
         bias-pull-up: true
+        input-schmitt-enable: true
+        input-schmitt-disable: true
+        drive-open-drain: true
         renesas,output-impedance:
           description:
             Output impedance for pins on the RZ/V2H(P) SoC. The value provided by this
-- 
2.34.1


