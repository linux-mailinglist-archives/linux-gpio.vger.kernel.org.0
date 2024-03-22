Return-Path: <linux-gpio+bounces-4519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2D88679A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 08:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CAE1282E06
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 07:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BB412E6F;
	Fri, 22 Mar 2024 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wh08Xc6P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FE12E4E
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711093624; cv=none; b=gDwqE8CatjfqBqXI0dgZz+akQpl9Zi+R8pZ/GfUCDmzkCtS5yUal/2fceXGyrypPCr2690pE3cPwU+PJR6HpiZoGNCCt+ttuvxozyDfXHmo52zsCbh3HIyr2CXqV2GgtNqTCk/qbWJDxVuMMtv3ZDuG/YJHSoTGnV2dfXtLiFXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711093624; c=relaxed/simple;
	bh=Yhw03HSz0idnna+yR34xpIkCEZSpOgZ5Sf0IEYITasY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erQ43gHqADQFYtKj0c+QxL7ab2ESF0LPU27V2MtqSh7h4x1UdgBGTsv1bXanajCj7GlY25cUqB4SNjm0dfo5rNOsdEF1tXpxuVkTOa1J6RQoZiBgLTkjk43WQZ+cNp+yoY5zhcDahf2TUXAuapbM1JqIFuUM91fGwhGVa0RmTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wh08Xc6P; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51588f70d2dso2052645e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711093621; x=1711698421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPAa0wf/zbSEHcUANifsWrUgwG+6IErJ7w4tI2+ET3Q=;
        b=wh08Xc6PxaYRBwEUxMN6mhstqUU0qvYsZweCwbjK/MPBu7dlh+sDFexD82/7CXWarZ
         h/Kssvh0q2LaVpyjoYvToROOgB+INHmE0buwXzTq2ik+UmzTwaB/ixirseNFvMuLvvv2
         uJxc9XNVu5N8x+Z0KxGeyBLGvwAcqEQM8sLrRhyDtt0PRVam2LVNhTTyt2f/Yrcpjq88
         NKjswr/46Z/PojMJRVf+x/fa1VanyWfQmArTuvBjeFqzmbS3K1qI13LdyQmquV67TRdS
         pnTj9lrXwTv1bBXId4ZGHAsL88IH/F9pLdZq7+GZHguWtbKvc8Pq4Td/+eT+1QCFCSL9
         fywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711093621; x=1711698421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPAa0wf/zbSEHcUANifsWrUgwG+6IErJ7w4tI2+ET3Q=;
        b=nIlpPwFHtNq7d3Vf/3XNTGICIey93tX1hAjW3QNFtr9TznLVb0xEkOjz3HDZfLwVLm
         OZz3hLT70wkMaqNa01bidBzDYqPfu72qGJ8Yi6/h4Hnabo5zY7EkW38FRMeLon1Plqc2
         pKw7SMtAIGYTkOy+0R3bEPLX0JEJ3LHaM3FmuhTlcPUKIqQBsJoAIH2HJKEBK7g4qJf9
         HlsaViugB0Z9pJcbweoLX6N4JUi/gcBxPIbCkMGeBGSjrfebSFxacb9JQgnuEN55cVI9
         IrOgZigMmdWaY6v3gHVEufq4alqUGmb7CljNtouPlpPPQcSFyl48xd59GYEESuxqCHsQ
         6tfg==
X-Forwarded-Encrypted: i=1; AJvYcCUR5ltPbx7vBqNY8xbngDb3hq8mQzjJO381uAKDex37bOB/SRFe5sWY/0m/l6Iq7giwkMvdv01tu4VgqUqyMRcus6z+kZHiSJJeBA==
X-Gm-Message-State: AOJu0Yx9AsnUAzRzU0gZA2rVfKU84bP3YaQwxMJ1hOK+mchWgfDQtKl0
	YQxEtUdtTUstMjY5yPq2PSS99cU1xl82GGWENljtfZonM4a3oBJNUNTVfJY1LaXpIfCYkxbMRK9
	KFSYM1p/4+u1Vm7KgOQpuTjqu4M5oATGP3IAqUA==
X-Google-Smtp-Source: AGHT+IGMlPmh6WdmqSWErCqF67TPp8BSJ8Ax+s3wvqQfGc+YdlHQhOmUL3UDDQEgmrblKQ0L8twrhkOtXf4xDSab2lM=
X-Received: by 2002:a05:6512:747:b0:513:d8e3:fe3d with SMTP id
 c7-20020a056512074700b00513d8e3fe3dmr939101lfs.26.1711093621110; Fri, 22 Mar
 2024 00:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320125945.16985-1-brgl@bgdev.pl> <20240322013034.GA4572@rigel>
In-Reply-To: <20240322013034.GA4572@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Mar 2024 08:46:50 +0100
Message-ID: <CAMRc=MfQnZQU_t9-uDPp18vFikz_9eP6LtnWJYG0+KFgWjBcEg@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: sanitize the label before requesting the interrupt
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:30=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Mar 20, 2024 at 01:59:44PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Let's replace all "/" with "-".
> >
>
> I actually prefer the ":" you originally suggested, as it more clearly
> indicates a tier separation, whereas a hyphen is commonly used for
> multi-word names. And as the hyphen is more commonly used the sanitized
> name is more likely to conflict.
>

Sounds good, will do.
> >
> > +     label =3D make_irq_label(le->label);
> > +     if (!label)
> > +             goto out_free_le;
> > +
>
> Need to set ret =3D -ENOMEM before the goto, else you will return 0.
>

Eek, right, thanks.

Bart

