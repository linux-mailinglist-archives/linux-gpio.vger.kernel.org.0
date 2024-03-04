Return-Path: <linux-gpio+bounces-4094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D84AE8703CE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 15:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EC7A282E97
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 14:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BF93F9E9;
	Mon,  4 Mar 2024 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2ZUqD0l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2439224D5
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561571; cv=none; b=rZY4k3jfp8Phe+haN953xwKoQj32ROfYaEjMmTNscFIH4/6/ywolJbaozEQX8HJuqAz5IevJR6tY6/Ne+c400a1HFFrx9C6kGDw3PEMEmzTsJx6B/6AHAqO6kuff/Lj9pMTG//yoj2npQtLk9eqZkkYQMoi7pdAs5Jn1oiRSO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561571; c=relaxed/simple;
	bh=C4xdlhmgr/+C/vBVOdbM88cxYuGC+XGXbBMVjEa3J8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qM2ePF+bHPTC2VcQEUkQLyt9rVM24q7uW2MbvNrFObOk6RPfZx/Cv50J24k+t2m3I992Lcn5FqlsYZ9Pjfa9qJcG8Asy+gMr/wzgySA8D9kadSF931rcX79fcUukdC8WeKZprYQ67GIpEk2CkVlof2TO5a3owvAXuldLLoqPU4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2ZUqD0l; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-608c40666e0so38470387b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Mar 2024 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709561568; x=1710166368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4xdlhmgr/+C/vBVOdbM88cxYuGC+XGXbBMVjEa3J8o=;
        b=z2ZUqD0l+lDoJHD944Re9sdk/YMMZizx6SGYnGdINdBONpuGPhfGKW9ucp2ynH9+hr
         hcuwAdC8e2DqpP8cJhEglPB7Tnm+LFLjRQ++zJ2mBZmcVjaRYus1D8B3XdTZoy/7vN7D
         Ms0Tp7odrAt92YqZExxEJjnE+YpjM6krERotoa9BL/Dw9vjEPR9QBSMGf3X+3IGrsq68
         UZuqG+RPqIN0jE90MvY6jkTNjR3uPcxjvF7ynftw584eRYZZnlNTm7eEARM3guvVuOpQ
         5+6HrFENOB+oRuOUkNvIoCfvAfVsHAUIMMDZ+SN9F2BD11atf7k+UYUlagllw2Nb8GVI
         SlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709561568; x=1710166368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4xdlhmgr/+C/vBVOdbM88cxYuGC+XGXbBMVjEa3J8o=;
        b=jJm98X/JqC1WSm2uHt5CJs6LGBrHBdn8QRzRKeKBwStnsr7LrGVd4JWN9Z8WBtpQa8
         iXea0YiT4ZWAIFL5BMQ5VW8LvHrSbDcUSrSsbPLX0i7tNj8Epqu0vRB02wcfgAVo7gus
         NH6reeLLPcEKsOoV+3p9SwlRu2G+CuWFLhYElzoZ68mLU4T4+DnxfV1aigTkKmIbSXBu
         R4GQbNqcNKLx1aklBYD6ZM3mKVofh/i5bHZhecCXuvTGkEtit1PByDiJekOXjybgCLDn
         m47rx+l1/lc+/bx5UrHfUa0yTJUI/nNC5C7hDKhz4Wakn/8JcDRkVifyrjsRW1369Ecu
         aKqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaS/DqMPhRF0ODWWTsmPepNT4waWzD608w8cck2D2F1jUyCg6CswzCXNXZtGwofSVW8ilU+e5addW6HpO4iCQDHeRxs4qhf+7H3g==
X-Gm-Message-State: AOJu0Yy/RfTvB+oTu47+ASBi/5vFh01WOFbwWxNR9ZkVJxfjzbdlmtDd
	oGXsxH8fT7Zzdya9HaZl8XsjK+tPvPDuJv7WplDmQw701+Epvj013HuGbknkCSz24qEy2PFMGTV
	YX5Uid0E/qJ3iDXJkNG5HueaGw/QZ4vfmFmfE4g==
X-Google-Smtp-Source: AGHT+IFg7kjN3S7prpMCYxKVUACfpkJWTaouzOrC/PUQL5PbtxujELZ7OYQlZboi9IsZusaE2MSigNREDyvROGV6w0s=
X-Received: by 2002:a0d:d384:0:b0:609:8785:a355 with SMTP id
 v126-20020a0dd384000000b006098785a355mr5958483ywd.19.1709561568660; Mon, 04
 Mar 2024 06:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
 <CACRpkdY07F=kq=MZq94WJdf18VXFpsO_SvaDvF_B4zPUzUiVrQ@mail.gmail.com> <ZeWtgsRaW7jmjM8d@smile.fi.intel.com>
In-Reply-To: <ZeWtgsRaW7jmjM8d@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Mar 2024 15:12:37 +0100
Message-ID: <CACRpkdYXZxbvksCTOYAw+HpowM6Zdk38bj-rrPb7aW+Oi8cauQ@mail.gmail.com>
Subject: Re: Immutable branch for nomadik-gpio rework
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 12:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Mar 04, 2024 at 11:22:12AM +0100, Linus Walleij wrote:
> > On Mon, Mar 4, 2024 at 9:38=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > > I prepared an immutable branch with Theo's rework of the Nomadik
> > > GPIO driver, including some icing on top from Andy making it a solid
> > > rework and cleanup series.
> >
> > Nix that for now, I discovered that it doesn't boot on the Ux500 anymor=
e :(
> >
> > I have to backtrack and see what the problem is. At least two patches
> > are regressing.
>
> Since MobilEye works, I believe it's deeper than just my top patch.

It is, mainly my old hack to peek into the gpio driver from the pin control
driver is a bit insane so now I have to properly fix it.

I'm onto it!

Linus

