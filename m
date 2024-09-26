Return-Path: <linux-gpio+bounces-10449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0E986CE2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 08:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06AF928254A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 06:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A86618E372;
	Thu, 26 Sep 2024 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="BlvMWbVT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B64C18DF92;
	Thu, 26 Sep 2024 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333381; cv=none; b=YtTQsDI1x4xSXZ4OOmVXmLkusLwudTBwujGaxJZgf2LTzeY/WlVWwoYgiFyUs2wSPnVVQu+YMAKPx8TnaFNWc40OTG2eAb9D43FBuJlddP5jG84KIwyKHvVuXynxXcw8W6gkjjKyv3eLT3oW+EVDHNa8Bv1AN1ZS+Fxp39sPai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333381; c=relaxed/simple;
	bh=tqh/odynIxXOQ1waZJqQvC8VrmDUVp97OnoXEwg2YRc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YkoqDSwKhlPikIubv0tBD0r1wyHTK/HF4Nc4+ltOXdBsjfIvhIAUtXfA7OpSP0irV2ZQVIERhTf8IjknlbdA37U8UxOcNlx58o5cNRTcHrBXRNTxpneIrqH/+h8h0R91Mriqc1NIrqTNEnuZ2cVVy8tS5SzF7Z7zISHNYNO+fo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me; spf=pass smtp.mailfrom=maquefel.me; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=BlvMWbVT; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (unknown [IPv6:2a02:6b8:c08:df8e:0:640:17d3:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 79BD86239B;
	Thu, 26 Sep 2024 09:44:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id EiO1hD0g1uQ0-WgLdjpxD;
	Thu, 26 Sep 2024 09:44:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1727333055; bh=tqh/odynIxXOQ1waZJqQvC8VrmDUVp97OnoXEwg2YRc=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=BlvMWbVTj+3/JU4Q6bpN+tkgXHMNJpecWcUNulBHjSf/0TdosxuOgr7mJc4v10WAZ
	 SJU8v+v2QUoqVXalDqusCX9K8hi5gd26TSVgXHb8abbMmZ0qwQ6zMIIi8TBXkh5wEi
	 bRijCpBZhIMiOCJKj/DT8tlAhbtDNaJkUawHFtGI=
Authentication-Results: mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <555edaf290dd3dd4e1c3cc635b41de05ed4af350.camel@maquefel.me>
Subject: Re: [PATCH] dt-bindings: gpio: ep9301: Add missing
 "#interrupt-cells" to examples
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, Arnd Bergmann
	 <arnd@arndb.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski
	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Date: Thu, 26 Sep 2024 09:44:14 +0300
In-Reply-To: <20240925173510.1907048-1-robh@kernel.org>
References: <20240925173510.1907048-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Yandex-Filter: 1

SGkgUm9iIQoKVGhhbmsgeW91IQoKUmV2aWV3ZWQtYnk6IE5pa2l0YSBTaHViaW4gPG5pa2l0YS5z
aHViaW5AbWFxdWVmZWwubWU+CgpPbiBXZWQsIDIwMjQtMDktMjUgYXQgMTI6MzUgLTA1MDAsIFJv
YiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gCj4gRW5hYmxpbmcgZHRjIGludGVycnVwdF9wcm92aWRlciBjaGVjayByZXZlYWxzIHRo
ZSBleGFtcGxlcyBhcmUKPiBtaXNzaW5nCj4gdGhlICIjaW50ZXJydXB0LWNlbGxzIiBwcm9wZXJ0
eSBhcyBpdCBpcyBhIGRlcGVuZGVuY3kgb2YKPiAiaW50ZXJydXB0LWNvbnRyb2xsZXIiLgo+IAo+
IFNvbWUgb2YgdGhlIGluZGVudGF0aW9uIGlzIG9mZiwgc28gZml4IHRoYXQgdG9vLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
wqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLWVwOTMwMS55YW1s
IHwgOSArKysrKystLQo+IC0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncGlvL2dwaW8tZXA5MzAxLnlhbWwKPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncGlvL2dwaW8tZXA5MzAxLnlhbWwKPiBpbmRleCBkYWFkZmI0OTI2YzMuLjNh
MTA3OWQ2ZWUyMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3Bpby9ncGlvLWVwOTMwMS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwaW8vZ3Bpby1lcDkzMDEueWFtbAo+IEBAIC03Myw5ICs3MywxMCBAQCBleGFt
cGxlczoKPiDCoMKgwqDCoMKgwqAgcmVnLW5hbWVzID0gImRhdGEiLCAiZGlyIiwgImludHIiOwo+
IMKgwqDCoMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4gwqDCoMKgwqDCoMKgICNncGlvLWNlbGxz
ID0gPDI+Owo+IC3CoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiAtwqDCoMKg
wqDCoMKgwqAgaW50ZXJydXB0LXBhcmVudCA9IDwmdmljMT47Cj4gLcKgwqDCoMKgwqDCoMKgIGlu
dGVycnVwdHMgPSA8Mjc+Owo+ICvCoMKgwqDCoMKgIGludGVycnVwdC1jb250cm9sbGVyOwo+ICvC
oMKgwqDCoMKgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47Cj4gK8KgwqDCoMKgwqAgaW50ZXJydXB0
LXBhcmVudCA9IDwmdmljMT47Cj4gK8KgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDwyNz47Cj4gwqDC
oMKgwqAgfTsKPiDCoAo+IMKgwqDCoMKgIGdwaW9AODA4NDAwMDQgewo+IEBAIC04Nyw2ICs4OCw3
IEBAIGV4YW1wbGVzOgo+IMKgwqDCoMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4gwqDCoMKgwqDC
oMKgICNncGlvLWNlbGxzID0gPDI+Owo+IMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtY29udHJvbGxl
cjsKPiArwqDCoMKgwqDCoCAjaW50ZXJydXB0LWNlbGxzID0gPDI+Owo+IMKgwqDCoMKgwqDCoCBp
bnRlcnJ1cHQtcGFyZW50ID0gPCZ2aWMxPjsKPiDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDwy
Nz47Cj4gwqDCoMKgwqAgfTsKPiBAQCAtMTI3LDYgKzEyOSw3IEBAIGV4YW1wbGVzOgo+IMKgwqDC
oMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7Cj4gwqDCoMKgwqDCoMKgICNncGlvLWNlbGxzID0gPDI+
Owo+IMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiArwqDCoMKgwqDCoCAjaW50
ZXJydXB0LWNlbGxzID0gPDI+Owo+IMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzLWV4dGVuZGVkID0g
PCZ2aWMwIDE5PiwgPCZ2aWMwIDIwPiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnZpYzAgMjE+LCA8JnZpYzAgMjI+LAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmdmlj
MSAxNT4sIDwmdmljMSAxNj4sCgo=


