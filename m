Return-Path: <linux-gpio+bounces-13606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD59E803E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 15:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D2718841EA
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8EB1474BF;
	Sat,  7 Dec 2024 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="A57+/reI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0551DFE1;
	Sat,  7 Dec 2024 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733581561; cv=none; b=mhGwGfQKJQgCDn7sG8YUT5xNP+f0HGPD7/TGPsky5s9RSEFOoqQwzcQh8umjX5/kxjPSR3xgOWo23++Ng1EWyJX4sq4iScpp7/SlLxSYhtzNCzDgu+Rl/YfMK+PuiPJEAKX+/3V8Tk9FaEd8d+tVehWEwppV3u/NcOiAcqz0jKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733581561; c=relaxed/simple;
	bh=bF6PNe/ChQQDFcbl9h9gy6D7XceLeXlQwJ6ZL3vkpRk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pN3xsagwS045l1ZpZ6u/zMLtOrIisJH7Mdj/igy7dVxpw6bO3APF00hPJUzgP5ZGacFhxncm/FdbFVLjENOi3LxO+KS3Bmtezk68LtOa1tu2FamxNHjZpXf4are/Je/4c8bGD3R0uUEo82+UdAdunrsPLMtcH6rTwcw9IPt6KLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A57+/reI; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B74dQUp011421;
	Sat, 7 Dec 2024 15:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bF6PNe/ChQQDFcbl9h9gy6D7XceLeXlQwJ6ZL3vkpRk=; b=A57+/reIh0OcNQH3
	6kaUCk6+nHoCLDBoygbcLkCtiffGYs9QG+O/VCSN8jS4HBzq8isBkwH1j5dLMk4P
	5B9R/iABJZIga+c8g7fD367rOePIfutzMjyMB4mfq2Kfj7P+qmap9m3myvN/IVFB
	Qswov/0DC5FYMpnQtHby5rL/tBmT6TF/7NRcYfQ4PcjZj9FdW266OLkLRW1STfFS
	Cj5Bl4koaI4fndDgSqNZ4SQePA2rIshypXQnwqpcnEuiuNX/HOVl0TtiUi4flLbU
	+b7qtr6jdCF4SrOSqbfauAWjpWVbJSkm1hIml9+TWDpNFttm1I8C4sBrj4TYSred
	oxrynQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 438d54xex4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Dec 2024 15:25:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FB9140045;
	Sat,  7 Dec 2024 15:24:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BCF2259686;
	Sat,  7 Dec 2024 15:23:16 +0100 (CET)
Received: from [192.168.8.15] (10.252.24.249) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Sat, 7 Dec
 2024 15:23:14 +0100
Message-ID: <21f4927382a3cf3bb433bc1f1d7d4ad9ea1a2a5e.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for
 clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mingwei Zheng <zmw12306@gmail.com>, <marex@denx.de>
CC: <peng.fan@nxp.com>, <make24@iscas.ac.cn>, <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        Jiasheng Jiang
	<jiashengjiangcool@gmail.com>,
        <fabien.dessenne@foss.st.com>, <mcoquelin.stm32@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Date: Sat, 7 Dec 2024 15:23:13 +0100
In-Reply-To: <20241206214315.3385033-1-zmw12306@gmail.com>
References: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

T24gRnJpLCAyMDI0LTEyLTA2IGF0IDE2OjQzIC0wNTAwLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+
IENvbnZlcnQgdGhlIGRyaXZlciB0byBjbGtfYnVsayooKSBBUEkuCj4gQWRkIGNoZWNrIGZvciB0
aGUgcmV0dXJuIHZhbHVlIG9mIGNsa19idWxrX2VuYWJsZSgpIHRvIGNhdGNoCj4gdGhlIHBvdGVu
dGlhbCBlcnJvci4KPiAKPiBGaXhlczogMDVkOGFmNDQ5ZDkzICgicGluY3RybDogc3RtMzI6IEtl
ZXAgcGluY3RybCBibG9jayBjbG9jayBlbmFibGVkIHdoZW4gTEVWRUwgSVJRIHJlcXVlc3RlZCIp
Cj4gU2lnbmVkLW9mZi1ieTogTWluZ3dlaSBaaGVuZyA8em13MTIzMDZAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ2ppYW5nY29vbEBnbWFpbC5jb20+
Cj4gLS0tCj4gQ2hhbmdlbG9nOgo+IAo+IHYyIC0+IHYzOgo+IAo+IDEuIENvbnZlcnQgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlIHRvIGNsa19idWxrX2Rpc2FibGUKPiBhbmQgY2xrX2J1bGtfdW5wcmVw
YXJlLgo+IAo+IHYxIC0+IHYyOgo+IAo+IDEuIE1vdmUgaW50IHJldCBkZWNsYXJhdGlvbiBpbnRv
IGlmIGJsb2NrLgo+IC0tLQo+IMKgZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIu
YyB8IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jIGIvZHJpdmVycy9waW5jdHJsL3N0bTMyL3Bp
bmN0cmwtc3RtMzIuYwo+IGluZGV4IDViN2ZhNzdjMTE4NC4uMGVmOTEyZTgyNzM2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKPiArKysgYi9kcml2
ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCj4gQEAgLTg2LDcgKzg2LDYgQEAgc3Ry
dWN0IHN0bTMyX3BpbmN0cmxfZ3JvdXAgewo+IMKgCj4gwqBzdHJ1Y3Qgc3RtMzJfZ3Bpb19iYW5r
IHsKPiDCoMKgwqDCoMKgwqDCoMKgdm9pZCBfX2lvbWVtICpiYXNlOwo+IC3CoMKgwqDCoMKgwqDC
oHN0cnVjdCBjbGsgKmNsazsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHJlc2V0X2NvbnRyb2wg
KnJzdGM7Cj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5sb2NrX3QgbG9jazsKPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IGdwaW9fY2hpcCBncGlvX2NoaXA7Cj4gQEAgLTEwOCw2ICsxMDcsNyBAQCBzdHJ1
Y3Qgc3RtMzJfcGluY3RybCB7Cj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIG5ncm91cHM7Cj4g
wqDCoMKgwqDCoMKgwqDCoGNvbnN0IGNoYXIgKipncnBfbmFtZXM7Cj4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCBzdG0zMl9ncGlvX2JhbmsgKmJhbmtzOwoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQpX
aGlsZSBpdCdzIGdyb3dpbmcgd2lkZXIgdGhhbiB5b3VyIGluaXRpYWwgc2NvcGUsIGl0IGxvb2tz
IGFzIGEgbmljZSBpbXByb3ZlbWVudC4KCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGNsa19idWxr
X2RhdGEgKmNsa3M7CgpNYXliZSBJJ3ZlIG1pc3NlZCBpdCBidXQsIHdoZXJlIGRvZXMgdGhpcyBh
cnJheSBnZXQgYWxsb2NhdGVkPwpUaGVyZSBleGlzdCBjbGtfYnVsa19nZXRfYWxsKCkgYW5kIGRl
dm1fY2xrX2J1bGtfZ2V0X2FsbCgpIHRoYXQgZG8gdGhlIGFsbG9jYXRpb24gZm9yIHlvdSwgYnV0
IHRoZXkgcmVxdWlyZSBhbGwgdGhlIGNsb2NrcyB0byBiZSBsaXN0ZWQgaW4gdGhlIHNhbWUgImNs
b2NrcyIgcHJvcGVydHksIHdoaWxlIHRoaXMgZHJpdmVyIGhhcyBhIGNsb2NrIGluCmVhY2ggRFQg
c3Vibm9kZSEKU29tZSBzdWdnZXN0aW9uIGJlbG93LgoKPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWdu
ZWQgbmJhbmtzOwo+IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3Qgc3RtMzJfcGluY3RybF9t
YXRjaF9kYXRhICptYXRjaF9kYXRhOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaXJxX2RvbWFp
bsKgwqDCoMKgwqDCoMKgKmRvbWFpbjsKPiBAQCAtMTMwOCw3ICsxMzA4LDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9ncGlvbGliX3JlZ2lzdGVyX2Jhbmsoc3RydWN0IHN0bTMyX3BpbmN0cmwgKnBjdGws
IHN0cnVjdCBmd25vZGUKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VSUihiYW5rLT5iYXNlKSkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQVFJfRVJSKGJhbmstPmJh
c2UpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKGJhbmst
PmNsayk7Cj4gK8KgwqDCoMKgwqDCoMKgZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKHBjdGwtPmNs
a3NbcGN0bC0+bmJhbmtzXS5jbGspOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBwcmVw
YXJlX2VuYWJsZSBjbGsgKCVkKVxuIiwgZXJyKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBlcnI7Cj4gQEAgLTEzOTcsNyArMTM5Nyw3IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfZ3Bpb2xpYl9yZWdpc3Rlcl9iYW5rKHN0cnVjdCBzdG0zMl9waW5jdHJsICpwY3RsLCBzdHJ1
Y3QgZndub2RlCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgCj4gwqBlcnJfY2xrOgo+
IC3CoMKgwqDCoMKgwqDCoGNsa19kaXNhYmxlX3VucHJlcGFyZShiYW5rLT5jbGspOwo+ICvCoMKg
wqDCoMKgwqDCoGNsa19kaXNhYmxlX3VucHJlcGFyZShwY3RsLT5jbGtzW3BjdGwtPm5iYW5rc10u
Y2xrKTsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiDCoH0KPiDCoAo+IEBAIC0xNjMx
LDExICsxNjMxLDEwIEBAIGludCBzdG0zMl9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRVBST0JFX0RFRkVSOwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IC0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYmFuay0+Y2xrID0gb2ZfY2xrX2dldF9ieV9uYW1lKG5wLCBOVUxMKTsKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX0VSUihiYW5rLT5jbGspKSB7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBjdGwtPmNsa3NbaV0uY2xrID0gb2ZfY2xrX2dldF9ieV9u
YW1lKG5wLCBOVUxMKTsKClRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgdGhlIGFycmF5IGlzIHVzZWQs
IGR1cmluZyBzdG0zMl9wY3RsX3Byb2JlKCksIHNvIHRoZSBhcnJheSBzaG91bGQgYmUgYWxyZWFk
eSBhbGxvY2F0ZWQgYmVmb3JlIHRoaXMgbGluZS4KVGhlIG51bWJlciBvZiBiYW5rcyBwY3RsLT5u
YmFua3MgaXMgY29tcHV0ZWQgZmV3IGxpbmVzIGJlbG93LCBzbyBpdCBzaG91bGQgYmUgYW50aWNp
cGF0ZWQsIG9yIGJlaW5nIHJlcGxhY2VkIGJ5IGEgc2ltcGxlcgogIHBjdGwtPm5iYW5rcyA9IGdw
aW9jaGlwX25vZGVfY291bnQoZGV2KTsKCnRoZW4gYWxsb2NhdGlvbiBjb3VsZCBiZSBkb25lIHdp
dGgKICBwY3RsLT5jbGtzID0gZGV2bV9rbWFsbG9jX2FycmF5KGRldiwgcGN0bC0+bmJhbmtzLCBz
aXplb2YoKnBjdGwtPmNsa3MpLCBHRlBfS0VSTkVMKTsKCkFsc28sIHlvdSBuZXZlciBhc3NpZ24g
YHBjdGwtPmNsa3NbaV0uaWRgIHdoaWNoIGlzIHRoZW4gdXNlZCBieSB0aGUgZXJyb3IgbWVzc2Fn
ZXMgaW4sIGUuZy4sIGNsa19idWxrX2VuYWJsZSgpLgpXZSBkb24ndCBtYW5kYXRlIHRoZSBwcm9w
ZXJ0eSAiY2xvY2stbmFtZXMiIGluIHRoZSBEVCBzdWJub2Rlcywgc28gbm8gd2F5IHRvIGdldCBh
IHJlYXNvbmFibGUgdmFsdWUgZnJvbSB0aGUgRFQuCkkgcHJlc3VtZSBpdCdzIGZpbmUgdG8gc2V0
IGl0IHRvIE5VTEwuLi4gdG8gYmUgdGVzdGVkLgoKUmVnYXJkcywKQW50b25pbwoKCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIocGN0bC0+Y2xrc1tpXS5jbGspKSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZndub2Rl
X2hhbmRsZV9wdXQoY2hpbGQpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGJhbmstPmNsayks
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocGN0bC0+Y2xrc1tpXS5jbGspLAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImZhaWxlZCB0byBnZXQgY2xrXG4iKTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGkrKzsKPiBAQCAtMTY0Niw4ICsxNjQ1LDggQEAgaW50IHN0bTMyX3BjdGxfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChyZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBmd25vZGVfaGFuZGxlX3B1dChjaGlsZCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBwY3RsLT5uYmFu
a3M7IGkrKykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjbGtfZGlzYWJsZV91bnByZXBhcmUocGN0bC0+YmFua3NbaV0uY2xr
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa19i
dWxrX2Rpc2FibGUocGN0bC0+bmJhbmtzLCBwY3RsLT5jbGtzKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa19idWxrX3VucHJlcGFyZShwY3RsLT5u
YmFua3MsIHBjdGwtPmNsa3MpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoH0KPiBAQCAtMTcyNiwxMCArMTcyNSw4IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQgc3RtMzJfcGluY3RybF9yZXN0b3JlX2dwaW9fcmVncygKPiDCoGludCBfX21heWJlX3VudXNl
ZCBzdG0zMl9waW5jdHJsX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+IMKgewo+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3Qgc3RtMzJfcGluY3RybCAqcGN0bCA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+IC3CoMKgwqDCoMKgwqDCoGludCBpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChp
ID0gMDsgaSA8IHBjdGwtPm5iYW5rczsgaSsrKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjbGtfZGlzYWJsZShwY3RsLT5iYW5rc1tpXS5jbGspOwo+ICvCoMKgwqDCoMKgwqDCoGNs
a19idWxrX2Rpc2FibGUocGN0bC0+bmJhbmtzLCBwY3RsLT5jbGtzKTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiBAQCAtMTczOCwxMCArMTczNSwxMSBAQCBpbnQgX19t
YXliZV91bnVzZWQgc3RtMzJfcGluY3RybF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+IMKg
ewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgc3RtMzJfcGluY3RybCAqcGN0bCA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgc3RtMzJfcGluY3RybF9ncm91
cCAqZyA9IHBjdGwtPmdyb3VwczsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiArwqDCoMKgwqDC
oMKgwqBpbnQgaSwgcmV0Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IHBj
dGwtPm5iYW5rczsgaSsrKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbGtfZW5h
YmxlKHBjdGwtPmJhbmtzW2ldLmNsayk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gY2xrX2J1bGtf
ZW5hYmxlKHBjdGwtPm5iYW5rcywgcGN0bC0+Y2xrcyk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJl
dCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoAo+IMKg
wqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgcGN0bC0+bmdyb3VwczsgaSsrLCBnKyspCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdG0zMl9waW5jdHJsX3Jlc3RvcmVfZ3Bp
b19yZWdzKHBjdGwsIGctPnBpbik7Cg==


