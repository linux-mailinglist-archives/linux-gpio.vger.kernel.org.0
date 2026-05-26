Return-Path: <linux-gpio+bounces-37542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFbdInbXFWoSdAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:25:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AAA5DA9C0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66ACD302A686
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 17:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB2424CEEA;
	Tue, 26 May 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fy0WP5z2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368113A963A;
	Tue, 26 May 2026 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815470; cv=none; b=DJsu9DW3253J0fqpzFpUli3DPKq9EvGus6YMZR901lCmwFO9rd7KdIJAP6FbrjoOVid3hPgaKn6+utDsunE6K7NfAbgAOiH1lfXMRv0CUtYGQJNfAxdjTjzH/0VcuFz4zm9bOnVE0jl2TCwakE9AA79lfSmzk2/TLFd3WlMkQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815470; c=relaxed/simple;
	bh=NCNkhZt2TCA+7T+e7NKRSVG3uKd1PUwscoI+uF7q3lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/6rCXuCSU1Z38rkiNoQnaMeWh8Rwi2Frbjkn0u9xPjmxsV6z+U0nX1KApOvDTx8qdvudhwOHaO4o7ZtSTHn3BpLJqLdg7Rz+Ei4RTnFCTDwzhRYjkEIbL0RLk3oxBWhsmy3wN+bGj19FymiLxgenSWtAOolchWqZlTBSXaP91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fy0WP5z2; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CB9C626EFE;
	Tue, 26 May 2026 19:11:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOs9WwFnslqk; Tue, 26 May 2026 19:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779815466; bh=NCNkhZt2TCA+7T+e7NKRSVG3uKd1PUwscoI+uF7q3lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fy0WP5z2xD+VTvOPMhbLsLfDstvJq4QnAQqPqXwa73zIFNFsxAuLZTYuCwk2rwKyz
	 IEf0a9jPUQRxJfNXlxpyqF6LNRXfPPNX7Vr4/gvUBHwbGk/5IbzzMBbrOEI7Ye5S4m
	 bKx1iqMiU6RHrmpYn727I9jVJqRDLB7zjDr/kdTbXc6iWviDlgtOoBnFNbTzjpbthG
	 YAtwhEhworZCTgXETljsgLqOIUwUQa4ogSgtc1spJURkB7/cltAHqBzPPnDnov3z90
	 ou/3yohYORQiTuyaccv5mNSR5NBuW8Nv9McK94CaJSTRBhDYxswGDCx2hUdH/SFFoh
	 +605BwIcsuXkA==
From: Marco Scardovi <scardracs@disroot.org>
To: brgl@kernel.org
Cc: heiko@sntech.de,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	scardracs@disroot.org
Subject: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Tue, 26 May 2026 19:02:44 +0200
Message-ID: <20260526171050.12785-1-scardracs@disroot.org>
In-Reply-To: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37542-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Queue-Id: E0AAA5DA9C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,
thank you for the review on the first version of this series.

TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
       and they don't expose a separate debounce clock in hardware. 

Regarding your question: existing DTBs currently do not provide clock-names
for these GPIO nodes and instead rely on positional clock ordering.

While we could extend the binding to optionally support clock-names going
forward, the driver still needs to remain compatible with existing DTBs, so
it cannot rely on name-based lookup here.

For this reason, keeping the index-based of_clk_get(..., 1) lookup together
with devm_add_action_or_reset() for cleanup seemed like the safest option.

A good example can be gpio1 in rk3399-base.dtsi, where the clocks property
is defined as:

  clocks = <&pmucru PCLK_GPIO1_PMU>;

If we switched to name-based lookup via devm_clk_get(dev, "db"), it would
fail for existing DTBs because they do not define the corresponding
clock-names property.

Additionally, PMU banks such as gpio1 do not expose a separate debounce
clock in hardware, so there would not be a matching entry anyway.

Therefore, using of_clk_get(..., 1) is currently the only approach that
preserves compatibility with existing DTBs while avoiding regressions.

Changes in v2:

- Rephrased patch 1 and patch 2 commit messages to use the imperative as
  requested.

- Clarified in the commit message of patch 2 why devm_clk_get() cannot
  be used for the debounce clocks.

The patches included in this series:

1. Convert the main clock (bank->clk) to use devm_clk_get_enabled(),
   simplifying the code and fixing an existing clk_put() leak.

2. Fix several teardown bugs and resource leaks:
   - Fix a reference leak for the debounce clock (bank->db_clk)
     by properly releasing it with a devm action.
   - Fix a potential kernel panic on module unload by unregistering the
     chained IRQ handler (rockchip_irq_demux) in the remove() callback.
   - Fix an IRQ domain and generic chip memory leak by calling
     irq_domain_remove() during module unload.


Marco Scardovi (2):
  gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
  gpio: rockchip: teardown bugs and resource leaks

 drivers/gpio/gpio-rockchip.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.54.0


