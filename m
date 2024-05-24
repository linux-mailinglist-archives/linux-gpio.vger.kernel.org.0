Return-Path: <linux-gpio+bounces-6611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2038CE955
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E40F61C20BDE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AFF3BBC1;
	Fri, 24 May 2024 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zuoMKSD+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF103B1A3
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573850; cv=none; b=ki4IpD6yIxesRED7jNE/o4yhzLFcANkE50tQId19Ae1cVoPxP2O64hh/9qP2aMkBg4R2rmKAgSQGAPAOZc3UgI431DdIlxBY9kyFIE8NlHAIPRjpgVPWGKF1G4tGb/uKabQ9pF30Iri5ILLQjW+lUKfmsrQaPus/g7DfE5bZma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573850; c=relaxed/simple;
	bh=wYbreMX2LOBMbl1R69OKGsBBvx8WqKuDaihyiydcl8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cauoQiEfH0C+uhaRf5Mg1xt3w9vSJ4GkCbeqWSdRooX7MkXzsJnJZhER80JRD8TyKl14O2yVnT1pq9lZSpZWqaiijwoyfBPh6NJ/z500b1C/pt9XeY+IdcNb7mbP4v3CGEdWe/DnqlySwXRIOHtMiWU0iWcGFDqkXEkyjO471tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zuoMKSD+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4200ee78f34so32458885e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573847; x=1717178647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSfxUpsCurzjN9zrJCHGoSodTDdImTIm6nR1mONwCw4=;
        b=zuoMKSD+vcgLbM2uXyNFaRKjIBL9epkBrwqTUg2s06uFgoJmXe1hYuON6YadYcWszl
         SNobrU5gwZxBq+dYqgUIx1S4n4hTY19nsy4i36nH3YREAPGFSX0dvQ0NIFQGUhcdoGAT
         +RSJmxXYe2jpI8c7g+3IOC7jfZzsuSlE72sPwyc//2+AkwJjbDXsSZ+RhadpWEe/4zCW
         FC+8Pppb7BESQVPtmG61Hnq5s/Wug0QxLGsrV2T8S29TV0kAC0PcXnOB7IVnKnPizsG4
         vhSPAoi46V8BNjvo6AOE/mldmSpxmppxTMeM9pIlx5GZzIlTzedwSOWXLHUZYftvzKGW
         Z5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573847; x=1717178647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSfxUpsCurzjN9zrJCHGoSodTDdImTIm6nR1mONwCw4=;
        b=F9dGF5FVKh4XtOPaRccX2vDcLRbwQ6R9gn65x/59G111grmjHbOwkqXSrLttCGvFpj
         LLrjJoFL0cdNZ63wZP5tAYxQeW1eYzgW6Zb0eVNW/9jVhvrCBBCIrV4xpa1PVzd3njEV
         Hl020A9U/s7wIqnCrKO2jgT244x2FU2LjKP47bmOTThGthgVFHVY7LssiJ3esWiXs5bO
         uAMI4UYN3jfihAbIDx+eKBKOURTfZDRTRCIdS4UzI6A4SmzE2lvA8D4GOZif4nkG7lGU
         /0tz19lhTSCEMC/Wlg3ysrJRYlYrfm6Y5+3O+JNO88fMrQdBJY/eyuL8yak4kj9prI1R
         KLYw==
X-Forwarded-Encrypted: i=1; AJvYcCV1nhH+6UFDlrZE76nVOy+sPeWVBjkRR5gzXXDTQyhueEl9FOiiQmu4iJyifLkp+Av8pxtpQkpxJaPmx+/yUaPRrdprmpSwSvOWjw==
X-Gm-Message-State: AOJu0YwQSNAvv7DpzV30aYSURrvay1k9WLQp1k1Q4cZk3NrTdS7iAJUm
	+yJobHj17/4fp3ksqNuah0xvpJP1zafQYGgXWs9LckC91ERFJJcaHWizGTaolyTfJG35PG+TiZX
	i
X-Google-Smtp-Source: AGHT+IHOHenXG5qdtvNWf1Su5nXL8hwRdoxvrrFOYjBwcGN6L+65EwNiOUhoIN8RpO+rkZxobBCigw==
X-Received: by 2002:a05:600c:2111:b0:420:1fab:177f with SMTP id 5b1f17b1804b1-42108a0325bmr22245795e9.30.1716573846976;
        Fri, 24 May 2024 11:04:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:986a:afa7:d450:11a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fc82cc41sm58338675e9.0.2024.05.24.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:04:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 20:03:29 +0200
Subject: [PATCH libgpiod 3/4] tools: tests: remove unneeded ';' in while
 loops
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-fix-bash-tests-v1-3-1397c73073a6@linaro.org>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
In-Reply-To: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zGsTLldY8HX3ZiEv4OGR4VINX6+NtXF2XY9jTg7Ha8Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmUNaTbpdROYuWntBCA944J1fh2W9gy+2BZl38+
 5mbnIcZxweJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlDWkwAKCRARpy6gFHHX
 crDnD/47+T6uMSVvaWTW21HoT7p7e4tYbsINiTSATReu4yCQsmueN7+ZSwgCU005Cp+Rhcnr298
 bAKPWNbjycIli76mQsnkxfreugD/MyZkaAsQ7hWn0Mj0pEgS7SYJ2VJUheqYub2kVxFl8l0XYy7
 7uWUspQJ4fHjxsgbZmoyk+MKux8P+E0xQ29FZlLhxTtGemzU38iFs7W/6dzjTI/dV2HkYFKF7iq
 uQQsVzzGLmF7LzVKedHZDxyol4AfTOuRnaIg9h0keWVe52Q9+hVsFVOi6WnLXEL//DjnRNXE8ZZ
 bzgjqAvjbelBeHHOdG60oRkJhOOkUvauZNBBI9rjMdVjePMZe9nHf94CE1OhUYZe85Lr1R9oiJV
 CAAgo6skRs0V6Xc7bPTZnF5mpF8vNCf9HhAx9IyItYnYBsHcyaKgbSUk4VLNOaAhTFe3agP5X3B
 YHXXSwlYhSUs29qk8zCfa9UW7jRp0UW75k7j419HD+BFDrXjQu3rbwBzBObMaM6aDutYJG4WwQw
 Isuetm+k5/9E851m24X7Ui3aN+QWTPOOG5xsBSue2q6Nc0VvaZti2ibSr+Ps6n1yn0oBWACHQTk
 d2q51G6oQciUNSkM5xlsxaQ+ujf/3iUwqeUUV4ayvKdsbexAb6xo41X5JGaXfBbOW3XlbZ2TY45
 KCxZBx6HqyKYhJA==
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
index 8b4f054..efd895d 100755
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


