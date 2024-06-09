Return-Path: <linux-gpio+bounces-7287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4090174B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2024 19:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF3A281C19
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2024 17:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7438A482D0;
	Sun,  9 Jun 2024 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg8AkpY3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD593F9D5;
	Sun,  9 Jun 2024 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717954654; cv=none; b=R4WaoN+IHKk1AbwfKjKkFiGORDRTDwUMsAQyeuOK4bpJcP32SZ1WCPBKngbceAunWIZicL29Eqed2MJJK3hM97PM4sSOFHOLsFSR4aKRarjTYXDMLSitvQpiwQ1yN/mAEEA4oswknpyG/ujGcbGAtpVtXjnYjKj/0bYPuOcVBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717954654; c=relaxed/simple;
	bh=b8H14q1Ca6ZPnjDbPXjPmPLORlz/P+sgF9Kb32Ix6OA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m0c/qJLfdABUb9iAmhw0PlihFSqKaB6FfPwgrcp4clIoo089leVqjDVdtkEeqxIDY7z1ROzflUq6tJurQhzDuZPWG7XJBKH2jh6mj3Sd4+3uU23M7A7UNDGYoapj2veXHdxSQKDIe40X7ah5wTz2gXwlPmlH86sAUKxxkIgnCdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg8AkpY3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4a5344ec7so27111835ad.1;
        Sun, 09 Jun 2024 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717954652; x=1718559452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Q4nkGn+FsWPFqFUmsc8Dh4Jkilm/kEj6LPCGMVCuU=;
        b=dg8AkpY3gxg6ssKttcWcc5SYzJNzxyySmhUNeq44gE5+lv0+FUe7SmpA4GpIVj5sj1
         L5bdRwxyxxEghWv5J/aiebi7iGcEVpe0Ym1FrdK90xl+VUJblq+aRRGQuDK062w42z0U
         Tx57XNsj0mcmKtfC+UQPUatZWhp2Mry/Gsee2uFMT/mKdfK+oXvDdhZnb8Sk8St7ajBz
         IrsLwj1xxaAUDd/BDC8MzS16OFI5XEf8AHSnuEuccrRCOK/NDBJBLvdOUf7HOI3nsHAV
         ER/9kTORQZP3uvbh1lnIOJtLpwKh19ZGkBij94oAnGjz0gvblLVRW3daQ0PinVV/bmmW
         ejlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717954652; x=1718559452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Q4nkGn+FsWPFqFUmsc8Dh4Jkilm/kEj6LPCGMVCuU=;
        b=ppB7W9O1RT2Oy4AoZfNkNRfUfwjRnB+GLYAsOoWbOkSt8VLYtbLZgZidguxkT1sext
         Huqhce5XHAXjBWLNj2L2XRhYlpzAJC0cbfeV/Om7XL3EzJRQ6NN+Mps7QvpE0psFvxwz
         6qSUOqK9GXy2RUO+F7f8zC8inZeRJACGGu7s13+r7ieF+wFLJgP4jFtYkJglNXzla5Qy
         RrdwbaTi1/89mM0r46+7sBAN9xeFDAd4zk2Lv/a29DKy1IFZ6/07H2Y0e01GhAOp2mqi
         myEZfqxF2iOfkbtTPGZA5uMQcqh1QTXAt1aU01B2hV9ejp8W36PAdETci5qvaYSob3BS
         8Tdw==
X-Forwarded-Encrypted: i=1; AJvYcCWQUdTXKA1b8mKmGOIHftOCCrGfNwamoWYYlNb8Pe8Zyi3qsHfzZ4nAv/sAVuR+5QrXDZgaiIIbtuTzg3YWiXICK1TV8Voh0/RDlXOm6PjqfHvtlWliZob1oyiYwLKayU0KaGWVcGYWx3Gi5D57s03a9cTxK6+ieQ7ablA75a2l/INPtw==
X-Gm-Message-State: AOJu0Yw1aVrWIG/sim6i7RyszcfoUI+gHx2KVpxmM5jemy7qlWrvQho6
	5iL40JN32P42itIk4VO1l/SmhUKnung478ypt4qn9zfHtWweLLAS
X-Google-Smtp-Source: AGHT+IG4OWfBDH6lIF5GdoY0dg5iheqSLYxAbS4UZoZcetoPw7khebj7QQ8YLaKse4xRlD3pGuTCOw==
X-Received: by 2002:a17:902:eccd:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1f6d01b9784mr115027815ad.28.1717954652148;
        Sun, 09 Jun 2024 10:37:32 -0700 (PDT)
Received: from Kuiu.lan (180-177-2-91.dynamic.kbronet.com.tw. [180.177.2.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7cd2adsm67924615ad.174.2024.06.09.10.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 10:37:31 -0700 (PDT)
From: Huichun Feng <foxhoundsk.tw@gmail.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	foxhoundsk.tw@gmail.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH v2] docs: gpio: prefer pread(2) for interrupt reading
Date: Mon, 10 Jun 2024 01:37:28 +0800
Message-Id: <20240609173728.2950808-1-foxhoundsk.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Changes in v2:
- rebase against the latest tree.

v1 link:
https://lore.kernel.org/linux-gpio/20240514041223.800811-1-foxhoundsk.tw@gmail.com/T/#mfa19d877e6056936d3a2025cb64ca8c5b8718644
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


