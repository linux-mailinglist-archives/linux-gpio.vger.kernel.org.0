Return-Path: <linux-gpio+bounces-7698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD35917825
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96128281FFA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A561448EA;
	Wed, 26 Jun 2024 05:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPDXONG9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EF143882;
	Wed, 26 Jun 2024 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379810; cv=none; b=fPGW6Zh/NjKE2O2Wuqt/azDiDWaD2lUyLXwdzd2mR5JLQOftV1xi3PZ85O9WUaigZoQP0AmwQm+6S40K/pHdTDhnHGADHBjktTLhfnLhlQaUVzwUsEYBOznYjtd45exBmkVNVfNlBVMCj7RkLfzJ9f3tJsWhtNaBSOHTkrhOpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379810; c=relaxed/simple;
	bh=FsKp+orMRlKLPXvYpe9KT8WdKvix6GklcVgngmT3RMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NoP0X5nCwrJV4vePjnAVP6KGp2tsu37RbU9SxXo2eaX28N3Wrnh54yNNw2YfBysmkWwPCh6W9hwdVjW0HtgFYGRV58MB9l+pvsBmqgLXC5VZUDeqpLZsY5QvJjdAkXVd/kSMKqz8JqzR/4huEqvKKLoTMyN4zPZPzPoMIMOaz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPDXONG9; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d562b35fb6so67468b6e.3;
        Tue, 25 Jun 2024 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379808; x=1719984608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8JRA8YA8hNKryyYG9sIN3Q3e47oeZv1yWhHnRlL+LQ=;
        b=WPDXONG9BVWJw67mPU4C6JmBopBRUjvK49hudF0wRpMVcquUF829v8hLVTG53oIm/O
         Xo01g90IlTKjfch3FYYkyHQHce0g1Q1vqCgmuxTwn+/AaEUrpdIdDbHb/pe4BXMDte1R
         Z0GvcyeLbhifBwWNTVGn6p4iwceG5iyyX7pnqSdfHjyueDgyeATXGIMuKJfYQwFyB9MY
         ohSjTl3IfQXOvBE74U5cWmtDDFZD34GZzbcvnS21FKLU0nalRhFExeLdOjmeTOzgRoY4
         QLFV10x4UWRDO7rBaaKDwpCL1MWuUY8PqXaSQgRKUiHCiWcnU2SFpPkwSZVxUKu09edH
         6+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379808; x=1719984608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8JRA8YA8hNKryyYG9sIN3Q3e47oeZv1yWhHnRlL+LQ=;
        b=mxQelca5rnZ6jEQJo5P9KV5zUmOOV5zsc5cbcT9/5jffTy/p83Z+oWiu8H7Ll8ONWX
         Bh72OrB/ONTI/8HcNlubNLFfYnNc6ntd08CWpXFMTTACZXnVO4sDpMJ1cTSqj21OOlzv
         +CYx60ssJyihcnSYgVn5gI0CsKZcZJgl8jBNxW8swkABmGaRI+Drwx2Gnk+vHlsZ1mTl
         8zlRaL0Ihnx+VMUo4LayMWvaABsHqH0t5NdyDxjwy/1eWndouscetDqdgNzQ2395QSZI
         nPx+gT4fnPAdLevs7AzlkwerFiM76qSR0ODK9XjAxd6Z45cbLzDPjFoyQQwfEF2+knrl
         oGYA==
X-Forwarded-Encrypted: i=1; AJvYcCVBmvgnNQHfahsPo5g5yaIgAjbWie6kbEAnOMJN8SHtnq0VrUYllb7Z7j/9nIfNq4kdkQWZ9WGUf8UuIOnzoaV1Qvm2ttq6yRq0rhews1pqiRe6Re+ezclbnfPhxOjWSRkaNlvgkg==
X-Gm-Message-State: AOJu0YxGkh1HfPRw7JcI9e2zgdkeo3zH6r0EnB5eDsiunnyEHtpUlSlN
	6QzG1ty4TwpwIvzWh4ly9SaR29bbirfICRvIEOI22sS2NcURY/HsJefI8g==
X-Google-Smtp-Source: AGHT+IHwqt4wrcjc9eDBmy5l3JxEyb57OHWlFtqiCMH4L2axjSe8UpafpNzs7kK24+MUPgwLSdkREA==
X-Received: by 2002:a05:6808:4497:b0:3d5:376c:f9b2 with SMTP id 5614622812f47-3d541c50615mr11571432b6e.2.1719379807914;
        Tue, 25 Jun 2024 22:30:07 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70661b9f2f6sm7804000b3a.187.2024.06.25.22.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:30:07 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/4] Documentation: gpio: Reconfiguration with unset direction (uAPI v1)
Date: Wed, 26 Jun 2024 13:29:24 +0800
Message-Id: <20240626052925.174272-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626052925.174272-1-warthog618@gmail.com>
References: <20240626052925.174272-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update description of reconfiguration rules, adding requirement that a
direction flag be set or the configuration is considered invalid.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../userspace-api/gpio/gpio-handle-set-config-ioctl.rst      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/gpio/gpio-handle-set-config-ioctl.rst b/Documentation/userspace-api/gpio/gpio-handle-set-config-ioctl.rst
index d002a84681ac..a03f30db63ab 100644
--- a/Documentation/userspace-api/gpio/gpio-handle-set-config-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-handle-set-config-ioctl.rst
@@ -43,7 +43,10 @@ The configuration applies to all requested lines.
 
 The same :ref:`gpio-get-linehandle-config-rules` and
 :ref:`gpio-get-linehandle-config-support` that apply when requesting the
-lines also apply when updating the line configuration.
+lines also apply when updating the line configuration, with the additional
+restriction that a direction flag must be set. Requesting an invalid
+configuration, including without a direction flag set, is an error
+(**EINVAL**).
 
 The motivating use case for this command is changing direction of
 bi-directional lines between input and output, but it may be used more
-- 
2.39.2


