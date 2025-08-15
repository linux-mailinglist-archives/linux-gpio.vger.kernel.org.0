Return-Path: <linux-gpio+bounces-24415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D50BB27C29
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50761BC504D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3942D3EF4;
	Fri, 15 Aug 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hiFjAKJZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A428399
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248289; cv=none; b=U1ruOtctnBAdkNDbwk+2g2aIAd4JuLW4PziDNNEDu08thkXlKy5PaSSLs9u9YjNAjIFELuI2ifwvG7T3tJqNJz98akRZpnnmb9T1/I9G6MhC6yF5+4A8L4qzBE9TrCDdM2mGSb9O2VfPC4LjlKKd5oS5Apta15pe0/9Mt1jvoOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248289; c=relaxed/simple;
	bh=RI0d6IwLf0K1S3H765wzEY72jmz6eoLuCyan/89wx8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lipyHQdAY2oH3dCl/rRwWXQ6bc+sFsWfCpP3zSa7S0Kok5K87+GfQda80TAW3hMnA2L1FDAug1Nfk9S3yDwVuLoeAVwg5RDgeRFotuOYfreqi41rVhV964pJvQxNJ/CvbHilUZn4osfmHOl/5KI7eE/UqlN6K76havYKpIPBjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hiFjAKJZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso9462735e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248285; x=1755853085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EFl5LgD+5530+X/F6EOW75NKwnPAHb1SCX8k05Ddrc=;
        b=hiFjAKJZWtA2qB4mPwNIo4QiXd5uj4tJr5DrftjiVtjQBYes61slVjEkdFiSPaioWD
         +6vxvXM7T6WhV+7bL6ll++G5dVON6bkI2lJZoaYSiZhe0DVDMn5eW2Qlt2K2Ra+ZJPYv
         TOtsvjb085X/JhW2bJi+fGk2m8nU9mJCWtaX+a3n4Hl94OEaK+gAQSwA5hIYETghU72g
         fj2PvRViqj3iaZauQoGMex84xprTh0TjqDmOTC3xesHDzvObUx0LI39UZ/4YZf7sMm7W
         Zl9sciQfWZvdzA8PAP9s35OTSqo9R9UmcSMbDe50BfgototgZ+oJy+8cQIazrOMYpUuI
         jchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248285; x=1755853085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EFl5LgD+5530+X/F6EOW75NKwnPAHb1SCX8k05Ddrc=;
        b=icqODIWsGVwE3tTqr4YqQ75KM6h6CBR8vhjUQLS45aZJb5sHMj/BanyzQywQm8yZsH
         suo5sgHw2mjBbnah7cULu5al4V1vl/9raomnU2QKkO2lGou3XK/1WEPflR0bDb0kzJme
         Mv4UfQoBfgxNAhX8rfqTvrXDWN1QI8DbfCJPcihO5CsDWRvjfzagRzXcGSJULAzLqnXc
         mo8mej3G7WzTloS2uPh4n/BXXWIPy1FBFDvovUQ1CPhH5yYioaT6JFbvLjoFZX0xSIlT
         rJyz5evWJRgr/0giZTT7hzv7Ia5gVRkMTe6Z8FCSTuqfqC2l1jg5VB6aBmc36Uc5oTXp
         tdZA==
X-Gm-Message-State: AOJu0YznU6I9r+ILqpEgjXd3BhLdV0d0plHkCsmkTWhBVniVmIcLZepd
	n4S2cgZ8YRWRycYARO8R1Tl3P/jdOfblrLSl0HLMsvw1S9LPXk8L8XRuHJc3lCduFP9Xyh5ov5Y
	Nw4ot
X-Gm-Gg: ASbGncshhzTa0fkHbuRwBWjbkvo19aqraMvK47veTYu//uS+3vUPH6J9eglIaF1gHWm
	1Adh49Fj1h13J91qlqRy3ug3ntSY6/U5xcacei9md3B+Mi0kr3AUjP1e8nnykqWuuSDgyr3z9wP
	UvVisq3teIXzRQi7plaB3uOQGBxqaZOerVwqqqrVtK+Xe9m/hjqqOLxVN+qYG0EucbY5esJ+HNp
	wIQZw3oc78Mmd99Gq11Hwt7v6KVL/0egWOsgoz7cZw3bsiucZCTXWcmbl2A3uSXyuRPuljwCsI3
	35mX0LOsZyywu+SsG9/GXSbAuiafoZTtQsdzlbPqzUjke1BcDin+WNADIUgFY9qDcr96O8dNQ7I
	wldtGU+JV0TaomGbUxw==
X-Google-Smtp-Source: AGHT+IHZ6M7nBwuIqxYnpiguttmYHSgQPw8ZoawNOfuKLnTW+BagtrBYab+CES4X2Fggxwyr+xQC4A==
X-Received: by 2002:a05:6000:400a:b0:3a6:d95e:f38c with SMTP id ffacd0b85a97d-3bb68a17232mr833390f8f.33.1755248285335;
        Fri, 15 Aug 2025 01:58:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:55 +0200
Subject: [PATCH libgpiod v2 7/9] bindings: rust: update thiserror
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-7-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VQftYkkCOE1cG5D20Z11VTKqicu3DwuAuAviUzCYvmQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaVt0QQfzRLhPAFqtsttZFzLcXQAn+neR9D9
 KTNUeZeVxyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lQAKCRARpy6gFHHX
 covqD/9LA0R5hV6Q5H0zkdhz4rz5yXyk4kyed9gtsIkWBMPpF0mWQniFeQ7xbLlnronLyCLyJbz
 2vBOaD+1Uqj8Uly5GFsgyRUgi2QqxbN7MswBVsDB1ssx1ihtcdfc6ckDW/7kG2/6WbOlTAKOJy7
 ExJWGvow1TRSMSkAPxq1tXwzyZc1P/yX5eS5vN4rYWzUUNgsVTjUIJA6z0bOclwZI2heoo9Yc7o
 rGpEgLvYUY1kZE2n8YFNS8WdXZMa09Y3CYzKIfmMzAYSE0D2Pe4BCC6PDMoASw1FFl2tp8chfsa
 +cm6Nl9c8iBA1tQ1Vef9UNzLAxVsUBuafr/FfENCYkPj2JWPP7/xqedi0ktB/9TqIz8ERFMm+Td
 15FAdgHD1b5OUfBLbFWo9rhLTjnMKiOK1dz4z4yMEaLdV+Q+520C2E8QiGgR5bybEfMkHn5AuaU
 GW3BhXBw5llU3M2AekGHgVvEEC4iMlYL6Rl/3oJHagrRK4rS0KMJFdYFamsoEeNt7c8r2TF7eeX
 xBvhC+PUCQTbMDMBtzFHjZygL8X/0BaaujvIkYjh3GVcor2r/ow05+3oQltS7Rgd4FKOEt19nMF
 xrymhvtyU1EN02lN1amTV1V/Wmnl3daKVXprBUe5ge5QYEQTI9TQz3cI66lAachbbCPBsJUoFQt
 FhUrc7nXITvyBGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the thiserror dependency for libgpiod to the most recent major
version. No code changes required. No longer require a specific minor
version.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 81478209f6746ff0e8d9d311614e8fb218ed6a3e..e26e893b0250a79077a46ced38012367c78fa5c5 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -27,7 +27,7 @@ errno = "0.3"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
-thiserror = "1.0"
+thiserror = "2"
 
 [dev-dependencies]
 gpiosim-sys = { path = "../gpiosim-sys" }

-- 
2.48.1


