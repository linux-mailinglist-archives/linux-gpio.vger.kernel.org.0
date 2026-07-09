Return-Path: <linux-gpio+bounces-39717-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bXQ3EChYT2pVewIAu9opvQ
	(envelope-from <linux-gpio+bounces-39717-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:13:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9075F72E1AF
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:13:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LVy0b4BW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39717-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39717-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E07930FF282
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFC63E7BA9;
	Thu,  9 Jul 2026 08:07:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0873E8335
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:07:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584438; cv=none; b=iR/y7wyjLfTOb25Wbjbdn3r7E8SnZ69bmO16Dc1GEhMLzQzrUMB0dN53wXnhZWO3NDfJaZL7s6rd/o2zVgAWUGfJ3pAi2tFN/t3AlV31WDNOLhzPY4KkUSJjdk/OEvtPgpV1nM7Il7djLK55tQojO+v5p5XqBIg/uwkjNuj5Ci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584438; c=relaxed/simple;
	bh=PCZKJhxu4VtflLZBqcUMucKaOgBGaHhzk44+FWk3YpQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sn33W4/MtpB2Xo+0AyjHukV4mZ4iNEN8DSkgbJ/Jx+QiQ+ybGhR4FhCW1mKDDfKawct1yhXBzSv4DXLenDs1Titp5aByVT2ParmvKn9KXUC0hbcVMCSo3kcx0hRvrC1C4DGMxFBJ8IxKHjcqnqyJugOhP3X+8e1GZcTchPONBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVy0b4BW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72861F000E9
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584436;
	bh=lIepizMbCh3N2ETXzfyVIdMH2wjf/7Wp5IvuWcd67oA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LVy0b4BWDRneolVOXQOtxR2J8slkIbiGgEJWo1QgftDIn0z+KG1Uz+iWaMNOpRGWd
	 27MWEzxlzjoLLUv7A4FzXRUQwv3xTdzs869xD1faDnWSyXPjJmMoXp/eJ4RK+bjIF8
	 DPoVrQDmUM/57BxzDC/FHzlfUKcOydzz4qqw/cb4z5nX6cCLKeUnA3czT6jSeZV/zr
	 meQkK9QrKAmb8m/ykwO1t46DRsYruuN3oYg9ki+SHlF7QE1+CB/bmTN3MaQbxX5KCM
	 C3g4/jQuQ4Pg+Tflp1dVeH6cfpJJoXgRbEllwksamAR6QzVPTU5JzDckdFjrYCfeIk
	 ao+C7mBhsDngA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c62764c7cso5797951fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6sVcKM1tmx+4iS0qIj8caG0Ymh9/X1UCSM2M/j5bQ54OSjBYs3doJ6pqNhjb1nuH+YlQ8JKZIPtPh@vger.kernel.org
X-Gm-Message-State: AOJu0YzdarGAyIeY+5KJ07Fzxg4yvoek353V8hgUNFP8TnDDv3RVng1L
	ffvf1hT3iFhjGb/g1afJn/501TMCF+7A4NEZtqblH4ZeXH7u33SJ51Hnr3EbLD8OMH7OzsVU8hW
	U3miUPXgFF7FuLhMCDkyIAKxVWOryGxvNfQ3O6rUxjg==
X-Received: by 2002:a05:6512:2398:b0:5ae:a4f9:fca with SMTP id
 2adb3069b0e04-5b016d51892mr367468e87.15.1783584435662; Thu, 09 Jul 2026
 01:07:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 04:07:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 04:07:14 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAKxU2N-Nbe9YcWKw-ps3DY1-_N+Uw0NUJT8KCK6hm7P4oDqaqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707233511.1272686-1-rosenp@gmail.com> <CAMRc=Me3hfzzZq=ZvobyYTnu-Kv32psnsJUbuJ7Y78tKmqinMw@mail.gmail.com>
 <CAKxU2N-Nbe9YcWKw-ps3DY1-_N+Uw0NUJT8KCK6hm7P4oDqaqg@mail.gmail.com>
Date: Thu, 9 Jul 2026 04:07:14 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfnQ6Cm9tUmNypiLrbskku29vEc4CWHBUPTVu086D2n5A@mail.gmail.com>
X-Gm-Features: AVVi8CcSMnkiQN_i1hEpgLBFbisF0t_CCZOLZUWgWyx57a5PHltVoD7gJtI8n_I
Message-ID: <CAMRc=MfnQ6Cm9tUmNypiLrbskku29vEc4CWHBUPTVu086D2n5A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39717-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9075F72E1AF

On Wed, 8 Jul 2026 21:19:17 +0200, Rosen Penev <rosenp@gmail.com> said:
> On Wed, Jul 8, 2026 at 5:11=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> On Wed, 8 Jul 2026 01:35:11 +0200, Rosen Penev <rosenp@gmail.com> said:
>> > The driver uses the legacy .suspend/.resume callbacks, but sets
>> > IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
>> > runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
>> > interrupts, and only then runs dpm_resume() which invokes the driver's
>> > .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
>> > mask registers).
>> >
>> > This ordering means interrupts are unmasked while the hardware is stil=
l
>> > in its reset state, potentially with incorrect polarities, causing
>> > spurious level-triggered interrupts before local IRQs are re-enabled.
>> >
>> > Convert the driver from legacy .suspend/.resume callbacks to noirq
>> > callbacks via dev_pm_ops. The noirq phase runs before resume_device_ir=
qs()
>> > on resume and after suspend_device_irqs() on suspend, ensuring GPIO
>> > registers are restored before interrupts are unmasked.
>> >
>> > Assisted-by: opencode:big-pickle
>> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> > ---
>> >  drivers/gpio/gpio-mvebu.c | 15 +++++++++------
>> >  1 file changed, 9 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
>> > index a556fdb267a9..1df763e60726 100644
>> > --- a/drivers/gpio/gpio-mvebu.c
>> > +++ b/drivers/gpio/gpio-mvebu.c
>> > @@ -979,9 +979,9 @@ static const struct of_device_id mvebu_gpio_of_mat=
ch[] =3D {
>> >       },
>> >  };
>> >
>> > -static int mvebu_gpio_suspend(struct platform_device *pdev, pm_messag=
e_t state)
>> > +static int mvebu_gpio_suspend(struct device *dev)
>>
>> Needs __maybe_unused for SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().
> I see __maybe_unused and #ifdef for code like this. Which is prefered?

__maybe_unused is cleaner. Please add some newlines between quoted parts of
your emails and your responses for better readability. I'm finding myself
looking for where your response starts.

Bart

