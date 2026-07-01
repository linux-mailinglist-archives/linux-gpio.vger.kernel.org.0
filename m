Return-Path: <linux-gpio+bounces-39283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tDL+IJrQRGo91QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:32:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F076EB1FF
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:32:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=pk4AtDVr;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="a PVd6uL";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39283-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39283-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BDEE3036F96
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288443E717C;
	Wed,  1 Jul 2026 08:32:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FB2126C03;
	Wed,  1 Jul 2026 08:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894740; cv=none; b=iSNRVIMYChyKjO/xwzmfRVUnH4lNGGfRIV8689Y6OKHaXKAn/0eGm2itr3SyKAaxmqemW+xsfScIs4WXTDgiQSrA6yCJALRq2Lh/IepQw0YEuELaAFUtGH11eOlf5yEgrOeEWIb3y50XRCth9sy5CDCod5COyiflnQEFZfWyT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894740; c=relaxed/simple;
	bh=ue4wzFqFJKqL2WfmlTkgjVeQXRsUBYlyz2PcQ/gXSIw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mf33lmYuMt58EIBsyDzKPmOcx1Te6e+NgDoA713c6rJpD3Ly8bF4NBC4mR8jvP8lzi6kg5c786SjJ/fGiBkXKX/I0c9OXK/GmXRfbomBZfVvfdHAqLO+MmFL36voEHViYiU3E2TxQghfAdZwwsvDxubIrZyl3vXCvib6VcJrrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pk4AtDVr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aPVd6uLE; arc=none smtp.client-ip=103.168.172.138
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 10A071380095;
	Wed,  1 Jul 2026 04:32:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 01 Jul 2026 04:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782894739;
	 x=1782901939; bh=VCjnwi8QfYnO+8yzfpol694kVs5T+6OkOnlzLTl6vgw=; b=
	pk4AtDVr7X0Ga3ZeWprkuDgz4D0ADwYPDjiF6dJpeDjRBJwKFomQfgV1i2cUPfwS
	YGG7oxHtxzxWOI/oCF1vTenXM/Bxnl+jzvqa2o4Uav3luge6v1KsVb0Z58Ux10SH
	ihh0bvVj3hWOmrddUlZbKOAN4x35MKqgbBPgbBV3RnkOt941tQlZLmtzA0NS1gVa
	wZi+BX1NBKmJrTAwiAoLRjtW42OtB7SEAhpJrWi1lBjP1k7jAL8lyCFZnVDg89+r
	yq3ugkbXbTZjzlXrAoPV90L435jnotEuAcLSM1fiUThBWAv5FA+0Gj5gsyx2KLQ7
	ZckqFzlkSmSQZ4fn81X3Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782894739; x=
	1782901939; bh=VCjnwi8QfYnO+8yzfpol694kVs5T+6OkOnlzLTl6vgw=; b=a
	PVd6uLEv7fU/TFcABcQ+6PpHoMr8BHiJ+7VXlOffrKOqC36QNz/tVpyV3NvzfTod
	D12qmE6PIf6WHNeISxeR2PjY2027TmvjNXrFxvtY38cmVNKGAlsBHfYZaEPMldtj
	Lx4aKKaBkPRT88prowJPqxRuZQHVZjBoqJ5QCw0xSe6s44p1rQ086mjOsoX28TPW
	9xsDJn/pATFSr1374Jh2BlzoBgdD3L6Pec9oMRKCmjzb9eZyHTCmKVWo3RDAktE8
	tNkami4hj34GWAN2LivncENYiAdNktm7yzF+45KtV6dfaEprjLbvQJRIJu7kUuvb
	iayg2SwCno/GXgKqzIgsQ==
X-ME-Sender: <xms:ktBEau0GTKniJ8UB3YIuVYzf3eXVLN7QylKoL2Bg3MvVCc4pVtvVDA>
    <xme:ktBEar60oidT1BA9rF5zAoFVaPJxONWxBjLfRIadX_dUCe2QqF-rSuhjZX7RPcIt0
    McilfieaxXTrUq93k9EhmP2DAH4aUXqX6JoopoRear13Gt0vfqWdww>
X-ME-Proxy-Cause: dmFkZTG0B4Rq0E7HZkR0pnZ163rac2T7w/EKBvk1H137+LZ1DDmAdSv9ox5RZtU3ubf1at
    u6WZgpkWy1yZ+xPhMEysBiXHkI/FAG+tA+IsC7Ro0iyP9baBdW/Gqq+MlndGYuJGyVzQes
    sd0BE3aLNH4YSDGlgFLBNAaYaG4sOQZZhfVJ0T/DQs+GdE4ZINEDpFh6AD1t6CMHbDFHDW
    Dyb4WNYJUZVB9C+3CFefMMbkInAN2w2O60GzAhBejddPbYdKqDE8euqw5cyFrUqYL7HsI0
    R+mzjjbALXsHGc4CbyBPpSyrrc7KFjZiKMINe5pj5pPVKzR16ORlRpADFkdNJmxEZmU+Hi
    ynyy/p0s3wJ+5wEoNPryrkVk9wTT8gYX2NL2ziGtuHO0uNldRlrz3biDchZ5dvxLIoQPIf
    4Ys0zoOwEAUJHKft5OKDDA9H2IMg5sfzB6cDfIpFIN0QNKHe1GarKKRW9xzRvvwFTC0xOM
    y4BJJZ5HI/iFaCrklCySRsAU30y83NuxwPgF9nAHDnQAYLQGdVKWf6ZBWmjRbJTc4RScn0
    PuPIT1IbJ8nqZLck0tWGST4XHneH+nQKFfqBV2Q8vd0Qp009muP0neRLplYkqbtscaQsro
    HqRhq0vRLrdvrrofCQK3xJLqp8yB0cEt3pLS1D0HPb/YWgaYMdL06KmwXiqQ
X-ME-Proxy: <xmx:ktBEaqLzev-1LnQpM8aDMtsrxpbXI8sZxIxM5-kJ2egQIJ0_s1wuwQ>
    <xmx:ktBEaituhqNUPSQSy6pSO_Qxs07LiQTb2hOujvou545SdGJ0hWLeNQ>
    <xmx:ktBEajm5fZl4R56Cjs77mdXM8OA19dWCSOQIvEyWIusUmQRiQ2DdOA>
    <xmx:ktBEaplfx6UlRi6-9Vko4Drjuya6hEFHgk8ptOVgSj4h5IyVGGcNBQ>
    <xmx:k9BEalsyhw0QnIjnuvZrS58BD58_C1KJuzD7-U3z5P3C3pb2O69T_it9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1786E182007E; Wed,  1 Jul 2026 04:32:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A045QOfflcQ7
Date: Wed, 01 Jul 2026 10:31:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Ulf Hansson" <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org
Message-Id: <72746bd8-8ba3-4369-a2e9-60795f183813@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
References: <20260629135917.1308621-1-arnd@kernel.org>
 <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
 <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
 <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39283-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:arnd@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:geert+renesas@glider.be,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:geert@glider.be,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,samsung.com,glider.be,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,app.fastmail.com:mid,arndb.de:dkim,arndb.de:email,arndb.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15F076EB1FF

On Tue, Jun 30, 2026, at 18:01, Geert Uytterhoeven wrote:
> On Mon, 29 Jun 2026 at 19:54, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:

>> > Same results for instantiation using sysfs or configfs[1], although
>> > the latter does have optional support for specifying the name.
>>
>> I wonder how many of the other instances have the same problem
>> then. Would it be appropriate for gpiochip_fwd_desc_add() to set
>> a name itself to address this one?
>
> I don't think it would be appropriate for the GPIO aggregator to set
> that name.  What we want to print here (for debugging) is the physical
> GPIO that an aggregator's GPIO is mapped to, not some consumer or line
> name (which is not guaranteed to be unique).

Ok.

> E.g. "<chip-name>.<offset>" would be fine.  As gpiod_name() can only
> return a fixed string or an existing string, it can't return such a
> formatted string, though. And consumers don't have access to chip info?

The gpiod_hwgpio() function is exported to consumers, so they can
already print that instead of desc_to_gpio() if the local number
is sufficient. If we really care about the <chip-name> portion for
any of the debug prints, we could export another function that
returns maybe gpiod_to_chip(gpiod)->label or
dev_name(&gpiod_to_gpio_device(gpiod)->dev), which are both
constant strings we can print.

It looks like we can also replace most of the remaining callers
of desc_to_gpio() with gpiod_hwgpio().

       Arnd

