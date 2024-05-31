Return-Path: <linux-gpio+bounces-7005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6408D634D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439E11F25EF8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB6158DB3;
	Fri, 31 May 2024 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJUvLPWO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020AF7440B
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163131; cv=none; b=ZNoJ5WsI+2goXhCh7OsHx7BqqlitVVt9p0S4EnAb1zxaRm7H/AXAyGmeEysyD7CkCfUCZYmBp98TfRwHVKV4k+CBit2AylUF2LVy8FTTiG++nCUy1ZeEh1Lv/JL+SP2lgjeVz8pks+NzKdutmN8OZqtyeAVVS34Js+Bd9QewjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163131; c=relaxed/simple;
	bh=P5CQGEgu113Q8Zu7roHFjlaQln9M6sGVkhOIZohe1eg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SDIugi4gqCHYsSobbWguji1KWYWOJyIxITd28h0dQSSUhxxGvcX6dStk5QmwRd+h8/Y8LEybNkrCHEbnZLh8gpMGOkTCtYfTebjSYru6/Fxr6/Mc2kaWbQpQAyr9UsEHNMGFZHJ8IADv8Ss6YII6WeM0RnDkB1aWKWEs7KxmSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJUvLPWO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7024e7e55f7so332898b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163129; x=1717767929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxPssS+aoodjMf/CHVK/+6aZv/oU/M7auyscCvQ4eIY=;
        b=ZJUvLPWOWSJ2lYtTDH9Y9Ybgaem8U9gGFJAJFy4dvQc+1L8Vu2iOMTcEKo7cvNRlqD
         bgWj0Lc73kJVNLllxzo2sM6zKYszV9owmrCSBrydwz6fR+VpbwASElxt4E0OP5YhkbTN
         WG/nkyDX0T7Gx3dMfqmYVvgHWpohg4+dO/s6L8n1Cr5qssD2Zl4IM02LPHd6P7hJJS7c
         04jR209yYELL2K14wiXuddPw4M4BXZzpwynA31iBEjN5ZR+ePzXWLShg84PhBkFwgD+W
         L4Z2azjeXwF2EX82hQdAQBRl2+8pqHy+228wa1S4BT9PRQtsKv7h/SaPGT27IOwOgPkF
         YhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163129; x=1717767929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxPssS+aoodjMf/CHVK/+6aZv/oU/M7auyscCvQ4eIY=;
        b=uD/TDDF3NkuM9Yp5kVQZaECEPvkv5TNy0JvLr5PhWxwyXIyzXdmMJjj5j6lwT0WjFM
         ovLSCYRX4TStDa/8k7K5RbLfvt8D/c8QC78pigaFHB5UoL/L81xB1s1GzKa2d7CNxP4n
         4RWAm1Akr91T5LoxMwbxVT26vx9zBLJkd6kQgkqfP0Y4B9yzhSKqEbrDPa1xLMtkSaX8
         PIFzcwejBce/eF0x+DAJbDUPy3qTsBKWtXLQb5vTJMhvuE+T8Wn45DCf1rP98QgMOhO3
         CYdD8pFU25b7z9Q2oh0YEVAnBmYQ5tSegOE3HAMAsmqpUjAFdLlJ4UYZVAZU8XrMNLrF
         huLg==
X-Gm-Message-State: AOJu0YyOpeA5duyKMhwQHHPuJ8QPv61ehhTPJSroTf87EZ6oveMMHpEP
	OzxOYXQodYERw9YB07WHH2GuqcH8OFYsY98yvPuz3sYJE4rOtog1965QNw==
X-Google-Smtp-Source: AGHT+IHJWM5jWBdvO1KeqFjnQKYxHN0s/zwIX+5hXjE4xg5NjM+b4kXiN7OfBKKyLdJKyeF0kizDXQ==
X-Received: by 2002:a05:6a00:1c93:b0:6ea:e2fd:6100 with SMTP id d2e1a72fcca58-702478daf36mr1947249b3a.30.1717163129011;
        Fri, 31 May 2024 06:45:29 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:45:28 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
Date: Fri, 31 May 2024 21:45:04 +0800
Message-Id: <20240531134512.443850-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on recent discussions, this series fixes all the warnings
detected by shellcheck.  The resulting tools test script is now clean,
at least from the perspective of shellcheck.

These fixes do not correct any known issue, other than shellcheck
reporting them as potential problems, the intent is to remove common
shell issues that may impact future changes, and to simplify checking
that any subsequent changes to the test script constitute "good" shell.

All the patches other than Patch 8 address a particular warning.
They are reasonably self-explanatory, but each commit comment includes a
link to the relevant warning(s) which describes the issue and the
appropriate corrections.

Patch 8 addresses a number of warnings, all related to word splitting
and globbing, and those constitute the bulk of the changes.
Some of the earlier patches also address trivial splitting/globbing
issues where that would prevent a line being modified multiple times.

Cheers,
Kent.

Kent Gibson (8):
  tools: tests: don't mix string and array
  tools: tests: don't declare and assign separately
  tools: tests: fix unused variables
  tools: tests: use read -r to avoid mangling backslashes
  tools: tests: don't use variables in printf format string
  tools: tests: check exit code directly
  tools: tests: shellcheck don't follow sourced file
  tools: tests: avoid splitting and globbing

 tools/gpio-tools-test.bash | 459 +++++++++++++++++++------------------
 1 file changed, 234 insertions(+), 225 deletions(-)

--
2.39.2


