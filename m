Return-Path: <linux-gpio+bounces-5427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE18A2E3C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCEE1287B98
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA9756B71;
	Fri, 12 Apr 2024 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ieGkiXQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DABC5676A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924915; cv=none; b=q+TT96yrICuyqqhluoZj+VjzMzEpY+qgzOIRNlxaFJRK6SbywRYFj/AFJDkQ5XWU/aJHOs45KnNunwG/lifT4fD7EGou1aWtHKcOZexZXCYY9V8jsvMzAqzfHvwBO8TQZyT4tF/Ei0w56T6N0DIigUf7jPr0y5WyoSQzI2zIkeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924915; c=relaxed/simple;
	bh=50yiy1dZKuOM9Ec549fDi+D6x7f6uBMzP6Fa9eWg0bE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DBxoLMWWRRHWVdgfKsIGu43Fr17gL2kxuaoooSfLwrNPsCS1ITAujB+8UaVnP4pkkWva7LdJR5VcuhR3aP1W6BtZ3ikumsUSty0bB0oHpLloYchQXA1qxk6Nj1tMXWGJTl/8/S5/RULRe6uYcNqz55mueXv53ty+Bh4tQOQOsdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ieGkiXQE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-417d02ab780so6326355e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924912; x=1713529712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eACkzuAfvaS/aS/DAeYx1cEWHgsVOFyEeHBfRfeG4CQ=;
        b=ieGkiXQEQOUc1YdT819NshR6alMv38ylMaSpLggQ8cJZH0cnKhQmVjaQ/DwpGTMlu+
         K0794wuvxZY5WMQxkBOqC69Alk9DV7sSIOXM3FDGkzPJOHuaiFngWAqc0xLKYpfu1BI3
         UFpxXr6O8p2PmTJ3RwBQGcloh+cl3zqMdSubpgoSHMsN0al//oaiv99Uo3f8pzbXpJgr
         KyZg/subZWvTBO5+RBaGzsaWxBO654F2VKlPC5cy30sNCh5VolxqPYfSxjs59dG59UCi
         BgyhXLvOifRlVEWtILWxGUfFscg4UoZkjfs8nJZW0Eyrf/s87DrlCMwpTY6voJ9eKXsc
         L3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924912; x=1713529712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eACkzuAfvaS/aS/DAeYx1cEWHgsVOFyEeHBfRfeG4CQ=;
        b=qTLAzO41J1zDiusc9XSKQqn8LfopI6N33j3ByV0KAYUQGRDFJ2LNmWfd7jX2vWLxFG
         FUTqMXeY4EF3pAP1Ys2WxirsSv7+Ihc8QDSHUGx2ung69U5j/H0oFahkLmk/8gDMjJwa
         RQnQb8zplPSgibbDLuvRIKnULLQrPfNlS+4F9lewBj1hgzbLDMu3+GdR8eob1WW2uQct
         8WmnvRbYqN16Dh1iRwj/fVY7oaOHKtDmEL9e5wzznu2OyeDTLp/GEznhyBJo9HpCp1hS
         RfL+YhGFOviUgHeyqZ+aBWPT6Wp3l0KIbiFJzKLrk2qSzVz/QmtXq87/a2W8R8WHP5gu
         Qs0g==
X-Gm-Message-State: AOJu0YwldD39FeZBwsO9LSBsUgUDj409GeRLc6RDWHIyfEKJQmCtzdMY
	0BzCfbfUUNyCdi980IcpeHA1RzOwYz68yectEUsEcxOtGy5l0s6YMczX20p5YGg=
X-Google-Smtp-Source: AGHT+IHtCO7Q4g2wcd1PniU3dpFz5tgR/uS6DMEVChqyu8Gk14WDGafg0Ks5x0Mt5SAayjTg5PJLBg==
X-Received: by 2002:a05:600c:45cc:b0:417:bc16:b8f1 with SMTP id s12-20020a05600c45cc00b00417bc16b8f1mr2175967wmo.12.1712924912061;
        Fri, 12 Apr 2024 05:28:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 17/18] README: document the DBus API
Date: Fri, 12 Apr 2024 14:28:03 +0200
Message-Id: <20240412122804.109323-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the DBus API as well as gpio-manager and gpiocli to
the README file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/README b/README
index 8e1e1c7..54f2df5 100644
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
2.40.1


