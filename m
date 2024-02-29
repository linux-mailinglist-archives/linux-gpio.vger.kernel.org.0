Return-Path: <linux-gpio+bounces-3991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCB86D08E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 18:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9054A28947F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 17:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1892F70ADD;
	Thu, 29 Feb 2024 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DmWhosOz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7962F4AECD
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227607; cv=none; b=S5OIxtGsynvewWoF7pRi+lEeEDwnh+xPhDh2AnGQUPsiKPovFh0EpXakRNxsWASG/AmHgE1z2MDrCf8/CQY4ZFU4pfCziWySHXrmJyVss7FqwAHIctsqZDxIOFKMMCJcu11uxXuzT/x/mapUuShqLNzjFwCab8GpS+bND/HORD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227607; c=relaxed/simple;
	bh=SyjKEYVew5m9zUU9ZMwdROqu52vc9bJrfOA47hQzAww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOQV4sEhtuTobgzdHpcpLGOcOUs1aCF71Cxgv5LVffPbbnD+QW2ACESnVIqdvazyIExlT4XNA8mWuEnBqpwRuA1AXW75ztHrLUvHV5L/tIF19eczgbDPV/7SZiBV6cx9y7OeoZteHKXT4N7uhRhGQ72qDD/QTN5BatXuSNP+BRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DmWhosOz; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d698a8d93cso640839241.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709227605; x=1709832405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyjKEYVew5m9zUU9ZMwdROqu52vc9bJrfOA47hQzAww=;
        b=DmWhosOzLkgn3AayJblEcDRcHLh32ma01KREGsUtuQGbVOzFMGmpQi4pad95yp5d/g
         f0cg0lF6Ld6K3ko7/CD/lwnuXeFtV2cxky5z0O6+VG5t29IktOlBLFxxiOtfqVGQzdhv
         VF1vbdIYVY/V/ehqMDYiS03YWBthdLzcsB0zMPcmqlPS2GzwHYJ/8kDa+kaywCVEaFfy
         gcMTs7NZ1PEmBxwf+GIqE8/CaJruV1mf5dgXVmCoI8x3MvOgQeq2oHXKvrmDeKnVX91u
         AUJV8L058WuEcTs03FIu0NoxNkeOZsup+xZ8u3Ji3720lUeNbLGm8E0h25GxVgUKwTqi
         nyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709227605; x=1709832405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyjKEYVew5m9zUU9ZMwdROqu52vc9bJrfOA47hQzAww=;
        b=j3zdV+3hs+XMREv6BqlcC7mxWbzNH0C729N1S3yalQVvt1m/05/Oxpavk9znUb4YMN
         cNblw9OOUCatywczRCajucOXhQ9xwc2ouipUPHID4Xj98jDa4XPCpspWEWZYnX0giS/x
         7rR6CGKuvuk96Qf3eODay1fp3e5Pl+fqpbIqhjOv9TiJYlmmMaWhGZRESSdAgIvAxKl1
         Rjjq93pD9IHC9XthGgMRTkLmgZXYasfmQBwtE1/jrYOeTeEAM72u1LPyshHg7Yxgk87a
         jLdmz5JwnxjctiWWqPTIwkDaTQb4ftYQfRTCtHmE40JyjDzZYNOhC1/VvsQYGQnkTYfR
         PQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMAshmMfq1w0w2hJy56IKQ1LO4d6DbSQ+TqMcoqB92w9W09ItodjcOzXFIgHKQTwJv1CZ+9PUULJzvvtVPdcakx9aGoJ2ARSTvxQ==
X-Gm-Message-State: AOJu0YxSkypG1UTISpDx5JOMm/why4+Fn0dCmA4pZTufn2vZuAdiOdaP
	fN/FTvPV8rjNr+3Gth4SmkqivvpHuR3Wb1a8S3ZwolWtFOKfsM2zesCxny2JRQ8Dzh+PKg9TasB
	52L28egZzuzvCeqMG9C6smDZfbXxaOJFRdo+btQ==
X-Google-Smtp-Source: AGHT+IENN9hkUa/eueNHGpnumeQR0qC+f2AJiya9lAHk3TbgLuACYT7KNIIao33kBn6o5QD5xMiLvm3jT6mR6rwCkz0=
X-Received: by 2002:a1f:e082:0:b0:4d3:3a0f:77ce with SMTP id
 x124-20020a1fe082000000b004d33a0f77cemr2902281vkg.13.1709227600036; Thu, 29
 Feb 2024 09:26:40 -0800 (PST)
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
 <ZeCw3pzHdrXw46of@smile.fi.intel.com>
In-Reply-To: <ZeCw3pzHdrXw46of@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Feb 2024 18:26:29 +0100
Message-ID: <CAMRc=MdKFvAefKxLnovxnQt_tpiW+dCviWXKuHqg3vqHhEtPNA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Fix the error path order in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 5:29=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> > >
> > > I'm sorry I really need more (morning) coffee, maybe you can simply u=
pdate
> > > yourself or submit a correct fix?
> >
> > Ok, I'll apply this and send a fix on top of it.
>
> I don't see any progress with this. Do I need to do something?

No, it just fell through the cracks. I applied this now and sent my
own fix on top.

Bart

