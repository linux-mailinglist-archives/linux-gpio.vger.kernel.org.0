Return-Path: <linux-gpio+bounces-14139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FC9FA7E0
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347B91886527
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F944190678;
	Sun, 22 Dec 2024 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="woZVy1as"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A518BBB9
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898103; cv=none; b=YnKtzs2q/bRAkWYUPSBPIDVPmJwha760MWgTD1076S4AsOuRz2+kvZVY353iwZ5tXlmd/RRwWiQ2HVMA2hmHlycZv+2AEDIRKKglXVBLz/OnUPWtNgJb4HFJVuDtETHTNCivmQ1mUGHKVrkAbAbF0rUZmdO5uvHlyhPjs2+bhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898103; c=relaxed/simple;
	bh=YilZz6A9tl3H04do/1ex0MqqUVgAZTxf2/OpwfJAKDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKIqSVftpA/4fPdhcW/5k99403CJ131t7qFlmK6VpgmLU1G7vLPN9XTrOHuQMUhY2GctCexjr7zeOfv5NwsbC9E1atvhkPYUPDSha5ERwsJLxchZa6+wNol3NwzvtjC8RUlCsA5W9u7iVsUEkzt+WLJoz5nOVnjBAk6SPiJ0IXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=woZVy1as; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43624b2d453so38199375e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898099; x=1735502899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1J2i+9hAYKMd/cu+aN5cLBk4csvIDgvl+kPAxnJaEw=;
        b=woZVy1asQxMNFiCFJv6g3WY5aj/DQv0dp68pkujoCq/bymIGX9GxaxRadLFA28RcNh
         1kj5rhFQuJdBOUNo7s7iTO0riA5GPhsCZyiT9bm2dqEYfkvxtQ7XX6dEDYZN1Vf6UJKu
         7aVgI/tLqiwRjOhX3pRVRwzfWZ1tpAOwZ5dBvllK8Ds3B9WYVeUjhLGOQsDfpkzqbQ+R
         i/eBe6Qms2UC8yoJxgKogMuBkaS3L3PChMDCZGKQemLpxutbGe8pPkabf+N2PAcOAg//
         NSwGKfXqplaedFmv5EbcyrPa4mL6jIep6Iwgp8LyMu/lY3Tt22G41aszk4ve4+/iM5TT
         6WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898099; x=1735502899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1J2i+9hAYKMd/cu+aN5cLBk4csvIDgvl+kPAxnJaEw=;
        b=AVldsZijHzQ/iahQ6B+amMMo4+D8zZbe5IEf2w09T93+l3knZqoICtTALkIlkKcLuy
         RxyeUaE1ivSDQYT6+DymNm3PNHgRwiEceE7gI7MNeolb1BRkfH5NnQFsNh9IGzNiEuWT
         oZLpG8rpGxa0EPzwxZeqE9W2VoRa5RtrbC7gMpomo7LbbPn20yBWKZbmV5LIxWryTiFS
         DkKuIfG9Vn1U6BIY5CXGaBT//7x79GAWFL1wgFVk6l7l+j1jY9yzlplpQoyc1sL0jopM
         cD5PNEOQCN1ZF7DZ8/3yFcpoEZci/pvidTRN2b2VlsjrhDAbr5rxl0ljQfS8TFZqEIYA
         1dhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzwCZc6b1tHuDYFzV55RmPP1hpfZyrBJmVcziBN/h2w5aD4rmPgeD7NCAUPUvWLl8NKi0OdWXIYcRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJNDeV7iBOTXiHT4GprT7XLhui8E7W/ZyPtThETqYfMIrMYaR
	5Lymh8ROcJGJpjKiPaasko641mefBrXfpHowxDShd7oJ+bG0WF2iCq5Jt/nhVOk=
X-Gm-Gg: ASbGnctbXTAFoMv4JROQllyYcSlJ/WfJAK9yNRil4c5O208LTL9rLZxFhtkFGehQ+IF
	oljVxcvEDsSAeuqW78Te1PX6GFEkth24iRONHN7tLylc9dwqZqgieNewt1EoN95H3QvaelCyfkf
	8ee3ML5x3bTmKG1jono99pYIi4Yi0krsD5kCqqgIRkuKFDN1gIN/oDvPC2ZisO55foEPAZAlb8D
	YYo5gp+yd3RWrAXwC3X3IadZMthnVup+aPEPqWtSK+qiSB/
X-Google-Smtp-Source: AGHT+IEyqI3K30QnOwMngwZ2ZdYDKJAwkMl7DUVDU9oLopstBP28yLQmcV5LAUgQv2D9pwzmP4fFlQ==
X-Received: by 2002:a5d:5e09:0:b0:385:e4a7:df09 with SMTP id ffacd0b85a97d-38a223f75fbmr11465438f8f.44.1734898099561;
        Sun, 22 Dec 2024 12:08:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 Dec 2024 21:08:07 +0100
Subject: [PATCH libgpiod v2 2/5] bindings: python: doc: update the
 docstring for gpiod.request_lines()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-improve-docs-v2-2-9067aa775099@linaro.org>
References: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
In-Reply-To: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DE6f488TgezGHpfP+C15KZ9ntYY4YymZkPrZIuz9vlE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGvtACFk0lhp4Ud6GHmEQiFkdlBJm2CafNXE
 bpIKCQ+on+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxrwAKCRARpy6gFHHX
 cqI8EACOxfr0EpFVDN5W4c5kMDhDiiuXq+rd1fv/ihIqeTKzi+b++6xSPlOW3zk9m99ism6kqED
 kzq3Ea3dRph1tLE7MykIj90iXpFdWgAelrNFIAId9rO7IK2TetJR6Ty2p7laFt37hnDiM3OTyBi
 fKm5IfT5dg/2kRioHFFEeMJEZnPthgqL8jLJHLRlkwN6G/tt5b9pFzgcsv085ukINK0xmxbeft0
 a/Hs0h5S9D9kc0VCxxq4e3rPxhd7fi52kLGlGWkkiQ5YVmBGfqZKtk4NBPnd2pHdWxGF+mv/6OC
 1zbxQZYrKX3iqfmDXhXL0tHK+ojajr+ZZuih3IAHNQTGHHuYpwEJh9CyMbybuu3MPlYjYSnjid1
 4yFB9ouJJdFrODfVIrIj6M7+RngEIgJ+PvhtQdu4/CdpGbCx67eBiI7n/XugUhNTrWTr4FVD/do
 ET5HTiY9b8mo6tTQx9ygiaARSBula/TMeLCsppPaq/YxMU0yA0V8ek0CN7PK/OzSZGkZt7EcP/m
 fhG3G4yJLELhHG5uXKyltAm/U7CZKKVxjrGnX/ug8AYVQ9iHbENfy84Mbv3fvKW28exyny/+2DP
 dzgIzsLOChQTVRqd2x9mAEjgV+KImlCJ5Zoz0XXioLYy8dQ4pCOUVYXIRpLpQ6M6wtAZKZV9dBz
 bHbDQC3aDCzJgxg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The global request_lines() function was updated to take explicitly typed
arguments instead of just passing *args and **kwargs down to
Chip.request_lines(). However, the doc remained unchanged. Update it now
to reflect the actual function parameters.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/__init__.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 817c755..854e41f 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -99,9 +99,18 @@ def request_lines(
     Args:
       path
         Path to the GPIO character device file.
-      *args
-      **kwargs
-        See Chip.request_lines() for configuration arguments.
+      config:
+        Dictionary mapping offsets or names (or tuples thereof) to
+        LineSettings. If None is passed as the value of the mapping,
+        default settings are used.
+      consumer:
+        Consumer string to use for this request.
+      event_buffer_size:
+        Size of the kernel edge event buffer to configure for this request.
+      output_values:
+        Dictionary mapping offsets or names to line.Value. This can be used
+        to set the desired output values globally while reusing LineSettings
+        for more lines.
 
     Returns:
       Returns a new LineRequest object.

-- 
2.45.2


