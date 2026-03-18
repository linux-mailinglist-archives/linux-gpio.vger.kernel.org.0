Return-Path: <linux-gpio+bounces-33766-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM1UEL3dumk3cwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33766-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:15:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FD2C008E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA4AE34469E1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 16:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67887405ABF;
	Wed, 18 Mar 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrvFKfJy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7903F1675
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849804; cv=pass; b=r3Loh88mx8JpyOn9HqMZxb1iuwG5SzOWPbFKxRxOWGSv7S7N2bcfe7i2zznmqitzqZRSx5qSzNh576oFsZGfjKd0zcu/JEXeJIcCkIxFfd3tkrBXf93FSnFEzteNYKekUWhp7JWrrGe1ydV9XAHzAanz6Clbm4duF/Kz9Ggvpcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849804; c=relaxed/simple;
	bh=whUst5kD5E4ZE3YDOSV+OSVwVL0wed8ch5z/VyWCXig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4ICWbyxdvaX+bVOFlaHFDX5sk83QoFHMKlSrphHNqpTp59w7/GC9ID/sz9vxknMVKjMDwjWyPvSq4ZShvQ40nJHrTRBoiP2vJ6miCxVuGZHwS7CqxKH/R9KMfMuClFIh2kWns1fje2itePAlL8awHUE8IKn/lUClcDuFTcZKiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrvFKfJy; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so139552a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 09:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849796; cv=none;
        d=google.com; s=arc-20240605;
        b=dSo82doZeDWT1cRxJDlq+nyyBrG6AiPtANTD/8XOBNCnlED8tHwP/+ChdnNSTfR00p
         S7W+DxMPQ5kGTZqUSI//l183hmGjnu8JFao3ZjAH3ArL6pPhkGkumym7IpaLYyjGvxVH
         5balzaOFnNVh5Iq+UbeCg284FnpifuXQwLksZWeVcu95a1Uvz1Zu8OSBkIOcc9mpHOxc
         ReKLgM9odpwRRc9F4eihXcZTKHd+RT9vjmyGIL/SBK5axn3jmq1Vp2QfVWcIvMMccYlL
         KitxHcLmNR2Ootj1PJHtGy89zujcco/r9rp6QMoE6YS04CAOTdUBkBA/lLIXNtw3mA/x
         Rl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        fh=XafV7B7pJY4UVWspmy44v3r/cH0+QQFm6DUZbMjGABE=;
        b=d1Rs61ErVE9BfKU7uTS2WfcWwBAJYqw8+3ELc/LvApUiicobEhaEbwoOglLKBmm27m
         EeIf3PMhyU/MZcsGZ3RH8J6kgmGRMEGP1ujsBkU0j3Tzp3lFifS6543rSXBqmr1tP+iK
         UsuUYpNSZcVohoIOmmo44WHMVgbGGG3fZcpk0GNBe7/ttvP0NFQKkY1hghUSs0qVsTaq
         pOiatC2Tx8CZK+n0rhkYFGSYXtKzsLgdbWEVepA/KfLjfxpC0V+9Ivwwr5y8tqycokzZ
         7VvuIFzyLOTYTlOWcH0UVS1W1UoUj1HnKinNBHeaPBK9cIud2JoajZthhgD9fqk4+ji8
         +odA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773849796; x=1774454596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=NrvFKfJy8CtNVdNccGFS39F+Doot4zdly3PsBWy04M7efbIcf6JilwzgwZ5tKcxYvE
         CRsztuu8mCaeVzWm8JS8NQJo8NiV+qUdakCj+PcJCY5f9k47Y9Bzl/s2JryZnZYbIQJ4
         Us/Q6uozSXjJ2OHxxlKdUPPtzhCLXNQV88EcL9igVFlszfsI1/PHUPIpZQ42UUpMqSQM
         Qb1vV55lgYIoRD0ARNuuIEsSzK7rgFpdNAbbklTL6awoS2ak9qKkt/HctA0Lqi+BKIO9
         yW/TET3gQkdUt+yvJpODff1zYn7V7WIgZZMyyEUk4J6HO/ZMfVW4Fn4uELApzY2iMTeA
         IOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849796; x=1774454596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=oko1OidfvUOfHLs4lnDJhCdc8+TjQ+QE3vj3HA3Mc4LlMBBug8xDbbPvTw4samJHmK
         /j98ftc+yTRwApx84clPnw2wiFbUDGegTR24OVtiZtY7kFhlWc/hdzmekoXvpJmwCMJL
         T4VdE1/QC3jInIbH+MmJg3qvpT19R3zkRJyoz9TkzlLJ3Ion3is4CDK2aipQbHsx/avP
         O/9le4f5o+PqSphVHbrd2H3IzMih7lO4ESuVisQJKaIOlmTUFBFadR+oSoUyh4eHqnxw
         ytJ2KqZTeNSHb1YH+h+LvoRzKDyvGKzUsQZtjevs9LyYCzXtsEqu6D5Wdkhw+hac2Z0i
         UoYw==
X-Forwarded-Encrypted: i=1; AJvYcCUxdV97qsY0tt+nIzkyMG3Jsbw76r0BfwWw56eegWeFfRGwtSbR+pN4uEya9taqCHkic4xrwA9SPxlh@vger.kernel.org
X-Gm-Message-State: AOJu0YxIzYa9m1ywX1iUix58ITb4OiOIp1X5AgDIV5QkkLO5CO1Z8Ytt
	SdA6rK4IrrXHk09SlAAW+QsM5TbKdgJVJKO8EufRc0sBnJFO5B/V4SkXBjw+GQTU19j5d3vCqlo
	zX7V08G63ozH+HlLnFB62LKAl619HoCQHHSMzaQKN8w==
X-Gm-Gg: ATEYQzy/4JRANWjy7YnHFhY6+KmCyMpjMSo/qKkrbxN4xo4bm9je7XCIExH8C+2xTym
	psHEjMpd/0pjzPal6am1U4n6QhYSAIMdqhuT8+KDal+5TESjSFo8NOxo3LyALdk68eKcyHKNKLS
	nbFldBi2lbsCmpp71JBrbjEiUUCszenPmNAMjDZ5v/2Zqu+ahQhFhh8VfiongfPQgEjSDM3mI2M
	HVl1O4GR3K50P5du/9N7DY+gL+sQhvXpdHsbXyjCP7MK3UCe5vKDqaHPL5KmZhfah8rX/2R0BZN
	U4LYd599Cplpgj+pwsSHc62MUMcaNIuwgLsPrWtg
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id
 a640c23a62f3a-b97f49bd1dfmr258135566b.42.1773849796081; Wed, 18 Mar 2026
 09:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 10:03:03 -0600
X-Gm-Features: AaiRm50ET16GLgpYC6lwF0jbLmfq5CygllZIeseBjuujZbOA5MhL0hZ6kP_Zg-Y
Message-ID: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33766-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[foss.st.com,nxp.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.931];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:url,lunn.ch:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DE7FD2C008E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +struct rpmsg_gpio_info {
> > > +   struct rpmsg_device *rpdev;
> > > +   struct rpmsg_gpio_packet *reply_msg;
> > > +   struct completion cmd_complete;
> > > +   struct mutex lock;
> > > +   void **port_store;
> > > +};
> >
> > Except if I missunderstood Mathieu and Bjorn's request:
> > "reuse all the design-work done in the gpio-virtio"
> > We should find similar structures here to those defined
> > in virtio_gpio.h.
> > struct rpmsg_gpio_config {
> >       __le16 ngpio;
> >       __u8 padding[2];
> >       __le32 gpio_names_size;
> > };
> >
> > /* Virtio GPIO Request / Response */
> > struct virtio_gpio_request {
> >       __le16 type;
> >       __le16 gpio;
> >       __le32 value;
> > };
>
> The core of the issue is that Shenwei is stone walling any change
> which makes it hard to keep the legacy firmware. It is possible to use
> these structures, but it makes the extra code Shenwei needs to
> translate this protocol to the legacy protocol more difficult. It
> might need to keep state, etc.
>

I agree with everything Andrew points out above.

> Two points...
>
> The firmware implements more than GPIO. There is definitely I2C as
> well, the first version of the patch has bits of I2C code. Looking at:
>
> https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/
>
> There is also RTC, and a few other things which don't directly map to
> Linux subsystems, but maybe do have Linux drivers?
>
> Give how much pushback there has been on the existing protocol for
> GPIO, it would be wise to assume that I2C, and RTC is going to get the
> same amount of pushback. If any of these three, GPIO, I2C, or RTC
> decide that only a new, clean protocol will be accepted, no legacy
> shims, the firmware has to change, breaking compatibility to legacy
> protocols, and the accepted shims become pointless Maintenance burden.
>

I have made this point clear before: modeling legacy protocols in
mainline doesn't scale.  Mainline uses a single generic protocol, and
yes, it means breaking legacy protocols.  This is the cost of moving
to a mainline kernel.  If people want to use the legacy firmware, they
must stick with a legacy kernel.

> Point two is that the customers who are pushing for these drivers to
> be added to Mainline probably know that nearly nothing gets into
> Mainline without some changes. There is some short term pain to
> swapping to Mainline because of these changes, in this case, firmware
> upgrades. But in the long run, it is worth the pain to be able to use
> Mainline. And those customers who don't want to upgrade the firmware
> can keep with the out of tree drives.
>
> So, what are our choices?
>
> 1) We accept the code as it is now, with the shim?
>

NAK

> 2) We keep pushing for the virtio protocol, with the shim?
>

NAK

> 3) We keep pushing for the virtio protocol, no shim, firmware changes
>

Nothing will get merged in the RPMSG subsystem that includes support
for the legacy protocol.  Not today, not in a month, not in 5 years.

> 4) We pause GPIO where it is today, and restart all the arguments with
>    the I2C driver. We can come back to the GPIO driver in a few months
>    time once we have a better idea how I2C is going. And maybe we also
>    need to see the watchdog driver, and argue about its protocol.
>
> I also understand ST has a generic I2C driver nearly ready, if that
> gets merged first, that probably kills the NXP I2C protocol, and maybe
> the NXP GPIO and RTC protocols.
>
> My vote is for 3. If not 3, then 4.
>

Strong vote for 3.

>      Andrew
>

