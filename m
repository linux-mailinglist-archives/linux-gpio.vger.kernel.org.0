Return-Path: <linux-gpio+bounces-35523-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPYdNY/a7GlEdAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35523-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 17:15:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FA466B05
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 17:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A52BA300E3A6
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 15:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BF419D89E;
	Sat, 25 Apr 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja7lG0qx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B840DFA5;
	Sat, 25 Apr 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130122; cv=none; b=JzXfoBjbjY9FMCRjKzWVzCwzrQNqaXt9ZpZuEE86VJs0zGvcS8W5KmRrFqc+y9Csv1xijMRdBaxhPHYUpImfJVSCeWWHwOCqwhOXXQrLhISSSGwvJjqHl+HCetMyjSjTyS7nyoka/ZEwT2/mxMTOpEqG/IHLsb3mETy+zUTc7RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130122; c=relaxed/simple;
	bh=iSoI4DFNO6LwbQUPgechwxRsrKT7FQXtvei2Qm7F2CU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=KvLQwrG98bdSBUNsjTVS7G8Z4KzvbVWaDAQc2bYw2fuUAwsqUVc/1KAc6KkhllXB4nBLPnof18aacCDqUjHy+9uFBE/mdhOdY1GqWcNp86STK5KxwBxDl1Rfmf6AupMaBGO/V9cFSjb7efZobDzy0qw8Kec/oX+XU8qDx+HYNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja7lG0qx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF39C2BCB0;
	Sat, 25 Apr 2026 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777130122;
	bh=iSoI4DFNO6LwbQUPgechwxRsrKT7FQXtvei2Qm7F2CU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ja7lG0qx4W7zVcH188TZD45Gdt2FZyOIngIE/pkGvF1P/8j4rUHnDEmbj4irXPP9N
	 eWvd9qVbO6cAh//OWOBv04SDYcLACl6NADgVLFbISwPuco7+WMF6oIoJymPy1HGXbu
	 76VdKVd2TAnwfbrugBG2bKh2HOPze8Xwq256qyX7xUr92hFHxq71NsmcBlr/akIF2Q
	 2CXvHKz8qUDsnKZA/854n5UBdXNqyO6AMWX8EaKofO6qmEQVWbVU+15EHv7cQRDLoA
	 HVC76eS/SCZ+Nu4uK5HKvHLIHVTMqOFFEsCQYi93pOTVRsEOrkOrn/H7hvMfEm4UwQ
	 5kOjs3lhLpXPw==
Content-Type: multipart/mixed; boundary="------------YnLCLDdpuLD0GWNeh9S5lhol"
Message-ID: <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
Date: Sat, 25 Apr 2026 10:15:19 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, Marco Scardovi <mscardovi95@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
X-Rspamd-Queue-Id: 647FA466B05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35523-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,gmail.com,linux.intel.com,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]

This is a multi-part message in MIME format.
--------------YnLCLDdpuLD0GWNeh9S5lhol
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/24/26 15:02, Armin Wolf wrote:
> Am 23.04.26 um 19:46 schrieb Marco Scardovi:
> 
>>
>> On 4/23/26 07:15, Mario Limonciello wrote:
>>> On 4/22/26 23:42, Mika Westerberg wrote:
>>>> Hi,
>>>>
>>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>>> Assuming all the variants suffer the same problem would it be ok 
>>>>>>> to use a
>>>>>>> wildcard for it?
>>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>>
>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/ 
>>>>>> gpiolib-acpi-quirks.c
>>>>>> index a0116f004975..e3a6111854e8 100644
>>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id 
>>>>>> gpiolib_acpi_quirks[] __initconst = {
>>>>>>                .ignore_wake = "VEN_0488:00@355",
>>>>>>            },
>>>>>>        },
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>>>> +         * interrupts involved.
>>>>>> +         *
>>>>>> +         * Found in BIOS G614PP.307.
>>>>>> +         */
>>>>>> +        .matches = {
>>>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>>> +        },
>>>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>>>> +        },
>>>>>> +    },
>>>>>>        {} /* Terminating entry */
>>>>>>    };
>>>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>>>> remain as much as possible close to the CachyOS' one but hopefully 
>>>>> it will
>>>>> be implemented on 7.1, if someone propose the patch and it is 
>>>>> accepted. It
>>>>> would be amazing to see Asus more interested on Linux and more 
>>>>> strict with
>>>>> their BIOS but in the end I understand it's like asking for the moon.
>>>>
>>>> Okay thanks for checking. I guess this is what we have to live with 
>>>> for now
>>>> until someone finds a better way of dealing with these.
>>>>
>>>> @Francesco, would you like to submit a new version of the patch 
>>>> similar to
>>>> above or you want me to do that?
>>>
>>> Hans suggested that we might want to look at ripping out this edge 
>>> triggered events at boot earlier in the thread.
>>>
>>> https://lore.kernel.org/platform-driver- 
>>> x86/20260423044211.GD557136@black.igk.intel.com/T/ 
>>> #mdca882e6606d3a894ec7499d3b742d040933dbdb
>>>
>>> Hans - as you pointed out that the Surface lid state is the only real 
>>> issue left and you happen to have one do you think you could work up 
>>> some patches?
>>>
>> I see. Well, that makes totally sense 
> 
> Hi,
> 
> according to the Microsoft documentation (https://learn.microsoft.com/ 
> en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
> section "GPIO controllers and ActiveBoth interrupts"), triggering GPIO 
> interrupts marked as ActiveBoth during initialization is
> correct as long as the associated GPIO line is already "asserted" (aka 
> logic level low). I think the problem is that we also trigger
> edge-based GPIO interrupts _not_ marked as ActiveBoth.
> 
> Based on this i agree with Hans, except that we should continue you 
> trigger ActiveBoth GPIO interrupts as long as the above
> condition applies.
> 
> Thanks,
> Armin Wolf
> 

So maybe something like this (attached)?

--------------YnLCLDdpuLD0GWNeh9S5lhol
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-gpiolib-acpi-Only-trigger-ActiveBoth-interrupts-on-b.patch"
Content-Disposition: attachment;
 filename*0="0001-gpiolib-acpi-Only-trigger-ActiveBoth-interrupts-on-b.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjOTcyYThmYTU3NGQwNDlhM2Q4ZmFjYTc2MTIxZDlkM2NiNThlZjQ4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25j
aWVsbG9AYW1kLmNvbT4KRGF0ZTogU2F0LCAyNSBBcHIgMjAyNiAxMDoxMTozMyAtMDUwMApT
dWJqZWN0OiBbUEFUQ0hdIGdwaW9saWI6IGFjcGk6IE9ubHkgdHJpZ2dlciBBY3RpdmVCb3Ro
IGludGVycnVwdHMgb24gYm9vdAoKQ29tbWl0IGNhODc2Yzc0ODNiNiAoImdwaW9saWItYWNw
aTogbWFrZSBzdXJlIHdlIHRyaWdnZXIgZWRnZSBldmVudHMgYXQKbGVhc3Qgb25jZSBvbiBi
b290IikgaW50cm9kdWNlZCBsb2dpYyB0byB0cmlnZ2VyIGVkZ2UtYmFzZWQgR1BJTwppbnRl
cnJ1cHRzIGR1cmluZyBpbml0aWFsaXphdGlvbiB0byBlbnN1cmUgcHJvcGVyIGluaXRpYWwg
c3RhdGUgc2V0dXAKd2hlbiBmaXJtd2FyZSBkb2Vzbid0IGluaXRpYWxpemUgaXQuCgpIb3dl
dmVyLCBhY2NvcmRpbmcgdG8gdGhlIE1pY3Jvc29mdCBHUElPIGRvY3VtZW50YXRpb24sIHRy
aWdnZXJpbmcgR1BJTwppbnRlcnJ1cHRzIGR1cmluZyBpbml0aWFsaXphdGlvbiBzaG91bGQg
b25seSBoYXBwZW4gZm9yIGludGVycnVwdHMKbWFya2VkIGFzIEFjdGl2ZUJvdGggKGJvdGgg
SVJRRl9UUklHR0VSX1JJU0lORyBhbmQgSVJRRl9UUklHR0VSX0ZBTExJTkcpCmFuZCBvbmx5
IHdoZW4gdGhlIGFzc29jaWF0ZWQgR1BJTyBsaW5lIGlzIGFscmVhZHkgYXNzZXJ0ZWQgKGxv
Z2ljIGxldmVsCmxvdykuCgpUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpbmNvcnJlY3Rs
eSB0cmlnZ2VyczoKMS4gQW55IGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdCAoUklTSU5HLW9u
bHkgb3IgRkFMTElORy1vbmx5KQoyLiBSSVNJTkcgaW50ZXJydXB0cyB3aGVuIHZhbHVlIGlz
IGhpZ2ggYW5kIEZBTExJTkcgd2hlbiB2YWx1ZSBpcyBsb3cKClRoaXMgY2F1c2VzIHByb2Js
ZW1zIGF0IGJvb3R1cCBmb3Igc2luZ2xlLWVkZ2UgaW50ZXJydXB0cyB0aGF0CmRvbid0IGZv
bGxvdyB0aGUgQWN0aXZlQm90aCBwYXR0ZXJuLgoKRml4IHRoaXMgYnk6Ci0gT25seSB0cmln
Z2VyaW5nIHdoZW4gQk9USCByaXNpbmcgYW5kIGZhbGxpbmcgZWRnZXMgYXJlIGNvbmZpZ3Vy
ZWQKLSBPbmx5IHRyaWdnZXJpbmcgd2hlbiB0aGUgR1BJTyBsaW5lIGlzIGFzc2VydGVkICh2
YWx1ZSA9PSAwKQoKRml4ZXM6IGNhODc2Yzc0ODNiNjkgKCJncGlvbGliLWFjcGk6IG1ha2Ug
c3VyZSB3ZSB0cmlnZ2VyIGVkZ2UgZXZlbnRzIGF0IGxlYXN0IG9uY2Ugb24gYm9vdCIpCkxp
bms6IGh0dHBzOi8vbGVhcm4ubWljcm9zb2Z0LmNvbS9lbi11cy93aW5kb3dzLWhhcmR3YXJl
L2RyaXZlcnMvYnJpbmd1cC9nZW5lcmFsLXB1cnBvc2UtaS1vLS1ncGlvLQpTdWdnZXN0ZWQt
Ynk6IEFybWluIFdvbGYgPFdfQXJtaW5AZ214LmRlPgpTaWduZWQtb2ZmLWJ5OiBNYXJpbyBM
aW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
aW8vZ3Bpb2xpYi1hY3BpLWNvcmUuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLWFjcGktY29yZS5jIGIvZHJpdmVycy9ncGlvL2dw
aW9saWItYWNwaS1jb3JlLmMKaW5kZXggMDlmODYwMjAwYTA1OS4uZWI4YTQwY2ZiN2E5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncGlvL2dwaW9saWItYWNwaS1jb3JlLmMKKysrIGIvZHJp
dmVycy9ncGlvL2dwaW9saWItYWNwaS1jb3JlLmMKQEAgLTIzMywxMiArMjMzLDIzIEBAIHN0
YXRpYyB2b2lkIGFjcGlfZ3Bpb2NoaXBfcmVxdWVzdF9pcnEoc3RydWN0IGFjcGlfZ3Bpb19j
aGlwICphY3BpX2dwaW8sCiAKIAlldmVudC0+aXJxX3JlcXVlc3RlZCA9IHRydWU7CiAKLQkv
KiBNYWtlIHN1cmUgd2UgdHJpZ2dlciB0aGUgaW5pdGlhbCBzdGF0ZSBvZiBlZGdlLXRyaWdn
ZXJlZCBJUlFzICovCisJLyoKKwkgKiBNYWtlIHN1cmUgd2UgdHJpZ2dlciB0aGUgaW5pdGlh
bCBzdGF0ZSBvZiBBY3RpdmVCb3RoIElSUXMuCisJICoKKwkgKiBBY2NvcmRpbmcgdG8gdGhl
IE1pY3Jvc29mdCBHUElPIGRvY3VtZW50YXRpb24sIHRyaWdnZXJpbmcgR1BJTworCSAqIGlu
dGVycnVwdHMgbWFya2VkIGFzIEFjdGl2ZUJvdGggZHVyaW5nIGluaXRpYWxpemF0aW9uIGlz
IGNvcnJlY3QKKwkgKiBhcyBsb25nIGFzIHRoZSBhc3NvY2lhdGVkIEdQSU8gbGluZSBpcyBh
bHJlYWR5ICJhc3NlcnRlZCIKKwkgKiAobG9naWMgbGV2ZWwgbG93KS4gV2Ugc2hvdWxkIG5v
dCB0cmlnZ2VyIGVkZ2UtYmFzZWQgR1BJTworCSAqIGludGVycnVwdHMgbm90IG1hcmtlZCBh
cyBBY3RpdmVCb3RoLgorCSAqCisJICogU2VlOiBodHRwczovL2xlYXJuLm1pY3Jvc29mdC5j
b20vZW4tdXMvd2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2JyaW5ndXAvZ2VuZXJhbC1wdXJw
b3NlLWktby0tZ3Bpby0KKwkgKiBTZWN0aW9uOiAiR1BJTyBjb250cm9sbGVycyBhbmQgQWN0
aXZlQm90aCBpbnRlcnJ1cHRzIgorCSAqLwogCWlmIChhY3BpX2dwaW9fbmVlZF9ydW5fZWRn
ZV9ldmVudHNfb25fYm9vdCgpICYmCi0JICAgIChldmVudC0+aXJxZmxhZ3MgJiAoSVJRRl9U
UklHR0VSX1JJU0lORyB8IElSUUZfVFJJR0dFUl9GQUxMSU5HKSkpIHsKKwkgICAgKChldmVu
dC0+aXJxZmxhZ3MgJiAoSVJRRl9UUklHR0VSX1JJU0lORyB8IElSUUZfVFJJR0dFUl9GQUxM
SU5HKSkgPT0KKwkgICAgIChJUlFGX1RSSUdHRVJfUklTSU5HIHwgSVJRRl9UUklHR0VSX0ZB
TExJTkcpKSkgewogCQl2YWx1ZSA9IGdwaW9kX2dldF9yYXdfdmFsdWVfY2Fuc2xlZXAoZXZl
bnQtPmRlc2MpOwotCQlpZiAoKChldmVudC0+aXJxZmxhZ3MgJiBJUlFGX1RSSUdHRVJfUklT
SU5HKSAmJiB2YWx1ZSA9PSAxKSB8fAotCQkgICAgKChldmVudC0+aXJxZmxhZ3MgJiBJUlFG
X1RSSUdHRVJfRkFMTElORykgJiYgdmFsdWUgPT0gMCkpCisJCWlmICh2YWx1ZSA9PSAwKQog
CQkJZXZlbnQtPmhhbmRsZXIoZXZlbnQtPmlycSwgZXZlbnQpOwogCX0KIH0KLS0gCjIuNTMu
MAoK

--------------YnLCLDdpuLD0GWNeh9S5lhol--

