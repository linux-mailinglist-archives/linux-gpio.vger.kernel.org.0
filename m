Return-Path: <linux-gpio+bounces-38484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id McPVKfbsL2qXJAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:15:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C040686136
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:15:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=uuwScwxL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38484-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38484-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A9433041BBA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858603E7BC2;
	Mon, 15 Jun 2026 12:13:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFD3A3E8C;
	Mon, 15 Jun 2026 12:13:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525626; cv=none; b=hfR9F6XuAOe2yUIk+wqPO5UPR+IWI7zzabfV8OtpAgkU8N1lMG9lF8feEyN8jJS0NR8FVZ/dm6dQSg9O2Pn1dVMBwEXW00MDlTVrU3zFhvqMLVVQZKJYjQGgyzPO9K8wNiVVRjnnYhoey20N6swzVwyaQOJozjd6A6xcESxNjCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525626; c=relaxed/simple;
	bh=ah18erX1lPjNnXTDiNLLtMXTFi6HUavcUGelWfS1d34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gujfvz3BBujjvmienizhVHg1t2Kwdi9fdhuKoIv0pN0R8xzBgKZB2XyHmzPVGEBuTwcSRUv0DOgnBMyJm3IXnlH2ph1pVcnkXlZ346hr1/fp5m11iOreXuTD+Bv7LnNK4i6Fm6U+z+VacIp9Jq1vIWjd4H6KjL0LUJxusosNt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uuwScwxL; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5CD64E42F04;
	Mon, 15 Jun 2026 12:13:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8397260015;
	Mon, 15 Jun 2026 12:13:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12963106C9386;
	Mon, 15 Jun 2026 14:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781525619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sns3BeHrco36Ohu4fMN21gbBwl//31RMnhSI/Pm9fUM=;
	b=uuwScwxLr7YjVkbeQD2ArIHF/JvBfpRXGf2MS1bS1NKj3dqj7NuRuOzjrjo8v8e7vWskpE
	o4nniOt+UKpU+1lnHnzTNrQn2AJr5K5L4CA8/e8HR61l4zALluuVZT470FFrYTbhB5HtoR
	yXZfAvojbxbrK8yjYhnacHwkZpv0+bD7WgrTFXGUpsxEblz1OZVW1znmBBBxJB4UBfENne
	SGnojUtmYqK6pOxZG7RIE/rHi6q+QUiebUUhd+/0+3kNBdEx7q3FvWjJN7p9x/lfgqlkju
	arPnrVIrFF6mlzBV4ejfS+YIuioaEOGaquzwWZTZ+U6rpk5RlC1S/jnBhuksnw==
Message-ID: <ec871376-3ada-413d-8be2-25b117eca213@bootlin.com>
Date: Mon, 15 Jun 2026 14:13:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>,
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
 <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
 <cb694725-b3f3-40a3-94c7-0c1606aaea94@bootlin.com>
 <CANYHO6qQituEPwAgb6YNRmsK0PbPxzKvSqSEHJApVw5xAzuHbg@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CANYHO6qQituEPwAgb6YNRmsK0PbPxzKvSqSEHJApVw5xAzuHbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38484-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C040686136

On 6/15/26 1:23 PM, GaryWang wrote:
> On Mon, 15 Jun 2026 at 17:37, Thomas Richard <thomas.richard@bootlin.com> wrote:
>>
>> Gary,
>>
>> On 6/15/26 10:01 AM, Thomas Richard wrote:
>>> Hello Gary,
>>>
>>> On 6/12/26 12:13 PM, GaryWang wrote:
>>>> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
>>>>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
>>>>
>>> Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
>>>
>>> Best Regards,
>>> Thomas
>>
>> I did test your series on UP Squared Pro 7000 and pinctrl driver does
>> not probe. Pinctrl device INTC1055:00 does not exist on this board.
>>
>> [   12.818773] upboard-pinctrl upboard-pinctrl: unknown pinctrl device
>> INTC1055:00 in map entry, deferring probe
>> [   12.818795] upboard-pinctrl upboard-pinctrl: error -EPROBE_DEFER:
>> Failed to select pinctrl
>> [   12.818801] upboard-pinctrl upboard-pinctrl: Driver upboard-pinctrl
>> requests probe deferral
>> [   12.818834] platform upboard-pinctrl: Added to deferred list
>> [   12.818894] platform upboard-pinctrl: deferred probe pending:
>> upboard-pinctrl: Failed to select pinctrl
>>
>> Did you test your series on all boards?
>>
> Let me know your BIOS version, we;ll check internally, thanks.
So I tested all boards of the series. It is okay for "UP Xtreme i12" and
"UP Squared i12".

For "UP 7000" and "UP Squared Pro 7000" I have the same error,
INTC1055:00 does not exist. Pinctrl device is INTC1057:00.
Please find BIOS version for both boards below.

UP 7000:
# cat /sys/devices/virtual/dmi/id/bios_version
UPASAM10
# cat /sys/devices/virtual/dmi/id/bios_release
5.26
# cat /sys/devices/virtual/dmi/id/bios_date
04/23/2024

UP Squared Pro 7000:
# cat /sys/devices/virtual/dmi/id/bios_version
UNADAM21
# cat /sys/devices/virtual/dmi/id/bios_release
5.26
# cat /sys/devices/virtual/dmi/id/bios_date
04/18/2023

Best Regards,
Thomas

