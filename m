Return-Path: <linux-gpio+bounces-12274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6ED9B3FB0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 02:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFF9282CCE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 01:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA25938382;
	Tue, 29 Oct 2024 01:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOYVcn1b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC6B28E7;
	Tue, 29 Oct 2024 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165009; cv=none; b=rMlvoXRq4DZwmSAhyH3ncYvQpaEiFAdtMdzpUl1+9EMBvV24QgmThCDYUvSDRvpR9s16JP7HM1yCyrw1LqKXiArGZQhXGhkq1Rm9LVxI6s3xtsqLbQqbl4hvBiXetcV0ydEnXxwWAh+IgiGaopRnHuJAsDtZQzWx7BE3F0Rhi0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165009; c=relaxed/simple;
	bh=QEfibKuizgvY52dQkaX6PJdG13PMDH4fxQ+Iq/k73KU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P3qxo0mFNiDw2F87VegfH0ufFQNs4un5+wit6GENlL4heim+FvmZJqWtDWsw/oK0u4NZHawJ+AczS6DOEDs2E0Wk0dioRsB1ID7zpNOkxNtJs1hjo5G/4ampYtSaZ6gpRxGRkxsSW8J/dFCMj55FjSVaa3tfXjsd0Ag0YMdpK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOYVcn1b; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-288a90e4394so2417781fac.0;
        Mon, 28 Oct 2024 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165006; x=1730769806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sk1dZREUQVGIecYh311eheCmxNasMewq/5f/DZTF0Vs=;
        b=JOYVcn1btBP9Iv28SNEQOikXkvheW6NtQ0UdSC2MeBsDQ5LD3oi5Vma/97ppx7qi1u
         K9ZH3k5FBoprIwNx5mO2EGT+9dO5imOtvrfFSxlKKpYY/qiQE4RUNaNy1F09O91sDpQM
         INeG9ourQmGF4JbWubSyKjUe85xaY7EVrPg+Uo1fGIoUvhMC78n7K1Jr58ShjI0Soq8s
         PaXy5afXZ1DOy5ZSTECDKlNw+R8kX8OzkpgpLa5e14wXZ0+w2LqK01AhzgSdYlmJh9Lo
         ilBDcp24f2xlIwAys4ihGNS4/lRbuWIGel02aFpE2bSm91Ulq2SYvZH3Rkf6WXLCJOEm
         I23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165006; x=1730769806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sk1dZREUQVGIecYh311eheCmxNasMewq/5f/DZTF0Vs=;
        b=GdqldLWbkjM1tOIrN6e8nBxnCXgoPVDblfHaPYRp3F/iMjsYT7mFUqvKfE49w49lI7
         /xRCTwyOwf2fFtaMqu2+COf+dWPsYR2WCcWjluKImp0VLeWmpGqnLPwRoaeg0U4mB57M
         bKvFR2Ce8QdmHA6xKVTQDoAuv1VBwLIsel4feEV8XMRg9w/YlKTgBt6rdxKc5hUPPr2r
         2XRvE2IHjc6c/uS9slL8lfea2L13AZR0GHCBqiFAk+dzCB3nv7xD17PzYcnc6+XCi0sh
         jf44fRAU1Lw86ATdpl8BYaplHYLaquLpGZ+vMRSrxNW1Su3ed1BQIsTLW4/IdQYZSQnf
         qy8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmWNIeEOlD7PUh5PNlrpc1H8Cy0oOlYqN8T1yzrR4FVmhtt4HoqZB+JoLVVznLWBeTakDvGP5jx/+f@vger.kernel.org, AJvYcCUu++3XPbytKPbowy/kPRXxoUc4cCCYuMV1GlwWP7XVZ8x5TXHJ/EXxreLRO2W0/ex9+ZB0X2bhncDx2DVY@vger.kernel.org, AJvYcCXJO0b9NfO8/EX76HzK30TrWrhZzNYAeK8PbpgI4erbqYO1YHEltfpic4Gen84OPOlSHIKbBn8dCfskqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9xERumQ9XxxRdgEj1b8ID/h36Uu9iKkjpnVMVsWMryuWklkS
	uhZvYfAfbB3+RqDiJVeOmhMFYtNomDm+UejE4gTisU3bg9DtFP+bRK/1SOsX
X-Google-Smtp-Source: AGHT+IHWlqEV6BxbZIE4WDegspeRBJZliX4tFPnZbewy2MWHbK07FHcV9Rw3Pe924sDNMakmCs4aYQ==
X-Received: by 2002:a05:6870:912a:b0:288:6d23:5f24 with SMTP id 586e51a60fabf-29051d493d3mr9099606fac.31.1730165006551;
        Mon, 28 Oct 2024 18:23:26 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2903824c853sm2494682fac.51.2024.10.28.18.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:23:25 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	inochiama@outlook.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
Date: Tue, 29 Oct 2024 09:23:12 +0800
Message-Id: <20241029012312.3448287-1-unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
<dt-bindings/pinctrl/pinctrl-cv1800b.h>.

Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
index 1e6a55afe26a..feb4785a3fac 100644
--- a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           pinmux:
             description: |
               The list of GPIOs and their mux settings that properties in the
-              node apply to. This should be set using the GPIOMUX or GPIOMUX2
+              node apply to. This should be set using the PINMUX or PINMUX2
               macro.
 
           bias-pull-up:

base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
-- 
2.34.1


