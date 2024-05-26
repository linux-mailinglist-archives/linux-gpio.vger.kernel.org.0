Return-Path: <linux-gpio+bounces-6622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC6F8CF418
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 13:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23CC1F215EB
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 11:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DF78F40;
	Sun, 26 May 2024 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfcjW/aD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5C2CA5
	for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716723186; cv=none; b=YjjNXmG8M9RyVhbSaBGvGKWQIvo14vSBmrAGyTtpqEeqM5fO903MWiO7DvXSZ1xoRzDYnMWYmuCrnjqlXn7WM7NPzFTXxAqsPw4gcUperT/zsHP9998IbVOHGCId1lkug/3f/41JHCcjIj/GvrqcPtKwUFI9ZuvifT5KDupf5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716723186; c=relaxed/simple;
	bh=PXtGoVD62pQVOmcvbFJkMcQhQM3T/rA9qXXsxgJtrhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7B+7wfZQhoNN5XH/JJS9EQa3t7l8NytflPDJTCExZO+7558bL86TcM5RtA5F1nCR7XmbJnIbnolLi/LiH7c5E6YKwavAMkhQ019fD3I7p2M/BtItfiflp8KSjNW09Z5G+q8qleRT2qbScN36Ik9XspRd78fmNWTpn0VgucSK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfcjW/aD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ff6fe215c6so485870b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716723184; x=1717327984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/T1/6O6DQPcmLrCE0+OwgnvuRDNnYzVtbIn/Zxkq0Y=;
        b=lfcjW/aDJ7eh+3PfUSwd3YRfUac0ris54BP5wG0F+vaLQFotEeRVG0zyhv9pkViVmf
         yMeT+NTOWjAWmIertSlRtV5KB8mOHJauiDw6GJkDp031CHXnvg5WcXiDaYsLPA1pdUBr
         qtqdhTUo0JVdg/vyqo/AG24UJYcNNevnvfUFflQ2XAy0pOCpqo+eh5UqP20rtez2LoJx
         VjddPda8cKf7ELbq3QFtPfeJRhoERGs+OL18wfU6/m63c7Ij0B/sZIuffmi4yNAp7bz6
         m+lGMBt5WcYsJwJ2UYyB6udkdsq9RO5bV1rJPU50kcAAc9C3dzQlz7F/uvOjlAQ4fF69
         gDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716723184; x=1717327984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/T1/6O6DQPcmLrCE0+OwgnvuRDNnYzVtbIn/Zxkq0Y=;
        b=pSa/GDawcOb+tVOJiiJpat6IwhpgED9/bYKlOAS6ZGfHyonYkk9NVSrzrkPWPYd8iO
         mwFOTZzcy2ZPf9By8ffdKk7uyrxfUTCCsfCFjnB4AecFOdz3q21AL8jq6WTt4UzFKgoX
         HvckulB1Tnj5OCcErU1jFI/W3jLpFewLu6KaWoPcJPao8gmVq0juYdbmjUT05mD/1IVj
         J774WTuNNJrffeTS4gpwwaQcC3xwEfBj1FDQNdDHe99Dpip3GRNj3lWbgxZPT+6Xrckq
         XROO1Jg6PAD9Z1ERZQ0HwjaZU26uhIw33AyThu1amFlJjmsxaUPGtHZFKiR/3MO1gHzK
         OP2A==
X-Gm-Message-State: AOJu0Yz8qNgA3UiVp6IQCUaLk0OomJ+GzumGzpmD+wYns54d7fsP5x0O
	n4EEwpunuSyVXNp59G/nx8UBnjVAbk+STfnIei1CP+wotf8In7T0A5ZBwA==
X-Google-Smtp-Source: AGHT+IFZJCIbEcdXQxJhOiX1/HZK6MLbvfPwMltOTWyyOIpkkqEmkbLx50vjD0nxYlZ6Oz1adHq8pA==
X-Received: by 2002:a05:6a00:8013:b0:6f8:effd:7942 with SMTP id d2e1a72fcca58-6f8f32a8cdcmr7184292b3a.2.1716723184493;
        Sun, 26 May 2024 04:33:04 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6fd94372addsm1793646b3a.186.2024.05.26.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:33:04 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] bindings: python: add Testing section to README
Date: Sun, 26 May 2024 19:32:33 +0800
Message-Id: <20240526113234.253859-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240526113234.253859-1-warthog618@gmail.com>
References: <20240526113234.253859-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section describing how to run the test suite.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/README.md | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index 325c63d..cb5cee6 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -102,3 +102,13 @@ with gpiod.request_lines(
         time.sleep(1)
 ```
 
+## Testing
+
+The test suite for the python bindings can be run by calling:
+
+```
+make python-tests-run
+```
+
+from the `libgpiod/bindings/python` directory as root (necessary to be able
+to create the **gpio-sims** used for testing).
-- 
2.39.2


