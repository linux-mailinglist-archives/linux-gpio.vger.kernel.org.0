Return-Path: <linux-gpio+bounces-5575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCF8A770B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF791F21A49
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97C36BFD2;
	Tue, 16 Apr 2024 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fAeKo9mU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE896BFBC
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304347; cv=none; b=oNyXyjStocSYyDRHX1Euz6Bai7v6Gqy5taoSAOLlIMTKZ2nNOXlYq8d5J3ouCRpp7nQKXEYkIXhp2GMQc7ANAN2EoMrEDAxErF7heS29R4WvwRk1AcqaOWUAfQIkQfr5lhY7tJrBxK/gsFiZMABNzkNOUdLemHOlNRfHTRwlGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304347; c=relaxed/simple;
	bh=zaU8JGbtS17mYTnoMVEV6Pv5VYNjRLkMIKur3dj4MrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=B/HRB6hQ9Bp+zEYcrMdjh+bTrY+32wroLwuZvr6+iukrpUHkJ6CKlGNK4p3Ae6FEQDbMyDQ0lIJ7gNnJLgycPlYoYnF3edCXiEuANbmj4ujvVaYtcV0cpluKj/u9xretBq571Lrcrf1TnZLnHq9t6YdX4iVDEpTRMDbrnpNM7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fAeKo9mU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso2973969a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713304346; x=1713909146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAj1gdGQTCOO8SLqQZXw6lAhrKl7+24O13XHp1IVVBk=;
        b=fAeKo9mUK5ILW4g+uwnnJstEs9JFpG3pJLiyh/OBuyi2/jI0Qswz+4Zh552bhfPuNg
         tFEdUEpfpgAVWs6A9UcA+5UW0X9KMqIjZh/seqdS8+mU4/cKN3NMbAL51zz+Ge34Uqhi
         ieENbmjdyKItv/boIVHaGn+ZRJN55KrTF8NEpZM/E+0ZMrdxRr53uKEbT07NAP05ggYj
         0ewoq95BGcT+kXvMGhvPXFKaiAuHvYXDZwe/or3dGOHaI7y1VKzuayftqGlxjCrlkIE1
         aQmqXCYLJKe9QIpY70pKgfpyZPDPqUL4BGPMPUq2+30HhhIIKFD91Y2dAU6L37kDiTlA
         XIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304346; x=1713909146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAj1gdGQTCOO8SLqQZXw6lAhrKl7+24O13XHp1IVVBk=;
        b=Wzkeb9nMXMyov7i0MA52Gr0qj50VfYCMy1689uSmfZpl3OuiCEws2IW6BMKF1jyjJc
         cMxoZcE2Y0Ixlye9s3EQZ2VmIwIYasmrv9+xWXsXlhIRrB8UabGyJmpBZyh/RocdfWqN
         svmMphVvZnhqSNybIZsEt73/dEw3F599gUNBq0/3A4w0Vh+cak8xlSILLmjpPA1uLcdM
         De45xbpJ4pMbjMUplbSaWdF8pBGNJzVDGZISu/wCbV7mZ/MqqACouEimNufMuR+p0dhi
         CJZCraN9b0ezDLphazgVKSqIZzmHXKuzC7c1K2i+bQC9ryUD/w0kXGAgma7+SwNGG75y
         2gmA==
X-Gm-Message-State: AOJu0Yy4Nm8ziLnT26C7iUvMSKHVHalvL1NWHEGFXJ1n+AG1A9x1ZUe2
	dm69Jcn5/7FG8Q2mcspXoZPDX8pM6UX6vEJ1OZUfFSXuKU7HlVMByZLVDkLBxUc=
X-Google-Smtp-Source: AGHT+IGU4Y3JvDyQa1JXfZaonm0bKboGNoqSOc7zyHGb1A+0nJBxrO1QrrcMcry14UZoI9gMlvEL6w==
X-Received: by 2002:a05:6a21:150d:b0:1aa:48d1:2144 with SMTP id nq13-20020a056a21150d00b001aa48d12144mr3460374pzb.52.1713304345586;
        Tue, 16 Apr 2024 14:52:25 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id o8-20020a656148000000b005f07f34eb59sm8005217pgv.27.2024.04.16.14.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:52:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 0/4] tools: timeout handling improvements
Date: Tue, 16 Apr 2024 23:52:18 +0200
Message-Id: <20240416215222.175166-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here's an assortment of improvements to parsing and handling of timeouts
in gpio-tools.

I still decided to unify the period parsing between gpioset and gpioget even
if it doesn't make much sense for gpioget to support periods longer than
fractions of a second. Let users decide.

v1 -> v2:
- extend the series with renaming the timeout variable, using ppoll() instead
  of poll() and supporting minutes as time unit
- drop already applied patch

Bartosz Golaszewski (4):
  tools: rename timeout to idle_timeout in gpiomon and gpionotify
  tools: use ppoll() where higher timeout resolution makes sense
  tools: allow longer time periods
  tools: add minutes as a new supported time unit

 configure.ac         |  2 ++
 tools/gpioget.c      |  4 ++--
 tools/gpiomon.c      | 28 +++++++++++++++++++++-------
 tools/gpionotify.c   | 16 ++++++++++++----
 tools/gpioset.c      | 16 ++++++++--------
 tools/tools-common.c | 32 ++++++++++++++++++++++----------
 tools/tools-common.h |  5 +++--
 7 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.40.1


