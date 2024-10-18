Return-Path: <linux-gpio+bounces-11621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC849A3D98
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6721C244E3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B1FD530;
	Fri, 18 Oct 2024 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3Ui2cQSy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142323BE
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252455; cv=none; b=nEY5ToUZ/J/g80C8lySE2IjpDI3i3dUiGp7jVd5ouAOVvogBiNnBK9AejF0xigDqigDKkEw6S1nhqaM6sUzImDziEpmnS3uqmGYGexuDMS04uVgVrPUgj/FORY72Mk6SqOw6UyXb9N5+OfEh7O2hW1dDqzJLE1dOmwYlLdkJIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252455; c=relaxed/simple;
	bh=R+AOxf+aDYAfdzS/iwTw8wPE4Fu+7CXl+K2uObemX4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8ygLizxagSza/Kzkhi27sSn7avmMKu9vnU2kAldJXd9dzT/H3cHb4j+79drsAbxyTwIXp9n7KOwwkZhv0yv/hkjTGQkxrHDqGl5J1M0MBzkOE1LVCvnEvNB1rimH6FWa6xZgpFIPy77DOPyQLJQv1T5FmuKLt/Ii3Z2QEdP7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3Ui2cQSy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f8490856so2415391e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729252451; x=1729857251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+AOxf+aDYAfdzS/iwTw8wPE4Fu+7CXl+K2uObemX4s=;
        b=3Ui2cQSyW9pIJd1XL5mgRFMPlRxQAIx3qK55HrIaDaJlrVd7kDCpS7Igy3slfPKGtj
         hMfClJkDys8JjplhGTUMEEOqxqB5DjVG9wo2GgIA/VQ2qNf9RawYCdJYMC5aoWu6ZGEv
         2nLY2ufz8BrcMVQsNuXQLZOo2jQ4vCGMwljyqvEatbCvuv2GhP62t7qiFgGvEg88UrTV
         jYw4FBX0lYAuk7ysLspvRuJkBSO+B8zLmOl7gjAYMQCLzy8/KietPKzRH8SFkGkjaTs0
         riyKE6Jrbr1yu8RMjjDX8ujNM55LAM6pGWCEekhHi53hUUvC4BGreYUOQrn0KPVgSWsH
         D6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252451; x=1729857251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+AOxf+aDYAfdzS/iwTw8wPE4Fu+7CXl+K2uObemX4s=;
        b=ZavhnAfSM8ypTYPexQC4pqb9sic6Djb55wTv9j5nqPDHk+dvPiZHM0Rv0VawGctGLk
         2wshRSydFQGmRKowggWWNZBCJVGBOo+sQ3IEy0OiNRTwj+iJD3gNoqhoc49ILPPeI/d2
         sImjdYvR6X/JsEPZgGvcYsLxRiDaYRynVa2F2M+Yr0EnicYz1xf80hbOW6lKYJg4Wj2Y
         QIXZRjvIyFDQdGLwRqe4hzkzdLn5y3NznPArPLRPlOXufpoEJ2ISiGS+Ifx3UJSmI1ZI
         3osmkdCo0NlQW0UmnoTXjP8p2BMpDea+QPvJBzDp3NXqVjh95R9tVnYufGcT0RAII+WJ
         I1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxBttyKZn20JiR/LFiPmuJnXCZEFZ5gkzcOIcDIiuxFj4GKs+yq7cC8kqEdRd3xHqUj1OEy0DJ5FAv@vger.kernel.org
X-Gm-Message-State: AOJu0YxILb5ldo6CvZclzH1QXqu4RxXIIrFfL6Dvo/gnB78LRn2o52wN
	Mr9yLZWHr+GE/EtJ/srzVOUuLToAoZZL4fksFGqT0YQxbYnaO8B8aH170HNV56SzeFFLTmspcQ3
	xevOKLKlexEXr66doUd/x5v3bjuITEBE9V+/oBw==
X-Google-Smtp-Source: AGHT+IGUQgH2LgImLhYYgCYRyZ1eHg5DziD1U825uTMvdAnFcqxTubAakIf4JTFLzwcMTyXcbSOuzLUP70wTACWniRQ=
X-Received: by 2002:a05:6512:1244:b0:539:e9f8:d45d with SMTP id
 2adb3069b0e04-53a154f9980mr1277516e87.52.1729252451143; Fri, 18 Oct 2024
 04:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
 <ZxJGxXNl29i8d_fA@black.fi.intel.com> <CACRpkdafFs-p6ikk7cfSWc6=C=8J6Gh+oe4TagAJh0EypWg3Og@mail.gmail.com>
In-Reply-To: <CACRpkdafFs-p6ikk7cfSWc6=C=8J6Gh+oe4TagAJh0EypWg3Og@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2024 13:53:59 +0200
Message-ID: <CAMRc=MdA+=ejKx6SR+-_30kCgeFX3fUFReLR7+tOT+8+O9_gFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: mmio: Support ngpios property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 1:49=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Oh well spotted! I completely missed the fact that we already
> added ngpios parsing elsewhere in the driver.
>
> Bartosz, can you please drop patch 2/2?
>
> Patch 1/2 is needed however: it is just documenting the behaviour
> that is already implemented.
>

Done.

Bart

