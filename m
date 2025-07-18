Return-Path: <linux-gpio+bounces-23481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7FDB0A73D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25AA51C8298B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598232E2660;
	Fri, 18 Jul 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6gFiAuK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592862E1C7C;
	Fri, 18 Jul 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852341; cv=none; b=LoCbXdSJHZWhzgUR+YRbmImGsz/8Qes1JkeNdGiBxeg7WeQCCS9fTc4BC5N+ckiIqYvgxsVZa+OJkyvpmTP7xbT00lQ/rv7cwbG4dOHRQ+eQI9csDsCo4uXW3i6lowVxn1BsHKb9gJ78lbsABq/xk1Q9RZvfgRp7FTYwl+wpDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852341; c=relaxed/simple;
	bh=P//8vOwQWbcKu1kVR/H3otGF8zqkQSkNHGIA2UNKsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmoUWpUUCgHyUnryDWtzSf+pffw4B/4I1BENwS8iJtlpJio4K+Pth6nAu2pD0FVlsiF3cNiPmQN0Z+NCrTPJ6nkQJuVCOhhsVS78XO5Fc2vopjZv39vpcyaG3Od5X4NJtDdgU2lS6fxo8TTyJg9OO98s0WFNanQzxzL1XJbrH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6gFiAuK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a582e09144so1213414f8f.1;
        Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852338; x=1753457138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=W6gFiAuKFcFLiNv6JRvCfSdcTuBxTK1S8FpDHmwsm24F2Gt2eoUU4vVV3HwF/EzTSq
         00Nf06KV+KNI9nKwkJFcHPKAHDhCIWsm98SCgU1r+y3wZr392Qr6wKYC3py31qx5flHh
         fOvK6brwLWx5RTG3rCsowiGm2YJ4Ze7iLpzBqgdQD/hA/YgXwSeFsHIeC+xqiHcLkUGI
         /vH2hXZIoX9yPlupHp0MaICvBOuVh0ZkfSQWWtD0mQT6X2BQO0dYto/ashQnswxVcsYn
         6vGTIg0ObYpjGerR0SWvwORR1hCdB2UbZZNZMeowUq9DG2M9MX3UrzxULJ99Y+j9CYmi
         qmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852338; x=1753457138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=vOiiCcZiDYnAoCJv/R9h1e4Kh2485pqOiVB+QLETlXg5qtJCj28kiF2niqQKuvLFfv
         E2LeGzTq37fZuwf55LG9HkGbx6K8JzZClP2iT/uyd0+AaouhlWZNqEOc6hVkdrRPDogo
         ILNVZW8s/8c5VsWu62fhEF82dGxg45w+ruwP6eGNNwtW0y28zfDu79p+FbBOtUevB1QD
         9cgLsZ4RvW2a9fJxR8rrc6XAhGo/FTXB+cZdUfEnAJBZqUkQvkmsKeJJ6cvjs8IFXkBN
         8CZSjKssW5vCGDJupFNJ4AKVzcT0He9AgmSOvvWRLh76kGBk2Do87AmiA2yaQto//eqH
         z0kw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZN76Mb2sHUrjOfHY7SZ2FzJTySdHDRbzKl6cRo+TDlVPF7bwmPZEasOwUspb+ur8bTd5GwOofRL2FQ==@vger.kernel.org, AJvYcCUC1bCxa/1NmeDMPrVrqJBgOFhKUe8VXB2AAc6znjZbDr/zXXrqseYtkjSENGhF1c7fqDp1CORchfFv@vger.kernel.org, AJvYcCVaCqMrEN0gmfVOsS4C+/GeJFTKTdg/8KXkA9FUgfnf3yTFAHbh7zyDkPnJDQEKT39JlfUWdZ8fdx0DT6Lg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92VmsGeHiftnhuMMs/fosy5FB5PPe+x7TXfZHLRAhpbKBO3jb
	v+0c+7HYg8ir4w6CICuUif5v8Q18j/npeHo1lM8fuC4VISjSYj01SlDH
X-Gm-Gg: ASbGncuc2sSa0/9djN3yGbDD1cgCtJ06h4QqBHWREfE+KSEFCTXV0TR66UJwMXWWlML
	n5EwBkGBe2nY53iAMjxixw1EiIljxJ7byoPl6Z3xSIel+KYttucE9OMynv0CEm5NcWvkKv4TP83
	+3fhmdmsFXSIKg+DYf8NSndkEsoNrrMIcSL46n0dJW0LlmlluDVSR60shXGMDGccM+vSTxarz86
	YwgMFHQSdp7GblpsSKgJogcN02m5AnVvFuW12XRQeD67Qi6XnUiD89YCpZKvI5CwpmRUZ5WiW1o
	vjTjvQBqHnJzw6RBYOJMNtDFc4rg08hBv5XyM1YJN0gFKQf3nTZpCaTC4UKTJgxwckkEsfPQrCa
	Spgdc7GPLaD4OPBjdNcsm15ByA704ZQfCkjI=
X-Google-Smtp-Source: AGHT+IE5lNwdStL5/SrBlIf6tWKMBMLK5frkUlrfnmTrecW3oIUA3xfQTspp+f9g5Mw9xcEH4CSpJg==
X-Received: by 2002:a05:6000:230b:b0:3b6:cf8:64b3 with SMTP id ffacd0b85a97d-3b60e523d6bmr9233370f8f.34.1752852337475;
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Fri, 18 Jul 2025 18:24:47 +0300
Message-ID: <20250718152500.2656391-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c3..5dcafd46344cc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.1


