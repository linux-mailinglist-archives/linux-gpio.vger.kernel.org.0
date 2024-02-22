Return-Path: <linux-gpio+bounces-3619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7F85F2FA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 09:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B82283E8A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087CF22EFB;
	Thu, 22 Feb 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MWq3E3jU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AB241E3
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708590672; cv=none; b=L/RYXHp5Zt+Uki6/TZSCu0Hj8BJyZwQtiQKSQapZmngcMqVSnahTkdI32Gfp2mM/2jHKnJxbuvvGRMx1/wbuhFBFpEsz9t5WMRNLoDTOTkwEC3Urs6Hu8rdmtXqnbjkyzjpHn35x8gSnCdN/GmC/89d1e003WoGSTW5IRnubu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708590672; c=relaxed/simple;
	bh=cYs24B+jpboAdkYkeMVBrxhk7csmYQxiPXi3PgJL7mc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoBGcGBClz40mCp+TIoz5IrBb8yQuCzxOw6RCZIxLA0dq+EzA1o8eGq1gL1NoV4W0ocDfVdMr3fVHc5PPhE5ZIZyiE7/VPoNZXgqICL3O5oNREFocJwCF1ct/IZg1EvXoWgvUU5tmjOZIZc/yPMlqSACfJOJlEsuxd2/ou4zy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MWq3E3jU; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4704c69a3d9so1073036137.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 00:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708590670; x=1709195470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8jL3uYkTm+LNVdYsIt/Et/UrQilxmVNJ1Wadk+RFaQ=;
        b=MWq3E3jUheJHoAE7sAmDuaHV8+1c6cJSNZUViMXmLi0kstvlyFY3oUzG8MBfNOQwvf
         oVoZSkiwNfEoTg3zkd4SAWfQdN2Swcaa/XFvjRqCuqjanozf1GQWWz96MURRQ10Ibf16
         mJQgopnEpt2IujhQDIYdHsM5GJNKVBvLLivfiXDO7F8bYKT9d9LCTUbzL3BzLVRKFfuG
         dcLIHhSVqXDMUi/eRjVLwGYrBjGsYvA9Prq40Y5/FvGDmp8gqZMr7HR1Kxge+JWZ1TDv
         YOVJF3zo/f387X2kMx/lCVvI3ex8KZ/sLi90qvPX1JlDX10N/O/R/bLGbvECwoC9Opuv
         sWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708590670; x=1709195470;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8jL3uYkTm+LNVdYsIt/Et/UrQilxmVNJ1Wadk+RFaQ=;
        b=tqbiXMdZccyJAGlKfKDuH35iz79rKW5h6AMzvTnzV/C3g0rsdvnwv5gbhTcHaQo6FV
         g4WYDTdB9co0rqNn2tMXRUcvfaKxGtQzWjwGJ2xIBDwP8ZFUbFa9IVZ6VWKCSg3cL7lM
         bxibIG2bivqlssgj/DQguOgw+WP+lK587PK1T0v1kLwqNKvftwjzjp/Qr26Es3Ch8oNu
         pbGAkpD4nDDUJyr236DiikmQeL8rq7/pxUYOU/s8zDXxDomke98tMqTVCf06dfagE6hv
         3CRZsYnn4Wwtx1JE7GE/h0dm8/0lJKmXcDNVMMCE9ySTwEpngT+LnDQJcAkVqAbB2ECV
         bzJw==
X-Forwarded-Encrypted: i=1; AJvYcCW9cQEUApA1YWfa0ZT2+tfjZfIzze55M61WsZxKnNZ0mo0AGay44sijTExo5Jemzv5dvH8vgCztCmR0fvuzAJcKnWfzLSIv1HG/bQ==
X-Gm-Message-State: AOJu0YyhE7qG5o0TDh64juDL2VEkYgXPVSF8nQN8tqH20vw0+OpT1M0o
	xCXfQ4romGdNjoPHp69RWcIfROjiO+4rf8n3pLcVdNoTFiRM7xwqagHobdWA3Sbqj18A/6iKNw7
	Y3MruVDKhbg9DHgSOSlany8069nmhGq+HCuTKFRjJO44ou2Bu
X-Google-Smtp-Source: AGHT+IGlxAS+aeUhOv2Zd1f0luaBKqEE7591Sd+BPz9t0c5sIaDqZ5by2IaT44MkWcHBupOV01eqRQBkigZ25d0ToJE=
X-Received: by 2002:a67:fbcb:0:b0:470:3ece:b438 with SMTP id
 o11-20020a67fbcb000000b004703eceb438mr11731172vsr.1.1708590669772; Thu, 22
 Feb 2024 00:31:09 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Feb 2024 00:31:09 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20240222010530.GA11949@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111019.133697-1-herve.codina@bootlin.com>
 <20240220111019.133697-3-herve.codina@bootlin.com> <20240220142959.GA244726@rigel>
 <20240222005744.GA3603@rigel> <20240222010530.GA11949@rigel>
Date: Thu, 22 Feb 2024 00:31:08 -0800
Message-ID: <CAMRc=MdCm4UXMkzvG17Vd=6ajE+feihgYc66qUNTTKXhN0--dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: release IRQs when the gpio chip device
 is removed
To: Kent Gibson <warthog618@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 02:05:30 +0100, Kent Gibson <warthog618@gmail.com> said:
> On Thu, Feb 22, 2024 at 08:57:44AM +0800, Kent Gibson wrote:
>> On Tue, Feb 20, 2024 at 10:29:59PM +0800, Kent Gibson wrote:
>> > On Tue, Feb 20, 2024 at 12:10:18PM +0100, Herve Codina wrote:
>>
>> ...
>>
>> > >  }
>> > >
>> > > +static int linereq_unregistered_notify(struct notifier_block *nb,
>> > > +				       unsigned long action, void *data)
>> > > +{
>> > > +	struct linereq *lr = container_of(nb, struct linereq,
>> > > +					  device_unregistered_nb);
>> > > +	int i;
>> > > +
>> > > +	for (i = 0; i < lr->num_lines; i++) {
>> > > +		if (lr->lines[i].desc)
>> > > +			edge_detector_stop(&lr->lines[i]);
>> > > +	}
>> > > +
>> >
>> > Firstly, the re-ordering in the previous patch creates a race,
>> > as the NULLing of the gdev->chip serves to numb the cdev ioctls, so
>> > there is now a window between the notifier being called and that numbing,
>> > during which userspace may call linereq_set_config() and re-request
>> > the irq.
>> >
>> > There is also a race here with linereq_set_config().  That can be prevented
>> > by holding the lr->config_mutex - assuming the notifier is not being called
>> > from atomic context.
>> >
>>
>> It occurs to me that the fixed reordering in patch 1 would place
>> the notifier call AFTER the NULLing of the ioctls, so there will no longer
>> be any chance of a race with linereq_set_config() - so holding the
>> config_mutex semaphore is not necessary.
>>
>
> NULLing -> numbing
>
> The gdev->chip is NULLed, so the ioctls are numbed.
> And I need to let the coffee soak in before sending.
>
>> In which case this patch is fine - it is only patch 1 that requires
>> updating.
>>
>> Cheers,
>> Kent.
>

The fix for the user-space issue may be more-or-less correct but the problem is
deeper and this won't fix it for in-kernel users.

Herve: please consider the following DT snippet:

	gpio0 {
		compatible = "foo";

		gpio-controller;
		#gpio-cells = <2>;
		interrupt-controller;
		#interrupt-cells = <1>;
		ngpios = <8>;
	};

	consumer {
		compatible = "bar";

		interrupts-extended = <&gpio0 0>;
	};

If you unbind the "gpio0" device after the consumer requested the interrupt,
you'll get the same splat. And device links will not help you here (on that
note: Saravana: is there anything we could do about it? Have you even
considered making the irqchip subsystem use the driver model in any way? Is it
even feasible?).

I would prefer this to be fixed at a lower lever than the GPIOLIB character
device.

Bartosz

