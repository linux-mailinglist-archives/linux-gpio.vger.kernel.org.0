Return-Path: <linux-gpio+bounces-39391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bqyED3J1R2onYgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:40:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC37002E7
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="g1/bkJbu";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39391-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39391-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5AA7303FDC0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A333B97B;
	Fri,  3 Jul 2026 08:20:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122130B53F
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:20:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066809; cv=none; b=I/lHdZwawspZE7VHQqOv/mie1sGYWrAHAFwdwYefjt17SYWO4w3IJOcn5b7rPox0Ez9Y519aakunWlNNv4F87eZqItdA3g37H8UEf4HmppmZCb3GGKk4PvG/P52/wvhCULXgrvdCwvoqpw+DXUaNRE20FMO05eY7/xwGgM5zB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066809; c=relaxed/simple;
	bh=asrF0u9bX+YETjMxSTJvh5rVP0ohIXEanddnLALRraw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOrBof7/r63yTjsavxMLxhBponmc0YHAHK1fJy0xXcjZ0T8XHgMaGyhIPf8uafTxtQefXZvCEIAwEChhjmL0n44/vlsmfgSYQIdd4Rl/S7wc5ZM2MDbqGTINh324sr8ewCqq/ul1vE3RgAzq9mrcgOymJi9bEgOaqZK9PeSi6qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1/bkJbu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E411C1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066807;
	bh=asrF0u9bX+YETjMxSTJvh5rVP0ohIXEanddnLALRraw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g1/bkJbupZAlyCSXPu9bCHa/ZtEv3YBBPrFvwDfMqKh1hRimkfftfU2D+QeiG0WxH
	 9I2iEd1rp9LiKxrWq+A7wkYsNjRfdJ3CAf7kZyCXVDyLp2biehWBiscW+aZE79nMYF
	 S0gn5GV05EhW2jwI2ECapG4WdqBqjW3w308NJchwQnHiKdM5AuNseQ8aHqru0zSr0w
	 CjZMoODw/dOYmhCAtpXkwqL7zV/S8Yl28GBKX2V3VqEOv+Ti+jXFJ08Hl3CiKRBedo
	 t0ec1+k9HnKreoy3X2zSt8lEVGxlsXAw7hy+tApOT+Ar4+ftStPHAcHDMGJAA6i5WC
	 vzeui/QEqXCpg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so3198191fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:20:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpfgClXoz0vU3CuGa3RnRi24Mz+uWtGjJ6SpdZpHWN6TB6EGHbaMAFtvsM1GMpeoaSP31PWx1j3kXyY@vger.kernel.org
X-Gm-Message-State: AOJu0YzESQyCFdk6D2UJXUsa0pBfN5N8rcQKA15Gq0fN6d/tTtsKjk6h
	UrfZSoXX5Xv1Xn1qoQKZESJYolrqOpdXEMde/eaLWJoxwD4RkGYGk2hCaQc2ZpPZKSKxtv9e0zD
	cTjkmbsi3sWbJvnmDUeeTexq6NoEv20+5TUtROvBtGw==
X-Received: by 2002:a05:651c:1547:b0:39b:3018:fdba with SMTP id
 38308e7fff4ca-39b340f3e6dmr20771621fa.26.1783066806661; Fri, 03 Jul 2026
 01:20:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:20:04 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:20:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com> <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
Date: Fri, 3 Jul 2026 03:20:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfKkd-FYA+4-jjgSW+F34ShotOY3Jkq5vuEmOGCtfYx3Q@mail.gmail.com>
X-Gm-Features: AVVi8Ccaevf9d4eyRM_6Pqww_NGDFnClLnLs7TOb7wYTeUcKNISsM-dwHisAhxs
Message-ID: <CAMRc=MfKkd-FYA+4-jjgSW+F34ShotOY3Jkq5vuEmOGCtfYx3Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39391-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:theo.lebrun@bootlin.com,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92CC37002E7

On Thu, 2 Jul 2026 10:34:02 +0200, "Th=C3=A9o Lebrun" <theo.lebrun@bootlin.=
com> said:
> Hello Linus,
>
> On Thu Jul 2, 2026 at 10:00 AM CEST, Linus Walleij wrote:
>> On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>>
>>> Successful driver probing should be silent. Drop unconditional
>>> dev_info() call that is done at nmk_gpio_probe() exit.
>>>
>>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>>
>> I actually don't generally agree, but you are using this driver more tha=
n
>> me now so let's go with your minimalist dmesg style for this driver.
>
> I get from where you stand, but the info level is somewhat strong.
> Documentation/process/coding-style.rst agrees ("When drivers are
> working properly they are quiet").
>
> If you like this log line we can turn it into a lower debug level?
>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Thanks for the reviews Linus!
>

My personal preference is for silent drivers too. You can find out if the
driver probed correctly from sysfs. Only if it didn't, do you need to know
why from the kernel log.

Bart

