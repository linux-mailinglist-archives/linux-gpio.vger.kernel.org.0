Return-Path: <linux-gpio+bounces-39505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iGRBBLqAS2oeSgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:17:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88A70F0DD
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FXdHA9Jm;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39505-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39505-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5211C31C6198
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11340381B1C;
	Mon,  6 Jul 2026 09:21:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29436414DEC
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:21:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329684; cv=none; b=Y4VxeyyCy7ewfsCooK1q18GjK3IBhelr0ztJVM/ftzOh2tkijRtxMfkolu1NHvDJNrgQq/zLOxBNKJllflv7XdNb3DEkiYdcguZcOTHfeCdXIaH0xMVQvcacOx0kg26FYI3ePW8KfWtO7DYRRhi3hUyVfNqk7CFrjSw9ZIfJ3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329684; c=relaxed/simple;
	bh=fEIItaEioquLZZvHq7i104UnlRJA8Ih56/eY09Rxm/Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwgKOf6GzD8SEJYSe0gdPDu3qop6MWN44YWwcigFECkrHPvIShFJDpPmqihIR8g4G7BezBlnAZDufRUB+asLM61BGySPMER1iN7ygDTswyh6WD0zKQp2U/I1VNMTxFufvXShY7k5Tbcrz+zJVk98XE1YlL3tXirB6vDHgLD3HHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXdHA9Jm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEF41F00AC4
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329680;
	bh=fEIItaEioquLZZvHq7i104UnlRJA8Ih56/eY09Rxm/Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FXdHA9JmrwOtLvFB29IzRxxVHvucYnjIapNFbDsL+s3Kj6hm47Rpw5yuwn4Onea77
	 KcazkpAYfJP3Sk67QwhCjxxHknWr1IDiWA2BLZWXS9WQPNmf50IJGHXesvU7x1WKtr
	 XLYUcsfippqAZw/xAirLEdjkwVKktcv5b5wSKkP0Lr9MT33dfIzblf1Y/4mTbgniXF
	 Z3tBxkILBxDoTdk6cWnGpVH9K8E/ccT1rZaSehXn89v/+Rmrnng3e6No1miug/yz0a
	 M49ngX7qJtIofnv03veO70qYbEA+jzBlmRb48w8ueOK9YIlnqHxR5LBLyYPOoGLgsn
	 9N7qv0ZwbAAYg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b1026e171so27275481fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:21:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpq8xB8mDPD3LF2iBShdBobQTwNd1dljWy43O212dsyFfe50Zwwb8ohzkaB65cICviSYRmdOLaawNnH@vger.kernel.org
X-Gm-Message-State: AOJu0YwVeAJDnEEecfXGU1T9fQOdqklug/dJEMny+KXFQ4Zz2qSC57f4
	uP31gMywSx0Ne+QDWIud93GIehgtIOXD9XrdbiGj2gNFmuoRkqLHI4JH35cAgbybyt2mM4yL/pI
	zbqIV21wzWGpZLasrVke1lAuscFp6zJrKOH4qSxCYhg==
X-Received: by 2002:a05:6512:110b:b0:5ae:b119:872b with SMTP id
 2adb3069b0e04-5aed5086f19mr2179567e87.16.1783329679239; Mon, 06 Jul 2026
 02:21:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:21:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:21:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
 <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com> <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
Date: Mon, 6 Jul 2026 02:21:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeVOgXQGEFT=cQqSckLPhDAz8HTZYod7UMBN46ShRVo5Q@mail.gmail.com>
X-Gm-Features: AVVi8CcLBvN_nPV6V0rnOI6AAzL5NvuLGojL0HVPiqXaFSJwg2igVrhoiUtSQPQ
Message-ID: <CAMRc=MeVOgXQGEFT=cQqSckLPhDAz8HTZYod7UMBN46ShRVo5Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-39505-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:theo.lebrun@bootlin.com,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,bootlin.com:email];
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
X-Rspamd-Queue-Id: 5B88A70F0DD

On Fri, 3 Jul 2026 23:08:23 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Jul 2, 2026 at 10:34=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
>> > I actually don't generally agree, but you are using this driver more t=
han
>> > me now so let's go with your minimalist dmesg style for this driver.
>>
>> I get from where you stand, but the info level is somewhat strong.
>> Documentation/process/coding-style.rst agrees ("When drivers are
>> working properly they are quiet").
>>
>> If you like this log line we can turn it into a lower debug level?
>
> My actual preference for the record is not simple.
>
> I prefer noisy talkative dmesg when the platform/system is new,
> and new stuff is being added to the kernel in every release in
> large chunks.
>
> This is when things could go missing and cause regressions
> and it's nice to see a "hello world" in dmesg.
>
> As the platform matures and get full support in the kernel,
> these can be dropped gradually, because the driver can be
> trusted to probe properly.
>

But then people tend to "forget" to drop these logs and they are never
really *temporary*. :)

Bartosz

