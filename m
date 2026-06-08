Return-Path: <linux-gpio+bounces-38092-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xR65NZ/NJmo5kwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38092-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:11:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E24656FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:11:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LLeI6xK6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38092-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38092-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B3B304B2AC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCB23C3C02;
	Mon,  8 Jun 2026 14:02:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248E3C3BFE
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927325; cv=none; b=UceYgG5vc5DViKdXW5n8/XLgKAhMvrYlc/YdXVvt+yKltCq5TiOvTFp4WOL3cRGx90vCKVDuuWcu5eKpj8g96lKDT4IedT9ky68DeJHgTsP1khovuoEo9r8uic8bZVSPBQtxGKt3EYB1cXGm3+CFzMEeGqc5JOrouwojw7RcAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927325; c=relaxed/simple;
	bh=KImoIDiOHu3YpCc5qespvEjfo0CGRNgtwNagqsnBrrM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcuKffdD2quAta4pjU1QjcFm8rhpFg0YP1jp+i3do0hpBPoc736iKaqshWabzfuPM2BGYapLX7tHR+Pf/U41fWIBClP52rQfF3hfns815d41Jd9tz9B70+eEGWVmidiSu07cG4l7nv/rGGnOS8SsxEi7gBZVdmeiJEfVY9rM9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLeI6xK6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D391F00898
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927323;
	bh=KImoIDiOHu3YpCc5qespvEjfo0CGRNgtwNagqsnBrrM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LLeI6xK6M+heCGtPEeu+IMl29CA1mrwgkNDhEupSj5rUY++qhHmUZiEnO/Cy0eoSV
	 GtHA+QD5taQ/oEAW358GuAlwT/8VDR/NiBv20+04ZEw8PDVZOtqKKSUOeSuzsLa3JE
	 qvHU34rYdm4xIxAs9vkJMYk85i/N9ihxVhi7JHC2whZWeqmFf1bFJQI0+cqXELBtQ6
	 0Wx8HkEJObq18siIcbCqAMpAK4jGmGlXczZwA5/o3wuraU601Awg/r3EYWynhiPpkm
	 jrJphsPWEl23js2zQdWeZTlXGnSPtCSOsgn9Kg9pRM7uAIPzvrh+Pvf7s0JBqTvobd
	 LY+SPa6ON8HxQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso4394404e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Fs/pX+00geD/ghSz+Ua1sGMW2VBPDtkrDyluVACkwHeHbYxC3UhumaxvepEChhyytvmFzwX3oYN1K@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOJZ04s5TIEqeGK+c9H0ZBuVDa39qdpPLxi44IKTaBwZYJQ+G
	EDn5iZ2RA2E8hkXbL1maY1KSwGz9VVH4TfTkkg7aTaDpFv3fOm9mp46YEF5v0y1l+ENu8IWhdry
	FFg/4XNKSVKXVW7CPLciIbVMTWDTDeyVx/30P1W+hYQ==
X-Received: by 2002:a05:6512:3402:b0:5aa:500f:7bae with SMTP id
 2adb3069b0e04-5aa87b8f846mr4259411e87.35.1780927322278; Mon, 08 Jun 2026
 07:02:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:02:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:01:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
 <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com> <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
Date: Mon, 8 Jun 2026 07:01:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com>
X-Gm-Features: AVVi8CfOYaxpHXy9XUen3bss-b2J648J8X_AYXZDWcEXjwOJU-PvnGZ-xQy2704
Message-ID: <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38092-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36E24656FA2

On Mon, 8 Jun 2026 11:40:57 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> Hi,
>
> On Mon, Jun 8, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
>> <sergio.paracuellos@gmail.com> said:
>> > The GPIO controller's registers are organized as sets of eight 32-bit
>> > registers with each set controlling a bank of up to 32 pins. A single
>> > interrupt is shared for all of the banks handled by the controller.
>> > The driver implements this using three gpio chip instances every one
>> > with its own irq chip. Every single pin can generate interrupts having
>> > a total of 96 possible interrupts here. It looks like there is a probl=
em
>> > with interrupts being properly mapped to the gpio bank using this solu=
tion.
>> > This problem report is in the following lore's link [0].
>> >
>> > Device tree is using two cells for this, so only the interrupt pin and=
 the
>> > interrupt type are described there. Changing to have three cells to se=
tup
>> > also the bank and implement 'of_node_instance_match()' would also work=
 but
>> > this would be an ABI breakage and also a bit incoherent since gpios it=
self
>> > are also using two cells and properly mapped in desired bank using thr=
ough
>> > its pin number on 'of_xlate()'.
>> >
>> > That said, register a linear IRQ domain of the total of 96 interrupts =
shared
>> > with the three gpio chip instances so the bank and the interrupt is pr=
operly
>> > decoded and devices using gpio IRQs properly work.
>> >
>> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7B=
ZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
>> >
>> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
>> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
>> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
>> > Tested-by: Vicente Bergas <vicencb@gmail.com>
>> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>> > ---
>>
>> Hi!
>>
>> Can you look at the sashiko review? Especially the bit about tracking th=
e
>> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.
>
> I got rid of those two calls (gpiochip_enable_irq() and
> gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is the
> one I based my changes on was not used them at all. We have not found
> anything weird related with that on testing. I do believe that since
> we are using our own callbacks for 'irq_request_resources()' and
> 'irq_release_resources()' we are safe here. Regarding the others I am
> not sure, but the introduction of the remove stuff for the irq domain
> is because there are no devm_* functions for that. Other resources in
> driver are using devm versions so I think the changes are ok as they
> are...
>

It's about GPIO core: a GPIO that appears as "free" (users can request it) =
but
was earlier enabled for interrupts cannot be requested in output mode - onl=
y
input works. Without this flag set, gpiod_direction_output_nonotify() will =
allow
you to set direction to output.

Bart

