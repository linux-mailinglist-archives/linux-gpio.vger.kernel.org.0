Return-Path: <linux-gpio+bounces-7303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40496901E0B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 11:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02571F249C9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E117406A;
	Mon, 10 Jun 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De/qqiqv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE4F7405A;
	Mon, 10 Jun 2024 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011407; cv=none; b=tbfczKr9JLESXmYGNMHWBpICvBQm9gMJJxLanKPSCf8FK7o0GtpIrGxMQT8y2Y3ls9hCNQQoGWM9FQHOoGWBdxLZBWvnfKfHjxnrHhwTMTxZQVtr7/R/8StEmuI2DfvArC9ktnIpdGYUwG5M6pr4JXtVUl+AfeP8E6QQPkSl7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011407; c=relaxed/simple;
	bh=UqifGwsa5V3qAgI3sBE972ce5Y4RiqiZIkr/hHJjXZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=feHMQ3sBGdeldlssgpNcdGjUnWqiVc0zxEy4LRPrzLH97sFnREj/fSGnuucR+tp6/tYoK1LrvnvHPQbyVl7Wg83EQ0dBMomw+VFgHmCmqIzKe0QfGROUStmO22uOVZJ5wbyfOHZOap41IyxqV/y6hWRJVF9jASHBAmRipNY/baU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=De/qqiqv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f6f38b1ab0so9533235ad.1;
        Mon, 10 Jun 2024 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718011405; x=1718616205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMdqBsK8w4kuL70mSvHWdMfIDmzORHU7zll5kBEl/+4=;
        b=De/qqiqvG9KDOTqf6rbjVm6tmGUuFBHMlnlulbxbKYudzREdkMsz0zssDwz9MmpUPA
         oP7G9BjjfOY2R3/8p6wBuCMtbw99mFFX3KGiPJsXVSEQlKuATwCIa1JvlkK5uYElTflU
         tcwhR+Mn9ZqzgBiuWcWtEkbsjMg8BQzYPI9MZbZCVg46aDeXkGBZ5lIYI55uX3xiIf+z
         gbj9UdqiRe5Iq1ae/RL2EUfQ3Pgf9HVKZv5iEuH11pG3dexsYccH5RUgTZeAj6xNYNJR
         NGERbAtPiaKbFjFPaaqGamRP8PLe8KK1z9hTTg8jR+xDgcUpYo4e1fZYtbkieaR6G55s
         MkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011405; x=1718616205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMdqBsK8w4kuL70mSvHWdMfIDmzORHU7zll5kBEl/+4=;
        b=S41RGq+6DpE4doM+iCvJOe9OW4V/6Ev6GwwzPLWi3fmOtX6/ksu7V331FlTJJisuth
         q1aiBs3qKuupvwnw9qIoTfUEw5aWQDU4ucaoOCnfJfjGkFon82ILlU5od+zC7sG0P84N
         hw5pBkDw8JGF5JLVLIKGzV5IMV7Eciss4N4PJs+xXH6Z5BP5Bpk8WX6DrrjMQ5+9k9h5
         MbQXB48IwqMDG7r9q7k3iK7/0nooMQzTvyuyKjNL8z4vqV8AQaQP9v1UECbP9cmVUVrP
         zTOw+NmmTJFmitidPHHZ4kzPDphk7bR8LPeuaMNO6MAfbfe449WIqTS0GbiPdOHZwt03
         Z3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWlRIfGHUzge2W260OQoGkiGez6QJEMOFuKMp6415m+opUfwHizz0H8agI1Mm+85roy/1MsLs2w0KcdKLCm3mcA7QK5feMyvyZ1b+Ce/G57jFqNWW2luKLrSxJNAhHdrAP7NNbBkg==
X-Gm-Message-State: AOJu0YwblAcsXd7SBcdNZsXIzmTjg9f0XkWjmvvmHCKtNyit91qR1vPq
	k1ExADqjK72/DhAmms0cgpQu2GsQDxvMTwVvkRJVCvf6OzzaTDWIS6WwqA==
X-Google-Smtp-Source: AGHT+IFSeIuTazoVgk+XF0m8e4wO5bbTu4ZSfFPS+19z8TcZqNEv8Ra3K6FGsykJZ2pGzbV9BEp+BA==
X-Received: by 2002:a17:902:8c8e:b0:1f6:8290:175a with SMTP id d9443c01a7336-1f6d031cf18mr76950545ad.40.1718011405128;
        Mon, 10 Jun 2024 02:23:25 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6efa2a319sm41318395ad.108.2024.06.10.02.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 02:23:24 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	brgl@bgdev.pl,
	corbet@lwn.net,
	drankinatty@gmail.com
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/2] Documentation: gpio: Clarify effect of active low flag on line values
Date: Mon, 10 Jun 2024 17:21:56 +0800
Message-Id: <20240610092157.9147-2-warthog618@gmail.com>
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

The documentation does not make sufficiently clear that the uAPI deals with
logical line values, nor does it describe the influence of the active low
flag on the mapping between physical and logical line values.

Clarify the relationship between physical and logical line values and the
effect of the active low flag for ioctls passing line values.

Suggested-by: David C. Rankin <drankinatty@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../gpio/gpio-handle-get-line-values-ioctl.rst             | 7 +++++++
 .../gpio/gpio-handle-set-line-values-ioctl.rst             | 7 +++++++
 .../userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst   | 7 +++++++
 .../userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst   | 7 +++++++
 4 files changed, 28 insertions(+)

diff --git a/Documentation/userspace-api/gpio/gpio-handle-get-line-values-ioctl.rst b/Documentation/userspace-api/gpio/gpio-handle-get-line-values-ioctl.rst
index 25263b8f0588..2e3a52c113d5 100644
--- a/Documentation/userspace-api/gpio/gpio-handle-get-line-values-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-handle-get-line-values-ioctl.rst
@@ -36,6 +36,13 @@ Description
 
 Get the values of all requested lines.
 
+The values returned are logical, indicating if the line is active or inactive.
+The ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` flag controls the mapping between physical
+values (high/low) and logical values (active/inactive).
+If ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` is not set then high is active and
+low is inactive. If ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` is set then low is active
+and high is inactive.
+
 The values of both input and output lines may be read.
 
 For output lines, the value returned is driver and configuration dependent and
diff --git a/Documentation/userspace-api/gpio/gpio-handle-set-line-values-ioctl.rst b/Documentation/userspace-api/gpio/gpio-handle-set-line-values-ioctl.rst
index 0aa05e623a6c..12862132b420 100644
--- a/Documentation/userspace-api/gpio/gpio-handle-set-line-values-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-handle-set-line-values-ioctl.rst
@@ -36,6 +36,13 @@ Description
 
 Set the values of all requested output lines.
 
+The values set are logical, indicating if the line is to be active or inactive.
+The ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` flag controls the mapping between logical
+values (active/inactive) and physical values (high/low).
+If  ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` is not set then active is high and
+inactive is low. If ``GPIOHANDLE_REQUEST_ACTIVE_LOW`` is set then active is low
+and inactive is high.
+
 Only the values of output lines may be set.
 Attempting to set the value of input lines is an error (**EPERM**).
 
diff --git a/Documentation/userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst b/Documentation/userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst
index e4e74a1926d8..d7defd4ca397 100644
--- a/Documentation/userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-v2-line-get-values-ioctl.rst
@@ -34,6 +34,13 @@ Description
 
 Get the values of requested lines.
 
+The values returned are logical, indicating if the line is active or inactive.
+The ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` flag controls the mapping between physical
+values (high/low) and logical values (active/inactive).
+If ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` is not set then high is active and low is
+inactive.  If ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` is set then low is active and
+high is inactive.
+
 The values of both input and output lines may be read.
 
 For output lines, the value returned is driver and configuration dependent and
diff --git a/Documentation/userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst b/Documentation/userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst
index 6d2d1886950b..16dd50fc60ca 100644
--- a/Documentation/userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-v2-line-set-values-ioctl.rst
@@ -35,6 +35,13 @@ Description
 
 Set the values of requested output lines.
 
+The values set are logical, indicating if the line is to be active or inactive.
+The ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` flag controls the mapping between logical
+values (active/inactive) and physical values (high/low).
+If ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` is not set then active is high and inactive
+is low.  If ``GPIO_V2_LINE_FLAG_ACTIVE_LOW`` is set then active is low and
+inactive is high.
+
 Only the values of output lines may be set.
 Attempting to set the value of an input line is an error (**EPERM**).
 
-- 
2.39.2


