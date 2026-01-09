Return-Path: <linux-gpio+bounces-30308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA96D07D72
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 09:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88B0B3034937
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 08:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F46345CC2;
	Fri,  9 Jan 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnXN7JCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBC3451C7
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 08:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947507; cv=none; b=XSW5TrXZP5+29/pRVVqBUbGyVOb1rBxPZddNa3NpZoNOaAr9sH1GRt2ymn5GxGKUYm/S34IYcwm5/OctrqRh8p5byeOM8qiqf0dVfukrpQwttFmzg/TIeeN1Xdf+4RqP2JuASEKVXuEuO57ZYb7IAoFNWjHd5s3iGCgB+gGOSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947507; c=relaxed/simple;
	bh=n41asaQLSh2nTDm2OKwJupIvhTmTj3L/QX/Zfu/L6tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ed9mrwNvTnIXRBLwQhI5Effxck64aWtpTdcXs9/eZlEYNvvsnB7hHugHnbw4XBIEweVmllRL6/x3ZoWCNxoVD33nd+WEYwVPbrf9I50Ht3v3L6LGgAKE8zJomAL5gdLrNORdqskxbYiIupL01k3WiTJ9r9D33mDJBsZoCS3rcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnXN7JCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95DEC19422
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767947506;
	bh=n41asaQLSh2nTDm2OKwJupIvhTmTj3L/QX/Zfu/L6tU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rnXN7JCmo6Q83U+2luVJ+gCAxp7RebDsd5fXXQCy/vOW6+iFfzVO0gjP0ivW5zpMS
	 BTbNeI43KiI/5xrcyx2VMXJI/l3VavoCBnGTGGepjsoqJg04OJNDyqZLK3a9egGTLM
	 v5L/RGcrYS9zPdWUvGl0ht1qzIwosdgt1khTXQ+QcxYyDg5dlmH5NlPe/zqVjLfeF6
	 NrIopMpGObaEpbd9GeecGqllmPQV0KZPSUpUNi90s/o09G7//mMEqk9wjaeJhxi2/7
	 ne03Bxniv8JsfJvdMiGMDs7Pdkb2phF8gG14FqCURzRuXQ9V0ajcZzDJ6jk8CycYZR
	 QlN7WJO5gXySA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b79451206so1254860e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 00:31:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8gsqZOH1n4e10VQZhYwY8OWaorWcouJfhmpTaI6MjaTn8mWUPZHO1Bnlpg6r4C0OkJLdPS0UDsibU@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDpIItHOyPl+YETm5+/ppIhccDHKafAZy04w2tnE7xQ+5hWU6
	E63Mfm5L24Y3Li8zXk5LI/8RrUAgIPjrB73sRixMgLRtWMp0Lhh1XqeTrvq5HcMxXzgxbzOS1xi
	DgPUkvqp/ogVzECHZofhfE+kcb0zBkqzwvvqZy+5p/Q==
X-Google-Smtp-Source: AGHT+IFrL18TKApG7odN+R80gpguXRxPtBkeDhpT4ipT/Nf33FR/Hpyv1tuP4G3xDKsQdXbBbOPDIQz4GnwKZke5LKU=
X-Received: by 2002:a05:6512:3186:b0:59a:109c:6c18 with SMTP id
 2adb3069b0e04-59b6f03eb7cmr3207332e87.49.1767947505356; Fri, 09 Jan 2026
 00:31:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108134843.25903-1-dev-josejavier.rodriguez@duagon.com> <20260108134843.25903-2-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260108134843.25903-2-dev-josejavier.rodriguez@duagon.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 09:31:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=McFDfVjpEBGzRpWiyH0D4q2eOApKZrJLFgh_UXQ=tDNMA@mail.gmail.com>
X-Gm-Features: AQt7F2oaJczTL-MxUJgMo4Fzbb9Vv3HenQqsgQa34bAe1_TJHhQPFJMNqWvSBN8
Message-ID: <CAMRc=McFDfVjpEBGzRpWiyH0D4q2eOApKZrJLFgh_UXQ=tDNMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linusw@kernel.org, andriy.shevchenko@intel.com, 
	dev-jorge.sanjuangarcia@duagon.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 2:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> Since commit 1f4ea4838b13 ("mcb: Add missing modpost build support")
> the MODULE_ALIAS() is redundant as the module alias is now
> automatically generated from the MODULE_DEVICE_TABLE().
>
> Remove the explicit alias.
>
> No functional change intended.
>
> Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>
> ---

And what are the changes vs v1?

Bart

>  drivers/gpio/gpio-menz127.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
> index 52b13c6ae496..f51e7517f551 100644
> --- a/drivers/gpio/gpio-menz127.c
> +++ b/drivers/gpio/gpio-menz127.c
> @@ -223,5 +223,4 @@ module_mcb_driver(men_z127_driver);
>  MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
>  MODULE_DESCRIPTION("MEN GPIO Controller");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("mcb:16z127");
>  MODULE_IMPORT_NS("MCB");
> --
> 2.52.0

