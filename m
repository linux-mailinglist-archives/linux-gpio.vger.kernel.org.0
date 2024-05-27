Return-Path: <linux-gpio+bounces-6648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9118CFF88
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FF441C2136D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A350415DBC7;
	Mon, 27 May 2024 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eha53wG1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771A1581E2
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811377; cv=none; b=Z/G3+zlneUYUKz3rHJhCmcJTkvPnIuK6epsAndtcuNPCow+cIOsWY5GGOJ0x1VlHlEmTv7Au7m2nYl+S1ouI9cvvW7wkXeMirJh3JNzWHXZB4btzUCuVgw3nmY602igFHQcRHh375ks3TtGHa08MDT8slBHM3dNEePbXfYAvDDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811377; c=relaxed/simple;
	bh=3SWqp5R7Bu0rvm4UOAB/oEgbYdmdwbaKvQeAvUEztEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEWxPhO9BdwoGxp6c2hvJ4DtZTH2dKFDts8woIHF2WCjrQMeKKpnNZoAx/qxnmEGznJy1bB1H7oDmHbQ/lEB5JKyVfCv/TaJ3/6uU098qwV5OemwuLNH1nu1VKKprptnYPLwIRMkdPiV8xbW72dq8xLhO+L+u2SaXgWs3rM3w8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eha53wG1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3550134ef25so3385579f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716811374; x=1717416174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQoBxcNwEPGeK/CJ2ix92VYyAncAwUaqxKCb5BaFg9U=;
        b=eha53wG1H74HbblTH4KJ6BeCWhfHsabsuBtQigaop9j8AqYdb4O//Zzu+tmGJB6hn8
         ZizIOe1SOSklxi12b2OUnX8UsY6fr0CDZxhULLIwj3nBxGnyBBpKjaOc9hGszWCsq27S
         80MfEsRNEVBgHikF4x1YMGoIRxBZy1v2urAdwZDLiOUhO02AzUYFBtIsccmm5gbIScl+
         32Nr5IP4O7/s7EYdovVtLveCLPPgYjGHKMT44MhL9BvIx5gtAd4UCgKPpLYIVWXTZAvV
         A1Tb3LSt9egoGVajUu2o/Vd5kdtzO5RvhR6Pl3aTZvXKRL2v7/Bjqd71nhj2hHswvs4a
         nnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811374; x=1717416174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQoBxcNwEPGeK/CJ2ix92VYyAncAwUaqxKCb5BaFg9U=;
        b=lh3ltmAJV6IDJM6XsWKSvgyew/jDoA+bo7TA8AyJOhEnNihozxoz1HuiO3lokYz0Q6
         XhvFtuTAYJur6yqP3mf0vNAYqAmdRWUeJDQc8q1mxFzLzU2rm/xkf5KOnb459lUJLdXs
         dV+sKXuEMhrFcBZ6eMbNHuFQm0jKypFMs1yWv5U0oT4ItCIEOk6L3DK0pNNyoLeVoxLV
         jlyhanPsQ7JTrwkd5eLdE5xroVOcjlqdFBWxSznS0LKA51hGIbxZcU+KPBqxh52Jvwe1
         FKtW+86wnhSTmopJ+8wqOrDR50VsBrklQhFLXnaLUDIvwpjHalImo7z03YSveI2WjvJ9
         rp4A==
X-Forwarded-Encrypted: i=1; AJvYcCU1kAZbNPjPrGl8xfBAViNHoztjj83UBYR3wflDBdywEf25E1nrB0RCv6fNf8tZyLpVU2qywIsWYkTRZ1phlPOrWNQKgrkt/RL3Vw==
X-Gm-Message-State: AOJu0YyT44+mU1bo8U8b0HeLPCjgqJlfbvu7CAvrIQsMGxjaHB7MSPHP
	kqjTQEunJ8ix5nsgWuu/7aarE7MvHRB+NuVCGKaNmYKqvNsIbI9YRfz8RNMjhZA=
X-Google-Smtp-Source: AGHT+IE+cB2CbFpWnrN2FoUqb9Uw4B9N182z4qp6iG7QjsRdMOmOAZDA7GvfCNOeTZw15Nz0v+I/fg==
X-Received: by 2002:a05:6000:ecd:b0:354:f8a9:345 with SMTP id ffacd0b85a97d-35526c19179mr6195429f8f.14.1716811374120;
        Mon, 27 May 2024 05:02:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7ed6fsm8948032f8f.9.2024.05.27.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:02:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:02:34 +0200
Subject: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
In-Reply-To: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lAUUanRx1+5v7vYuvYyCPsbxc+iiANfxUeBQZldOY1w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVHZqXbb4fkQjAfyfx2gOICdBTht/00LQWjmU/
 iXMRDtzoXaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlR2agAKCRARpy6gFHHX
 cuNKEAC+RpFuQ04d6MciCiXZLLlHRJq3ndhZspzO1SXs0o/dl7FY4DQV+r/MmRt1AWEk2nNt9hV
 eRbhOElTRVTvC5JrHU9hpr/xD+Pt/MHtnQ6nydCicFDW6lLNNCInXeL7WeQR43DNKSnV08n7Qxo
 317pcm0BKmYXh1gAvVGGdf+o/5O9jfhLGSmv2+wCfcq97Ox5AwAdikveIWA9ypMBsO1DSeh/cnu
 WKurWWlZ1a+Or40HTO1EF3uw50b40BEdTI62hr8B6RdEtSeqOrVSiADDwW35tLIqKsJZIHyctno
 2urV1/ZNgEN3OPGQTMh6Sj/stFSiomA/964bpkURKUtpPFcx5w8PmI26MhdI/+akBlQkdVkmJvb
 Ief9ah2XuZ2eafqAkianyrxKe49P1raThAH4JIR3ATD3812aoKqgHv6NwXZcOqPZNltQv9bn/y4
 3bSr/irghYSinfZJmXDyQO4Gk47fMbhjvTvpu142M65/3cFxCQJWBhh3JOvliKH5Z2aBLFgz3cP
 ufF7bzHuhAPeoBq6rRFzMEm/ulT2b33RO7y9mWYp6VOV13ho+FVaTuhJQ3r/f+7hAfacsAfHc0W
 vP5JGRlbjhxrwq1uNxWMrge5F1nLerhSOpSwJAVaAw8Vjs6kNE1kptrbTb2X6pQ0KNjBuFhKAjH
 OH00+XoPlw+YEtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

$@ does not break up quoted arguments which is what we want in all cases
in the bash test-suite. Use it instead of $*. While at it: prevent
globbing with double quotes but allow variable expansion.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index abb2f5d..dde26b4 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -27,10 +27,10 @@ GPIOSIM_APP_NAME="gpio-tools-test"
 MIN_KERNEL_VERSION="5.17.4"
 MIN_SHUNIT_VERSION="2.1.8"
 
-# Run the command in $* and fail the test if the command succeeds.
+# Run the command in $@ and fail the test if the command succeeds.
 assert_fail() {
-	$* || return 0
-	fail " '$*': command did not fail as expected"
+	"$@" || return 0
+	fail " '$@': command did not fail as expected"
 }
 
 # Check if the string in $2 matches against the pattern in $1.
@@ -71,7 +71,7 @@ gpiosim_chip() {
 
 	mkdir -p $BANKPATH
 
-	for ARG in $*
+	for ARG in "$@"
 	do
 		local KEY=$(echo $ARG | cut -d"=" -f1)
 		local VAL=$(echo $ARG | cut -d"=" -f2)
@@ -253,7 +253,7 @@ dut_regex_match() {
 }
 
 dut_write() {
-	echo $* >&${COPROC[1]}
+	echo "$@" >&${COPROC[1]}
 }
 
 dut_kill() {
@@ -283,7 +283,7 @@ tearDown() {
 }
 
 request_release_line() {
-	$SOURCE_DIR/gpioget -c $* >/dev/null
+	$SOURCE_DIR/gpioget -c "$@" >/dev/null
 }
 
 #

-- 
2.43.0


