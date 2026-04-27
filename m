Return-Path: <linux-gpio+bounces-35633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGHSJ5ne72kHHQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 00:09:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DC47B1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 00:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B4430226B8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E20C3A1D0C;
	Mon, 27 Apr 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="II3nFLiG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E12D7DC6;
	Mon, 27 Apr 2026 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327764; cv=none; b=QuQI9vk/QyaSg4r5gGmyP4RQpHadzIK8ehv4a1WXxsORGGuu6qm1c4ymuts/FyJqFHJVxxgjgyEjD8eUeHLCdA8tOiwEnLsLDyGye8qb1vRofvkTttW6IpZf0AHhswC1MowxdWoAAuS7GQ9PEUl4SvMjS1nJjLvRqdGFqni+qFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327764; c=relaxed/simple;
	bh=i8np9CoGT3lQWiSMe0hHK52f7cpmu/yyEB4bMjqpZ2U=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=d3qYdNOHb7Heu84AAJ4paR9l9Igd+POab7xTGLel2Tacyp1oUfXksPacV2rHfeXFpRV8OnxaIW2lFtnSIBMKiMhjn2K3Raj2fESOKmebv02s8icAIupN2mWdVCvMAOOZ8q+tg0QjXH9psjjm5nNNS6PsCSAeGBgxeqStIB3svnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=II3nFLiG; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777327751; x=1777932551; i=w_armin@gmx.de;
	bh=i8np9CoGT3lQWiSMe0hHK52f7cpmu/yyEB4bMjqpZ2U=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=II3nFLiGo9bcxBuxeI12io8jaPAg18x4zidfMzKwJJHsY8vFqr+udbjo6Hq9JAgE
	 8BIfJt3jJWZZXlWs4XZ1aAJ4a52LCIuu4Kmj9kh6riBORBpxFwPCNR9YRN9wIvcAu
	 w3HvxQshhwDWlHAdZsr8LlxWcI8qWCxOwWbfa5o00p1ykf3QKGkTSHejG9G7CLcy1
	 SQ0E+KK+Fetp0VMXWZdflxEvf+GN8wG9YfAVww9ePg0vFbjwgmgVXdd8Oe8Jsg/ul
	 ehlmD0OULamWuWOmympmBKKD4SXu2tcZgSSvu7U/eGulV0ofAUqL6ffclOguIa0ir
	 7zBtKLFzCBNKR/hu1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1vNin72IR8-016iNx; Tue, 28
 Apr 2026 00:09:11 +0200
Content-Type: multipart/mixed; boundary="------------gESpPl8hsuZTHk4tY5sHdfC0"
Message-ID: <92b504d2-3d6e-4380-883c-be6b50eec25d@gmx.de>
Date: Tue, 28 Apr 2026 00:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Marco Scardovi <mscardovi95@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
 <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
 <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
 <20260427045731.GI557136@black.igk.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260427045731.GI557136@black.igk.intel.com>
X-Provags-ID: V03:K1:VLrFuGn68sfaXTVP1vv8MK2Yn/1IcxxBuvyZaocw0ouJdScNE43
 4eleGfkTkfwWU7DnFVGhXVx3drrY65j3BmJ6uYw5J1NlXLH6x5ZF5zintXJvclDERnRgObq
 tBWRAoS3ZKZp2MUav1cUPhIAA/7tNeiomxZBtAPUfhZFEHCDa3oMATfY2h/PD8VHDq0EU0S
 tTvAz0lgP4k/Ci8DSRHeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aANCgv9xd/s=;7QkA/BVqdToQ6aMm3Kx8GrI+XgK
 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
 gMPpHsLQSUiVBWE0pY=
X-Rspamd-Queue-Id: 4D4DC47B1F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-35633-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:dkim,gmx.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This is a multi-part message in MIME format.
--------------gESpPl8hsuZTHk4tY5sHdfC0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 27.04.26 um 06:57 schrieb Mika Westerberg:

> On Sat, Apr 25, 2026 at 10:41:46PM +0200, Armin Wolf wrote:
>>>> according to the Microsoft documentation
>>>> (https://learn.microsoft.com/
>>>> en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
>>>> section "GPIO controllers and ActiveBoth interrupts"), triggering
>>>> GPIO interrupts marked as ActiveBoth during initialization is
>>>> correct as long as the associated GPIO line is already "asserted"
>>>> (aka logic level low). I think the problem is that we also trigger
>>>> edge-based GPIO interrupts _not_ marked as ActiveBoth.
>>>>
>>>> Based on this i agree with Hans, except that we should continue you
>>>> trigger ActiveBoth GPIO interrupts as long as the above
>>>> condition applies.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>> So maybe something like this (attached)?
>> Yes, exactly.
> This is good information and definitely scales better than the quirk list.
> The linked document also mentions that there is _DSM under GPIO device that
> could be used to override the asserted state:
>
> https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/gpio-controller-device-specific-method---dsm-
>
> I wonder if we should implement that as well?

I already did some work in this area, but i kind of forgot about it because i have no suitable device for testing this.
Maybe someone has a device that uses this _DSM and can check if the attached patch works?

Thanks,
Armin Wolf

--------------gESpPl8hsuZTHk4tY5sHdfC0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-gpiolib-acpi-Add-support-for-Microsoft-GPIO-_DSM.patch"
Content-Disposition: attachment;
 filename*0="0001-gpiolib-acpi-Add-support-for-Microsoft-GPIO-_DSM.patch"
Content-Transfer-Encoding: base64

RnJvbSAyZTFkYzUxYzg2NDgwMmMwNWMzYTllNmI3NDVkZDhjMzRiNGI2MTViIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogVGh1LCA1IEZlYiAyMDI2IDIyOjM5OjM1ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gZ3Bp
b2xpYjogYWNwaTogQWRkIHN1cHBvcnQgZm9yIE1pY3Jvc29mdCBHUElPIF9EU00KCk1pY3Jv
c29mdCBoYXMgZGVmaW5lZCBhIEFDUEkgZGV2aWNlIHNwZWNpZmljIG1ldGhvZCBmb3IgZGV0
ZXJtaW5pbmcKdGhlIGxvZ2ljIGxldmVsIGZvciB3aGljaCBhIGdpdmVuIEFjdGl2ZUJvdGgg
R1BJTyBpbnRlcnJ1cHQgc2hvdWxkIGJlCmNvbnNpZGVyZWQgImFzc2VydGVkIi4gU3VjaCBH
UElPIGludGVycnVwdHMgYXJlIG5vcm1hbGx5IGNvbnNpZGVyZWQgdG8KYmUgImFzc2VydGVk
IiB3aGVuIGJlaW5nIGxvZ2ljIGxldmVsIGxvdy4KQmVpbmcgYWJsZSB0byBvdmVycmlkZSB0
aGlzIGFzc3VtcHRpb24gbWlnaHQgYmUgaW1wb3J0YW50IGZvciBmaXJtd2FyZQppbXBsZW1l
bnRhdGlvbnMgd2hlcmUgYSBBY3RpdmVCb3RoIEdQSU8gaW50ZXJydXB0IGlzIGFzc2VydGVk
IGF0IGxvZ2ljCmxldmVsIGhpZ2guCgpMaW5rOiBodHRwczovL2xlYXJuLm1pY3Jvc29mdC5j
b20vZW4tdXMvd2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2JyaW5ndXAvZ3Bpby1jb250cm9s
bGVyLWRldmljZS1zcGVjaWZpYy1tZXRob2QtLS1kc20tClNpZ25lZC1vZmYtYnk6IEFybWlu
IFdvbGYgPFdfQXJtaW5AZ214LmRlPgotLS0KIGRyaXZlcnMvZ3Bpby9ncGlvbGliLWFjcGkt
Y29yZS5jIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3Bpby9ncGlvbGliLWFjcGktY29yZS5jIGIvZHJpdmVycy9ncGlvL2dwaW9s
aWItYWNwaS1jb3JlLmMKaW5kZXggZWI4YTQwY2ZiN2E5Li5mN2M1OGFlNGQ0MjMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLWFjcGktY29yZS5jCisrKyBiL2RyaXZlcnMv
Z3Bpby9ncGlvbGliLWFjcGktY29yZS5jCkBAIC0xNSw2ICsxNSw4IEBACiAjaW5jbHVkZSA8
bGludXgvaXJxLmg+CiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51
eC9waW5jdHJsL3BpbmN0cmwuaD4KKyNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4KKyNpbmNs
dWRlIDxsaW51eC91dWlkLmg+CiAKICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+
CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9kcml2ZXIuaD4KQEAgLTIzLDYgKzI1LDE0IEBACiAj
aW5jbHVkZSAiZ3Bpb2xpYi5oIgogI2luY2x1ZGUgImdwaW9saWItYWNwaS5oIgogCisvKgor
ICogRGVmaW5lZCBieSBNaWNyb3NvZnQgYXQgaHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29t
L2VuLXVzL3dpbmRvd3MtaGFyZHdhcmUvZHJpdmVycy9icmluZ3VwLworICogZ3Bpby1jb250
cm9sbGVyLWRldmljZS1zcGVjaWZpYy1tZXRob2QtLS1kc20tLgorICovCitzdGF0aWMgY29u
c3QgZ3VpZF90IGFjcGlfZ3Bpb19taWNyb3NvZnRfZ3VpZCA9IEdVSURfSU5JVCgweDRGMjQ4
RjQwLCAweEQ1RTIsIDB4NDk5RiwgMHg4MywgMHg0QywKKwkJCQkJCQkgMHgyNywgMHg3NSwg
MHg4RSwgMHhBMSwgMHhDRCwgMHgzRik7CisjZGVmaW5lIEFDUElfR1BJT19EU01fQUNUSVZF
X0JPVEhfUE9MQVJJVFkgMQorCiAvKioKICAqIHN0cnVjdCBhY3BpX2dwaW9fZXZlbnQgLSBB
Q1BJIEdQSU8gZXZlbnQgaGFuZGxlciBkYXRhCiAgKgpAQCAtMjE2LDkgKzIyNiwxMSBAQCBi
b29sIGFjcGlfZ3Bpb19nZXRfaW9fcmVzb3VyY2Uoc3RydWN0IGFjcGlfcmVzb3VyY2UgKmFy
ZXMsCiBFWFBPUlRfU1lNQk9MX0dQTChhY3BpX2dwaW9fZ2V0X2lvX3Jlc291cmNlKTsKIAog
c3RhdGljIHZvaWQgYWNwaV9ncGlvY2hpcF9yZXF1ZXN0X2lycShzdHJ1Y3QgYWNwaV9ncGlv
X2NoaXAgKmFjcGlfZ3BpbywKLQkJCQkgICAgICBzdHJ1Y3QgYWNwaV9ncGlvX2V2ZW50ICpl
dmVudCkKKwkJCQkgICAgICBzdHJ1Y3QgYWNwaV9ncGlvX2V2ZW50ICpldmVudCwKKwkJCQkg
ICAgICB1bmlvbiBhY3BpX29iamVjdCAqb2JqKQogewogCXN0cnVjdCBkZXZpY2UgKnBhcmVu
dCA9IGFjcGlfZ3Bpby0+Y2hpcC0+cGFyZW50OworCWJvb2wgYWN0aXZlX2xvdyA9IHRydWU7
CiAJaW50IHJldCwgdmFsdWU7CiAKIAlyZXQgPSByZXF1ZXN0X3RocmVhZGVkX2lycShldmVu
dC0+aXJxLCBOVUxMLCBldmVudC0+aGFuZGxlciwKQEAgLTI0OCwxOCArMjYwLDY3IEBAIHN0
YXRpYyB2b2lkIGFjcGlfZ3Bpb2NoaXBfcmVxdWVzdF9pcnEoc3RydWN0IGFjcGlfZ3Bpb19j
aGlwICphY3BpX2dwaW8sCiAJaWYgKGFjcGlfZ3Bpb19uZWVkX3J1bl9lZGdlX2V2ZW50c19v
bl9ib290KCkgJiYKIAkgICAgKChldmVudC0+aXJxZmxhZ3MgJiAoSVJRRl9UUklHR0VSX1JJ
U0lORyB8IElSUUZfVFJJR0dFUl9GQUxMSU5HKSkgPT0KIAkgICAgIChJUlFGX1RSSUdHRVJf
UklTSU5HIHwgSVJRRl9UUklHR0VSX0ZBTExJTkcpKSkgeworCQlpZiAob2JqKSB7CisJCQlm
b3IgKHUzMiBpID0gMDsgaSA8IG9iai0+cGFja2FnZS5jb3VudDsgaSsrKSB7CisJCQkJaWYg
KG9iai0+cGFja2FnZS5lbGVtZW50c1tpXS5pbnRlZ2VyLnZhbHVlID09IGV2ZW50LT5waW4p
IHsKKwkJCQkJYWN0aXZlX2xvdyA9IGZhbHNlOworCQkJCQlicmVhazsKKwkJCQl9CisJCQl9
CisJCX0KKwogCQl2YWx1ZSA9IGdwaW9kX2dldF9yYXdfdmFsdWVfY2Fuc2xlZXAoZXZlbnQt
PmRlc2MpOwotCQlpZiAodmFsdWUgPT0gMCkKKwkJaWYgKChhY3RpdmVfbG93ICYmIHZhbHVl
ID09IDApIHx8ICghYWN0aXZlX2xvdyAmJiB2YWx1ZSA9PSAxKSkKIAkJCWV2ZW50LT5oYW5k
bGVyKGV2ZW50LT5pcnEsIGV2ZW50KTsKIAl9CiB9CiAKK3N0YXRpYyB1bmlvbiBhY3BpX29i
amVjdCAqYWNwaV9ncGlvY2hpcF9ldmFsdWF0ZV9kc20oc3RydWN0IGFjcGlfZ3Bpb19jaGlw
ICphY3BpX2dwaW8pCit7CisJc3RydWN0IGRldmljZSAqcGFyZW50ID0gYWNwaV9ncGlvLT5j
aGlwLT5wYXJlbnQ7CisJdW5pb24gYWNwaV9vYmplY3QgZHVtbXkgPSB7CisJCS5wYWNrYWdl
ID0geworCQkJLnR5cGUgPSBBQ1BJX1RZUEVfUEFDS0FHRSwKKwkJCS5jb3VudCA9IDAsCisJ
CQkuZWxlbWVudHMgPSBOVUxMLAorCQl9LAorCX07CisJYWNwaV9oYW5kbGUgaGFuZGxlID0g
QUNQSV9IQU5ETEUocGFyZW50KTsKKwl1bmlvbiBhY3BpX29iamVjdCAqb2JqOworCisJaWYg
KCFhY3BpX2NoZWNrX2RzbShoYW5kbGUsICZhY3BpX2dwaW9fbWljcm9zb2Z0X2d1aWQsIDAs
CisJCQkgICAgQklUKEFDUElfR1BJT19EU01fQUNUSVZFX0JPVEhfUE9MQVJJVFkpKSkKKwkJ
cmV0dXJuIE5VTEw7CisKKwlvYmogPSBhY3BpX2V2YWx1YXRlX2RzbV90eXBlZChoYW5kbGUs
ICZhY3BpX2dwaW9fbWljcm9zb2Z0X2d1aWQsIDAsCisJCQkJICAgICAgQUNQSV9HUElPX0RT
TV9BQ1RJVkVfQk9USF9QT0xBUklUWSwKKwkJCQkgICAgICAmZHVtbXksIEFDUElfVFlQRV9Q
QUNLQUdFKTsKKwlpZiAob2JqKSB7CisJCWZvciAodTMyIGkgPSAwOyBpIDwgb2JqLT5wYWNr
YWdlLmNvdW50OyBpKyspIHsKKwkJCWlmIChvYmotPnBhY2thZ2UuZWxlbWVudHNbaV0udHlw
ZSA9PSBBQ1BJX1RZUEVfSU5URUdFUikKKwkJCQljb250aW51ZTsKKworCQkJZGV2X2Vycihw
YXJlbnQsIEZXX0JVRyAiSWdub3JpbmcgR1BJTyBfRFNNIGR1ZSB0byBpbnZhbGlkIGRhdGFc
biIpOworCQkJQUNQSV9GUkVFKG9iaik7CisJCQlyZXR1cm4gTlVMTDsKKwkJfQorCX0KKwor
CXJldHVybiBvYmo7Cit9CisKIHN0YXRpYyB2b2lkIGFjcGlfZ3Bpb2NoaXBfcmVxdWVzdF9p
cnFzKHN0cnVjdCBhY3BpX2dwaW9fY2hpcCAqYWNwaV9ncGlvKQogewogCXN0cnVjdCBhY3Bp
X2dwaW9fZXZlbnQgKmV2ZW50OworCXVuaW9uIGFjcGlfb2JqZWN0ICpvYmo7CisKKwlvYmog
PSBhY3BpX2dwaW9jaGlwX2V2YWx1YXRlX2RzbShhY3BpX2dwaW8pOwogCiAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShldmVudCwgJmFjcGlfZ3Bpby0+ZXZlbnRzLCBub2RlKQotCQlhY3BpX2dw
aW9jaGlwX3JlcXVlc3RfaXJxKGFjcGlfZ3BpbywgZXZlbnQpOworCQlhY3BpX2dwaW9jaGlw
X3JlcXVlc3RfaXJxKGFjcGlfZ3BpbywgZXZlbnQsIG9iaik7CisKKwlpZiAob2JqKQorCQlB
Q1BJX0ZSRUUob2JqKTsKIH0KIAogc3RhdGljIGVudW0gZ3Bpb2RfZmxhZ3MKLS0gCjIuMzku
NQoK

--------------gESpPl8hsuZTHk4tY5sHdfC0--

