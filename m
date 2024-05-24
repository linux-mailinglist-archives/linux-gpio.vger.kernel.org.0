Return-Path: <linux-gpio+bounces-6612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8A8CE956
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF107281F61
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1C33BBCB;
	Fri, 24 May 2024 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a01tE+DT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CA53B78D
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573851; cv=none; b=TJd1EXOxsJRwhC0cViklCPQNEVc1aP9sfkAvM4BMCHDg2vX5WGw352XYanRJUeUuHR9uOiT3nZ4rZ2rxqKy0n0lz9FFlmXOBDuCtsKrTP3NDHMkPtWpKJHs55Tr4IQj08ezkKCnXbAEsUlhbXJ5/rc+m2Ee6+V+HXicW6MFhPrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573851; c=relaxed/simple;
	bh=at2qeg7TZrGB+vqR8Tw+7OB/9/hyQe6VN2Q5tm6MxDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpFfjrh9WsIYoNo35Tz7paIvbZS+Y/xKST1d1ong0AHywTFSjUJwdOetUyuvE/x9768tIcr2QFyY3d5SqSYD1ELjZKB8qCOsYK3i403iJApOxV9Sed+ddnD91WZ/GeSZw6XRjZ6NuUwIDeMiFixOOn5DO8DaRgjBi+oimrVCEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a01tE+DT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42102c51524so12355575e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573848; x=1717178648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENB6cfVwUITPokGq9QFCSbQS03CG8NsMXHiVtHbY30A=;
        b=a01tE+DT82NvupyrQd67QVV/ZU7SNCRjsDClwweyspbw1oHKUeuSYGKhr91M27Nd9k
         pkDOnxu4cOgce697JMbJRS9ni2Ad8T7W6Sd2ziF/m83+d5+442TTmaUnkCpNN3UK1yZW
         KxER0C+ZtS+LfUYbsvyGeZteUi9zCuL6Q40ggNylYTVexp+JTg937R9W4zDTC0N1A5hA
         NZi/Xy1WrUx4mkTGKoUJWG8sxnu1bojanUUmctNaiMvOApracpY2+I5teR4Pl3GxA5cy
         ib/OJJ42g6KiKpyVmXHumTHuOcoHk/z5+QsrZMLbYkx2l6EgFzJSpkyvpSHgkGQ30v08
         G+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573848; x=1717178648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENB6cfVwUITPokGq9QFCSbQS03CG8NsMXHiVtHbY30A=;
        b=OO/0+AultLfGBF/F01CIRq/Jfw6hVc1v+N8pM2CQmWCFi9AMh+aDmDLGrGxIvMgMyX
         DF3k21S/Exy+EgWkCZ5Ip4l1Ion1H2yaNLxvnHibl8X8qf+oNfzFZOdIisrmY6fkV8na
         vXlxqT/lbOZKNIyEGd5AcqA3FS0IgetcbL2e1q0ocfD0lplPkDZrdenQHEOCnm+rqUcA
         Mm9e2wxzSJREl4vqRvXUFBb+fsrcEIKF7lQ9DqEkw5kC9+EXHHJjRJl4qrQ3z1xKhplG
         7njL/Wp019Fnwi4p7MWlRd5HcrB5BRAYEd2WbphWwW+zJc+1kPDJtDU1fak2JRr6P9v/
         H50A==
X-Forwarded-Encrypted: i=1; AJvYcCUFHoidQ20VDe7BvMUrJJjcpi/tW69oFsuDOTP0/NU0EIGa3dFWBG/Al8NlicbLOmVSWqFjG51StVfgbY5RLoyK1Kof/jzFEmPnRg==
X-Gm-Message-State: AOJu0YwPved4SaSh+N5HvHrH6SScTdD7KNYbh7SxYdIQQ5yMFlS/5aV4
	eIfTPj8InEQg0ANOegxJo4G6Zg0AKo5bZpSChwb3zknGD7ZeRUEmM0fyGIxtgifkGnrlFaXIMuz
	n
X-Google-Smtp-Source: AGHT+IGz2o+o/oi5p9Uh1utwk4cNoMThONCyJL+gXkNlyeBiyembj0j98jqU9oOJkgU9Mqa/8zbJ2g==
X-Received: by 2002:a05:600c:3b1c:b0:418:2981:c70f with SMTP id 5b1f17b1804b1-421015fdc48mr51949725e9.19.1716573847748;
        Fri, 24 May 2024 11:04:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:986a:afa7:d450:11a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fc82cc41sm58338675e9.0.2024.05.24.11.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:04:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 20:03:30 +0200
Subject: [PATCH libgpiod 4/4] tools: tests: remove dependency on grep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-fix-bash-tests-v1-4-1397c73073a6@linaro.org>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
In-Reply-To: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=43A85VroYhG+c0X7e0DEgkIsiai6FryEmOt7U+pPjvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmUNaT31Lq2MLlCyQtjJb4Qx++dlQRcegWgoz4b
 aVc9+Tz8aeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlDWkwAKCRARpy6gFHHX
 cgnVEACjvhct1mN0D+1VNH1ITN6AvWJM73BCV7xStGI/Xh4Av4wl47l04pffv8I/3BFwTGlEdeD
 bGRwSvhhuD5a0+wo2g+xDD/OAwHXWkjdoKJvVUZJ5BeD4usOl/pNPzIiDMrkugb5v5ELBjorq1W
 9uWU3+5+tQsFAMRY7Lc893fLWzZ/WzPetE+EGX6dNJDwtw66S1tBjv6esFZekopLcGMh5wPlP56
 pMxyNF3jnJb/irv9IIUfZRnLQqUXNOcdj2+6FzJ+5naL+USBgAt0kk3VwTF4BCtWJUQiPMj9RSk
 ZdiFKYK+zkWjLjmYCuhVRDb3TQ3yi2rlAi7UF5w39bjh0vDU93gc+dXfvle7+Po21s6F9tvdD2p
 WeLmOq+VwzTEgjZz0voOLmooVG3kLT2Lk7gGM5RHB5fIMAI9LtSgE+iPhyRaanMZr2KNloYS1y9
 AF5F8aX55Yrw4NnLah6/pGao6/3GM1IWV/V/LJ+SLV8HQXCsRam6Hv3kzVv+vetmtdleqyywcW8
 /ijlR7Rabgl7ruCiAC44AGARjQ1XFAQp7onR7+xLVS4w10hFUzIJvxiDCKM4ZXQ0Dcn5tyIaGCY
 HhKFaiEBmj8mSZfQNZEsKghEysaBooSqteWq8o4Tfe9Dj0MIsiKu43Zgh7YI0hrhOlqZOTNWWRA
 YuEBG8xfkZ7CVbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We only use grep in one place where we can use the -regex option of find
instead. Switch to using find --regex and drop grep entirely from the
tools test-suite.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index efd895d..f910282 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -162,7 +162,7 @@ gpiosim_cleanup() {
 		ls $BANKPATH/line* > /dev/null 2>&1
 		if [ "$?" = "0" ]
 		then
-			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
+			for LINE in $(find $BANKPATH/ -regex ".*line[0-9]+$")
 			do
 				test -e $LINE/hog && rmdir $LINE/hog
 				rmdir $LINE
@@ -3078,7 +3078,6 @@ check_prog() {
 check_prog shunit2
 check_prog modprobe
 check_prog timeout
-check_prog grep
 
 # Check if we're running a kernel at the required version or later
 check_kernel $MIN_KERNEL_VERSION

-- 
2.43.0


