Return-Path: <linux-gpio+bounces-13224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 478589D6D77
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 11:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8856281512
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A68188938;
	Sun, 24 Nov 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TLKQGZKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE36136E
	for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442714; cv=none; b=j2kwAln7q/5W8RhhiziDl5GQvQOQCS8eanO9ek9qwYpNRWGcjYFA9+Tgm3U9UFEX/GVYzBum4pYEmzfs2EfZN2T2hsCjSJOyTMHVkKxAvlWDB5tXQKaY2C/WzrHtNOIPLqZI0fkrEpmwMdiUqsPIkZnBiAvo+R0BQwZNQN6inxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442714; c=relaxed/simple;
	bh=xYyBbJ1bV1F/AvNsXaz4DN1NT7f6hP3J7eQ9A3tlTH4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NT4LFhoAXGKk4yiduJAMNMOEN/SBxyLEcOo4WXo621SWcXxeWn+4k5PjPclNuCZ/+2dj4oHcD4Bpy0BtdJhCNUAeeIqJbhA2+eP1AP+GEbukVkcWKZOow9+a9JmZdQYyiTRmveejB2f9y08FBCR4kpBCyco4dhxnptJ/HTofI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TLKQGZKh; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-aa5366d3b47so119215066b.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Nov 2024 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442709; x=1733047509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=TLKQGZKh+ukC5GklXmw+ac1cisJMfJ/M6s7jxDRqmrl/2wE9o6QcwwPv2dvzgZPJXa
         DazyQG9LwNsz7SQqZV3eq2KfztXmaGh7rT3wU8uP6gijFuhzjlIKvWwGLeWuz75FecLS
         WLpcpZ1seh/UX1LbbyRXR+rAd4s8ltTJON0tKceFw1cfduXDH9GU/RQ9JGdx6PGvzJ2j
         UoG0Q4v9tMq0XLmlHClz1y5CWirF+nOmbL9MdkWCb7MdkgFAmln758io8bywfuYT2PCV
         wQnc3c+Ki/6NECj4RX6fFWvJFla8KVGE6wOd+WwnbqR8zA/uoD+B+1CZ3sHp73fqW0kV
         JAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442709; x=1733047509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=g3tQxwlBBkRLtabsvWSqB81uj6gqO5e5NmqdwFkBgeLwPPnYBmi4E0wv4GpiWqibwm
         g2UNgB8vJ7kaB2gdGCneMwu3jxtBJy4Pybx3Uulm3nIofGkKhFnUghTR/Vew5n9leobr
         St9KVVa7MlfnuvS6goZytEFeG6f6htT6b13FvggfkoupLbAx6TwaG7F2LPWD5Fh0S7Ss
         I7YrqK1qEGytBP4oOQ2va27wTdZeAk+lAQBHzsW+D2FUXo9nKUWFwtqJSi5xvQW1mI13
         xMOFNj26pzGJwhAalOJmBQoGHp0xLmjk+1eURrgYp8PGxmut4QU8MT5nu95Rh8vvzTUk
         u1YA==
X-Forwarded-Encrypted: i=1; AJvYcCXkTrZGBvFNQ1UYFPwMWsIPc4g07w3xmkSTSyGQl7D2954H9dvCQzptFk317I1jPxNxhrkGeHoCW5gE@vger.kernel.org
X-Gm-Message-State: AOJu0YwAg24HHU9eBMZ5iGsfG6BiLOwu+7gE1pWr8ZOJH/h4ZopaQprZ
	M8a9YTDWEy+rXuquPuI8/RIGecfgyFyLWxmQ0TnTqTpZN3vXrk+KB47hQqz3CJM=
X-Gm-Gg: ASbGnctDqw8NixqWcPnfxVnXdNhEH+3M19JhFpm52VcmKgihdZ2+8KCovXW2GXcgocR
	Pnrh+t8Gc5KhpjfOI4HRvq3SOzjqo8VpA0CB40Bo5NoCHnRUEzLfWg3jLn60Wp3OdyQsKMXIo2M
	hEJV+zzHos8H5b+1a7djaApV5UF8IPSYpDDmhhOuW8D/zlnONzjYoh3dxeG+Qh04+vdOkgxrHg9
	zsDebzlkoedQfdAtrad4VqzPIlFVPvKhk0ScWT7HUgWPEnBaVWE/eQBXeBZryExRh+aDjYT+3Un
	IhyqLa9WtFm/1kb0cIoK
X-Google-Smtp-Source: AGHT+IE6n1Sl2VjDnUF5IiR4wNGa1GDW8vw2+O+cu/s3Q+7FHS16Q8BL2O+lyk7mxoO9jBhc7KuPpQ==
X-Received: by 2002:a17:907:77c9:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-aa50990b2a9mr726045266b.10.1732442709155;
        Sun, 24 Nov 2024 02:05:09 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759732asm295266666b.14.2024.11.24.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:08 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] Preserve the flags portion on 1:1 dma-ranges mapping
Date: Sun, 24 Nov 2024 11:05:35 +0100
Message-ID: <cover.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Empty dma-ranges in DT nodes using 3-cell address spcifier cause the
flag portion to be dropped by of_translate_one(), failing the translation
chain. This patch aims at fixing this issue.

Part of this patchset was originally preparatory for a bigger patchset
(see [1]). It has been split in a standalone one for better management
and because it contains a bugfix which is probably of interest to stable
branch.
I've also added new tests to unittest to prove it.

Many thanks,
Andrea

References:
[1] - https://lore.kernel.org/all/3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com/


Changes in V2:

- Added blank lines between paragraphs in commit message for patch 2
- Fixed a comment to explain the code behaviour in a straighter way


Andrea della Porta (2):
  of/unittest: Add empty dma-ranges address translation tests
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping

 drivers/of/address.c                        |  3 +-
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.35.3


