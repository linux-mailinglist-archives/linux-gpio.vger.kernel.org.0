Return-Path: <linux-gpio+bounces-30957-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bgL9Gi3vcmlCrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30957-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:46:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B7702DA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A323F3018400
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 03:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC30335BDA8;
	Fri, 23 Jan 2026 03:46:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D237FF61;
	Fri, 23 Jan 2026 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769140005; cv=none; b=q38JB6GS6njmdtdnL9Qhm7IVhJUFbKs9EyBYqARKdyZM04+VtCgPQC2E4p87RbOqNU1vE5PAReWcyhFL1FoKdcDw06frKe1Rvko6CbvjJGuVJhoDzIFxk0EUkeauheq5DgNrqLDpObyxIg33GeNt9ZRGSof/8yHb03CcGMFLqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769140005; c=relaxed/simple;
	bh=U+96Oju2LJPPeV4CQsvqyeiTCxkEfhEAD2gIfgrHu/Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=O/YYuoj8+R+7jLJNvDInGRENJ0+CpSJ7EnQ/iIZuFFsJ9wMNj8Vk9kpu42wf4T2CIETJodauolDFSNH2J+Olm94gMIubp2l8II88SHC+OPX4jXRQV1q2xIhvDez0E0PrfbIWA2qPt2yZ7yO/JIzc0uvufMiIOFG9Ytt0IQd2x2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
Date: Fri, 23 Jan 2026 11:41:22 +0800
Message-ID: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOLtcmkC/4WNQQ6CMBQFr2L+2hpa0VhX3sMQUsoDfgKlaSvRE
 O5u5QIuZ5I3b6WIwIh0P6wUsHDk2WVQxwPZwbgegtvMpAp1kUop8fIxBZip9uxsCmMd2fUjhNa
 4tZ3soBpNee0DOn7v5WeVeeCY5vDZjxb5s/+bixSFQGmMKYFGn68PEz3QJtjhZOeJqm3bvvbvu
 qTDAAAA
X-Change-ID: 20251222-upstream_pinctrl_single-99e8df1fe2b9
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=3080;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=U+96Oju2LJPPeV4CQsvqyeiTCxkEfhEAD2gIfgrHu/Y=;
 b=XyvL8ixlWRm0I/KPcKu8gPviLj9PpZERF86sW2+SY/232zH8dRwnaWFUnRu8SMtnSwdkr8mLu
 NugFB56kQPtDuURaTbb2wK+eBPG0DbpeupVkX4idhvuJZH2wYBP5Ef7
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-30957-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C63B7702DA
X-Rspamd-Action: no action

This series is motivated by the pinmux and pin configuration register layout
of the ASPEED AST2700 SoC, which exposes several limitations in the current
pinctrl-single behavior on bit-per-mux platforms.

On AST2700, pinmux registers are laid out contiguously per pin, with each pin
occupying a fixed-width bitfield and pins packed sequentially within shared
registers. While the existing pinctrl-single,bits binding can represent this
layout, doing so requires manually constructing offset/mask/value tuples that
do not map naturally to the hardware model and are error-prone to maintain.
In practice, describing pinmux configuration in terms of <pin_index func_sel>
better reflects the underlying design, improves DTS readability, and reduces
the chance of mask or shift mistakes, while still preserving
pinctrl-single,bits as the preferred and fully supported binding when present.

AST2700 pin configuration registers follow the same per-pin packing scheme as
pinmux, with both multi-bit and single-bit fields arranged sequentially per
pin. However, the current pinctrl-single pinconf offset calculation assumes a
linear per-register layout, which does not align with this bit-per-pin scheme
when bit-per-mux or function-mask configurations are in use. Aligning pinconf
offset computation with the pinmux logic ensures consistent and predictable
behavior and avoids incorrect pinconf operations on such platforms.

In addition, on many AST2700 systems the SCU register range containing the
pinctrl registers is commonly reserved by a top-level syscon node or by
firmware. In this configuration, devm_request_mem_region() can return -EBUSY
even though the registers are valid and intended to be shared. Since
pinctrl-single is a direct MMIO-based driver and does not integrate with
syscon/regmap, failing probe in this case prevents any pinmux configuration
from being applied. Treating this condition as a warning allows the driver to
initialize while still reporting the shared-resource situation.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Updated the cover letter to better explain the AST2700-specific motivation
  for this series and why the current pinctrl-single behavior is insufficient
  on such platforms.
- Clarified the rationale for allowing probe to continue when the MMIO region
  is already reserved.
- No functional changes compared to v1.
- Link to v1: https://lore.kernel.org/r/20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com

---
Billy Tsai (3):
      pinctrl: single: add per-pin binding support for bit-per-mux
      pinctrl: single: Allow probe to continue if mem region busy
      pinctrl: single: unify pinconf offset mapping with pinmux

 drivers/pinctrl/pinctrl-single.c | 150 ++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 40 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: 20251222-upstream_pinctrl_single-99e8df1fe2b9

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


