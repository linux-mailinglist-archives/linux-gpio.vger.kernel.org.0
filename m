Return-Path: <linux-gpio+bounces-6713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B08D1632
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD9EEB2272E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B0A13C3CC;
	Tue, 28 May 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hQ4YZ9jO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0513AA32
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884762; cv=none; b=V7oMa1r8OKRd8cdf8X/ZFPS0ujWEfmem5fkLRD/Wl9xwd58nRcrpN+nw1oEJaxXk5/n1UkwSKtioXFk+6UY3vW5zh0S4Xj2l9eA+bjZsnXjK8Q9/UJRJJGMYyMMROYsIwuslJkNj+i/x7gbP3SzT42OEXPt41OfzFfdRnhOR+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884762; c=relaxed/simple;
	bh=1GyvaNvfpUaEvNsFHnNWVs/AwwJFUlI35Md9Z/n30BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oq5q6RzemRsLIq2OzPztGp0KKe4Q7aRkt3ICtSvBlw8+Y7uzUHYtG++QxGx5D068ejmtTMBxxm2PmLL1z3tbXEHhfKGimAMLsd8ppIXoelrxZ33utDBQuB92FtzOptzs7Sng6vXcjiKqr5fiNmPt8UU9olwv1FYbgI0o9fSDBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hQ4YZ9jO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-420180b58c5so3866965e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716884759; x=1717489559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=hQ4YZ9jOhZzZQbBYAkQ0kf8ok/gKZyddnPo0izbklgQ60GmeLqmtLeGapSJZ976Vs3
         I4qkwm6cv+iSLOKAiQYBI3OLPulhpWI07bdL1gqQrHHsEroj9prGTa4r4t/e8L5rFVhp
         Wu1VEOJ532DxRB7mxRNN8J2eg9d5ngNpw9adCacmyLYDhpvfNKnt3ZL83RWTY6LLnHbB
         XCjYa7SyjQN1CZvbFIeuiMNOVYtWTE16wAz34BhF6zuXMoU1eR6kORrpGLXuYYN9BXhe
         D2qfNJ2nhF6xLNyACvwlI5KoaPhNKLJ1bmJSGQ7AfHk9dbGyqgZYCaNFCCdc0upUiKXE
         SwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884759; x=1717489559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=Kn2hssLhzkueG5S3lRPG5FUFd9zNRWuYJgjnYy0IbxP4lhelhjXqJxERSJnf6M2NrI
         aaR547KiznKI3ZXgo8G/ZSWJ7S1CSG1w1sbrA1yF//q76ppvTNmN8Mcnb16rfQe62rDu
         yRf3kIwWLdkdpv+Yr2jSwPEbU4h3n/PKjs8onB0pJ5vbghOe0/BmhtUcFdGi6JhPoheZ
         mI4U40zJgGx7/7CtuTpXkFhCr6gsS4exqbQWVxKsC6XfE8b4hCwKfoiAlczMzP53IeYq
         MNbLwPIBVysX9ebKwrOK9eabKY4fkpCaHgU5wjpN78SzjidZYlK+xlkQQdYXn6Tgpo1E
         kOog==
X-Forwarded-Encrypted: i=1; AJvYcCWAtypYtzrmXe82oIyQnr6HR8rM5CD4hlF93vM7vRAP1hgbRhihAKvruzaaCcodaDUNYNU4/gbrOKlVNETNv35i+UcMQJFnmZXNGA==
X-Gm-Message-State: AOJu0YzasajCgtWA6nBgztY8e19coaOORTMx/XODhJic2D8xztqvtmZj
	Klq7DDJWKZozD7b7jEP79XNUNBsIpcFimpYtp08+PFb2qNNMebqsjNMmshxcEiM=
X-Google-Smtp-Source: AGHT+IFQ0U5Ah3+NQHgXg1o1RbDKW2TZVU2vwltIjB7MPXs1e61jRTtVHlg7soGReh/q2xEx704Sig==
X-Received: by 2002:a05:600c:5806:b0:421:877:9db7 with SMTP id 5b1f17b1804b1-421089b2232mr83714895e9.2.1716884759386;
        Tue, 28 May 2024 01:25:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fd37d5c0sm96207545e9.1.2024.05.28.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:25:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 10:25:48 +0200
Subject: [PATCH libgpiod v3 1/4] tools: tests: use tabs for indentation
 consistently
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-fix-bash-tests-v3-1-e9b5be2ba8bf@linaro.org>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PHUzz9u14ti8fJ8sk3Q5oiYwXdrwukZ94ljgxiqUlwk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVZUV8PAjl5XmZ2Tdr5e1/9L6E28h92/e9MgQq
 fo17Qk/48aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlWVFQAKCRARpy6gFHHX
 crzlD/9hKgUz/+2Gy5fWOzZHshUWzHXHfhjVUzwvA4+rXp3NZrHvBEUUgLDQWtPJ9qgLEiNiFuZ
 S2nO0H2WkrGsjXr4dFFfUPB/2xdj58n8lyTzexTwL8h0OAgetac/zGJoagBpKkfA5QBw6krz6pf
 HXuGMIYJj3LdMDStOKCl55BJoHJtd9qaTf6uoI6QLe6m7XfWmOI0QocVi1oBvtLVWHu3MrLwkwn
 mJyJJSG3qSjH+dzeKQ91VAKuwkg641e32nQnifBuG7/59ui0QjTMxIwBWwHCvWyb6GKCXn5lNRn
 e5XGJ4UEAWeGX9ilYFT8/y51Zh9Qgb/7JI6B6DOkkR8tiswcUD8wcmHpAl8uHWme8CpOdb4zylg
 sBvIKKQxtoAPCuQaUnq+ewCWeYP3AHjfjBWvmumEoZ9kSCzCq6Hecd5de3CMeicL91MKQWcoB6n
 tqb8PkwYJRplrygD5iVROUdAlTHERR9czfBMpKiEAh1uMZ9+suInEC667shDDGgHr9+N30pIolk
 qA1crUs0RVrJcqxV9rsAPh/8fqMsN5gtcFb1td/EALT5Ut9K3oYQj+j+IN7zWzHh3/CVXBqD4Nr
 G5zD5mSWK7SNsamu0Md+6Kd7KLqnjMgQ2Y8Xqtk0V5IsXPVJ55OfqY8ltzhxel9ifJqptyb2unl
 EsV3vQJIOVBzBSw==
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


