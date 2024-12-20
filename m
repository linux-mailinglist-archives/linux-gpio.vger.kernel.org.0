Return-Path: <linux-gpio+bounces-14088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA869F96CC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFD63188772A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BA2219A63;
	Fri, 20 Dec 2024 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vVIdOUOA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34F2594A8
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713194; cv=none; b=FDHf4ixSY/2r0XrqiWHuaTe6TJByjBViVaoDAczqEo8zIj9Y1D4phPK8q1mMUR6r9Zyullpufio4tRuLkg7TgFLt0SOsrsyobGqRDlDQl1EamBCnrdDFlx7kElUNJ2oSTHbLoZDcawUqGL9Vk9OwgBHQujNH3s8qRCGst25OrYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713194; c=relaxed/simple;
	bh=ZDAaEMBchWXRD/p3Eu8/qZ4EJnFus39hCmfjRd9Xq0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qd9Cs31nfTAI95T4xqwVByxv/h3gwveUiWHJUNxgy5nGOiabqcaJvkbkbqojo5oWFDeZpUiTVC9SdRdjms1jLGX+K4aZCXyw5euLjKw0G+99PTQAju2D/DFqtASUQJIgw+Af5XiG+dpaWg9sjjThChhshvveoFxIb/t5tOmbepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vVIdOUOA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361815b96cso14917365e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713190; x=1735317990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sZm88vCeDgWn5ferkc8FgvS8HVitchlk0jTBilf7BM=;
        b=vVIdOUOA7ulDS4XtcxaS3zNKYpZP9naBwhBpmUYlqRWYRzCdVx6GXbXukbofxhKgOb
         XrXeNPPuG/pvREDKM0pcZA9ByYKnVvQvutrrPj45Oia4Ai6vhtSYIAO5PHAwy2LtMjb6
         aH26yBYtcALH3rnfTnNDh/KwvggF55PRam0kFUZShIrsm6rbhVab2JWMk+vo8ZHuVIuU
         UZ4VFay0nsYW/nyoKNpuPRefXPdlnGl+T3PC+jZCk/bD2wXOxi7HsXCKm7LpBxRpm32G
         cl+D8jiGxqyiq9JMKUYx53lzTNuXscp+qJJLa2jAtYbMdz0DBB/rLALeQQyzvyXDF/fG
         3tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713190; x=1735317990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sZm88vCeDgWn5ferkc8FgvS8HVitchlk0jTBilf7BM=;
        b=Xs27gqqfoMIfH0BKp/GwbnPmT3FuCVrayD7oC8r/s5GtJsAeYj8nLCVPylpnI5h0B6
         Uz7s4G172J9cBGnXScl3lrEuOjc/yi3rkFMmIm+YddF4R02Jy0P0ttMfFb6LM8nkUr+D
         pWKSbd6zhiW5J0DhPc5pfhW+ztukaKzGrqxPK+2Ln+w1mWvA0DnMJrLQPNy9kxjSRRvJ
         z8FUv+Z6cZQWMDrZ/12yCO/7HF09ppZUHMqwqz5nuBeQd5wBkLQ8jh0zQGpKrMJ8rT4k
         5mo4DOuwdMQ8ucPI7dUV6kkoEz/ngkUAjoBAxAXPbwkVQCQ27XqTM4ngr5I01CsaFJ68
         QD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhj5534Goo6RXx8wi9BctjiVmwmSKPSgdOIa9gH2/LHYHGddY+b3MSq79+YYqRPYdJNX8qkeSuVZAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ydOU4njtsMm6zoDTAvMYD7iVvyb8p4WbptM2ODDEc9eFKlHy
	gHY2IrIvat1BOJ+fxERQZR+0aOFoUU5WUbQ2oSeKPOBUJ4pN9ez4wOe8JVFD1O8=
X-Gm-Gg: ASbGncuaORDQNAQh9K7nttvOkkU9Zuqzlt+XgQURmc3y1OGVLDVi7JETMB5YektKoJa
	wqEzN/xww/GOnOheAAPX1kB1Ku8iYCOC40zpraJFIAF7vWwAGL8X9ywmNfkNOBxiUVupXaHGMdZ
	evPgRIkMejZgWdD0tQFWYEGFmBw/B4k21eTeBwBX0U/1chdzYvyh5U2h2jIabVFyo0rNqQCCd/V
	DHAjE5vgaXi34CnqkzPSEaXqDTj2VHoIuwUY94mfHtGlPXZYA==
X-Google-Smtp-Source: AGHT+IFG14KiqeejJafjly+hS0v7tyWS8Ro5IDSIo2tBeor7n07nnfeObTOnPgtvWnwD/gl3fysDOA==
X-Received: by 2002:a5d:584e:0:b0:385:ee59:44f1 with SMTP id ffacd0b85a97d-38a221fad17mr3929059f8f.20.1734713190255;
        Fri, 20 Dec 2024 08:46:30 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/5] doc: improvements for ReadTheDocs
Date: Fri, 20 Dec 2024 17:46:21 +0100
Message-Id: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2fZWcC/x3MTQqAIBBA4avIrBtIC/u5SrQonWqgVBQkiO6et
 PwW7z2QKDIlGMUDkTIn9q5AVgLMsbidkG0xqFq1UkmNfIXoM6H1JqEcyDZa992gGyhJiLTx/e8
 mOHndA3sL8/t+liDpq2gAAAA=
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6204;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZDAaEMBchWXRD/p3Eu8/qZ4EJnFus39hCmfjRd9Xq0c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9ktju3wmaEynb36LJ/ust4zCvbHlQ0xHUn3
 TF2iwNovSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZAAKCRARpy6gFHHX
 cmJnD/oDpil0nA1/zTUAatjmgtDUiyiYWflP0iBWZyDtRppT3UUHBBNNFQnDCpeSTtWpf49/K3t
 eVRzkUm8hQtpfPPYKchqxfXrHBv4Y4rIh9GodhX+v2FHCXQQQk5a9nT99oBSFhgnyTa4OAahsNF
 7RQGXIHx9ixsK92nsjpRPobTxzH+yIgiqFn7DKB66hJth4f4hvxPUR7J6/qOduepY99WdEo9X3B
 6HEFyI9wu4S85ZZ97b1PJZAoDE4jDadjdw3ZNqtaNIc0pzb6C9LTv5rLr4X3PX4yJS9hUFF3wBc
 9w6jc5zUbDboScVAwsWvSEYiMsvUf4CMQiClVhhUxIWfg5pa5aL4Nj0ajGozDKwW3L83EBleFyt
 krOIuEgASGxvXLVKTc52kROi8+mnxyQMhA/OgCPYTSbVtzGyynuLluxDNmEdi2DltdNmsOOy0ji
 +x6FyY9hMFVaisR9EXSgQPzQG4p9TNoWy8C3KmltVQo785Imcs3U/7voH1xc8tgVXlSMdfANcYV
 YwAMpKoFpvsN6Ir5szmdIEQun6WMJ5N8e2rroUVr8c0ZWf0VnzhI8MVLGio1DO13mpSfpRvPr77
 SHJaESTfpmaACTHNBnQJafzGX6cpYTG920M9cfgFKciHgK5mfRlahqEbp+DDq9j0NFiZSTxPTfU
 mIf33gRvrChuDcg==
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

Once this is merged, the idea is to publish it on RTD for the master
branch and backport these changes to the v2.2.x branch so that the
documentation for the most recent release can become available online
too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      bindings: cxx: doc: remove the gpiod_cxx doxygen group
      bindings: python: doc: update the docstring for gpiod.request_lines()
      bindings: python: doc: make code examples appear as such in sphinx
      bindings: python: doc: describe undocumented members
      doc: use sphinx in conjunction with doxygen

 .gitignore                                  |   2 -
 Doxyfile.in                                 | 105 ----------------------------
 Makefile.am                                 |  54 ++++++++++++--
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
 doc/.gitignore                              |   5 ++
 doc/Doxyfile                                |  12 ++++
 doc/conf.py                                 |  63 +++++++++++++++++
 doc/core_api.rst                            |  58 +++++++++++++++
 doc/core_chip_info.rst                      |  11 +++
 doc/core_chips.rst                          |  11 +++
 doc/core_edge_event.rst                     |  11 +++
 doc/core_line_config.rst                    |  11 +++
 doc/core_line_defs.rst                      |  11 +++
 doc/core_line_info.rst                      |  11 +++
 doc/core_line_request.rst                   |  11 +++
 doc/core_line_settings.rst                  |  11 +++
 doc/core_line_watch.rst                     |  11 +++
 doc/core_misc.rst                           |  11 +++
 doc/core_request_config.rst                 |  11 +++
 doc/cpp_api.rst                             |  33 +++++++++
 doc/cpp_chip.rst                            |  12 ++++
 doc/cpp_chip_info.rst                       |  12 ++++
 doc/cpp_edge_event.rst                      |  12 ++++
 doc/cpp_edge_event_buffer.rst               |  12 ++++
 doc/cpp_exceptions.rst                      |  18 +++++
 doc/cpp_info_event.rst                      |  12 ++++
 doc/cpp_line.rst                            |  24 +++++++
 doc/cpp_line_config.rst                     |  12 ++++
 doc/cpp_line_info.rst                       |  12 ++++
 doc/cpp_line_request.rst                    |  15 ++++
 doc/cpp_line_settings.rst                   |  12 ++++
 doc/cpp_misc.rst                            |  16 +++++
 doc/cpp_request_config.rst                  |  12 ++++
 doc/index.rst                               |  28 ++++++++
 doc/python_api.rst                          |  31 ++++++++
 doc/python_chip.rst                         |  12 ++++
 doc/python_chip_info.rst                    |  12 ++++
 doc/python_edge_event.rst                   |  12 ++++
 doc/python_exceptions.rst                   |  17 +++++
 doc/python_info_event.rst                   |  12 ++++
 doc/python_line.rst                         |  27 +++++++
 doc/python_line_info.rst                    |  12 ++++
 doc/python_line_request.rst                 |  12 ++++
 doc/python_line_settings.rst                |  12 ++++
 doc/python_misc.rst                         |  13 ++++
 include/gpiod.h                             |  36 ----------
 sphinx/conf.py                              |  68 ------------------
 sphinx/contents.rst                         |  24 -------
 73 files changed, 809 insertions(+), 395 deletions(-)
---
base-commit: 38adbae195555fae2b9d9e2a37c9507af1114757
change-id: 20241216-improve-docs-19ed36687963

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


