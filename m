Return-Path: <linux-gpio+bounces-87-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE817EABCE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 09:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E139B2810EE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 08:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E801F11C84;
	Tue, 14 Nov 2023 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wv+1S+BT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602B414278
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 08:43:47 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F8BA4
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 00:43:46 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso801721366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699951424; x=1700556224; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSuqo1YnJdXP/FK/GIA4Zc9Zo+5iPaDZClZkMA8SFlk=;
        b=wv+1S+BTTCTggiHzQkXvp8rSm7TrNLZ1lzwQ+ScNccLTIsJk8qyU1hDZ5reY5qSl2W
         G7tuUJwNFysrA0y+thAipAj7nh0Z7RLdMSZBc+dSiJqpLDvKWhIxwcqei5l5IcFAF+k7
         Vx78Vigz97lOqJOro/7p1EUR74PFbivPGrGgIi34mIC4tI1/EwjkHXCKL6WjiDUHbKu4
         +tcSB/DVLQR3ouXrU3u8fhc+1GlHYTGwnxeAmj9ZUrZtPG2fSkCV9tI8BcnnMWPbg9SK
         FwmSoqW68ZjsKRltKZ139Ckyak9rIsVZL1vOeZaEFqoRRdhbaDakMCnzNBLuluVS4tNk
         yB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699951424; x=1700556224;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSuqo1YnJdXP/FK/GIA4Zc9Zo+5iPaDZClZkMA8SFlk=;
        b=VtALqGm2krQ2XKJpx24k8qAw9nW8vSHwwFPCSr3MjmTTxWWeGxlunKD+Rb2p83FCqM
         w5B8VV/FFW7Lkich1sV6ZE8mbmku7wXD75xIOduWstRK8MVF8f6Qwt40nUu3HmwLpdO2
         STOqRoAzsovq9+DIhPHa58omip9COgBfVH+y9NHgEPr+DiwEZfFAPwEkXyothhyvTuB4
         IdQkSGsgeP4NicJN8EaosMiiP7pYo2a7NkOaXIzEWNTjQ21vYwn78RDM2wJx6nuVljhy
         q64skXKJ3ibhCkYEOxoq0iteJ9vEgKVS556FW0YNz3wUC5nnlzWXtiDmcR2IdIAnq8hy
         sp2Q==
X-Gm-Message-State: AOJu0Yw4D4rm2lipLE1DLCUMmadVLSMzy99XnXQzpvDJyE7gF3b+KGco
	oWND3Fvk/LEXQhXlqhLyHvoCKQ==
X-Google-Smtp-Source: AGHT+IExVnYfrAVe0W41MqwVieTtgtKICkC2EuPTEt36mqJdqjrQZV8m88yWyfbk6w1VOmYrENXQYQ==
X-Received: by 2002:a17:906:cf91:b0:9c4:d19:4a64 with SMTP id um17-20020a170906cf9100b009c40d194a64mr6443696ejb.25.1699951424203;
        Tue, 14 Nov 2023 00:43:44 -0800 (PST)
Received: from [192.168.1.149] ([2001:9e8:d5bc:d400::f39])
        by smtp.gmail.com with ESMTPSA id vx12-20020a170907a78c00b009dddec5a96fsm5308465ejc.170.2023.11.14.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 00:43:43 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Tue, 14 Nov 2023 09:43:40 +0100
Subject: [PATCH libgpiod] bindings: rust: libgpiod: release 0.2.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-rust-release-0_2_2-v1-1-8aed47e7f395@linaro.org>
X-B4-Tracking: v=1; b=H4sIADszU2UC/x3MQQqDQAxG4atI1gacKBZ6FRGZOr82ICqJLQXx7
 g5dfov3TnKYwulZnGT4quu2ZoSyoPEd1xmsKZukkjqE0LB9/GDDgujgapBBOMUxxQnNo5WWcrg
 bJv39px0t+pp33RL113UD8yGDVm4AAAA=
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699951423; l=1161;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=BnI1ic9sgwAO6SRe+dSgDbL8zrpsX81wE4aacJredPc=;
 b=TyKEHrbDjSlzliIJ6zh3CY2XB2y44MHuQDaYFGbDjQje408Jwejq8nDIyPMMIf+kud3Cio0+K
 n9bhjwq8AD0BehqX1jiwsluf5Et1m8P3i1P+Bu3VpIc+THUndrYDtje
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

Minor update the exposes feature flag and bindings for v2.1.

Changelog:
==========

7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
3b40a37 (bindings: rust: fix EXTRA_DIST for examples, 2023-11-03)

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
As usual, I will publish this version once this commit gets merged.
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 7ddf5fd..23c3479 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.2.1"
+version = "0.2.2"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

---
base-commit: 665f360a266c2c5dbcd4632238743e503c492b9e
change-id: 20231114-rust-release-0_2_2-dacdafe47626

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


