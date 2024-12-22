Return-Path: <linux-gpio+bounces-14137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036489FA7DE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0952818864B6
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0682418E054;
	Sun, 22 Dec 2024 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yAikr22E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C638748D
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898101; cv=none; b=rtO3sLdTpL5YBc+MhmwEZFhFNuROpXe6Hn4TBNLkhBzy79uR0N6+uZNElMY9YJDqrZJGHZfCwfqKdQKXp2fpsj61zk/sEYFztPHPU5Wu0etAQzw/t0Wz5AgtN9VuB1ffuKqe9V0XDWhA4TA7V7S51wpKGE4LJQIIlT/kDdEtsx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898101; c=relaxed/simple;
	bh=2VRYcLBRz+9bS58Z/Hm/zNlCMXPgishD3jlgx4sukJM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OXbKV9k6lJ/9IdGg7RXOFJpdc4uABm8VsRwwCGeUm3d4v4t67Nfim6cAgnzOg2jS4n+28mZGm3fiJdYme1I9g8Jt19136bDP+vcwzFMDN3K+49lRphmAwVuoHfXo1sGsn8jNym63g2xohT/tfiFP6kh8jk21dLAO/yJ1Qeff8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yAikr22E; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so1631108f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898098; x=1735502898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNq+nyWCph0O9/pM4822vL6miPAMomMEdhPtyapoWUM=;
        b=yAikr22EJK01xBPOY06u5tvXuEDAvALDVg7D/m+e0t/IBAfBMNQ7Hz/ALAVLvMQRF9
         JVMQ0k1YMBGC27b/PXRkKVRSQirMfGwanrlHxL6vQaPZlN9fiY0KwU+2YH0rJ7TrUlRe
         248jrl1k9LKJdte59zy3sSodYGcqC9G6VZM7aOO21iehwf+61sLoPfIjI1VbopWLgze3
         huT7W3fwaJ908OyRBr6plKcCKg9UOrmWP78rd3RTwsYT6cSpb/eoaY3zAp+IbDHwDp15
         ZXZDDKXElSa1EIcDGwbbXqhq/LsL9MHOYMdF8zcvIFQtI2nOo4nAxS9pXd9hI3eh/fFB
         G1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898098; x=1735502898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNq+nyWCph0O9/pM4822vL6miPAMomMEdhPtyapoWUM=;
        b=UdisifiC68fjsyK5BMCvaE6qGWlNCpZVkUtQHeXin9FjCfDTTdjx7PUloLTYXnph1C
         XDanx/cyBahvEuAsMVmrTMzpQrG04SeKURlFx35gyMoH/wKTy1l/pbM9u++9aN8R4+G5
         t1CL9+DcqV4bNuHgFkMMoJ6c2CNnhHanN0Dch0NjhZe6ypTO2v5snNY1UoimlsrdlXG8
         qt6KWnmxdrsBHn5klSbt+D06Uljc/KRHv1xLczctxmRY1eV0ZZ90vATxuR8zdi1UP4Ch
         pzvqMw/XXJ4sL9M7RnQIuBvq137HehEnKgpdcFk9cSCVv/UjrtzhdxlJCgrSrsr6HPSK
         6xYw==
X-Forwarded-Encrypted: i=1; AJvYcCU28gQd1092F/jVNHEy1/Y7TWYcOZuy6s4la9o1CzzKEK9amrmG77Hq1pxAYn/wnY1pqJ5GiRdkh6D2@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnSv+TsubxhwYPBOI3LHo8jMaoOWVrbR4ofpViTg97Q8yngGH
	TrxVNFRY3gZvlh4WMK18gyYB8wc73UFayeR5KXu0aDqtnZSQ4G2Z9TJMWMCCeLs=
X-Gm-Gg: ASbGnctQBa9e1txYdWEGJaLah5zZhb0mCUSPCRZ03hcelwtmCYeCD5KN52bRc/8Jawt
	cFBLmQzZp7RV32zYmVtSttwoqoNHJf7L493CUBER6N4Ma8hVDbxZnJYMi6N4FFx7ylOU1vF8mn0
	+yzqroBwrOKaSTkirnqxEpCfixh9WzuvdC1HJlfruPzkO4UVsqMtoKerPBKAbsCJ9PlX9kykyI1
	OTEvls+4ZEp61KSrnptvfdb08ES3POM9LzLlwNNw7s73p2J
X-Google-Smtp-Source: AGHT+IH4fnbbl906oYAGOAsXWJlrwkqr9bJtzpzwqk+wG3TQCmauHPvwOmEeN3RgKZhi1Q8HLQSsXA==
X-Received: by 2002:a05:6000:1562:b0:382:5088:9372 with SMTP id ffacd0b85a97d-38a223ffa4amr8944811f8f.43.1734898097529;
        Sun, 22 Dec 2024 12:08:17 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
Date: Sun, 22 Dec 2024 21:08:05 +0100
Message-Id: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKVxaGcC/1WNQQ6CMBBFr0JmbQ0tplBX3sOwgHaESZAhU9NoC
 He3qSuXLy///R0iCmGEa7WDYKJIvGYwpwr8PKwTKgqZwdTmoo22ip6bcEIV2EelHYbG2q51toE
 82QQf9C65Oyw0ThtxgD6bmeKL5VN+ki7+lzT1fzJpVavWubGzzumA/rbQOgifWSboj+P4AhuxM
 OCzAAAA
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6583;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2VRYcLBRz+9bS58Z/Hm/zNlCMXPgishD3jlgx4sukJM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGuwypSrWILz/8KtKo6OwWDiCxYQ1Y5Jgn5/
 vGIqZZMspOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxrgAKCRARpy6gFHHX
 csAhEADbrTIDouWC6iSTxvlrZxpksNGsBO7GfoSfh0cXr4EEt2gulLAQI2KFkr7Ketex9ahLYwW
 xEWVYW0rX+02kp1sbJfpHdj9mxYNNbL24zIZV5dmutIeXc6U38hLWm28PfuZqWpxkH/vSP4FiEQ
 jUDS7HuWu4jZQL6b3SrKQi0NJWuN0nV+/CNdFOjxaERAsInjNrhvVHP+uiSi8GAOSTDi/uLYim7
 Y42gxprZIgUr7aWBeI2BsiZDODJt/2522YvT32nIMmlCWen2Dk97ctwKUrlNmC2KFb8SSQ3h7Z4
 21z8R0t6m+HNmsQHU7gug7loOlEvHbf5Z5TkhysyyyoP8uAEnq7MYvQthHIEPhuXMAeMqjVqoZl
 CeXc3Sph73YcunbFpCXXFfninIxuwok9T0vA0zkVM6eyEnL+s3/IVwAjnkCEWbkpRGnwra8vDkp
 9qUvll6zUX3T6CmkjAroELrbIs0Qq7UCNfgsOPSzBMiPFqkp70UjJkthvgIkwN1WbFzTeMXLStq
 D/mMw1TXqtByD6VmENjfbL5wnaYGNFwN4ouP5wrPXCmzWbwJShUCi/w5t+sDH79tghizWgLU1jx
 yacifD7K1tUaMXSsjw5NyHLK1zzALVu+XvlXK5ucz0o/RMJSdbmf8GqnnhWh51qeaWl5TxRPiHs
 JfOdtUyVJ5noUew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

One thing that this project is missing is nicely looking, accessible and
automatically updated documentation. I'd like to finally address it and
replace our static doxygen pages with sphinx docs.

I spent some time playing with sphinx, doxygen, breathe and exhale. It
turned out that exhale doesn't support doxygen groups and I really want
to have them for the core C API to avoid having to manually assign each
function to a specific module. That means we must use breathe on its own
to integrate our existing doxygen docs with .rst.

First four patches in this series address some issues with C++ and
python docs that became apparent when I started integrating sphinx.

The final patch contains all the stuff sphinx needs to build us a nice
website. If the RTD theme is available, then we're using it, otherwise
let's fall back to the default theme.

Eventually I'd like to extend the documentation with examples,
descriptions of gpio-tools and DBus API etc. but first let's agree this
is the way forward. For now, the docs describe libgpiod, libgpiodcxx and
python APIs.

I allowed myself to publish this branch on RTD for testing purposes.

Once this is merged, I'l backport these changes to the v2.2.x branch
so that the documentation for the most recent release can become
available online too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- update .readthedocs.yaml
- add requirements.txt in order for rtd to install breathe
- mv doc docs
- a couple minor improvements
- Link to v1: https://lore.kernel.org/r/20241220-improve-docs-v1-0-799b86991dec@linaro.org

---
Bartosz Golaszewski (5):
      bindings: cxx: doc: remove the gpiod_cxx doxygen group
      bindings: python: doc: update the docstring for gpiod.request_lines()
      bindings: python: doc: make code examples appear as such in sphinx
      bindings: python: doc: describe undocumented members
      doc: use sphinx in conjunction with doxygen

 .gitignore                                  |   2 -
 .readthedocs.yaml                           |  17 +++--
 Doxyfile.in                                 | 105 ----------------------------
 Makefile.am                                 |  57 +++++++++++++--
 README                                      |  12 ++--
 bindings/cxx/gpiod.hpp                      |   6 --
 bindings/cxx/gpiodcxx/chip-info.hpp         |   9 ---
 bindings/cxx/gpiodcxx/chip.hpp              |   9 ---
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp |   9 ---
 bindings/cxx/gpiodcxx/edge-event.hpp        |   9 ---
 bindings/cxx/gpiodcxx/exception.hpp         |   9 ---
 bindings/cxx/gpiodcxx/info-event.hpp        |   9 ---
 bindings/cxx/gpiodcxx/line-config.hpp       |   9 ---
 bindings/cxx/gpiodcxx/line-info.hpp         |   9 ---
 bindings/cxx/gpiodcxx/line-request.hpp      |   9 ---
 bindings/cxx/gpiodcxx/line-settings.hpp     |   9 ---
 bindings/cxx/gpiodcxx/line.hpp              |   9 ---
 bindings/cxx/gpiodcxx/misc.hpp              |   9 ---
 bindings/cxx/gpiodcxx/request-builder.hpp   |   9 ---
 bindings/cxx/gpiodcxx/request-config.hpp    |   9 ---
 bindings/cxx/gpiodcxx/timestamp.hpp         |   9 ---
 bindings/python/gpiod/__init__.py           |  15 +++-
 bindings/python/gpiod/chip.py               |   4 +-
 bindings/python/gpiod/chip_info.py          |   5 ++
 bindings/python/gpiod/edge_event.py         |   9 +++
 bindings/python/gpiod/info_event.py         |   8 +++
 bindings/python/gpiod/line.py               |  20 ++++++
 bindings/python/gpiod/line_info.py          |  12 ++++
 bindings/python/gpiod/line_settings.py      |   8 +++
 configure.ac                                |   8 ++-
 docs/.gitignore                             |   5 ++
 docs/Doxyfile                               |  12 ++++
 docs/conf.py                                |  63 +++++++++++++++++
 docs/core_api.rst                           |  58 +++++++++++++++
 docs/core_chip_info.rst                     |  11 +++
 docs/core_chips.rst                         |  11 +++
 docs/core_edge_event.rst                    |  11 +++
 docs/core_line_config.rst                   |  11 +++
 docs/core_line_defs.rst                     |  11 +++
 docs/core_line_info.rst                     |  11 +++
 docs/core_line_request.rst                  |  11 +++
 docs/core_line_settings.rst                 |  11 +++
 docs/core_line_watch.rst                    |  11 +++
 docs/core_misc.rst                          |  11 +++
 docs/core_request_config.rst                |  11 +++
 docs/cpp_api.rst                            |  33 +++++++++
 docs/cpp_chip.rst                           |  12 ++++
 docs/cpp_chip_info.rst                      |  12 ++++
 docs/cpp_edge_event.rst                     |  12 ++++
 docs/cpp_edge_event_buffer.rst              |  12 ++++
 docs/cpp_exceptions.rst                     |  18 +++++
 docs/cpp_info_event.rst                     |  12 ++++
 docs/cpp_line.rst                           |  24 +++++++
 docs/cpp_line_config.rst                    |  12 ++++
 docs/cpp_line_info.rst                      |  12 ++++
 docs/cpp_line_request.rst                   |  15 ++++
 docs/cpp_line_settings.rst                  |  12 ++++
 docs/cpp_misc.rst                           |  16 +++++
 docs/cpp_request_config.rst                 |  12 ++++
 docs/index.rst                              |  28 ++++++++
 docs/python_api.rst                         |  31 ++++++++
 docs/python_chip.rst                        |  12 ++++
 docs/python_chip_info.rst                   |  12 ++++
 docs/python_edge_event.rst                  |  12 ++++
 docs/python_exceptions.rst                  |  17 +++++
 docs/python_info_event.rst                  |  12 ++++
 docs/python_line.rst                        |  27 +++++++
 docs/python_line_info.rst                   |  12 ++++
 docs/python_line_request.rst                |  12 ++++
 docs/python_line_settings.rst               |  12 ++++
 docs/python_misc.rst                        |  13 ++++
 docs/requirements.txt                       |   5 ++
 include/gpiod.h                             |  36 ----------
 sphinx/conf.py                              |  68 ------------------
 sphinx/contents.rst                         |  24 -------
 75 files changed, 824 insertions(+), 405 deletions(-)
---
base-commit: 38adbae195555fae2b9d9e2a37c9507af1114757
change-id: 20241216-improve-docs-19ed36687963

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


