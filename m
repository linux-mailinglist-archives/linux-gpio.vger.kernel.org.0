Return-Path: <linux-gpio+bounces-14395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96F9FF6A0
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F491881DE8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624F8191F89;
	Thu,  2 Jan 2025 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWHOrRJp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BF718E379
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803685; cv=none; b=HbDFaCOLYSwdgzXSPtRezVTE1W20FdGnMMZR0R745hfF7cEzGaDggpK2xtyrYWxACRpVOi4dyd/7Yh5FniGZa4lERAM/zfs3mvQ0s13zkUFy9ndznDESo+yCtRdQTeCF3RNPcAFp+PN1tyb4EOYNS96vuzbgWGeY737TizW0hbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803685; c=relaxed/simple;
	bh=ftJrcLq1EhRqiB3l4lmiEC57gsaZTuSKQ2hcHXHLxY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VOCo+wL1+sP4CIcj/bFbW1CR3V9FyFkVLK5jw+DLhV/eV1mYo4KA93VpqYdx20edeFYVM3ck6JUAA6a8don6rHGDsGngnT219/SSY2AcptZg1uakuJXiWXFLG+46LSxN0rpUWgPZhXufRJJ8+gZ2egfb6cwdsURSUzg6qxN1xNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWHOrRJp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaeec07b705so1029595866b.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2025 23:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735803681; x=1736408481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwHcQ0FBN++6tHt/s4/6LDM6aeb45kNUavScSwkQXKk=;
        b=BWHOrRJpKXeEyLJ+cbp7GqdvFA9B+YBEbiynoTxjAG6WR2COaK7f8z/0zmGUBPyakz
         vMVsGzq1K+aIALQMXTqwJmS2OBrVx/5ZRWuzTnB6pwE1UJctoTeS0USx23Ay3ozrD7mf
         384tQQq2/hHELLMNhxcsDPdyhfrEjVqXgxPC22BcQ6fL6d+Xhm+v5R7ES6NQ0G/2zcAZ
         /I0uohJRsja5VKvGuR8DtS5xhoxgHcBPWcBvsvWra9CEsFloqw9M9cKiq7G1ZrGuLwuB
         y0ZpLl4Uttsf8REHAb7UmpE9LLYEfCKbPbzaX30iG1t8gTBcdWtmey3AVxo5l1I39/O2
         bcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735803681; x=1736408481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwHcQ0FBN++6tHt/s4/6LDM6aeb45kNUavScSwkQXKk=;
        b=tawaRYlUvH6Wt4Z6viXzkA6SVuY0ZRoUrtPZngoGEutuuS+6dvhhTn5iGKEQvGUsNj
         /Y7HpRGsJvItIvmkkefQsr0RFO+GW4wF0tV1i5is2jymJKg2/f9putP3hPRq5qBY2aZn
         5NPIf/bcrH1j5M7NapMQlYYEhRlG+MaCdVJ9BkwJ2ynebfZ7A91ht5SKFPy0meXuBkz8
         XZW6LiNavIQ/zbRqWQUhrA3OcU/EjxNquVMQjeLcLef/GR+KVWTKdsdCn4Wpfnq+jkXU
         6xSwkqaM3J5z0RuWlVeSQocYg7nOhjXFo/fw33wlSlWaAEWOVSrCQ71uJ+S67W1QolXp
         uOag==
X-Gm-Message-State: AOJu0YylvsPrZFiheROHenZdqDNsjmnAx/md5st6Co8hQoCq+kvxsOR3
	xaAiGfhsDto/xugBXej7EOj2Y6ntWTMPb1ZvjSsRYhpHL6d8FW97D7N8LcagTbO+MUZhzLPYGt+
	c
X-Gm-Gg: ASbGncsGn+Q4NbCxAuKBB93KAV5hPDWZw8UcDYB3JLmH7Y0I2NGDYMXhO+cOzrkKlQh
	uVNSPser3ntDhwv4dorkyLoyAR6tvqxF57X8GaYRKcpEyJCjdj7SFBmKjmM472C1Zj4emy5EP0g
	A0Iw3NF5r3B5A3jw5gm9qDM47XxJr96eEWYXjvEgRSmQhwI3De/Hvpg3lhQ0RO+J0bWnC1oT7Qd
	MER2o7u0sEjQYvNGtpAWZ0zuBdKoYMZiK2lkHg0+7epqFhO/+8=
X-Google-Smtp-Source: AGHT+IHUov4ZuayXZx3IHOFI3dr9fdIXjTZ0ZL7XXkrRGvBFKqfDE8sXeA5kJCRmeDIA+xGYJTcPHQ==
X-Received: by 2002:a17:906:7943:b0:aa6:2cc5:56b7 with SMTP id a640c23a62f3a-aac2cf50655mr4319759066b.33.1735803681621;
        Wed, 01 Jan 2025 23:41:21 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d593:2300::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b2absm17785949a12.81.2025.01.01.23.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 23:41:21 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod 0/3] bindings: rust: fix some compiler + clippy
 warnings
Date: Thu, 02 Jan 2025 08:40:50 +0100
Message-Id: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJDdmcC/x2MXQqAIBAGrxL7nGALRXSV6KF0tQ/sB40IwrsnP
 c7AzEtJIiTRUL0U5UbCsRdo6orMOu9eFGxhYs2tbjSrACcXNlEOjzLGLn3b8cxWqCRnlKL/3Ug
 Biz9xWJpy/gDnzBOfaAAAAA==
X-Change-ID: 20250102-lifetime-fix-ccdb8562a2de
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735803680; l=919;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=ftJrcLq1EhRqiB3l4lmiEC57gsaZTuSKQ2hcHXHLxY0=;
 b=1assrd0eyX44XiaLjpGf6amJvHrJH9eaX3fwur0kOQ3beeKGqNM2RaYiAgCvNhczFTmYzUH7U
 s2EtfC5ZDjJAcDc4DUfkpuMQz8mguTRgKK6IYdntjigSjpxZdPGEqjV
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

Triggered by the discussion at:
https://lore.kernel.org/r/CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com/

I also found some clippy warnings that I fixed while having the editor
open.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (3):
      bindings: rust: libgpiod: make read_edge_events lifetimes more explicit
      bindings: rust: libgpiod: turn standalone doc comment into normal comment
      bindings: rust: libpgiod: fix clippy::empty_line_after_doc_comments lint

 bindings/rust/libgpiod/src/event_buffer.rs | 1 -
 bindings/rust/libgpiod/src/lib.rs          | 2 +-
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 38adbae195555fae2b9d9e2a37c9507af1114757
change-id: 20250102-lifetime-fix-ccdb8562a2de

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


