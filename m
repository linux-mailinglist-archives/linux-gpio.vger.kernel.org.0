Return-Path: <linux-gpio+bounces-25502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE127B42059
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D00141BA802A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9A330BF53;
	Wed,  3 Sep 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="23bjy70R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844230AAC9
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904529; cv=none; b=AAIH+5Jj7q9uSkr3PohgYmXotAOQev6OPhDoQkZ6QGC4ajV0s3rRGGZ1Dubx7wJ6PxJE16J0tpuxYkd78nlNJCYPE8dUVnx6D50UBYAH+5G4hTmAO+00x3iwn1lqiF/Ad9JK5/zdjhTkK0r6BDVxOGuqPgBG7gcwWt80ZUhIHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904529; c=relaxed/simple;
	bh=toTIMZSbbkxh+oyynXt6VyFwufEpwoU1ASqeGDpMkrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rUF5GNUMx6BgCskzxc9gG5AFnhv8n5HyexkksNFV+55EVaQy+dzy/TXM6XXC3W3rOjF5cw+QCiFthg5V4xIqTWVcgQBkUi7Rp73WqfEdlG1svvrSQht6glY6Nwfna/9/fBucdmOMlf+SdTbHxjdNrfUO1mjBwanxkbrBfv1NaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=23bjy70R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b9853e630so17185445e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904526; x=1757509326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nf7YNj4PtLSFvmTBNn272NjPza+p8IM4BoX+jI61u2I=;
        b=23bjy70RwDwYGaUoXmja8+2ABMLMTGwZvzriI309zKhDb0NUH+5eJeU3Vf2iDo+1oX
         DrS/IEyurIPFCSdP06ImL6HyFRIJhmpZ/HDWRlt93RE1hGP1IlzltSgxIjkqfFTXwj8j
         8KuiREDCIMtEqogzm/JUXSaAEOcIy5ozqbMPcvGNvRQ9wdwL20JkSL5g4POSooBflhO6
         A7ictu6S5bQ4cpWt0LKJYZ8iVLQq7siA7w14hvYdouYN2SZ4W9XHbdQATgYsXc2JMbLv
         TnoQf0skdUHc6vw31mGkOiZF87+M07u2RI0KVJjyWG8SBKQW2gp92gc6JKBHSltw++Pj
         u/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904526; x=1757509326;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf7YNj4PtLSFvmTBNn272NjPza+p8IM4BoX+jI61u2I=;
        b=eb8AYFZLSxh5wUBdTJFtBQTKZJDmqMTPUzbXTbVzMIqiFiv8+BEgfvzNnzGA6dkd9m
         tOUY4J1NmsTahY98hedqKqB/BnxKB6vreYOy2YUX/im/SuiKVUrQ8KXwO+uPi1nit8MR
         dD2vqh5Q8lBHPTQt6hku4iL1XoT8cfdPOfJb66/9cDKLO+956siBzpg4zy5daA+B/+uH
         nQIMDFivnW1N3ld5vWHV0dV1ha44uuIPZwO5VsPDXyeF91Wm+0aaa016ouqd/7yo1R+M
         yj9XdEYZb8hr49RXAFKf4G3wR8dA5Qun1xJ7O3hhV7ciyz6pP4C/DIiBfUYeDSJmZfRX
         u9vw==
X-Gm-Message-State: AOJu0YxXb13cU7cTHMxrPKhYDQDaNSSXhDoK7F2LgtTA6GIC728/Un5O
	bjPT5z4aCmcChXvykcqnTATl7i6K+ktFC3NG3iObo9oR2wdb57IG6ZbgIuviTm35ADQ=
X-Gm-Gg: ASbGncvi3wXXWTuoJ/qHFSVKyJslD8ZgoSQ4KO3nwc/7LgPGh01liyYGafvBIrbqSnL
	hU/mxd11TFXud1VNSN0ltSZurOn/wczLWW+9vra9y5IKFfxDjuJXHah2PQQsMxZJTEd4AZbhfnQ
	cDkZRoXJzLl85zrRbtuUseeiqUFbQfZsgAQT5hsZwi/gyf8BqbvVVBDjPN1u/5DV37vCZvmliXi
	2EIB64ugtKGIT2eu560x7ToUH3t8hBH/fvGNPAXpUZXfazK4DmkPfeWPDVKzwPJkQXNzg9+kdNU
	TZi/MCcfEDy0ScYjufcrOVyyNcpIm+M6BTYrCa8qbVFEm9ILW7nYGuIElMcl6Aaii/D5bEo85N0
	joYYkOry8/1ugM/Ydru10aQ4aoJM=
X-Google-Smtp-Source: AGHT+IHgWzNq6Bysto8i3U+aLXJIzgrGT5xF2zQnF+iArMx61OeslvmIpDqb38lueeRx/FgNPm4nbQ==
X-Received: by 2002:a05:6000:2c06:b0:3d1:c805:827 with SMTP id ffacd0b85a97d-3d1dc5a2113mr12987932f8f.5.1756904525376;
        Wed, 03 Sep 2025 06:02:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/7] build: detach the libgpiod API version from
 the libgpiod package version
Date: Wed, 03 Sep 2025 15:01:58 +0200
Message-Id: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEY8uGgC/x2MSQqAMAwAvyI5G6jFrX5FPFQTNSBaWimC+Herx
 4GZuSGwFw7QZTd4jhLk2BMUeQbTaveFUSgxaKUrZVSB1glG9p+HxKedVqwbatm0JVXaQAqd51m
 uf9rDJuPi5CAYnucFh84Ia24AAAA=
X-Change-ID: 20250901-api-version-detach-67d8e984d529
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=toTIMZSbbkxh+oyynXt6VyFwufEpwoU1ASqeGDpMkrE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxHH0ASwkEX4k1IeMCRzMnokir5ptRG6QI7m
 fq/oeleA8+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8RwAKCRARpy6gFHHX
 cofTD/40HBWZS8FaXTVQ2tQfHn5LXj+8yz5UEonxTDbRwNkttFilOtaDp1aDpIkvAjN4P4/Vvcp
 pwXMWRby0rh2JuLKt3mHLS+X5M064Cr1upF+3eg+7HAH7DlDKaIeCHiQD7/ZZoifPGWCJkSt1gg
 c4Pl5Mu4LzHLfu1tYyFabEpE3eh9wvamUUkWh6ARMMU5GPixFHFXFq5hd4hbwmS9bQZXW+q5Z9U
 p/pi45TBiKqJdg/CaIOJgRwC3s02+OVeU5h/VZGW1F4WyMBK6GJa/UzrFQGLHjw2RTu9E8F6DSZ
 P4kVWtGQf8JbBKx2VKsctmKLw4tOrAbmHE9CfXe/M1ppROz6236K+U0bGpT7Gk456tYtPU9+Uac
 O3nvIm3jh/rGci2Y7aqiA5QVcbAaI8vnMxLLxZWH6Uu8tv5L49y2kTzC2nqZfRA29NvZHJGjHS7
 GxAaf2oDC6J7GyBhMhNLLcWB5o4CqDpG2Xsj/qHjuJGxpD30a1VF/iWp4/8lggmMBqwRQS4+J4S
 UdtM093QC4MroSl/lIaBKTYszGLU6r5JUcmuldGLz/5LkyqQJytK/W4x++yDyHYWoduR5D1wJKW
 HIxIQWsTkPOqFC9Evk7e8PbSfp9aLT+e+6mcgv1hdyKy2N9QkJx6NtciyO0oXG0vfr7ZmRqrV4i
 L5UkXJs6JdzVShQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The versioning of libgpiod has become quite messy due to the rapid
evolution of the project in its initial stages (which forced an ABI
version change without bumping the API) and later extension with several
bindings and tools kept in the same repository.

Currently the library API version and the package version are the same
but we're at a stage where the core C API will most likely remain quite
stable but we're still extending other features of the project, like
the DBus API, tools and possibly other bindings. Bumping the C API
version because we added new features to included programs makes no
sense so this series proposes to detach the core C API version from the
libgpiod package version (except for the major version updates but I
don't expect there to be one anytime soon).

The core C API will also apply to C++ and GLib bindings as they track
the C API closely. Rust and Python bindings already have their own API
versions.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (7):
      bindings: cxx: move misc.hpp inclusion to the correct place
      build: define a separate API version for the core C library
      core: change the behavior of gpiod_api_version()
      tests: update library API version string tests
      tools: display C API *and* libgpiod package version for '-v'
      dbus: manager: display C API *and* libgpiod package version for '-v'
      dbus: gpiocli: display the libgpiod package version for --version

 bindings/cxx/gpiod.hpp                 | 1 +
 bindings/cxx/gpiodcxx/line-request.hpp | 2 --
 bindings/cxx/tests/tests-misc.cpp      | 2 +-
 bindings/glib/tests/tests-misc.c       | 2 +-
 bindings/python/tests/tests_module.py  | 2 +-
 configure.ac                           | 4 ++++
 dbus/client/gpiocli.c                  | 2 +-
 dbus/manager/gpio-manager.c            | 5 +++--
 lib/misc.c                             | 2 +-
 tests/tests-misc.c                     | 2 +-
 tools/tools-common.c                   | 3 ++-
 11 files changed, 16 insertions(+), 11 deletions(-)
---
base-commit: d0006cc3d57b0e8fe090a1596934340c34e69ab4
change-id: 20250901-api-version-detach-67d8e984d529

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


