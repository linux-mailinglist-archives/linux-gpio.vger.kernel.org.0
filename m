Return-Path: <linux-gpio+bounces-38099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VcCQNynqJmpHnAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:13:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EDB6588F2
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 18:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UzMrYfBk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38099-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38099-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3423B3043526
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063063EEACB;
	Mon,  8 Jun 2026 14:42:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F93CB8F4
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:42:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929735; cv=none; b=PuQSw6pn5J7jkf1GbTdVVtvUsohSIbSR1/AIPCv9yVRPjRLjBFupRCYz3a1XDqE1tqnRV03SDV0itVgJy8yr4Mi3LcQ2JdpJGKLVYKbzss0AM1CJpmlSkNc76mipMQC40zPhtH97AKYIhiVeLSqbHz/IyWkLmpGoqjQKo6uiykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929735; c=relaxed/simple;
	bh=9sxAwJFk7Hewd24YFdZwW3LkPbVmlQgW8YFxvH8m4PU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1AvktZgYUWOFrVgA+dImmJb8Wvf/The4Jd8YRB+hBNCys/iG8Wqd3B8GfMTd0TPdZbRMAp5QAcb9zANwonRsXySDKFYPTCLmofUVrZr8jZKRG8f+Ou/NwRiJBr0eQZQmyllKDRLK7+BXOUOH33wqf9fZMVRAQx3gDPqenqZjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzMrYfBk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875601F00898
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929734;
	bh=9sxAwJFk7Hewd24YFdZwW3LkPbVmlQgW8YFxvH8m4PU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UzMrYfBkq8WIZUbfS7PioN8VWmBiKvTCdUus3j18r2eAu/lSP9JwOAi912Cxa/ath
	 DrVApLMQbo6OzFbEUnKXdMPQYFWY9m3lov6CxrzHVxbRhLf1oFuN+XbvucVbxD1W/w
	 sJm8GSJG+8pJMp9RmgDvJSUdGj4PrrDyfiQXktumqmC5G9Y/sL4pyElAw3quk+bkKb
	 Cvw0uQJvXU3Vo41YxeKQxcbe7bnypviuvELrJtqf+QwYij5mPkgN3MWj71kJblrST3
	 t2tp4yjmwhXm5e9R9Y21+AQuCCbMPsvK8JfLMXK2hME7a6XfKXVzwoDse9Yh8/caZ5
	 NhVUKqHi1dJmw==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-138188a7dccso4015271c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:42:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hQKl64fF07e/efZsFSCMzg/6Losc07nUkyhHyMdGxfhs544zgGgD0gfSYOOffxFJ0gxJM0OeYlBU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+YJIswZI3m/yeTvsW5InTIUGQ5lNsBnkQvF5PTKcUPZXP3BR
	SBFUNGZ8ljYXNVHtPJltozRg41QUzqN+85LJCVNoopWwjOcBm0eVehKxdg7f8iySt2n5NUlL+P6
	EK9FcBGiiTkIHyutSRJvHSMCJpdX+h+RApxK1XPJwBQ==
X-Received: by 2002:a05:7022:6999:b0:137:ed4b:c9b4 with SMTP id
 a92af1059eb24-138067246damr7397876c88.28.1780929734029; Mon, 08 Jun 2026
 07:42:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:42:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:42:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
 <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
 <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
 <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com> <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com>
Date: Mon, 8 Jun 2026 07:42:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeGFiNRmA1JjOrqGMZm_ChXddOp6gYcSjQTTz0YOWk7ig@mail.gmail.com>
X-Gm-Features: AVVi8CfrIpjvSw-bliSQkKrN8jMB4rBtoCnkA040Myx08mIHfpmezYMsca07GSA
Message-ID: <CAMRc=MeGFiNRmA1JjOrqGMZm_ChXddOp6gYcSjQTTz0YOWk7ig@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, tglx@kernel.org, grant.likely@secretlab.ca, 
	anna-maria@linutronix.de, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38099-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50EDB6588F2

On Mon, 8 Jun 2026 16:27:35 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> On Mon, Jun 8, 2026 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> >>
>> >> Hi!
>> >>
>> >> Can you look at the sashiko review? Especially the bit about tracking=
 the
>> >> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.
>> >
>> > I got rid of those two calls (gpiochip_enable_irq() and
>> > gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is the
>> > one I based my changes on was not used them at all. We have not found
>> > anything weird related with that on testing. I do believe that since
>> > we are using our own callbacks for 'irq_request_resources()' and
>> > 'irq_release_resources()' we are safe here. Regarding the others I am
>> > not sure, but the introduction of the remove stuff for the irq domain
>> > is because there are no devm_* functions for that. Other resources in
>> > driver are using devm versions so I think the changes are ok as they
>> > are...
>> >
>>
>> It's about GPIO core: a GPIO that appears as "free" (users can request i=
t) but
>> was earlier enabled for interrupts cannot be requested in output mode - =
only
>> input works. Without this flag set, gpiod_direction_output_nonotify() wi=
ll allow
>> you to set direction to output.
>
> I see. I need Vicente to re-test without removing
> gpiochip_enable_irq() and gpiochip_disable_irq() to see if everything
> is still ok.
>
> Vicente, would you mind to test the following change on top of this v2 PA=
TCH?

Thanks, sorry for the late notice but I was travelling last week. If this
misses v7.1, it will go in during the merge window and can be backported

Bart

