Return-Path: <linux-gpio+bounces-14396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563C9FF6A1
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE92188236D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019B21922EF;
	Thu,  2 Jan 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8y70u7P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0D1917F0
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803686; cv=none; b=Lf60vELAYyMFvuoSLi0YHpplQT+4YgscIk38sXVm/UcBvek3JWUrWc2PXSIep+4sjcj6d+w4bi/59PB39b7bceq/Yj/pfXsdCmGJLaQFxe9Sd6Z2JrcHQt89EWMfodibD3mpmnyRWkXm1VNSDfxaCiSCd8GW/rTODbbm64AH8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803686; c=relaxed/simple;
	bh=4eOaZFhlDp9Q/EAj0LTZ+Gmn1QmTGOaD/Z2dtoLzLq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVWuVHkj45nFW0ZRQ/7I3yLJrUikTb8LChv7tWAYG2sRsmQOpN5vTG3aDsSqXly2yBHUGAgDZh+a0aXz0/WSI+5ywxc3SOWzH3M7jZsx2EamhHaBweqZ40c56nN6hFpzBQhvmVIZEIXEefabyMvs/xto1dt21nUb7zIeSEEnkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8y70u7P; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so20169410a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2025 23:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735803683; x=1736408483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRQefCaMtOPhhjPhniVteV7TmU7Li02u/TJkAWZ/RWA=;
        b=I8y70u7Pww0j/dIZ3tXqTNacRgiE0BIsXsbKtIGFQxiaukNmF7Ff/0cqWPRVJdMlNB
         IN3HMgfjIddUT6YveE0yg1M8CrEBzpwtEvp9DWBkZVf9ne0pH0c85RM18aNkuD4nThIu
         j4CNZd1JA+WlgPlGQO706hdM+BSQ5Xetfvj8/4ACFF/Rn1V778YKep4hU7+H3xCUIR5f
         mWWs3L7OQ2+SwQUjTBpwXCv2dC7OinYh5cmweqj0O3r2a8Zz3j0TahpTL2/bGQ9b/E7q
         NYy750MZPpqzHDzqAY4iaYwTMFA+L9+xewiu3YJAoZzlOtqSkxt5HeQfl3a60eyszsj7
         rSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735803683; x=1736408483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRQefCaMtOPhhjPhniVteV7TmU7Li02u/TJkAWZ/RWA=;
        b=YsH38bZvs5bcrFRtIqTAinkv0NE2p+ugQELoODXz6vxBw7EF1ag+b1MprNqudcTReK
         Ysjhrz5qG1XVeIVSzBuBmnvBlMZTQC1fFPvxlaITlERloCM6xa5G68O5SRf8doSo9F7e
         +hDGTK2A3Xm6EDk+Xu1tds2YtuuX0PFn8lBxk/b6n3B8cYSOsWBpOpGaqgyD/dM/7+QL
         efbIY5flqzogWqRIm63CZURZsB/hWIqe2Xp597aCqF0fwbqwZFqtjWxyaJLb4wdsobsv
         mMbD0n1qXX4AWRGAl0Dhu8TLneP2ClMH5luv0xuYQC+5S4wI6L2bBc0xU+tD1w8OEp0C
         0tlA==
X-Gm-Message-State: AOJu0YwHIdHNi2bTCU/WBzQpBVjYI3Gbj3FZN2O00FIFumRj6VM68jGW
	E7QwtZ0jayNP3Cww3sk2xvBsW+0NwzDoqdtv+IlHxtDGK6KAVmAIRayAQyI1tlmm9eyB55MmU/j
	h
X-Gm-Gg: ASbGncvyTGx8r/qfp0dYKfVsAiB+Kzn28WUncBt4+FeTSlCV++GlXVFK3xpJ1yUXmHN
	bdPe4L9pU3KKnPk4cReCffDm25fmtrjNTvRqBJN2j3I0y4TT4Ow7HKOH0gNqf3MaoibkXuNbdac
	eQg1lh1Bdi3IeKNgR7WXvhCc4XZyy3fxfUNMyecNEICOpbWdniIxAuAJCjhK7DkP6Qf2U+wo7UN
	3xcpEo5HrY8m7csEJRwAyt075YuJ4cPsVxvVw1cbl8/Pel4mM8=
X-Google-Smtp-Source: AGHT+IF6R3YvdyYDbS7/Js1qfHL4NunfO9ST8cN6FSYduF72rd6VleamNu0KoGe+rR2URE+F3nS8RQ==
X-Received: by 2002:a05:6402:210a:b0:5d3:d8b9:674d with SMTP id 4fb4d7f45d1cf-5d81dc79b24mr38516428a12.0.1735803683024;
        Wed, 01 Jan 2025 23:41:23 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d593:2300::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b2absm17785949a12.81.2025.01.01.23.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 23:41:22 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Thu, 02 Jan 2025 08:40:51 +0100
Subject: [PATCH libgpiod 1/3] bindings: rust: libgpiod: make
 read_edge_events lifetimes more explicit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-lifetime-fix-v1-1-313a6bc806c4@linaro.org>
References: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
In-Reply-To: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735803680; l=1925;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=4eOaZFhlDp9Q/EAj0LTZ+Gmn1QmTGOaD/Z2dtoLzLq0=;
 b=ju2Xu5lMvtCHL8xkd9/cKQ5mjdoEuh3x5g+utKd4YMeMMuUaem7TfKkaLbhUBg8Ce5+bxLWKo
 ElwqGVDgOI/BkHU7vL0FtpESIwuQVXp6owExzfjGEeNWUKL/vbO85sC
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


