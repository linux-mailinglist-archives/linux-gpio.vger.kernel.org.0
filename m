Return-Path: <linux-gpio+bounces-8280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ECE934AF7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9647A1C21050
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECE18286D;
	Thu, 18 Jul 2024 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rJak+bwG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5878D823C8
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294982; cv=none; b=YsY8SmnpRCMDHdaGgx9W+sKS9YyZ3H3vA/NQjTRaRIKr6MHFSqz39o+tDXPgsPN+LxLZ9ZElGJbdihaKw+DXbWibTJFOds7P6uUW0KwcvnxqsUR8+3C5y1kgJWjvGAlBDiEEMMuBGyPooZx77r03uJhmFK6cciabvDTc0XRWQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294982; c=relaxed/simple;
	bh=Vh4EoHIttyFBYPBYpY/tOPOfrhSZsXyZyiKpREO7xA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNkVHRpgK2E6jOLeaItOwsbbncB5z8M64s0yeYyuovr2M69GeEjWh6fjQGJTBPBPXW8Wmr39/J1EDO4rSYOg+irGhsBDeymz5SnsEUNEnTgLLAkQPM4aIa2oVsIu0u8uwDEHxFHu/MRFhkeunRnPIWxX0jgrIwKt7B8zzMttOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rJak+bwG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3683178b226so327508f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294980; x=1721899780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPj246qV1cet7HDM8O2IAb1ytG8qFZcOVcZx8UtSIgM=;
        b=rJak+bwG+1I/je79o8gmJpGztW4o4rK/C/nlEjn1vG/U3v8/L3+/lpgNmm6IQrjYxn
         TxbfjrFYdGmQoU5aCKcHJO5aDnUqVYZvtYMaOj/nUreBXhtbDSQb111pEqL0uk2NxnTZ
         EqYqlY5Uw3+pQERsABSc3HgTBr7E7Y7tjOqbuD+4xSe5d6Es/KzF/DF50z5LS6YBxc9S
         WBi8WdkAHRpgXapmshBnNDRTN62H5UlWXofxpRA7JHtHs2FHP3EFRSHFtelmCQKP215k
         /8RU6Sn3qyb+g8opAfhV3vuCj2pEU0oiicIqdo0nVD7S0X+LJ1R+61QFeaOzOCXpBB5l
         91Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294980; x=1721899780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPj246qV1cet7HDM8O2IAb1ytG8qFZcOVcZx8UtSIgM=;
        b=Q3lTnDOGxNOu6qfCE1FfAWgN5rddn0IjAZxTy1gi7qpOOIO68qviJUAq2tuogKKoxP
         3jh1b4Me3kOSTNj+PAwfpmqe6zebL1DBIopA4tRx+IInN/H7dOLhU1Y6oH1KUb9maOcW
         VF2kH3s4Y8RigpixTBCOqGnR9Y4t7uPEpiubPQhRx+au1qW36Uw/ITJBDEC6+6Xg5lvN
         DAWsQZiZJmanGJtOFVMwlwnqoi9yC2K4N7sQMdmRTz4gjHGBxj+nVmi0A34X5HVIbY5v
         eauHw4zUz6KRL+FGdavADvRUL/ORCb4Lnn6qCE2Ih8dRr2WVt1w3qpaCbpZT5nKXwA9Z
         X0iA==
X-Gm-Message-State: AOJu0YxyicsaZvnaQwmSKogQzOUkQZAIXQ75mU/44+GJVQLQ/HWkCDq4
	8iAN0V0x6TafKmBFnCKqInk3+rYkLu/hYufCFE7n5bRHdBO0uAkfvwmrPijpqDo=
X-Google-Smtp-Source: AGHT+IGv8X9DIloPHglFugKfeJM+gn56KaQyYqUCPDoHb3xbHP96Jy0ti3+YnL3Ulh+ljSKHWhzYFA==
X-Received: by 2002:a05:6000:2c8:b0:367:94a7:12c8 with SMTP id ffacd0b85a97d-368315f2ca5mr3080412f8f.6.1721294979756;
        Thu, 18 Jul 2024 02:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:29:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:12 +0200
Subject: [PATCH libgpiod v3 18/18] TODO: drop the DBus daemon from the list
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-18-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RRq5aj2o8XU+L4VY4jXN1bxPEYxbUlw1+LrXyAt+gFY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBCZ/ahyiSNZD9c9yhp3B10P7kKZ50A+EV/m
 CVEDay9D1aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQgAKCRARpy6gFHHX
 cv/wD/9hQmb8OSw+FzNVnA0n1/LwDVHPGkPT0MgJgMoB8/DMDG2GgJWF0ammmuCCN80G5uDaqxz
 bm19ssMuLFdkJ/I3z/WCTkixDWRKwoQmraQnwpzTYUmsZze0AauDJpPb13MdPC4b65tWPYnUEjP
 aLX+Y2XbbbtTUKXJakon9zyQEgOWKj35kvnnWirMNgHJXlLgvHlH4VMTaIWK1nyD9BDrfNt/EDm
 PLsnog8xJlszVcJofae7vgNYlcQroGU3Iign70+Y+YX2jV6zk+UNraAvllnN79g6shoNXqrZ12i
 Yxl6kIdKQMwKbVRAPniFgv3iYx6LPi2VeiwJuDZBCuvWm7w9rkfNZlADp9C1BpYyNMBROt2mqmU
 vcaMLMIldj6ZpsgygPIGKInXD8schYnWjlePkFcWFmf76FicDdkws2CmXCVYpYTf9zTD4IbMXCx
 ei2hKbRUvRq7GhD68vle0bQ21uQtv7tvavmHdbDxE9OJ58z5lyv++7im4+czUbKh8SS80XCYR2g
 r7fNmvr1O+yeEc6q4yeMritVAHtQSPjfFDSgBVtH94uvvRxMvG5pKb3kph828Zs4tJw1lrfq5jK
 ImwtVaXVTr0SadtR3wdK3d5faeKTQjThPQCdKvXr+3p1X1w5dR58FNWpuI3LIC8PLihnJhKnN97
 Aod2FVZ5qh/KARQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a full DBus API implementation. Drop this item from the list.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
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


