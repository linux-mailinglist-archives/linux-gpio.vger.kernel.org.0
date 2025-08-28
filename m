Return-Path: <linux-gpio+bounces-25143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F0B3A889
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A277AB114
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADFB33CEBC;
	Thu, 28 Aug 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h9CqchuG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006F322543
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403004; cv=none; b=bxTe7yWPNKllBy9yr9UvdM1Zy046eVCBWqIBaiSUeBCLlm3C4VGSRxidQxpORxK7oh5B+cz3t7f/EtZ2AbS0trsukXyu8y4VP+PTs2pkcQLrzhIV9zjEfWr5n8wf2YW7JdOZhxgLIYIspd8rqfyVZrnBxfs13HbL01LntzF+4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403004; c=relaxed/simple;
	bh=/5ynohSWC2szdKhinnAMBUfxsqoIy2s+Ggk07X9Ynhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwZyQSEf5fZvyOd31z0G3oke7qcE7dDY5/fW7tbIo+3uFzFTdm2438OT2oI0JnFq2S61KWq7opf9lETNUBuTnzX8dxiab1vgAZAr8QlLZRHI2TjEGdVi2r8VhILRjLZatKr/iWrk7qss51WHaHu3ZTeWxRueX/6hlPO1A0ygBfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h9CqchuG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b6b5ccad6so7419435e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756403000; x=1757007800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCif/WbUYoGAlVX12hFU23aUZBpuZamqgQLWAKc58UE=;
        b=h9CqchuG4hAZWuJ8C5KG9+t4938efUa4xLeUMLsbToSoEmt48KeC+Aux4RBTe1g/Fw
         sL1JrpR2p+RQwMuLqTmY9Yn3y/dy7ukOzItFpJzdM3krsY7phwIQzmFRi8t5T+Y/Os3r
         4uB21bzas2dIigf9RG/eu4bWI6kvCcS67WIw5/QLlAHFlbdG6RdPtM+XvTw7Y5I4K/SP
         YvBvZikUsXTnQMOqyTpCX7S3opJRdGk45NzQ1mDdas5h3wG2USPwYYxknxrIQZOOCtDu
         q42hl7USkzI2x6tOwrvGARpjxIXyvO68ZHjpb0pDPHyIKXXSHe5SF7B9thgZM+iOaSZ7
         6jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756403000; x=1757007800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCif/WbUYoGAlVX12hFU23aUZBpuZamqgQLWAKc58UE=;
        b=fcrWFATX3f9HlRqrdggRZjwFSXoyJdsa3HyygYSMD5NEZqtHnSUTuIBQ4B9tPMipLB
         KN+zGay9U3FaPPKaTVsR3RlUB7WYmR3bYqZzyjSBFRmVOW8xN885YhNfGPqwvjptgamm
         3wX+04qd+zWgPgC4vn6ktsBdRmcK0vxeNAKzTRA1OBRCOwKO8dWEZlwtOmXHk3ZPFDqN
         LFg+K8CtSyxskhU4+HM2pYnHQse42GWpo2imNvZJJO6fdHEkP4alvPiGNVkTJKGbilbD
         zlNqbBVHfKX5m2vXiWvDebP+phFvEd0OCYmOSehmluhQaj8hD29Ard0W67lcg7pVaFX2
         Dk2A==
X-Gm-Message-State: AOJu0YwTM8ZjEAJfQVnm7ZzNFIzRUNIXLTo/3WbGGW6GCJDqamSeqUGA
	glb2ICVYP7B3GIJY3xHPQn6uiey2rdmSMZtUMEDPuDgNKps32vIuVRRJ5pU1JAPOpKk=
X-Gm-Gg: ASbGncuQSbYjkMhmStl5Z9Z+brsrHH9CgvPOfrr5xkjafmv5dSCCyercotf5iSQao+f
	hIJ5GhqTu0TVSFYU2RguohQ2ETATFx+xqk71ltENN9rsGgGOdKGuEVvA2nd5S5lAloA1U1lmhm2
	AFFLdbJFCteSF86be5WHNterA3/OKKbsFBlnJDz4qiEPlX+tcxDt1pcdWNIXYZ/S80mSN683iZj
	dosD/UwKasPMg0sVGXJqXj+5qfmFkbVSiiBAX/mVo1Hkw+uq3UrFPQ6MrYppZnc8lD4Vf6JFL5+
	ujVa+5ZLRnL7vWu0kBJr6Ap3bA+Dy4UuyJ28LUxqS60GZrGWj0SiZmjWiiR+IBCVRPC2+QSgdk2
	T9lFug0tmUJ/hD7AfslvQaJD1Yc/9
X-Google-Smtp-Source: AGHT+IEInU3OBoNeMso7bg6ROhEYLJpFgWfJyHBPzn6coVG71j1O7mupSsY6Cw+wModaQ5QIO4usjQ==
X-Received: by 2002:a05:600c:c87:b0:459:dd34:52fb with SMTP id 5b1f17b1804b1-45b5179ebb2mr221341665e9.12.1756402999660;
        Thu, 28 Aug 2025 10:43:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:10 +0200
Subject: [PATCH libgpiod v3 08/10] bindings: rust: update thiserror
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-8-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PvGo4ZLnR9GUoBf6b/d3Wbwkuc3sPyniBEY7CMA2kkI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUt9BLVm1rp2Ayfxg8skymzXZUebUWYGXqZv
 WdnS8ZvctOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLQAKCRARpy6gFHHX
 cmuxD/0et932EZoLU52g4MHXUbtQYTavEyBAFZdYRzHSpDqThZ6JXmcXyNTXSPbMNJDk29uSiUm
 O9RWb2EOgFBtR0oKUYPNmBgg19n8fsN04DOyZveU6duWh4D15t469eDPKlj3WQpmiwNEhHyfiqf
 wNfr9kKZJPVgrG35bbDXVFD5MkRtMvlRTqWoJ6wt3bKmufZRHYwYgKNIOAWrmObJBhLMfqi67uB
 BDdHrHVqiLVodAfKqyCOHrr13mgNpoOk2Mgu9nYQ8g1ZsdFOWFm9RywTKNew8sYh+USayhW51Sg
 MhckphJQsNcyVVjD0nyIXt0QlpubZQHryR2B+c/7BLb0J33DxNPieiZgw17D+LlDEHs3Wml226h
 VYW0v01z1PwFsq1yCUTTEtP4ads0cA/a0yU/xaYHQwicBMwsb+zaXAWunzEEzsd+hk93LxEYgOv
 wy0lhgFm6c9+GTJfWda7rpLeiMDdM9ccZS2EGaqGvG0ksDRw9Ezzq0YLbJb9nE4GzDSYiBIxlSU
 OzIMLTnepwcuMkA0aDMvBHAlnRcWr3A4YPh7QLeeiqMgiT0yBinBGzjls4wYaDlM13z0PjjhBTf
 OH7FbEvjjf4knGOJJMO8foJZJzj2RuoXa8kmIDQVK6XcvRsFDWsawQgmo2nMrIkwo9GoK3I5139
 17Toxu8pDAGUKYQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the thiserror dependency for libgpiod to the most recent major
version. No code changes required. No longer require a specific minor
version.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 37a5c277593aab812a01626648c2e30dbee8ebf1..c7542d61fdf0ddac79a1c2c5e1d4a587d32c5b16 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -27,7 +27,7 @@ errno = "0.3"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
-thiserror = "1.0"
+thiserror = "2"
 
 [dev-dependencies]
 gpiosim-sys = { path = "../gpiosim-sys" }

-- 
2.48.1


