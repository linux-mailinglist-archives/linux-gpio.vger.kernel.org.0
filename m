Return-Path: <linux-gpio+bounces-30420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617DD10598
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 03:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DC9B30021C2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 02:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E48302CD5;
	Mon, 12 Jan 2026 02:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTA86PtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54E3A1B5
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185174; cv=none; b=J+xPUoKLMepzY2iUL/2P68Zw1yQAITSJAZ5mQyxE/7h9SIpEUej2X+qPpBPR48KE+Noc06YY/34rFM2AgLzZGxcD/zQZZXiTSiAXTseEpdsfLLHpgrudXKnQPCWe62TDVfdJUXIwLz3XixxFr1OOeviU3gYcYyfJ781nYvG16lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185174; c=relaxed/simple;
	bh=Wm0SyoWuWYpUbdCBKdyEKC6CZDpQz4s7UUZbkJQ5whM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DARlZ2mc3f91nm0wd1ek1W2Df4FOeTzQWr72BA3lh4PH96fLSnVsbHyEjdRjyeDvXyhqcWsV+n/AjhPOlejgwZRYxtRqtRquOfBROIMlg6pdmpX/28RtbvcOWGFP6nB5RbkaErrHCAPE5liE+ZzQhZ5LTbwxa4uHSyO6NhHij58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTA86PtZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA36C19425
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768185174;
	bh=Wm0SyoWuWYpUbdCBKdyEKC6CZDpQz4s7UUZbkJQ5whM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WTA86PtZoM2o8gogmdeHs2mZG59AIb3UsBh072pQOO0W6NW93n0n/b7+CPSY+8A3L
	 LEeoTz5wNEi9B3wkJNDFY3DGdycV0xiJXC34VF1b7HsK/8KuwefCig8YYZ4zSOm6bN
	 hya8sMfhGUNhKfciYIiRanwf94HdnJ8VhJtUagixsanqZvF6OmNZPcabaSk4N3qWM0
	 ZAVgY/W1/EVKdRDo8g/kiSJ24ssMIc4+7XZnhRngksm4Hx5zOaaRMYtvf3gdSxauth
	 3yWhI2O07HWdIeUEiykAN95OlRxT7qa8a/+jsYfJxHrNhS0dlIqXqzdh+osED+RCPn
	 NGCbJafV+tRAg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so8643851a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 18:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8bMPOYmbml7ivRkGbFYuGp9OJjh8zQnv+5EIm9uwLC3eUWmGGqVPwoHGvg2LLKfNX1eX8qJP6u8RN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+aU0QSU5GuPRhUdCm0vzwCewjG6cuGPdVtKSctfQ2jCX8Bpq
	MkuBPvc1vf8qQhwnDSOTrDPWB2ctu3T21xQ0SUy6mCaNaAJMDbVyWF8XEzdmuhf6V6kkILLu1UG
	QksL4bzd+17sdrioVB/OS4EJ9g187/2s=
X-Google-Smtp-Source: AGHT+IHnFRUk9Kd7nBIk7drCLG+VlRsvsdUfgc9mGUEfCHqBJzkKhLAMdqT9OJtk1tkozQdTJ6DzDqRdjo+V3HkHP5A=
X-Received: by 2002:a17:906:8a58:b0:b86:e938:1b26 with SMTP id
 a640c23a62f3a-b86e93840aamr455645166b.24.1768185173274; Sun, 11 Jan 2026
 18:32:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107030731.1838823-1-daniel@thingy.jp> <20260107030731.1838823-2-daniel@thingy.jp>
 <20260108233818.GA1466897-robh@kernel.org> <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>
 <20260109142907.GA3059757-robh@kernel.org>
In-Reply-To: <20260109142907.GA3059757-robh@kernel.org>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 11 Jan 2026 18:32:43 -0800
X-Gmail-Original-Message-ID: <CACRMN=ecP3aJSEwSWrmBDH+dP0F9kQLAjESBswfDu4HBJh-Jhw@mail.gmail.com>
X-Gm-Features: AZwV_QiWu4THh74guSSQ-daUbnzckoNx5DmIarU6Y_B0BQmylxuX3W8VTipEFDA
Message-ID: <CACRMN=ecP3aJSEwSWrmBDH+dP0F9kQLAjESBswfDu4HBJh-Jhw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible()
 that can be build time culled
To: Rob Herring <robh@kernel.org>
Cc: Daniel Palmer <daniel@thingy.jp>, linusw@kernel.org, brgl@kernel.org, 
	saravanak@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:29=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 09, 2026 at 11:51:52AM +0900, Daniel Palmer wrote:
> > Hi Rob,
> >
> > On Fri, 9 Jan 2026 at 08:38, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Jan 07, 2026 at 12:07:30PM +0900, Daniel Palmer wrote:
> > > > In a lot of places we are using of_device_is_compatible() to check =
for quirks
> > >
> > > I'm assuming 'a lot' is not just 3 places? Got a rough estimate?
> > >
> > > This seems fine to me assuming there are more.
> >
> > In core code (like the gpio core, and not in a specific driver) there
> > are only a few places. I think around 10.
> > There are more when we get into drivers that handle lots of variants
> > of the same hardware and check the compatible string during probe.
> > (There are ~700 calls to of_device_is_compatible() in drivers/, most
> > of which seems to be quirks checking during probe).
>
> Generally in drivers, it is preferred to use match data rather than
> of_device_is_compatible(). And if we're going in and touching
> of_device_is_compatible() in drivers, that's what we want to do. Using
> match data of course doesn't help your cause of reducing size. I suppose
> you could define a macro that includes a compatible in the match table
> or not. If the match data is function ptrs, then if those functions
> aren't referenced, they would be dropped by the compiler.

For the 10 or so instances in the core, I'm not sure the macro is even
worth it. It's just hiding the IS_ENABLED() and obscuring the intent
for not much of a reduction in code size. Not going to Nack it if Rob
agrees, but I don't see the point of the macro. I see the point behind
the idea though.

Also, if we do land it, maybe call it "enabled" instead of "possible"?
That lines up better with IS_ENABLED.

-Saravana

>
> Rob

