Return-Path: <linux-gpio+bounces-24413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29EB27C28
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147FC1BC47E3
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55712D3A6B;
	Fri, 15 Aug 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mkm1FBYx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D225A2BC
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248286; cv=none; b=qg4/3+uUCF6hcqn32JUyU9nKgz+ldEJgyV1DpfT4tBSJKNhfApULsat10sFY5Yk1k5tVypg2uH1C3zV7cWKbuPjFxksji/WSvWSZwGYC3C9pLFJN6XZQ3zcUoONuH8ksdU11zM5pDP8Thcd57bHFWIf7wlWwNYXZwG9/9OTTyyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248286; c=relaxed/simple;
	bh=Qb7YheZffAUVeitp0xjDHj2mKQXwfvZHS6qct5CA0WU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FolPrvk0+uWT38Mnz9iTl2P5/e5kLgD0nDXsh+rBE3XsTo7ZjjZPv6tPo3HXXmIn8M9S0h1YxsXlvFlXUN3GRd0/+zXyHwjxeuzO3kPfkWMIFz9sHVti62lrXiK0NS53bIsFWATmpOvstZJCJ4FLycN3xUq1V2TGGLR/sKlX380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mkm1FBYx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso1552708f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248283; x=1755853083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APhu76feC3eVxDk0yPXL5S0pgcIKNjYVcZgNJk+cNFw=;
        b=mkm1FBYxdyq+lT0tqiZbHzYbgxzABlVDeD0y1Zyq751rc/bPx8zZqitDVmN3ywh1Bp
         ebvrLpksutdb+O4A4vwG4jEaQPVL/6IsLzzlCU+ZSJ7EM7jElpOYM7DM3NrGVKJtF+fD
         aUwOJUvhhUejPTff0PUdovsMn1Ld9SXX5qSlsdBBwMReu3ydnib/A+ZfSUNZTQNj73SQ
         YF2SPkRFm6cMQLV3Ei15Bo1Qpvhj6QW84AGStddFMRtEgEjvgrRoTFOa6WRFr3KrGuqf
         qXTbnjAPQmq+WmWAusy4XYumGsWvSLhvlkxpPo5S/bNSR8tHI7G3LbcGSCcoPJ8QOWF6
         1EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248283; x=1755853083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APhu76feC3eVxDk0yPXL5S0pgcIKNjYVcZgNJk+cNFw=;
        b=SsS9rpceZOlFI5Y+CD+LKPEA7ydGdIntxKJ7EmAgKVyzNFqgdzUzpgoX0GqIiOAoGt
         xnA6v9DboeBbqgec9iycyKXs/nQTI3dQmX+6iuTznsS3UsbGrClEBkOnnuOdKZXu8Fim
         KhtX9XTOtVvoqszPh/ghUBFsBNsbfM4gAY+1IjsZG+FQPFZxTO8yi7Ax8Gw6JtgewPvv
         udGUVm3KRmcujYAFCfQ5L8uGkmHbeam7+3uOnuOBbm08jndCCrP4T+2yRm3x3We0qwKN
         4Skqj4219OzHVw5+0JDM6qEbxxcxE1AE7TQhP/jrsyKOrnCgqYRD+1OMW7XGwU25mJVM
         wt3Q==
X-Gm-Message-State: AOJu0Yxz0G82xm/lw7sKXmxhjRt49obok/MG2tph4VBVShXbGSPOhGKn
	whH8zV3Cu2zYToTNzXBn4She4kw+Y32okMktVK8yetufAXKHSncpvXVaW6MAdHD2VH+zwiYMODQ
	tJxrJ
X-Gm-Gg: ASbGncsPCcNIpblUPDFJgy89ThCnCkX4dfG/D7Atfhm586xTyDPeEX/EZ1R2OJrOOkC
	MobHxx4DeDo8FDv/f3x5bAKpGgD0Db8yuWEfg9sRklbJYamqjWns79tFgWfd4FN0ASjbIOUaqwu
	ha/2j6Iv3fxmTgXIjANaAXeAbTwp17wg7A28o8yN6KXZIYBLmGnqfo/aYOlw0XGgxCeNrmmlCpq
	m/fmCPdHD8KYc9itwNRNXbjYjo73YvR4V8t2vaHPtvW3Rj3JA4I7hi0Y6u6s09KFazdkyy+/Tv0
	2ibnq407OoWkIsuZ09Wqj+a8RnVKxyXq6M8TJyIT0NBlU5L6eL2UJFaiSBhq5zAKxUmOeJfHVOj
	yEiKVvoDAOp45HZJDkw==
X-Google-Smtp-Source: AGHT+IGjGyeerj72xkjNGQ3qHhFmEciRabvJi1QjME1NBHBv/1VcMwIlxa+lkmwXZOIPjQ5DghnBSw==
X-Received: by 2002:a05:6000:2204:b0:3b8:d893:5234 with SMTP id ffacd0b85a97d-3bb6969b243mr1060141f8f.47.1755248283231;
        Fri, 15 Aug 2025 01:58:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:53 +0200
Subject: [PATCH libgpiod v2 5/9] bindings: rust: update cc dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-5-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HwoLK4zY+THHSDS/1oig8Gd91wHrt/YeK/EJQbSZxAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaU2dg9Pz9TnvJjbZS0YNkVpYazt8M/rAIgn
 nYeHj+Cqf2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lAAKCRARpy6gFHHX
 cptwEAC2sgugGDsre7yKb5uCB/Ii/1i9SpOUo6QCsZUqkDmWnxRb/MmM0KmGSjQmPzOhYC7C4bZ
 opzfTHj/3iZkmasCmYEIn/BlT5phzi6CaKXS9W41PysLMDcQjNRSAP22iKAdgw90U4KOfafT7mo
 poBxJv56pkw54ykdQcsIu8dM7BJLDtWC6OAN2JvNEbVMtr5AgnBCtKFwxrFCpsJ/3wAllgiUiS4
 JBMdh4LJs8TUN7b4OOa/LdqC8+6IJblSiVkB85zwIDEVAQj3vRgrgtEtlTbk7QvDAxjJXtl/ItC
 eT3OSur8YDLmUfawmjyJT+74QH8RD1OYmRcE2w/8rOJ0qTeMoC8dHlOiTCVQMidj9DNjE80LJC4
 C5s/RN9IbBgU1v26hOtZQMAYHJEMvMf3pNvtWMsMpVfDww8JjcaBJjVlOqHTpM28jKZGNzkd/ON
 N3DFMh8wlRCHx6u8HEqrHbAUvJPBvOdvdaLBp+P4GSXf3r1pT6xnvtmVLsMOUDjFOPjthRKFfYz
 PY8t78OwStN0Z2dtLFSBG5loDV06KMf++bxIrjhALB00C0myBYIjwcB2gEZ5poRrAr1t7OIan6X
 IN0gU0g8mtlzJAAvQQI2NfkTpGlaPaLqO6h0yldw6HNJ5A+eqKdHqerrv1EETwirBnVGOpe2chT
 o6yeJWC9mTXYZrg==
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
index c5e044acdfe94f8ab32d288c90db1233dd223bf9..86324b3e192d8ac4ecb45cc900c75537d2df794e 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -20,4 +20,4 @@ libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
 bindgen = "0.72"
-cc = "1.0.46"
+cc = "1"

-- 
2.48.1


