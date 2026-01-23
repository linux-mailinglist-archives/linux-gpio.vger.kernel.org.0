Return-Path: <linux-gpio+bounces-31025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAUsLuDTc2kCywAAu9opvQ
	(envelope-from <linux-gpio+bounces-31025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:02:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E57A738
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AA653012CF0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 20:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5D02820A9;
	Fri, 23 Jan 2026 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="dlboqyds"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6325D21146C
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198557; cv=none; b=tXXIVK4tROH/9mKXIWhx7Z1sGMQTZWLzU5MpTJv2S33L41rwJR4jHOg1LCJXUzVpCSYKPVFWA1a1FX5y+N6v9i1s8zuatYVcwfXEhEHRlKT3+cDb5wXAGB6FjO2XEPySRuqoiCFjZfWWuaVhk5PTUJd6+fV5k/WUlkKueXylfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198557; c=relaxed/simple;
	bh=0z92upF8xKOU/HaMYE1ZBiOd5Xi6AXhQNsyh8EwnhFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LXPu0aWdue/lOE5K0wfEJ6/WQAm8x/yUUmYu77045tMR69TXDrxnHZ6o3eNr/h71xRh2FIedlaJyINV03b3Cgb2i3SOWVHiR77/Pg9e53aQaUlfbRsayT4THUZ1FjzW0Mw4kZYva/g/g1vFpdNR8OU0QonpxXCcpA4M8xIXSB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=dlboqyds; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1769198542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZ1FOsHm/vGJer214zga1vzlRDmrTUC/1ttgjjuK9w4=;
	b=dlboqydsKNghsrFWuPNRagiwi1t7kf6ZpeRDUYxpBOt5Bgm7i7dDMVbYEEIX5+Qjbu4zCY
	Q3IcOju9We+KxQMeUxju3nidaGOXnZaCxjudffnb9viEsM4n5SMUxSpSmF9jhl/O7UzMrq
	iO0N5qPRjJ0CUov460DoNxN9VPe7gerLszUgtU9fQ7ZcbAiPggSE0p+ws73LzRm3/9UFWP
	vgpdRko+lhzXbFBi4D1At7e3AzWszyAjJ19GF+h90twaJh9MVqV3U6D1LmlNkinlPuFk+z
	S5XJWTt3pdUBIn1eRSlcI0sXiQX7MFhhKhS6/ad4C3w85Y0Udd67CxOpp4LhEQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 21:02:19 +0100
Message-Id: <DFW8JGOI41QK.2AFPP8SSK8TH1@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Robin Murphy" <robin.murphy@arm.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus
 Walleij" <linusw@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Marek Szyprowski" <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
In-Reply-To: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cknow-tech.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cknow-tech.com:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31025-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cknow-tech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diederik@cknow-tech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 349E57A738
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 2:27 PM CET, Robin Murphy wrote:
> On 2026-01-12 9:08 am, Bartosz Golaszewski wrote:
>> On Sat, Jan 10, 2026 at 12:55=E2=80=AFAM Sebastian Reichel
>> <sebastian.reichel@collabora.com> wrote:
>>> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
>>>> The GPIO controller is configured as non-sleeping but it uses generic
>>>> pinctrl helpers which use a mutex for synchronization.
>>>>
>>>> This can cause the following lockdep splat with shared GPIOs enabled o=
n
>>>> boards which have multiple devices using the same GPIO:
>>>>
>>=20
>> [snip]
>>=20
>>>>
>>>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
>>>> Cc: stable@vger.kernel.org
>>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540b=
c6@samsung.com/
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>>>   drivers/gpio/gpio-rockchip.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip=
.c
>>>> index 47174eb3ba76..bae2061f15fc 100644
>>>> --- a/drivers/gpio/gpio-rockchip.c
>>>> +++ b/drivers/gpio/gpio-rockchip.c
>>>> @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockch=
ip_pin_bank *bank)
>>>>        gc->ngpio =3D bank->nr_pins;
>>>>        gc->label =3D bank->name;
>>>>        gc->parent =3D bank->dev;
>>>> +     gc->can_sleep =3D true;
>>>
>>> This means all operations are marked as can_sleep, even though
>>> pinctrl operations are only used for the direction setting.
>>> I.e. the common get/set operations always worked in atomic mode,
>>> but now complain. See for example:
>>>
>>> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-can=
sleep-v1-1-3570518d8bab@kernel.org/
>>>
>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>> IRQ handler.
>
> Yeah, seems this finally reached my distro kernel and now the kernel log=
=20
> on one of my boards is totally flooded from gpio_ir_recv_irq()=20
> (legitimately) calling gpio_get_value()... that's not really OK :/

Yeah, I'm getting it too on several of my boards, like on Rock64:
https://paste.sr.ht/~diederik/154c5023a3a50d77f1da2195e7bb9a96f6a88555
(that's just a fraction as dmesg ran out of its buffer ...)
Also mentioned here:
https://lore.kernel.org/all/DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com/

Diederik

>
> Thanks,
> Robin.
>
>>> Considering setting or getting the GPIO from atomic context is much
>>> more common than changing the direction - is there some way to
>>> describe the sleep behavior in a more specific way in the GPIO
>>> controller?
>>>
>>=20
>> No, there's no such switch at the moment. This is because there are
>> paths that we can take, where we *do* end up setting direction from
>> gpiod_set_value(). For instance:
>>=20
>> gpiod_set_value()
>>    gpiod_set_value_nocheck()
>>      gpio_set_open_drain_value_commit()
>>        gpiochip_direction_output()
>>=20
>> I'm afraid, for correctness, it has to be either sleeping, or not. I
>> would love - at some point - to make pinctrl mostly lockless with
>> SRCU, like we did with GPIO. That would solve this issue correctly.
>> But until then, I'm afraid we need to keep a chip-global switch for
>> sleeping.
>>=20
>> Bartosz
>>=20
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


