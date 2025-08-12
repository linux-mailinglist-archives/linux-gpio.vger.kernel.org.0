Return-Path: <linux-gpio+bounces-24275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7EB2265B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8A695604C9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEC72EF64C;
	Tue, 12 Aug 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MbAVjvBw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CD2C21D7
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000649; cv=none; b=DpJvoRtGCn4Qa3CIer3khXeG8xYcrNC2IPJV1V0SOI+2AlChtpKolWjlSXtVEKTR18OBv+76XBxECxxT4vLKMFhyHnetX80C+hPx8DrwBbHZkbHQ0ESTf9NHqssoBcTsktwkNJMFNvx0bhoj1cyGMxMH44oq6QZqqcqFwn/7rtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000649; c=relaxed/simple;
	bh=c+dQu+4u+FzxvwHjJtas6snK1S7MTg5Zy7AtD54CcK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbJTxpdoUY/UepDEeUVmXVPyrYGLrvM1FMwP7zMBa25CB2WlmDjqtyUV3OcYukZq8H8yWY0POFWV4KLZi0vnaCWH9IrLETy6QUxVdeXlyiMhSdfEPUILa6HtM9Gk6h53Q/I7V9q06b3EEJCQcU4a5RENyOT+D8/Z/Wnah5Piljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MbAVjvBw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b7892609a5so3137018f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000646; x=1755605446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1N2tlvvE0ffLQ49dFzoS8aDMoVfesm5kcS9zHDq/b0=;
        b=MbAVjvBwLd6+Qa/MZSuxW8PGxtjHcnogcJdICkZPxRTdRRyNE7j7sSGmyoyFZwWMAY
         waUOMU2NbSM5PtqmGW/hKq8oOTXIOJObd87l6r8JHqSUH+GIxLz+vC+90U14qAwPh1sp
         /2prvTGUmJudmQnpqNw2uIZFwctejGsqKP1kydQQMwOurEj8iBtGBgCMFaFBSMBvpMhD
         winSLeIx0qYVf4YaGFYXMf0WIMIDTEr/KDi9fPz6mm+RQzifEaQwF04KAlk3o/t88SGy
         QNBUeCothcKPMSlTPYzWZN16IxG+96YaeXrmwVlWSzwTfzE77vcRYzVGEgYbSw+lntSl
         2kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000646; x=1755605446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1N2tlvvE0ffLQ49dFzoS8aDMoVfesm5kcS9zHDq/b0=;
        b=cNYbxsJ91hI4y8qu13riwiPyxK2dy3jMQb0/8hGRWwBA6NWrv5x2epJ51/FPOk6IBG
         ZJlTv1lDZR04QEeDB4Yv7ypwBLUGsIPJOVc7Y6hJvYbiz4x7WP7nGd7z0inErszn1KMc
         RpMv5tI5G9ayZhSqPQnIEi610li+REcGEjgMf46Nnzbaw32tZ+1uV/U4GrTjSPA/q1Fq
         ae1G0IH2DBYZOg5msCO8eweIAKSCVn/j55Mlk0dA7Xc+HrCw4GLY5hUKR+IkAdMT3teU
         zsugxE9PkBwGIRyLmZmBmgKYw1nwkfsh1vvzWVb5JnXYge1uLbagHxcjr3eCmsQfj1x3
         uikg==
X-Gm-Message-State: AOJu0Ywi3aBM1JLkEJgFN9F2viFxcRFdcDSakpoB+XJVaaJvTHpD+GEc
	DWAKFQlHxV6Z/5ODrsS7sTqsbVkbLhsm1kyozoExpf6Iabt0ZIF6swFVkMJdKookdgI=
X-Gm-Gg: ASbGncu85mbi7QZ4iKI5pwAzEQBQiNYyIcJGI0hEN9l0P6K9GFfpN/f1OXygraeKW3v
	feAmuHQVKWw7wybNP2s8hgsQ3RGAAL1wEXzz57kZs/tYUWuEk3sWKWfOK4wj+dz8zhuU4z6JebW
	XgaItNKJKm+9DpPftVaDwyzfhwOLmxRUMFQsqGgaKSSiEDpmnyf3qcRGpj/UKNVQwxUL0Qfyd5b
	Q4mEJh0cT05XUey9tTQ2Y19w5jGajV9XDgViT7EMoKq2THdnVbTGMRkuglnNcbVLxCalQefcnNZ
	Uei3hQa3X3DBhoSUGqx33v37rQOUfWrE9HYi3OCeQO04Dxp582REHzS7wehmuIkib3K5PAiGoK7
	5SOkHeX8cyhIT0xo=
X-Google-Smtp-Source: AGHT+IFO/Lrb6E3oMQcVYCBf0ktHvpfXyCuAK47oSWh9s5slkgfw5Z81tgtcaHx9B5JgXk/Ka7+vKQ==
X-Received: by 2002:a05:6000:144d:b0:3b4:9b82:d432 with SMTP id ffacd0b85a97d-3b910f8cf54mr2913885f8f.0.1755000645881;
        Tue, 12 Aug 2025 05:10:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:31 +0200
Subject: [PATCH libgpiod 01/10] bindings: rust: make
 Buffer::read_edge_events() lifetimes more explicit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-1-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LrmlJk+qvKViU1KQ8aeaXY4KdlK4p3dwhiSHBCEHWN0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9BjkJk1MZJl2dfzANFaZETZYexUuQj6HomI
 wt65UfP42SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQQAKCRARpy6gFHHX
 cmlkD/43QdPVnF0sTOXUTYMi7byAQRRv+VjHZR7c2LFl0MeDyC1qUzI3hyRbjW8kCmdr35Mr92z
 5vrqe8OL92mXMqnt95E2yFpExSD4Fhh7eU35+6nBpcZC1aolJD4XWIKqfGaDPYK+yReWZmbF2IW
 3QyqjOI5V+wsqNgbCqJ2vku9blGwDE6ohDwUbUrnEzYejcCV6xr9FqYcWnHWPbPgx+zvQ3mwGUH
 BGtb33++3byWHPk8TAVjNrF0EMGXD44wFRG/8djNPC0EqbkLTb6aNnSug7KR4nsVWHw/9CnIQEN
 sE6eG4tFJWjoe39lBRB4ROpvKZhOaHFFCVIAAudZy6joR713vpNKvjpE5gSTWFba3dcnMHHcmnk
 WvvjYb2r9iWPAlK4aHEQCxtVzcMfhRbwVdXIEzcfovgX/70KDH7KtbXppOCrZJfQz2zzfVO468a
 Q4MjmntDaCNKWpRlPa5674TCP4b8DoXRDJQkxWQBs2oTI85weYPM+ukZCSFevX3s2mMCaBjxHC+
 PzZVn6Qxv7N1aIbYeRn2CAUF/jQbrGfejWQpERSUirmvdmBWFJYjPueOC9DznCjpSeGugw48Ja6
 cx/dXvtM4KCSHl4wVA+qoE27s80Yr7vUoFPvA3hFANIXdnU7jSTPylNtdLSjtMqDzfm+dOHYMDS
 r7YQVpzmmzWE5NQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix an issue pointed out by newer rustc version in the Buffer struct.
struct Events stores a reference to the buffer so tie the lifetime of the
latter to it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/event_buffer.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 13fa7ba2c8870e0a325e251c073d6d73bb8c4374..059de1adabb858ba211446b27312c60429c6cc07 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -108,7 +108,7 @@ impl Buffer {
     /// Get edge events from a line request.
     ///
     /// This function will block if no event was queued for the line.
-    pub fn read_edge_events(&mut self, request: &Request) -> Result<Events> {
+    pub fn read_edge_events<'a>(&'a mut self, request: &Request) -> Result<Events<'a>> {
         for i in 0..self.events.len() {
             self.events[i] = ptr::null_mut();
         }

-- 
2.48.1


