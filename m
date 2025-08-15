Return-Path: <linux-gpio+bounces-24410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F967B27C2F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB65165A44
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600672D3741;
	Fri, 15 Aug 2025 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M783IjGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20CA2BE64F
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248284; cv=none; b=pwOtW3NM5SJa4W5zSWe0rgclQflFMy1dhBcitqW+3+RFyJ4c9rz5qVRnqF4R1dF2PYTwxQNS+t+zsi9t56dkjB5oi9xvor1e4MVLSwGTGpfaVw37npcjjpbK9zwVGvWN4Uy69JmF9nu4R3HuXxf7hRSrEUbJN2Tj6HNEna5Oru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248284; c=relaxed/simple;
	bh=th6Mue+Jlx0Y4akANJrIZztW6E4HgxYxOP2aIh0tIac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IscbGsKZDIoeCfK8JGSgjVM3Swks4+fNC0pEOelvObHIDG6xKD9gMNJ3OAuWi5smUpq/n6VqJ8xlMjMWbLIfUFuG5/w5odi+bQesO4zJa6FACcEQ8/qsWF6N5hpKZHnneLipeyyDffVHmIrJ7ceZ5k3jSXJchVp9ZImkQnstDMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M783IjGe; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9dc5c6521so998044f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248280; x=1755853080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaWSeJO3ztNKJX/kgI5xbPZqqI6FcbuatLTwZobM21c=;
        b=M783IjGejdYtrxDXOU+ayO6wQGCfs/DtJAiuMNCzluWT+usAVWExl3M3i900FUvXIl
         vtbAVOAJFDelQrAQiaCB6jyqbfFh36mxRhrH/wtJb4pfZKYXnt3esVELRW1EHwsJFbby
         D6wGftD9yzH81E7PEYsCIglojUpszlvizxfMj1jwZGtEizD7T02xmJn8rMfZhZbx//EY
         0fni405Yo2ixqVLNbTXozdtqU3/SkWWoLHSTY6dtcivRq/TnvG+5mMNtVqCuer7VOs+P
         943XlTy5B8yde6Qz0a7wY11yWfm3hG7fqEtADK431vvHKZQOxTr0Ts4d4iuOvwO1Fu6H
         IL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248280; x=1755853080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaWSeJO3ztNKJX/kgI5xbPZqqI6FcbuatLTwZobM21c=;
        b=LoX/hcaqdAd4Nt22xglMlL2lXSC6XqWaDRK9QGBdUS+ezQWfq1ENIJuc/yt2RBRnI5
         Rm4FlI5NN+34Edwz8z2VdU6AshPZQbIJeZgcUf66Bi9v7suXCsuYuULyDgfGvtIb2sFv
         ioPuBD3XmQFYyluDjBFLr/iEr7dDmVtRhggIKVgTr15UxbZgxiD/JmGHA80pLHQx0++A
         +zMr5H3DiSbnRfJV2HByW3neWaEJkTep7DPkfOe25/LRjhCtYw5lQzADwe4qFblJpcas
         lF73O4+nSlsAV4dSKwK0OO9JUtys987tg0SX9MVqE2SAajqa+iRwcs51rzQu63yqaCgW
         15jg==
X-Gm-Message-State: AOJu0YyDJfFzKq2xZHoS00ncdx9SInYK+Ldn/g6HHxUGKaszXuuIG09G
	FSXsZBhCBTanyAMgV8q14Bkm9utFbbsKhpTjMuk/eRMlpnEDcZ2HKa8py4g/9XYXaMQ=
X-Gm-Gg: ASbGncuVuLSYKze9jTodaqTbjebxb5o8wbktCqxEYe8id6uowuRPnhI5eF8bjB6KibV
	IDw4jxP6iR2fo5q8LqAG9XpZli5kEvEPfjhL3qeSDSEctGOWsJHSUPAx4XPGhFhtinxU1TrZKdB
	eL+PbwX9D9iGtR3pMA+IcnFpBEgmSEvCM1yrw6Znsutu8pPol4OhB36PhPfg0fNfMDCA94ZDKGJ
	W4DOrPEyEInjSp3GE48l2O+pRmATg5EGp111S/UgcNzijwiiR4SRFKjbfL4bQsnaiWDho9MdqPI
	ALnYtMflzrBTpWJZuWN7lktFpjmw+EwE368htVECM3bS/+OW3xoNZYihrQKgg1VmBlYksNoUI3l
	LGJP9UvHAkBuurM95Me/5z+Rc10Hs
X-Google-Smtp-Source: AGHT+IG5FZrdXofR6t4q+Jo58ZA3lNaj22RIEeD6mSNSVghEgEsx7+5rr+0bLcGJNXieaJPYcjKHTg==
X-Received: by 2002:a5d:5f49:0:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3bb66a3baa4mr1108585f8f.14.1755248280067;
        Fri, 15 Aug 2025 01:58:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:57:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:50 +0200
Subject: [PATCH libgpiod v2 2/9] bindings: rust: add missing unsafe block
 ahead of rust version bump
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-2-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/8yx2RhpPwP71KkYQKmEHcN483C0e+kgp8yhtwq9YZk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaTbqhMXTnZjntiRWA6tbW+eCnE+LolMc+Ru
 /uEzKuV9MWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72kwAKCRARpy6gFHHX
 cieGD/4hng/4f+4yYbQlkgbdj/bNzRbpX+wVJ7AAFd+esCEFTcq9qBwfg5kEtsv80jORN7aOA8B
 0cmSL5TDSHtG9uo3rjcOy9hVXguPeAZ8h3JvAUl7eY9y10v4R1PekcUdsxYJ5vWFHgNyBupSszd
 2yi9MKigB2unywHP4ejn/YOvcBDWrQxUAkcCxKJp1JCKho6xN8wd88W5I/f7K6CmREObyH7yPxo
 kblsJl5VoZo+OOrKu70TVTVOSVK4zZAUxyWfdQiiekhXi9/vz1fAdoYfftGZn7bwX1nt7ynUDTk
 ka55EeYg6BnX2Kqumc63mmlrTT9ftcVEII5b8dlonZtG5+dS6V2EFvDmqVhNTqH1M+v+mjcYftR
 EjdVtQIvPukc3eoX8DKEkdtNphIMXs3yKGjml4h676cGAIFA4KCZJg4vFR2wwNCh8mozvCD/Nbm
 rgEemeT/ypfgPWFq1aXFtZVp24soBpJjbXZUwTHiz17nBXHbyYcWcaFbNcV6bXA5C2bLX1EfS0f
 AAbxhazPsLKCFOw/nrKYQB73rUbOalPnJywqRsqGUpJT5rHtBEwPGrB0T57l5ynWN6lHsQdMXll
 LNrWsFxBxqysFznou7NyzJLveOzuUKAMbddk3WqrApvYKaqlKEt/nzD2RGYBDTZ2a4Al4rfpf7E
 5LfoCnHh9dgwq1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Rust edition 2024 changed the semantics of the unsafe keyword used as
function modifier[1]. Unsafe operations inside unsafe functions must
still be wrapped in an unsafe {} block. Update the code in case we want
to bump the rust version or check it with clippy --edition 2024.

[1] https://rust-lang.github.io/rfcs/2585-unsafe-block-in-unsafe-fn.html

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_info.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index bd290f6e1369a3968a39178c5bcfb9f6aaf26239..8def1ab4e52962fffa6911976e64204c3d02df6f 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -51,7 +51,7 @@ impl InfoRef {
     /// owned by the thread invoking this method. The owning object may not be
     /// moved to another thread for the entire lifetime 'a.
     pub(crate) unsafe fn from_raw<'a>(info: *mut gpiod::gpiod_line_info) -> &'a InfoRef {
-        &*(info as *mut _)
+        unsafe { &*(info as *mut _) }
     }
 
     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {

-- 
2.48.1


