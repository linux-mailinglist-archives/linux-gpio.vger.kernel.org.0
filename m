Return-Path: <linux-gpio+bounces-23949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68395B18190
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90121C82556
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C81244678;
	Fri,  1 Aug 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pMI+DzY9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F7E2356CB;
	Fri,  1 Aug 2025 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050774; cv=none; b=QJaDZl6coancNFOdTyiR0o+y6tdW2z/rdB8Gi2ORRpJOqeAFpI4vc/anFAeO9OnDJcD7yBqxarHDBaTck01mh1LERK3KUVSnjtMy20LYhR265YlMj20tC1+hSP0DV4sFhFgIkq4pd88QS3PkJsE3P2qoEC9uYM8iRxWmczX5zhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050774; c=relaxed/simple;
	bh=WfYYyoKfLd1GrN54j6/DszN35nTkNYozIBoKIhtWy6I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bl+VM+HNwfL+KT9GJ0qCjxNccIUvepZMEbkf6cAbxjHHBHBvtJT4RdL0S8JodKJGv+XxsXEMRyWc3GkSDcoIAeRztarAHqj/1g9eHLfbsdBzMkMIWP6ht8pm1XKqzUNeg3YeYf3pUFAM9aVhFMFcE+Ra4PwP5JskJtd2faQxPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pMI+DzY9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050770;
	bh=WfYYyoKfLd1GrN54j6/DszN35nTkNYozIBoKIhtWy6I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pMI+DzY9ztHmVosQdnbboXnEtP5pcNWzqnAwTEJol+5acVOp6OPoLWXf7wzf/ENl1
	 Lfid+RQ70rYHZjzhhYl3z7pnqHakSL2JyjWzj3uDNGMAohxPJ5smG7IM1YQ7Ae0AX3
	 4cR+ANeDFR75sIYtsEv9DpWmEI3ekbNBTF78cP+XL11dsqoj7IjVMk0mi8OCk5scgD
	 b0qM4cZeUyBsBW//RFk8/DNFIYkdT8/HW3RZEZ5vb9zNbTm019jZI9im9glueW5wBF
	 SY444wZD2xoyLaNMN5lw9UZl7fs0ewzsTflo0JkqXaCyVhFonvf+A1+j1VTHI7gIEJ
	 iVvKW8N2soBEw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600c8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BDF017E046D;
	Fri,  1 Aug 2025 14:19:30 +0200 (CEST)
Message-ID: <6949aa850fa75bc1f5ae0ae7f05f3d7bafeaddaf.camel@collabora.com>
Subject: Re: [PATCH v6 03/24] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:19:29 +0200
In-Reply-To: <20250716193111.942217-4-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-4-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAyMDI1LTA3LTE2IGF0IDIyOjMwICswMzAwLCBDb3NtaW4gVGFuaXNsYXYgd3JvdGU6
Cj4gTUFYOTY3MTcgaXMgY2FwYWJsZSBvZiBhZGRyZXNzIHRyYW5zbGF0aW9uIGZvciB0aGUgY29u
bmVjdGVkIEkyQyBzbGF2ZXMuCj4gCj4gQWRkIHN1cHBvcnQgZm9yIEkyQyBBVFIgd2hpbGUga2Vl
cGluZyBJMkMgZ2F0ZSBmb3IgY29tcGF0aWJpbGl0eSB0bwo+IHN1cHBvcnQgdGhpcyB1c2VjYXNl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvc21pbiBUYW5pc2xhdiA8ZGVtb25zaW5ndXJAZ21haWwu
Y29tPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQo+IMKgLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9tYXhpbSxtYXg5NjcxNy55YW1swqDCoMKgIHwg
MzkgKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9tYXhpbSxtYXg5NjcxNy55YW1sCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvaTJjL21heGltLG1heDk2NzE3LnlhbWwKPiBpbmRleCAxNWFiMzc3MDJh
OTI3Li4xNjdjM2RkNTA2ODNjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9pMmMvbWF4aW0sbWF4OTY3MTcueWFtbAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbWF4aW0sbWF4OTY3MTcueWFtbAo+
IEBAIC05Miw2ICs5MiwzMCBAQCBwcm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoCBpbmNvbWluZyBH
TVNMMiBsaW5rLiBUaGVyZWZvcmUsIGl0IHN1cHBvcnRzIGFuIGkyYy1nYXRlCj4gwqDCoMKgwqDC
oMKgIHN1Ym5vZGUgdG8gY29uZmlndXJlIGEgc2Vuc29yLgo+IMKgCj4gK8KgIGkyYy1hbGlhcy1w
b29sOgo+ICvCoMKgwqAgbWF4SXRlbXM6IDIKPiArCj4gK8KgIGkyYy1hdHI6Cj4gK8KgwqDCoCB0
eXBlOiBvYmplY3QKPiArwqDCoMKgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiAr
wqDCoMKgIHByb3BlcnRpZXM6Cj4gK8KgwqDCoMKgwqAgJyNhZGRyZXNzLWNlbGxzJzoKPiArwqDC
oMKgwqDCoMKgwqAgY29uc3Q6IDEKPiArCj4gK8KgwqDCoMKgwqAgJyNzaXplLWNlbGxzJzoKPiAr
wqDCoMKgwqDCoMKgwqAgY29uc3Q6IDAKPiArCj4gK8KgwqDCoCBwYXR0ZXJuUHJvcGVydGllczoK
PiArwqDCoMKgwqDCoCAnXmkyY0BbMDFdJCc6Cj4gK8KgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hl
bWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sIwo+ICvCoMKgwqDCoMKgwqDCoCB1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlCj4gK8KgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoCByZWc6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXRlbXM6Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbmltdW06IDAKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWF4aW11bTogMQo+ICsKPiDCoHJlcXVpcmVkOgo+IMKgwqAgLSBjb21wYXRpYmxl
Cj4gwqDCoCAtIHJlZwo+IEBAIC05OSw2ICsxMjMsMjEgQEAgcmVxdWlyZWQ6Cj4gwqAKPiDCoGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+IMKgCj4gK2FsbE9mOgo+ICvCoCAtICRyZWY6IC9z
Y2hlbWFzL2kyYy9pMmMtYXRyLnlhbWwjCj4gKwo+ICvCoCAtIGFueU9mOgo+ICvCoMKgwqDCoMKg
IC0gb25lT2Y6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIHJlcXVpcmVkOiBbaTJjLWF0cl0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIC0gcmVxdWlyZWQ6IFtpMmMtZ2F0ZV0KPiArCj4gK8KgwqDCoMKg
wqAgLSBub3Q6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCByZXF1aXJlZDogW2kyYy1hdHIsIGkyYy1n
YXRlXQo+ICsKPiArZGVwZW5kZW50UmVxdWlyZWQ6Cj4gK8KgIGkyYy1hdHI6IFtpMmMtYWxpYXMt
cG9vbF0KPiArwqAgaTJjLWFsaWFzLXBvb2w6IFtpMmMtYXRyXQo+ICsKPiDCoGV4YW1wbGVzOgo+
IMKgwqAgLSB8Cj4gwqDCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgoK
UmV2aWV3ZWQtYnk6IEp1bGllbiBNYXNzb3QgPGp1bGllbi5tYXNzb3RAY29sbGFib3JhLmNvbT4K



