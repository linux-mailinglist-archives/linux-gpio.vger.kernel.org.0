Return-Path: <linux-gpio+bounces-8270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF3934AEB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1581F21242
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DC882499;
	Thu, 18 Jul 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mkAS+QAw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001F82495
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294935; cv=none; b=AGKY+H3Qak2K3lLu3L/GN/WIb8LRSmSo6XM8tFnvCqlj0S+jNrRW9LdhSe1FjgNS8Tdfb40DgvhcAr/5gdlA88KjLgTbJ7MXAVj96zaal3TKNxNh4UzNBgrkvRsV7DijaHsdNlWRj0q1sl58KgTbe4eFndg3Dr9gxQ4A3+9JGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294935; c=relaxed/simple;
	bh=7jenabtNWenx7I8R7ceF3Ws1B4ti/sVn4dhPomjueEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbFmRZ6ue70XOAuLIK0nx5Z5PTduqM3DQdGnSGNrjcENFXcEkNYYCVT/Zfp2ynvnd7OFMZD8IwehtrtdtXzM0AzP6LySIOZvJD1EHh7r7XB1wXRtdDZd5vQC2AZaEBhFQbNYmWmfXdiThIbrBACLtAJAIekEz2UmUd4rGPrHp+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mkAS+QAw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36865a516f1so112751f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294932; x=1721899732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDLk/fIApf4puRlKWFi5IhtCsHjKDrzzDuybhTWSeho=;
        b=mkAS+QAwbKRtftqNec84phHAqsyZeqZbMb+QZdZYHIj54H8D/zk91l6XSjyn0XZdtc
         VMwsAFnDEVftNZfsh+1ubCyQuu5DsBJOgV4YtZ5uuUOq5lAae99hOlKSiGeJG2qHziJ7
         X5RVit/K1V55+6A0sucjUHI305RrizEtQZj0cB+zrdNgY5F3mrwqDF/1YfdgARs4ZLeK
         9bV+L5dJkOSm/Rd1k4KS9pLp+JaYfi4K+jpXFVZ/gY3hTVKa1n0qxFIAwEygvzWh3uaE
         MDxCKcX338lZIsx4lnrbD9ijejxxzDHxsBUkM6szRuYOwJhWZevU4/Oe1gftl6BlQwKT
         i+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294932; x=1721899732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDLk/fIApf4puRlKWFi5IhtCsHjKDrzzDuybhTWSeho=;
        b=vHFA9+m+/xjRh6SxEiUIBzRZ8WR++mw4aYxCPzN8osOPvlHucVrNOkTf6MvhT6z54h
         ApQbQbu0w5Teqj/WzAU3XbYG8gWvwqk7qmoDnXNNMfKxiJbovbPFHkYfHBqISwgFDl2Z
         +gd8HyO6H6dZ+AXjM5SvIlgur0aayDB+Nsf7WpNM/6uCctLj9VKw1gyQxePBpUFxY0Ur
         4n+6fKDh9zmL9D14akhOBzjXkh2rFaAU0zWcTbFcVA8wsn4qg1TnvcjRSiG2cdSF9XG+
         g6JgDoGa1519G5/cs3CLRnDgNMpfMLrUaTELDuMUa8KW9kVKqD/CwrWTHDFG4xUSlcIc
         Jq+A==
X-Gm-Message-State: AOJu0YykWKWDLQBxo/oxB+lCesj61KVB7rp9RMw8GbljyAdr96bOHlqv
	9FTdQzaXcpNnz4xzR8n0hGTR2pJ6W3TGwftzTz9QbJpkEC/Y4vwqnnvTx/zIk3s=
X-Google-Smtp-Source: AGHT+IHMC3tEP7xurSStrRMAbtFyfqzwhnlXJp+R0tpCm+yYdLTvVGWx3L2hEsZmPJflJF2mGxcl0Q==
X-Received: by 2002:a05:6000:1562:b0:368:4b34:541 with SMTP id ffacd0b85a97d-3684b3405d2mr1792783f8f.16.1721294932229;
        Thu, 18 Jul 2024 02:28:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:02 +0200
Subject: [PATCH libgpiod v3 08/18] README: document GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-8-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1RfIuKDmdlsvZxR2wxOXsvxi+ZRtSkhXrPgsmfKsvsc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA/1ne5FGjA+5opzpvCzrwp8jATgLY5XFEKd
 GwBILSXu5iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgPwAKCRARpy6gFHHX
 cqVND/sHJ+2jj+JyozCiKyitJi7CdzRAaHGGRvyYN5m9iK/7bm8IywYdNs0/+j/S0x3CdPygt3L
 GOa00/F3MRoozDm4PtfjfDOyAPmOkfzgx+xM3sTCsBbEZWqM65htLckGe4xwB+xDMjjTWBbJ5Ze
 FakCzKW90xAK56z0iDjCXIsxMg67lon307ipnj177y9W4I5LXOUn2Pl41ExtlpLp6T0dngLI1hx
 BX1teEOlMLGFpNgoPkmmlba8ZH6FsRVTJ7HySeesI/lp7a425VcJHDVjMscvJ3oTZT6EvO06Mbl
 eA2dhnbQw0AvtHjsj58lD6EwaWBIa7BuwzJjOUV62gCiheEOUZJrDucxbRzTJY+yAYNgDXT3JnX
 rlDE77ZgEsOHb3KQRy0WGbQ/cLxRkUzGadJtbkRggoE1fsJXb1zH9ibu+570Yg3VyblZn3DW1sY
 Is9V46wLCOOkdMkW0lVsU7IUP24GJ5dEH/mKCbhFTR9UzCRDEJZWrTTAIwYZBMZZ1nrcjRXrxgu
 nt7yu0RuwxyU69sZBLuxl3WpZ6QGWt0/rvb4/KM06RRd9zLWIw4gLxKX7oWKnZ5tsWLq/Ep0PRY
 oAST7822Ymu1zHZ3a5xuS1LqA1icn6erkMwe8OQzb1QG/Uw9peOvoRjNr0PSSLv/oto4/sqeVm2
 OgLDbqr1iQ93dRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the requirements of and the configure build switch
for GLib bindings to libgpiod.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/README b/README
index a01cfc5..658a77e 100644
--- a/README
+++ b/README
@@ -211,13 +211,16 @@ Examples:
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


