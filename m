Return-Path: <linux-gpio+bounces-16568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75802A4439E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FB2188A644
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E519A269AEA;
	Tue, 25 Feb 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YZp6zgol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CB21ABD9;
	Tue, 25 Feb 2025 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494995; cv=none; b=Bgi8XV7QsAXDSy+BpdB4+bHIY4sh0/muotMiKIF+Yi5fh49LcQEdYzG3g80oMRhRXMwUNpWnqsPYPrCjNpPoucgnGA3W/1ZLp8VPFEOkkei5oP9H9vrEoBjTxXRunnupB16AKwCmNsLRwYL3QsV8t+Jsqbz8pj95FHZljfZcdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494995; c=relaxed/simple;
	bh=iAtUl7zwcz1Now21mC+GJk1Tn22R4znqqgsbJoAzsVY=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQtwPbMzSr9wcFdbTQjuRQw2cer+ahYnjiWjJIuxncIACNOkwVQQ1wmvf0DdJgyCrhKi+9AgaxHqrACnn/rxQc70hu1e1VKXnfDwMy4Zmk/5bRh6W/u11IL/aGd+jqLlc+mM4DxOU529UkXMiGH7pQSG9X4/1LLT7SF/+EAnebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YZp6zgol; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PBQGDH002601;
	Tue, 25 Feb 2025 15:49:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iAtUl7zwcz1Now21mC+GJk1Tn22R4znqqgsbJoAzsVY=; b=YZp6zgolHnko3Lbj
	M0bUrLXBgl37e5ErO+judU+SzkC95RiIpYbFybh+oFw/zXOSJ+HeQX1mwEIXjWs4
	2AsPKjj0Ye8zCrVo+SyO/xEsP/Nka3OrjlgnH5fGaWSCXP+qSwv63CT3H5k3Q6A+
	ELIUg3p1FVEXcAFfxG5Wdx+AhFckyd9kqbzoOQKFGm6sNPTqqRmwpjic59XBdgwM
	8eJpSPysX2fUTEnB1RkMgdAgxNt+NxAtJGzTn0pKt4VVntrwVOytCFO/5XUWgDD0
	nWi/QCFVNgt1UlyiUMJWinxd/22SjItFfPwEirmTT1W4nRKnF2aGA9IYxdOoapsI
	JVGvHQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spkxf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 15:49:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B15A4007A;
	Tue, 25 Feb 2025 15:48:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8C195E2380;
	Tue, 25 Feb 2025 14:19:49 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.14) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 14:19:49 +0100
Message-ID: <ca48a3e6586ca5b1afd6e1bd81c612545df60e52.camel@foss.st.com>
Subject: Re: [PATCH 1/8] gpiolib: check the return value of
 gpio_chip::get_direction()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <stable@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Date: Tue, 25 Feb 2025 14:19:46 +0100
In-Reply-To: <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
	 <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
	 <CGME20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254@eucas1p1.samsung.com>
	 <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01

T24gV2VkLCAyMDI1LTAyLTE5IGF0IDA5OjM4ICswMTAwLCBNYXJlayBTenlwcm93c2tpIHdyb3Rl
Ogo+IEhpIEJhcnRvc3osCj4gCj4gT24gMTAuMDIuMjAyNSAxMTo1MSwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6
ZXdza2lAbGluYXJvLm9yZz4KPiA+IAo+ID4gQXMgcGVyIHRoZSBBUEkgY29udHJhY3QgLSBncGlv
X2NoaXA6OmdldF9kaXJlY3Rpb24oKSBtYXkgZmFpbCBhbmQgcmV0dXJuCj4gPiBhIG5lZ2F0aXZl
IGVycm9yIG51bWJlci4gSG93ZXZlciwgd2UgdHJlYXQgaXQgYXMgaWYgaXQgYWx3YXlzIHJldHVy
bmVkIDAKPiA+IG9yIDEuIENoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIGNhbGxiYWNrIGFu
ZCBwcm9wYWdhdGUgdGhlIGVycm9yCj4gPiBudW1iZXIgdXAgdGhlIHN0YWNrLgo+ID4gCj4gPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiDCoCBk
cml2ZXJzL2dwaW8vZ3Bpb2xpYi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGli
LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jCj4gPiBpbmRleCA2NzllZDc2NGNiMTQuLjVkMzc3
NGRjNzQ4YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3Bpby9ncGlvbGliLmMKPiA+IEBAIC0xMDU3LDggKzEwNTcsMTEgQEAgaW50IGdw
aW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5KHN0cnVjdCBncGlvX2NoaXAgKmdjLCB2b2lkICpkYXRh
LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXNjLT5nZGV2ID0gZ2RldjsK
PiA+IMKgIAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZ2MtPmdldF9k
aXJlY3Rpb24gJiYgZ3Bpb2NoaXBfbGluZV9pc192YWxpZChnYywgZGVzY19pbmRleCkpIHsKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXNzaWduX2Jp
dChGTEFHX0lTX09VVCwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmRlc2MtPmZsYWdzLCAhZ2MtPmdldF9kaXJl
Y3Rpb24oZ2MsIGRlc2NfaW5kZXgpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZ2MtPmdldF9kaXJlY3Rpb24oZ2MsIGRlc2NfaW5kZXgp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAo
cmV0IDwgMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2NsZWFudXBfZGVzY19zcmN1Owo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc3NpZ25fYml0
KEZMQUdfSVNfT1VULCAmZGVzYy0+ZmxhZ3MsICFyZXQpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYXNzaWduX2JpdChGTEFHX0lTX09VVCwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICZkZXNjLT5mbGFncywgIWdjLT5kaXJlY3Rpb25faW5wdXQpOwo+IAo+IFRoaXMgY2hhbmdlIGJy
ZWFrcyBiY20yODM1IHBpbmNvbnRyb2wvZ3BpbyBkcml2ZXIgKGFuZCBwcm9iYWJseSBvdGhlcnMp
IAo+IGluIG5leHQtMjAyNTAyMTguIFRoZSBwcm9ibGVtIGlzIHRoYXQgc29tZSBncGlvIGxpbmVz
IGFyZSBpbml0aWFsbHkgCj4gY29uZmlndXJlZCBhcyBhbHRlcm5hdGUgZnVuY3Rpb24gKGkuZS4g
dWFydCkgYW5kIC5nZXRfZGlyZWN0aW9uIHJldHVybnMgCj4gLUVJTlZBTCBmb3IgdGhlbSwgd2hh
dCBpbiB0dXJuIGNhdXNlcyB0aGUgd2hvbGUgZ3BpbyBjaGlwIGZhaWwgdG8gCj4gcmVnaXN0ZXIu
IEhlcmUgaXMgdGhlIGxvZyB3aXRoIFdBUk5fT04oKSBhZGRlZCB0byBsaW5lIAo+IGRyaXZlcnMv
cGluY3RybC9iY20vcGluY3RybC1iY20yODM1LmM6MzUwIGZyb20gUmFzcGJlcnJ5IFBpIDRCOgoK
U2FtZSBpc3N1ZSB3aXRoIFNUTTMyIHBpbmN0cmwuCgpJIHdpbGwgc2VuZCBvdXQgc2hvcnRseSBh
IHBhdGNoLCBzaW1pbGFyIHRvCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIxOTEw
Mjc1MC4zODUxOS0xLWJyZ2xAYmdkZXYucGwvCgpSZWdhcmRzLApBbnRvbmlvCgo=


