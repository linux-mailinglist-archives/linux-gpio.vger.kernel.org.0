Return-Path: <linux-gpio+bounces-16199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79745A3A21E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 17:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22921886516
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 16:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0752D26E15C;
	Tue, 18 Feb 2025 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eMsr6aoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9FB26A1D5
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894657; cv=none; b=AAVRbQI9zUkegAn9JAecV+vwTM/oRHQ+xyChbcHYLPdJQcVNamiIuo4JnTlOTSq46KGL4nizRKhecTesporLvJu/CtqdQfN8KpL5/I81wK7c/kX1JKayQpUhKqJsthsNJULN0+GOSLkmtlh+zDX2/oTeLO8OvEWocE+r7RnwwaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894657; c=relaxed/simple;
	bh=fUVMWAX7REWpjhyyCWYiuH8xcu9kalXszllLwFkX3qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHTQBsfz3RB5kIZh4601QGISsf2YM/ESc/UhQLB02YuYgy7rbYjBQXeNKH4YOEgMKCa0pg8VnTayraKzm/pzXXHeKfovs5E4BmQrBjEPRUzMwchMOt4MkdUyN5cCrsdu+rk/C2nbP2yp+0GrfQMT9NC3wFH6gyYyne3XDlhNos4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=eMsr6aoJ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33FAC3FE6E
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739894648;
	bh=DuryKK1JU9DVfHEPC89kUMPr/MHTu6J3voQMTK8lVb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=eMsr6aoJEC8E9iVqoQ1cIPhzl+ulT77ZgoDu9Bi+0hta0i1VAHP86hrhNfC3CflOS
	 HjpPagzFhDJpsBzUejG8t35wfqjVcYHwbBUuN3RJcopEYrc2YlzTIsB1vdgwKaLfyK
	 NS826qq+9dVB75Z+GCIhmtdqNnjct8iqQoaJ7JhVmrw+d5vnrjatvUCGNYaq3qj3m0
	 XfeqLS9HsQY2FWcKyCYhchdW1x36q6CR73No9BIhw7KR247xtV3ZKtj4+d+ky4wbPe
	 ASNQqbKJ21hPDLhLSZjnNrrT9wIu0iGwV4UFU3akgSV0+ejVNSgdk8Cxxfqn4+AylK
	 jpAWw7SJz4wvw==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc318bd470so8343115a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 08:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894644; x=1740499444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuryKK1JU9DVfHEPC89kUMPr/MHTu6J3voQMTK8lVb0=;
        b=buxNsedgFceXjOD8FtKK9qpI5CNnMV8Y5QEA6hCbwsDaLrWi6CbksPlFKtYNudUWWm
         U+A0wgE/7nMisDqRAMx66o18HD1K9aLcZt2FPdIo0N2UIfCHx0jxIqVwrHbHcpZv5d3G
         8bvXV/QEJq4crXxa3EU/Ypy+mffIQQzBIaV+VDqQjBKKmNhR+yEQXJdrX0zX4m5NqKlU
         ukXBrr/LYgqrNlKDPcLeyHoIai61UNIOz/FFhsf/cBrBsrTfIt4I4e8dAFOJZYeDmpJG
         ouHTquUzdrIbaNqdooGZC9wEGjLYxk+5Em7FgVR+7CBlBtj4S4KTrBizKEZHBhLC+3ym
         gwNA==
X-Gm-Message-State: AOJu0YzWEG3n/ueD0xuP2J3kVtvFQDFYspngsfk32ZW5fQSJx5/dY1tk
	Ea5uBKxF8+NwhX7jKyRiZuCozZMyj8OxWHrDQf2yBf8Kbr+yxM89F2N6SVElW4MPxNxyoFnnjn5
	QxH4ngkbMWhHewk6WCxjXFFf0hMQfE06vVqf0147G8sN7cigq7PGjlLqfdmWpRFk8PFZgsngZS9
	DjX+wFoMQ=
X-Gm-Gg: ASbGnctFL2HcDBPM64eN0OsgIVwW7gq+0GZC1XwfRckqKqE/dnrH4yZBlp/VYMcanda
	3Z9Xhb4fuu1rx33f++4iPdOARfM7zQjlrDdd/oP81EZi8xPmRYHOLZCUZYD4q0vjzWQ/SkkuhPe
	hcxPYnZU4lIQiAJTyucsLLuOti91GO0hjXC+wZw+3djZPQfC66guHnY/sP6OtmSBLk+o+2zECLR
	B/dmBzLchzDhAdACrsXKE0damyFTL8T2BC4UNrUyxE4FcXJB7Pg8tmjKVMAtSapvcHSRtJsB7rD
	0SgaZYPzXsn+/rDkB90gNQ4=
X-Received: by 2002:a05:6a00:4f95:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-732618e4f11mr20970156b3a.15.1739894644408;
        Tue, 18 Feb 2025 08:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu7WnSNLPN3pPeNyV6sGFRmm5VDz/p7f6++WWf5z64nfaasD8G3rgud6fEdZqaPcfLWrlI7A==
X-Received: by 2002:a05:6a00:4f95:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-732618e4f11mr20970121b3a.15.1739894644068;
        Tue, 18 Feb 2025 08:04:04 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:ad3a:e902:d78b:b8fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae01c768020sm3662177a12.73.2025.02.18.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:04:03 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add synchronous fake device creation utility for GPIO drivers
Date: Wed, 19 Feb 2025 01:03:30 +0900
Message-ID: <20250218160333.605829-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a utility for some GPIO devices to reduce
code duplication. There are no functional changes.

In this series, only gpio-sim and gpio-virtuser are updated to use
dev-sync-probe, as the current gpio-aggregator does not benefit from it at
all. A follow-up patch series that introduces a configfs interface for
gpio-aggregator will convert it to use dev-sync-probe as well.

This work originated from a suggestion by Bartosz:
https://lore.kernel.org/all/CAMRc=MfcooZXBqVpbQ0ak+8LGsPDzwKSN3Zfb0eZDx1Bx4duzQ@mail.gmail.com/

N.B. this submission is based on the latest gpio/for-next as of writing:
f04867a5d0d3 ("gpio: loongson-64bit: Remove unneeded ngpio assignment").


v1->v2 changes:
  - Renamed the files (gpio-pseudo.[ch] -> dev-sync-probe.[ch]).
  - Renamed the helper functions and a struct.
  - Fixed Kconfig (correcting bool to tristate, etc.).
  - Fixed Copyright.
  - Added some missing #include.

v1: https://lore.kernel.org/all/20250217142758.540601-1-koichiro.den@canonical.com/


Koichiro Den (3):
  gpio: introduce utilities for synchronous fake device creation
  gpio: sim: convert to use dev-sync-probe utilities
  gpio: virtuser: convert to use dev-sync-probe utilities

 drivers/gpio/Kconfig          | 10 ++++
 drivers/gpio/Makefile         |  3 ++
 drivers/gpio/dev-sync-probe.c | 96 +++++++++++++++++++++++++++++++++++
 drivers/gpio/dev-sync-probe.h | 25 +++++++++
 drivers/gpio/gpio-sim.c       | 84 +++++-------------------------
 drivers/gpio/gpio-virtuser.c  | 73 ++++----------------------
 6 files changed, 156 insertions(+), 135 deletions(-)
 create mode 100644 drivers/gpio/dev-sync-probe.c
 create mode 100644 drivers/gpio/dev-sync-probe.h

-- 
2.45.2


