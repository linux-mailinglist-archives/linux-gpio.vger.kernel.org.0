Return-Path: <linux-gpio+bounces-7029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A268D742E
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2024 09:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F04281C67
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2024 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1371CD23;
	Sun,  2 Jun 2024 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i42COLZ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A2171D8;
	Sun,  2 Jun 2024 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717314571; cv=none; b=D4Lt9eImN6MqLZvT5AykF4EG3oHxO9FK+wx16Sv0FU7oXY/T0lQgMH9agqv3h4oyz6N7JHA74JGf8YxzJFPMhcwXfSBA3tcEPWF4AKEmK7JEiBT3hC/7ZAE+VYS7CUcPLzvoBPIvceoEV3+CffI788jvQuftsnLWpTcaFB9ETWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717314571; c=relaxed/simple;
	bh=HXkGmZ/GnlRwvhJ8fMoCShaf1AxsyT+wSG63skO4HzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BqJJYDf5jmVmxti/rfRanLxEaKgpn4KPdF+BJRF8et3nc6Oe2zurmd+dejskAvvHIYkwIAVMr/qLz/7UqmY4NcMXT3XeNuzkvvLr2puEEE2B8l/TP4r/ryaAA3irwB1Abewy2Uw1HOO6exlhrJu+a9WZ+SQHyqcEOfeqSwR3GzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i42COLZ8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f661450af5so4917345ad.3;
        Sun, 02 Jun 2024 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717314569; x=1717919369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALYWCpUDuYWk0GU9FVb+DQcrxr3IhUEIFATuvwfg2ks=;
        b=i42COLZ8sCd0kL+N+ZtkBghdO0TmmvPG64WdwvJGTnxpXihpQkkgTglowfR95HL5Pq
         h2l5j0MnX3onjDu02DbF9rLugQCpa8zIn/G3A02/f4iUTXk1jw4qiJ66Ia7EQTmxlWIa
         5wHcp+aDK6r28a+yqCh2FaB538IT6l8Sv1MKyuIHdjZwNhMDyB2gjYKXq+eN7g4zlNjw
         NNXRlwhVtYdUB2t/UoNT62a3xQ5hUpq+Jgm5jM7NKx9TgwC97t3gEcFsq1koNia1vLBi
         5Czro4BS28AmLt89LcAE2yaTmmeydhVTEIgvWQ0Al4i6knOTBi8NEfRZB3hybkHC2+un
         oLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717314569; x=1717919369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALYWCpUDuYWk0GU9FVb+DQcrxr3IhUEIFATuvwfg2ks=;
        b=sUcVpPj9FkrGPf2YHIYFQvw7pzNwH8qKtWn6KFUM+fXx2P074KRRIKqdwqY28dCrhL
         /ZeeXTIVSPKl8sDkU9EaiIhubr62K0sCh77bGLO2uBDY/n4GikGE6NIWwd0g3UhcKlwp
         kqAeJ0uM9hxmm4zxul100iH20HKUXnwLHv52fS/A9zvb4gA/dpstk0D2NhB3lfewmH9C
         AQt/joB8ixOuHw0iOwQXuVHtmM8LXc7s0/xO7uL1wuh5rwQfl5OcXHpeWCaPxaO5kEh5
         RmTF4yhi4r6xHCVWWQlLwqYYIj64HJVvR4PkgcQtTxwAW/bz3ToEr+IZ/wCG0bLt2rXT
         cdhw==
X-Forwarded-Encrypted: i=1; AJvYcCXzDAoEZYodJK8/t8x4vJMaVb0MOYeS9R7/hSUWSHut0qguwy3U1afemcmXDRiTwrXLMCtAWK81xwRUERuBocH9vw1H6jXXjqlPZ9lpCVGzxZ6M13nMwboqecM0Y4/KkinsnZpFx74JgvkkaB1sOIg+mB7c8VymJ4vpVE+FlTigQklYwQ==
X-Gm-Message-State: AOJu0YzOuCAYovRzYUA9MFu1AwyFrxSAEwD4KfxEGJY0NL1DnWIMjS7D
	c2Xfgg2aOqguQmUYwUV+RhRUB9h8er3TbSgfxkZ8rpPM7rJCNOoQlX6BRDG7kaA=
X-Google-Smtp-Source: AGHT+IHJtiZeiaBOB96Skvc71cfyD3AyoB9wAMjZifP2KldTzPbqd6WEpo9DeS4TdjrTWsRnCCUriQ==
X-Received: by 2002:a17:903:230f:b0:1f6:73a9:ec9a with SMTP id d9443c01a7336-1f673a9eff1mr3619375ad.12.1717314569021;
        Sun, 02 Jun 2024 00:49:29 -0700 (PDT)
Received: from Kuiu.. (220-138-66-78.dynamic-ip.hinet.net. [220.138.66.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632338ca4sm43234815ad.50.2024.06.02.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 00:49:28 -0700 (PDT)
From: Huichun Feng <foxhoundsk.tw@gmail.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	foxhoundsk.tw@gmail.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
Date: Sun,  2 Jun 2024 15:49:25 +0800
Message-Id: <20240602074925.2489486-1-foxhoundsk.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
References: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
state change awaiting, a subsequent read(2) is required for consuming
the event, which the doc recommends the use of lseek(2) or
close-and-reopen to reset the file offset afterwards.

The recommendations however, require at least 2 syscalls to consume
the event. Gladly, use of pread(2) require only 1 syscall for the
consumption. Let's advertise this usage by prioritizing its placement.

Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
---
 Documentation/userspace-api/gpio/sysfs.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/userspace-api/gpio/sysfs.rst
index 116921048..bd64896de 100644
--- a/Documentation/userspace-api/gpio/sysfs.rst
+++ b/Documentation/userspace-api/gpio/sysfs.rst
@@ -97,9 +97,10 @@ and have the following read/write attributes:
 		poll(2) will return whenever the interrupt was triggered. If
 		you use poll(2), set the events POLLPRI and POLLERR. If you
 		use select(2), set the file descriptor in exceptfds. After
-		poll(2) returns, either lseek(2) to the beginning of the sysfs
-		file and read the new value or close the file and re-open it
-		to read the value.
+		poll(2) returns, use pread(2) to read the value at offset
+		zero. Alternatively, either lseek(2) to the beginning of the
+		sysfs file and read the new value or close the file and
+		re-open it to read the value.
 
 	"edge" ...
 		reads as either "none", "rising", "falling", or
-- 
2.34.1


