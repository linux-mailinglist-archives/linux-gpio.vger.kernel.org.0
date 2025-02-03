Return-Path: <linux-gpio+bounces-15278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9167A25AD4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A053D1881AA0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E132054E6;
	Mon,  3 Feb 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XwrxOqnY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E6204F92
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589138; cv=none; b=LfQqOeEPVD+t15NC0Jo1EtZw6Kvpo6+66ueuyFWUt4MHmkHXUMJcLWE+4j91b+w+aXMX9z6T0EPsPSCVp1K3vmKXVAdSb1DCL7rswWApFeH3kmR5JPi8aBPqxKFvyyPHLxouIVXc7GNN7ajN2/kVOs63/vDiOS9AmnDB+KFTZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589138; c=relaxed/simple;
	bh=Tor6qj69SSb4zvDUUMGrgoHgmRohGya5T1ZjsNNoOBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXNUYWAIwKXv5Wku7MeuAkFiEClc77BNAw0vAcJK7nWieAVOCMm3ay2triR64RdiRa8X7EWGrodR3flpeldxGNiKsrkuzC/qfurA3rHKsKG6boCnHB4Y87nAcoMkDenAd1mmlInLF6PJx9mcMUk6t3YYdlngQcp88RFTqaQ1eY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XwrxOqnY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d6d5765so2293895f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 05:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738589135; x=1739193935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaX4goUJS0iDcSBlV5ZbgrC/UJQV8weq21qNGLlTs2M=;
        b=XwrxOqnYXtc2oETxkGiLJ5dw493UOZJKW3JcNmfHTQ1gX7BRXF6r5we5+udG7oOG/7
         z7M8rPpnF32ncu9ua4bg/g+jYbtKWgcu3LcLeM8uhZO38D+L00CjmCcSmdLnTmk1V/OC
         Kql7hrYyr3qDizA0hSY0zTM9dXHMM9xAXbu9jmf3xAqCw/k+cGx57cQNuG1BqsynHaNW
         FXQvl74l+89iTvMGr/BKUftmsWV5A1GXWpzWW4DOOFGhLW5O+HUD6e4RoA1c4qWdcOh3
         DJD4YxfX7yNNVaEDl22u53JuqDNMafrZLTOINbT8+yqPKPz3Oms05ihc8oGSL8U696Ep
         wNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589135; x=1739193935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaX4goUJS0iDcSBlV5ZbgrC/UJQV8weq21qNGLlTs2M=;
        b=hK3vNoOOkRwHRdIu6VfHGHnSdhrPZXWHD6graGxNjgSr0CFktUcZADyaOYC0jHvCID
         Og1qOuJvqKMC3wpiloD5M6Wm+aCu1dQlNQ464vCgss4tfaa4xPP0NpSK+2oCdj58cLJQ
         RHDasWRXcJV2UlaF5ZZIG4+LG8/jQOLw1C3f9Mgo6T6sCbu8fEx1stNbeufvaFLuXG80
         rARBRBykQjccbj8ej9TcHvNAQMy3cCNarW8Ed47G7mfpSzIa/SQ7n47nn7iLCqsGl4Aq
         7OfkdvHgYWlcF5KpE3zP+bckTT7Dq0VVWB00ZN4L6lrvg00eIok2yo9tAmuYh1veJnX7
         79ag==
X-Forwarded-Encrypted: i=1; AJvYcCVRMUQKDWNbR59A7e4kbTACLK7cV76EgtO/5aupQw1nluXVGD3r1vf0QdtRw9Nutaihr8B1dCZd0/5G@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUSR/kv/uD6csFZlwNtGTyVHtexMcfW2KZ9wB1WT5TWv9Yc0F
	WDamIAMVKap3iqi0M3dhX8aBMu3TxQKXyNMVz06oyVIZpB0+lumYXGClBuRXsmU=
X-Gm-Gg: ASbGncuaxCbfHaU6ZVG/NgnOW3qZAbahnZydHKduPf1lrG+Z/u57qrA57xc0IMvFgw0
	qrBDbCavnty2HOgQZnktdd89xavLK9LFK6NauN+ZPpMGkuBGY0oJY1bEMJX8qc2nxt/WSilxxPx
	Bv++WcYxzJvx0AjuwnVZc3iNopTfyO6Wx7ojaLKPxjL3paLnqDIsVc699XTQCqB/E5q+3gPKSN3
	6FUgrQPRXJZwNESmbNYxeYJNRR7rNkQ1gX8i34HgjUb9jqt3GCZlrI3n1rQ/Obid5V3o8m9AGdr
	8Wii9G4=
X-Google-Smtp-Source: AGHT+IHd/XY1sOx/5b/kOx+tWNCMFilOt+8n2R7RfT2cepcig1efagBJZNv9ov4+zhelyJx9G4sZfA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id ffacd0b85a97d-38c520bdb45mr13487897f8f.46.1738589135182;
        Mon, 03 Feb 2025 05:25:35 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm12913959f8f.62.2025.02.03.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:25:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Feb 2025 14:25:05 +0100
Subject: [PATCH libgpiod 3/3] bindings: rust: tests: disable device before
 dropping the resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-fix-gpiosim-in-bindings-v1-3-d2c9e0f3a29d@linaro.org>
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
In-Reply-To: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=heV+eKo9ALYrgQHjyeT7x/JG9jmQLXU7bKVTFi93ugE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnoMPLRu+2Vy84juVjWM9aHNrkWzgFhTjGE5BXM
 dpa7oUIF6CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6DDywAKCRARpy6gFHHX
 ckpIEAC/Hw6UXPRT0WeRsv5f+04VAaLtK1w9IlIcla/d5eMI8YcQy3a7NRE5/PnNJ/ksaxzVafx
 Y450LsqbJzTm5G/w/icLU22dZ47ZS6ME2JiKmIKNJlRE9tzy2jtyRaF9irzYryxXNXhXu/GLc3u
 mEUBy6eZfTcD44dDtwA1Xmo4QvUV7ib3oPa08UiPeP9ggI6RtqvWJjrWVCXN4fxh1UQUj53CwvB
 wsMAyytKbfanIKssi73++lILzAVz7vv3ILmXUXukGyzg+s2i12d4yRN2p9R52PR64LJDWnqAY+a
 WjOs6WbYTHYQl/JzTt4qDIDWzS6IxG765O/tiGtt212Mn19houL4DoEEVu6COItR2gfA6Wztb3V
 bOS49t49nI2UMrzUvyLUomMfYTlivky2Z1QrL/inTYPfRrpFaowoN80bhblaMKVT/qY6P7pyw4D
 FZ9t83Lg3rGBBXQc3qTDZsf4vc5aOaH2dIYR+wbaMymMkvo/Fla1eanJSLplvCWkEsuOdNapIT2
 NQrVMiIPNvBBIzabEMg6YpN0nmfvCxGZS1cKvsB2XkXN7vAuHfRIFOsE8O/FpiDZrkHnDDBn8Bh
 Kc4uayQ50pg4kntT9zilrHuvsFbAN9xfFX3yau5lEJJAc3pQZYFo21Vt8okRNXBl6J9c3M9D7zh
 Mzi7N/8thjehJKA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") uncovered an issue in Rust bindings
tests where the GPIO simulator device is not disabled before removing its
configfs entries. Implenent Drop for the Sim struct in order to disable
the simulator first before dropping its bank and device objects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/src/sim.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 71b9453..e3cc95c 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -328,3 +328,9 @@ impl Sim {
         self.dev.disable()
     }
 }
+
+impl Drop for Sim {
+    fn drop(&mut self) {
+        self.dev.disable().unwrap()
+    }
+}

-- 
2.45.2


