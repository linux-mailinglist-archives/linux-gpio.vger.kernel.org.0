Return-Path: <linux-gpio+bounces-4058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCA86EFB5
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 10:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8BF1B23844
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDB612B83;
	Sat,  2 Mar 2024 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HypS2qBO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E479F0
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709370004; cv=none; b=a4eFvYH9hTYNx6XnJTz/Vpvb3fQWv4H6hl/FKgFYJI/lOM8Ky2IaHhEaQJkDgSS9gLRUb/qQxCiqSqkBwcaZG2/nOJT7SqwJ5LAMh3f5ex6YcWBAH1S6eHqZj+K0dgV5+frJvt1bKnHIcM15LnE2062osj9yvOQcS3jVZHtpUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709370004; c=relaxed/simple;
	bh=eCQzoCFbOFPzXODq2rUOGKdBd463E6JRcHrunmqfO4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8ananriPDWlooXX5Yno5grHSnDHdCYuHHecLiAqjtkfdGXjAwD6Z874852GkaddB08mbfK0+mIW3DMp3+MdVMN66dOEA9fa5kDnfu1JnnoDGn31JFWaiS97RwBEzeZDzvFtYTnDlAHCZIXtU58WYKiBvPB/WuldWQlHIfreUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HypS2qBO; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7da728b0597so1218506241.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 Mar 2024 01:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709370001; x=1709974801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCQzoCFbOFPzXODq2rUOGKdBd463E6JRcHrunmqfO4A=;
        b=HypS2qBO7mdDDipmFt5k2cJmciuoo0hTjTSE2Lsvem+lZcjwWRwu3DxOAjvYCmjije
         CbKFLV9ZW+qKDwmPV5X0TnHsieS6wJdF68VNwhMgur26xkCado2NTijI1phm9pd3CbVH
         fVHfz/0WSbbadsvdcAvWyRBZdZf4n/nNA7AfxNRpmeIWeDlQ0NmoGlHC1SR2n3fXdZdW
         O3XbvERVOFdTYvvAhExN46Dpw0YbdK0eTW66y3BLon9WPIrXpz+fcIPh9I1yEQFNT9fQ
         dxrZ+6PYav4432iQD4uFLAVgSN3qudP+52oKFsjWPs1/nmxKe+q4qOSUNdOfihLhc4gG
         aO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709370001; x=1709974801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCQzoCFbOFPzXODq2rUOGKdBd463E6JRcHrunmqfO4A=;
        b=JApd4KWAFuTVdrtF6nR+z9xqk7PhlHUIT9DZvxugEKGM/v86MWuTA/iaPsGU8CbDxW
         NdsGDPseVZiVX83XIwCY1VUgo9/6BRjPVhjk4rHZYRKd+EzgZ0CAzLp/sFRco4O8VEQb
         hCz8tU8ddDytf1489ghsEb/i25stnBWELvcjlgFRGgGkzDwLZjFuVtjLlGDiVKj/u0gG
         LPkpHoIyfG46gITKoEZzgDkLsp6ex+0dHhHBY8Qvq9GK3YARfITLzE+DeDQSr1OYDu3j
         Y5hMLRH0KHr+sbI9xdiFnpFTl/9SebnjiYJh/QquuOn4C8fgW5ldIcJUiOfASQp4Dq6H
         L6iw==
X-Forwarded-Encrypted: i=1; AJvYcCUxY0dnZv+DAXPYyz5amrOT+oPR070H74cjoLaA+eChKwI0qc+9yFDCwAWFZiRwNW+kZEHG0xpOUWB3HvW6NJr1qkjf3bzP0APd/w==
X-Gm-Message-State: AOJu0Yz2FEMla0HeF7XSnbQhBjRM+QjWlcTdYsjAajRZSGip6JiwJYTX
	xdKiJB/lz0x4Xfm18qyPNJxQVJ2OZWQ9tnvce/X9kpK6zO+nl/Z4Fsmy4cl/KQUcQRfza9ZOV4M
	0NQ5gUgs4lYPOffIeVf1eO2PKkE0PSXqqBGKidQ==
X-Google-Smtp-Source: AGHT+IGTFC6f7wUdK+L9p4HEQkbr21KxcwtfSbwfdHJXskErtbV5zw1A2Mcf/B5CrvjSLLpmMODnMnLjoM/0CR/ddF4=
X-Received: by 2002:ac5:cccd:0:b0:4c0:24e6:f49d with SMTP id
 j13-20020ac5cccd000000b004c024e6f49dmr3136575vkn.1.1709370001367; Sat, 02 Mar
 2024 01:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113426.253232-1-herve.codina@bootlin.com>
 <CAMRc=MeSMTnPUYGyJir4fc=6=Gnw_MVP9wfEKMQ6Ck33FYCrRA@mail.gmail.com>
 <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com>
 <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com> <CACRpkdYWDzu+VMQOYO_Sh1NM2ei=VRC-0df4teAZjirfrTB67A@mail.gmail.com>
In-Reply-To: <CACRpkdYWDzu+VMQOYO_Sh1NM2ei=VRC-0df4teAZjirfrTB67A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 2 Mar 2024 09:59:50 +0100
Message-ID: <CAMRc=MdLmU3uezKSg2d83HSZ3wYXFx68oGshx_yJyvJToN261Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Kent Gibson <warthog618@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 9:15=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Fri, Mar 1, 2024 at 8:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > Agreed and the big picture - just like with the reason behind the SRCU
> > rework - is the fact that even static GPIO chips defined in ACPI or DT
> > can be unbound. Unless you want to make the decision that we
> > arbitrarily suppress_bind_attrs for all GPIO chips which I don't think
> > you do.
> >
> > I have shown in the discussion under the previous iteration that a
> > static GPIO chip defined in DT that is also marked as an
> > interrupt-controller may have interrupts requested directly from its
> > irq domain bypassing the .to_irq() callback. As long as this GPIO chip
> > may be unbound (and we do not restrict this) it means the splat
> > mentioned here can be triggered from user-space with a simple rmmod
> > because a requested irq does not increase the module reference count
> > nor do device links seem to work for interrupts not associated with a
> > struct device explicitly.
> >
> > I DO want to fix it, don't get me wrong. I don't want to just leave it
> > like this, especially since we've made so much progress with
> > hotpluggability recently. I just don't believe this is the right fix,
> > I will try to come up with a solution that addresses the issue
> > globally.
>
> OK I trust you to come up with something better for sure!
>
> With regards to the ability to unbind/rebind drivers from sysfs, true.
> I have heard about that as a counterargument to many things.
>
> The problem is that I have never heard about a user unbinding/binding
> a driver from sysfs for anything but debugging a drivers ability to
> bind/unbind. Partly I feel that thing should just be moved
> to debugfs given the usecase and because it just looks like a way for
> attackers to provoke crashes given how some drivers look.
>
> Yours,
> Linus Walleij

That's not the only thing - device unbind can also be triggered by
removing the module providing the driver which is a completely normal
operation for user-space.

Bart

