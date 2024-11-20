Return-Path: <linux-gpio+bounces-13146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43C9D364C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E1A0B273C4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 09:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC940198E69;
	Wed, 20 Nov 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="QnUb6T4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED66D187844;
	Wed, 20 Nov 2024 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093344; cv=none; b=ozdDPDIunAotsekXAbSvKs/psl32Awe5F8Uf3JcGvR1BEIwxWLShu4vkMkDr0eTFNROOpafDTi/bf7mxc0/H9L8v0TIINqF0YmLyMfKQGY3TzKWHUOEEG4dbdLU3j2sCBsKEP4vS1DdQ4Euu+3bQUvPteyEqVV7kaH6b14xTiNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093344; c=relaxed/simple;
	bh=NObcMd/pDKJoTefwXJP8Z3tmXYrLhtV+PNGCZBODAtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=LJ+AmjjtT5hrHBzKV9qA/o+7A0lXD2yqSYf0U36jDcxHjdLWh50Posx+Nx0nwNgTza/BnfZuxR4aty/VbLCvf+Lq1LhdTrMkKppnZE7SvUh488AfCIL5ghDjxejcaX7hdV08adJSt1dGZcKifdW2nmM+xHs7nVDDlkwDIwAyqx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=QnUb6T4i reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=tZ5jIARjHk282aHN5DQ8T4A6a0N/QS5Szxo5yJhYO1g=; b=Q
	nUb6T4ioSet4iBQurx8KieRJ54d+EtVg8erLYN8RcnCvc543Uz4A7sBsJt/WMOA3
	ZFYAEGEJRyUWzYanIgds2sFP/aKQNnoIWvy1ZFKLUYbMbgAaDtS0anYwu238W6o/
	M1ERSXpcGXnKWzhR6d5mOwzWvyiVQTa9XFGXJOM8TM=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-130 (Coremail) ; Wed, 20 Nov 2024 17:00:41 +0800
 (CST)
Date: Wed, 20 Nov 2024 17:00:41 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Kees Cook" <kees@kernel.org>, brgl@bgdev.pl, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	geert@linux-m68k.org
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in
 drivers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
References: <20241120053055.225195-1-00107082@163.com>
 <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
X-NTES-SC: AL_Qu2YAPySvEov5ySRbekXn0oTju85XMCzuv8j3YJeN500mCXf9xIAbG5BDXrs9fmmJyqmoQmcXD1VwcJXdoVBfJPvcRKLR0xXhph+77LvVdTG
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <65fc7014.91c4.19348cd68a0.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gigvCgD3n3o5pT1niegrAA--.56786W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqRGdqmc9oqUyfQABsc
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjAgMTU6MzU6MzgsICJMaW51cyBXYWxsZWlqIiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPiB3cm90ZToKPk9uIFdlZCwgTm92IDIwLCAyMDI0IGF0IDY6MzHigK9BTSBEYXZp
ZCBXYW5nIDwwMDEwNzA4MkAxNjMuY29tPiB3cm90ZToKPgo+PiBVc2luZyBkZXZpY2UgbmFtZSBh
cyBmb3JtYXQgc3RyaW5nIG9mIHNlcV9wcmludGYoKSBpcyBwcm9uZWQgdG8KPj4gIkZvcm1hdCBz
dHJpbmcgYXR0YWNrIiwgb3BlbnMgcG9zc2liaWxpdHkgZm9yIGV4cGxvaXRhdGlvbi4KPj4gU2Vx
X3B1dHMoKSBpcyBzYWZlciBhbmQgbW9yZSBlZmZpY2llbnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+Cj4KPk9rYXkgYmV0dGVyIGdldCBLZWVzJyBl
eWUgb24gdGhpcywgaGUgbG9va3MgYWZ0ZXIgc3RyaW5nIHZ1bG5lcmFiaWxpdGllcy4KPihCdXQg
SSB0aGluayB5b3UncmUgcmlnaHQuKQo+Cj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby1hc3BlZWQtc2dw
aW8uYyAgICAgICAgICAgIHwgMiArLQo+PiAgZHJpdmVycy9ncGlvL2dwaW8tYXNwZWVkLmMgICAg
ICAgICAgICAgICAgICB8IDIgKy0KPj4gIGRyaXZlcnMvZ3Bpby9ncGlvLWVwOTN4eC5jICAgICAg
ICAgICAgICAgICAgfCAyICstCj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby1obHdkLmMgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQo+PiAgZHJpdmVycy9ncGlvL2dwaW8tbWx4YmYyLmMgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPj4gIGRyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYyAgICAgICAgICAgICAg
ICAgICAgfCAyICstCj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby1wY2E5NTN4LmMgICAgICAgICAgICAg
ICAgIHwgMiArLQo+PiAgZHJpdmVycy9ncGlvL2dwaW8tcGwwNjEuYyAgICAgICAgICAgICAgICAg
ICB8IDIgKy0KPj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXRlZ3JhLmMgICAgICAgICAgICAgICAgICAg
fCAyICstCj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYTE4Ni5jICAgICAgICAgICAgICAgIHwg
MiArLQo+PiAgZHJpdmVycy9ncGlvL2dwaW8tdHFteDg2LmMgICAgICAgICAgICAgICAgICB8IDIg
Ky0KPj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXZpc2NvbnRpLmMgICAgICAgICAgICAgICAgfCAyICst
Cj4+ICBkcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYyAgICAgICAgICAgICAgIHwgMiArLQo+
PiAgZHJpdmVycy9pcnFjaGlwL2lycS1naWMuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KPj4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtbXZlYnUtcGljLmMgICAgICAgICAgICAgfCAyICstCj4+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLXZlcnNhdGlsZS1mcGdhLmMgICAgICAgIHwgMiArLQo+PiAgZHJp
dmVycy9waW5jdHJsL2JjbS9waW5jdHJsLWlwcm9jLWdwaW8uYyAgICB8IDIgKy0KPj4gIGRyaXZl
cnMvcGluY3RybC9tdmVidS9waW5jdHJsLWFybWFkYS0zN3h4LmMgfCAyICstCj4+ICBkcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1tY3AyM3MwOC5jICAgICAgICAgIHwgMiArLQo+PiAgZHJpdmVycy9w
aW5jdHJsL3BpbmN0cmwtc3RtZnguYyAgICAgICAgICAgICB8IDIgKy0KPj4gIGRyaXZlcnMvcGlu
Y3RybC9waW5jdHJsLXN4MTUweC5jICAgICAgICAgICAgfCAyICstCj4+ICBkcml2ZXJzL3BpbmN0
cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMgICAgIHwgMiArLQo+Cj5DYW4geW91IHNwbGl0IHRo
aXMgaW4gdGhyZWUgcGF0Y2hlcyBwZXItc3Vic3lzdGVtPwo+T25lIGZvciBncGlvLCBvbmUgZm9y
IGlycWNoaXAgYW5kIG9uZSBmb3IgcGluY3RybD8KPgo+VGhlbiBzZW5kIHRvIGVhY2ggc3Vic3lz
dGVtIG1haW50YWluZXIgYW5kIENDIGtlZXMgb24KPmVhY2guCj4KPkknbSBqdXN0IHRoZSBwaW5j
dHJsIG1haW50YWluZXIuIFRoZSByZXN0IGNhbiBiZSBmb3VuZCB3aXRoCj5zY3JpcHRzL2dldF9t
YWludGFpbmVyLnBsLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBJIHdpbGwgc2VuZCBhIHBhdGNo
c2V0IGxhdGVyLgoKCj4KPllvdXJzLAo+TGludXMgV2FsbGVpagoKClRoYW5rcwpEYXZpZAo=

