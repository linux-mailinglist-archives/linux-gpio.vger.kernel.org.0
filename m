Return-Path: <linux-gpio+bounces-24276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC5EB2265C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F1B1B62564
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722DB2EF650;
	Tue, 12 Aug 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eGlK2LdY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C42ECD2A
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000650; cv=none; b=FsX7FwbcAtQAZIGkc2Bp6d366BpheKWdr9ayyzztBpmQcZRzp0fFJ0T+q93fiMrlIoZ1TpRcRC1d0f++/csoFzNd4yDwyC/oadmXpepyD54xT/14t3+NN1wVseGFwW4adrSmOVt7bnxo7YPHLF7m7r1Vv9awZwQRPXCymi3tJIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000650; c=relaxed/simple;
	bh=DJRTzLM6ShWCzqmnJKZLKB2edv7osZy/STfHCv34PCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpFCd57WRy1PAComqCbvF4qK1u8CshLID1/pXE6uFWaZdKM8AJ65wa7X6d/I1r5WO+m4nq+74/bVrwseoBITgiAqH531znKYMzP/fZRN6OEdouLMY5pMeyYi2w2eEBNkaHJhCvNeIWzHKdxzd8j5t+DPKf3YBRURqXOKCvPJd0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eGlK2LdY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b913c82d96so145132f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000647; x=1755605447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0wNcAMmkXImuguTRtrwlqwuyii/4VpuIOpadTynavY=;
        b=eGlK2LdYTyWWmpI3vdLjv0yUXJ5L+rIVLhftY20uOt6bFzbzTUqNxK1QaYiJOaRoMh
         4RBOtBKt46zv+J+molhl9Q6matu9FTp7NSOAGXrTqRu6dHUVaWUl7yPu1JGlNSGdHIOf
         /kPRb0QJaECa3Xyc3Kse1kJHsWDAb2BWhv518DF0uKxPJtyNE5iQXOwwOV5aD0BPj1/t
         vMIjizQtndKub/Ff6MqqxNtK2z/1Po/rrQHgneTSXaKuY3NcqI0/pNnnnlwtT9nGCGv4
         dQeSHFWNx+NK0w3qN0bfQaFHSE8ki+kgp03oGiG3Pnd97GLF5pJed6JndLT+3A+vDZ2C
         f4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000647; x=1755605447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0wNcAMmkXImuguTRtrwlqwuyii/4VpuIOpadTynavY=;
        b=jtDeCxBjwPOSyS+OYDYTGhS1a8b2hkKURjy0Mii1XSJXRmQdCX2zGihwXF+RM4EFAr
         bxUIP55EYgdadRSPmKkD+N8hz5JDu7R7uAE9ke7xDPRO6jSM8lPWWSmGH2Debrb0NS7f
         Ra4eqlJkOWw+iy+F7yxclacWWEnWnGZyXE14WJr0TRIQDpGr5EdOnftlzDA5lMmgavju
         AOaIq/yLvq9f4GYZ/PhdwkNqtXEXyjkppXgiQ+AmnIRfYwq6zXBIw7+7IMx+O+t+bw+W
         7VKZz/5+8FVHzhFbp9wjGTtGr1oImzUPwUOqj5/Aq8h3cj1kQ7mRuzpfOe7RnUVvkvbW
         Tt4Q==
X-Gm-Message-State: AOJu0YyTQ5ZBIRigArFfGJtBrqd+nSEXzlvH/jwUESbecINF5Ev4fKBf
	RB4RYmGfydiTKreTUXtOvjRxHk3nEIOXoXZBojPaTR0FStgIEoJCakacKaeXSpJgcPA=
X-Gm-Gg: ASbGncvA8MU9YLyQvk5jp+PckntXzDRHVEtt6wR3LrZrWGvB3XkwXEYFwBGum+DzKVm
	V4nl+j2zFQ/WGrIT8exE++M0vc1Td80cqSFhmUEdb5A7vC9FjLIYacr8YmQhaBEoTu838JR8/Zs
	VQD5ywf//oqy5mFZe0WVWklhNOXBdevq0XHLUOWqD9F19F7WNhuaN1vTD43FzMCntQw8yJ13Bq4
	ipsE6CZvnmVyVl/l8D6B/hrklorSrMLpe2C3TRiPig8+V8TE3TzgDldwJ830G6Kle1EUn5BgmY2
	te0mp9oWHr09tVfCKxBpvwODZ6+aObROg2j+o0uBRndwL3pt/stPCAJj0d9R3ssSjj6eWRYaKTB
	GFkvwNztiLXw/wXU=
X-Google-Smtp-Source: AGHT+IGkE8Fzfz93ps7wumAudH+9IuvtbVuYG1qQi/pvXIi/Ge3g7zs5zaympmwtOc6HQja4nyQymg==
X-Received: by 2002:a05:6000:2484:b0:3b7:910d:8054 with SMTP id ffacd0b85a97d-3b911160e86mr2522231f8f.11.1755000646671;
        Tue, 12 Aug 2025 05:10:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:32 +0200
Subject: [PATCH libgpiod 02/10] bindings: rust: add missing unsafe block
 ahead of rust version bump
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-2-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PgzSt59a+NIwYAGE4xEBP4I3ozmPs2LZCtxn64rnZf4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9BDV3en+100YnWlZ5C3xengw4Cz675CP1iN
 kuVxcgTzDiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQQAKCRARpy6gFHHX
 csnEEADTx4sQ6LPGrGaBvdQ1ymtg4W7Zf6uhEDe6TdrMy1UZIiZu4g2Q45+5KJOrj3nGcroCZKD
 1YQqCAdCDVBwxUZbBYhKuGEF7lZcErzoEox/I9gNC4yz08rp3cGOyRIkDBSwSBhjEjhY1V0IqlR
 FL+XY2T0epl/QF93j+lEZyAm0htKJ7s8Gfxc7qPppifafPO3s/M+W5YydjBYhwS6BN5NhBijcg8
 wDf5TcBK4TrykdQw8f+n9CaX4UkhQy2TrgJGfx33TZlvtFMvqQTm3Vp2EM1U6DkJ62O2VJsALN0
 RY2cAxtiGOz7W9vCBSnqghfcjryttJepxOp37Vl+twfm467Hrqz6W75olb3bOI+T7XUwVNB0lSr
 gRmMMtMjnlAYoe/xpRHHXyti24COBmVemt+eNaZpvmE3j71b++typ9pP8LveVAeJJJKpCQ9M6kw
 ahP9z2gflIgsqlaZLJFGs9ZuQ2nLAp03zQpI6oy6tvxGNjwLXP2m1tznojYqaRGdiS5GF7da9WB
 0vsI5w8rldpd46zoxtC/Jw+TqTDiWKAmZ9a/lyiONJ1qQsjSotxwCSQOZvaCl3Ks8kSQR4S+O4A
 LBw6d+Jv+JFEe5sAkstXllzq7zUxeME2e0djkSIJTI6+j6hiyqzeuyPyDrzvrdWZ+Pr2yhsHoL2
 6+5YtpAzPC3vtLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Rust edition 2024 changed the semantics of the unsafe keyword used as
function modifier[1]. Unsafe operations inside unsafe functions must
still be wrapped in an unsafe {} block. Update the code ahead of the
rust version bump.

[1] https://rust-lang.github.io/rfcs/2585-unsafe-block-in-unsafe-fn.html

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_info.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index bd290f6e1369a3968a39178c5bcfb9f6aaf26239..8def1ab4e52962fffa6911976e64204c3d02df6f 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -51,7 +51,7 @@ impl InfoRef {
     /// owned by the thread invoking this method. The owning object may not be
     /// moved to another thread for the entire lifetime 'a.
     pub(crate) unsafe fn from_raw<'a>(info: *mut gpiod::gpiod_line_info) -> &'a InfoRef {
-        &*(info as *mut _)
+        unsafe { &*(info as *mut _) }
     }
 
     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {

-- 
2.48.1


