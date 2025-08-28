Return-Path: <linux-gpio+bounces-25141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C0B3A887
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31CE17A741D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5C9338F51;
	Thu, 28 Aug 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K6bFcd++"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B5A322543
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403001; cv=none; b=VLG17IULhsKRIGZsAY2HSA8l64xvZMZe8FCBVSar7kiHWoD0jweq8+A0Pketow0juciEUSR7QB2TpfN+97oyEWU0puBbVnA78RUnEcA6RY2S10sNylKheXml8JqYxsu5K7HKuhtVtFFrAEoQoXbu7PLNmX7r5ePj1j/mOwW0dwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403001; c=relaxed/simple;
	bh=0yy9JBEI2UweN13/WBesixwlgsSIBVHDUKG8U5/GLWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZi3p2xxifxFp0tmG6BYqrzWNVzkf8CjANT7bh2yZNbhUaXMt9/4GsWJxDdsEXvFPx3uN60OlwZ2PLEYWN5AC4vkKbhMnFOTBXCshEYU1JOxlAKF67DYv7TB0x6yDIrSOjv2n6/eipy+g4IgSlwhlXiVVHzEhdC9LtGiVo0JsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K6bFcd++; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b6b5ccad6so7419255e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402997; x=1757007797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3KYJnNSsksOEIQTbQcansm5iR0XzdwiQBx1wudU3mU=;
        b=K6bFcd++XqaAz7bAHV5RIZwXbwzO0MJOpRfxmckoTfY1jiBtz9tzOgHt0PqhIOcu+k
         okC+VfyImI8EbKih03O0tC8axXjU3e+8UfwDTTwTOFI5dwUcx4Gfs1TnRorw7r3laZpF
         6A0BSDf1eH0XujVEmKivAnMZXT4x6kwhFzqPxIhNeVw6ofj9HCQN7MKV0iOhlex6ZsaE
         RkfPi/TMiT4N0JvU28AtuzKfX6pc+hpIRX6PHzhY6W1QHYU/VGJybEarCOaNn1KlyZi8
         Ta7NpmblcM7clCe6ccNKLXbWpmCFy7uOzfVZKDV2eLq76vM0TAcJvRl2Anc3MkUC7o0W
         TzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402997; x=1757007797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3KYJnNSsksOEIQTbQcansm5iR0XzdwiQBx1wudU3mU=;
        b=czyU3bL0TnQk311YTSfdgLdA8oowmQTHZeK9vHGKqMs5yEBXJ0pvPp/3Xg3thpoeJv
         /XnsD+0S4fUhHYaJem6kDEHs34SIL5lgVdfKYRUxiUQbplIsFFx4A8NvX3jKS9hZhcPj
         K0xnJkWiT1dzqpfLArV0515fxjC9iGOFOCOa6D5kV2eFsPu+YBNJrKXRMnYG4wZ4SHJo
         vOxoQ8O6YgbfN13MkLb46NQfqgMWI0IuCltTlYCa+KaRU70YCh5KXArdenTUZKS25cuA
         Q5B905TwD/d/cs9XmkbKNhnhjw9pHAnsqYsVs5Caz4qfG/HP+OYcZsQjUXoRw+9FSZsO
         PG8A==
X-Gm-Message-State: AOJu0YzJUoHVZJciusWyAwwFaZnR16LKCBcNjYA2+zN3/zms08yaLqLC
	MZ8bwv7B18+fyMadHCLngG4bXfojeyY3mNwP6tyuDwKaUsQay6IGFjRk5infA6r0ZsY=
X-Gm-Gg: ASbGncv/Y+jAsRenl1G1XlfIXR00fZDBYHhLiX1LDX/yLWutGe3LgbNTsgOCYxgWPHx
	jiJlOQyu1XkVGxbR/VUWp6ZUoWmRXxQtvcOaClHzDx/O66T6dJNx2yyo8TYT4HljyIEbjcFOuBO
	xzsdXkRKjpAnWT4YexVs1JAQ2TYbvDkfOUnLbPaL5LoUuvgY35Fqyfj1kFdmKGebNN22Wjhmt+h
	I5vT1EzRNtOma08QQjIRzCwqwXPgrF4sCaqBG0SDxqAYEQVm4OfQDGiSQj6VQnAYTEI7DqqumJh
	Y3V+URzfB8w27KcBR5DR8VqZH6hkiY1vwZKVD0K0ZUqM6KZthN7WFTQaVdG6jsPfGMLUShyu31H
	K/4YLhjdSqviWT3f0Ew==
X-Google-Smtp-Source: AGHT+IE1SyPRwwICMMunMQ9gbUzhiaQtCfPsmXzdO338sRR+tUohIudwnleJlH86GmwrBW0GctZ6ow==
X-Received: by 2002:a05:6000:2892:b0:3cf:3f1:acdd with SMTP id ffacd0b85a97d-3cf03f1ae0cmr420780f8f.17.1756402997580;
        Thu, 28 Aug 2025 10:43:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:08 +0200
Subject: [PATCH libgpiod v3 06/10] bindings: rust: update cc dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-6-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aA6OiEynlCnYEnILsQ1GlM9OwuPIhUOzolMX6TWtmf0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUtjNiwP6EoS9Ododik+2iEMIGg4c9roOEF4
 yk2g6XHonKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLQAKCRARpy6gFHHX
 ch5WEACPJaUCLcGcDGgkxw/nTYnOMYhfhbrjA3mmKCHHQdqbHzLMtazN+sC2joC5fV5oZbDWEfz
 G5Rdk6YvpuDSck4CRI7A7x6h6SMkiVIQjZFjztgmYg6kBr6GK+m3XNDsGgFnepic/q2310APW7C
 ro3j7/jq8SDN1hlf+40hrXaO5eezRsc+E7kOdsgYny0Xt1JDI2p3Ber5dvambaPwSakTVG3+BjM
 Hmmt8n3b8eLYCH6O91dN57vyHerqDtV+uCsNakEwCYBncnd1P3wOMgHFE0kDibd7F05tH+eoMpg
 PMZpxFd9GVp1yxhaMl7KG5y0MmSUXOeMTPN/+KSpgVNt4lZ/oS/+gZfoPLAgkLIajQfRScpBUPF
 NQdZGahUJHVarRmUF9rn0vcrYdMkSWBEA9j8VMAB8S4PKMgG/xVcmruWvEWlLghO7UtVlP3NPSQ
 +wP5GSOK2eMujk1VEfII5UcJH+zRbrA+j4n0iNR6Cf86Y2dkYw/CY7kHwR7x0vY+KCrcResyc7W
 7rSV3d5qAPaLLtb8FbqSz9T3R7nhsckE+lQ/c2seQfcb2AvaFPdYlhxAxQONWIuMPH0Aug+jRI6
 n3e/ks/HYvQdp62I4upzqZVbETdSgmL8JgydHXTE0N3yZkIDBT1A2nF0GuSFbPkBdoeAd5AzJOq
 vXVw9Qu9KHTSB0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the cc dependency for gpiosim-sys to the most recent version which
happens to be a minor upgrade from the one we have currently. However:
let cargo select it automatically by no longer specifying the minor
number. No code changes required.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index bd6223cf66497e960617ee4cd04db6d68496df1e..148f7bb76501886e894bdd1649ac02567b10616a 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -20,4 +20,4 @@ libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
 bindgen = "0.72"
-cc = "1.0.46"
+cc = "1"

-- 
2.48.1


