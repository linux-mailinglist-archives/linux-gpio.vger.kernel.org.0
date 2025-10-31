Return-Path: <linux-gpio+bounces-27894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC794C24BF2
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 12:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F393B8841
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981C63446C4;
	Fri, 31 Oct 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bd9a0jEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CB32AACC
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909403; cv=none; b=M3GR3j4oJVhSKTqC56IVvxlBdYK/LFU9aqNCi4lr89wUNXjDFsPuKEHQpKQvBQr6+gbUIeybmJwcL383+L6okILGuyXvKNCR0TifiOD9RKVa/yRNFNu1bbLm164lDcWBHszvzrc+gco4xAE0Wr30Ev4L7u44LldD9iX6+oKCAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909403; c=relaxed/simple;
	bh=qN38CT0TF/fW3+PzwztgKsAVnz0QCmJ5fxwPvyCFM5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxVKzvc7Lm7LJ7SLN7si92Fliosxh/uwpS7fmjSfjf/+CyK26B+LVtFMkJlAPvsBxFieRnny2InPqfeR7No/L9RDXQ+iDOG/pVrAn3WAZrhPg8LulOJzkPtTQ9k7E9rmBfAK70aKWXHpWnBkSey//TsqVNqC9nLWTDGpjCaatUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bd9a0jEP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711b95226dso26632405e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761909400; x=1762514200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xycop7wbord5TE45Na8jt3nX8C+21DdnTnC7CBQYq24=;
        b=bd9a0jEP8Bsy94WP0mnaUq0M2v4NCcFE0Dv0KzFARcrvCN1kAmtVzb+p5wiw9zuTkl
         gu7EjABrOry3xlrb8r/Q+M+KePRO9W1t0KADJQFMe8aa/y4Dw4747ckjHFmo/MU1aZPR
         oziHkvSGcyW59F/3EDo+EHw6QobpVOqmXYJ2aoQG5ydqNx9p/WPep/RQ4qvgrLKwxzGd
         1/etetOum1i9Vrz5ZcbduqHppvbG1FyGpremZrUw09zi7u8MWrwR9rTqTbdLTTmPPZPd
         HMoTICIPaP307fWj6wSF7Lpg1jroi05i0RIgBBz1u6AS/BqHK6FXchXc9Yh1GAOd3Ztb
         6WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909400; x=1762514200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xycop7wbord5TE45Na8jt3nX8C+21DdnTnC7CBQYq24=;
        b=qZs/uRIoz/NFvimmBLOoGbwPK/VWZ3IvcCd8dVaFZr7Mu4l/+j6QK6RBikvb7U8zVV
         jCK/npUib83qOSdSYkmR6G5F1nzB1u5DK3LQxlHCLDjcFjnnw3AJwzEaMbajfvpj2f1O
         z/6OkZD50sSoPYIBIFB4IyVJNvkGeyy4VX/yo2U+7PWEAJLhRvlswCaeGpt/7Wp95/rm
         JiBq23t6DnQt/WmpA+jYwKHOdbO/VRoQwS42ywYXYuXS73PQukzG/jvwjDLUi+RTCyQZ
         64QFZghdIF59n9ppqrVfLnDk/7lEQ9ahdbO/Kf+4tnE2EMLHSP4gYlcOQx+/b29oCQw1
         g9Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXK60ghw+GZN4zFHDY/2Z2oluxfPNcAKIMh8oUjibv85ehjbyYquewgihQ75sIu0D/y3fG18OMtGmZN@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIa+/Squs10fFXUKi20g/WI1Ia9tFTcqPaf4bVk4qM8q+umX+
	wv0xKFZPhrBroFUPOGkKmFP7IdfnlICtVfTx6/JPmpZ8y6laFK9+/AodTLAcbcrCWGE=
X-Gm-Gg: ASbGncuF8gMRCsFKa/nIex+Li4qfd04ra18dNkVCjN5+1r0XpkvI3BcMwfybdGxZv29
	IyMzoJErkYe8cBqrtFNQ9z9OkbskJJAMt9d67Q6/XAQUH4XuQGGJRwR9tNPzzfCMRbMvQN9cAPT
	XSN9S1O73VFyrsanwbg+DKcSa7NqphjFwZjsGTegoewmG+dZaXCJAEOBzs24sLuTKhQTNlFRMPR
	zlv1E5eC5jpURFUyWcG8lisZbQypu+6NQuykw8NTk31yAc8lus4XUZTeVN4Tvx4V1O6jd12GRia
	QrGUpjXHjQn5rcFRL8OET+W9wb4O6kDIQWNKYXQKb8bMPlnif5q/1sajcMyjP2kd2VL1difmTTh
	aoQ809J6OnxGyOuTh3QMPI00bNE8zUikXgLMqCk7Ed8tLFjposokAE6jY5yLpM3bTY3CZvna5iA
	I8HcMpMRu3h1KOMV0VkY8hhAkkePCix01S5Lk=
X-Google-Smtp-Source: AGHT+IHwiiVmhpr3cXk2m6ooZOwHikOG8TzNlWLPGfZ7k5nDMwXDj7hi28vLxatiJoSm+MxMyjxS+Q==
X-Received: by 2002:a05:600c:34c8:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-477346a92d2mr16118405e9.35.1761909399717;
        Fri, 31 Oct 2025 04:16:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ddd2d5sm27222865e9.7.2025.10.31.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:16:39 -0700 (PDT)
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
Subject: [PATCH 1/1] gpio: cdev: replace use of system_wq with system_percpu_wq
Date: Fri, 31 Oct 2025 12:16:28 +0100
Message-ID: <20251031111628.143924-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031111628.143924-1-marco.crivellari@suse.com>
References: <20251031111628.143924-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpio/gpiolib-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 175836467f21..602ba46befeb 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -700,7 +700,7 @@ static enum hte_return process_hw_ts(struct hte_ts_data *ts, void *p)
 	if (READ_ONCE(line->sw_debounced)) {
 		line->total_discard_seq++;
 		line->last_seqno = ts->seq;
-		mod_delayed_work(system_wq, &line->work,
+		mod_delayed_work(system_percpu_wq, &line->work,
 		  usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 	} else {
 		if (unlikely(ts->seq < line->line_seqno))
@@ -841,7 +841,7 @@ static irqreturn_t debounce_irq_handler(int irq, void *p)
 {
 	struct line *line = p;
 
-	mod_delayed_work(system_wq, &line->work,
+	mod_delayed_work(system_percpu_wq, &line->work,
 		usecs_to_jiffies(READ_ONCE(line->desc->debounce_period_us)));
 
 	return IRQ_HANDLED;
-- 
2.51.0


