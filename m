Return-Path: <linux-gpio+bounces-6716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13A8D1633
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ECF51C228C1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061D513C3F3;
	Tue, 28 May 2024 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xR7/853O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888613B5B9
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884767; cv=none; b=TU3ZwYtSzPMT0UfaLQsdZUL3cI7mKQbpy/BysT78jioOYGiwUFZg4iYzxLB2AdCsDptG0625qbcxP90uomRyzdrmaaF1zmKNGRW37fmRnsXbierg2sBW7BQJV9wOPp46sY4RhpTQO21N0x/GZ5rmhGg4RuOUcapv9aogqMuN0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884767; c=relaxed/simple;
	bh=GAEE9E5pxIlTtypsNRbue75lfPMNqAE/GTqxio4TpJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+t3ARbHnLaW8el/4H35dAvSzB6GbEAClxH0ooRBOee5r5ox4BlEgXiObQ9waXt4cSV5G2IPVMNp1r3rDenlpcFmuOSKNYNgUqHtUy9mJ82tok7xtkiANBmW5eM6C9q9PbcOqP9gPViPoKdhfgcX8VICxPnIduqpqLT29JvQN0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xR7/853O; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-420180b58c5so3867105e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716884761; x=1717489561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUSYzkcmz/5Oy1AGbRpHSlMVdz0s2mXKMHaOTb3Fihg=;
        b=xR7/853O0a9mhuvJbl5F/VFdsjm80hwqz0XyoQrHBiu+DOSZ4FRZPVq/Y0rIE3wu1c
         AmAw9CxHEkUjrMnJjfR8i7SY/m5IRw/NpcwifcqyssTDQveaTo9ZMBnBPVTUB2ZCJX8b
         essMMb1hvnmfSo9FQ/jx7OQDRCJ1g6I6uFLSkt6WqroCv11zv6vdi8FRLV+1N8d6HYFP
         S3NSjbwusov2L216YgrEs3iNtrhwnPc1wz1dE8DJW8j6lv5UT42fH0tw6qCwJT7gd8BY
         VAKdw6Dx6q3rkbjw6q0E6aF/hQanY2Ex2r+NOn3ccmKeIJYOjhlWqFJ2Tq3YHRZ7swVG
         bZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884761; x=1717489561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUSYzkcmz/5Oy1AGbRpHSlMVdz0s2mXKMHaOTb3Fihg=;
        b=aY3l1zQwlgI/qDHnVT2ufAeHA4rv0JwoWVvomCW4kgqxeIW1KeBW1PPzC+MdEcpNAA
         hRPRgM28TteXlyZARl8Yk/95s+kBsgjLVzH8ZwKYeM1aXPo00DT54rFQCQXFeNKI7FyZ
         Pf/8d7WAaNGZfHWJ8NnLlqRRVFbjEbCM14JD5vLUhaUxS149c5NTQ5NQ9pfZRFjV7esN
         hDLWxFX2h/jah3HjiRlnDhKlyE9nidPfF9EV+VngaFjsg4cOFSNWqdQ0qDuvCJFO1ZiL
         DF1/zrpRoWcPxbraiOsZxvWvQ3dP0DnJM+Rp5bIUtjmLL3kJyLDgmj0t7vdtzEX3nMUj
         OeVw==
X-Forwarded-Encrypted: i=1; AJvYcCU5fdVAS7m/0zxHrsA9ZNgPKXwpu5H3y4KSG8JsRk5zF/cDZO5s4VCbmpULSE6d5tKSxXLpIVDY/MnoVUsvaVgowRRNJcXCcSx/dQ==
X-Gm-Message-State: AOJu0Yzz7SMsZ6uzkfXe47iwtcR1HxsmOa96Xwc+vBc5vgQmtieDEVE6
	pyaaldMTmk0XhGOZnS432vThFn4tDyo3VioUcFZRD05XIrL822b8gnHp4DgywwQ=
X-Google-Smtp-Source: AGHT+IGjuFpnGYHnqdSiDJap9Jf+xrb2ePuAy7CL8VEitVplGnXAktBbjZdaoGUg6NkanhIQWOZClg==
X-Received: by 2002:a05:600c:56d6:b0:41f:f144:5623 with SMTP id 5b1f17b1804b1-421089cd2a7mr76406905e9.14.1716884761304;
        Tue, 28 May 2024 01:26:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fd37d5c0sm96207545e9.1.2024.05.28.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:26:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 10:25:50 +0200
Subject: [PATCH libgpiod v3 3/4] tools: tests: remove unneeded ';' in while
 loops
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-fix-bash-tests-v3-3-e9b5be2ba8bf@linaro.org>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=riNlIxW4Qfkkk/Nr3YxVgXIhisEwGSeSulI++INvgps=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVZUVrKXhqv25I2smuoNUMQFfl7SPEjd4AEW6x
 BwW8AdeVwKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlWVFQAKCRARpy6gFHHX
 cg5jEAChaBBeHgWeuZfxo5vm8YlN9gV+cgGilD9dNeoHhCUcF++vqRzROAJnVwLPq1agoytYLnH
 xmG2s2quA99Rx+ODbo+U8aIFPPqANXmK6u8Fbqu+CsaGVkwMnN6NBMDlGJBH/DMCh3vUgCiXXkr
 JseI/8Du8YpxUplbTbDxmen5/RF9PYbclyc05AclRAjEbQpDKaB/MXrRnUuLs21yCU4/eI0Fnye
 mYtpFV/8uGZvz5J2Xy2t+Lx68tfVnd9eo7NfarX0z0wheDLAq2op64zrxuQBuiX7pUkjqprwFt2
 mjKRs0mz+lZvQ5s18em8hEmuob2vAB1Mj7VEGVo5HBx3GVhjep4K+mUvaBa2aDoqmfoWHHJpVsY
 YYpB5sOxhjKTm25kUS9So9zJyMtkkvVzjmBbtikH+9rCY50O5unyRJ/+E20l6xCILcLrkaNIRwX
 OBBoEsO1wriqPSw00h3ElolTLURVcLklOTOxrXUennvE+feDxKD4Dei28LzraOdltzXqFQLlxCh
 7bUIeZgxICywKjxqJxr3tRhBOUI58/KzIik4bdI62x/Ity2mz2auSAJh0X3OwvtRXP2PxQvcnE3
 g/OV0bBM1iBtvnh2y1m/DXd7r7xoq6/+WZaa5aCkS2oaQ23xkswPB3FyOw4lwMBHleDUOnsR72U
 g1NuUu9bxPZZCvQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're already breaking the line between while and do so there's no need
for the ';' character.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 1bd7d89..b6809f3 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -211,7 +211,7 @@ dut_read_redirect() {
 dut_read() {
 	local LINE
 	lines=()
-	while read -t 0.2 -u ${COPROC[0]} LINE;
+	while read -t 0.2 -u ${COPROC[0]} LINE
 	do
 		if [ -n "$DUT_FIRST_CHAR" ]
 		then
@@ -232,7 +232,7 @@ dut_flush() {
 	lines=()
 	output=
 	unset DUT_FIRST_CHAR
-	while read -t 0 -u ${COPROC[0]} JUNK;
+	while read -t 0 -u ${COPROC[0]} JUNK
 	do
 		read -t 0.1 -u ${COPROC[0]} JUNK || true
 	done

-- 
2.43.0


