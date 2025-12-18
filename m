Return-Path: <linux-gpio+bounces-29733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C4CCB491
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95DA3014D8E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 09:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C6A330B3B;
	Thu, 18 Dec 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIWCxFl3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426A11CA0
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051929; cv=none; b=Vu5af+JN/U2dT1J7LIsDv2ICtADOi/sc8Ut5RkvhbNKfAmkp+/CX8Wqlhar5vC2XK6DAen+Bwj0CTy3yTCsk7MYNvYD8izExelbiX4y+ipzo68mDxhsHQAMGpH/xFZ7MtpF76RKn3ojV7yP3tCqwHuvNlJAcM1swixeLzb/95Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051929; c=relaxed/simple;
	bh=eAxSrAJwG5h7LwW25fMYLtunkyB0kkjAUb1uncwxwh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbN3K/6V/dEFDnYakQffr4TRnnnu68l8d7nT9PohZhgOhr/Q3RDmh/ga3lmeQlKyDD+HtG9/WXTqBvByNRbwvMu3+8oe9WrJRsGpDAD/OZejGa0XCGGZlZa6itPzLlt8VZ78LrFWQ13+YRDOnN2fmzY3zhy1ddYBdPFAPMgBfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIWCxFl3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FF8C116D0
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766051929;
	bh=eAxSrAJwG5h7LwW25fMYLtunkyB0kkjAUb1uncwxwh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RIWCxFl3mO7JPW+Sv27VGAtyKxcI+wr1ybPWm56asIe57eOmieFPNW9aBH6X+J2B7
	 j24fjbjWtYTWp9u7kWsQQ/IXW26U2Uid3oBiWRqmn3SdbrbPw0lt2IIY56YOQ/FefA
	 lcl5S/jO+UPwvFpqtQxB4gBsGFy+CmM4ZhAYB6A7C1s4CsYRnA+XBiwnMIcacHht8K
	 6V6IvJ9Fn8VKriire/bcjVT3DiVDS8cFPkvDkqZjWgxr2CS6LYElJwPQV/zPKmXIst
	 FZTWKa6l/gJ1MTj0PAOLGszPEYYt+coizo5sHMvYjwSzazs6yPu7gUrruNDWCkZEq4
	 4ThUHuIFsc5bg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595825c8eb3so471624e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 01:58:49 -0800 (PST)
X-Gm-Message-State: AOJu0YyP87boeMFHKbt6cLBdr8jkPR/zkg1DWEOqi+aBt8rod3wxUyHX
	VQhSoiBmqgeTuJyoNB29z0Q4m54ACW2B7cQ3f+rYV3gEYE4COO6qQWeYJDDkUuqopcIXV0rvh33
	MQ7oalI5xQ8zYN2ntFN1k7y+NrhTOUwE37eIxnwM4bg==
X-Google-Smtp-Source: AGHT+IEwSJSOuszU3jAMANKAXXofRbZmZ0NRdL76dJdKKzS7Zj+tzReSjBw2b7RQb2ukOWw2s8m7qrUxMmHVY4uVPdo=
X-Received: by 2002:a05:6512:2203:b0:597:dd9b:d444 with SMTP id
 2adb3069b0e04-598faa31282mr6956957e87.19.1766051927767; Thu, 18 Dec 2025
 01:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-4-rosenp@gmail.com>
 <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
 <CAKxU2N_SM7EauHNpu+Ko5bHfFUkONMVGYNRfp6jAL_wjcJn9wA@mail.gmail.com>
 <CAMRc=Me7Ogsa9qXzwzdS_oWfVXaAYhK4E9onB5FfOO8LAU4pdw@mail.gmail.com> <CAKxU2N-vr=GjkkXLo_f2M9MAf2GEmKjK8J_pDwsY7jd26p-AYQ@mail.gmail.com>
In-Reply-To: <CAKxU2N-vr=GjkkXLo_f2M9MAf2GEmKjK8J_pDwsY7jd26p-AYQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 18 Dec 2025 10:58:35 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfeSASpCKa_ppsreJ_dUZuGgYZtfQNxTNXKWAS6ZreJ7Q@mail.gmail.com>
X-Gm-Features: AQt7F2q4ptwwlcAsL_ZEAQJSkc2KhsyOC2ABV1seCSuKbXPxNJv5GrJH1HCAINc
Message-ID: <CAMRc=MfeSASpCKa_ppsreJ_dUZuGgYZtfQNxTNXKWAS6ZreJ7Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 10:32=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Thu, Dec 18, 2025 at 12:31=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >
> > On Wed, Dec 17, 2025 at 9:26=E2=80=AFPM Rosen Penev <rosenp@gmail.com> =
wrote:
> > > >
> > > > Yeah, no, there's almost *never* a point in using OF-specific acces=
sors. NAK.
> > >
> > > Argument made to me on netdev before is it's pointless overhead for a=
n
> > > OF only driver.
> >
> > Would you mind posting a lore link? I'll gladly chime in.
> >
> > Drivers are OF-only until they aren't. Vide: lots of discussions
> > currently about supporting ARM laptops and servers with mixed DT-ACPI
> > setup.
> Hrm I must have misremembered or I can't find it. In any case, these
> devices will never support ACPI. They're all embedded devices with
> uboot.
> >

If I had a euro everytime someone was wrong saying "never"... :)

> > The overhead of going through the fwnode pointer is absolutely
> > negligible while using generic accessors allows taking secondary
> > fwnodes into account.
> >
> > Please don't tell me people are going around the kernel converting
> > drivers to using of_ routines?
> There's one special case I know of, of_get_mac_address vs
> device_get_mac_address. The former supports NVMEM. The latter does
> not.
> >

Yes, that is one of those special cases but a better fix would be to
make NVMEM core fwnode-agnostic. While nvmem remains OF-specific, we
can live with using of_get_mac_address().

Bart

