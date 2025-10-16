Return-Path: <linux-gpio+bounces-27187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C0DBE11CB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 02:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 809CB347053
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 00:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4053126C05;
	Thu, 16 Oct 2025 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QXzrRBni"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2B78F52
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 00:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760574994; cv=none; b=Sh78nluI0UrHUvOEfALbVps+nK8VmwRl3iriglQqILymB6ss4T12qqEy2iMNq/8AZdA2L5GF/fIhKzidlCOikj85y+h1RYHe4EX16SqQa1cvn+miLuHJfmOYJvkdc5T7J23ckpzJzhBvFhLKqNuDVanYQ34FWWiiES2IF4xHfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760574994; c=relaxed/simple;
	bh=qj0YvvOXuOQC7b8yM8MjMnEbVN+hysjYpMTqWns35Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7dOcxi2OsHkE5XT0A3VstjJhUe2vRdcN+PZOsqFrclR4u4eE0O//rQuKjACbvD1Xy8vGCf2JJkAh38XQrPlVwNatlkvaFOfSt6XEqXyO/lucuiVZkB7aFEdUGtuh3VWiO8atZ1TUzm44K4LR58W2jD/k3V1KUBbT2DxYl+LCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QXzrRBni; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b633b54d05dso77062a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760574992; x=1761179792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXt/D84/OJQisXQbO31kOLN3Cpr3xQX/Xq1KFsebzo8=;
        b=QXzrRBniTiFzP16mL8A8rh0huXpbuVBi+y3huzL37SF9VkUycuiTZHqpJ1Q7LyRGxr
         ponVSUHSGZ3553ajvyGNrlGfg1TH96xb+X5j4vbv3qpNYHJzbZ6S5+k+ndzZViY8Bn+E
         IM4NqjG9FQjmBEktfQ++C9+x/Z2KeXSUc2RAF8fc6GGAqeNlo8uLnyk6S0Y1hsG/TDNb
         Ihr706HEukbC4cSG4q2cCjnclxScsVpMGKE3LHf1I8rfDXHE6w/Fewkp7FOSrpdCtW3K
         FX4nH6v4NEGsrM3tYD1RgAmT/O1KTDpyaZ5GRiJ8ImAuD6Ne4+j16ynk1UfMZhNG/L1q
         SYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760574992; x=1761179792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXt/D84/OJQisXQbO31kOLN3Cpr3xQX/Xq1KFsebzo8=;
        b=FrqaxlNoFmFX6f7ZzZQ1rQrhdsKGOyh9zmyuLVFL659acMEb0BorAacUBrRqR3lbho
         VkNF0vfvMoEWmnYlYylikqvYjdzEKs5UtEzGV2BFoXgVh2kx8EmB9RgVI9IWjj562Dg5
         V0H6SYd8q74UtDanoZcHKri1sEr7Fw1+UobzwdfLnYQZ6fsIf1H/yMjjoVRXxXNnssSi
         UJQI4BBMj/yG6AWHXnPCMwhcr+2joJ+WdpG4iHxenVrzdWMTFosA23rapowa/wX5+mOG
         mzzvD2VqWnREPMgJfeS/hhC79ivIl8AxNAgUeixhPmPNXLrXV782D2pls3iTEwb10yFw
         DOXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMGW7cSdnbYU7NlsRLbZuTPZ81X7hxSKNV+bHvbHXCZf+zgC9AQbBKgGCSJUaa1TngI+34FZE5iqPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfvh2an9E9Gq63xUY0U6zMn/RDyJRbyQZYbeSZljuqSLdsGuw
	0HR/YKYOyRQN/V1tlJ+gS1L6PTltXu38xTAWP6NYAHh4+XXAJGPk9xKug1H447uLQ8A=
X-Gm-Gg: ASbGncv6rH21a1+FMRBguZYxFFdsjcWYQA91QAai1BQv79kbXX2MnzdqkJgR9dZajOP
	z2muqjxkf5MPdt1br71ulQzNmmxexxQtocVTjtxcyp4f7zNjeMlGCjMOz8JDCEu9At5jZHuB443
	78w63RedTV2mUSCeGO+vANz5sqyCOi2FuGbLaFCCGkDR0RwmMaqW/FwV1DnURo8mrAQNRTmuakM
	RHuk25L15egeA4m68ir06+j31WGz/4ZFmqDzgfbWWbufPWkRVS/GbN7KotiBuxh0V3xMXDqwlqi
	JUFKCHoTjYWR7njzQDYaxnBAqJ3auN989lARdaGrTj4PjT/d2qZI8VXgaAH0MDsMR9qrpUKjnuP
	OVKQb/vSu9XyqTjnA88vsyCe3GKzzY6CiCaQCT46b5PmV0OKUceF206/vaShE2QGb7Fc7dMmXgM
	MXS7NShR9Lk4fVkf1I0zEDyw==
X-Google-Smtp-Source: AGHT+IGtW+n2FCn4fDdMcJPotohaS+nhnzdOOjJUzirVY10P+zkRGhCTeSBu1T0bO7J51NeGGnPfWw==
X-Received: by 2002:a17:902:f788:b0:28c:2db3:b9ab with SMTP id d9443c01a7336-2902725f2efmr434684235ad.26.1760574992292;
        Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aba4f5sm8780165ad.91.2025.10.15.17.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] gpio: sifive: Support module autoloading
Date: Wed, 15 Oct 2025 17:36:25 -0700
Message-ID: <20251016003631.3912523-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MODULE_DEVICE_TABLE() so the driver module can be loaded
automatically based on a compatible string alias.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpio/gpio-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 94ef2efbd14f..e9a992cd4b9c 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -260,6 +260,7 @@ static const struct of_device_id sifive_gpio_match[] = {
 	{ .compatible = "sifive,fu540-c000-gpio" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sifive_gpio_match);
 
 static struct platform_driver sifive_gpio_driver = {
 	.probe		= sifive_gpio_probe,
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/gpio-autoload

