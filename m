Return-Path: <linux-gpio+bounces-29974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CABCE63F7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 09:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE2EA3005FD7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A8925BEE5;
	Mon, 29 Dec 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WkKuWmQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49208.qiye.163.com (mail-m49208.qiye.163.com [45.254.49.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBFF2367A2
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766997653; cv=none; b=fQm6R/LD4Be3cHLs64u1qhfgrQ6uM1fwF7Wprspc0eEHdeOadEQrTpHORmIrgsORKM7xuvAkcyZCdIeFnHkfD3mS99bzHabfA1b1tLjTIY8XVvLvi2Dh6dw/PH5Qa7qq64F7Y4cSKciinnpiMhnfmY1EPIuB0laikvTGxX41PAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766997653; c=relaxed/simple;
	bh=MnJ455SKQ4fWCyvQTSN+37HvQ7g/ibRTP8V0NRo5BA8=;
	h=Content-Type:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:From:Date; b=OXrzT1a5oNJgbHjQ5Gwe4oCbLfzKCVMVtMbRVF6l6+5Qnlp1i2fyY3pxL2whlCBKmovlYFh4iFNNiyiZM6gH2YhiTCHzYzdinn65l3nNYtqRKHse/yvAWZuRD1F7iAzKregqAYSmpsW+r4ePHhnkpSuIMnzBHPHvJpFMxjcNXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WkKuWmQF; arc=none smtp.client-ip=45.254.49.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AGkAtwAtJy-UDFfi3M2RSaqR.3.1766993111418.Hmail.ye.zhang@rock-chips.com>
To: Krzysztof Kozlowski  <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	linux-gpio <linux-gpio@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"tao.huang" <tao.huang@rock-chips.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCA3LzddIEFSTTogZHRzOiByb2NrY2hpcDogcmszNTA2OiBBZGQgcGluY3RybCBhbmQgcm1pbyBkdHNpIGZvciByazM1MDY=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com Sirius_WIN_1.51.1
In-Reply-To: <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-8-ye.zhang@rock-chips.com> <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from ye.zhang@rock-chips.com( [58.22.7.114] ) by ajax-webmail ( [127.0.0.1] ) ; Mon, 29 Dec 2025 15:25:11 +0800 (GMT+08:00)
From: =?UTF-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Date: Mon, 29 Dec 2025 15:25:11 +0800 (GMT+08:00)
X-HM-Tid: 0a9b68fc45e70300kunm50884eeed91f
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMTRjsrDknlR9vNBzlnYPSNuiT0h4wr6guvdTSp
	TBMvzEa6RMPKP1QW9Ei5Pi131B7yNhJhQODgKEpYrHZvY3oFy4q72HtESdjAjkJl2FwBpIyLx9Rn
	3S5U8IgY8Wcx2T+/xpvPUqCzAB3fXos7T4P8Q=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxCGVYfHUtPSRkYS01LHkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WkKuWmQFz3txpY2yYplK5dluIOXnXkjH4vRBdu9Nb42mIcStOmBEaNV3yoEPveMzCmUolsHdI06ndn5t6dKugl+9K4nrI3cdy2o6z3EsLcdVS6R/KyqKfAHsTI3LBFQZ81Fa4jtvLED76Yk4pLRPSac8B7lj9Ghcbu6m/XuVMbU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=MnJ455SKQ4fWCyvQTSN+37HvQ7g/ibRTP8V0NRo5BA8=;
	h=date:mime-version:subject:message-id:from;

5ZyoIDIwMjUvMTIvMjggMTg6MzcsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgomZ3Q7IE9u
IDI3LzEyLzIwMjUgMTI6NDksIFllIFpoYW5nIHdyb3RlOgomZ3Q7Jmd0OyArCQkvb21pdC1pZi1u
by1yZWYvCiZndDsmZ3Q7ICsJCXJtX2lvMjhfdG91Y2hfa2V5X2luNjogcm0taW8yOC10b3VjaC1r
ZXktaW42IHsKJmd0OyZndDsgKwkJCXJvY2tjaGlwLHBpbnMgPQomZ3Q7Jmd0OyArCQkJCSZsdDsx
IFJLX1BDMyA3ICZhbXA7cGNmZ19wdWxsX25vbmUmZ3Q7OwomZ3Q7Jmd0OyArCQkJcm9ja2NoaXAs
cm1pby1waW5zID0KJmd0OyZndDsgKwkJCQkmbHQ7MCAyOCA0OSZndDs7CiZndDsmZ3Q7ICsJCX07
CiZndDsmZ3Q7ICsKJmd0OyZndDsgKwkJL29taXQtaWYtbm8tcmVmLwomZ3Q7Jmd0OyArCQlybV9p
bzI4X3RvdWNoX2tleV9pbjc6IHJtLWlvMjgtdG91Y2gta2V5LWluNyB7CiZndDsmZ3Q7ICsJCQly
b2NrY2hpcCxwaW5zID0KJmd0OyZndDsgKwkJCQkmbHQ7MSBSS19QQzMgNyAmYW1wO3BjZmdfcHVs
bF9ub25lJmd0OzsKJmd0OyZndDsgKwkJCXJvY2tjaGlwLHJtaW8tcGlucyA9CiZndDsmZ3Q7ICsJ
CQkJJmx0OzAgMjggNTAmZ3Q7OwomZ3Q7Jmd0OyArCQl9OwomZ3Q7Jmd0OyArCiZndDsmZ3Q7ICsJ
CS9vbWl0LWlmLW5vLXJlZi8KJmd0OyZndDsgKwkJcm1faW8yOF9zYWkwX21jbGs6IHJtLWlvMjgt
c2FpMC1tY2xrIHsKJmd0OyZndDsgKwkJCXJvY2tjaGlwLHBpbnMgPQomZ3Q7Jmd0OyArCQkJCSZs
dDsxIFJLX1BDMyA3ICZhbXA7cGNmZ19wdWxsX25vbmUmZ3Q7OwomZ3Q7Jmd0OyArCQkJcm9ja2No
aXAscm1pby1waW5zID0KJmd0OyZndDsgKwkJCQkmbHQ7MCAyOCA1MSZndDs7CiZndDsmZ3Q7ICsJ
CX07CiZndDsmZ3Q7ICsKJmd0OyZndDsgKwkJL29taXQtaWYtbm8tcmVmLwomZ3Q7Jmd0OyArCQly
bV9pbzI4X3NhaTBfc2Nsazogcm0taW8yOC1zYWkwLXNjbGsgewomZ3Q7Jmd0OyArCQkJcm9ja2No
aXAscGlucyA9CiZndDsmZ3Q7ICsJCQkJJmx0OzEgUktfUEMzIDcgJmFtcDtwY2ZnX3B1bGxfbm9u
ZSZndDs7CiZndDsmZ3Q7ICsJCQlyb2NrY2hpcCxybWlvLXBpbnMgPQomZ3Q7Jmd0OyArCQkJCSZs
dDswIDI4IDUyJmd0OzsKJmd0OyZndDsgKwkJfTsKJmd0OyZndDsgKwomZ3Q7Jmd0OyArCQkvb21p
dC1pZi1uby1yZWYvCiZndDsmZ3Q7ICsJCXJtX2lvMjhfc2FpMF9scmNrOiBybS1pbzI4LXNhaTAt
bHJjayB7CiZndDsmZ3Q7ICsJCQlyb2NrY2hpcCxwaW5zID0KJmd0OyZndDsgKwkJCQkmbHQ7MSBS
S19QQzMgNyAmYW1wO3BjZmdfcHVsbF9ub25lJmd0OzsKJmd0OyZndDsgKwkJCXJvY2tjaGlwLHJt
aW8tcGlucyA9CiZndDsmZ3Q7ICsJCQkJJmx0OzAgMjggNTMmZ3Q7OwomZ3Q7Jmd0OyArCQl9Owom
Z3Q7Jmd0OyArCiZndDsmZ3Q7ICsJCS9vbWl0LWlmLW5vLXJlZi8KJmd0OyZndDsgKwkJcm1faW8y
OF9zYWkwX3NkaTA6IHJtLWlvMjgtc2FpMC1zZGkwIHsKJmd0OyZndDsgKwkJCXJvY2tjaGlwLHBp
bnMgPQomZ3Q7Jmd0OyArCQkJCSZsdDsxIFJLX1BDMyA3ICZhbXA7cGNmZ19wdWxsX25vbmUmZ3Q7
OwomZ3Q7Jmd0OyArCQkJcm9ja2NoaXAscm1pby1waW5zID0KJmd0OyZndDsgKwkJCQkmbHQ7MCAy
OCA1NCZndDs7CiZndDsmZ3Q7ICsJCX07CiZndDsKJmd0OyBXaHkgYXJlIHlvdSBkZWZpbmluZyBh
bGwgcGlucz8gVGhpcyBpcyB3cm9uZywgeW91ciBkcml2ZXIgaGFzIHRvIGRvIGl0LAomZ3Q7IG5v
dCBEVFMuIEFsbCB0aGVzZSBkZWZpbml0aW9ucyB3aGVuIG5vdCB1c2VkIGFyZSBqdXN0IHBvaW50
bGVzcy4KJmd0OwpUaGlzIGZpbGUgaXMgYXV0by1nZW5lcmF0ZWQgdG8gcHJvdmlkZSBhIGNvbXBs
ZXRlIHNldCBvZiBSTUlPIGNvbmZpZ3VyYXRpb25zLiAgIE91ciBpbnRlbnRpb24gaXMgdG8gb2Zm
ZXIgYSBnZW5lcmljIGxpYnJhcnkgZm9yIGFsbCBmdXR1cmUgYm9hcmQgZGV2ZWxvcGVycywgc28g
dGhleSBjYW4gc2ltcGx5IHBpY2sgdGhlIG5lZWRlZCBub2RlcyBieSBwaGFuZGxlIHdpdGhvdXQg
bWFudWFsbHkgbG9va2luZyB1cCByZWdpc3RlciB2YWx1ZXMgaW4gdGhlIGRhdGFzaGVldCBldmVy
eSB0aW1lLiAgIFRoaXMgaW1wcm92ZXMgdXNhYmlsaXR5IGFuZCBzdGFuZGFyZGl6YXRpb24uCgpX
ZSBhbHNvIHVzZWQgdGhlIC9vbWl0LWlmLW5vLXJlZi8gdGFnLCBzbyB0aGlzIHdpbGwgc3RyaWN0
bHkgbm90IGluY3JlYXNlIHRoZSBzaXplIG9mIHRoZSBjb21waWxlZCBEVEIgYmluYXJ5IGF0IGFs
bC4KCkNvdWxkIHlvdSBwbGVhc2UgcmVjb25zaWRlciBpZiB0aGlzICBhcHByb2FjaCBpcyBhY2Nl
cHRhYmxlIGdpdmVuIHRoZSB1c2FiaWxpdHkgYmVuZWZpdHM/CgpJZiB5b3Ugc3RpbGwgY29uc2lk
ZXIgdGhlIH4yNWsgbGluZXMgb2Ygc291cmNlIGNvZGUgYmxvYXQgdW5hY2NlcHRhYmxlIGZvciB1
cHN0cmVhbSwgd2Ugd2lsbCBoYXZlIHRvIGRyb3AgdGhpcyBnZW5lcmljIGR0c2kgZmlsZSBhbmQg
bGV0IHVzZXJzIChhbmQgb3Vyc2VsdmVzKSBtYW51YWxseSBkZWZpbmUgb25seSB0aGUgcmVxdWly
ZWQgbm9kZXMgd2hlbiBhZGRpbmcgYm9hcmQgc3VwcG9ydC4iCgpCZXN0IHJlZ2FyZHMsClllIFpo
YW5nCg==

