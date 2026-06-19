Return-Path: <linux-gpio+bounces-38707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q1LiOH8FNWp4mAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 11:01:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 649466A4D04
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 11:01:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cFZb9JqS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38707-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38707-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE3C3014436
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 09:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997C432B134;
	Fri, 19 Jun 2026 09:01:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBB344D9D
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859709; cv=none; b=AtExxDuTC6ZbL4DJ38XpXHbZI4TYqWS0upNe9M6DAPAAVwu9tRSaPYtuV7/VV9URBwdU80WDmC4qVonFOss07R/6rPDw8teokyfJIjUcReQUB4yfToh1DOSxLcikSzZjDAAoH8L8O6KzzmETzzV4yP3On1VaBNG+/rf6baGmXdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859709; c=relaxed/simple;
	bh=zU4s142hiv5ZJGw/ISAGSflbdb5JqkT2RwmoTGOe2D8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQC8l4XksvtLI0seHVjwpRx4dIAo1jP8XbPLUAv/p92Z38bt0IILt1Ey0wtF+Uh4Ha4hK2XvwHvTjEcHxYmcnRS0ooxYdmhNKDhwuah9sN5Rno2ILw6RJYZ5hcOftEweOCC7s9XWEyzv0MbuI8FO4RXF/UMzGSGTS9Il46Thhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFZb9JqS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D361F00ADE
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859708;
	bh=Y5VtAymxlLFEtb0U6jcGmlhzLhg//OIMtC8T2ioCYrc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cFZb9JqSPtnh8VwXU7oKlMKiSPgRJmzZnIAd1QeGARdtrTOXzyFwBw8CQeMAKb/mO
	 IlRLx9yBLuddW8AgBZ1+jHzpLszyAp1IVF1qhFE4LghsaJ+Uj1VwzjXYaJNo+kh5Zf
	 KwrUJc13uiSw19BaVUia2ZfmmJuSAPBeVHmrqPfuFI9XfZOBYbheQpi2tVFzNLz4Lm
	 3nukAGpY4S488Gaxjjcq4nYc8JVlj/PtPvSsjP6HJ87/p13zr8/xTgBkJnj1W3dO0x
	 Ub60SWVqtpNCO9W+l2i1MpAFEXa6NrSPAEwIwxIY8buLyQHmPvhtl/EzH803l9LtcT
	 XzezWFVGTNrnQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad58fe9030so391387e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 02:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bK8fjMU8o7fJm+p4gaTzk77d6WNcWgu0zobtM72rEBgUbVHBoJUfpS7w2/7G+8MIQLqruttKqd2u8@vger.kernel.org
X-Gm-Message-State: AOJu0YzlF0ap6q+qIDVNWsBwA7sA5FljjvoPIvEcosbP3ak1H4oRadxr
	Z/ph9D+dZoYE1bgfj/AUdkgOpkFGIFpBWkbvw23WD7e/4q+FxsWNVuPzRtVNVUNV5C26TjjQO7p
	7RafuBA6Nnm8+fJ1NaKAfFHLv3OY7cmDErllVwj2p3g==
X-Received: by 2002:a05:6512:32cd:b0:5ad:5454:ce36 with SMTP id
 2adb3069b0e04-5ad576e14f5mr699548e87.14.1781859706741; Fri, 19 Jun 2026
 02:01:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn> <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Date: Fri, 19 Jun 2026 04:01:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
X-Gm-Features: AVVi8Cf8K9ux4cOtecot2S0VT6T3CGese0FIUj-6Z9fRYnLoXRYWJS40QkJmni8
Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38707-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:ludovic.desroches@microchip.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:antonio.borneo@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,microchip.com,bootlin.com,tuxon.dev,foss.st.com,gmail.com,csie.org,sholland.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev,seu.edu.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,seu.edu.cn:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 649466A4D04

On Thu, 18 Jun 2026 15:15:30 +0200, Linus Walleij <linusw@kernel.org> said:
> Hi Runyu,
>
> thanks for your analysis!
>
> On Thu, Jun 18, 2026 at 7:42=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn=
> wrote:
>
>> The path we are concerned about is:
>>
>>   gpiod_set_config()
>>     -> gpio_do_set_config()
>>        -> gpiochip_generic_config()
>>        -> pinctrl_gpio_set_config()
>>        -> pinctrl_get_device_gpio_range()
>>        -> mutex_lock(&pctldev->mutex)
>
> That would be mutex_lock(&pinctrldev_list_mutex); would it not?
>
>> If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
>> can choose an atomic carrier and call gpiod_set_config() while holding a
>> spinlock.
>
> I see the problem.
>
>> The local draft I am considering marks only these controllers as
>> sleeping:
>>
>>   pinctrl: at91-pio4: mark the GPIO controller as sleeping
>>   pinctrl: stm32: mark the GPIO controller as sleeping
>>   pinctrl: sunxi: mark the GPIO controller as sleeping
>>
>> The reason is that all three expose gpiochip_generic_config() and can
>> therefore reach the pinctrl mutex from the GPIO set_config path, while
>> their current gpio_chip registration does not set can_sleep.
>
> But that's not the right solution is it? These controllers can probably
> just write a register and be done with it, they all look like they are
> memory-mapped? That means we introduce sleep where not needed.
>
> Can we simply replace pinctrldev_list_mutex with a spinlock?

Oh I've tried, I've give it a few attempts in the past. It's not a "simply"
case this one! :)

> The list isn't gonna be huge and all in-memory anyway.
> If it takes too much time we need to think about putting the
> ranges in a better data structure such as the maple tree.
>

FWIW radix tree provides some RCU synchronization IIRC.

> mutex_lock(&pinctrldev_list_mutex); could then be turned
> into spinlock_irqsave() or even better
> guard(spinlock_irqsave)(&pinctrldev_list_lock) in
> pinctrl_get_device_gpio_range().
>

I recall running into places where a mutex would be taken in atomic context
in that case.

Bart

> This would mean we just take two different spinlocks in seqence
> and save state in each so it should work just fine.
>
> Yours,
> Linus Walleij
>

