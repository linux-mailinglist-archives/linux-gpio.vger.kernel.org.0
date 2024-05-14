Return-Path: <linux-gpio+bounces-6347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 361038C4B98
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 06:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3BE81F22AD6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 04:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802CB10942;
	Tue, 14 May 2024 04:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVLkeYMb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7D1879;
	Tue, 14 May 2024 04:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715659951; cv=none; b=VNnxIynTeSxbySG1/iURtKdGdOGFcoShODKh64QSmLLvDNFV7vnFcnkC3ooTVlAH8Dgcy4jbMMMJJowpaTORd/v9XTsSUHlHQY9zQtRHHR7epBZb3WKMGDRdHTRr9L1VdIKoba4XuliCv+VOqACjOTz67iLD75jgXyITMfTeA90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715659951; c=relaxed/simple;
	bh=BSNSHZATQNEiFHEX3bIx9iNu5D407arnYgHWBJhIj60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TknwuW5c4vWSa45eXxsR4d/2hyfWmAyP5rhXZVn7nUWCQ+ifJ0ynRLdnjZIrjZAzPM+FmbuGXPABb6fpx1Mtll3xnAYpGL58gzDOMitu9zTc4bPFy9GvPvKHw6sXrS3tOfUV7QTCFaRXV1xkvFUka5zKNnY0zGd8AzvJ9ww9Zq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVLkeYMb; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-23f0d4353abso3347151fac.3;
        Mon, 13 May 2024 21:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715659949; x=1716264749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRPEnu/ON9I5NtOR1yelgmcp8gSLZwJcxlTGStCRKXM=;
        b=kVLkeYMbsYmGoft1R4gmmwVW9J6kfhnSe0JqcjEAHfrzwsHYXBMjeSKq8xHCMPUHkH
         /4uEsdB+vbbeRmgctURFJFGSW2s4jbh9cl279TkZca8y/vu+02t+mbYXzX8WGllCQHwB
         +JI3AjfRWVF6j2VU+uPx94vWDiYesRuUXSgo6Ll72B8GOsV5yEmbW0w0oNtPo4KGTazN
         kvK5P1vdkiLe2PzqNcAUuVnPF0sNMXgCwAdCgvRorilAOqcVwunfGcd2FGTYAqcI576g
         KnlTSbsCVD621NnNH2WRA3iXBjgtGkkxCiT0qTuB7ufAUbuqMhSvOXgBO9AiFOd/m4yI
         qp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715659949; x=1716264749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRPEnu/ON9I5NtOR1yelgmcp8gSLZwJcxlTGStCRKXM=;
        b=vdpzzItOhCNasZwKGWupgpWCBndknoQGFDWUF4wlc54cisth7RsxseE7vu+X0HKxEU
         E98iMBaWFKiQsAZ0JqjKd1moxzgLDHEjL2kUkDFP16L+DAC9enqRdCQAD5f6dEtoo8k2
         /YggYweEH/4xj0QfvRnEdTn533x9F8TV/jJXnzu5NgR9xDGot/tZ5ooqBJdug5OABtqg
         pa0os4JUXhDS36m43lJPboCofsHxJU1OG2zdfSJkykHXqjELgdnyNCQ/PRCs25HHhapt
         ttr6RssJzgbs61244GVpAaEAoVYMElo2Ah561xPYOP47LnP6ClrSuGqJH6Uikdp/otsZ
         FRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlLL+/03avgiEJXmO1572RsrNbxHYtTELzj6mct70Me2ifVYaFxOe70WzHscB+wtGeipY0b0vsmjdmmCuxnhTxH20wds+n2F955rfhoEU5JOMq6R6p8v9ww3mFP5ZhwXMP1b2byud/d8F84/YfLAH/9UY1HLCEH5b5+g4TC+2ZhMrKzg==
X-Gm-Message-State: AOJu0YyNepug+yWYP15WkUeXSqLpAAnOhnVcE3XOXaVTrjbz1G7L84Vl
	zpA9eYVhFQmb5AVKC0Q2uvGvBSfc1w0mVlyZIu3D5xizpJIq+eqt
X-Google-Smtp-Source: AGHT+IEaATE5fgre3nk/hAl6vNSctnTSjsa3d5EP84Nl98mLa0dFA7LL59NvJKmES1RtbuI0BmpVog==
X-Received: by 2002:a05:6871:e70b:b0:240:851c:e6f1 with SMTP id 586e51a60fabf-24172f87de2mr14243879fac.59.1715659948858;
        Mon, 13 May 2024 21:12:28 -0700 (PDT)
Received: from Kuiu.. ([140.110.223.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0f1csm8383633b3a.99.2024.05.13.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 21:12:28 -0700 (PDT)
From: Huichun Feng <foxhoundsk.tw@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: foxhoundsk.tw@gmail.com
Subject: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
Date: Tue, 14 May 2024 12:12:23 +0800
Message-Id: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
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
 Documentation/driver-api/gpio/legacy.rst   | 6 ++++--
 Documentation/userspace-api/gpio/sysfs.rst | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index b6505914791c..c1a083444b0c 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -648,8 +648,10 @@ and have the following read/write attributes:
 		poll(2) will return whenever the interrupt was triggered. If
 		you use poll(2), set the events POLLPRI. If you use select(2),
 		set the file descriptor in exceptfds. After poll(2) returns,
-		either lseek(2) to the beginning of the sysfs file and read the
-		new value or close the file and re-open it to read the value.
+		use pread(2) to read the value at offset zero. Alternatively,
+		either lseek(2) to the beginning of the sysfs file and read
+		the new value or close the file and re-open it to read the
+		value.
 
 	"edge" ... reads as either "none", "rising", "falling", or
 		"both". Write these strings to select the signal edge(s)
diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/userspace-api/gpio/sysfs.rst
index 116921048b18..bd64896de91a 100644
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


