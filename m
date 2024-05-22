Return-Path: <linux-gpio+bounces-6541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA08CB6D1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 02:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BADFCB211EE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 00:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA11B17F3;
	Wed, 22 May 2024 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ck3eFua9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBC4A1A
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 00:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716338826; cv=none; b=oYtE6hpBjdWZCOZnhn6c0vo/x8gd/uC1kuo5M0i23Sddupew67nGfQrTQWr5i+564fJB3ThczLF/Hg9ke8Q+wFMtgRKx2AaMpiqfrkDKoSCM42tswCGC4aqIm5e/ZOrHAgINXQApxH9KiFn3NKFmiyNKBgluHfoJn96oasw5zOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716338826; c=relaxed/simple;
	bh=pJ43JH4GxkkZXJeG1xVxu9SWkWIkiuSojfa9dyS6RGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XzwqB0aI8se8ad95Yg1Fj2qjjlOAk0R2oLNjUXpcZVn9jobmupRlF1PEGyAgj18uJiLvizPMxWSzGjyZZI6GtMDUzVoS2ZwsCISTMkB1SwYtCu29bqqtk8934hBSDq0kfg2RgoM+j/+wKvmKIbrYSpG4kjeJMRTuXYQ2huPL0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ck3eFua9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4d6b7168eso1435752b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 17:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716338824; x=1716943624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9x3ARlB0HXnU8tcs/38vFI+YBlPZNzKtpvsZOoRO+4=;
        b=ck3eFua9fzz4QLfkFWZIkZzguHmkDenP7UtH/l5m+ZUgMrxMzokQRH3pr9bqxZu3Gl
         IgAMyv6HGta67WUkAaTymqc1dS2ccBAMf2WjAWb0dVt1hL/m7vK4gId2VFS2xWNTRMKg
         MWjSuCMZiCRSwAraSbcR+AXPcB4Cdrx+5H9gi6zvQIf5e3bQr8kXR4kUofDT2gWkk4ru
         eVr4byO6Paa3TUwKlHRymV9Ay8ciyTk6jz5ahGxviC5XhIRx4QRQDgTXYWF14rg1EpE4
         EfRhudV24UsTvjTsBBBpsH2JzvEJknoCjnTwoPgUt9LB5R9mi0dN6m0/00J1+Zz909kO
         tiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716338824; x=1716943624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9x3ARlB0HXnU8tcs/38vFI+YBlPZNzKtpvsZOoRO+4=;
        b=phhSEWpLJsRGzZMUdgQbFR5FoFI6gvHWkBGIQPQ4apgiUgUL/ITyJGZ3hjQztHLcNL
         fbR4k3RgonAnS/afjRmAf9mzcVNPUynWPMdTe9e4q1GWqw1yJG/CwnqXrb4zRy2ReJE/
         c5JELR6jKQs5Yvv3kSw1e34o4kn+f181ugxPu/xKn9gyIzSNrO7sXuSD6ecrv65TufUJ
         MYjTwtPQZIyWgWXEMSJjKT9M285FeISfgF+O5LaDnhDZ6P6+JLebyYv4kWrafgcDTAIY
         7pO2hixjhTYUMDXs+pKYPxqN4WTDi7ExHn6g/GLqY14TXNfR84ORp+YLUACLVcTCiAEC
         XOUg==
X-Gm-Message-State: AOJu0Yye8DEQ+f99RZ0VQVX0ODXD2xLYvy6CVYP7009gbL4IFgpwR4/t
	DPT2kdImn5AQuzUUJnZTjc0/d8jF24See6exWJd/43aP7R3kYLwEnIJBKQ==
X-Google-Smtp-Source: AGHT+IFo3Gf+kWFlsCgjJL5mzALr7wtHVI6uOIJ/gFT6Lt1I7uEANYkuliMp82AL0w7gaaJCCi67sw==
X-Received: by 2002:a05:6a00:2311:b0:6ec:faff:ec1f with SMTP id d2e1a72fcca58-6f6d606a5a9mr637409b3a.11.1716338824283;
        Tue, 21 May 2024 17:47:04 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c36sm22066302b3a.173.2024.05.21.17.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 17:47:03 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] support casting line.Value to bool
Date: Wed, 22 May 2024 08:46:41 +0800
Message-Id: <20240522004643.96863-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While writing a gpiod plugin for gpiozero (Python), I had to map line.Value
to its bool equivalent.  Casting seemed the obvious way to go, as it is
essentially a boolean, but that didn't work as I expected - it always
returned True. This is the case for any Python type that does not provide
a suitable conversion operator.

This series adds support for casting line.Value to bool.

Patch 1 adds a test that comfirms the existing behaviour.
Patch 2 adds the __bool__() operator to make the Value behave as one
might expect.

As an aside, I couldn't for the life of me work out how to run the complete
python test suite.  There are no hints in the documentation.

There is a python-tests-run target in the Makefile, but that didn't work:

~/libgpiod/bindings/python$ make python-tests-run
PYTHONPATH=/home/kent/libgpiod/bindings/python
LD_LIBRARY_PATH=/home/kent/libgpiod/lib/.libs/:\
	/home/kent/libgpiod/tests/gpiosim/.libs/ \
python3 -B -m tests
/bin/bash: line 2: /home/kent/libgpiod/tests/gpiosim/.libs/: Is a directory
make: *** [Makefile:677: python-tests-run] Error 126

I tried fixing that but I still couldn't satisfy ld wrt the gpiosim
(I don't have libgpiod installed - just using the local build),
so gave up and called this particular test directly with

$ python -m unittest tests_line.py

While that passes, I can't guarantee it hasn't caused some other
breakage, though it seems very unlikely.

Kent Gibson (2):
  bindings: python: tests: add test for casting line.Value to bool
  bindings: python: support casting line.Value to bool

 bindings/python/gpiod/line.py       |  3 +++
 bindings/python/tests/Makefile.am   |  1 +
 bindings/python/tests/tests_line.py | 11 +++++++++++
 3 files changed, 15 insertions(+)
 create mode 100644 bindings/python/tests/tests_line.py

--
2.39.2


