Return-Path: <linux-gpio+bounces-7791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCD691C1BD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E1C6B24E80
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7C71C0DDB;
	Fri, 28 Jun 2024 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ybkOfe5F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA721C007F
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586434; cv=none; b=S/bqVm2Pi/H2WosSRSNhnsyZzlC+stQEaAwILaXCdyg9O/SdqnmyZ4UWBhy0G0rKcDlQPpj5wKbp0iKZc8bOpYWMbqJ+xRku4rI0WCP6gYOaDhRfJSa5O/FFHFWVb6OT3zzmwYE9ku6IusCdZho//3HcPd4Z04qyp0beSrWeV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586434; c=relaxed/simple;
	bh=NwUWEm9OUZ9vpVs1svXaVqJGdK7etUS1VgNeDtUHwwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oB4JC+Omq+btFC5EFXFAce4WHh+HxyB4RuEXDjr6AUZQfDgAf1GDf1XMFRP7DmKeGuhaCM8/rSoJlX+RJasMYohryBaARmMYLCOm3/7neuwNkD3lwAr81Ynq9JvetsxhJExtwzXBhuYlHx1sGeNKh4GydnnH6rtJjCYJ481NDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ybkOfe5F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so5387575e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586431; x=1720191231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJJuDpMqd8L7Svo1KOrBhJ6B/x9FaW2uynzmvqKA0SE=;
        b=ybkOfe5FINEUa7uOvq9bKDONM9LU4vXKuwsTWurHTUE85b0Xq2EPROl50Uka63PY/i
         uo/9h54rQR6kq4igqwebEu1iQ8vPPeL+jMslHtHxR8mieemC4JTiDrvsxqOOtn7TbSvK
         3AQMRz7W2bkhDBI299IPglF/Jw5uDRWbLj/6RSMIstM8Ae4Sg12A7D08LWrO7NhLWtIC
         t2C+fnKW2jmh8ZZrU5/lfKYHefKPo0RK6ntVvJYlYd2td9M/QvkZ31mejveZwWYeCJlJ
         bwvspGWsI42lRfimm/Dpq9VT7nzhJlXhPE9M1Fjpu2rhUsSI/9BqT9kOrEH2AsA/6FHc
         1Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586431; x=1720191231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJJuDpMqd8L7Svo1KOrBhJ6B/x9FaW2uynzmvqKA0SE=;
        b=JJsvfez1Y86Rfg+iYZ3SlA5GRjadNj8XYaw8m6Sw+WoCGZw/RUz/8ktjFpF0BFHQq6
         9VWemwPhlgp/E3nfhxzMtGUya6xjcPxH4VwaVVGFKnn4b7TXnbZHsQ4fTzSbKsRbMMZ8
         RU8td5MKjs86lJPmx5hbKGQHFfyRx8Qu6G4UUBwVnnK33PfgJjvQpmFpeiblPCNCH/Tv
         Hc+9QIhfo1Preayi6xHT/RHCmTetYz3VJ6btBwnehxQ1yDuaMBQuq/I1PAkuKBQTtyo9
         DscnFnNFmeqpMxNvSKZuXCAqRas4w0bV751QBmqJpFuPVpWXjFvDP/fDY8EFqGXW2yMt
         jbhg==
X-Forwarded-Encrypted: i=1; AJvYcCXc7fEegOhVkmjpbiZ6U0hmrnXfnOwz5iMmVLXdI3sICKIbKcIiYpF7f7vhthmwB0InRxGXm29JH9i/B5p5qkq9uvhzMfy5wwTOzA==
X-Gm-Message-State: AOJu0YyfuXXDr0qp4iAlAIJ1CyrAIYluSuqh+9jqkfDMCxYwb6MkiLbj
	55q57A2UavkOwXmZA5RFJFqyGussHcpY/RP0kur7T/nH+htklXnR6aK0qAE70Qo=
X-Google-Smtp-Source: AGHT+IFV3TIGTfSGb6We0xuSfzSohy5Mwbda/JClw9fPd/p6sl0vgXKVq8UH6rPmXAAG97TrdCZsVA==
X-Received: by 2002:adf:e38f:0:b0:35f:488:6d3d with SMTP id ffacd0b85a97d-366e7a63686mr11326106f8f.58.1719586431504;
        Fri, 28 Jun 2024 07:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:24 +0200
Subject: [PATCH libgpiod v2 08/18] README: document GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-8-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=phVDuEqV263LENkg5bMa3wSzLi97jDzlTD+quy69pmI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5ymb+Ooq0Zk8eg4Na6c3RDti1Wh4gHHeKRC
 jRcfpmaD7CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcgAKCRARpy6gFHHX
 ctaeEACmxwgfCQkgyAoW8GoaaDtBjUyNioQjJOORUBPm+y9EZKnwot5UyI3okyBmOe17NLj/Icl
 YahPVQ2IU1H5hhtsBjLPVuQaqpYV1+LBpT2wkRFC1CLyb2nJx+BGHeWUd3qMiK2t9ijtamOaWkT
 Cgq1fn0VX/KwfEbu+CoDYUwyskxtiLzeFfxR5CGygPIMX4Tf01+kSj3eKl2U7pz9DZeuh/SsjeZ
 FDVXWcHC3b3JuBwlPPFc8ON95vVpupR9gt5XDFrWGDxGzbtJX2OPohJJqrrT1BJHVJYEss373Tu
 bnXqyjCQIP35i1fpiSM4LDK5Vmykz9YpTYxW6gSTZJSSN4Jt/xNQOMYFMoUa0VozcPozXW9XHdK
 Qes4Xrjk9HSaxgp9R1HYKG1NB9WfMPFR4WxrF2sStezhMCF52tarmPtnc8llMAAYakjVpT5sQoa
 +bcOsK3f0qpuSkQ0B2TY2XQfVhIi9U1mITSY3B2R3eEdewu5MTdtt4CCovTqpKOrgSZvkWwqmo4
 MrfPZm/ktiDQskiWlY7XpjtgKolHWQ0Yq9+e0QyAcjRRnOqlV0L9jxtm7om1EZBQgHAZxHx8Bpy
 69HJZGznErVa/nzthwKBbI8rri2hVLwOcI3YChmXF3rkY8PNFFiBp6hF052VwpDf7Ebx/pPjq8c
 m8x43/YGuarrcMQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the requirements of and the configure build switch
for GLib bindings to libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/README b/README
index a6f24d1..ef5d328 100644
--- a/README
+++ b/README
@@ -206,13 +206,16 @@ Examples:
 BINDINGS
 --------
 
-High-level, object-oriented bindings for C++, python3 and Rust are provided.
-They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
-and --enable-bindings-rust arguments respectively to configure.
+High-level, object-oriented bindings for C++, GLib, python3 and Rust are
+provided. They can be enabled by passing --enable-bindings-cxx,
+--enable-bindings-glib, --enable-bindings-python and --enable-bindings-rust
+arguments respectively to configure.
 
 C++ bindings require C++11 support and autoconf-archive collection if building
 from git.
 
+GLib bindings requires GLib (as well as GObject, GIO and GIO-Unix) v2.54.
+
 Python bindings require python3 support and libpython development files. Please
 refer to bindings/python/README.md for more information.
 

-- 
2.43.0


