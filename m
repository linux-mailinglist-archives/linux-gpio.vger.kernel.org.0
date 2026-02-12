Return-Path: <linux-gpio+bounces-31636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 85s5C7EGjmkT+wAAu9opvQ
	(envelope-from <linux-gpio+bounces-31636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 17:58:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789B12FBA5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 17:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A08930398A0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 16:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D39B35D611;
	Thu, 12 Feb 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAz4l6rn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248E35D5E9
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915229; cv=pass; b=p6/VatNfqYFJksM0e9plIUACa6D/1tYyQCveoTlTksIxoZkhu9CkQnLAmKX6DAtfyVyI1NS49MpfW79udiN6fk4ufCMcI6LAETYYS2FTNbeW+dVO06K18iuEwN3IDf6moEuXk1Xf+hzK3MiKekaWI1WKv6wj0FPe5xfw7ENiEHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915229; c=relaxed/simple;
	bh=KRRuDH186O604x0X4TRhFKVbtELrQs8CvwIYr5dkakI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5aM0EKw/4wwfSbppw2Ztig12APyKqBPVEvYYvz9P36kbd1R4VCXW6pSe/kZASmVTrpkVsfdyGjs9uBDf9TtS9xpmK6MXp+Oe7Buyyuqql9gbZAsO9I5fWAfJ0gVU9cHnlBVnVivDPUYWhgGi6o3WcOlBS3d5om/zBFjZsH3LA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAz4l6rn; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5fe0959ae3dso14945137.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 08:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770915227; cv=none;
        d=google.com; s=arc-20240605;
        b=Z37n2K0jMQqBLS4mRuQ2UN/qh910SBIBlERTA+VWEH2dmimMywH3u7svAd5dcQsHhk
         C4NHa0CbM7/L2Ned7gyEO77Zh0h/9p+ik1J5D5P0+rv/e1nmTd89JRzkgg7xTF1981gK
         LSfQMvbkNnG0s9M3MhTaVnpAgkSZ7LDbc2e9Gi5PjnAzQ23/Vo7E99e5Crg80EK073fC
         YyTX0QsM6rhfpv6AUZStFBF5jJXCpUNoAkybKkSLrM680W3cEG/7OPjv0paN1wtnJSeb
         1iBNvnzwsVUlk52pb4VG/GNjwNAOdn1hvx2BiZunKVlPuUB3HHc4NzpHCr3uuVXZ1AvI
         5jAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3NjKRq6iigwgiI1ey9uPZ+chcyfsZLM885ukY9EonI=;
        fh=C9nFtywxuWIyPSl+rsP5Ed2wnznA6vP3rpexdwMp0TM=;
        b=U/XnMsOIACmZnTg/ouLtQqtJp9VW/GUaj15UrTBa/7fIL5avALU15J+ZIeWaYBZKpt
         HtvbHurCxrcyL7O32m634eJQwIIbNxitaKujPWAZ7NYuy1dBX0zZvtm5SduAfeiMPh1a
         v56nRmB0gJYiyIaLRSQcOv8LTBR6Fd81rbgqJChtfzKOemC+bkH2PnOYU6KfgF17qiTe
         VgWP8zEbIjO5FarEDnKKkabEs5rmJMGO2qsXuSdXOD6c7/1O3ECrQ7erOELbpaR6iqlF
         vBPUwvctUEYwD9f8eKsOiCjLCRNBXof8Uo2h3N9lGh/zluo5Mq2XEkuCAhjOhgVShP7G
         Dkbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915227; x=1771520027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3NjKRq6iigwgiI1ey9uPZ+chcyfsZLM885ukY9EonI=;
        b=HAz4l6rntdy/I+RILkSEaM+m4aI+ALbE/gJur+wfAakWe+bNUcIG4ZxxXaoR7bsE9G
         YzHymcqvOGaPGaUwTMCFGw4AH1LVQxHafEmKtgesusxttD6GfsiXw/hDe9JQqE1w2bUn
         gFdDUrFRfX72Uyj3JcKE4kMteX6K2AsldZT6q2pvrcHvjrb/ncSm85EF1CFne6OfotNP
         49nNPMdcUkqs7r0juBrk8EiTG+i2unk7NwENglIJPzcEBO2YkSDgdc7q0G8BU4tttQbF
         24fI0quGFYK8/utmyQlYfDUxIaJVotUDhrSzkRmNL3tmRfrdOt9HtXZ2Rhqrg0XVNXM6
         giNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915227; x=1771520027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3NjKRq6iigwgiI1ey9uPZ+chcyfsZLM885ukY9EonI=;
        b=Cm0dAfgv5pmfj1QmbbEGfdm3MldvCVASbCSCRbiIOFjIYtv7MH5BztxZ7j5mmdn8j3
         HKgi8gsJBpxJbt7QS8iinlbNjePCUuFgSLp+DD/SgWbSBgKcllunvW4kuYtYHmXn94kE
         pMELloE0HSPmVIm/fcOwxCEQ7AXEKemExntm8RAegCmCH6ngeVkFcdI+tt5ZS9WSXzC+
         HWnFo46f1xMzTVFsrrmEo2VkedZTAZN5EUdDVzUbSkj6islzOCPALPTYCle93hFqpOCn
         KrKexJG2eniXpVLZtWeUDAJgDqgxchVvsCfgOzE7TCUnBNI8a/kbiB00qrmmWTN+9zLl
         Or9A==
X-Forwarded-Encrypted: i=1; AJvYcCUimxAAbNzLHHhMBiQr7n08QSI7qjPqpEboS/vlk2/Y0fKLwxeUGqjDcp83shxRhhADmpczE+kaf84w@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdcc5o0Vsowz2woyaWLZH6/7TXDFe1maphvu3INz8YEC4sscN
	qaQyZ8VtXFewW++NT6GFpZdRoACcbIgKN8PjgENu+8U0OcNnAFBDpSwhFRojqhA/ObEfMZYX6sQ
	53xFBEKWupz633Dn1AZatJM6t9QagVtc=
X-Gm-Gg: AZuq6aIR0DIn5rVUrzCdjxK4WO56Cn3hkYxOb6OosF9uIyG7F6dm1wP2+N4YGLvVOEd
	voS025LBRUbIqEQuqjLeegJvGyRqHA2uyerExjq/4xl/kY7ti12EOU/LYM8V5wtkRWkjXBT8IjV
	MzcUpN2PtXNNLTEVpIyCyeh6240z9H2D82YigKDrwJaaGDyhGi//zAEzyi7pUV+/1jO5j2T0m8w
	zNAtvPZtBt6dqS4lsHvILugwI5CqelWYSEkirhTZA48xDsl1ggOS3W+kVJkp8+gBY+7Uwano58x
	EU9E6eB7EWCrSQ41qX/50ROLfi9Rw4HZ7Bc3NJ9apSQURvz/w6n0vu0lxaQVsnNg08KM
X-Received: by 2002:a05:6102:a50:b0:5dd:c53b:75cc with SMTP id
 ada2fe7eead31-5fdfdc3aafamr1210516137.13.1770915226784; Thu, 12 Feb 2026
 08:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <CAMuHMdW4oNeGY4VP7zajOS17apnjqS050H5L+Pxqe9bqqt=WNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW4oNeGY4VP7zajOS17apnjqS050H5L+Pxqe9bqqt=WNQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Feb 2026 09:53:35 -0700
X-Gm-Features: AZwV_QiXDqffKgbN_n4Kb9EWjkuAa84A35C9mQaCYNZwP4RfgXLuGYOv1oTlqC4
Message-ID: <CADvTj4qQii5+tLtVVmBBXqdOmHXwj5T+kuadOAppx=+9rRuy_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31636-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7789B12FBA5
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 7:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi James,
>
> On Wed, 11 Feb 2026 at 18:01, James Hilliard <james.hilliard1@gmail.com> =
wrote:
> > On Wed, Feb 11, 2026 at 1:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > > On 11/02/2026 09:28, James Hilliard wrote:
> > > > virtual gpio driver though so AFAIU it's not hardware specific.
> > >
> > > You can give example of any hardware where this is useful. You need t=
o
> > > make your case with actual arguments.
> >
> > The sunxi h616 board I have has hundreds of GPIOs, only
> > a few of which are needed, I want to map them in device
> > tree overlays since there's some minor variants with different
> > hardware gpio configurations.
> >
> > Setting the gpio names on the parent controller is not practical
> > since doing so would require setting hundreds of values for
> > gpio-line-names, you also can't really combine sets of pin
> > names across device tree overlays AFAIU.
> >
> > > > Use case is I have a device with something like 300 gpio
> > > > lines...and I want to name/group a small subset of those
> > > > lines for delegation to a userspace app rather than trying
> > > > to set 300 or something gpio-line-names values, also I'm
> > >
> > > So if I change the approach in user-space or use different user-space
> > > app then I change the DTS?
> >
> > The idea is to make it practical to set gpio-line-names for a
> > subset of the GPIOs that are wired to peripheral boards.
> >
> > Say for example I have a control board connected to a few
> > different peripheral boards, there may be different mixtures
> > of peripheral boards, some of which can be used at the same
> > time as they use different GPIOs.
> >
> > The idea is we load device tree overlays for the detected
> > peripheral boards with detection done in uboot based on a
> > GPIO pin strapping based detection.
>
> Sounds like the work being done in "[RFC PATCH 00/77] Add support for
> dtb metadata and addon device-trees" [1] can be helpful for you, too.

I think I came across this as well, it did look potentially useful for
moving hardware variant device detection out of uboot, but doesn't
really seem to help with the gpio-line-names definition problem
that I was trying to solve with the gpio-aggregator.

The hardware I'm working with isn't really designed for runtime
hotplugging but the eeprom based detection could be useful
it seems(currently that's mostly done in userspace logic for the
peripheral boards). The line naming is more for dealing with
control card variant detection so that I can pass line names to
a username application via device tree.

Even defining line names for boards without overlays or any
runtime detection seems to require a ridiculous amount of ""
placeholders at the moment, i.e.:
https://github.com/torvalds/linux/blob/v6.19/arch/arm/boot/dts/allwinner/su=
n7i-a20-bananapi.dts#L227-L276

Is there any work going on to allow offset based gpio-line-names
definitions so that it's not required to set all gpio-line-names at the
same time(essentially making individual line name overrides
in either device tree includes/overlays impossible)?


>
> [1] https://lore.kernel.org/20260112142009.1006236-1-herve.codina@bootlin=
.com
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

