Return-Path: <linux-gpio+bounces-33252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OBvLnOysmmYOwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:32:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D37271D1B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 13:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F73C30166CD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D272C11C6;
	Thu, 12 Mar 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G0STWHdq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4213D539;
	Thu, 12 Mar 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318767; cv=none; b=YzeJfIRo8IItc6bxtnT6UbCKf/xJ4lvhBFjDpDdiyeL3h5jMEdyV8SbiPeByVT2zTT1/Q0ogeDSZIPwct8bN8Jj9+RK2VI+xMyROTFaTKnsAF5Jmcfudpe8SKCEqvbsRqqK8beLvjDx/BZXPrFJzj3BJnh3yN1sktD9t40mf5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318767; c=relaxed/simple;
	bh=o2UthO2WXzmSPYdwO0w/waxNRhhzupLP6L1ZNdbYEYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CF2Gl7JqL24nonMEPQ/xEVvW4futb+RvIqwCpCvAXtm9XOEojsHJeC7WlVWQSWUTz+5Jsn4ULOadXV3n3Hh1HyTzpDbinfsxRxrjuGOCqnDIvQZSKMNiWNaLHhyX4ipCPYzpjsLqVQuuZ2J/DvfKdu3PMyQMo306EhmPG/32sXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G0STWHdq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773318764;
	bh=o2UthO2WXzmSPYdwO0w/waxNRhhzupLP6L1ZNdbYEYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G0STWHdqnJMF17OLN9SHIkyTCwRJMshhFVor33igF9UbKgMbSXRj6a07H4kmcB/nH
	 QvEJEwwTRLaeq1UnbZ+TMFjOK18j1AGkRptVxhVCJNt3DkQ34+D7m2+x9QsuXOqS0z
	 0Yqz4tTWIvJj7MR22SPc9bh77yjmFs5KZEDfpCCT63BDJBTloTgLZnD2iy59oj9Dug
	 GFp6A+4gZLEHkBiiB1R7mN0xCkemziqDr0MiBffLXGwGbYa8kQcmIe2biEXHDAl1E4
	 trVNlbuoTKODkdX+2T5nCX9PFEpkF8OuOMoPp//lUAue1bJIk4BtbO4yu+TC9yLZDW
	 Z0tYcVs9NlLHQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBCEA17E05B5;
	Thu, 12 Mar 2026 13:32:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linusw@kernel.org, 
 Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, hui.liu@mediatek.com, nfraprado@collabora.com, 
 mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
 sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, 
 erin.lo@mediatek.com, zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, 
 amergnat@baylibre.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com, 
 Linus Walleij <linusw@kernel.org>
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
Subject: Re: (subset) [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and
 include guard issues
Message-Id: <177331876391.53170.11935383567217800525.b4-ty@collabora.com>
Date: Thu, 12 Mar 2026 13:32:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33252-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 67D37271D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 13:15:27 +0900, Akari Tsuyukusa wrote:
> While looking at MediaTek's Pinctrl driver and device tree, I discovered
> that on some SoCs, the gpio-ranges count was a little less than the pins
> defined. This means that the last pin will no longer be available.
> 
> And fixing this issue, I also discovered that the #endif comment in the
> include guard for some header files was different from the macro name at
> the beginning. These issues do not affect the compiled kernel, but they
> affect the readability and consistency of the code.
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/6] arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
      commit: c4c4823c8a5baa10b8100b01f49d7c3f4a871689
[2/6] arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
      commit: b62a927f4a46a7f58d88ba3d5fb6e88e1a4b4603
[3/6] arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
      commit: 820ed0c1a13c5fafb36232538d793f99a0986ef3

Cheers,
Angelo



