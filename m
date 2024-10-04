Return-Path: <linux-gpio+bounces-10839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01363990316
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC521C218AB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E591D415F;
	Fri,  4 Oct 2024 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2xEE+HV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C451D271C;
	Fri,  4 Oct 2024 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728045435; cv=none; b=N29cvEqP8RF5x84WSJ7IWSJRoErzqG71CCpGoBzjFExntB2u5xhEuDm9Ur5Avi0JKBSBmqRIQPYPfptLUKYvjZkogpCQbk0kNbtazpMdXZIbcv7JQyZFPP7qThELU/3JlxE47U1tzaXmscJfFKniutpHQA3FqCKzaDxK6r4noWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728045435; c=relaxed/simple;
	bh=iDa4q0EGy+SOCPsH7APipW+rwuIfD0+r8FuA8LgXyk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tImLyZT5u6WxOp5tpjp9TzW1VIm4O5W83u7USsG0Bl5tBWBkiugVSCqi1ia2HKxJBDKPfTC+++qzuS55FDsYJtkdvQ0lV39913zHL0Hm1dfHZxCMeTWQexp+VcTLT+7mFksBmJKjebiCc/HO9T+dQoar47wDFduUK1K71aXcFF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2xEE+HV; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d3cde1103so268708466b.2;
        Fri, 04 Oct 2024 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728045432; x=1728650232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHNka6klozf6Nlp3gQ5Dw96SnP2dpYHmui1gZbUUuHI=;
        b=M2xEE+HVL3GJIPg4icEzbJXFArYPz9yIzjw+2MNcvYBqoAEpR9MMl8b/Y7nWmdQ4mG
         NEqm83OObdnKBPxTkj/mGuViI1Nmqhayij8uqXXfad6r7MqRuS+LEoCeL9Y8FkO+1UNz
         jBnMG3g/38jOz5c3Ihb40g7wFDMEl1dAKqFOoezCvliEXgvmrF4QXuuDDPfA3b3wmS64
         P/PPTJ+72eAgsgByLuytcVkeBK3Hz4t1JamzxB44kmLV3Yowz2bD6T+4y+geDi3V/6M0
         M742/8IDaPr/0JSp6qOzs8VK4s+oRbgjBe2JGtfBJ6S3SF2tVLWbmybYJEcKhWfKK3J4
         Hu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728045432; x=1728650232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHNka6klozf6Nlp3gQ5Dw96SnP2dpYHmui1gZbUUuHI=;
        b=ScyaSnWGv/b0N0CC/ecEpiacK0Ugl+h81hNmfuHqojxxkUg3uEKtyoxD3r3GUw7EuP
         09F0I4EHOF7hEKaGcswg2/tEeY7jhl1xvyKaxWrIb0zuLVJMRDRte4h/j5EeNvGma9wv
         N8PI2Czw7Yl89gVBtcisFMoU41ZASTEgXjIE/aTT+V2SJ45Mga+63TDXpOryRX1b7QPO
         jxS3U51QREXvrw5jBg27EKFcKzMYjXDBgGniuw7WmlDAkB9HIIwGTZzCzXc26W6YoRm8
         Kq0VR1mmEYg7JPGhPFrsl18RQEVxmD7ZTALoUt3k18fKQc8l2VxegYj5chy4/Xt4nh3C
         0Q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCURnmgscBZ5TbLbLOPaNaZofHAxoMb94Z0yy+0baP5FHljIBhMlLrJs16FN0yxiRbEah8Ree7pV7HS+IPGtWfEeqXg=@vger.kernel.org, AJvYcCWVbIrFvq32Bj62Gwh7YfP9E3iDk2ayyFPkkCY+99K+ZoXTyIRdo9twfV/NQUjF9+xPaDcITJsvEqgD@vger.kernel.org, AJvYcCXAKtfU+perE17FYsvhrfC/ZAwhQplZE1ysMsgPiHhl0lqGGGJuvNtSQv8jyvRlWT8mmK9GiC6V1eqbNvO4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGg2Z0s/lv94xjMBRgJEbEiQKZwmoC7ghkI8MGnXWBJJQkgV0
	FVopmnyvbi5mLj/vynzhT49sjeX/6PV0aG1lVT4pmq2gvb3wzpVTISjMdg==
X-Google-Smtp-Source: AGHT+IGmgImN/5525gLT2kNV35K/3qFRa9LF8GZwEMOHSYlTb39Sdf2SmRsNsx8wg+Sd8XsboaEfcA==
X-Received: by 2002:a17:907:3d8d:b0:a8d:1284:6de5 with SMTP id a640c23a62f3a-a991bd3fc29mr269025466b.14.1728045432054;
        Fri, 04 Oct 2024 05:37:12 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910285ad0sm221601166b.34.2024.10.04.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:37:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow schmitt and open drain properties
Date: Fri,  4 Oct 2024 13:36:56 +0100
Message-ID: <20241004123658.764557-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}'
, 'drive-open-drain' and 'drive-push-pull' of multiplexed pins. Update the
binding documentation to include these properties.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Rob,
I have dropped your Ack from v1 as I have updated the commit message and
included `drive-push-pull` property in v2.

Cheers, Prabhakar

v1->v2
- Added `drive-push-pull` property
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 56d90c8e1fa3..a1805b6e3f63 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -119,6 +119,10 @@ additionalProperties:
         bias-disable: true
         bias-pull-down: true
         bias-pull-up: true
+        input-schmitt-enable: true
+        input-schmitt-disable: true
+        drive-open-drain: true
+        drive-push-pull: true
         renesas,output-impedance:
           description:
             Output impedance for pins on the RZ/V2H(P) SoC. The value provided by this
-- 
2.43.0


