Return-Path: <linux-gpio+bounces-6543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FEC8CB6D3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 02:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A698B2143E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 00:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25EB17F8;
	Wed, 22 May 2024 00:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL1+OoRc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FD17F3
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716338843; cv=none; b=cXKhrEg1f12uwuIku6s0/PUfGAjgEdY/tQ1xr5+c9ITE3QsM6RY8XV8M80PyCc8vyiGKtkuG1gpgZjJP1mlTlX0cCO08t7ZZ5MFKN4igSe5v9QRulQqbGf1bltviDDx8ANGqi1kVnLJ2TVRp9fL3ZlhakWfS0v7H7VPagLHSQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716338843; c=relaxed/simple;
	bh=n4WM0inoYP5e6tnqlSYqVmwOg9f3zNOZzwSHGIgLTRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KsgNJA1jjsT6fiH4KMtyEAzbLnFKvUtLHTHVhyqPyCOuxuifTmbEuhp3OQn5nGPTqkKTin3+2G66w811FrBTMwWyuRDSKd4GCdjsTVUse5BjAa3pR9eO5l/JFscVXJXQIwLQKLBps1Sukf5R+ZrAdMBiJIV/S59aF2yz/Ueh5a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL1+OoRc; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c99257e0cbso2503217b6e.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 17:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716338841; x=1716943641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fy36U9EGP1XWWTkLDr1/cKH5m04PRzmxJGh+lK+WQuI=;
        b=RL1+OoRcdJtHXbvjLWu7IFwINljQbs15+yvH5fFLIX78iq1J/NzoJrNMFGtj0IKCoC
         +Q72wVYrecqGTwKaX+eDBwM0iWYmkBlCYj+tsZNxEunPo/rP1L3eAhfLJJoSuB4O2KVj
         Qqa65c7ULVdRMg/vPnVBvA06tkKyO8kpcxzHPdb9nnwKE0msg8tkfyqvpDFmYvRQ8qY4
         YbV3SK63BhYAI+oxyjtwrsIJxwJq5kyM9QgNmqT2shxZxNffyFawSu2sgBalwPyCgCPr
         tpqX77RIIBezIbFfxqhv69BkWOXzl/xDnsYP47iElJVfGvo9RMGy2eR3pyGWwD7fOHkf
         eKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716338841; x=1716943641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy36U9EGP1XWWTkLDr1/cKH5m04PRzmxJGh+lK+WQuI=;
        b=SbAtDSr6/BH49UmFcD9YilZ3HdhD8rIQg+fBkpAydxdgd81qAcOH969QK8VDJ2fhUw
         UYAX1tMLBaA4JPSQ5qt9Ud0Mj+ikYGqM5erIwR/tTYSRBMjiamY4VDA+iITNaAUpXkbG
         0UyPkPkcUcANz76wvdWJ8EwVErYHFTIdQYhTvi+wUFQseS/7Fku+szzDCaBmGIW+RHTP
         YpXpQFEPWS3LZU2fBRToeIdTTMB3q95vK5OleY6Of7azLGNzf9Mxn7AUIXI/KEMGlicT
         tOG/r9cpEm9xsE86SwTgi1iEvioxT/iD1zs+Ks/fYufNS6XVPI0zJK4+K+fgHLYoQEY7
         CCRQ==
X-Gm-Message-State: AOJu0YwDX4gp85vIhsLkoUBQvXgLekYTbraqj8LURwydOVyHK9aJMesy
	njJniyPKHisLZKD0L9G1BAAKKbrQFOUyVxOuMEcRNuRlbnwAQG4fgaH1RA==
X-Google-Smtp-Source: AGHT+IFMf6H0aL/oXisWPpq041o7IIY9gC/QQl6kNyjIhpXJ7HcLrAuqV0vMsmFpmptm92e7eDsiQQ==
X-Received: by 2002:a05:6358:5d86:b0:192:4dd2:2b49 with SMTP id e5c5f4694b2df-19791ddc7f5mr47940355d.4.1716338841064;
        Tue, 21 May 2024 17:47:21 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c36sm22066302b3a.173.2024.05.21.17.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 17:47:20 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] bindings: python: support casting line.Value to bool
Date: Wed, 22 May 2024 08:46:43 +0800
Message-Id: <20240522004643.96863-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240522004643.96863-1-warthog618@gmail.com>
References: <20240522004643.96863-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python types default to being truthy when cast to bool, so casting
line.Value to bool always returns True.

Add a line.Value.__bool__() operator to map the line value to bool as
one would intuitively expect, so ACTIVE is True and INACTIVE is False.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiod/line.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index 1cc512f..d088fb4 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -14,6 +14,9 @@ class Value(Enum):
     INACTIVE = _ext.VALUE_INACTIVE
     ACTIVE = _ext.VALUE_ACTIVE
 
+    def __bool__(self):
+        return self == self.ACTIVE
+
 
 class Direction(Enum):
     """Direction settings."""
-- 
2.39.2


