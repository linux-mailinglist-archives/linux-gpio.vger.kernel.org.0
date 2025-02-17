Return-Path: <linux-gpio+bounces-16141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC2A38674
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 531AC3A1EE9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA2421CA17;
	Mon, 17 Feb 2025 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Sv+KEAgX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4921CA07
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802520; cv=none; b=c7CVRPYZ+1qE+nthOa8QPi3JfNO/xPd6vZIbKYbJtUPlG+xqsV147/fxvKDhf1TL9m3hBtluDyvtqKSfctvAnYxqV1hPytIYFVx5IqQZJl9A9lLSxH4LyzLpCBeWVMxF+WYXrqLJw4ILjw+QXE6G5GRjokiWwNmHrZbpR1BRTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802520; c=relaxed/simple;
	bh=DWZ8KnJCurFakHrvDiy9CIv4ENhdR2uzRHV5srnqlZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ythog0hD7C03p80LCIID5u7MPhekjRxEZDICB6mk9J6XeDzhW8D33poTvIP1jPvDilpw31cdlhd7W28ADaPUy+RvsgwHCfPiNSb/tTA1e4/rdfLSDj56SFc+M1Oz+DU28cIsYF27KhpQrOqYpNENDiBTsgUjk6OC9XYPZyBoLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Sv+KEAgX; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1BA943F2F0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739802510;
	bh=EX+6q7+pfOVM4resmVZfWrWDLjg05cnGSRz3sXr+Pe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Sv+KEAgXOdtWJxYrbnzQOvf7PIA20DAIUdL5WQvSDxtDGx+xpCAhMU511/cYhYDLi
	 fgRvCEFuXVl6lGeFL7taNRIzkJkEqaBE0QWtUuciorN1S3EBk6dLAT7M6galjhAUej
	 F8tbHOFk26jJTT69yOk/F2YKLYwoqnG8nsPEQUo6PYjf1CuYKyUOtgE1HJ1mB2M/6s
	 tZPBpWHmY0cESGXmMds6oD87LedTLeZ/2lGTvT0o2XgeQAMIRFN4Jyy8mVVozi3rrR
	 Axtgr5/El+PragnymNOY8eLNmRwbglqEedQihOchG8qLEwHTSoWSWRUs4k+OEJfFsl
	 A+2X9juO+0dHQ==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220fb031245so51384105ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 06:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802508; x=1740407308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX+6q7+pfOVM4resmVZfWrWDLjg05cnGSRz3sXr+Pe0=;
        b=CSCd2G1yqpwIfcwTCTds8O56rMDVpYnBa9o2IhNBvr9TGFpiLJKWnxsn9pu973t1WM
         tSZrrR2YWGJWsT6dOdUNS2Mu5u3R3qSAPLkVCGxY2NZZ7PYt2ZRPsuZSPDZ+TnBqXI25
         6FFlhR10oaf322sVLH8LSY1QHKfEKESA7Ek33DklxHUm/lfqzzF2b0hzV+CpoeGbXHgs
         E5cIiSOFMal/VHgQTLPpaIJv+pr/VByUgpY1ApSjJlOuRInIGJQCTQZGQOLwOXdVJWIR
         EEJDweQs4R1G4rV35Rxoyqj54d0BHiaDlimW7R44EGAQDrpToPBoj5K2+BRQmao4Iu6c
         BEZg==
X-Gm-Message-State: AOJu0YwQ9OdquSzvGVFhXKIqTUHh58oeJCLLvhBSqa2VW06U95RnrIal
	8lD+q2dqjHfLwLneUd/AEfCQIccxIR0btSYiw3CndZsG0zYDOuh1BQzpDXUrG2eIM5rbrUznRjl
	Omb/s27RE3v7hlv9Rzztm0rf9DRDntgWvGw82ZDbKXL1w4cArhef8buU23rMFexE85WSueWUfrG
	+7ydNN88I=
X-Gm-Gg: ASbGncuo0Rf6l9wzosQEu2xNDP+PRHnGvRszoqF/B+2wYhyq3MWFFyZTdnIcJldupU6
	ejscH3NjOtdG1mUkAYILQ09nLaBkR7rI+cg4E6Gpg7vmUk8OPkvWBESReCSlk+ye4PzVoks5yrb
	jJgxqBuQQCUEkiIF4cujR7uyorvhLOgFGVuXgKakcjbKcTjCf4qbIHGrmdf45iUo+deJvgF0RpK
	599yAr9nHwYVnZBnJZInv+/htoieXg3ZlkjD9QyV2YLS/pxDpuXagStnw/IUNhfYwyjmJFVe320
	H+10G22tC2rbsZcHJmnmiBw=
X-Received: by 2002:a17:902:ec85:b0:220:c911:3f60 with SMTP id d9443c01a7336-221040bd357mr152416005ad.47.1739802508644;
        Mon, 17 Feb 2025 06:28:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqgEcYNrfelD3fE8sBtXnshCMF9huu3yV3EuLf6GVqAs2TeJlz1zjbotXpXbvkTZf0hJYWLw==
X-Received: by 2002:a17:902:ec85:b0:220:c911:3f60 with SMTP id d9443c01a7336-221040bd357mr152415695ad.47.1739802508368;
        Mon, 17 Feb 2025 06:28:28 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm72237735ad.243.2025.02.17.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:28:27 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Introduce gpio-pseudo, common utilities for pseudo GPIO devices
Date: Mon, 17 Feb 2025 23:27:55 +0900
Message-ID: <20250217142758.540601-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a utility for pseudo GPIO devices to reduce
code duplication. There are no functional changes.

In this series, only gpio-sim and gpio-virtuser are updated to use
gpio-pseudo, as the current gpio-aggregator does not benefit from it at
all. A follow-up patch series that introduces a configfs interface for
gpio-aggregator will convert it to use gpio-pseudo as well.

This work originated from a suggestion by Bartosz:
https://lore.kernel.org/all/CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com/

N.B. this submission is based on the latest gpio/for-next as of writing:
f04867a5d0d3 ("gpio: loongson-64bit: Remove unneeded ngpio assignment").


Koichiro Den (3):
  gpio: pseudo: common helper functions for pseudo gpio devices
  gpio: sim: convert to use gpio-pseudo utilities
  gpio: virtuser: convert to use gpio-pseudo utilities

 drivers/gpio/Kconfig         |  6 +++
 drivers/gpio/Makefile        |  1 +
 drivers/gpio/gpio-pseudo.c   | 86 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-pseudo.h   | 24 ++++++++++
 drivers/gpio/gpio-sim.c      | 84 +++++------------------------------
 drivers/gpio/gpio-virtuser.c | 73 +++++-------------------------
 6 files changed, 139 insertions(+), 135 deletions(-)
 create mode 100644 drivers/gpio/gpio-pseudo.c
 create mode 100644 drivers/gpio/gpio-pseudo.h

-- 
2.45.2


