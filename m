Return-Path: <linux-gpio+bounces-16832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A4A49DD3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 16:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 481A23BE1EE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D4A26E17F;
	Fri, 28 Feb 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="quDq1Cp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7A25DAE6
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757408; cv=none; b=YiVvaoc9eDIzF+ZmRr3VbvS7zpBTkNzIijrDhiR9bbBAVZLxutA2cCyg7g08HOwDHpL9k5Yrrm5FErZ9xnagMPFtp/YRSKCW2gVWNG33oREyinq7WiOenqo/jpIeGsHR/LEC5si70jFherLzprnGBzmHNAYkwTxv9ouk4/UULfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757408; c=relaxed/simple;
	bh=xv6c4NXqxyAKN6zGbE26fx4JV1OI6COMvLEE285A9JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vlf0MeN/Z+CSSXvAQ2u52NYJ2GZuH/ln5zqQTE52LNwmyZfmgohpQUe9/HH0TVJiom+3jUTlET5p8wZiZrTHCj+Apjd2OtjTFz4wEbFWGAWmRhUKAX+xY5gfsjYps/YqvzRWGMmycWUWE8idJ14jSQoSnW3o338MTVzKgXMfOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=quDq1Cp6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54957f0c657so239339e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740757405; x=1741362205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv6c4NXqxyAKN6zGbE26fx4JV1OI6COMvLEE285A9JM=;
        b=quDq1Cp6AP6i0otMhfN0Dn+79cyP51lovFOMpKNjmdsp8M76HPNWmVmQQlD2aI7RzE
         jLf+lySv8bXEC2rfhscpNs2IJySZn3sLQ7xZIFSIed/Jvubg5tt8fcovV+HiUqbYxRPy
         WOkNUNhZh4+uch8izQSXVlpckfru+oz6SGThoKcJMKWTvqXoqlnml8MgsMCfZkc5rMoh
         A1sMdUo4laV21pqMyWAWCHMhqBKSndWOa5GBRdIzoMnVcWiDH8a9+4DjXF80I5JMSkCs
         /cbU6EPhidkqSjyOvqihsoRAufxsA0U6Eg4SbMrkHfR44gjnV0HTgmFw60C9R5T23qZ8
         b3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740757405; x=1741362205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv6c4NXqxyAKN6zGbE26fx4JV1OI6COMvLEE285A9JM=;
        b=nL0fESfF+ZZgIELjFQDsTpkwITW1NCDm8gJWJMlqM1SrXIxQXF89BmXXcDqsUjX3WJ
         nJrT7ySg7/K2zLci9omkxI39OdQoAs1wUU2mH0poxsaDWMECiMPIaguMHiJWXjIW1+ud
         1gx+5xn0z4k6Pu5xEiwD8j37wF/xDqThG2fR9LDhIbQrPhqxG/F4spHu0rsLT3xnjzt+
         mHOTwghcM1SafVZzdfwn8jc+iTFy0mHsjUR1Y/BMAP2vU/aEGMndFkgsmFZ+QA9Wa2ZM
         kiGs6dHDUOkK01LI/FdP8b9GjRKGuSxikWxmbTVgjo+W6nFVLCerFuHlP8mKK2IUt0Z0
         A/rQ==
X-Gm-Message-State: AOJu0Yx0/dPEX/+0WVQpf9G10PahQLQqAapmOuxRK6wcBnG3k47i+sW2
	5jPRmuTFJ3uiD299OzwSOFNSIZoj7uwMJ/LZdI97q0MurdfJ2pFMjnl4fFOo17NG3kCfLQVMBzB
	QEh328Msp3+6Pzvpbrj6rWBD6SlqDrROAWPvDfRaj7IdNiu8bbE0=
X-Gm-Gg: ASbGncubAgTIi8VNonxr04J2YFjogAym+LvdiyqyxWCdSkkkbO5vr26vuow26iXaGbc
	dPODZT9Asjf17+gUPwE3MR9CrrXF/pm2yiZUSkPMUDe9pxjEAvdTVKZj0C1YtKoLf69EWLcJMSV
	L95Cwb493dgUAaBitC94wB87VeWyWx3VhVhpkJeeY=
X-Google-Smtp-Source: AGHT+IHUxgnFb1PqqvSn4NoMY04CA/QPQIpUs05a01qxvsyVOXUVRibI0Q1jEd5DkMvu7r3XRx3/IyWHb0rvgN60QwY=
X-Received: by 2002:a05:6512:308c:b0:545:4f00:f92a with SMTP id
 2adb3069b0e04-5494332104amr3254779e87.20.1740757405023; Fri, 28 Feb 2025
 07:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
 <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com> <661c2ee0-013b-4ee1-8c53-51729a172cce@cyberdanube.com>
In-Reply-To: <661c2ee0-013b-4ee1-8c53-51729a172cce@cyberdanube.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2025 16:43:14 +0100
X-Gm-Features: AQ5f1JpsBsPlu4wG6QxOzzosKXYcT1-U9doEokHofEyfVBxhaiPvAJaRyGT4tvA
Message-ID: <CAMRc=Mcx4=9u9n2CoX=ErxjEidEHH-+ALz976ir1P0NMnzAQvA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: added configfs option for static base
To: Sebastian Dietz <s.dietz@cyberdanube.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 2:54=E2=80=AFPM Sebastian Dietz <s.dietz@cyberdanub=
e.com> wrote:
>
> On 28.02.25 14:22, Bartosz Golaszewski wrote:
> > On Fri, Feb 28, 2025 at 1:46=E2=80=AFPM Sebastian Dietz <s.dietz@cyberd=
anube.com> wrote:
> >>
> >> To replicate gpio mappings of systems it is sometimes needed to have
> >> the base at static values.
> >>
> >
> > Can you give me more info on why you'd need that? Static base is
> > largely a legacy and deprecated feature, there's ongoing effort to
> > remove it from the kernel.
> >
> >> base is treated as unsigned as there doesn't happen to be a
> >> fwnode_property_read_s32().
> >>
> >
> > Ha! That's interesting, I wonder why that is. We do have signed
> > variants for OF-specific properties.
> >
> > Bart
>
> We are building digital twins for embedded devices for security research.=
 The
> firmware of these devices often export static gpio pins which we simulate
> using gpio-sim. With this patch we are able to satisfy these conditions.
>
> While the feature may be deprecated, i would argue that it makes sense an=
d
> fits the nature of a simulator to be able to configure it manually.
>
> BR,
> Sebastian

What kind of digital twins? Using qemu? In any case - I really dislike
the idea of extending the configfs interface of gpio-sim with an
attribute to support an option that we're actively trying to remove
from GPIO core. Unless you can give me a really convincing argument, I
will allow myself to use my maintainers' right to NAK this one.

Bart

