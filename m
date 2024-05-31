Return-Path: <linux-gpio+bounces-7011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328518D6361
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61EB11C26E4A
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28564158DDD;
	Fri, 31 May 2024 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy9Q/CIt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EF2159568
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163197; cv=none; b=JQzM0PJ892ejby8joyiyXnCpIkRZU3EQAQ16ZUeA4bU30ZmuxwHlwP3YOINzwR1bB2UhMXKQd1VyXOEO5woEoVZKVSdTAomSChxfxEx4L21gr18fL+Ve4jpZIbSjidHJYTS4fuqWeVEk1fjg80bK8v91hoFdGyJbm9q9uJ/AGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163197; c=relaxed/simple;
	bh=NBybXA3GPGcTsruVKqkCPXEx9amWzl4H+PcxLDgEpOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l4vSLtN3DKcu6r/XQZSNXoJCb0EiGRSCIutjTePeevQktVlDFsJruh1NUiDZVvJ+G9SCYcuPblwT7kfUt8y73bnWfOYIXIAXhcpjgOTUKtPsHKkxt1FC2zJ1vt9jHfqwcrkDqKKBbEm8gOqapC5Zczs6kq3xlRAADGN5rblFAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qy9Q/CIt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7022e0cd0aeso1948259b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163196; x=1717767996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuWd89i6TAstntq44G+EqiFFc/8djIoOeImzcuc1tI0=;
        b=Qy9Q/CItjAhD3wD5vwncMDPykpFGxEG5IhMKYJdStL1kTT57bcWkUBrAOiLzi0LrX/
         o2hMdHi2z7Nr5tzTSrSZmZcGWxF6ddwuF2TDaoOrQq8j7cXtRYkeAqJz5v+4ZNKG5WKX
         RDgPHcwQU2QFThT/oVH+NGOANp0uQ6uNU8XPt4r+ZjvYHAzXO52R4J+wMLzRoa0PJp56
         mlWB9nXnHT/4imOPbIm5W7F0EY7b7Vjuik83ARzH0nWIYxuTXtjUGZZs5mBsm2p3gRn1
         KPdDwpu62OS41Vb0XtGaY0ChoTMkuEs/WEMbASBT0iRowCdF+eJ3igS2MUTmWB2OACIw
         0B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163196; x=1717767996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuWd89i6TAstntq44G+EqiFFc/8djIoOeImzcuc1tI0=;
        b=kU3ohn2OJ1z/eOZkPkRZTClZFx4MUeobFvfHjQ1eJEY1JMOTQILi3PjLBXGlWntBrJ
         Vn5Yv8wHtdN6nfSC/og2XjUj8VlHFqBAzBB8DRo0cLqlMgCTc6zbCxDHB51xI3Ip1LCn
         7+xRGI4KKRkneiiO8QT0I6d/nt0wzF6K3xRs4LH3u+tfbuxce826WSNFMnJtqThay++w
         Wv5jr4v3KfRX0b9WZMeUkxFll49wCTXxi3wjs6iKpxw/AR1xuVGUozwEhU5aSA4o6mUx
         vitOdXd5id/VFIyl8ZBfgHI5CY3sGtcaKvHNI0uIP0R8EEshOy1lvD3cmQf7cHqCxl86
         8xWw==
X-Gm-Message-State: AOJu0Yyz+AWvCUP8imGaSCPT5536ewaY7xZJeMEVFB0zg0foPbztg4LW
	PdOdq5BVMLPpLxl6E5FHTpyZ6Pnsa10AdID7sxQmY+q++rKhoxy/DyvgNQ==
X-Google-Smtp-Source: AGHT+IHjXUKhmisuBWcCQ21+THhc7dWgfg7BnuKi6FVbXh2/cLtlg5MxNO2kfUX4yvUcn1hX1Q28mw==
X-Received: by 2002:a05:6a00:22cd:b0:6e5:43b5:953b with SMTP id d2e1a72fcca58-7024780448bmr2146017b3a.14.1717163195742;
        Fri, 31 May 2024 06:46:35 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:35 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 6/8] tools: tests: check exit code directly
Date: Fri, 31 May 2024 21:45:10 +0800
Message-Id: <20240531134512.443850-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
References: <20240531134512.443850-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2181[1] - check exit code directly.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2181
---
 tools/gpio-tools-test.bash | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index d9930f1..83b05ec 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -3069,8 +3069,7 @@ check_kernel() {
 check_prog() {
 	local PROG=$1
 
-	which "$PROG" > /dev/null
-	if [ "$?" -ne "0" ]
+	if ! which "$PROG" > /dev/null
 	then
 		die "$PROG not found - needed to run the tests"
 	fi
-- 
2.39.2


