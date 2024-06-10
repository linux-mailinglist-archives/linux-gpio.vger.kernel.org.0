Return-Path: <linux-gpio+bounces-7304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B62901E12
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 11:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9B21F210BE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 09:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0452A74C14;
	Mon, 10 Jun 2024 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNe1029m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3817406A;
	Mon, 10 Jun 2024 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011421; cv=none; b=QZsRRecUapmVhWUPVRC5UXlayux/h4du6CADwxaiUNi69LkdhzQoSmhKEvcqYwF4YenqOor5Lo7MIGedzpSP2CP8JEWsgtboW7sNJivJ5RbSbi/H8JAhUe6bMJHnk0ENfYHUi74PD5h5jvn3MC959Nq9xdL4lZcGHTlw3rK73us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011421; c=relaxed/simple;
	bh=MIk+bEBU0QLUp/D8INS2W8Ha6kIdaCi6god1JOJ+eWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nKhPxgSTyUOHQTlmA4UekbNaTDTTmDJrbbMY7io/cABV0QcPYn81VmCLsoDqM0NfKObpceWSB2EAFJrnGRYoy5n7bSV3dz7IFSLscSm39xqFPUqnu+OgpC4U/69UVHVeb2cQRqWMWzDOUqwaxr45oBxQ0GGo9AVifwjXWvUk1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNe1029m; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so3656334a12.0;
        Mon, 10 Jun 2024 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718011419; x=1718616219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URK2Ozhs5KbL4aw49CG/ifndI/mBkWV5rsNcJfrG55c=;
        b=QNe1029mkxV69vPioEE9fEITcNr8hoi7ar05ONga2XMK+Hs8I+M30TUCbAIw2n3yvm
         jioRriuxDkcXLfMFFstkvg5NbjSmsytxle50bQpKbugqm02m01eqNY4pv7xkJdOqWzVq
         M0FMHp7JYltBOcf6b48O33lx8XuFpJZsBNnvWyQAuopi7LkTm7FD9WSAuAm+4LQlUBjQ
         I0B3y/DiDu1DBghkwzI2BxkqRvVaAmLtj/BlFwk8/Mce+N+XiG+ugSDr/lcrKzfOAwnQ
         RpnF/7/RQnEEFMt0XKIj4olaUmYku0/Xw34k5+JjEU9s2FAB1WX06Lg38+5qM+7C6Nan
         qfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011419; x=1718616219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URK2Ozhs5KbL4aw49CG/ifndI/mBkWV5rsNcJfrG55c=;
        b=HY9kJSscF64pW7krhbgOH2Y93ObMrslQU3DunAVZaNE9lBh5NpQ1RAuQis06TEkcBg
         mHrRL/7uwYg0n1T9C+sXGk/5xu/7vtIG6E+Tq17emoUGRC6UEKygjoZlx+TFurIYr/XP
         pAl2igKczYo0i+BrnkQ2ZSeFWA2TSOwLsnU6VgDqm+rMUzhZ44gUvLNFNrLiEpzpvh9v
         U1Z1UBTrEcmeuXrmfz8QZ2Jo1CnZTjoMeIg3GSZPwkRNESEr40G/pWjYR0Pyw3mvkztW
         Bnri7s22t0FDmf8uGIZZPkQFnaV5jfj4VzY97VqzEzO+BoRzGvSBPJMj7IUTKKqo33s2
         zLNA==
X-Forwarded-Encrypted: i=1; AJvYcCVu4wD9FfhZqMlfgGkmjInVhZ4q+cucALh4pt37itlIsWjDXzdl8JNbuRHflgFvzZc7QIPuX6t0So+YbdC8+PYC2hd2RE+mYpl3XJ2Yfgh3lQdhBR21MiBIYR14HRggBsRtpM513Q==
X-Gm-Message-State: AOJu0YzPsvZM6dSLTieo24DuxVd7FQb/2JUGL49OBB+iivU4zeeS3Jnp
	w3QlgOq684c5c2ZE3Dss3gVEJLCkRf4OE6oeByOXQFOqjvncewWvqth1lg==
X-Google-Smtp-Source: AGHT+IEO3yv96Ra6/QmPyXyRqSF9S1kCV/k0qKCG3xgA2PNgHVyBcfDM6auP59WUvB6KjKmv3/UDzg==
X-Received: by 2002:a05:6a20:8417:b0:1b2:b60a:a42d with SMTP id adf61e73a8af0-1b2f968d9f8mr10458016637.4.1718011419450;
        Mon, 10 Jun 2024 02:23:39 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6efa2a319sm41318395ad.108.2024.06.10.02.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:23:39 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	brgl@bgdev.pl,
	corbet@lwn.net,
	drankinatty@gmail.com
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/2] Documentation: gpio: Clarify effect of active low flag on line edges
Date: Mon, 10 Jun 2024 17:21:57 +0800
Message-Id: <20240610092157.9147-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610092157.9147-1-warthog618@gmail.com>
References: <20240610092157.9147-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation does not make sufficiently clear that edge polarity is
based on changes to the logical line values, and that the physical
polarity of edges is dependent on the active low flag.

Clarify the relationship between the active low flag and edge polarity
for the functions that read edge events.

Suggested-by: David C. Rankin <drankinatty@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../userspace-api/gpio/gpio-lineevent-data-read.rst          | 5 +++++
 Documentation/userspace-api/gpio/gpio-v2-line-event-read.rst | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/gpio/gpio-lineevent-data-read.rst b/Documentation/userspace-api/gpio/gpio-lineevent-data-read.rst
index 68b8d4f9f604..d1e7e2383b0d 100644
--- a/Documentation/userspace-api/gpio/gpio-lineevent-data-read.rst
+++ b/Documentation/userspace-api/gpio/gpio-lineevent-data-read.rst
@@ -44,6 +44,11 @@ Edge detection must be enabled for the input line using either
 both. Edge events are then generated whenever edge interrupts are detected on
 the input line.
 
+Edges are defined in terms of changes to the logical line value, so an inactive
+to active transition is a rising edge.  If ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` is
+set then logical polarity is the opposite of physical polarity, and
+``GPIOEVENT_REQUEST_RISING_EDGE`` then corresponds to a falling physical edge.
+
 The kernel captures and timestamps edge events as close as possible to their
 occurrence and stores them in a buffer from where they can be read by
 userspace at its convenience using `read()`.
diff --git a/Documentation/userspace-api/gpio/gpio-v2-line-event-read.rst b/Documentation/userspace-api/gpio/gpio-v2-line-event-read.rst
index 6513c23fb7ca..1312668e0f6a 100644
--- a/Documentation/userspace-api/gpio/gpio-v2-line-event-read.rst
+++ b/Documentation/userspace-api/gpio/gpio-v2-line-event-read.rst
@@ -40,6 +40,11 @@ Edge detection must be enabled for the input line using either
 both. Edge events are then generated whenever edge interrupts are detected on
 the input line.
 
+Edges are defined in terms of changes to the logical line value, so an inactive
+to active transition is a rising edge.  If ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` is
+set then logical polarity is the opposite of physical polarity, and
+``GPIO_V2_LINE_FLAG_EDGE_RISING`` then corresponds to a falling physical edge.
+
 The kernel captures and timestamps edge events as close as possible to their
 occurrence and stores them in a buffer from where they can be read by
 userspace at its convenience using `read()`.
-- 
2.39.2


