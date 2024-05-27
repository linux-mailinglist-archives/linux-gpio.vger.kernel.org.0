Return-Path: <linux-gpio+bounces-6649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E907F8CFF89
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26EAC1C21A8A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA7615DBCB;
	Mon, 27 May 2024 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zGoYKp+L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAF134B6
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811378; cv=none; b=goNUgVi9e9m7epbnqK+EWnQGkrAh1UyOC1XdElhgCXuGk20fTJ81OtxNHh2XeyeH5qFIn3cvRuZEoU+B9WFuBoE0MkMzio1puRTbwHCUtpnWKchZ1VR+gGuAfWvswiizUkRBnz4RbhGSdViQl630da97S7J39oizPVu47tx6Dwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811378; c=relaxed/simple;
	bh=FijMRDM/XyP059GR6OzQNzzyy6nxhX2Xd+8HJ4mYETA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ID35CPpuUEq5BQj0i74Z9OH9E1rLmdT+tGAlQOU/ylL6U4O8DwnZZVvwiZxjNwDN9n+bBzp2v2P2ipf4He389MDrAx1nvTGUDqHmAFSyqDxDsVtvVvX+6qx0JbtC9pV74zOoXT7H3QcAEwee9wpdmGmOlR+oLqH6eyJxKadWg1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zGoYKp+L; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420180b58c5so45693285e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716811375; x=1717416175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ua7vWOKcUT4Nb5CxnQL2fw9+0aBnMS++besB1T9WJA=;
        b=zGoYKp+LfOs/9YC2dAbQVufZE0N9ABAY5U0YNR9wmvJqW5/RyPNod209r6ADF/t2pO
         UelaPZ3Kh3PrLL72dEq7Es5lFsax8SlylyX6bvjufvBvj/Ye+6k/1pc9TfLYF+ATn8Oq
         OCvnjd5hNtkW7QwXHmD07HwnXA+9sIPhJl9SqkEY+qwGuQN2qTyHGXIOn8SBoDBtM9Zp
         8YGBZJHRIUiG8SPhh70sAl53U8SqPHpgOXTuFc12PXRPg0PBYwWnDxz/ppckH73iaR78
         bWeYAR/wo2ExlDJy3Hj08f/PQSELvGFsmtERlUoc6zvj/ZTJDRLH3qxm1Fs6er9QLt+H
         zHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811375; x=1717416175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ua7vWOKcUT4Nb5CxnQL2fw9+0aBnMS++besB1T9WJA=;
        b=MwJa+00thJ0mtPjWt99/1JFCjVBKaOLRhOmlTN0Pjp8sdKcGs782Ym1uOIERlKKrot
         ZNB9pqVDZC/nrwfMqa9JHbn+JChl0Ec6f84208umoo4WQgYze9KUWWemN1ptdAbD2muK
         ryb6iBkUjubRz7Y76JyHsmZjmJlQG0KQU7zeXc3X7sPgcVYl5xxnHhrj4kBovttVzSw7
         LiMZucW286khSfADtVXFckp6ZhPZxdKlf7ant7f+AfYX3t/d4wFnvJU/QGnat8nwzMLS
         J9qpoqldY5pYLJhNOA+JKUUlE+mDfgOzjTfvcqhhxnj+n8WH+S5wtABAQlj2nj5xwm9M
         jzbA==
X-Forwarded-Encrypted: i=1; AJvYcCX4R7uYyduUjYhf69PoDe8VtaLveL4tU9iekZwZ40fRoSIdTcjl3TIyzM6Vxy90DnblVEzYQSNzOw6h5/JfObmilD4myEalkJGdGg==
X-Gm-Message-State: AOJu0YzyI+3EN8o6xDfUFzFgb8H6qxIwOk8pts4UsImlNeSexZA/NArc
	6CG1JlnjTNGt2TrKxbWpL5s5yM9OiLWl7x6bnGo55VAH8gJgcXeTcdAOYuM+BhY=
X-Google-Smtp-Source: AGHT+IFbguwBGtZzqDbJv0a093iGtZNT+U0Uri8p1O+4sTmj2SSy71jI1isSdRExCiMYyKOSol0Atg==
X-Received: by 2002:a05:6000:ca:b0:354:fbc8:1d90 with SMTP id ffacd0b85a97d-3552fdf2099mr6543948f8f.43.1716811375309;
        Mon, 27 May 2024 05:02:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7ed6fsm8948032f8f.9.2024.05.27.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:02:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:02:35 +0200
Subject: [PATCH libgpiod v2 3/4] tools: tests: remove unneeded ';' in while
 loops
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-fix-bash-tests-v2-3-05d90cea24cd@linaro.org>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
In-Reply-To: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MWkXjJEine5SFoKsyBlWbiJ/NykGrVEZdDeBJ/QInu8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVHZqKYsnreOXRNDyjPxwtwQbykcZGkGwMZIzK
 GjzgKV0ATKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlR2agAKCRARpy6gFHHX
 cnWGEACHkO0r10appRbhw9S12OARuhWd/C9OAQyRpJHb1AgeibVuVozHLPAKUBtUPzwUT8mTB6U
 B7Woo4H4RRKy0dmg2Rjwp4iMsPDSPcq+teaB3zq96kLGESZbjMqVthMIAo2y8u+IVJ/QzSqY8A3
 mXRJIUeQpZtE4b7TSuwX6KrC/+1+LKVIKw2M7Iw61QEgVr6you4hHJYMXo97LOBXrpaeyteP8Fy
 wTPte0pDzvLJv18rjjDvvIb1ls99NjtWgla8XYgk2PAU1JIdva9euCYptBLM8l51plE4Z/yTL+3
 DUP44IgwMdXRdwGaSq8cqxl4By/sXvUYa6NGsO9gn3e/qfa8zVmRFySdwyJAIMzrYcmz2xdVZKa
 GOFt+5qJ0VjrwmEbr/rZK1pR0BUkOFIH5oQvetHaTg0WV0gzWXYXCRJ95yDJczSUwebuxQ7sgKj
 zwYrQ0kPzZ0vDJTsssG4unmT5QWeXR31RC9d49YA8of3LBFNqZbqZ7AR3QGTVGGaBPGZYt+0rMg
 PkwRxkgUl5GN0PBEaVmisQlmswOhqaRdUaWfHZBh1v06TFmWlybgxDJhUitvv6PiWBI6v4oFXeh
 9Si2dSEgdqwb/nzQtv9FsgLnnSaqee6+AhNekh8HpNsMSM5pkArQ72UkMxaYG5+9YchPBoGettc
 kv+s3ij2QYfK6uw==
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
index dde26b4..ff4dea6 100755
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


