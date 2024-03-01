Return-Path: <linux-gpio+bounces-4016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847A86DC38
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698031C23202
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 07:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92ECF6995C;
	Fri,  1 Mar 2024 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U64tQMdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36F69D04
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 07:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709278883; cv=none; b=TvuNoYY6vlFetXMHcjBBry8x+sHgYmHWfftQpUdyUWBjnPP2VQE2uYXpFad49nXHHDOsHvAeOYL1pnLgYOf3id5CBpwyev0ZKnrd4b2PISN/5SsqHdRQPdtRduTE/hD7IMuRC64z1qSbmQZl+BlbOZnwG75fIddtu3rCr6Lumn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709278883; c=relaxed/simple;
	bh=dpv2hcr4FeICXO7eqPY5guzF9/CmL31fkwp66EImYJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQo8blu+BiJgCk51E8FRdXQPdajsOrWYQ03r67gqcWPzOgxg6bvF0XXKHdR+Up5TDV9UwiOEjfh5KLwT/OHYAKfCpkt+6Yj9Lq2+U00bK9njW6NFfffTuhkOGiponZ3Sewo8EOHy+3L9+utC1ymh7TmYrrQrGeke8ntWUNBqQTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U64tQMdd; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-47282752fc7so511492137.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 23:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709278881; x=1709883681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpv2hcr4FeICXO7eqPY5guzF9/CmL31fkwp66EImYJ8=;
        b=U64tQMddQFzOalpSHh+dOmZH6pMuj4aYbK7J+bLYAfIBrQyiI8SN2CnMToqgJgwNdb
         UkdjHt77HryzYxvv+TKN4dbZNY9Ff0MnmU0/2b2iS0nu/5hDNI9irvUL/MPrfRqS1LdK
         1hSD5JcduSbDfuwChejK7ViAkxY9qSUTehNKUbVB2L1DxcaBdmXcDcVX8yxJPSZ+6pZP
         ZKwHAaT7YopJGoznDTmj2u4ga0/lGkJQOVaFh9TlnMKRDdd3DVvz1yDmi+lsATAXsWc9
         Ji7+CR+6Q4WB+x6Fhjcjzg4Ev8PginUThyfQ223hNZrEf6fbWU92BMcdgbHQQb+qXwru
         xtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709278881; x=1709883681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpv2hcr4FeICXO7eqPY5guzF9/CmL31fkwp66EImYJ8=;
        b=RK4DTK0YVitkAL3Qvzds8QEkvGFy0NhUmYt0eWyrD/4gnmGbU3zZjKnKwOrSL6nV82
         ljyfqWV+eZ5BMNJz3AX+EFsnTXw10v0ic2zAymTGFtshV9kGqcO9xUywZFK989p8g2J2
         63nsYyX6a1bcyuM5l8hzpgZ5k8v+gf+gbs2w+CKowRKhRs3KPPoI5Z9N7n/IFPLcR3Ks
         9PUkCF9XPs6ULXStspOhlip3iSfVjGavgufl75HeN5aewlNDjtsmzjFJUxlVAsowPiPn
         0SVDG0c7RSGJ3kGzI877Yid0/6nBFIBOqpcorQyfIyfxIWL4jjX+2K4Y7CpNaAcGGnLt
         da4g==
X-Forwarded-Encrypted: i=1; AJvYcCW70TrR5/Tmdgvjl5grJxTtuGJN18OFuxcFFvtHk4wxM6BDK4nB/7m8//iu8C/0ZL4CW5Gvya9IF7eqimSjU4SC5dSYlE+Kfj6Qbw==
X-Gm-Message-State: AOJu0YxUsKKFwOj0TWPlzs/6rSSqwKsK8IQV0a1a9BC9KNAeL5gB2cQ9
	Dfjs7s5ec1lFxui4EOsJLZtLPOm5/ijyX+39nThoUyXzQYBziIQi4e03XGFIGXFMUpLBMaBk4Iu
	tfER8md2kCVTx+rzV7jA9YBkCJN7/aRv3jRYrU9q1lUK12sjZ4dMNwQ==
X-Google-Smtp-Source: AGHT+IFUbwEXS2uhZL031xGACrfpf2lSfi0yYT5H2z9NdnVwbv8aNUKb2mXVg1/R0HuCAHebCZoWxEcCp9FSoCNM3pQ=
X-Received: by 2002:a05:6102:2758:b0:472:5572:fe32 with SMTP id
 p24-20020a056102275800b004725572fe32mr684624vsu.13.1709278880835; Thu, 29 Feb
 2024 23:41:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221192846.4156888-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdvYdx6x=gSiOZ3SXAdJORnqhsNW79G2c7wABofWARwFw@mail.gmail.com>
 <ZddLRAqxFr7v3Zqs@smile.fi.intel.com> <CAMRc=Mdxtx-wh3HGu+SNrCwfSq0PEm3fG7hK_6wPAk2uzk8xpA@mail.gmail.com>
 <ZddOKTP73ja6ejTc@smile.fi.intel.com> <CAMRc=Mf_w_E4B7c_Uj1WV3zv9DbmJ22oFvJJwtd-+3oUDVcvXA@mail.gmail.com>
 <ZeCw3pzHdrXw46of@smile.fi.intel.com> <CAMRc=MdKFvAefKxLnovxnQt_tpiW+dCviWXKuHqg3vqHhEtPNA@mail.gmail.com>
 <ZeDLLfQOrPLUzyGt@smile.fi.intel.com>
In-Reply-To: <ZeDLLfQOrPLUzyGt@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 08:41:09 +0100
Message-ID: <CAMRc=McxWc-78q6FW61doDua60ZvCOfSXK7v7wmAm0rX7wDDgA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Fix the error path order in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 7:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 29, 2024 at 06:26:29PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 29, 2024 at 5:29=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > > I'm sorry I really need more (morning) coffee, maybe you can simp=
ly update
> > > > > yourself or submit a correct fix?
> > > >
> > > > Ok, I'll apply this and send a fix on top of it.
> > >
> > > I don't see any progress with this. Do I need to do something?
> >
> > No, it just fell through the cracks. I applied this now and sent my
> > own fix on top.
>
> Thank you!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hey!

I now realized that this commit doesn't really fix ba5c5effe02c
("gpio: initialize descriptor SRCU structure before adding OF-based
chips"). It addresses an issue introduced as long ago as commit
2f4133bb5f14 ("gpiolib: No need to call gpiochip_remove_pin_ranges()
twice").

I will change the Fixes tag, queue it for fixes and send it to
Torvalds for rc7, then merge them back into for-next.

Bart

