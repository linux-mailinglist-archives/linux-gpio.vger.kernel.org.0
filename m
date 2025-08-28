Return-Path: <linux-gpio+bounces-25135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F0B3A882
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2C847AAE73
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8ED5338F51;
	Thu, 28 Aug 2025 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bolvkggS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984563090D1
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402995; cv=none; b=Z0jiQ9OWrY1TJy744HTHqS6KpPeBIdWyWvlBQ2Yb7zdpkqWzuE5830Jiy7gUhqzM4dsBVh4zjeeM8w/wV/VJp4tDpUCnzhcAHsTmcb4i/GzWFimCkT8/08Ym4llr827I+vniv3QqlvcgayNC7p/3Njz1B2aIInASuWt8eK1IEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402995; c=relaxed/simple;
	bh=EymFRGV3z8lDqRN0W8qvfaIcRUki7ER9EnhcS67LgIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyQOtDO/fFTA0KWN5qxt1NU3P/w/PuVeKYl4kUhigUVzWLBC+7DYC4tOFeFyQJ0VbO10pPl7X2RyWWIptPG3BeOn3QTd6/VzdHFMAAVGBfGwTCwr1qRpFD1VvQDbbf733qYe3sTn/DjgZRO+OvlBn8DrE0U2KHsTVY3Fv4zrC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bolvkggS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b618b7d33so10318775e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402992; x=1757007792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9a2vmST2yjjz0WsuJUzIOB76yyyJ/7TCvf++H+elfaM=;
        b=bolvkggSZJrEDxPx99Px0WygdHfn4kMW41ACmizsM8Z7DZIfCGKONi3vR1GI0pGFNN
         e8ia0x9p0MugXX/R4BGd6jQwY4tCoavdCOwzLu07C62s3RhHNQZK1AlzDJQ0kb//gKuM
         F6jaJxZUIOk7D4jruVWiQ5C7IepOgj2uVr990KMeW+6I50yHZ4WnLkprKQ669Ji/UYAl
         4v/XqwddWUegJAN3zfkw+B2rrFucDc0umftquB39pIx7TUYdo0oMnYGiwxC86A/fj5pF
         ReptgaOtwgEE7NXExa86NkCZaDgDlOtlHkXtGdbz81JmrQ3vHq61dKTOIEkXfy/Sjber
         G8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402992; x=1757007792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a2vmST2yjjz0WsuJUzIOB76yyyJ/7TCvf++H+elfaM=;
        b=bMymU3Xs279Esv6K7xxXkCNzCXWgivDUfnVLQ/uTlAUA80SY8z6Ii1moKajkGMWPBM
         YpdQE45njMmiX1SI+emVrHkLEloX8Ggy5IPAkxp/V7EUxKI8lLbQBCHT/ND4KFOjfLtu
         Ja6O2fJCok09xcNyOqqeuGEaRHpOYfsy2M2MbWUp5yoWiojAxUFWl9oA86Za+X/zPm8K
         qR8F+Gk6JQOJITpWauMI+C70r7C5skJbJlsIhugxVB39ZJpY5E75FByfYvBYgfBH0ika
         /oCga0eMmBzco9K6/AQI+lROwL+4XMIDEuQm9g4Yxho3f2/hR3Wm8bP1fuJF8MDppzkT
         9ELw==
X-Gm-Message-State: AOJu0YwP2i8eVTl9SU6rkYFqwH+ib8csIgdyTQTqDSxtQLh6rXrWSy7K
	3Ate+KiVZzJpo3Gl6VNi/AKLvoNqYwZIOPpVI4Azz0b68V0HaMmsaCmdANsHsMAtPYWWbhbeSyk
	SD2j6FTo=
X-Gm-Gg: ASbGncuE7tCxD+L7fLg56YRDHafCF2AN3pZ9KlnwyunjBA0tW9Vczn+TYftQHnU9fI2
	OS1cLXpEWL+mCtNW2uiM8sch7onaDvbH/fw2kPwLGzT9S5eGh2putrg4AWajKCy+yp94D38KYfr
	5HEWM/bz0nQhpjqQGZXMcernFpiif3sKdt+UQVK+/ipxQx4nR/RO01ACWJZEKdn4Keofj5iPs7G
	ZEiDUSydYwGsMVuRfwnk+4Lj7En/1TuJEYmkiU+9liL1KJt67TKZl6O0lryLgqPNuCMMqOqwlCj
	vUW4e6LjmJZT9fTu+QC8Cv2xC8dMY7zsgCshuwR+N+zzUAwL+DHrL5CwGBVUmpGZuhecZLcaJnM
	IUjkVpH3ToqB8BX/x37+hizafiHTG
X-Google-Smtp-Source: AGHT+IGo+5L/JyJVhCEsGxk0hDMQ0Rbbx0D/n4OlY+UNCQutAo3GqD5oHG9Ao7kUJbSjrPYID/OhmA==
X-Received: by 2002:a05:600c:450b:b0:45b:6de3:6402 with SMTP id 5b1f17b1804b1-45b72e50594mr44921355e9.32.1756402991840;
        Thu, 28 Aug 2025 10:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:03 +0200
Subject: [PATCH libgpiod v3 01/10] bindings: rust: make
 Buffer::read_edge_events() lifetimes more explicit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-1-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oK9JykrJo0R50tJ6BJVkm+7Cvk5x/d09fAlLbM68pIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUskjG0W3JDOjsHbLG8KfN1Ef0PHHngPzDAU
 puSuBneQ5iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLAAKCRARpy6gFHHX
 ciTqEACG8fqMNXKZCyRDdGVmq8wya8Q2mxg4QZx4TW/sQqfWDA75WziS6HKw722FzsgNhcBNMm0
 RsJ2NC3p84BYEj8L9fTgyaufsbwYwAVeGSp9l6Vc6j4cRIAxuB4K3dmDSi3xiZ5NfKA3pUMJC/M
 cAbGSZjFrE9pNVlq2F8JXHtEfz4seggVosJM137aJeJM6z4iK0TOq5woVYLh9SMnC6fMdmmE7Vw
 iIvy0oNpSDiaZt+xggKYdO0ggsX+fxJz6vZvb+GmeNy8ffzUsT8g8EWJg1azZvpVT35Is/K1NkV
 seEqCbe4844M4+9FdNN0zvt1bXo10ANzyatJyR2C+ghegRlZZNgNNXJtTTmacjBcivFZh+uvhWc
 VF2JjNq+CzDZ5ww6dMoygNMp84ljQis6JfCFKIoUYn0NytrQSw+o94uBpL/rDVsbwQRO/718u+S
 hzhVi7gvtq4pEpxt6jQtTLcjzBIkQaitd1Q4FTgUc8my3G/lQTNtUxQI4QBpwQRfcMmU9ifsXcQ
 YFAtBZ5PCpNjxtm79+Y7xkIOpprmAIQgckop0STKSJrZrpvpm21kuZkHllk7/E7YnH7vbNHf1fV
 eRT6cjMseGIG7vQ+JpaQPk7eNiIPdfiFXdL0rEvMCmw8KMggu3+oKBMxn9Ue4ivTeVMEjTzYVZ7
 4tcCyE6dtkLXvyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix an issue pointed out by newer rustc version in the Buffer struct.
struct Events stores a reference to the buffer so tie the lifetime of the
latter to it explicitly.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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


