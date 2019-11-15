Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3834EFE057
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfKOOoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:18 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45]:34317 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOoS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:18 -0500
Received: by mail-pj1-f45.google.com with SMTP id bo14so84641pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sj+3pEIt9b7NINms2BIsFgDPXEg4iV0iywUHScFaTrA=;
        b=XBQN0zK5ObFc5aBLva0UHZKC0OFwG855zAiyarK0DmiEziSs4aj5YCdBxfwsm/7r/i
         aw02/yB8o8FvYZt62orRJ+LF8E+vSdGVtTTTJ2ZBpXARkX2v8ZflHT9lDqqBzzRl3v1h
         SL7bAR6x2ArFuB/Y6x2VVtuQWtqqEWm37p7lExTe3oJMOPHlg8zfLLfDpmSGAbccHu06
         8oinqynYU0txQqo2nihYRehwf8i6NV4n/txtVPVM1KCOXtHrNBL8AD4Sgu2LZFcijg+5
         wBTHXIuidB7LKZJ2aLMjAXlD8rSv5tnvWe7kDN8FhoIC005GiZPhItvPKmp5gAW+/xij
         uemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sj+3pEIt9b7NINms2BIsFgDPXEg4iV0iywUHScFaTrA=;
        b=EZaqMr2wvt4wYf6O3Z5UeRvN2tw4xIvbcCeI9wE6Orh+xsHLRAeZWbVAg2yAtZNsF1
         4sfUYBdk1uNzBAIyFfJROKo4+WPdlznuwhjcF1eyyJ/TFW60hxKAzJD6C9tUaD5+k4C+
         ZxJMMKniIGkvVBwLMTyRDvt7SeHDi9br+oCBQZnbfqjJ/9ToU3/M/Rf8Uwe5oO8RyoxV
         q66CsxGSr0mU31SdVjYFPEsRNKXNHy1x3vvn0RL2AVAo+tuQ56C98cnTutHKqYDq7Gek
         azaPWfuO00+yDga+Uu2VCzIUH8CiXXGpHSTlKtSk5Uggnu2fJNKdbx/KXwq77H3Pp7h3
         HUvA==
X-Gm-Message-State: APjAAAWZyvlmt+o838JU14N52QFxLZLu0e/+63RvAA/k2wtT/e9oGqX4
        9M1UH8UzlIM1yDUzAhgY/5umVN9gdas=
X-Google-Smtp-Source: APXvYqwQGgiLu7t3kLXFP2rERAdXd23xkbOcNUKVtZxW6HK1OrepKHLpOxxxfbXnqdVdGcoEOVYWEg==
X-Received: by 2002:a17:90a:22a6:: with SMTP id s35mr19525328pjc.3.1573829057010;
        Fri, 15 Nov 2019 06:44:17 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:15 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 00/19] Add support for bias flags and SET_CONFIG
Date:   Fri, 15 Nov 2019 22:43:36 +0800
Message-Id: <20191115144355.975-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series adds support for changes to the GPIO uAPI that are on
track to be included in the v5.5 kernel.  There are two components to the
uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  This
series adds support to the libgpiod API, and to both C++ and Python
bindings, for both of those components.

The libgpiod tools are also updated, where appropriate, to support the bias
flags.

There are a few additional patches that serve to restructure the code to
simplify subsequent patches, or to fix minor problems discovered during
development. These patches are generally adjacent to the main patch most
relevant to that patch.

The series is based on the current libgpiod master@9ed02fc.

Kent Gibson (19):
  core: move request flag to handle flag conversion into a separate
    function
  API: add support for bias flags
  core: fix misspelling of parameter
  tests: add tests for bias flags
  bindings: cxx: drop noexcept from direction and active_state
  bindings: cxx: initialise bitset with integer instead of string
  bindings: cxx: add support for bias flags
  bindings: cxx: tests: add tests for bias flags
  bindings: python: add support for bias flags
  bindings: python: tests: add tests for bias flags
  API: add support for SET_CONFIG
  tests: add tests for SET_CONFIG
  core: allow gpiod_line_set_value_bulk to accept null values
  bindings: cxx: add support for SET_CONFIG
  bindings: cxx: tests: add tests for SET_CONFIG methods
  bindings: python: add support for SET_CONFIG
  bindings: python: tests: add tests for SET_CONFIG methods
  tools: add support for bias flags
  treewide: change "correspond with" to "correspond to"

 bindings/cxx/gpiod.hpp                 |  85 +++-
 bindings/cxx/line.cpp                  |  60 ++-
 bindings/cxx/line_bulk.cpp             |  95 ++++-
 bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++
 bindings/python/gpiodmodule.c          | 469 +++++++++++++++++++++-
 bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++
 include/gpiod.h                        | 303 +++++++++++++-
 lib/core.c                             | 250 ++++++++++--
 lib/ctxless.c                          | 115 +++++-
 tests/mockup/gpio-mockup.c             |   2 +-
 tests/tests-ctxless.c                  |  64 ++-
 tests/tests-event.c                    | 120 ++++++
 tests/tests-line.c                     | 522 ++++++++++++++++++++++++-
 tools/gpioget.c                        |  24 +-
 tools/gpiomon.c                        |  28 +-
 tools/gpioset.c                        |  26 +-
 16 files changed, 2561 insertions(+), 71 deletions(-)

-- 
2.24.0

