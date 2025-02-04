Return-Path: <linux-gpio+bounces-15312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C49A26D50
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 09:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7D71656F5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 08:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE67206F0A;
	Tue,  4 Feb 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ClxyOTEA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82592066F8
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657794; cv=none; b=DWb1jEluSaNRCa9c9FnzKk7Rf72Oy4exNwuQM/CeDPWl1Pb7LFpYxK5ROXAtl8qzdiBwVG6LsRnh+Cdcth+v3PlDSKwGgXI4XhIo5dMq9/RAMHTLroPSifm3Q550i0IidF+wwQBpHYMMyZGmVUkEdMTX23+FhyWKOUMtNFqwcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657794; c=relaxed/simple;
	bh=SrYYDcRux1gJAs+zi1JO5UyMdkz0HopHS9UAvdrFhHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dd2bengsP6EIhi657xYFUzensOJd8NLRcKoI7D5iE0wPPe8PksoARWfiXfDdre/4zKSXxRtnBiL1+rtBEZ/7rR7Bu6SiV2tk6WZJIYXgRyVV3kVA44WIevkjy45xMVaBYWTo7tFD7cTxWgTpoGljSpfIm0fPKO/qGDSGvSgKEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ClxyOTEA; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30616d71bb0so54686621fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 00:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738657790; x=1739262590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcbHR085NePjy2rjGYvw7GA3bSDv9/4Sb9icLW5Kbts=;
        b=ClxyOTEAFNOZ6lGaEb2qPpcD7KVu4/q7d4mczeVL6RVfnUV+FGKUzjWJnK6VQOsU+/
         n3Ig8qxbOG43qM4xVy6mm8i3M6w+xPtRtVZc6MxmLUDJ5RgPa5DR2kkC96xeCQVQ/zng
         zbGNd7zFpxCDhKWuswaMlRdvv50aqgfjExRQw+V1VK5raWPxA/mtVyw4GDfjfh/KN/Le
         CMkr0QYtKZ6UOK9Ti4Z0hIITg3jTPnxHmBzj6/E7LbnJ/JGBida9ch4SdnhQ83aVWq5u
         kyiiJwAW6vV0Bf/tXXEmMU44plEduj4mA80eDFqTVf4ruHvWHhfZGOKx3lHg8Eo11epe
         9/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738657790; x=1739262590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcbHR085NePjy2rjGYvw7GA3bSDv9/4Sb9icLW5Kbts=;
        b=tCLXy5+HyhEs5h0duufn9CmhxQ2n/RZG7a9V3usxcffGN7o6sxvlTGUdBPKafvOXB3
         t2MZ+jH32HQ/phkFMRSLusHgEysmDTb9tzI/X5dowlbUQ6vjFuiZg1HjzUu+z9FWPaKE
         5259YzlUfs8hUS4bAOLMRGEdvf2F5DShfr11awWhsUXwHbrAqtem+pmNh5kct2Ik6aa4
         4tmVEUKUnVY531eDUCsoDu2i1b1AaXgMbLQUs/F6Yze2jFuDh/b0cwWJA0JsBIJNcP0x
         dacT8HeSV86btr4TELQIpjVSkWna8JlSrtEj0AhSAphgdR0a0cPt2xta82/S0yGHBIb2
         q8yg==
X-Forwarded-Encrypted: i=1; AJvYcCVc/pxEBUTmVZbED4sPqOTZSq6gyB+DWZkoBg6pqIG+ElcnqMOFQ6I2mo7keX7MmqGqTbMuU8GNc4ya@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ILxQXD+tRqj57zxGWV2PwrMohxSQigCCKRBmLD7R8ZeDJ66X
	4Wqo/NKyUvIGbhO1qShGr5deh0b4BUUsTx1jWqhk/cxExCmim+QGonQuWxHunZDKuybLcL89IWW
	mk54cxY5R/z7YC3MaxKfmWKQn4AmgQWBpD10UQw==
X-Gm-Gg: ASbGncsa6j2KmkBCZx1vmJsvuZTjcv1XrvjTJRkeBCVZOIIfNUISZ3hSBDlB9nzppkI
	zuBRFp+ROJmfp4NKtkOaPYbtWnZ0yOwY1ME+rBOYuGmNAlpQV9bmaLsOQt9i+QJS+0/PfY4G4PN
	+CcCH9OCFD4LqoF7fWvvFWbGlmk/63
X-Google-Smtp-Source: AGHT+IEY04286WjvmptLiaYxO4Iz/Lvx0PgDOwwDVbWym43Zc2HIGZM/kcZskSna/8pVxivSnsUfRYVVOyi6j4nzThI=
X-Received: by 2002:a05:651c:150a:b0:2ff:c67f:5197 with SMTP id
 38308e7fff4ca-3079684952cmr80813201fa.13.1738657789568; Tue, 04 Feb 2025
 00:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
 <20250203-fix-gpiosim-in-bindings-v1-3-d2c9e0f3a29d@linaro.org> <20250204041802.e7xq3f7i7tkgfsyh@vireshk-i7>
In-Reply-To: <20250204041802.e7xq3f7i7tkgfsyh@vireshk-i7>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 09:29:38 +0100
X-Gm-Features: AWEUYZkDNMdl-9Q4qbp_T8VcaQmz2kq9h-kHQ3F8ebnU2UdTIpjIc09WCjJpUV4
Message-ID: <CAMRc=MepGiyymQ7z4faAfs+EnqwAYxtOBuisjOzDn9DfhwAa+w@mail.gmail.com>
Subject: Re: [PATCH libgpiod 3/3] bindings: rust: tests: disable device before
 dropping the resources
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	Phil Howard <phil@gadgetoid.com>, Koichiro Den <koichiro.den@canonical.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 5:18=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> On 03-02-25, 14:25, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> > instantiated device depends on") uncovered an issue in Rust bindings
> > tests where the GPIO simulator device is not disabled before removing i=
ts
> > configfs entries. Implenent Drop for the Sim struct in order to disable
> > the simulator first before dropping its bank and device objects.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/gpiosim-sys/src/sim.rs | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpios=
im-sys/src/sim.rs
> > index 71b9453..e3cc95c 100644
> > --- a/bindings/rust/gpiosim-sys/src/sim.rs
> > +++ b/bindings/rust/gpiosim-sys/src/sim.rs
> > @@ -328,3 +328,9 @@ impl Sim {
> >          self.dev.disable()
> >      }
> >  }
> > +
> > +impl Drop for Sim {
> > +    fn drop(&mut self) {
> > +        self.dev.disable().unwrap()
>
> Maybe self.disable().unwrap(), since we already have a method ?
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> --
> viresh

Ah, right. I'll fix it when applying.

Bart

