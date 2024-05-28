Return-Path: <linux-gpio+bounces-6715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D88D1631
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1EE1C2275A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D19313C67B;
	Tue, 28 May 2024 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QowjVGHq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F013C3E6
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884767; cv=none; b=XOrrz4B8QtaAOTf5NNFpDhhKlyWnP/nWY5S8Aj83g21oWVFJa/HVBQvqHQugk/nt3FTRp0vnkzV45ZmRJBv9uxmUpGdqKEd3K1jdXqGThLzY153sjFqwX+5FdNUgc59dLPf05Gvbafa46PYYrNelucBkAfKAf9LHgI0nf4+leeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884767; c=relaxed/simple;
	bh=jIGQ2BJVAEjs1wA9Zq573W5bU5CLum6ndnTg1nG81z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBZrD6QhBIlc72QpVNxgbVJnx5Vwzbxl0jqGnh1LT+9+lQ1zefYUbn2vuQVSgGPcxPwaPuJwjSq0jteQZfWaEfwxTk6knAUZqYRg8iecUfuPtDQMHE0C5/vWnP/Rihh89AuU/1xJiKvZYwwjMKctbUM8+pArsIOhynoDOOKryq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QowjVGHq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5295e488248so669381e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716884763; x=1717489563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX5B+3J7GsQpKqthqaeQGRlKEHRzAlDaL7dj+Ot1xsM=;
        b=QowjVGHqPjQLC+Gy0A4vleevoaNdzJAzo1dZLP5Kk8G9mUHg0KnT7iUmH/vnuIBaxa
         4jtklwJXs2kVjlTNDSv4c6DIVGWBPvmUf+FRaLbOFN7xtJT7CbaUXnJlVI+e0fftHqM3
         3ucXQ9FKXLOqSi+hW6Shyg4Kf4JC0hUwGJC9j//4CubcqJZ8N+LxplK56sd3tPeL5e9J
         iTrDmzU+WFt+3gyU1Q4jqJxLKsnY8fL4rc68lR7HIZlHiSBjvan2CYzlyQpahkpnHOl+
         W76nIA/MvNlZzlrTtBcTqYNEsp9ocatMbJxoBO9caKCL6bCyv6XqLZVwgw7cVAHdUG2q
         kQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884763; x=1717489563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX5B+3J7GsQpKqthqaeQGRlKEHRzAlDaL7dj+Ot1xsM=;
        b=oG4ADL1ZO3gg19NrKFexoOFdC1N/wK+rSrni5iA436xFweLCfsR5JtgQILXActUKwA
         2eBlsqysI8yBToWbNTEjVFPHpOytvEs86M8NlF4I0cIBr6Dww+SuU+J0o5hl8AvTaoLA
         GTjy89n247ghkLeOG9C+d1SX5TyTM2PjdZev8OTIF7Wa89/t2OcsOHh18F5k5BpoGcsK
         TT9PHOfnUo/dsxolt0is5duZkg/QPQf1kv5UEW9CDTuNVkQYViKl4ZD9Fu4t2J2o1/CE
         atKRd/yQ7eO2Tog4MuK2UaSnGAUzjjma85Dzb5qWmLcoUT12SL6ICxUS94rjNSPBNJrH
         GZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCX4EokosBwIDzgY1ZwtUDqjsvVQyJhOi0F4cTY9sZy3eaEeV5uqQ2CT23WioxFi05LcQPnUZ3DZTmdpbyWTiiMutaAMTjR4rkMsXQ==
X-Gm-Message-State: AOJu0YyGnJ9HUjYMpNhTXc1DD+pR5MX5ipu+lDuixh9Cbjr65tuFvvp8
	NcbU8gA/YOP0nlT+jHRiK4Utevu+snNb+Wp8BvSPpN6thlI+nF9028LUDnhF/Wo=
X-Google-Smtp-Source: AGHT+IHj26gLYTlDdPuRwoleVEFABekQ7wWmkNVCG+el7kLT6ew/bfL444YzBXcTZ5TuS+q9JOk5uA==
X-Received: by 2002:ac2:4e70:0:b0:523:5dcc:c72 with SMTP id 2adb3069b0e04-52966ca8c26mr6147553e87.57.1716884762680;
        Tue, 28 May 2024 01:26:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fd37d5c0sm96207545e9.1.2024.05.28.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:26:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 10:25:51 +0200
Subject: [PATCH libgpiod v3 4/4] tools: tests: remove dependency on grep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-fix-bash-tests-v3-4-e9b5be2ba8bf@linaro.org>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bRyfutmnfDlShMXvHCUJDt729clEopf4HGJQIeLXVRE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVZUWycvmlSMMGgXBRUOatXSQFPtNDjXm83p41
 BdHJpzMveCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlWVFgAKCRARpy6gFHHX
 ckSrD/9aClhlJCVyB6JLZQSvurp0L4STBq++jT3UhhuPuXAgaSONppMlcdnsXjehAyo5AVWdeJx
 1Do1J+tc4uMEmxaP1Hqx6sTH7RFUniuj3hPFy9AO3x0pDGIgrV7wb7BBw8ohPpbDE6DerwMZP1J
 CkKUSOTlU1tkAU4fSZWOZ1sLcc/Z2DYoeY8YkKE6gSfiNVqz/rSjFkfwFE2ir+UnR86Zh/VcX5J
 /zZ4nPhMihZhUAz0HiXb4jEechuUjDKmPRrkOKlCbBwNYDT+FDzfVk6SO1qcgyFs8jiiU3G1naH
 YjUQHx6yBGrbOL/axsf36rPmrFaMZ3HS9G+PEjGt9W9SXlKhq/QqAgaCTp5LwnpOUNVjks1lg4n
 tEhdA2MOLUSeQhxvWefg6JFNnWGxAL1Xc1bfIOs+zAqbYFZi09Rrx5iK4NUa11p3x/pjHHZKh3G
 SEl/0aGcZO/wDcnYu8tHDxTiyO065LmFIhqz+ix9hj5T3/a0gYjXHPWg1ebNBYYCtUYPTh/Jgww
 1ZGGF6Ei3rFZ0tS9Wkvj4BVptm4w0etDgtHtWCvbxpPJ5GL0J127AQLttLG8gFWhcCLLwRA97dL
 ad4Ps7iQzxZdxvJySixWMbEUqxJTncHge3tZdYCoz2tc0ttqSM4uJKStBQFc7AgpiDlZSB7TFWs
 eB4v3BnNbH5MQlQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We only use grep in one place where we don't really need it as we can use
find directly.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index b6809f3..521556c 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -158,19 +158,10 @@ gpiosim_cleanup() {
 		local BANKPATH=$DEVPATH/bank0
 
 		echo 0 > $DEVPATH/live
-
-		ls $BANKPATH/line* > /dev/null 2>&1
-		if [ "$?" = "0" ]
-		then
-			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
-			do
-				test -e $LINE/hog && rmdir $LINE/hog
-				rmdir $LINE
-			done
-		fi
-
-		rmdir $BANKPATH
-		rmdir $DEVPATH
+		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
+		find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+'
+		find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+'
+		rmdir "$DEVPATH"
 	done
 
 	gpiosim_chip_symlink_cleanup
@@ -3078,7 +3069,6 @@ check_prog() {
 check_prog shunit2
 check_prog modprobe
 check_prog timeout
-check_prog grep
 
 # Check if we're running a kernel at the required version or later
 check_kernel $MIN_KERNEL_VERSION

-- 
2.43.0


