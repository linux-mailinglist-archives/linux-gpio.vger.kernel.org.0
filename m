Return-Path: <linux-gpio+bounces-8641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4913E94A3DA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03459284844
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60961D1756;
	Wed,  7 Aug 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NOtV+0FY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77731D173A
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021894; cv=none; b=ssSCgcr4FYbDPsqbePLLZtSoOa5qToEnAIr3l2M5PMoYKXMqXoZze7z1SpVEKBY7Nv+P/KsPP5aMkVasEo5Kw199R8I5Z47To2BoBXQRvMg0MyG3ZsBynedU+0cxsHJ6YbG53IEqSIahXlCl0ZZWQoJDqsNDvcqNRmvaNmW9viI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021894; c=relaxed/simple;
	bh=/EDtjJvffs8sg64U2HrL1mkcEvG/wUEFcxLZLY3e/hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ke4J8MdW3PaRVH0dCfhiRAhR6K/7RvtImUn8HavtXP0SklGprfsapAp4xnLasWDqC2fIUwH1Y5p05KdmjH4T4LK9h1HNFRqkGVjMM8FPzNRMKgPInWg1ybG4FupjX4La/2FbGkHaWFhRfz951p/Ft+AomeNWo2cpYWURerfojBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NOtV+0FY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f149845fbaso17112031fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021891; x=1723626691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q49o8v+yNYgKqaYVMhaz2bcVx44zynFpHWh8csewCjk=;
        b=NOtV+0FYoxQlfIq8azyZ7TCdG7ASo1xARkovJTR1otmLy2g8AO3bj6r+MCFPwU1dgE
         hz1DloSHN3TSZoUouL7f2pL8z+uBw+uYP9z3cQQJDQ8AVRFSQPgtxVhhoc8Q8c72mAUR
         q3f0ELpd3E1A794kIaTju6H6ZOuv1e5qP/HTgeLp4v88mD+Z7POsBODx7nGcTJhKTPNC
         8FPbq5h3bOxPjhhk3SfMeKR50CN5YODfvmjAJic4aUCj3MfIsavZVPQStVsVurns2Lxj
         lBeNI436KRS8TtEoGEYCzFFYtbxurz8PLfMsUC29tBxFmdVbHQ/4qAOaGcqH4/mVw72J
         iOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021891; x=1723626691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q49o8v+yNYgKqaYVMhaz2bcVx44zynFpHWh8csewCjk=;
        b=VPpx/5NmOWCvZjxjt9yDDMewDjc6Xd2NxA3ZAFkQRcaxjgkz5kFdzaVVFd3UmGIVlz
         9mZNGeWibjPFW4A0QuLkRy5Gc0j9p4seZ7WX0byDhM0pPxIVGlWuB+uEyTaAi5vUOKwQ
         ONDw5bgK12Dk3sejFlglAH942frRP1lxH4QfplFtdEV5nbcG8GlaiVrQhbq9PMYqAwuI
         RVY/pbJRqawXVnOiEgBftwYHNFL7LdztwuitPaLODBvJQRlyr24WhNqRtIFxjPbd3n7j
         Yh3aUGQsqY8S1WiSqqzEd7dVWl8ZliDWpwpL5m2vx+5++f0rZg0GviwSFrdvJz3uLsmZ
         U/2A==
X-Gm-Message-State: AOJu0Ywn9OCdjCUB93hcwO4s9wNtLnWTgemNwm96QmojxD18sYj6r8b7
	JXecSwWAzYZUWpwjDwal+9/iqszOMeg00V/y51jVGE3dosZWK+dc2RS7/zfUx1haOo8bZuR+6yr
	uycE=
X-Google-Smtp-Source: AGHT+IFBeEQjmfbf+h2doGS6HCjXHDcury1g9ZmQLZAMw+IkIs4v+hCB0vF7UarJtOAr9eVGBKyuGw==
X-Received: by 2002:a2e:b1c8:0:b0:2ef:564c:9b6b with SMTP id 38308e7fff4ca-2f15aaa848bmr134541611fa.23.1723021890876;
        Wed, 07 Aug 2024 02:11:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:48 +0200
Subject: [PATCH libgpiod v4 17/18] README: document the DBus API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-17-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SmKNzIGpto8cv6nHULL3j0Pa2cAQp9ug8O+Ii4AtS9k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoTu/oO9X8Q9KhEA76CGT2SHgMOQcpy1rswZ
 D1T8R1QVQyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EwAKCRARpy6gFHHX
 cloPD/wNLXJHQ+WoJXxdApS8JAtYQKh0Tj+o97hsPMYr8ueSWSwCVcBWjJCqu4h5xTILtIGjJZg
 5yvOF22bvisJW2U41GEOmxB1F6d9RAJWPJJObKuI9lRL2B3G5gdP6nMAehn28ChYUFlsaB4gIfP
 nlMncA7dupUPXNCvG5v8oE7MMJmNmzg2SSiY83SMspXzMDowzt5MjSYrCx9yKjsXDbGubqL9xUy
 Na129WZBAVd1+6/WYGDSjE8IpvqnY/TXFy4YTji/1eqEhJQmfcuAdcOPZ60v3iP5iOi+DU7PDIg
 Rvr5R+5zlljkIXtBRYHb/Tv/P4ZzJm8veYNZXMLqzxt3BU5Xq/dJAbJZiypyMhDvhq/iqZytqYp
 WuKU9THnJGPukVMvg82GSIsLPQs6aZu6s3ztX6THulLn94UEx6iN+YsqVOCxfQDh5YyZ0e6mNhc
 0wnpltuqgiLFuGJ7z5AOYau1QCf+K4hGUOVOAEnGd4C6kpgI7OkAS3lO9h+dOSFde2eFWq8LSYE
 vvZbs1CbiOQwQot+aQMG+efUp30VZmiEUrBjjLIXnO2sQtyJEGq0hFbdYiRmY61G3X7GB2QWgrJ
 sIUL1HQ0Tzi2s894IWElqYaHdD8s+x45ln0hhM8OFa5iq5IsBtYNBaGPIng+X1xkCY7cWEFCy36
 zvSvnNljgOIr0GA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the DBus API as well as gpio-manager and gpiocli to
the README file.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/README b/README
index 658a77e..80ad939 100644
--- a/README
+++ b/README
@@ -229,6 +229,70 @@ C library using make, they will be automatically configured to build against the
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


