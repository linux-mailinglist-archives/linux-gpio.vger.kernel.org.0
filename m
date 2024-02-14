Return-Path: <linux-gpio+bounces-3319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CB855189
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 19:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0622E2975A9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 18:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3412BF12;
	Wed, 14 Feb 2024 18:02:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51A12BF10
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933766; cv=none; b=AmmhvBbssCy0JPIYFDaHpEsR/tY7IKzvBtBIpGIs3JdBzlJuVxaJFMBtP73cbenwe3K8Y92mPMxeNHFA5v1aAwhyYH++Kb3+v6XXZ6kMNGMC2k/YAHm8qtUX4xL9KLyIYXUSHmtgpB96rXVd8ZsGqKcTRf8vD/Z5RqAbUBi3wzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933766; c=relaxed/simple;
	bh=Dn8Yf9ohMCVYwaXn9xt9wqXH07NnHBYPagCsBQQza38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVF3BxcuWWXFeFwhhOzg+kxj0dVWHor0FO/S+GqUGzcpWf8dT10nbMMuxEnshYC39w8ORR9jJNi/Lml+lpwUXQoU9LOrnYI69H+aC522qFNTtnClrEPvJQjfQQY/FmyIseZiifUKQzVCmWoqd4GEUwsNNskNWxTAeM5yfO/kl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e10d08cb4fso483426b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 10:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707933764; x=1708538564;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMJfvLePNW+r5ZqNm2Ch6Q0binx03GwTJpQuwxk2R24=;
        b=v7RWfdrC2IMxCafUQ7DJTkIhXn1SsBDrTt9corHlANKtKrzV4bjrI/FoCRTAzLijU9
         gbGAXBWCJTUxCaPaohI/RDYtwQOT3YNfIIxSe3IaFRVA7Pbfv9crT73zzpoeAke/apOV
         HdAexNP5WiKhKQl+7WQRIG2lwb7O/u+kcnTV1UNxEaBiT3kefU5t86TrqrDj2OtYqaUq
         hXAbY7TT7dAXMqvO6AIYfOeUozMtGE5e1VUPCXZniH2Ovu5d8uAk87FgRl1B32fxmK8T
         KwXQdNWbk7xNHeU8Wx5f+9kKKNh94kByrD0ZaE0eTgu9SI9hg3shheYrFiv9e8gM/1ek
         UqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUExfk0G9yhnCM/cGq9RcmKOP9Xgyy6LnshATrOgtffH7lhLw04Ym172bbzFZ8PSE+C9lwdawJjLF7oRMyE5SUB5xOvjKOHua6vvQ==
X-Gm-Message-State: AOJu0Yz6tKDlatZBozEGoP7MPiDw1rfrnXYZJtXJmjzhqu1XDbHjzsSY
	XfFjUK8v/Es/XLI2GdafJMBS9d2MnbOpnRgZ6eMyZOytGBxgwVT/I1TmCWvzpIA=
X-Google-Smtp-Source: AGHT+IFjOxETxVsVXKwukbbq2O521EndVIHxuM/6CgL2FSRzyaA/fnhtAcZfZBZklFd5yIpLmvaj3w==
X-Received: by 2002:a05:6a21:3a84:b0:19e:b477:33a4 with SMTP id zv4-20020a056a213a8400b0019eb47733a4mr3973134pzb.27.1707933764227;
        Wed, 14 Feb 2024 10:02:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULxq1SGeV5gBCWcwYdeJVGn8aW5V5K9HiqGq6clZ5Wm4x0VwZAQD9Eu9zGQ70Ray/ifa0zGSeNJCPKdEjmwJzmgf4D79S2pf5ZQc4zfgnsnYJ6x12heJlwbueus7A6Mh1b6EBIMPOEH5Q1Y4ZjD6hKtiygQ2J3NfUzBZo6DJmn2+zahl1mi0FDT3UxFk+tcuNAhPAH/FAJgmCD6tAEEz2J2/sbhtT8xA+G/3QmGNqGfTxPsYXrPQrVab9Gptn3DpipaGLKKvwIIuzQP5CxTbfz5+yvbFZuyS2GBKY6gXEQiIyG/ePCKu9QfsmekUvf8vWwDw5rf3XUwODb1dn5fzoxWLbu2GvZX+gTHqYvDb4c1nBxvCRgsKwY0I6HllMH8L4VJbTX0kCHIqPAzso7G3IA0FI6omEOHUmjZ7yQsGnwintoYWrKU7pGvRpSHm/EX+dbfNU858uHfspDFC+QSv/bA3+2Lu1IWse5g+fq1QWW7AhswEpAixAtUVJrlKygMhQLiy8l/XKCk8a+woVPtVyn363pCMAjyYU+MD+P0E8HhunMvkEJyTN4hoexy79Pno4T0mjR84qLMhjYWg==
Received: from localhost (71-212-63-227.tukw.qwest.net. [71.212.63.227])
        by smtp.gmail.com with ESMTPSA id u33-20020a056a0009a100b006e0f7b8d15bsm3722898pfg.185.2024.02.14.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:02:42 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Bhargav Raviprakash <bhargav.r@ltts.com>, arnd@arndb.de,
 broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, jpanis@baylibre.com, kristo@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, lgirdwood@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 m.nirmaladevi@ltts.com, nm@ti.com, robh+dt@kernel.org, vigneshr@ti.com
Subject: Re: [RESEND PATCH v1 03/13] dt-bindings: mfd: ti,tps6594: Add TI
 TPS65224 PMIC
In-Reply-To: <20240214-depraved-unfunded-3f0b3d6bf3e2@spud>
References: <20240209-blitz-fidgety-78469aa80d6d@spud>
 <20240214093106.86483-1-bhargav.r@ltts.com>
 <20240214-galley-dweller-1e9872229d80@spud> <7hil2r5556.fsf@baylibre.com>
 <20240214-depraved-unfunded-3f0b3d6bf3e2@spud>
Date: Wed, 14 Feb 2024 10:02:42 -0800
Message-ID: <7hfrxu6i0t.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> writes:

> On Wed, Feb 14, 2024 at 09:26:13AM -0800, Kevin Hilman wrote:
>> Conor Dooley <conor@kernel.org> writes:
>> > On Wed, Feb 14, 2024 at 03:01:06PM +0530, Bhargav Raviprakash wrote:
>> >> On Fri 2/9/2024 10:41 PM, Conor Dooley wrote:
>> >> > On Thu, Feb 08, 2024 at 04:23:33PM +0530, Bhargav Raviprakash wrote:
>> >> > > TPS65224 is a Power Management IC with 4 Buck regulators and 3 LDO
>> >> > > regulators, it includes additional features like GPIOs, watchdog,=
 ESMs
>> >> > > (Error Signal Monitor), and PFSM (Pre-configurable Finite State M=
achine)
>> >> > > managing the state of the device.
>> >> >=20
>> >> > > TPS6594 and TPS65224 have significant functional overlap.
>> >> >=20
>> >> > What does "significant functional overlap" mean? Does one implement=
 a
>> >> > compatible subset of the other? I assume the answer is no, given th=
ere
>> >> > seems to be some core looking registers at different addresses.
>> >>=20
>> >> The intention behind =E2=80=9Csignificant functional overlap=E2=80=9D=
 was meant to
>> >> indicate a lot of the features between TPS6594 and TPS65224 overlap,
>> >> while there are some features specific to TPS65224.
>> >> There is compatibility between the PMIC register maps, I2C, PFSM,
>> >> and other drivers even though there are some core registers at
>> >> different addresses.
>> >>=20
>> >> Would it be more appropriate to say the 2 devices are compatible and =
have
>> >> sufficient feature overlap rather than significant functional overlap?
>> >
>> > If core registers are at different addresses, then it is unlikely that
>> > these devices are compatible.
>>=20
>> That's not necessarily true.  Hardware designers can sometimes be
>> creative. :)
>
> Hence "unlikely" in my mail :)
>
>> > In this context, compatible means that existing software intended for
>> > the 6594 would run without modification on the 65224, although maybe
>> > only supporting a subset of features.  If that's not the case, then
>> > the devices are not compatible.
>>=20
>> Compatible is a fuzzy term... so we need to get into the gray area.
>>=20
>> What's going on here is that this new part is derivative in many
>> signifcant (but not all) ways from an existing similar part.  When
>> writing drivers for new, derivative parts, there's always a choice
>> between 1) extending the existing driver (using a new compatible string
>> & match table for the diffs) or 2) creating a new driver which will have
>> a bunch of duplicated code.
>>=20
>> The first verion of this series[1] took the 2nd approach, but due to the
>> significant functional (and feature) overlap, the recommendation was
>> instead to take the "reuse" path to avoid signficant amounts of
>> duplicated code.
>>=20
>> Of course, it's possible that while going down the "reuse" path, there
>> may be a point where creating a separate driver for some aspects might
>> make sense, but that needs to be justified.  Based on a quick glance of
>> what I see in this series so far (I have not done a detailed review),
>> the differences with the new device look to me like they can be handled
>> with chip-specific data in a match table.
>
> This is all nice information, but not really relevant here - this is a
> binding patch, not a driver one & the conversation stemmed from me
> making sure that a fallback compatible was not suitable.

hehe, oops. <blush>.  my fault for mixing the two together

Sorry for the noise.

Kevin

