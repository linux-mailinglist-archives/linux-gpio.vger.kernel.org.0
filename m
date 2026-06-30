Return-Path: <linux-gpio+bounces-39175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fyw2IyyLQ2qxawoAu9opvQ
	(envelope-from <linux-gpio+bounces-39175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:23:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828EC6E219E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:23:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b=c41trpg9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39175-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39175-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E08330775C2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 09:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1CF3A48C2;
	Tue, 30 Jun 2026 09:20:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96D3E715E;
	Tue, 30 Jun 2026 09:20:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811243; cv=none; b=l8/vFidYr9SjDtlGZ6Snux4UWtU7vGrDvqzJkUA0hZ6nKY3yZK6XrTuqeDkaWseS98CIITk9YBShJJj9EA3EqfzHGdCEbI2OowORkwYvcNOUuxVU35TQIX1LbXKfa/VEfiUm+u2VlcTjQi48ySj0DWjARSIF8gNAAh+7Q2HQ4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811243; c=relaxed/simple;
	bh=uMWyAXqP3phmmOTg+BKzpsMTXJ5dnVuzUfHOfIBTI+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlDIxlmYOJs76UjPBQJrXSrx28k/oexETw15RVyjC/4Bayi1gzwLUJMrgDN9uCuFr62wi5hkacOezTk86I181LY+j8IwSRYr3GlptL5ZJhqfXPXN2J7G9FCAGNSFDXqwBNtlxXJisdnAdBsrzm6eMhlBV+ybvjuTm0WSyfvZw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=c41trpg9 reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0200C1CB1C0;
	Tue, 30 Jun 2026 12:20:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782811230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+b12GfQ8In3o4ovjul5sBZbhYkFtSmsBEzRp61e6vmg=;
	b=c41trpg9FwCyH/Bhr0WpgflKpMSuo4ZMhShALqn7X/iaJeIVZ25Pee4Mgph7HO8HwfXQ0o
	OpVm+We7kMtlm6TX2Bvg8cenRxUXl/daSYdhhas7CmpED9goK6paeKeiCiCAkO2T/gk+Bx
	9/W/mOfO/EuqEn3DYSuxFOhoojF+MPldKOyiL3d98bn2j5Ll353kIFNY2qmjpjlHzj0oBb
	9raO6C0WxXUdWFf1Fh127vdvGLBPOLVMkjRuqvi8d5W4nZPZlu7TG7Tu0oca3W5r+LM+9E
	Mhs0G7LCI+zG5UwKJ7TFp9ynjIC9ewBN5n/fTb3GWuMWoQfGelD2XnSN1h3DIg==
Message-ID: <1877bda5-8724-4de8-8898-a7730344bdc9@baodeep.com>
Date: Tue, 30 Jun 2026 12:20:08 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20260625115718.1678991-1-v@baodeep.com>
 <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,samsung.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baodeep.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baodeep.com:email,baodeep.com:mid,baodeep.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 828EC6E219E

Hi!

29.06.2026 20:06, Bartosz Golaszewski wrote:
> On Thu, 25 Jun 2026 13:57:17 +0200, Viacheslav Bocharov <v@baodeep.com> said:
>> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
>> runtime from the underlying chip's can_sleep:
>>

... snip ...

>>
>> @@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
> 
> I was about to apply it but then realized that it can be simplified further.
> The set_func() argument in gpio_shared_proxy_set_unlocked() is no longer
> needed and can be replaced with a direct call to gpiod_set_value_cansleep().

Good catch! This would even remove the extra fuss with the GPIO state.

> Would you mind sending a v3 with that included?

Yes, I'll prepare the updates and send v3.

> 
> Thanks,
> Bartosz


Best regards,
Viacheslav

