Return-Path: <linux-gpio+bounces-7799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A091C1C7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74B592861F6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731C01C2327;
	Fri, 28 Jun 2024 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TF0SUp/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93001C0DE0
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586448; cv=none; b=Pg84O2hcHl576/4awGLZqxKzk54qll+x4N9OgM41hQypqJakANM6HvIFj/U/PszgqtUn11DtazNTiL/KJ5f2ROkRdpnlfJM6/jsfJurHhhvuRCjeQivsBK1c3ARYT6HD1p9RGYMCuxYIBjGNT6mQbBQkxisMsV5rC2jYiejlcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586448; c=relaxed/simple;
	bh=bEUpGtG/D3JtTbZxH2yn5bgvaJEJ0+1zLL/WlJK9OEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o08kuivKSVrj+fqvn1uXnfv5zJ6PSAnur/cNbajHDow1OzvbYKFR5lblTWOrwKwoA39+Lq6pbXW3a4yks6FouWPqE2zWjXXlLqBZf/9oJJBjCmesR58lbXk6S5d0nsFcf97Dp2o8IWmvCEWrX0Zbjway0qkZD3amHqrse2Kj5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TF0SUp/L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424720e73e1so5590155e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586445; x=1720191245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZPZpNDn79/gR6rQ0o6Supjv2gHlA3trk142CFNysg=;
        b=TF0SUp/L5NdnXuqiZh9ox3Hyf9XH1IrNSZTN4uTJC5XQM0ZCJVk9g379540uv681PW
         Fsw5Un6GnMLD2SUExHFvJYcXiUkgpbXKsiLiZn2UlZTJovpu1xJEqLLs1Jclt3NHm1sm
         bsQfcJ4Bk51itv9usmeTw+z0qRMagjR4k6B7DjMlbGKgCe+9ykLsqNTmVwX7c19egK6o
         0sezj+r6u2E1QXOzDULLn5qm9/saQS599HkroIRhitldPhriKw4IAD8PdS87Aj7emHqd
         msBJuAcCkdhEc+YmtD8/JO1d3emOkQTalybw1cfa/lZiB3Vj3W7HpOqmJ2FZhaq6F6J8
         yBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586445; x=1720191245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZPZpNDn79/gR6rQ0o6Supjv2gHlA3trk142CFNysg=;
        b=J/S0oukW3pmfnmjox+SgX3nZaVUfC28NXup6+vimi47WPP3fIZLusUDsVa3a5DAEan
         75fxYU72e/XFb5+spywfB0RAESQ7uYKZxOqufKGMQ9VCtr2UACk+NC7PwGBQFMtw+Ajt
         I0FgAU9tYW2++Ihfyjo8M0/THQPwXkZz35uWn/MfyWUamEFSV6KZPCctUfM3R+zgJQDj
         jLePya3blnW8SQNop8U/vv+7JjG0rF44/oL7F+t1Nd4RI9LlF/bvC6FGCI5BoHXeu8o/
         LOjaBThYmPKq7oNt0mLk0aUT1RcDJ02KpZz7xqtNsqmJdhjHZstbTjVh4dT3dPvdebK8
         qzLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqKJ0NM1qpVCGAWybAa+jrXf0siLxsvXS3nOXoDGh/MBv1kOX1wLEfieoWlMDBkdgevQ1n8G8zQdONDKmp1VBq7hW0iWAuS1hyBQ==
X-Gm-Message-State: AOJu0Ywfg35uCSQkz5+lnlUWORcQ81Foyc1arRHmPEm4rQwZaXB6PtFu
	RebGM11VZscDIIz5wZIgATzdUyAiBeHxeDpHE8NGBhczZlk21z42d/hyqCZcFVU=
X-Google-Smtp-Source: AGHT+IGqXBVMLBh7xxniTqA4dKPXk5nz0OPxGN3cNfZRn09qujrLF/jzxLjwYMmfQQrjUVJ+rf4VyQ==
X-Received: by 2002:a05:6000:b01:b0:366:e7aa:43ec with SMTP id ffacd0b85a97d-366e96c0258mr10157706f8f.68.1719586445362;
        Fri, 28 Jun 2024 07:54:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:54:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:33 +0200
Subject: [PATCH libgpiod v2 17/18] README: document the DBus API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-17-e42336efe2d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iMxXKRtITtm6UpwD5WUpezMbjn6y6yIZyvwF9qVoy/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs50WDM9mZHpuD1Y3HcXeTf7NgyiDP48003sP
 /+eOhJdgs2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OdAAKCRARpy6gFHHX
 crIaD/9qneeu0hgVeMfAByDht0ED88gqRW8KC8e4dn9Ha8JCpCvgiyGLgDnBewBUEnO5xWKG80B
 gSCttCWUEo/Tolr5a5dwtveJWzXBTmLenmrmMpiMMiXgya3H2TBZqrkqxXgIVj6IZ25O3HvFkhI
 jgWe/bomKx6WU+AW2ZvNgBEWFrzDE5c6KUE1viN6i7zhgXbwaFRfrgrF5Ke6Zf0Vh0EDH9FpmnP
 KSTNJC2H91OKDqRtDgpwPvLk6GymIQd+MzJhIa23lSjIhaX0EtbZ6un0EBGgaVeCc53uhgTuUC6
 sEWYLW62tsa8r/JupBWTiW1zOQ1gwt3LaI0bAKanivwV+0mBpmse269whmlt9t6chYcFcQ9mhH4
 Q3BaZMfUKfM4zd8z9McQ5Dxu6lBjCSSH4u7SmOV/qQ05uJEf6K31JPnvYefQUPflfewqZWO40Mp
 PeichznWlTyGlKOXYqvgg/PzROIPYCfl6nXYbISoRCqRUHNSlqhn7WMHJVTFL2kkiG2daHFD95x
 qOWrKIJi+pJ2p4jsDfnFO7GpyueePrmmws1JksIq05L0GgRKUXid3md72UxuaAmng1Q0O1c140P
 ogxMbEpDBeAzJ/8eh9vXIs6s2vlcvWSIE6GsqLI1vmICHxJXLc6SuYYAo7AqknX+pBj7XIBm5yt
 4ZQ6ODYeKkdJeNw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the DBus API as well as gpio-manager and gpiocli to
the README file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/README b/README
index ef5d328..192943c 100644
--- a/README
+++ b/README
@@ -224,6 +224,70 @@ C library using make, they will be automatically configured to build against the
 build results of the C library. Please refer to bindings/rust/libgpiod/README.md
 for more information.
 
+DBUS
+----
+
+A commonly requested feature for the GPIO character device was state persistence
+after releasing the lines (as a kernel feature) or providing a central authority
+(in user-space) that would be in charge of keeping the lines requested and in a
+certain state (similarily to how the sysfs ABI works). DBus API has been
+provided to address this requirement. We define an interface covering the
+majority of the GPIO chardev's functionality and implement it from both the
+server and client sides in the form of the gpio-manager daemon and the gpiocli
+command-line utility for talking to the manager.
+
+DBus support can be built by passing --enable-dbus to configure. The daemon
+is bundled with a systemd unit file and an example configuration file for the
+io.gpiod1 interface that allows all users to access basic information about the
+GPIOs in the system but only root to request lines or change their values.
+
+With the manager running the user can run gpiocli to control GPIOs by asking
+gpio-manager to act on their behalf:
+
+    # Detect chips in the system.
+    $ gpiocli detect
+    gpiochip0 [INT34C6:00] (463 lines)
+
+    # Request a set of lines. Note that gpiocli exits immediately but the
+    # state of the lines is retained because it's the gpio-manager that
+    # requested them.
+    $ gpiocli request --output foo=active
+    request0
+
+    # Previous invocation printed out the name of the request by which the
+    # caller can refer to it later. All active requests can also be inspected
+    # at any time.
+    $ gpiocli requests
+    request0 (gpiochip1) Offsets: [5]
+
+    # We can print the information about the requested line using the
+    # information above.
+    $ gpiocli info --chip=gpiochip1 5
+    gpiochip1   5:	"foo"		[used,consumer="gpiocli request",managed="request0",output,push-pull]
+
+    # We can now change the value of the line.
+    $ gpiocli set foo=inactive
+
+    # And read it.
+    $ gpiocli get foo
+    "foo"=inactive
+
+    # We can even reconfigure it to input and enable edge-detection.
+    $ gpiocli reconfigure --input --both-edges request0
+
+    # And wait for edge events.
+    $ gpiocli monitor cos
+    21763952894920 rising  "foo"
+
+    # And finally release the request.
+    $ gpiocli release request0
+
+For more information please refer to the output of gpiocli --help as well as
+gpiocli <command> --help which prints detailed info on every available command.
+
+Of course - this being DBus - users can talk to gpio-manager using any DBus
+library available and are not limited to the provided client.
+
 TESTING
 -------
 

-- 
2.43.0


