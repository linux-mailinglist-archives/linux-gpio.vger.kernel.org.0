Return-Path: <linux-gpio+bounces-24408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474CB27C35
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C34A016B3
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D4D2D3229;
	Fri, 15 Aug 2025 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rZ9wAm/i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4ED25E822
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248282; cv=none; b=g+JP7FEYxCFKzrm5SI0KaVKS87uZL+R5wHCksS1n9LR4Ed4QOoCl53rrjMBKEOWHmmI4k8gtP0vdvVTFMYN+xOti07iEvaF2+/Xyb9DykUf/Oth754p7yJBRutkxGur3nhdXQlQrB8ZzpqG99N31Bh/4Y9ze4aieeIuac2+LZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248282; c=relaxed/simple;
	bh=EymFRGV3z8lDqRN0W8qvfaIcRUki7ER9EnhcS67LgIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCiYCy53lXZe/AdIBKcDYKdgiym/PavGFVwfPrk1ckRwRr7h9LT1Z5cDRnWrGx3E6PhZfBjThgVGkxcuuKT8Y9UcNLVkUdKbQ7w9QQ38tz7SNRbr5B0EMkkSEk7yZvBWQFxnyDQ/QLZ7AcqCK33kaJa9DmMjF1QUG33k5pVmWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rZ9wAm/i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9edf36838so1084225f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248279; x=1755853079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9a2vmST2yjjz0WsuJUzIOB76yyyJ/7TCvf++H+elfaM=;
        b=rZ9wAm/ijCETeXdDoNbYp1tsvWu+U1B8hZaDm+i2d1vuFa+/OujNuZYNLdEPYp53Ta
         vH0kcjuUz74McUy8mepDqHCJ0szVnUiKUpkTCbY95tBKRRMgNzhY9UccirSsM4CaTQdu
         Onv+Unnnyuh5fES1vByx1VCvoJjE7YSc036F2Xc09Wbo9CEyVaTtIv62add7TAEXcEuM
         tUtqxss0VGVa75iHviNXgZAeTxZMebLll/xFf+baR8vS0h46jjY1FtU0rI2AM6TXTIkK
         +LsRV2nlGxVsn7VQ27AwKzYWe9mQX0R8BfXH6QaSztNmSMbAWnoMV3CZ3KgfGBS2UXTS
         nxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248279; x=1755853079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a2vmST2yjjz0WsuJUzIOB76yyyJ/7TCvf++H+elfaM=;
        b=G/ycBL+0hWYO991p0uPlYfF2IK7dPsF93x4CXZxcV2wHtB4g+UYdwLrkZ80P9aWAa3
         rOPPl3UStdYqzfo2dwSsFYyprZ+TTggR58+sai+c5ezZ2BjWg9Jkfd8bmr66Dvz8JmzR
         959fMn4SJ7mpcTbNuJOXVs1EGo3SzsNTm+b4/Bbr2nh+Y5fgZ03d6bpdlr1NCUCdWstn
         ITGG5IIwChMlvUAyHV0k1kpedG9hlyvpETvPf+GzGGmo0bnMiPWnPllcRv+O2X8B7ih5
         MFk4oIc2EWVO0DQJZnV37Voj5MpI61pZiFLbxlO2zDPoqvddL+iuXJHZXJWoUBA/0nk9
         ZRWw==
X-Gm-Message-State: AOJu0Yw3d9GYeQs5/ksYzNi8VPCwzDRW7+jQf09JwSMgB6MyabwvCsGz
	xto+/+KOmWGY9vJ3DcqzIiZy3IsHri2GHyKtANQSxHZNKAnkUPW3ZWw5PKYksE+cHdo=
X-Gm-Gg: ASbGncufDMeHyZlz/UPAPe8Fra1W4XxHX0z/Ejz4e6fWRy3SySHA++1qrm0kez415eM
	Un+tRM00oQ6T4ZyuZJmQgqDhYPCKHdiG9MylVQPcARGcMAkT04JM+JhBjWUtpStlQxoJF0lSy5T
	hz4KYJLyXa0xeB+J2FN/RQxylcdlmfv4m/GA03ORHpl3P590KaB/yHDxb1zhKzLTF1V9SVOJ2Lt
	Zt6rE+wFZnWoHeZkUB2h+PxlcOlOw35ZotX5337axDX/2UewemgCvBbzGG2IFMLY6tWhIrcW9aI
	TAv1TnpGTU3qoodsMSHjBT65RywsD+9Vk/XqkEJgLXEWKWyXYN+QzOl+7jPsQVnPIdcocYctLDE
	vzsI9dyfsjJ1SslNKCg==
X-Google-Smtp-Source: AGHT+IG16wKxXnfxuZnjMbOsWeGErqLygvUHwCwYwIysCXVtt8/mRaBNyBju9AwDlhA2IercxcwZ4A==
X-Received: by 2002:a05:6000:230b:b0:3b8:d081:3240 with SMTP id ffacd0b85a97d-3bb6636c7edmr903246f8f.1.1755248278968;
        Fri, 15 Aug 2025 01:57:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:57:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:49 +0200
Subject: [PATCH libgpiod v2 1/9] bindings: rust: make
 Buffer::read_edge_events() lifetimes more explicit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-1-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oK9JykrJo0R50tJ6BJVkm+7Cvk5x/d09fAlLbM68pIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaTj2QFpOKc4uGS9n4Xuaubci6EBx+QBq1aA
 RduGWCdRuiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72kwAKCRARpy6gFHHX
 cg92D/962LyjlDh0R4GU0NknDVz3XVPD3T0zzkSPYdJuBTioN6UpG9XNbLcLSfrPXJRENlJ6FJn
 C7PkEPnsSOG5y5VMwTFLFXeCJ/8QNcGtoKnpjfLQLe8nH9DxeABneEa+/2hNM+4FksGcOGt6uSm
 sEo3lQzBe8oHKcSmNR3EZecu3eu69ECMm1GWpzIbes3oW9FB0g1X0CT4PO2CF9EFr5zEuNuwq4r
 coCsiFjskKuVB7I0dYxzT2TOsNfE5ZVA6h0zKYZ/jTNku9qYAQWL3ml/g/LwWKgWg0128beMEso
 5NyhTRsZbaw+lXJnQL5lUdzUdvOvcnLCEkPZVdziqOoVRR9dirAJ/+Ch3j0rHvRyPNe/UYU90YN
 I23BXPRzDpGq/UUFDkEV+dSTYnNMJegQu1Gt5BOdLiSZtxFGVv72pGDNnik39jUsP9J+nPMF+PR
 btGjBkCBghhEkrjxIiAQo5lq+tuDjQc5KPJDG8+4jaFHUlJGxEnPFbch4RINnKJqf1sTwyjVb2u
 25s7vccd8n7Ak++cY+mXq3j1yGuSIvs4p6mf92Kl07oYK6pOAyOTBBl4X7UvGBhmVEguKT7KPef
 AIS0YkG4xk/sc+kBAFBjhbsuryoQ5XGinnugcon69kLs5TRVrKYtf9dLwpgTHWcIpGXfWBq2DUx
 Ed4jloh9hMn1aGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix an issue pointed out by newer rustc version in the Buffer struct.
struct Events stores a reference to the buffer so tie the lifetime of the
latter to it explicitly.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/event_buffer.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 13fa7ba2c8870e0a325e251c073d6d73bb8c4374..059de1adabb858ba211446b27312c60429c6cc07 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -108,7 +108,7 @@ impl Buffer {
     /// Get edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
-    pub fn read_edge_events(&mut self, request: &Request) -> Result<Events> {
+    pub fn read_edge_events<'a>(&'a mut self, request: &Request) -> Result<Events<'a>> {
         for i in 0..self.events.len() {
             self.events[i] = ptr::null_mut();
         }

-- 
2.48.1


