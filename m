Return-Path: <linux-gpio+bounces-7816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6591C639
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84664B25C03
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9D058AB9;
	Fri, 28 Jun 2024 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qKVt/g+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159E57CA6
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601150; cv=none; b=YfyD6CBpbyJa4SDkdWJopRVTTqsXFjxqu2EcwATbOmRzBtpT5pfDAZ1XXo6PGHKqb05p4AcKtV/kO+krnKHsSCVvcAwm6fDTcCpdG2umTlMUkwafIoCvc9CTks8fyuo9wuYUeAdrDNSkQFP2/15aKzcMAHrxGjk45R/+7x0TGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601150; c=relaxed/simple;
	bh=NwUWEm9OUZ9vpVs1svXaVqJGdK7etUS1VgNeDtUHwwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFVM9ACzj9nzqG6dUDCA+/cvM73RvtzHHF/XAkxZjxSIKp+phPbI7u5jQeoMapSpoZGv50KfIdn3vhwN+IXnA+KT+lLnf2nAM52lK4fn97ZwcAHuBDsw0Reb/9fb/7dQmGmtNneNvXtsvtvdfrMH4MfRYl7vEoqoj8gNQL529Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qKVt/g+X; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3658197cdbbso517895f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601147; x=1720205947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJJuDpMqd8L7Svo1KOrBhJ6B/x9FaW2uynzmvqKA0SE=;
        b=qKVt/g+XSigwWPRdazBAoU/Sjke2yhmBQVY44fl6tAi139du77c0C5uRhqr8DExqVn
         b+gGJHlAK0NF0T81mqyK6SgqO6iioiGx6LfqyaeuixHVjneqpNqWaS67GppqYgYH7om7
         A7pXSBEw69OvfJVoDGUdqXJQA7FyZZEsHPWNL1T/4ElzjqbRGW0KuHxfbHXtdKBbFYyG
         h+6PR00lJ0hHi2M0FqmAfgrtj5aKBAK3iBF0zL5XcPZcFT2ghEmEWQr9WakJjvpYCuQE
         K/IVWJqF765j86wZmELn2wiM/QuYYqwfpjvMsTrnE6QjpJCIAk1opRRNXsmGyoPSPzSs
         CE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601147; x=1720205947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJJuDpMqd8L7Svo1KOrBhJ6B/x9FaW2uynzmvqKA0SE=;
        b=ss2FowbjNgxUSoTNKJGiwXgUrnFBZsw9teX/RAvXNYYn+HysNB5cqslid+vC7luN3b
         9pcA+LNkMZp3ocKpFieaCpp9GUHDbE5rjYYX4NCquYoVBOLYqzVMtdwk+AYYNoN6ZdSf
         9IZF6XQzo4kLxqsqXGTTTtPnTIeDi2jm2qDXML7mYUMzWUj/xMgDaCq1U0YBCpu8T+Zr
         nhHMWyqSsEJXueCE/E7WqQljzhdu8DFugjTV9Kon4Dg7DU98iFkQiXuwvvW8yzKetSFz
         7vt6YFqUJ3Ac3kOEXMafu43DjOUHEo7Udk/O+DkkOoh5Ny75jrDWzc9dOrIDK8aMfFY6
         qltw==
X-Forwarded-Encrypted: i=1; AJvYcCW+PJMmTkdLL9AVO/XzQJIA9TEgm6DFdl8N9sXLerKyvwExTp1UbLeFKZjtjM327L3IHR5eE6hoiXALfMC+kW6oqtna7NVDTjRmjw==
X-Gm-Message-State: AOJu0YzfPYeO+p92AswQ0NSuWmEJj/lJp9c4Hf8B5OKuhsT4Q92S7tiJ
	BOcxOsRYGIcfimj+3SDe2Jn3ArdO+CiB+BwozkvXB2lx2aFOqgdAyLJDj8EOd2k=
X-Google-Smtp-Source: AGHT+IFdsxncTOJ47r4n3br/b2o6Y12BM4SkNadBjQkfdDxPTXT8zcCuGwON6eij+DFkpbwEbfHEeQ==
X-Received: by 2002:adf:e9ce:0:b0:367:418d:650b with SMTP id ffacd0b85a97d-367418d6850mr4212311f8f.53.1719601147725;
        Fri, 28 Jun 2024 11:59:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:27 +0200
Subject: [PATCH RESEND libgpiod v2 08/18] README: document GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-8-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfrMOxXYitB6nca/eM//a/6Q45z+JY9LTPxk
 QW7XGIhRZ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H6wAKCRARpy6gFHHX
 coasEAC81mKOV/scB7bOLx86BABTYXEZE5ob4v3G2ophlrY9/DLegP4yQi1jabJ7X429JoO6KFJ
 4RbsQNFiCtsE4glkVu401nNctUthFOmuoLe2hfVjJRiY3umTauwDuP5lr3B/0EoaSM1qAFyEbls
 jy363sNeVSI4Jbu7t/ANN1G65cKsROKLw0TfcINWl8wq4jKmN/bNADop0IEypD+r5707lrUN51K
 wLQ8lWU7VpXJZRNG438Wx1CrqzDFgsbgK2QUcd2FuUbyB0ORh9oXu5g3oMa5Lt+7y2y108DQn93
 GvdvqEa0vzdZUi/lgj0xqsCLDLlORQ3xvG/yXMLbI711H9aIV2mNMRVanXaptEQ38r+oVsNpBGh
 5H5zSkbsRZ9quJkAwHPcJaL8rNGQsihq+Bo35cifz30sugcPSIQhHsef0x35zhVEXSiEeP2Jnz7
 oW7wZQvmLYBvGaHAk7V2mVD3BX0Zlv02KcyY4VCI2Zbqmk7KmDcTV6iGbNNqkcfYFMtJcGlfKeD
 ef4bHmwOORQ/3lsMTyyLbmbtZkm0EY0pB/4OFL/yN/aUh0VolavQE9u3t3wzLIZuixloA6sLBU0
 g1dy6syZardvVjCEvjXgdGnk5OErGTzKdtvoO0nHjUDQGtuPAMF6YKI5xz8/s56HJCqRWrpj9uM
 fcbjw6P3b17v8hQ==
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


