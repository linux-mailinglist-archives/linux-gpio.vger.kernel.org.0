Return-Path: <linux-gpio+bounces-12422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13289B8BE1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D252F1C212F3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 07:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10894149DFA;
	Fri,  1 Nov 2024 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgH0cTyi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A64E1CA;
	Fri,  1 Nov 2024 07:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445333; cv=none; b=GggEZ/quVIqGZtrI6sf5cKYfnCBHDE5UdFX02gS8LmZqCKWz3k4ijQLJnsRsYJd36kH4KTFtwDe0CLohLhyWs6UBiV/y45dr1QMzKLI+9YGSFhQ8IF0H5n0zktwJCJJ1o9RzB9Y3LkVZSYy1IvPMMXVFeQL3dCkP+UmmL1FEH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445333; c=relaxed/simple;
	bh=+1OQTA9uripQzJClHjHmOZlyDXw9tnl7Mxlgju9zqi0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zjm5hDEd6imUv4uamjOzCeyxXU4TJXwBD9WoTcWVTs3X8L4XpwRbDZPkv+55yrGr4VTx8dz52aqPB+Lis7TUIZdKC1s2fxtuX12PP8+GSlwwjyDT46ja3dCJ7uIragP/B70fwTYW5z9QIlZ9KufQVx4X+7lGjPgFBIwYVz2HQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgH0cTyi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FCCC4CECD;
	Fri,  1 Nov 2024 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730445333;
	bh=+1OQTA9uripQzJClHjHmOZlyDXw9tnl7Mxlgju9zqi0=;
	h=From:Subject:Date:To:Cc:From;
	b=BgH0cTyimZcAvSzqPtJVi+Iok7y/epvnBzfBnKdlBdTNdABCZACmpvKH8xKs52N4h
	 KAbKQjkSa0nhJ3JkymmDTHWQNjwhWxp1YfL7OGGtOjO0tMYF0r849fNRasmdiAvemS
	 3Bj+yd3u1hsY4Sga+176ajpDhMR+VY8Ap0Q8jTA+CD6yxw+TPqV9CjRlw1WUqWrk8X
	 NgX7zCYs13DpGCOQxaaY2LeT81E3YO/NfU67Iih1rzxoPgokAepqj99srRt1qLaYt7
	 N+7lAdkhOsuDo99CgE1FZvfdhkZwxc0r6JcQbyhZyaMGlMRcme2un8LSyd0dGxyw1A
	 5TzObPLsVNwng==
From: William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH 0/2] gpio: Replace deprecated PCI functions in ACCES
 drivers
Date: Fri, 01 Nov 2024 16:15:07 +0900
Message-Id: <20241101-pci_iomap_region_gpio_acces-v1-0-26eb1dc93e45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPt/JGcC/x3MQQqAIBBA0avErBO0IqyrRIhNo82iFIUIpLsnL
 R98foFMiSnD3BRIdHPmcFWotgE87OVJ8F4NnewGpaQSEdlwOG00iXyNjY8cjEWkLLZ+dJueRqk
 lQj3ERI6f/76s7/sB2K5hd20AAAA=
X-Change-ID: 20241101-pci_iomap_region_gpio_acces-b36fb896080c
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=wbg@kernel.org;
 h=from:subject:message-id; bh=+1OQTA9uripQzJClHjHmOZlyDXw9tnl7Mxlgju9zqi0=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOkqDSIHthidq9qn+zlRMv3iXN2X39cvaF5wyc36oZFnf
 Mr2po9/O0pZGMS4GGTFFFl6zc/efXBJVePHi/nbYOawMoEMYeDiFICJ6MgxMtxaYPpr4dyts23m
 WnLN+Nw2c45j7pRVHKqHLDs2vqltVP3I8D/fNixG8tWj26mPVgSuSxbOili8cZ5CUp6+jtOjN6n
 HznMDAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

pcim_iomap_regions() and pcim_iomap_table() have been deprecated in
commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
pcim_iomap_regions_request_all()").

Replace these functions with pcim_iomap_region() for the pci-idio-16 and
pcie-idio-24 drivers.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
William Breathitt Gray (2):
      gpio: pci-idio-16: Replace deprecated PCI functions
      gpio: pcie-idio-24: Replace deprecated PCI functions

 drivers/gpio/gpio-pci-idio-16.c  | 17 +++++------------
 drivers/gpio/gpio-pcie-idio-24.c | 19 ++++++++-----------
 2 files changed, 13 insertions(+), 23 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241101-pci_iomap_region_gpio_acces-b36fb896080c

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>


