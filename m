Return-Path: <linux-gpio+bounces-27895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFEC24BEF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 12:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B30BF4F3DAF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9513446D6;
	Fri, 31 Oct 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NRLEGJ3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47332FD7B2
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909403; cv=none; b=JrktDvin2WwnZSj6gHiedjKSPM2c1SRMEXH42ZNErBpUQjPbzZKVCJx+Nv8p2Ge60121hxpjC96+ERupTmA7TJ0puh9KcupD0Aq7o8mgGUFMT50uOlsTi6Fy4FSFR3FTka+/NKN1kTHOyuvKSE1pqLuwGmAvDOGa6c9dpWqvn5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909403; c=relaxed/simple;
	bh=hvXhCt5hKzbIjsa/PT39QiXaG1nQxME6pJKHXGact5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hmC2ootYtYi8obTSP63eVMeajMWsQJK78BaKS4eS7z8lvBV4Mfpmppp+j4TZK8LZJYWRGrtCq+58NLZffJGO3sr1Fey6hpvJoKe+TrfQ/y/6Ex6FsLZOjCFDxcbOcFMyRPiMtluJwiqcKTWYUmxwxz0AVvIvuSu6gW1Tn+MESbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NRLEGJ3Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4283be7df63so1073284f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761909399; x=1762514199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNGbBtT900FkF2tZtdZOn6bYz+5hMfk+AhQrFTegUGg=;
        b=NRLEGJ3QUEVw+Hmm9MQOrqmQLQJW2ts86flMmqEaoF+CdEBg625SJGILsMXdCB3fA4
         A7E+ykvfOt/Obis2NCH8rZvrNP4QHDk4s2iag0goiTEtesB3kFEGHpxi73glqgaKzpsl
         2BLI9Bgc7JFbww2YGEr2qKaRIxRM+vOevxY09qBC9K7C8tB9OKj/78zPk1Y7EoCH3knY
         gUSTmap96urOwlXkhLubxbXHyCLyiIFn8EJSr2UMbKBV30cN5Uk5PJepbbpVFbcS249V
         Wu8A40Gr+WsR4us82ItSFNe0pyaWR/Fazlx9Ek0AZZZsZAc/Mszsn8hFYgnbQZ+BE59V
         sJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909399; x=1762514199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNGbBtT900FkF2tZtdZOn6bYz+5hMfk+AhQrFTegUGg=;
        b=i9RHS7APGCKuUIgPW9Hu5dKDVCprqLY3PwVUXus3a0LXJbM1wm7LWxlEytmvCYJxmR
         1gZPJC1asHmCO7BjxEcp7pYojB94uz0aT91F80KOAunxOVSLg6kSW499FCt6KP2KGIhD
         r3b8Cj4sHQPlSbWBQClg8XW5HE3n4VT+/VEkAa5nMxmcKzzukfjPrZxsLzbrdv3wPJyd
         3VncHsirVowqi6d4Jou75SKUvVyzUnydulaNenh41BTlOlfQgTdB30nYCVSvZio5pKcn
         72bk16I8Zo0xTSmrxXeJ5Kj/r+J/L/nyMKeWfWblmJuNo745EwSp4YZ4/DVF6gufyp0M
         ulpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN4+BaWAtL99I6c/LZHLBf8p4AfyWF7z4JtcYIoyIJzzAbVnu9qYNt8ZqWsgzHoJkewzVI0wQlgx+a@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqLKVsuZIQrpkEYEw7zQQ8jjbNN6YS21+poG8NATwSjgK13+4
	+lQgA06jq7dTuwCJCNdbK/E9tBY6tko8CMJUHmxMP27hBDTaTny5ZU9LWakW+tj6Jj8=
X-Gm-Gg: ASbGncvddN9lfZdNzWo2kRbhGLWISoQUL9P72qZWR9f5bqjAQsfzaqIBlh+OXM/+JIB
	hGucTJyMLj18pfsvKoSpZpLm/ymCvvnEOfwWElWKIv9hPfm9gZ7TbR14u1hCF8DmlpWyzV5C6ma
	a8hq/m6hCtLuuxFX49Dwp7bAGNXJvbIBFLCobvKcmCPYKfWOkD5V0R0AR39M1D/DRZchjN1PLuE
	ucZCsL4+blnIt+JJK121zbEU1aLI/Ps3k4muun4oOx0PzLcD0MGBYibNySixYcz1WeoxF2iboHC
	oyFdPH39HoEpVkt5u4hkT/UqgEiRFuuj1YzU/PkWflG0uVlBFzxXReyBte0HqT96JFPwE2gZLCd
	QSUr0p1w2hbtEtPn6KBM1oylh3wjIM5FKBY7n00o9CrW+VgnDT0qjRXOTBuISxWd8F45tiK3EaC
	j5t7vIYhjSIsc9s4K8/y2lJY1H
X-Google-Smtp-Source: AGHT+IETb1QusUUIdYAdoXN6g5wc6UGfEh4fZ+wlbN4HqWZwOTbEyATLIkgXIFhC+rbo0V7IXE8qbg==
X-Received: by 2002:a05:6000:4382:b0:429:bd09:e7b6 with SMTP id ffacd0b85a97d-429bd67245dmr2775419f8f.10.1761909398902;
        Fri, 31 Oct 2025 04:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ddd2d5sm27222865e9.7.2025.10.31.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:16:38 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/1] replace uses of system_wq with system_percpu_wq
Date: Fri, 31 Oct 2025 12:16:27 +0100
Message-ID: <20251031111628.143924-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    Because of that, system_wq has been replaced with system_percpu_wq,
    the old wq will remain for a few release cycle.

    The change keep the same old behavior.
	

Thanks!


Marco Crivellari (1):
  gpio: cdev: replace use of system_wq with system_percpu_wq

 drivers/gpio/gpiolib-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


