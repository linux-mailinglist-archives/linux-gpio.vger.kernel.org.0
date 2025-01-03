Return-Path: <linux-gpio+bounces-14469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43444A00AF3
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA7E163BAD
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A8C1FAC53;
	Fri,  3 Jan 2025 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUaG8qEs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A921FA84A
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916432; cv=none; b=P918DuGHcJkEBjbQ1+sdGMxbVz0esMKPClgJIFM/CPdWzdR52iCNroK3BkjeOptf5EZiVTgRSAOfgEvo025QxVn83VHetibSh2C+FA2/IV6C4lUJYmXvZt0lNUjKbPryvGOyx3KB+InBFxsHXkyrUtpcW5Zg61v3bdM5poQOb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916432; c=relaxed/simple;
	bh=2JymfpoKqp+c2wds+hp02vZpCGk5gpgLPL2KOVTUOuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0eympfRpv4FGPuShRjxgPu3ZeOjhb2kTCIbKpwwtswrDSpBOhoYGXz/mFPr3Cu3lV9aYgSXJ7vdLm4ko85BlVVvmhlUfZf4GtRZpztoyox/geCtkJh0aB5GtYvoFDwSWYq1d/0sX38kluyX4bX0EmQFAkRuPvMWlnMvVAyV0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUaG8qEs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa692211331so2340043666b.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916428; x=1736521228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ud84eO3iSq+n8VAOejOtiaI9VC3ivaNR5ZmO2m6Dw8=;
        b=UUaG8qEsfEBZRdUha4oocilaav9wz3QP4PeCXSkIThaoZs9HjmxwQCUorh90Ck1119
         wByi+gX51WzMomLL5uH6HucM/nXIs6gmEGmBn3LvLraMRIynJ7aIgBRmrZuV6Pdius74
         a3dEflCWhVSW/qpYuUxugU3EK6U2j/XJrO0KSQsDO/qTao4dRNvWrCfoeJuKBE5emNnV
         rhERREniYNEso3QBC0LZUVmIWrkahmODoOz+BeKKqRveRGKsKnZ+RK4PP/uBdIjQJQos
         TaNbtJL/hytFF+nIBqFf0o5TNPtnMiDpQfxjXFhg0/CiN4x2cZyMRNm/oc6LpuN+/0kC
         pQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916428; x=1736521228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ud84eO3iSq+n8VAOejOtiaI9VC3ivaNR5ZmO2m6Dw8=;
        b=emNMqTkDTtqbPHH5i6tiwZFpiSqCeiPjvn+UO9uDZXI1elm69wgF0XHTjSu0kR8edf
         GRRCFlzdUo8eTObUobSm1iw5Bd9I87QZp3wT3TD6EgivovNFN1iq42as9S3rihu/seNU
         lmscwPxLzLmbFF7CP7ArzWEYCyRkKB58JhYg4aNcYSbmM+nzMip0ys6tnJLVXodFTRCX
         A2k5QMRzxJ0npV4GanQa9BV115Quq67IIrBOban0ny5eUwxxyvsTdE30XLCMqlY6Mypn
         //kf4piyJ+rFmy284+LZGt8vqiqBd0m4+9Y/gt6MSBryUDnnp4kHaQnwhrvIBXqoYVwI
         y8ng==
X-Gm-Message-State: AOJu0YxhgxrwwqlR5024j+ZIICIG2CDcvefeZr0yNz5LLTUncHtDdFNY
	EQHrfo6H8IMNzqhhoptmIVHdf3jUXXxXJxii+TgDf5sGbh4qRPUqOzC0lsHj6Ec=
X-Gm-Gg: ASbGncubZ2vB5hmXLK7C8gJqQOMJCKg2hQKDfjm3lLPXg7AnqRU8i2V9/OnaBkxdw2r
	1BbTCT4m4xvZVF18ovacDskzOyevz8Ltlvr5HV8QmcyNVB42hro5G67Sm78w3HvA2/dc5yvWRHV
	SAQns6ZVCHwuwGfYfBIv8yP9akk+xt11ALcJroH8Pq4e+ywceBK7JZ8llNEnJcpNkRLa2Ffwo+S
	f9UHnRe5e1B1q1eiX0dAy6t+CgVTyuN7giBREbvGl/jScPA8LU=
X-Google-Smtp-Source: AGHT+IG38xqeB5iNkS2xieMcy4oz7HaBoGvStyd4yL5c6/CX/ZTs21W0GGh0h2TnsnRF9mfMKBE4Fw==
X-Received: by 2002:a17:907:3faa:b0:aa6:9540:570f with SMTP id a640c23a62f3a-aac081579eemr5186965566b.18.1735916428049;
        Fri, 03 Jan 2025 07:00:28 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d5a1:be00::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm693078166b.137.2025.01.03.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:00:27 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Fri, 03 Jan 2025 16:00:15 +0100
Subject: [PATCH libgpiod v2 1/3] bindings: rust: libgpiod: make
 read_edge_events lifetimes more explicit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-lifetime-fix-v2-1-63902dc8cae1@linaro.org>
References: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
In-Reply-To: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735916426; l=1984;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=2JymfpoKqp+c2wds+hp02vZpCGk5gpgLPL2KOVTUOuQ=;
 b=ss/yUE7Lzdxwk/amUqPe7dtq+xeEbc2fZjdU8uV7w3jni+kDw378GbTX8jtxMyJwkfzb6rYa7
 ueRuq6eBFw8CNlPA0V7GXhiAnlPGQdIqrzig50p7T73xO8+/YPiCjZP
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

Newer rustc versions warn on elided named lifetimes. In thise case, it
actually revealed a misleading function signature.

The function defined &self with 'a. But there is no dependency on the
Request reference that extends longer than this function call. Yet,
the code expresses such a dependency and abuses it to force the buffer
argument to match &self lifetime (and thus the return lifetime too!).

Instead we want to explicitly break up the tie to the &self and tie it
to the buffer instead.

The 'a on &self caused a 'a on the return. With that being removed we
would get an automatic '0. So we are now forced to add the 'a on the
return that also fixes the compiler warning.

Reported-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Co-authored-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com/
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 7ec65085780e19499e08817e562ff0f9c004a6ee..d7b62a1a083ff589aaa4fa3edb1b1269e7aafaf5 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -225,17 +225,17 @@ impl Request {
         }
     }
 
     /// Get a number of edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
     pub fn read_edge_events<'a>(
-        &'a self,
+        &self,
         buffer: &'a mut request::Buffer,
-    ) -> Result<request::Events> {
+    ) -> Result<request::Events<'a>> {
         buffer.read_edge_events(self)
     }
 }
 
 impl AsRawFd for Request {
     /// Get the file descriptor associated with the line request.
     fn as_raw_fd(&self) -> i32 {

-- 
2.47.1


