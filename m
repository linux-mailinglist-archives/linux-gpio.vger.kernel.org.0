Return-Path: <linux-gpio+bounces-7802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8091C1CA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1439328624C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866691C232A;
	Fri, 28 Jun 2024 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oJMnDcA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87141BF31A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586449; cv=none; b=qmwskfn1ak5JpD+26c3kaHrOC9EZo/UkzZmr2lXE/ke9iUnAnALFm/6mNX+GMXxM35GYrD3yHFxBrWirlHhEdKTk7umL9XvL/4lvuGvFaGa35/9xvGRNUeJfmc4z/5wlVOkGjhj+ZaccMrBVV2beRNgo1gqN6F29fvc9/3Uj8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586449; c=relaxed/simple;
	bh=UcZj1u5SAVAOYe1fya21sKZAOnhV9bVqleILwnV3Ots=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFt5DJSRsJ6SAdFpMVV2wop2yhCjkfhVhDfwgeAI/nJB3MhhjiM4ZHhQ5bZUI9VdPEQjjk5/FmxF/6yGcifMWFtLqBU/iPUg+ejF1uXPNGZCQGonKbAffskE09uGH7OPx/ku4oteVcja+JaMdkc83xmOuIDO/ADr0BQt1POb5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oJMnDcA/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4256742f67fso5265115e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586446; x=1720191246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzCg/lASZhzO1UzajDdto+yAoIPnvSjznco9RY9WC98=;
        b=oJMnDcA/Q5GXMwfKLNBUPdr1zVcTriuHRaMZfsfmOJ4SksKxAJ9+ucISwWpi5NTX2s
         BgZGsAAoMyk26kZcn/irj7FXhI8jBcy2anE7PS+SfH+jBIJC1c3aFfrDXhTEoB8/cqzu
         tBLU68YdIxzflLXKzMUPsGh5vuNQIcQL1LlWD3EKeq8ya7pBT5mcCjbUviV+rwG2Z4YA
         1130GYXNSieWJtDkdkkfWZtMyPm5Cn7mgOC8oclEDc3hrgiYvr8MKJ7iAg7TrtA/hXbe
         P+O4ziE1H2j/w6VnFtb2lvweGA0DSIRO2pI0/H5qh2L63Di19m5/F5uI2EbrzNVnjGTE
         NVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586446; x=1720191246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzCg/lASZhzO1UzajDdto+yAoIPnvSjznco9RY9WC98=;
        b=mweKglkRYjPsv6kuC5SWwG1TlcBa6Ne8b6/pXPRasLWO6D7OfbkgJLciLdKTv0kHq9
         4w2hh/b3D54n0BtToWyUSGAyaDpEn2ePwqI+03iJZ/V7OMJ53Jtth+iSY95LIyvjrWxr
         0NiHo8v+ltN1rSwqEYLG3XgEYJZ5Rn0FP4RIBrJ8jpZ0gbkKhBkbiCQkYd8xUpDELFPT
         fDMSOAEznlK2Si0Or6LdaiF8+lRGOgxORzSuuji/2B9ENmNNtJy5yfNTeKkEDKnd0IyF
         7KAMEuPS2eThCpISKfpA+eGQWlhkVizCsFr8qehRnTswrU9pjFMHE2jA14A6Pe0UUGJO
         X/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXrCtTkjU2/rzUZefVG0ptyD+oWQqXlkNObfququRmv7zSmThR/ZdmrKC5Crey2Ix6xrz05bmR0tA/MDRP4ba6lwBt04QQetdfztA==
X-Gm-Message-State: AOJu0Yy07WqcBsQWep/pcL86K328Wc45mZGHw3x5cGQh5RKMhLv5vFyE
	SMKV4z0VpJ4ADXI06ezLr32+29TPWcYO7QWvv0QJZ1OnQ6R6DMS2qz1VKGRfi84=
X-Google-Smtp-Source: AGHT+IGzMxb0e47WwrLVMcsVnVIdG+RbIVD38L9MspA9UE39lnSgk2jGnJemyeDpHgMzkVArbqD/FQ==
X-Received: by 2002:adf:f247:0:b0:35f:1835:3a76 with SMTP id ffacd0b85a97d-366e7a5236bmr10635502f8f.70.1719586446476;
        Fri, 28 Jun 2024 07:54:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:54:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:34 +0200
Subject: [PATCH libgpiod v2 18/18] TODO: drop the DBus daemon from the list
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-18-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9rY1BUPDDPerFOP/PNuai3xHNV6ALuq/YNZVooXjsk8=;
 b=kA0DAAoBEacuoBRx13IByyZiAGZ+znSjbZgYND+UIPgF9U+cXhK61tTHYPVw9PH71CJC1nVfy
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJmfs50AAoJEBGnLqAUcddyl/0QAOHH
 hgtFiSJdZmC8U4k9eJMkyfPVUlen1B/3hc1NaaAHfkUB+6diAYDod0NSzn9MUpu1I3moMZPkzmC
 k0WQp6etB/aBeiW2DrlSUge6ogXpvnqoqPSw8S+1mhfyDt7FceWwuZywuC1z7q3JsfuHy2o0glr
 c+eskVuHUFy0oPy70Xax6A0JazIZP8FQK69jnvQcDWC04npQwYGTOzhFXS5SxiEOyTZao/c0jA+
 7ahE0gg4UCPPwd3KTniQU52eB58r2oAobe22NtetzVU1uBl27IjDqFqR8zmGEocR6eRVhdtdsaI
 gS1120ExFZEsXhV8eisYnmmOt+3+hqgKP8J4ZdKcIePANNTRLGOqxXY3F8hlwKC7gO+es4iKvSF
 7KC3KVB3jLI+m33dpnxR/AP2jjh0Eo2gwiRlmIwSlllb9suCFohdOd4NvXR9HihO5iu2m7hz7fa
 7/lDGIMOntPxVeaMmhmg4ajPHL81y8HU8pv+cRrijYA0C6Cdy3bijvazyRt6jVIWOpN+eJBnZTt
 M1rqUG1+9iatekMwETgpgA137phXJoF1IlvL8MjNBrW77EeWOFokEHE6ifCZPcmccXz/si8P2+p
 Vnc6bz7gfkuBVM6N5QObY2brJxWLEKsbZtrSgsyDBEVTiwUEnMuHzM+CdgQwWyHAtn3Z0aP70Pk
 wxQun
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a full DBus API implementation. Drop this item from the list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 TODO | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/TODO b/TODO
index 79a6246..5092f3f 100644
--- a/TODO
+++ b/TODO
@@ -11,23 +11,6 @@ serve as the starting point.
 
 ==========
 
-* implement dbus API for controlling GPIOs
-
-A common complaint from users about gpioset is that the state of a line is not
-retained once the program exits. While this is precisely the way linux
-character devices work, it's understandable that most users will want some
-centralized way of controlling GPIOs - similar to how sysfs worked.
-
-One of the possible solutions is a DBus API. We need a daemon exposing chips
-and lines as dbus objects and allowing to control and inspect lines using
-dbus methods and monitor them using signals.
-
-As of writing of this document some of the work has already been done and the
-skeleton of the dbus daemon written in C using GLib has already been developed
-and is partially functional.
-
-----------
-
 * implement a simple daemon for controlling GPIOs in C together with a client
   program
 

-- 
2.43.0


