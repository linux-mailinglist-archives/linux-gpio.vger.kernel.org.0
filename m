Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70AE7104795
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfKUAgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:19 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:43350 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAgT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:19 -0500
Received: by mail-pf1-f177.google.com with SMTP id 3so669683pfb.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vKpzKlZ6/i4VjUJ1bjeLTlQb2ZJfj75BggY+jjwiTw=;
        b=dIt5+wIxDYbSzim+l2+NDe+Q2wWO5bfsRKbsSN4DTffPWGGvqfE/3omwdg+Wp4WN5h
         a5J3EKRIr1wFptyCY0D+vTRVV65SqbrpKNZct1olxYg954rmJ9ItSKrMtjVD8LWmOKrB
         NfLB6ObZQOOAa3FsMa3zR75P8cANsA+9UHwiKRT25quyI/8r66aCLMuWlv2RRbdRRCWm
         UJQvxMsKO00a2u+9+57psCvJ7eDPFIiDLA6TGRHn9a1NxG74wvs8Xi2OY+eWzM+i3VfA
         Y1xDnobR9XBYHxVa74MtRjG1xv0QkS9ku/mvsi4vDMQuSHOldD3RRXm/GTFqv6ID7ioT
         KfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vKpzKlZ6/i4VjUJ1bjeLTlQb2ZJfj75BggY+jjwiTw=;
        b=SfEnK7h0GJQfDgqFlRw6plzCcNdhtQs7hBMxuo766NT7UzZK3a7NbWaQuHxIC26hoH
         4Rm2DJscgooUY1HJFLW39xvx6pBijEUaAUNT0GqKDBq86uToXEOen3ahWhZT36EEnIEB
         E31ovWwHOjhFRL6TmeOiO7qeqwCfKfa+1PTHPQD8tM98WNS4vYGEeT5nLF9ZcKUsIYiO
         NQL19Gk84xSSEZ/aiuyYJjjQF+LxhYLi2H9qhbAaTR7SDHJ4nwb/RJviuA6u/n05e0IP
         3+kCsTCSwaKmiwsS6MkoKUuNawmQ2K4uSjE6Mdil/k1y0j697o7ovBdYOhaLEEBgcWrg
         vPaA==
X-Gm-Message-State: APjAAAVaDlGK3D3Aqs6atmvd5IM7uvlUs0odPbg4Ddnqbnd4sVnHv3dG
        iW4S5npM2yk1O7NahSUP5ZUPA/cix9o=
X-Google-Smtp-Source: APXvYqwQoewR572OtPmcMdmL4SxwY31eLGucJ0slfzOy2PwuU9tNdKRCIReYj3OjCWEWUWlhZpdDNQ==
X-Received: by 2002:a63:c01:: with SMTP id b1mr6223063pgl.342.1574296577482;
        Wed, 20 Nov 2019 16:36:17 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:16 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 00/14] Add support for bias flags and SET_CONFIG
Date:   Thu, 21 Nov 2019 08:35:42 +0800
Message-Id: <20191121003556.9020-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes since v1:
 - address all v1 review comments
 - tools accept bias flag field rather than individual flags
 - add tests for tool changes
 
This patch series adds support for changes to the GPIO uAPI that are on
track to be included in the v5.5 kernel.  There are two components to the
uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  This
series adds support to the libgpiod API, and to both C++ and Python
bindings, for both of those components.

The libgpiod tools are also updated, where appropriate, to support the bias
flags.

The series is based on the current libgpiod master@bb3dc9e.

Kent Gibson (14):
  core: add support for bias flags
  tests: add tests for bias flags
  bindings: cxx: add support for bias flags
  bindings: cxx: tests: add tests for bias flags
  bindings: python: add support for bias flags
  bindings: python: tests: add tests for bias flags
  core: add support for SET_CONFIG
  tests: add tests for SET_CONFIG
  bindings: cxx: add support for SET_CONFIG
  bindings: cxx: tests: add tests for SET_CONFIG methods
  bindings: python: add support for SET_CONFIG
  bindings: python: tests: add tests for SET_CONFIG methods
  tools: add support for bias flags
  tools: add tests for bias and drive flags

 bindings/cxx/gpiod.hpp                 |  81 +++++
 bindings/cxx/line.cpp                  |  56 +++
 bindings/cxx/line_bulk.cpp             |  89 +++++
 bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++++
 bindings/python/gpiodmodule.c          | 463 +++++++++++++++++++++++-
 bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++++
 include/gpiod.h                        | 306 ++++++++++++++++
 lib/core.c                             | 216 +++++++++++-
 lib/ctxless.c                          | 114 +++++-
 tests/tests-ctxless.c                  |  64 +++-
 tests/tests-event.c                    | 120 +++++++
 tests/tests-line.c                     | 468 ++++++++++++++++++++++++-
 tools/gpio-tools-test.bats             | 139 ++++++++
 tools/gpioget.c                        |  32 +-
 tools/gpiomon.c                        |  36 +-
 tools/gpioset.c                        |  54 ++-
 16 files changed, 2666 insertions(+), 41 deletions(-)

-- 
2.24.0

