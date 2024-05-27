Return-Path: <linux-gpio+bounces-6647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 844468CFF87
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F182280DAA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4213115DBB9;
	Mon, 27 May 2024 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vak/C2n2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032313A3EF
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811377; cv=none; b=A5PJoBisgurAZtlkllunpYTuL1nMhPWyswqQu68Ru3VdC2KdrDVzM92yrU3pyQ4wK6/iAHIWLxeyPsKpSktyzqKOYGsteWRGI21Aw5jpq0dlL5AsQI9WrH65HgrnRUFFK5OHJgmKjaALH7eqBZBuGn0Fl1pRs1eridg2bYG10cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811377; c=relaxed/simple;
	bh=1GyvaNvfpUaEvNsFHnNWVs/AwwJFUlI35Md9Z/n30BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+CYYVBjFltsHr9DiUGQ/G+mW9mCW78e/S2dVDfFCXKz6V+PFFaj8jzWQBZzI3KpqBpuw2yR+Pao75DYy1phBqrNkLou4A6+A4jzdtBNvcai1LYePSJDRnqM4c/r8BT3kC1Bc+L9mBdYjbGXXjKV00wRdhPDpdZwFcXRd3tmWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vak/C2n2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so4503688f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716811373; x=1717416173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=vak/C2n2IIlzQRDIJ4EMaoNajd89sBl5Ad3DoGXqPlhBC25nNVcoa1FNc+qQ6OmiI0
         rtwMpCVANWL38Lrz8VI4WyO7YI4Hn/Rn4OpLaNhtly6KGKmcGK76QQWUzPNr5dyTfsyv
         aTFQJUTqXSupMXOu7JtLlo5RdEkq+ikUPirFNuyiFf+jp6aCgTtOL6BXfi3BjurymSdk
         M9ApQgm3OXqTHcybRE4NsoV+ROoIjBu1d3N46UcauOfHD/HCpj4Ucey41vrTUhwFAn1r
         EXlVRqrW0L1HKcKrHegX6+aTcVzOXwU9WZqdGAqA3vVngv1p43swO/fDqJIzEtVoOM64
         6vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811373; x=1717416173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=ZWKGe6QuaoClkZTl2+IzPd64RHcAqNTmJ9JxhNxXrKjnrV1qLkf+B1hr5JEu8rZAhQ
         SPo1sbMw4rZWmpahx02OPVwXOepMDuMuIWnGY9K0V/q+M1NwCLs71J5JTqdNELApABs0
         W73XhDW1bUK0/hi4YaCNSjCPay/VLjGhmD1EHpg7NLQoy2tJCfVKzKPDb09d8KzK/5yI
         zBCyCQvlVL6ayUU7YGfsDi3CHICTG6FrrL1D97Hz+N6JsjZCRq9QnESgx61kq5UKRhxk
         xubkvR5TEfK8qdQbw9gm5MId3a+FW6PYr5x6yO3ggSNJUE05DeDA9dgbv5eJ+vM4N8I6
         WpJg==
X-Forwarded-Encrypted: i=1; AJvYcCWJZiXXwxGmUMQtvtHPbrLe5QUNnnhRtvV1LK0Tv+BoNKpiG7PTNoJxUP0iVEaVuBJK8w9e4R8EYpaujCNtz9n8ufdxrjDDQ8GeZQ==
X-Gm-Message-State: AOJu0YyHXOuUJRoCuW71QwlpgejAjZYFjX6b1fth7HdcIs/xhNycQ96A
	IRz73XGXtDC96oWNYe2XdsetnsnSsDSNaQ+SXWWXWTW6HtWMEjNRUzAVNNucejY=
X-Google-Smtp-Source: AGHT+IHVxeCXazkPTiFMkTn28dY9tUbFeTthnhR+ht2mXkNfq+37e1sai0C55NOnzAe6iGJLxcKYUQ==
X-Received: by 2002:adf:f7c5:0:b0:355:161:b7e6 with SMTP id ffacd0b85a97d-3552f4fffdamr6206698f8f.41.1716811373537;
        Mon, 27 May 2024 05:02:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7ed6fsm8948032f8f.9.2024.05.27.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:02:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:02:33 +0200
Subject: [PATCH libgpiod v2 1/4] tools: tests: use tabs for indentation
 consistently
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-fix-bash-tests-v2-1-05d90cea24cd@linaro.org>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
In-Reply-To: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PHUzz9u14ti8fJ8sk3Q5oiYwXdrwukZ94ljgxiqUlwk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVHZperRoi5c2a641dj2uf6ERVp0Kqcw4Ljpaf
 nYL3rE8V/iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlR2aQAKCRARpy6gFHHX
 cm+sEACsyiISUolsa2hRm0XADbRQf1308bD0j4eBFrSyDY19HeO/F6DfuDDEdLowXTkLK6y07Lj
 65q80+8pqe3y04GseHVJnBR7CkKZ/HqtQ5eyZ6HiHbPkFOuWpUSllo0EJyrO0ycgSFJR0rbhUT1
 UpYimoaDadfLuJhno39KgeDwsrdBcC6Vef7/ppHUfXDlEttZDmBrJo1LySE5pms4pYLodjdWrh3
 HbaLjT9kalOfaKp8Pwf0PpRAThNzOL/VbrM9pjvZ9MOLMF5WX532/gGHEsNkti8Tk4s8YpHvIyE
 PNRpftXCDh1zkTDsWRmw2YkBUf93V6FnDFPwWUXXHpStAvyQo8jVl2VNBwr3Pz9BWWHS+tpJd2O
 fKi1Nx5NTCI0+lgb7L9OFw6S+gIH892KUYoMxO38I4gXyDJZIYkyDP433ykZou59mua317TEmX8
 lzDy96E2lQRE6E8BeuxLWqFxshaelnB+itVMUF5eD2LnDB1G4bp9su5BfsHTtZRpV6GWsx78y8P
 7vHQhCDaEV4eKnEG7EW8LCLPVi+fKMmCKYOc3KcbUNMCDbm5ifxkmyOvSXOo+DQQX3Jp8J8RPGR
 XosA9Mp9ZgbtCePePjvdE+YrayHuDRf/BsTq/t9aNv36Sw3h8TQv55r8NGf8gyDSVaUx6nH66Bg
 N11q0l81jW8QMzg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace all spaces used for indentation with tabs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index b55c5eb..abb2f5d 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -203,9 +203,9 @@ dut_run_redirect() {
 
 dut_read_redirect() {
 	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
-        local ORIG_IFS="$IFS"
-        IFS=$'\n' lines=($output)
-        IFS="$ORIG_IFS"
+	local ORIG_IFS="$IFS"
+	IFS=$'\n' lines=($output)
+	IFS="$ORIG_IFS"
 }
 
 dut_read() {
@@ -269,12 +269,12 @@ dut_wait() {
 }
 
 dut_cleanup() {
-        if [ -n "$DUT_PID" ]
-        then
+	if [ -n "$DUT_PID" ]
+	then
 		kill -SIGTERM $DUT_PID 2> /dev/null
 		wait $DUT_PID || false
-        fi
-        rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
+	fi
+	rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
 }
 
 tearDown() {

-- 
2.43.0


