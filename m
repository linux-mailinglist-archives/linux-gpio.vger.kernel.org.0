Return-Path: <linux-gpio+bounces-2140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB382B2F0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 17:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF63F1F25B1D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93D45025C;
	Thu, 11 Jan 2024 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB9XeDvw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C765024B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-28cb3bc3fe7so3903813a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704990520; x=1705595320; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7nEMaLLJ/U4Z0oVzpD3lU0p8BUhz2DbGSN9HC/aJec=;
        b=nB9XeDvwCaGUf3yBtrjPBMM1E7P2VT/LeG4pK6uPza3GCzNq/qAnwCAe3ATJBDSErY
         39ZlO0obkg6mxUdpE75YF+ezm3o0MefHO4LdF4iG/sX/q635HGh6bO26zpGxifqhAPpX
         sxkLcVySyBshuzG15djYPE+vxgHHCUVfovYFgGFQFT44WpmY0WhRD/P7k1iN16tHAKFE
         GqhpKM4JQ4kl22BoS4rrvKXws8wXGo8oFVpLZeaka/O9HyLjb2P6M20GKwSnvC8qNYsx
         i645bUpLKyE5DxmBZP4+H3iO0a4DeLZ85d0P2NBj8ExN+7ovUlQHQpAXzYWncCr7EIJx
         mTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990520; x=1705595320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7nEMaLLJ/U4Z0oVzpD3lU0p8BUhz2DbGSN9HC/aJec=;
        b=cQyjRMkJbXt9dGh5FdzT1Lt2soMNmR7G6M4xIpTodJ9JZ0UKCN+etT1zumoWbDUwJw
         f/CeDbMfLDtezY8c+AXT6otFgOWFFkIk+8wmpAIs/2YegXVHHJBo4DNINBMmR8yMwGfU
         o/UFLb8Zzsw/b3h0C0ZRGqHLtgZ7ctPiM16Tn3H5iug7BNDA0rYlBPDDl4CcMF8XE+Rp
         pPsJemOXZay867kRC/k0O8HyJK9M0q0GIBA1Lj3BAnoowEubx2vjMcYhg60BkYL9L9A1
         UeWU5dOsQX4IQFnGmX4FYGw3fvABZpAhbWk7aRqJiI02K2RGEGJ6nfRNZ2rHB0yM9QrY
         VmWQ==
X-Gm-Message-State: AOJu0Yx22TbguT7TtSRsUN1zLXSEXsAOeaJa91whJzstwd5qnjZtN7aj
	jW0Bi2bI6mwlULgulRMAqhs=
X-Google-Smtp-Source: AGHT+IE0cUuuOfNzWHhFDKm0Tn47GBq7V5HqiCBRuu32QnIVLOlUYZSYWd7eE7ydpBvQFSnUlt+BFA==
X-Received: by 2002:a17:90a:d48d:b0:28d:b19f:8596 with SMTP id s13-20020a17090ad48d00b0028db19f8596mr79099pju.10.1704990520226;
        Thu, 11 Jan 2024 08:28:40 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028ddf518f76sm1991617pjb.40.2024.01.11.08.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:28:39 -0800 (PST)
Date: Fri, 12 Jan 2024 00:28:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Westermann, Oliver" <Oliver.Westermann@cognex.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Assign line names at runtime
Message-ID: <20240111162835.GA82333@rigel>
References: <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
 <CAMRc=Md_eZvVPMyeNZaB0b6SZyLw77eqRdC=qd699vB4PM3j3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md_eZvVPMyeNZaB0b6SZyLw77eqRdC=qd699vB4PM3j3A@mail.gmail.com>

On Thu, Jan 11, 2024 at 04:10:39PM +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 11, 2024 at 11:43 AM Westermann, Oliver
> <Oliver.Westermann@cognex.com> wrote:
> >
> > Hey,
> >
> > I hope that this is the right place to ask a question in regards to gpiod, if not, feel free to point me the right way. We're transitioning from using the old sysfs interface to using gpiod and named lines. For most devices, we specify line names at boot time using gpio-line-names.
> >
> > On some devices we have small differences between revisions or hardware variants, which causes lines to be swapped on GPIO expanders or just being used differently for between revisions. We started to handle this by overlays, but that requires to distinguish during the bootloader phase, which is hard to service and often unneeded. Especially when we want to rename a single line, the overlay needs to override all entries, which leads to duplication of those line name lists.
> >
> > Is there a way to assign or change the line-name value at runtime?
> > If not today, would that be a desired feature (as we're looking for way to test contributing back)?
> >
> > Best regards, Olli
>
> Interesting. There's no way to do this with the current uAPI. We do
> however have a way of doing it in the kernel. I also see a use-case
> where udev could rename GPIOs on dynamic expanders according to
> user-space rules.
>
> Cc'ing Kent who's the author of most of the uAPI code.
>
> I'm in general open to enabling it but the problem here is that this
> would open a real can of worms with *global* and *persistent* state
> controlled from user-space going against the design of the character
> device.
>

I don't have a problem with it in principle, though I would have to
consider the implications.

Obviously changing line names while another process is doing a name
lookup is racy, so the search could produce an unexpected result.
e.g. say you want to swap two line names, as was one of your use cases.
If the set is per line then there will be a period where one name applies
to two lines and the other applies to none.  Is that a problem?
Perhaps an operation to apply a set of changes atomically?
Or do we need to move the lookup into the kernel?
Or do we trust userspace to not do lookups while setting names?

And would the name be set through the chip or line request?
If chip, then do we need to notify the user holding the line that
the name changed?
OTOH, is requiring the user to request the line to rename it too
restrictive?

So, yeah, interesting idea that I'm not averse to, but requires some
thought as to what wrinkles it might introduce and how best to iron
them out.

Alternatively, are named lines the right solution to your problem?
Is it important to you that the lines are correctly named, or are you
just using the name for the chip/offset lookup?  If the latter perhaps
roll your own pinout lookup based on the platform configuration?

Cheers,
Kent.



