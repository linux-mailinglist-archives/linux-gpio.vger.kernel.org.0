Return-Path: <linux-gpio+bounces-25290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE11B3DB27
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 09:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994B517B9A3
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 07:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83822267AF1;
	Mon,  1 Sep 2025 07:34:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB29246783
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712089; cv=none; b=Q11dGPF3z3MLRx3LPdgmi9z2YTZ3o18ffWTqc1oCYM6Os9vdp2Zrp582Xa+uBZ7oR9/c9EnwyhPsmaIKuZnjsxK2JbzZL5aEo7Ei20u0tq4RuLkQ6VxdRg+L08/AhHc1xHivM1PzhbYP4AgncTCN0bt0gTcytSpuwi3FSXjKEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712089; c=relaxed/simple;
	bh=jtCNdDVnh9c1i15f4HIzbuRjVrt1C5TCRoo5NeXfAD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QgLnFYTR2qd/45c0VMB4cTk57OsufgFFGbT2J6xj9viulTBk2eCImpnd3zHe9/4RTOdSkiYK9U0jmlsNZzdrwxo3ZPEdyl0Gvy2J+/Vm9GfRv+7yg3bI94V/2imqElCVxzId0JUpZhDBBGkeNUeGn/8YxFunyOpSjVimRlCgTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from luyulin$eswincomputing.com ( [10.12.96.77] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 1 Sep 2025 15:34:34 +0800 (GMT+08:00)
Date: Mon, 1 Sep 2025 15:34:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: luyulin@eswincomputing.com
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: eswin: Add EIC7700 pinctrl driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2025 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aKRGiZ-fai0bv0tG@stanley.mountain>
References: <aKRGiZ-fai0bv0tG@stanley.mountain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c953e90.a26.1990432fe57.Coremail.luyulin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgA31pSKTLVolz7GAA--.23679W
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEMA2i0ePYinQAA
	si
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGksIERhbgoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBmaW5kaW5ncyBhbmQgc3VnZ2Vz
dGlvbnMuCkkgd291bGQgYWxzbyBsaWtlIHRvIGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZyB3aXRo
IHlvdS4KCj4gCj4gSGVsbG8gWXVsaW4gTHUsCj4gCj4gQ29tbWl0IDViNzk3YmNjMDBlZiAoInBp
bmN0cmw6IGVzd2luOiBBZGQgRUlDNzcwMCBwaW5jdHJsIGRyaXZlciIpCj4gZnJvbSBKdW4gMTIs
IDIwMjUgKGxpbnV4LW5leHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMK
PiBjaGVja2VyIHdhcm5pbmc6Cj4gCj4gCWRyaXZlcnMvcGluY3RybC9waW5jdHJsLWVpYzc3MDAu
Yzo2MzggZWljNzcwMF9waW5jdHJsX3Byb2JlKCkKPiAJd2FybjogcGFzc2luZyB6ZXJvIHRvICdQ
VFJfRVJSJwo+IAo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWVpYzc3MDAuYwo+ICAgICA2MzUg
Cj4gICAgIDYzNiAgICAgICAgIHJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2
cmdtaWkiKTsKPiAgICAgNjM3ICAgICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKHJlZ3VsYXRvcikp
IHsKPiAtLT4gNjM4ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBU
Ul9FUlIocmVndWxhdG9yKSwKPiAKPiBkZXZtX3JlZ3VsYXRvcl9nZXQoKSB3aWxsIHJldHVybiBO
VUxMIGlmIENPTkZJR19SRUdVTEFUT1IgaXMgZGlzYWJsZWQuCj4gUFRSX0VSUihOVUxMKSBpcyBz
dWNjZXNzLgo+IAo+ICAgICA2MzkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiZmFpbGVkIHRvIGdldCB2cmdtaWkgcmVndWxhdG9yXG4iKTsKPiAgICAgNjQwICAgICAg
ICAgfQo+ICAgICA2NDEgCj4gICAgIDY0MiAgICAgICAgIHZvbHRhZ2UgPSByZWd1bGF0b3JfZ2V0
X3ZvbHRhZ2UocmVndWxhdG9yKTsKPiAgICAgNjQzICAgICAgICAgaWYgKHZvbHRhZ2UgPCAwKSB7
Cj4gICAgIDY0NCAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRl
diwgdm9sdGFnZSwKPiAgICAgNjQ1ICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRv
IGdldCB2b2x0YWdlIGZyb20gcmVndWxhdG9yXG4iKTsKPiAKPiBJZiBDT05GSUdfUkVHVUxBVE9S
IGlzIGRpc2FibGVkIHRoZW4gdGhpcyB3aWxsIHJldHVybiBuZWdhdGl2ZS4gIFNvIHRoaXMKPiBk
cml2ZXIgY2FuJ3Qgd29yayB3aXRob3V0IGEgcmVndWxhdG9yLiAgSWRlYWxseSB0aGUgS0NvbmZp
ZyB3b3VsZCBlbmZvcmNlCj4gdGhhdCBzbyB3ZSBkb24ndCBidWlsZCBkcml2ZXJzIHdoaWNoIGNh
bid0IHdvcmsuCgpUaGFuayB5b3UhIFlvdSBhcmUgcmlnaHQuwqBJU19FUlJfT1JfTlVMTMKgc2hv
dWxkIGJlIGNoYW5nZWQgdG/CoElTX0VSUi4KQmFzZWQgb24geW91ciBwcm9mZXNzaW9uYWwgYWR2
aWNlLCBzaG91bGQgSSBhZGTCoCJkZXBlbmRzIG9uIFJFR1VMQVRPUiIgYW5kCiJkZXBlbmRzIG9u
IFJFR1VMQVRPUl9GSVhFRF9WT0xUQUdFIiBpbiB0aGUgS2NvbmZpZyB0byBlbmZvcmNlIGNvbXBp
bGF0aW9uIGRlcGVuZGVuY2llcz8KCj4gCj4gSW4gdGhhdCBjYXNlIHRoZSBpZiAoSVNfRVJSX09S
X05VTEwoKSkgY2hlY2sgc2hvdWxkIGJlIGNoYW5nZWQgdG8KPiBpZiAoSVNfRVJSKCkpIHsuICBT
ZWUgbXkgYmxvZyBmb3IgbW9yZSBkZXRhaWxzOgo+IGh0dHBzOi8vc3RhdGljdGhpbmtpbmcud29y
ZHByZXNzLmNvbS8yMDIyLzA4LzAxL21peGluZy1lcnJvci1wb2ludGVycy1hbmQtbnVsbC8KPiAK
PiAgICAgNjQ2ICAgICAgICAgfQo+ICAgICA2NDcgCj4gICAgIDY0OCAgICAgICAgIHJnbWlpMF9t
b2RlID0gcmVhZGxfcmVsYXhlZChwYy0+YmFzZSArIEVJQzc3MDBfUkdNSUkwX1NFTF9NT0RFKTsK
PiAKPiByZWdhcmRzLAo+IGRhbiBjYXJwZW50ZXIKCkJlc3QgUmVnYXJkcywKWXVsaW4K

