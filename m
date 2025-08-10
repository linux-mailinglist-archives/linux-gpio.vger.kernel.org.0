Return-Path: <linux-gpio+bounces-24121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA90FB1FAAD
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Aug 2025 17:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD85618973BF
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Aug 2025 15:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E17F263899;
	Sun, 10 Aug 2025 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLBTws0x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28B208A7;
	Sun, 10 Aug 2025 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754838772; cv=none; b=XCXD1iZKyIf41YPiOtgA2UXd+/6Q321i+Pca9izARi44Q3dnNqZ1rRCGJI2+DQF8sI38AXaipnHEBW37OhX8x8WzQB4gdo1gsxItmkCQAIwRwzU9tSmIRAflMIUcnASkUOP/xjbWw1c4qo/RzdfB+lKADr3FzQWWBgmFZPqtNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754838772; c=relaxed/simple;
	bh=92DNNeaJh4B30+E5mUTWLRfD2YMswZh0XAsqdfVt/Ns=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ELpnnwZ8bs0E7I6r57xCuHTJu2Hcke83XXffwo1ABo6elIEbqEagfXPak87dU125Xdsf36p42oV/Xs5/p7X0Oa0eVB+Usc9ZsISZmxsR4ZTdPZgMyNFdWQlsJzWbEoWxeF16MLI1wcOFOLpycd+bTmHWH+XN1JwQArXJSqH6CGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLBTws0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDE8C4CEEB;
	Sun, 10 Aug 2025 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754838771;
	bh=92DNNeaJh4B30+E5mUTWLRfD2YMswZh0XAsqdfVt/Ns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLBTws0x7tBiIMbyYOuQklS5mHKmuZHfThLfeOqp5YNHiEJSf6M5A4jB7IEknVIWO
	 S9xpSAuOkJ/KsnAmKWcKfHgkMgrEDru3epw23PR89GzwUfz9sBPllRHC2iQ3zrZMbs
	 zqLIp5tgokPhK9ndo2ApkMJ69xowtvTEO+OVrAHg+D8zQQBj3WEy5ez8wme8Cr+2Lc
	 U+O8zPi0hlDEd/kHvSYfleSnch4yXbz1+JmcKS2HC1Z7l4vM+LclwPWCjng/xS6TEi
	 fYsZd3GZjEwED62WvH+UJYS1fz0pbI+J+AttHgAp5I3UD9aG15ZuEroW9dfMCZAci7
	 aF/Y1DqyfVRrA==
Content-Type: multipart/mixed; boundary="------------esjKvN8AEjEUOU80jpmuCZLh"
Message-ID: <9bc69944-a34e-4a4e-9071-7d2049d12449@kernel.org>
Date: Sun, 10 Aug 2025 17:12:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] x86/platform: select legacy gpiolib interfaces
 where used
To: Arnd Bergmann <arnd@arndb.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux <linux@treblig.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-6-arnd@kernel.org>
 <aJccS7fdcx0INYTA@smile.fi.intel.com>
 <3190334c-538d-4e2d-80a4-6e24b255e844@app.fastmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3190334c-538d-4e2d-80a4-6e24b255e844@app.fastmail.com>

This is a multi-part message in MIME format.
--------------esjKvN8AEjEUOU80jpmuCZLh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd, Andy,

On 9-Aug-25 9:44 PM, Arnd Bergmann wrote:
> On Sat, Aug 9, 2025, at 12:00, Andy Shevchenko wrote:
>> On Fri, Aug 08, 2025 at 05:17:49PM +0200, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> A few old machines have not been converted away from the old-style
>>> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
>>> symbol so the code still works where it is needed but can be left
>>> out otherwise.
>>
>>> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
>>> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
>>> @@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
>>>  	depends on I2C && SPI && SERIAL_DEV_BUS
>>>  	depends on GPIOLIB && PMIC_OPREGION
>>>  	depends on ACPI && EFI && PCI
>>> +	select GPIOLIB_LEGACY
>>>  	select NEW_LEDS
>>>  	select LEDS_CLASS
>>>  	select POWER_SUPPLY
>>
>> Hmm... This is a surprising change. But I leave it to Hans.

Yes I was surprised by this myself since I explicitly removed
all legacy GPIO use from the x86-android-tablets code a while
ago (or so I thought).

> I think the only function that still needs it is
> x86_android_tablet_probe() doing
> 
> static struct gpio_keys_button *buttons;
> 
>                 for (i = 0; i < dev_info->gpio_button_count; i++) {
>                         ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
>                                                            dev_info->gpio_button[i].pin,
>                                                            dev_info->gpio_button[i].button.desc,
>                                                            false, GPIOD_IN, &gpiod);
> 
>                         buttons[i] = dev_info->gpio_button[i].button;
>                         buttons[i].gpio = desc_to_gpio(gpiod);
>                         /* Release GPIO descriptor so that gpio-keys can request it */
>                         devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
>                 }
> 
> So the driver itself uses gpio descriptors, but it passes
> some of them into another driver by number. There is probably
> an easy workaround that I did not see.

Ah I see, so this is basically in the same boat as
drivers/input/misc/soc_button_array.c which also first
gets a gpio_desc and then calls desc_to_gpio() to store
the GPIO number in struct gpio_keys_button which is passed
as platform_data to drivers/input/keyboard/gpio_keys.c

The gpio_keys driver then converts things back
into a gpio_desc in gpio_keys_setup_key()
using devm_gpio_request_one() + gpio_to_desc()

So it looks like we need to add a gpiod member to
struct gpio_keys_button (include/linux/gpio_keys.h)
and modify gpio_keys.c to prefer that over using
button->gpio, something like the attached patch
basically.

I won't have time to work on this until September,
so if someone wants to take the attached patch and run
with it go for it.

Note the x86-android-tablets / soc_button_array code
will become responsible for requesting / releasing
the gpiod when using the new gpio_keys_button.gpiod
member.

For the x86-android-tablets code this is easy, just drop
these 2 lines:

                        /* Release GPIO descriptor so that gpio-keys can request it */
                        devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);

And for soc_button_array.c it is _probably_ just a matter
of switching to devm_gpiod_get_index() and drop the
gpiod_put().

I have hardware to test both the x86-android-tablets
code as well as the soc_button_array code. I might be
able to do a quick test on August 22nd or 29th.

Regards,

Hans


p.s.

It looks like this will also help with:

drivers/platform/x86/meraki-mx100.c
drivers/platform/x86/pcengines-apuv2.c
drivers/platform/x86/barco-p50-gpio.c

I do not have hardware to test these, but if the changes
work for x86-android-tablets + soc_button_array then
hopefully they will be fine here too.

--------------esjKvN8AEjEUOU80jpmuCZLh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Input-gpio-keys-Allow-directly-passing-a-gpio_desc-i.patch"
Content-Disposition: attachment;
 filename*0="0001-Input-gpio-keys-Allow-directly-passing-a-gpio_desc-i.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2ZmU0YmQ3MzFkYjU5YmIwMWNjMGNlM2NiZDI0MTI0MzRlYTA1M2M2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3Jn
PgpEYXRlOiBTdW4sIDEwIEF1ZyAyMDI1IDE2OjU4OjAxICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gSW5wdXQ6IGdwaW8ta2V5cyAtIEFsbG93IGRpcmVjdGx5IHBhc3NpbmcgYSBncGlvX2Rl
c2MgaW5zdGVhZAogb2YgYSBHUElPIG51bWJlcgoKVXNpbmcgR1BJTyBudW1iZXJzIGlzIGRl
cHJlY2F0ZWQuIEFsbG93IGNvZGUgcGFzc2luZyBHUElPLWtleXMgaW5mbyB0aHJvdWdoCnBs
YXRmb3JtLWRhdGEgKHN0cnVjdCBncGlvX2tleXNfYnV0dG9uKSB0byBkaXJlY3RseSBwYXNz
IGEgZ3Bpb19kZXNjCmluc3RlYWQgb2YgYSBHUElPIG51bWJlci4KCk5vdGUgcmVxdWVzdGlu
ZyAvIHJlbGVhc2luZyB0aGUgZ3Bpb19kZXNjIHdpbGwgYmUgdGhlIHJlc3BvbnNpYmlsaXR5
Cm9mIHRoZSBjb2RlIHBhc3NpbmcgaW4gdGhlIHBsYXRmb3JtLWRhdGEuCgpTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxoYW5zZ0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvZ3Bpb19rZXlzLmMgfCAyICsrCiBpbmNsdWRlL2xpbnV4L2dwaW9fa2V5
cy5oICAgICAgICAgIHwgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJk
L2dwaW9fa2V5cy5jIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYwppbmRl
eCBmOWRiODZkYTA4MTguLjMyMzI0N2Y2M2E3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbnB1
dC9rZXlib2FyZC9ncGlvX2tleXMuYworKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2dw
aW9fa2V5cy5jCkBAIC01MjgsNiArNTI4LDggQEAgc3RhdGljIGludCBncGlvX2tleXNfc2V0
dXBfa2V5KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCQkgKi8KIAkJCWJkYXRh
LT5ncGlvZCA9IE5VTEw7CiAJCX0KKwl9IGVsc2UgaWYgKGJ1dHRvbi0+Z3Bpb2QpIHsKKwkJ
YmRhdGEtPmdwaW9kID0gYnV0dG9uLT5ncGlvZDsKIAl9IGVsc2UgaWYgKGdwaW9faXNfdmFs
aWQoYnV0dG9uLT5ncGlvKSkgewogCQkvKgogCQkgKiBMZWdhY3kgR1BJTyBudW1iZXIsIHNv
IHJlcXVlc3QgdGhlIEdQSU8gaGVyZSBhbmQKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
Z3Bpb19rZXlzLmggYi9pbmNsdWRlL2xpbnV4L2dwaW9fa2V5cy5oCmluZGV4IDgwZmE5MzBi
MDRjNi4uN2MzMmMzYTA2OTVmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2dwaW9fa2V5
cy5oCisrKyBiL2luY2x1ZGUvbGludXgvZ3Bpb19rZXlzLmgKQEAgLTUsMTEgKzUsMTMgQEAK
ICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogCiBzdHJ1Y3QgZGV2aWNlOworc3RydWN0IGdw
aW9fZGVzYzsKIAogLyoqCiAgKiBzdHJ1Y3QgZ3Bpb19rZXlzX2J1dHRvbiAtIGNvbmZpZ3Vy
YXRpb24gcGFyYW1ldGVycwogICogQGNvZGU6CQlpbnB1dCBldmVudCBjb2RlIChLRVlfKiwg
U1dfKikKLSAqIEBncGlvOgkJJS0xIGlmIHRoaXMga2V5IGRvZXMgbm90IHN1cHBvcnQgZ3Bp
bworICogQGdwaW86CQklLTEgaWYgdGhpcyBrZXkgZG9lcyBub3Qgc3VwcG9ydCBncGlvIChk
ZXByZWNhdGVkIHVzZSBncGlvZCkKKyAqIEBncGlvZDoJCWdwaW9fZGVzYyBmb3IgdGhlIEdQ
SU8sIE5VTEwgaWYgdGhpcyBrZXkgZG9lcyBub3Qgc3VwcG9ydCBncGlvCiAgKiBAYWN0aXZl
X2xvdzoJCSV0cnVlIGluZGljYXRlcyB0aGF0IGJ1dHRvbiBpcyBjb25zaWRlcmVkCiAgKgkJ
CWRlcHJlc3NlZCB3aGVuIGdwaW8gaXMgbG93CiAgKiBAZGVzYzoJCWxhYmVsIHRoYXQgd2ls
bCBiZSBhdHRhY2hlZCB0byBidXR0b24ncyBncGlvCkBAIC0yNiw2ICsyOCw3IEBAIHN0cnVj
dCBkZXZpY2U7CiBzdHJ1Y3QgZ3Bpb19rZXlzX2J1dHRvbiB7CiAJdW5zaWduZWQgaW50IGNv
ZGU7CiAJaW50IGdwaW87CisJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7CiAJaW50IGFjdGl2
ZV9sb3c7CiAJY29uc3QgY2hhciAqZGVzYzsKIAl1bnNpZ25lZCBpbnQgdHlwZTsKLS0gCjIu
NDkuMAoK

--------------esjKvN8AEjEUOU80jpmuCZLh--

