Return-Path: <linux-gpio+bounces-15430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8AA2A4BE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0EE188A5B3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2426822577D;
	Thu,  6 Feb 2025 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTomzqFd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3206225760
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834609; cv=none; b=J/itQyaeLiuR3jHSyJp0qhpQRXAZ571kI6im074VuXivXNctTn3E+l4vj9cejKfbp/1GvB+y9OteAJFxrRDGTcBQkHqarZZ6BKHBZ29NRmeH8aUOuWVPfmf8X2S9CLy4AFgE8xA2gJFg2VzOyJ7wv0fgdwqY2l1s2WccpmXmt3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834609; c=relaxed/simple;
	bh=Kh16Wp8fAy3I7OTirw74yhvKe46+5odebHIHXPF1qa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLzYRB46TFZ2yUcyUQdz7USjuK8kczaaeVgeQv80ASkiA3fki6lv2ajY1CflTjy0b2z4lU5wFjshgGG5v3dh2YVbzpZsGb+BpCgsOGLY7vykXBFw3MhmoL0lZB8nq3AcCUNOmOzTXbkTCPwOoDLRAYT0R5/4UOK2beGMxLP9W/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTomzqFd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so786010e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834606; x=1739439406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2fOiT1hShmWAzem6QrK7ODBNtOVKho77Ypt9RNsYGk=;
        b=zTomzqFdGu2L36wsIEuPXt0D0GZmDhMLR8oujNZE8oWv8X4ONVT3BKbMFgP25PBScV
         1mTlkpWekCu/5g3B78kFKlyPBkZQXr5KFUNmG/zWRC/99I29ibQGITo8jRka0fSDAx8+
         MxMgpSy1ZMmlkqlpxWns4ZjxM1BN5ZbZLI7OqhsETo4R0KIZEn2n4Y0VmUOdPe68Fx7G
         uPEp3NN/ljGwDuHcVO230c7xvyTc+DubmhSpLGx5Erjpvro4I5avakzm0CT0FPH6yLnN
         8aqDaMCZt06P36ejgU3tsvUEJD/w70uynkiujmd/ywNf/saUqYskDmfYzy7QZFbQHNqG
         YdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834606; x=1739439406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2fOiT1hShmWAzem6QrK7ODBNtOVKho77Ypt9RNsYGk=;
        b=TQpqhsFi+Jd8lLaLIO29Tip/NUerS+FVSh8gx02eKZGR/ZjR2+55dvUm7oWBWx11Ns
         na8Gp0KuI3+Ml848txqf30j4DuTQdvQBzvgUyVQ2lSz4B1RxtmrH2GA3QXI0oagKIfJU
         xhd/ol94FKH1oeJPngP+tW4nmx4ou4CVb/zn3+XS0pZB/iihYg7l2iVlzqXJ8Z87ZW1A
         6ZWYMR4B9IYgISvDgt8wTe/wpJXn0iEHfIXMpKxszAeMxOL02Nlhjsnk5P24yxEDQb56
         c8EbFICbDBqXaIGgZbpfOGAcisqgAojX/N4g+k9wiQwB0uYK5eHJdYdXJGwZnxL0/obW
         DNUA==
X-Forwarded-Encrypted: i=1; AJvYcCVLUc0WDRjGoShlrbQMKYBndJZrPYEXRywRJ8FYh3i/EtNrccDOruOWpKMkE5eReoSvXIVZCCUXXhzL@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqX0wAIEuaN7EblasakkHNKQLppMtKHD7tfv2Gryu/R7CqKUl
	j7NSF2ijZufi4BWQ7lYltix35POApt72ZyPaUdII4IBdGLkDQEbBfv/NhEV4Xc4f4yE2CilA6II
	HIx7Lw/owlJ2syiG6SgqZW1pONZGlovWV76m9Wg==
X-Gm-Gg: ASbGncvReU0dOXzMW9ZJgXt1QCAA/XHSVaduIhNfa8NoTMeFEJ9YWE7kQZh7MhR0oRb
	uJQryC0fAUbE8sOru0ckdoNjBi2FJtwdVxgscV3ON2i/5Gq2URfNnGpfSnpeHVxVKtLY4fK8=
X-Google-Smtp-Source: AGHT+IGTk7OHZHlA5Lj/y+SkMVlyAK1YiPP71DuZPiW3j2C24cxgmg+ZfIh/5nUIZiV+mmjJFD2qxBxmd7B/Wz3cmmk=
X-Received: by 2002:ac2:4f01:0:b0:542:6f59:f86d with SMTP id
 2adb3069b0e04-54405a24b55mr2378669e87.24.1738834605896; Thu, 06 Feb 2025
 01:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com> <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
In-Reply-To: <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:36:31 +0100
X-Gm-Features: AWEUYZnuvQ5xC93XkWdpkWPDAjjF9Gk591-Ngc1pgTXmw3cRSAbzEVROjCVfbTA
Message-ID: <CACRpkdY6PbUjEsQFTPjo=YrjyZ6L3gciAmSA16PFKdSVFVrR7w@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
	Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:34=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Thu, Jan 30, 2025 at 6:10=E2=80=AFPM Artur Weber <aweber.kernel@gmail.=
com> wrote:
>
> > Fixes two issues that were preventing GPIO from working correctly:
> >
> > - Lock/unlock functions tried to write the wrong bit to the unlock
> >   registers for GPIOs with numbers larger than 32
> >
> > - GPIOs only initialized as IRQs did not unlock the configuration
> >   registers, causing IRQ-related configuration (e.g. setting the IRQ
> >   type) to fail.
> >
> > Also includes a minor fix to add a missing newline to an error message.
> >
> > Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
> > (DTS not yet in mainline).
> >
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Looks good to me, do you want to resend the patches picking up the
> Acks or do you want me to apply as-is?

Actually it's Bartosz applying, heh confused this for pinctrl.

But most comments go anyway I think.

Yours,
Linus Walleij

