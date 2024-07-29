Return-Path: <linux-gpio+bounces-8434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD99393F366
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED38B1C21D6D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A81459F8;
	Mon, 29 Jul 2024 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJzH3oKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843461459FF
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250686; cv=none; b=sDHHwZcKsxzEscNgjPvWMyoolA53fTW3dH0K4zMScuRMKRiZ9mUtljzfCyaBCDTTTPVm0Y0swGxO09fvp7J6add7XpT780M2u8sZ3sQ3RqQYNZSt4OxbSdQpLJooO5oNTXms7j76DAHTuYgfpiLYEiL/rC+mVpgCOMXy4Y3jyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250686; c=relaxed/simple;
	bh=gLZCc9qmHpIT44P37m9AXhlucQrFVaG4bDCN0xZrXz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZr6PrTOaYXIMcXy2Pr8e0J3TRNc5DrVXUNexIzF6tz13PL5gHRQ0nhYluHZFRBmkGwmcXK4bQhIM3/IZzw5j9OIGu4Tfwk4ddtmCFGFunwbyLd9FyxRUrJgCn719wS0rqaQ6HeUKIhWMH8hF4lnEhUGgUjxmqXyRkYN1axDn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJzH3oKh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3684407b2deso1234500f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722250683; x=1722855483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzSkaTDDvcXr4BKUDmdj7inT81xDIhuVfnzMx226u64=;
        b=RJzH3oKhLB4fC7fJFUs+8Vx7a7FBgdsYN+I/L97CCZU/KMrDgD9Qq3jYE6bgpzjSkO
         yE+mNLZRU4o2CQvfhCFnyODkY4zqgKnz5z5wefKd31wLUDn5MWUNOmhJmaarlwaaa2qx
         ronIHhGsj6XrxLYbPbOrZuW1EUtOOTnN9mGgHg6es032yh5f7omMSWiTeckoj3PyhaLG
         4+C9oLLCpyzlLDfMvLu7HUelfmUUxCBzCDozeDxJiYabhGEV9+7HjVhj+AWQnyM7OXHI
         ToO0HtensGn6JYMxHA5vyThBqcfILTpsnSHPVW4QmncnKDesmCCQqBIgu88Sj78ySdj6
         odEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250683; x=1722855483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzSkaTDDvcXr4BKUDmdj7inT81xDIhuVfnzMx226u64=;
        b=bwvj2w/tY0Dsv7K6HRuiTdl49p5C9+sVuDz3Cv32SLCa3FLbq7ToNqV3CeRC7PnFXV
         3MDDbyqmvEmyo6WBCXjqhxkecK0fO/7BrE50soOYRfyR5ynQoVNedHRnFbPI5DZWrtQu
         3eSoZjbLvJ+Gk4w1Nmbfcx7ZEt7KJP1H0IU/XnFA3Mx2FRdL3Vp1sJMKiS0PyUiAYL2o
         kQQdrCQBDY/jMHO/m3eUR80Z35ZQ+kbbmGT01wXRKs/Eia5Q8dYb7oM0xnJjpyR5oFOn
         i6xE4Ld06I7o/FIbQ8PGbO31o8c9qgXgooTyhcAu6IC8ZxWSaTy2s3ZJB5n84jzlRIAH
         jSUg==
X-Forwarded-Encrypted: i=1; AJvYcCUAE53Tp3M+/2aQq7DebmQHrfLkTQh/ZlUBH2weJ+LeOVbMGY+jQuxGqXmzgTF34CEUrGdRd0RqVTC6qe6ptJR4VAIeDwb0q0ry2w==
X-Gm-Message-State: AOJu0YyYi9o+8Hfs97XlQ7NBs5vAbnFcUB3xJNp+p55GgFi91S2EZ1ai
	EAGR6JcrA8Li7gWmdITIUZyBAeYcXUcnBmyRleXcjBw6v/5ifmGW
X-Google-Smtp-Source: AGHT+IEdNDsRxucgXVeuLNZCnsJOTlABS7GVKRMfriJ7KhLTwfYejjgaII0duB9C3JOfOtb9dY2kKg==
X-Received: by 2002:adf:e40b:0:b0:368:36e6:b248 with SMTP id ffacd0b85a97d-36b5cee250fmr4946168f8f.23.1722250682806;
        Mon, 29 Jul 2024 03:58:02 -0700 (PDT)
Received: from fedora.redhat.com ([67.218.243.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm11858068f8f.59.2024.07.29.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:58:02 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH libgpiod v2 3/4] lib: chip-info strings termination
Date: Mon, 29 Jul 2024 12:57:18 +0200
Message-ID: <1d7cf79edf75ef77baa56091852be90e2359e572.1722250385.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722250385.git.ikerpedrosam@gmail.com>
References: <cover.1722250385.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() truncates the destination buffer if it isn't large enough to
hold the copy. Thus, let's increase the size of the destination strings
to add the NULL character at the end.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 lib/chip-info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 87fd9e7..478cd62 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -10,8 +10,8 @@
 
 struct gpiod_chip_info {
 	size_t num_lines;
-	char name[32];
-	char label[32];
+	char name[GPIO_MAX_NAME_SIZE+1];
+	char label[GPIO_MAX_NAME_SIZE+1];
 };
 
 GPIOD_API void gpiod_chip_info_free(struct gpiod_chip_info *info)
-- 
2.45.2


