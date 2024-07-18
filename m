Return-Path: <linux-gpio+bounces-8279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE50934AF8
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D0F1B20DCB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973A482866;
	Thu, 18 Jul 2024 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0eFcTtwh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C190782495
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294980; cv=none; b=MdswmyddUlls1yXxHncu21DXb3fK5eio35UMgE/GWKZzwiieuhjuiR4pTk54M04QHB7GeoLHvKQAqiHBlWcAEPJL234vIthc0fwd5QvYiGMquAVL1CGndFS+SjfM92bN8F12xoClFdEo39ygMIzg+MtobTFdowXMSeQeh0J+AIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294980; c=relaxed/simple;
	bh=/EDtjJvffs8sg64U2HrL1mkcEvG/wUEFcxLZLY3e/hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkWeZVas49lGvayUvM6+6AdTYgTG2sJnZbvv0J70lNsW2SQ/jFTk66IK6iQILM7QLlXsEVfreasbPHOJONckha0oKt9a2lbWGW9CqhTyxemjGQSaFaVVPC9leJ0v4zkJiZsOn/qido2LdgTR9iQWcEMXo7ZLxOMkTR181Hf75zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0eFcTtwh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3684bea9728so408680f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294977; x=1721899777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q49o8v+yNYgKqaYVMhaz2bcVx44zynFpHWh8csewCjk=;
        b=0eFcTtwhPK3H5l3BFo8QsgvZZMFyT9Isx7vw8ktqwlPFoaDXfYv+rJV61dF/jr+yoo
         CATMcVJD1tBahXEqLA9G7y4pm/pKku/BWhWKtNNy4rCUCeFw4IhvsdEtdbtO5+XyVuca
         gfcVJDtaLdDI7Kc7mGPxxMpqCYt3A05sDDQHVFA9uGJSheZlh/boLF3Ncdj/8Z/ERBEo
         6xpXpQE4OLxP+JdoUJAfQHmefLDmL/ssF/U00kbcwrxww3LJIHagDcv+xyDg3yu3KCvU
         F/0GMAzu1VjD50NHBueBnbUGIZWBxyWeBBy1uKTT2fbuz+3iGYef9V9JQNQ0w0GM7fYx
         LFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294977; x=1721899777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q49o8v+yNYgKqaYVMhaz2bcVx44zynFpHWh8csewCjk=;
        b=CplXMZT4pmSWmfmQiKgAPzhpRiIkelLAjlDqhfmkLeTN9SyA8FWqmCyfs7D6ozgW9X
         OcOok7XpN1IzbkKBzGiSymcF0psWT8N9hR9yHvBi9CN6208EQqglWebHI+IMtpjiDHcl
         Xoau7ah6ABTr2+sDZMFE/kIGy/UhfbRfQjFcmpT5LuWijL8khYOPsHp2yzDB2Epg6j8M
         BGwsCNqKr03nzUT+YJltD5XrbGFIbk1hTXS21JCbHTrb7uVVG8iDC29FZmf4/v3mzpif
         7M1Q8AVQgPS33vLQ5+1W9sB6OpNmPAGYTcFDGWAcbSPphaGn0Xmj2P9ghKi6IgpHJjsu
         umyg==
X-Gm-Message-State: AOJu0YxLsIcrK0rUkSfFYoVSBG6El1JIIa0+RPeYmNVVdeTJoKcVNFL6
	BhCknSzoEdNC7g9rGo2hYGBVDDNbgamNPKp03rKu4mWMAHtF0f595UBBflhu7tc=
X-Google-Smtp-Source: AGHT+IG2nwp5h91Rc25c224GHt8IYPkT9nbx5gmt4Rmno3FMfaYDue5mBv305dlaNI04LNxyCF5uTQ==
X-Received: by 2002:adf:f042:0:b0:368:3f60:8725 with SMTP id ffacd0b85a97d-3683f608818mr2447133f8f.39.1721294977161;
        Thu, 18 Jul 2024 02:29:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:29:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:11 +0200
Subject: [PATCH libgpiod v3 17/18] README: document the DBus API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-17-c9ea2604f082@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SmKNzIGpto8cv6nHULL3j0Pa2cAQp9ug8O+Ii4AtS9k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBB44waICFBWAwVkn0HcvY5/PPFUFkwjXWWS
 vWhikyiy2CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQQAKCRARpy6gFHHX
 ckVhD/9k+q9tdtgZ6EjYS2UP5sb8RCKvSxJcjQB7iOFl3y+0Ct98qus6nK+E4DWyAatOTU5IEOK
 KQyJ3Q5dAGmD5XMq4fgoT3hcEf811JRCPCsNvfJ7MT/xuy8m9AG3ic8hwZDzcFWDcaERUxM3ejn
 601z3ibvytWKAnfe+gwDMkLPykZh+MmpbZrcIMan/69ZxDb5+cMVFV+8Oub+br/LjwaeFFaiqpe
 Tj68c9fnoVvbAhYAslRWyEH769dzC0+ZX24Q80Jg/5Fj/ifhZZFTlf510TngZakyZ0pLbLSsBcC
 rAEFKztBOuTWUyABA9s9dq30xeWeEpUxJRKvau7P3dUj4YmiDtZzXBU4dzKTISGQ+EZPX3+ZxEq
 9UyH7gZ9V42N5zLN1w+BtERrlU03U0u1TczaucobykSVwKL/YJ7xGf6Yx64UUmjrpuRcH5VBnuA
 aNs1yBHNFq/ze1D/CBcumArhnwRwGB5PzUfyzrDGqoM8OFdCBkLAyRLT3TRkOsrjmJijKg7yW4E
 NOUhZxt/4tfiiD0uviNU69LWcIMcfU5CLgvIanH5xmM7C2KeHmltk7grSD8erfAQbxQb4BI7FUG
 Ybe8rT5t3DRjDieAGjyV2uiRWKVo3Pd+sH75WmYjZoijFBRVg8c8UJb1Bj6v4OL7QzadwY1pYM8
 ++5NFVgnG32Q8CQ==
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


