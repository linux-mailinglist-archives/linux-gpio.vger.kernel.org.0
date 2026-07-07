Return-Path: <linux-gpio+bounces-39586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVSYGVDpTGrkrwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 13:56:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBD71B23B
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 13:55:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ulrEKnsb;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39586-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39586-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA7930DF177
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA183FB7DE;
	Tue,  7 Jul 2026 11:50:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5412FB969
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 11:50:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425037; cv=none; b=UoE5ccy0r5jBYjNvG5AmC0Z6d1E3hzRoWIC3X+xvr+gte7gSRqoPuUbXkoXvBTr9+KDNM2ayP9Xs2AwJT7y4AQCkjU3n2yxfoCTAWjEuUGkGh923LfUXrMqX2rDcpzDqCQn4bly/f9Qjexj+XEvOtqC6CfSjdDnrYPmsyqiNfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425037; c=relaxed/simple;
	bh=yQi707ZRaSUeL6SHRWhShbHNkEbYALBGCHIrW3FFnYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4Y6Q4/JWL4UMX4Jw9AcDqjHrPxPUZK0CTpssjH/IGZHWcLqoG0Hq6dUl/1BsCUxrYI8+30rKt7cVXEclpuBloDaWVaziNbIVMXsbFDMSBdDA0C9IZhQNOQC26WrZ0dwmv7hDduK4OF+Oa3ZLA32rQwGVe7uzDPscN0PUHPjZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ulrEKnsb; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9C464E40CCB;
	Tue,  7 Jul 2026 11:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DC77601A3;
	Tue,  7 Jul 2026 11:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC26511BC0DA0;
	Tue,  7 Jul 2026 13:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783425033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yQi707ZRaSUeL6SHRWhShbHNkEbYALBGCHIrW3FFnYU=;
	b=ulrEKnsb8Xf5D6beSCNJe84/3pEUNHjETl08B+x9WEOVV3HgBX3yAJSlFmN7kQf6AmYIJT
	7ZrWqvT/b05XroZbmckynKtco632gQVNxm/il/aFpDh8ucbSVQlHS98OUY4OwLokRdYuF0
	cB3r9sYZILNHln1EuHdc+cIIYhZqrdt4dfTll2koBf/ZXpgos+U3SYWOxWcOvBvDU8HnFd
	SnmDiv/GMvHNsPUakrjLN7nkAjxMUBfNjdFwLdtLO7MIYGUJ5l+6f0dezW1iihbsmy067J
	D/UNghpWH/8FdaXoy2xNW0WG3j9N0nviGyIrBh1e2UjbxNQt8rm39+a96/Ystw==
Message-ID: <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
Date: Tue, 7 Jul 2026 13:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Gary Wang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39586-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BCBD71B23B

Hello Gary,

On 7/6/26 12:36 PM, Gary Wang wrote:
> Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.

Driver probes successfully on UP Xtreme i12.

I tested the IOs:
- pwm0 does not work.
- uart1 partially works: TX is okay, but loopback doesn't work. Signal
is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
- i2c busses are okay.
- for SPI, MOSI and CLK are okay, but not CS.
- all GPIOs are okay.

Could you have a look please.

Best Regards,
Thomas


