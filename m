Return-Path: <linux-gpio+bounces-24414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CCB27C31
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365E86200F1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4A82D3A7D;
	Fri, 15 Aug 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E2FNhH0S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1D2D372F
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248288; cv=none; b=U/mvI8v1pIjY8DqIjh8BWM5hH/QJdRgOBhklIrxGunbpDseeJyw5wXV/iBYlYXnIqwQ61GtHD8HCj6mqNHfOJCLIoC1+lo+jom2H5iE953kTodww5bF8nYdqBA4csCNVkpxPUjAZGZNc/70Zu3YJjZUuekN5BnnxZkAsSjZKEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248288; c=relaxed/simple;
	bh=GjLFNvpj73SycOhJ5M6G6GMmQjz6KuIjrzVh6cw/iO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkoGVjc1Lpzqq0uQdpVZK2hJDucDcoup/ZdlcfuWlZUvbXe9L5TzNhXoDuZBHKgkdbRLgA2j/x49JsTyn2BV+VrrKNo8OLAjz0u8quaQM0QNyy1c92zVLVICkq3I0xXGpGQ6COBOqU+F9XsL9XSNIxEhjFEunqh0ihcVRtOAcs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E2FNhH0S; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso12307625e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248284; x=1755853084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZsIFxYfUvbOLN0nvdBdNM3qF2+XjPren36s4t5o34w=;
        b=E2FNhH0S+KW7yM8p/iDC9y3xWMbsckEJZd4Yy8vOKZHVctlwMfFxmpWB3KrCOpR9f9
         N3qtzoG8VhMeZ/+rn7/H4bPBFq5KZKK++/1VhkX2233uh58RkivjFBZroI/jsmelgW8m
         SKWuBEZhBNir+W8P81GLtrYIu8El+dEbmUoeHrZPVKxn7lm0vqBLW1ymu5eU9aDmZ4Mj
         atKkrOT86VaxBMaU25qGuUtM9cZru2lpqvRYwYxqNE6BDn3xLBK4dPDc5by1CneClofv
         SIc1UuE/23wL53YfXndPHYKY41qZEdGkxxcbMl5hjfk5TwvLy/aVJN3kHw5ivJfgNbq+
         lCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248284; x=1755853084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZsIFxYfUvbOLN0nvdBdNM3qF2+XjPren36s4t5o34w=;
        b=n09Xdt9iYgwYtt9yz2jaYAssvfmmjsvgA4PW6YKvkdqSQD/0oqnHT0+84KikBmJUuK
         mYcMtLpb5E06B+yo9EZmlqiwiGY9ulcsT4/OJ9oDzMd3Z1AxQo02pbSs6W0WYnm66/SQ
         jWWtptG+rj2UzVGTvHMfI36OW6NeZXPasU6gF5hrvOmVFkTODOaQWZsxQ1JYtkN1JUYg
         1f2efhBZW9VmcYEAB55vF/fhQlW7QNOF+/biwoqNyqKWnRR5GvZW2mkqf09eqgMsysq+
         oBNI1qszsY/n5D6TIMKLIuYI8nxCBfogOTGfWsVXzQyMMXFvK32ROynmVkuHAtt17smY
         0CHA==
X-Gm-Message-State: AOJu0YylKKZCNDNbLs1q2xFrZtzglGbpCvYWk7Lo1GGnOTwecOILZWUZ
	LO2JsxIyT46+F0MSyQyVXGrHcHnnSnxtrHbg51Rh0DlisAsMuSCpU4o+3c5TMR8zfMU=
X-Gm-Gg: ASbGncu5YUhxru3wXawQS9O+DuAYLDtiwRrrK+qGSE5/dX7lAaCQgpmyXtnllylT013
	uG/rD/syZLVfiHCY1FLa5XGp7uqvIg8F829vGCMSssLDpjJwWa+e3t5HkhZQSHGEb1AsGCWJMlS
	Gc8oibWPghdRd0KzP2whEY3W8LIjiPuVdLfxQs0KER5jKgO1PTOjWEq1fcDS9OoikVZmHjYiDix
	/A2rVgPj9ZdaJMZI3LCav6TJuYku7XH12rWvRn2qdX1Qjxdv+Wf8XNBJoLZqVJqnjVsFHMqaKNt
	evRrICXD5a40+EDrW13HHNiWHzbF8OmKJwrOWuj9fbmsyBai6DQxzg5NOEpL1qq37y0ti/ilqhL
	quimczfGpPgNO0lTMZg==
X-Google-Smtp-Source: AGHT+IFdPEX0Bx8JeXsPtPYM7JzMGfsXcTNyA4zRy2NGfv7oaRgNftWAUNYYews3Ubp2kxY9FM/IUQ==
X-Received: by 2002:a05:600c:1d28:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-45a24208b9amr4180875e9.19.1755248284276;
        Fri, 15 Aug 2025 01:58:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:54 +0200
Subject: [PATCH libgpiod v2 6/9] bindings: rust: update system-deps
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-6-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IlGShp2Hep6mVy+Gr7rNSUZuWvqecTC+t07QPcUthKw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaUZidAFjdEizPeQDYoPXHqZgVrpkaJMq9Ya
 EOn0Q2kh4GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lAAKCRARpy6gFHHX
 ciGJD/9lejNeWNCbeTlrUygQwXHqHdZxi5fOEXPXYtdS4u5suQvlyDKCrMZUIrW+0XGruvD+Aao
 Ee8k+xaQDj6vdYwCWALWXXkw0J6g+DaWMTPfk6fss40t2RozMF/zH8MHH318nDf/zSh0YQxnYXA
 dvzUHw7uV7Qyt5Fp8NrCI8cZS7yp5HG77ZxyVUWw0xfCvIGQd7D846Usfyi0XA9leUynGmf9BJN
 zn21G8LIr40FMs1IcKlG/rrE5gueNtaXL933GK8o7Axv/m7+/GmiVVEMV5+gPOpBhA4rUc5UptE
 7s7XUJv7zTak+DCCCg94JInEHt69bOMfYjoBKiXDtZdWwUKj8hUgzYeZbYfLGTN7e1S4Yyyqm6R
 Ql+4npzjQTvTOs7MQoILMWVluIQIOCMviFUqG/oJgV0XQrLyytZ7qH8idRf8Cc4ru5ieWQINu22
 VaueK52NbyanRKu1V3dm4RwuMdL/nERNL9S0sJaJceU2bizd5S/tebMOQhpp0Qgro+NgA6TIXpv
 Y1g3RFE+ZzigdurQDDK3qvjoxO8YaE16cnNeNEcwlg82zT5LEGXVbRaEDnmb8PYdGX2rvhKjC3b
 pQnOjeqa4Co7Mh+xtThGaBdwvP5m14MeCFyq2AMZ94SbpugJ+PuaCj1EJF00+NDx5rvXRb+bOPi
 dwG+iaDj98nqE+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the system-deps dependency for libgpiod-sys to the most recent major
version. The way we iterate over libs has changed, we now need to convert
it explicitly to an iterable. No longer require a specific minor
version.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod-sys/build.rs   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 269d69bff9d62c07dcceb573ccc705cfbe2a4cdf..dc08f83ce3ec77165d240516aa2a224075685f42 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -25,7 +25,7 @@ v2_1 = []
 
 [build-dependencies]
 bindgen = "0.72"
-system-deps = "2.0"
+system-deps = "7"
 
 [package.metadata.system-deps.libgpiod]
 name = "libgpiod"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index ab5b11308c92579a5b16883d47ec5a616c2db78c..14fd0b011bd6077b0c9be1905b8faaa1a5a39e0d 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -27,8 +27,8 @@ fn main() {
         .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()));
 
     // Inform bindgen about the include paths identified by system_deps.
-    for (_name, lib) in libs {
-        for include_path in lib.include_paths {
+    for (_name, lib) in libs.iter() {
+        for include_path in &lib.include_paths {
             builder = builder.clang_arg("-I").clang_arg(
                 include_path
                     .to_str()

-- 
2.48.1


