Return-Path: <linux-gpio+bounces-14405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC89FF8A2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 12:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D048B1882CDA
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371AD19993D;
	Thu,  2 Jan 2025 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qAgP656f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2476026;
	Thu,  2 Jan 2025 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735816660; cv=none; b=QorE9n5USnFRfre0kIxfHLihnDDtv3gsvN+9cUrLCj3mFVcc0Eo5MOnQXVpg8o9ENxPvR5kC/9ekQXy5W06RfWa19bkH7f+hK7I8tgjuhOhiOx9pswd7UfqWunn94NbihP/NhM/AnrMtDtTw7N2H1bvN9vnW5xkYmbiX2WCLKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735816660; c=relaxed/simple;
	bh=0xItSIxShYGLizEiPeNAw2E0IXnl6XenbDcDTP5neiw=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AU5tuZBgksy9ehVSTUUT9AywSyu5EQlw8juQUgmPthinefCdsynqc5qTLTxLO7Ymv72G2Y0HiBprfWw+ijxDknHll9riXGxdtp3DxxDpiTvzsvCGEX/xJ8nzOwW7TwKHCN1KRIVgVoVlRrvLuNeC2XSl/Kpn8bHzscS1dehqK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qAgP656f; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502A1PJ6028659;
	Thu, 2 Jan 2025 12:17:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0xItSIxShYGLizEiPeNAw2E0IXnl6XenbDcDTP5neiw=; b=qAgP656flRQouaIy
	0guIhoP9E0Yyyue5L0iYG8n4UuLuxjanolFg/wSdO26j4SsjxLTMlK9ogzVvvcmv
	83n7ThZ02ljMPZUA4PgDL9axSQJN0ZYt4u6iJAhh/I2IrnEa4QB8zp34yzZEEzWb
	Bp5NggKq2nUNSPwRIEwbUomKdhI1WWe6l5qVAw/6nuvXPRIrj6sO8etAI9nqagI7
	IoUiKbTX5QJZKKQnr4dUL+xzM7A68ldBT34As8vH9366pjOd+v5UOCZVktj88Zhh
	iAYJt5yJbio0PrXb2y020wSITZhhk2E6bLUZN+AQHGtT7T7eyA9ur0YTtzCoeHr6
	n1M8PA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43vuwmbx6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 12:17:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DCB540048;
	Thu,  2 Jan 2025 12:16:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FA0627607A;
	Thu,  2 Jan 2025 12:15:18 +0100 (CET)
Received: from [192.168.8.15] (10.252.9.169) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 2 Jan
 2025 12:15:17 +0100
Message-ID: <01c0ce6be637669ed07cfaf0aa6ef27fed7b8b16.camel@foss.st.com>
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, Mingwei Zheng <zmw12306@gmail.com>
CC: <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Thu, 2 Jan 2025 12:15:15 +0100
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
References: <20241215204014.4076659-1-zmw12306@gmail.com>
	 <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

T24gTW9uLCAyMDI0LTEyLTE2IGF0IDAwOjQxICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBP
biAxMi8xNS8yNCA5OjQwIFBNLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4g
PiBAQCAtMTYxNywxMCArMTYwMiwxOCBAQCBpbnQgc3RtMzJfcGN0bF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVJTlZBTDsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
cGN0bC0+YmFua3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5rcywgc2l6ZW9mKCpwY3RsLT5iYW5r
cyksCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdG
UF9LRVJORUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAKPiBQbGVhc2UgZHJvcCB0
aGlzIG9uZSBjaGFuZ2UuCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5iYW5rcykK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gPiDC
oCAKPiA+ICvCoMKgwqDCoMKgwqDCoHBjdGwtPmNsa3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5r
cywgc2l6ZW9mKCpwY3RsLT5jbGtzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5jbGtzKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0g
MDsgaSA8IGJhbmtzOyArK2kpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGN0
bC0+Y2xrc1tpXS5pZCA9ICIiOwo+IAo+IElzIHRoaXMgXiBhc3NpZ25tZW50IG5lY2Vzc2FyeSA/
IElmIHNvLCB3aHkgPwoKVGhlIGV4aXN0aW5nIERUcyBkb24ndCBoYXZlIHRoZSAnY2xvY2stbmFt
ZXMnIHByb3BlcnR5LCB3aG9zZSB2YWx1ZSBpcyB1c2VkIHRvIHNldCB0aGlzIHN0cnVjdCBjbGtf
YnVsa19kYXRhOjppZC4KV2l0aCB0aGlzIGZpZWxkIGtlcHQgYXQgTlVMTCwgdGhlIGVycm9yIG1l
c3NhZ2VzIGluIGNsa19idWxrX2VuYWJsZSgpIGFuZCBzaW1pbGFyIHNob3VsZCBwcmludCAnKG51
bGwpJy4KVGhpcyBsaW5lIHNldHMgaXQgdG8gZW1wdHkgc3RyaW5nLgpJIHdvdWxkIHNheSBpdCdz
IG5vdCBuZWNlc3NhcnksIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyBiZXR0ZXIgdG8gaGF2ZToK
IkZhaWxlZCB0byBlbmFibGUgY2xrICcnOiAlZCIKb3IKIkZhaWxlZCB0byBlbmFibGUgY2xrICco
bnVsbCknOiAlZCIKCkFudG9uaW8K


