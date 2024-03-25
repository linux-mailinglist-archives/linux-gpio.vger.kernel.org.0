Return-Path: <linux-gpio+bounces-4612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05B88A531
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 15:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08CE1F3D940
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 14:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A8B17655C;
	Mon, 25 Mar 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4ga62ot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CA1BB742
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711365450; cv=none; b=MKrHroL2GI0tSPzhWwAZPWKzZTtVH2mzvRPIgrea7mWbSs/faM0+FkBfQrjykUxC+XojtcvL4FpXmVLZ1hG4mAWwo8Todx5TvUxewkMvvkIV1Uyj2XJFY4ONztdcMAeIL4RWUrlF8D3I6apBlE1iV9Sqy54JKaknWk3aVrTHP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711365450; c=relaxed/simple;
	bh=A5GmzCeiOoM7imiWbeLaeCe+0LR1LRuo2qTti8TzkFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KME3DGZC4Wzk9wnQT6IC/6kzEKfZX1gYIXeJl5KJrrIa+9g5O7TNJ2MujHXhxvntZks19CIM6rvccrRSBGt/7zvDURdyYvvM7hywnpPEq3PRXCRQKG8jcJX116eCm+2wD2Cf0jW/B6H7pyk6AhJ3J/oPND/eZLcg6OuEphCmuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4ga62ot; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so2670473b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711365448; x=1711970248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjqmqD0pb2LVuJMwKiPqClT1cKdpF7rGWvpiZUhphWo=;
        b=Z4ga62ot1hZe4/+TYrpG9Uiavblp/mdWdFxDMSBWne8Tf6eK8CpIFVXQZSRqWUdf0U
         xTesIs5d+vjw+5lnSdgZbejkqsGsRK7Bw4JBDe7ezQ3qKh5/YaAXc+haHVWMD7FjFSQ2
         /tO06VB5D5TaXUyglYs4TFQ7C+novy6/1GyzByVw1D78727GGgZfahemXUwc3B7sZLzP
         iTi/3pB5wYu7Oe1J/IIIRSIyYTQX9m1zZLYz+lzvPwtXcqcEmQZN+QwjrDanWmTW7oLL
         q1JiwPy4vyiGa+Ro7rXK6qwePXvYEBs1udrgIgtK6/4XQBQwcRf880drawdHsjKCgEBL
         CwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365448; x=1711970248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjqmqD0pb2LVuJMwKiPqClT1cKdpF7rGWvpiZUhphWo=;
        b=mjIt+1UDyIf2o+AUC9MpD8HRq7V8KPeC6aeIgw6SibLaxK1EqCpZNvmQxBlAkM1kBJ
         xf2MqeyUf/iLh+83aD1CjuLy2QKlEtVjQ4Ik3Tz3T0yrHzQIToBlmY4BRBapW/ci+0+Q
         3+DbC64Ev6IUAZwFzMiDCVNBnjXbLMLc46Eub/s3lo4JUh1BlKxL2pVY+xZJKC43Hq/A
         wjRZf3TPDCEu771b9yeMP4zLOl+u24MUqCpkh8V1BZ6ozYiK8jiFPT6E8shz0OS+MXk8
         kWJBIhp8sEVXsQTOWnNamojpAh8xzWa99hzkFgcLR+5nt/mF1tLssSNSTSB8OnBKx2dE
         sWUg==
X-Gm-Message-State: AOJu0YzX2eNfZNazFDsPK8fdVG5+s4o/6oqpgsg1vzQpm997aThAWnFF
	KGjSR09Q6bnq02Iuj1W0UYp8mtgeoH+gM0RKM4mzACwuGgGXujVmWwmrf14m
X-Google-Smtp-Source: AGHT+IElDMJo0hHab1kNYd3YJxb4tx87Hqseqt6ae38W/veBqOARWIsaAJKox+VzdjLVWZvy69xObA==
X-Received: by 2002:a05:6a00:4f8e:b0:6ea:7e56:8dab with SMTP id ld14-20020a056a004f8e00b006ea7e568dabmr7026670pfb.26.1711365447612;
        Mon, 25 Mar 2024 04:17:27 -0700 (PDT)
Received: from rigel.home.arpa (110-175-159-48.tpgi.com.au. [110.175.159.48])
        by smtp.gmail.com with ESMTPSA id k9-20020aa79d09000000b006e535bf8da4sm3885877pfp.57.2024.03.25.04.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:17:27 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] treewide: fix spelling of "immediately".
Date: Mon, 25 Mar 2024 19:17:17 +0800
Message-Id: <20240325111717.113610-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"immediately" is incorrectly spelled "immediatelly" in several places, so
replace with correct spelling.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/gpiodcxx/chip.hpp         | 2 +-
 bindings/cxx/gpiodcxx/line-request.hpp | 2 +-
 include/gpiod.h                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index e8b3c0f..297db3d 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -126,7 +126,7 @@ public:
 	 * @brief Wait for line status events on any of the watched lines
 	 *        exposed by this chip.
 	 * @param timeout Wait time limit in nanoseconds. If set to 0, the
-	 *                function returns immediatelly. If set to a negative
+	 *                function returns immediately. If set to a negative
 	 *                number, the function blocks indefinitely until an
 	 *                event becomes available.
 	 * @return True if at least one event is ready to be read. False if the
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index 8c1b474..0a47a76 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -183,7 +183,7 @@ public:
 	 * @brief Wait for edge events on any of the lines requested with edge
 	 *        detection enabled.
 	 * @param timeout Wait time limit in nanoseconds. If set to 0, the
-	 *                function returns immediatelly. If set to a negative
+	 *                function returns immediately. If set to a negative
 	 *                number, the function blocks indefinitely until an
 	 *                event becomes available.
 	 * @return True if at least one event is ready to be read. False if the
diff --git a/include/gpiod.h b/include/gpiod.h
index d86c6ac..cacf97a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -246,7 +246,7 @@ int gpiod_chip_get_fd(struct gpiod_chip *chip);
  *        on the chip.
  * @param chip GPIO chip object.
  * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function
- *                   returns immediatelly. If set to a negative number, the
+ *                   returns immediately. If set to a negative number, the
  *                   function blocks indefinitely until an event becomes
  *                   available.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
@@ -1164,7 +1164,7 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
  * @brief Wait for edge events on any of the requested lines.
  * @param request GPIO line request.
  * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function
- *                   returns immediatelly. If set to a negative number, the
+ *                   returns immediately. If set to a negative number, the
  *                   function blocks indefinitely until an event becomes
  *                   available.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
-- 
2.39.2


