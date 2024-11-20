Return-Path: <linux-gpio+bounces-13157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE999D39B0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 12:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8854DB25647
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1561A2567;
	Wed, 20 Nov 2024 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="oi+BfHp0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9B61A01BE;
	Wed, 20 Nov 2024 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732102939; cv=none; b=GAebh14FRFB9KZ5HAhePZpRz+0izZqzihJc5/pOeF5RGtHb/0cKn9wsebDN7MDSwjxwq0U4qVbFjtu94HGTjYObBL4YtmOAPdjWFOJXw93lo2BTnAcsUPcCR4V+sT8VSD79DA3hgCd13qhj9bPTvMaJIPXFv03yTWVgmyV+uwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732102939; c=relaxed/simple;
	bh=CvCJEH+Lxk8A3OmQGhvy3VkIiHAL8qBPQY/3xvua5Yc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=D/gJ8TvQFgQpZQpz2QuJo8W4pXYb5HQU06V8+Wia9bPBExJUt+D7KmwSnI0eVusEZA7xoV2jXQLWiVk4cCG4CuHn9oe4adsdasQx9r/pySWEYNp+P0Gv8p9Zs8AiG5KR7YutcIza/r7NYAlBXMEQB9te3pK2aiylKl3agtQQbpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=oi+BfHp0 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/sRJJY0JNrqdLEGJDTJnDSvIbBEf57fqyOcD4plwToo=; b=o
	i+BfHp0yo7CpgWl4iRsbC6WbtVWD88T48DoBGhsLXMI2a5px3sd1tCdHYaaL5OSx
	/azSuy/Dr2r+2BdDBLfodD6cT0q1nfwfgNvKrOjQx1XrAEsjHYKc3kG+38E8QXkM
	DR1VfczF1jfxWc1hQdyFFTxQN9J+FTOOto0/3Eqv5A=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Wed, 20 Nov 2024 19:41:43 +0800
 (CST)
Date: Wed, 20 Nov 2024 19:41:43 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, kees@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: Fix a potential abuse of seq_printf() format
 string
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAMuHMdWEuWrfj3p0pX7FX6AgOKryFUnCEBRhPkhvnSEkMwThpQ@mail.gmail.com>
References: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
 <CAMuHMdWEuWrfj3p0pX7FX6AgOKryFUnCEBRhPkhvnSEkMwThpQ@mail.gmail.com>
X-NTES-SC: AL_Qu2YAP2bvUEr5SKRZOkZnEYQheY4XMKyuPkg1YJXOp80lyTjxx4AbG5JGn/s9fmABgemoQm8YBJz9tpBXo9nWpiogbqMBx5/2flkEchxccmW
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <238c054f.ad0a.1934960d5fe.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fygvCgD3_6z4yj1nIeIsAA--.56031W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gmdqmc9uhySaAADsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjAgMTk6MDQ6MzksICJHZWVydCBVeXR0ZXJob2V2ZW4iIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4gd3JvdGU6Cj5IaSBEYXZpZCwKPgo+T24gV2VkLCBOb3YgMjAsIDIwMjQgYXQg
MTA6MTXigK9BTSBEYXZpZCBXYW5nIDwwMDEwNzA4MkAxNjMuY29tPiB3cm90ZToKPj4gVXNpbmcg
ZGV2aWNlIG5hbWUgYXMgZm9ybWF0IHN0cmluZyBvZiBzZXFfcHJpbnRmKCkgaXMgcHJvbmUgdG8K
Pj4gIkZvcm1hdCBzdHJpbmcgYXR0YWNrIiwgb3BlbnMgcG9zc2liaWxpdHkgZm9yIGV4cGxvaXRh
dGlvbi4KPj4gU2VxX3B1dHMoKSBpcyBzYWZlciBhbmQgbW9yZSBlZmZpY2llbnQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+Cj4KPlRoYW5rcyBmb3Ig
eW91ciBwYXRjaCEKPgo+PiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1hc3BlZWQtc2dwaW8uYwo+
PiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1hc3BlZWQtc2dwaW8uYwo+PiBAQCAtNDIwLDcgKzQy
MCw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zZ3Bpb19pcnFfcHJpbnRfY2hpcChzdHJ1Y3QgaXJx
X2RhdGEgKmQsIHN0cnVjdCBzZXFfZmlsZSAqcCkKPj4gICAgICAgICBpbnQgb2Zmc2V0Owo+Pgo+
PiAgICAgICAgIGlycWRfdG9fYXNwZWVkX3NncGlvX2RhdGEoZCwgJmdwaW8sICZiYW5rLCAmYml0
LCAmb2Zmc2V0KTsKPj4gLSAgICAgICBzZXFfcHJpbnRmKHAsIGRldl9uYW1lKGdwaW8tPmRldikp
Owo+PiArICAgICAgIHNlcV9wdXRzKHAsIGRldl9uYW1lKGdwaW8tPmRldikpOwo+Cj5JZiB3ZSB3
YW50IHRvIGFkZCB0aGUgbWlzc2luZyBzcGFjZSBoZXJlLCB0aGUgY29kZSBoYXMgdG8gYmUgY2hh
bmdlZAo+dG8gdXNlIHNlcV9wcmludGYoLi4uLCAiICVzIiwgLi4uKSBhZ2Fpbi4KCkl0J3Mga2lu
ZCBvZiBzdHJhbmdlIHRvIGFkZCBsZWFkaW5nIGFsaWdubWVudCBzcGFjZXMgaW4gYSBmdW5jdGlv
biBuYW1lZCB4eHhfcHJpbnRfY2hpcCgpOyAKCj4KPkhvd2V2ZXIsIGl0IG1pZ2h0IGJlIHNpbXBs
ZXIgdG8gbW92ZSB0aGlzIHRvIHRoZSBjb3JlLiBJLmUuIGFkZCBhbgo+dW5jb25kaXRpb25hbCBz
ZXFfcHV0YyhwLCAnICcpIHRvIHNob3dfaW50ZXJydXB0cygpWzFdLCBhbmQgZHJvcCB0aGUKPnNw
YWNlcyBmcm9tIGFsbCBjYWxsYmFja3MgYW5kIGZyb20gdGhlIGZhbGxiYWNrcyBpbiBzaG93X2lu
dGVycnVwdHMoKS4KCkkgd291bGQgdm90ZSBmb3IgdGhpcyBhcHByb2FjaCwgICBpZiB3ZSB3YW50
IHRvIGZpeCAgdGhvc2UgbWlzYmVoYXZpbmcgYWxpZ25tZW50cy4KSXQncyBjbGVhbmVyLgoKCj4K
PlsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMi9zb3VyY2Uva2VybmVs
L2lycS9wcm9jLmMjTDUwMwo+Cj5HcntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKPgo+LS0gCj5HZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4KPkluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKPndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCgpUaGFua3N+CkRhdmlkCg==

