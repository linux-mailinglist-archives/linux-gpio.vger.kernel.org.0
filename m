Return-Path: <linux-gpio+bounces-15444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B191BA2A85A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421701616E0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE65722CBCB;
	Thu,  6 Feb 2025 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OJK0lDTP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50522AE71
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844538; cv=none; b=jX1v2WD0LtzYjfEp4WJCHteX2daS8h48KdY3H+kDzQsEdRqK+O/VP8X/sD58Q9Vl1GcrAaLDsnKOi3Zp5QUyl9voBOtxEGkFBXMuDazouqq1Z3EQWf1836I79HzrOCY0Zt2j76/fyMQxNFkUazD8iXrxnuiUaDRUBhaEUI4nuQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844538; c=relaxed/simple;
	bh=hoHBTR9TOL1ZwazPya3p072s+4nDSW8c30s00S0GpdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDYtdO8hfNzkD3l6Nr4XGaQxrtNuQAGEWRHuS90cVnO7KwlHwclKvWdiSUBHCW5PyFP3sucRfsqkG0PXXvu3UkfILpnK6cZ0XAV5oHumDgeEo0C3MyInnE8noz1OYCgug980lUq90JAsfHatKYUCMWWNyHWpBG5M2hZUR7Mzg0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OJK0lDTP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4362f61757fso8086355e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844535; x=1739449335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX9VVeruVQ7eRfdbechwCOPULJXVbEkw4OVdlGOjQXQ=;
        b=OJK0lDTP8DBucCH3KM+HjuBV+D3MbuNwGaNMQ96He2rUUVJDdvrGOlvZkJ0MzF+L/1
         13DdY6x7VFqDxYyifc1rpGjxB9pDk5d945/st3NlQNzsdN8lU/GmwC1i44GqX9+LGwYh
         F/WY01wNg8mzqpTIr70SFygoOGonND8IdQjkvuDnG74MI4s1iV68g8sdup13sEflRopg
         KmqtkzFzEs1Nm+m7Q+sbxTXb9zHd4p/SRv0KCELV2kz69wyVDzJOxJPp9PXOD+MqVC/g
         IUI6uLyEigL9Ynf3xIwgyVTgzUp26+H2skD1TdFKdZc1RmjUFEutS43SB2j9rsV0OcWp
         DctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844535; x=1739449335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX9VVeruVQ7eRfdbechwCOPULJXVbEkw4OVdlGOjQXQ=;
        b=VAdTRLpJHgyBgZrhL8a7qEvIuq1yCr+PSNLlM0YYmRB7FeJBrIYgI55hpg7PlxNsu3
         jLCD0HyJot9uP4JjgTVU5rAP4/jPnbJeUc6JQY4NnIr6Sd6+yNTv7iFXLhO+d8OGWqIw
         zY/A4gQLQ71ZfB4uOjY7bQrhraBFejuuqXssnCs8UxkA99Nd8hmeAGDpdX8Ot62XjyCk
         At2XeQkGfZI5pX2JITz0BOD/eV6O263EFtOmlZngHEYVMYKrtLU/JpsVAriSjo1UpXjA
         VUiT89FTN6iS4Hyh1uzqkKNgFq/8mlesoagNd74BHcxSFMCBBmUx7TKhs1FE6Y/2bgLg
         mXUA==
X-Forwarded-Encrypted: i=1; AJvYcCUudbnrn9Kek/8dtNcSG4CBMpnrQB1kIj7LY6r700kppXVqU0KujI0jW6+E6yEbtxOPi+7lOsXCAsVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3iR39zZxqGQM8DxWFMvvaF36S16bvTgBHjR/Vaqm2U9v1XGp
	B7hg6NK8NmSAytjMDUT2igJ+G+KTfzH64JxZQVg9rvb5eZ4Kl5RMUpfxVwrWOv4=
X-Gm-Gg: ASbGncsv7tEbCHaRQx0vNiioeVwFkV1a64wRt5784azO05XqZkHEKkTK3wKEUZD5acy
	/lIP3z29VfjdRs/t3lY23XgWkICHsS1GnlZcyIZ9FrFIPn8alDhAgt2PA7wode7yH959aOpDtb6
	qiPr2sCaw/o1tvvr4pMbzEs2SnjCmEPQt4F40sIH/D3LYeaB6EH+ZnZFwtONYbze0XS+cAHbvCc
	bvmly0Zl7YEtrp451MOUxK/p3RBjLUwKh0QrDw73Tbprphj+Uq0tv3fWgkY/QXzFO/GD3WhMZLh
	XW1FZQ==
X-Google-Smtp-Source: AGHT+IHD/i6FPSpQnN88faaaeReMB0NIKxQa4cq8I2+dAHkcCEgAezsXvUWqj99m8a/GPGy0gS9vCw==
X-Received: by 2002:a7b:ce93:0:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-4390ef6ab3dmr63729315e9.11.1738844534796;
        Thu, 06 Feb 2025 04:22:14 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:21:58 +0100
Subject: [PATCH libgpiod v3 01/16] build: set PACKAGE_URL
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-1-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uL9eOG2xv0BMz+LonRXot+ZirkyYIT8F4vCr7Ugi4KA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlx/3itXAtU9RhRXquHJBzi4umN2Nwm63aTV
 FFl0ALkZ8+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcQAKCRARpy6gFHHX
 cuT/D/9UZFYtPst5iXvUeh9bR5cB+8062M6a8OVDE7vKtPmsTmmojmdCbNtoKPnvWDJUUAjNcMU
 O2UeKfUWx0HNKIvrZJt0voE2V8vi9Nk4WCiIcWgY9G2pZt36VENnYuNXMbQzg1pZUoCvoZ8eANH
 X4tBFPfeF9mJzefypKYTNex7DWpZ0Aj+oQ07vr+1OLrb5HfhEI6JrfSpHQCuIqShqN+rJshhlJs
 5hZa5+NWeIPhlLymtIw9iHKbWNEf1R/8v6o7WrKrIGm1mZDb0+y90RiZ4rQUXwp6o4d2mh4hJ8C
 Up3ybq1T0emcBaOZSEYyRipqVOQpC0DtPLldLRouNLg3zOTMc9sXPatyOJylCH7VK8aPNxDBZbq
 FXAXGIt6tMijyNFpPnwnW/1MdwDyCU53Y9nDR/khw1bZ69cvrCeDQkeaSRvi8cx6u6yMEvCKsCv
 qTsBge3phHogiHkXfHpT5IZw/IoCO0VE6nmFjzOJyB0r3w6P8zEal9bk0N9RUdYnsPCgQe4LawR
 +by1JIVUEWFgppiQN6yrnAqzVOq96Yv5zsPh5rG+0pmol1W64op6zDNMhy/pvCFh7Ov7QtQ3uVP
 zN2BlA2z8mYAiV8tID2sD+HQEI4hnQ1gVWlXQnGE/dG6sG5L8fCRwSxMGO4mxboqczPPs2ZlDAT
 Z64hFseSd1m0KPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't set the package URL in AC_INIT() so the URL section in
pkgconfig files is empty. Set it to the address of the main git repo.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 78a6670..34de870 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,8 @@
 
 AC_PREREQ([2.71])
 
-AC_INIT([libgpiod], [2.3])
+AC_INIT([libgpiod], [2.3], [], [],
+	[https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/])
 AC_SUBST(EXTRA_VERSION, [-devel])
 
 AC_DEFINE_UNQUOTED([GPIOD_VERSION_STR],

-- 
2.45.2


