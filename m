Return-Path: <linux-gpio+bounces-15740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D82A30C46
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA893A39FA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6B221D018;
	Tue, 11 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZPuD7CBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24894217677
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278783; cv=none; b=jUIzlnt6SRyBjP05208QX+Rcg5XdTVAa/u1n1/V+oFwpWggAEpkA+CgydRA8G9iD+FabI2gkktzd+rlRgAXtYWeCD7gXHXbdniBlttMCGFsPpa4YEM3ESU1rMEg5Vx+X/oSrdEdUStPu5xeR2+Jq9oDWv0uc0g62iS7js7TSMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278783; c=relaxed/simple;
	bh=hoHBTR9TOL1ZwazPya3p072s+4nDSW8c30s00S0GpdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rs/q6HJ/S12FjErBWx5WA2kCYNHGKkKsbgbqjk6DzapnKfj2qdjbw3OsoIaGVkWM2ZOSLy3O/wAtLmugdlbpJxOp2KE9blo0pZBKS/2y1tsGMe8qTZTIVWMfxQHAuG2KdQMAA+ZePbDoes2ZeLZHem/XbEallFD7h6p0mhVgZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZPuD7CBc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439554db49dso4993015e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278778; x=1739883578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX9VVeruVQ7eRfdbechwCOPULJXVbEkw4OVdlGOjQXQ=;
        b=ZPuD7CBcITeUfx5iQLlCtkLQZ/eVB+DQ81TYVhNcrenegf/rez2KGvSFTsn3cP4GpF
         3kY55oP1aSo1NQ1PVCxyNbFNbuwnPTTrQD9H7JwRL2svCEHx+6G/jYNw0Weo1R70wrNq
         IXszdwArBiJtaPOn21LFUfnzvN4M8ot5AFqHTcVlNzzoGp9ZFkKAxtJgGtzSWntjAD4W
         nXpVSBARRRqaX22OK69qFS3WCBa0+TZRjAqV6eu4sx6JipQzar0jcUXyU4fg2JN9UXwu
         vJ2ibaixkb1GdPMQnYESXkjJ66JneTYlwqItY6vn1h6OFCE2sJBP8WXiSDOo4QZMVR7C
         P+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278778; x=1739883578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX9VVeruVQ7eRfdbechwCOPULJXVbEkw4OVdlGOjQXQ=;
        b=Z68qJQyRmoDr88EEjHjiANOu6bQmzTXw471qUY8kROnwPJiWhAB6N5ypBWMCDym7c4
         izy6UdaIaK+F/efUs96khN8U0VKKLYwL8F/kAqOumbVSZlg3Vnc07HFWTb/6/p+wbv0o
         SDJiR1c7xxvgpAmQ7NEF2ogmHl3yQwL/VQVTs5STkU6chpcsHoY0ZgpBwpbfOJJVTQAV
         epZ1+DgxkiZpzDEGRVUcfckqoT069W5Bi04GQDv5tP+wiatGQEUVACDgzb0EdcfnyyfQ
         JTfrYq4MV+B775cJYeXGQBIooD13iQ7VP62XLdGlwv2IhPQgAfqH16WxZNMsoWMIFVy+
         Y7+g==
X-Forwarded-Encrypted: i=1; AJvYcCXY+s7FcsyejzqwiehGdxIjxi5RdZGxFbNXBk7D5woIuvCo8fi0FQC86JVPpLPSicWwLlm466jaY8lU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WGGaSouzlm23iqBpIToLDg+5ZC5q5tRHl/4+UnX2KpOH2wRh
	qNodugGicPPEAZz8CUzm/H+8W0AQJYuk4DqrhIq2LfPHRpsdtWVe9lSiPQZXlxU=
X-Gm-Gg: ASbGnctAcvTLxICySj3jPSstNOks1XaKkWkVOkmPLJh5YRaua7ZSvOobTNa7WD1lgLu
	63YYBwkn4bk1tQwk5xSdRmpGrduOsNkWHXa5k3XBk9I2C0w6OghNS0otdrTT4+POoOCw/YCm3iG
	h3JdGAywL9cCNJJLF5jkXGfm8OVPpLIwfn3ptEj2kUvla45S0REKfoI6aQeHHDhw+oZ8aKcd7mq
	nncuUvawb9193yCUWu5HU+7xz6etY5iOpz2+KJmzpYxOO6QGjH918a6w9eJ0a01UVZFzZTbgkWB
	I9xMr24=
X-Google-Smtp-Source: AGHT+IHQ/rHrFgniXog8tTw/tFz0mHcOwIIDFgl1EqTVbGN0+TjiJpaQsGFBes8T3Qf1kAI90VQw2A==
X-Received: by 2002:a05:600c:3482:b0:439:42c6:f108 with SMTP id 5b1f17b1804b1-43942c6f621mr81784235e9.6.1739278778429;
        Tue, 11 Feb 2025 04:59:38 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:22 +0100
Subject: [PATCH libgpiod v4 01/17] build: set PACKAGE_URL
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-1-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uL9eOG2xv0BMz+LonRXot+ZirkyYIT8F4vCr7Ugi4KA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m0eI6BKbHm5ojBdN894BKwG84nkDn37vk+g
 2/0b5WwKNCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtAAKCRARpy6gFHHX
 csbmD/4iECJBitrsIhIEmKX59r8vrcSrmV/6NT0iQeyLZsqZE59GpEW+XjQKg1cTeL7KjrSewOT
 6oLNBA2/Jd6Cljwx4aSXnxZYajNYbRxNddBEuGNWtBT3unag9aRrzw77a1iITXzxb1StXJr9B9x
 eZZ8kknXI4jybryiOjziZoLJiK9nYFHMvKc1aM8G77hWMjUSWQT2lcYPEVXXnX94l3DRjD1ExSo
 0tt/j+IlRMnd69Mu2QAYujo3dXs25XzqW8b0x+2lsQZ+WmvKHCtP4xn+eZ6y/MXpmbiE2BMK8OY
 WXcXaXvoUAGQuS/5PqJMH0xeJeqshEq/FvZ/45YPKpMz+Mj7MkOKnV7eB3pwJYKD9MqFzzbE7fc
 CXc8DpCGdnVnvhoTqN8aTYlmQAagdT81jEEp8THTbN5Emy7bDCb0jGqKU5qfQ5fuqgzWGFirUHB
 kM1RX7XOC7MmHIeduFxpz3X04FzOCyD4ftemz1U/jgpSfQzYh5L7K5AH1EjilCAoXLYVwkXG+tA
 /9t8ZTEOjGo81X7jS5hPGYSEM7Eux8B80m+75aYCtqu7l6A/ruKJSM9YQ+26zlvpXgk0Mxonz3t
 n8CxJoTj/6HHZb1qUxyu4f1cCv4zDDKQlx+aR47or4nZPzwwQN4NcFxNK3/hFtl7oWBlj/0iq/h
 ke9UhfJZsfwbtLw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't set the package URL in AC_INIT() so the URL section in
pkgconfig files is empty. Set it to the address of the main git repo.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 78a6670..34de870 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,8 @@
 
 AC_PREREQ([2.71])
 
-AC_INIT([libgpiod], [2.3])
+AC_INIT([libgpiod], [2.3], [], [],
+	[https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/])
 AC_SUBST(EXTRA_VERSION, [-devel])
 
 AC_DEFINE_UNQUOTED([GPIOD_VERSION_STR],

-- 
2.45.2


