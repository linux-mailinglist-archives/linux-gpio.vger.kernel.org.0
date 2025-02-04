Return-Path: <linux-gpio+bounces-15328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522EA272F2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC7A162A5D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834852135A9;
	Tue,  4 Feb 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZUECS8yB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7520E305
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674768; cv=none; b=NIeMlDWgrWwjXhVIiHivAlEFO2c7ZKZLbQhwwIsW24wEpktW8krc0mDEG/hYo0G9PB8qnvwb0EBiIaS7qr8WYVlEMep7y7RKt+NE660wzHPREW1EMy0y6qBA8yrG/duyH+WoRGxNNQ3jTyq4PpLwR9G++T6k872v7Mn8EISqfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674768; c=relaxed/simple;
	bh=vj6IduQxZjTzlbvnUzGiJR/GcRS+u9ZV5NL/laZuY+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhIPgUQADXRda5QhaeN2GLLAZxAsBhxb5J5nYIJ6fw8CJLXb1Quzc/aLD4nrcR902vS+hBEoFh/CmW+h2lcMwHvpK5t1VbtJtzt7xNMqwwwOU5YoHrgHdKueREynfjKuDiS8Qn/KmruhIOo7HoES5PtVBW+TaOV3pz2c0D3QDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZUECS8yB; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-305f529a987so41553851fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 05:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738674765; x=1739279565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj6IduQxZjTzlbvnUzGiJR/GcRS+u9ZV5NL/laZuY+U=;
        b=ZUECS8yBUGdvCMhSHAPwsFMojCnGHPAjTiwwg1TRyLR/n7cT98RUx/9B+oHSrp9o3Y
         nKxSAirFKyWqIbHwKRAcgU4+bligjIQwb7vQXgq4ghddKMkxt2y4w0+kwc03u9TEXWOR
         nfwenEctsWpDp49aD1Sww1PEQoTz+VW8tnFs1N5y+Co9HjjLRkgG7ZqinueNusyeZzX2
         mpxS2Xa0iEaplQiuKme6TVQkE22Qab8g4Uy0tbPVVdMuRbXi0M6HttAlWOqVbRccNmsO
         /+3L3A2YxlE/zY15hE2NylW5Wjkc9eDu7U0YM1d/p+vWrQx75uCJEqsMPp2M62at1L14
         HBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674765; x=1739279565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vj6IduQxZjTzlbvnUzGiJR/GcRS+u9ZV5NL/laZuY+U=;
        b=p/xKTy8J5BZEjKwpub1PHxv3Mnge+u1NdNTkj8chuf33Z2llmoYh6/8w7C663GLMBm
         vLqH6orjpc+wkOA76/2yA4QndchTMnEFo/aCn9DndrhB6XUZJhm49g/denDtY1Hp7jPI
         xqN31ih4SgFjemZzhX90+WJAw7FZrX70eJbPkIh2BVCaa+W4ZaWjPo2U3bvUczffMV5X
         FgnT+U6wRkX+lx5uz8JE4UWWP++5vxs5FV8APOK3EIGeLGDptfh8PKCatWei28bgKvcM
         vgkh0TyLsIhQlwIVJr3xB//GRyFjq1mE9mL+L/B3aH7VtqNLN33zOXdXLw16J8Fc1Wmi
         mkmw==
X-Gm-Message-State: AOJu0YwlziZkJTwGhD73VaM3BSNq257CnKw5qABOJgzjLJ/qRRgSLZI/
	BOcb2JkDlZAQFmulQlRc2lBmp67morueRkxFlXtUFD3uuZJj2stBAsDpvW6iHx8LrcKs4UkJw6v
	m2e6UpV03wtXDepeFZLDDM4RmcC06pRQ0qFY/Iw==
X-Gm-Gg: ASbGncu389Agl0Y/X5HtXBWbAkjOXqXMoeVMHqpuDEMijSHMyWrF6y+A65P0mf2FAqI
	jiu98SI1jFDVOhkUjqJD2Eg8ymPNH6HPeSllvdBdWh+llKs5cfVXJWpDy11qHgLniqB2Slmya2V
	SGzoCCWyfqI61/590m2XUZn7R1EOCS
X-Google-Smtp-Source: AGHT+IELIX734CmpZjaUH1LhY+mNlPgn6FfQqHOjvdD+PtEwT0waywr7AsYeKEHFqGsboEk9PPcQl3wAhUOLx9QZVbM=
X-Received: by 2002:a05:651c:198d:b0:302:497a:9e5b with SMTP id
 38308e7fff4ca-307968c0671mr84854771fa.2.1738674764635; Tue, 04 Feb 2025
 05:12:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-9-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-9-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 14:12:33 +0100
X-Gm-Features: AWEUYZnZziKEMrS7-p9No8WpR-3WgtOd65xny6U9QQ4GzETV_Gz4K7cRMAjks74
Message-ID: <CAMRc=MdQuQnmqFravDfvcoN_TUXgfZnJh5UxdRuYhECfmvAhGw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] gpio: aggregator: expoose aggregator created via
 legacy sysfs to configfs
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> Expose settings for aggregators created using the sysfs 'new_device'
> interface to configfs. Once written to 'new_device', an "_auto.<N>" path

I would prefer this to be called "_sysfs.<N>" as it's not really
"automatic" - the user did create this, just with a different
interface.

> appears in the configfs regardless of whether the probe succeeds.
> Consequently, users can no longer use that prefix for custom GPIO
> aggregator names. The 'live' attribute changes to 1 when the probe
> succeeds and the GPIO forwarder is instantiated.
>
> Note that the aggregator device created via sysfs is asynchrnous, i.e.
> writing into 'new_device' returns without waiting for probe completion,
> and the probe may succeed, fail, or eventually succeed via deferred
> probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
> without notice. So, editting key/offset/name while it's waiting for
> deferred probe is prohibited.
>
> The configfs auto-generation relies on create_default_group(), which
> inherently prohibits rmdir(2). To align with the limitation, this commit
> also prohibits mkdir(2) for them. When users want to change the number
> of lines for an aggregator initialized via 'new_device', they need to
> tear down the device using 'delete_device' and reconfigure it from
> scratch. This does not break previous behaviour; users of legacy sysfs
> interface simply gain additional almost read-only configfs exposure.
>
> Still, users can write into 'live' attribute to toggle the device unless
> it's waiting for deferred probe. So once probe succeeds, they can
> deactivate it in the same manner as the devices initialized via
> configfs.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---

Bart

