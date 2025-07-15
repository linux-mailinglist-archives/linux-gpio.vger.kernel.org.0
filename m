Return-Path: <linux-gpio+bounces-23306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA6B0647D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E6F4A2461
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 16:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805C9278774;
	Tue, 15 Jul 2025 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5/33iL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A052528FC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752597547; cv=none; b=PseB047hnSEPiqXdPSTwYc395yfQqEhHqlpUzUeH4xJDAFEE8e0AFakQeekTuluHJleA3A0POaNinCS+6ls5zU1K0Z9CjrtCXYjF3SYAp8y4Y8t5l7UKIaRhopxkF2Tu9ToA+TOXaoE+ckhasf/tEOxS+uscAVcdN0hQOalqGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752597547; c=relaxed/simple;
	bh=D8pyBZaS3BxSLcxJJocujk/p+ltHMJUf+ywx1z3cIfs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TiVGrOTn+vazfHFvdeRoqMxD0oc5cxKvjXRdMcmnXVIzzWMTiHPRyatMPXAO1t/y/SYMDFoirM2/WEgvVRmJYk6bGmpZZ6IDhURIkRQVF4CjzmPGGqJt8vXT0esisyXB21UQhQhjOlnKdUzNpfeg9moVinv9ETVBAZgrtExU5n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5/33iL5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so29389195e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752597544; x=1753202344; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D8pyBZaS3BxSLcxJJocujk/p+ltHMJUf+ywx1z3cIfs=;
        b=V5/33iL5CSJ/AZvs0UFHlxAsnPNyKK6Hpet+nIDxg2P3DAoB5B/Yv25uDR1rd/Munf
         AiRX/zVerFBic3v3ZNPCfVF6xJoM+D5O2dIGya2J6bi6oCZP8sEIJbQsHxoKY2s9Jqy2
         F7vzG4x2Lo1SCRqXS+I162aJOn8jXdT8uQ1J0OPVOp7Dw9O9YnDMo3Yt+gNHkdXerM4s
         Vz5UGVK5bf1imiMQh8vQ5JzYQulic2fjiz92Nl3uQLJZArC042ylW/rcAIsLsbnhzVRh
         fTH8R3YmrA8P9f3tVk+6OJJxhSu9Wwb2Pw0cUvBDTs0ZZu2JCym2AkfIIW+dYJSWEma5
         cn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752597544; x=1753202344;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8pyBZaS3BxSLcxJJocujk/p+ltHMJUf+ywx1z3cIfs=;
        b=HmljBKoq5fOsEmWvRmwl6Sdj9pwR43qLJ1DquPa2cwkU2DhlUN5wCXNFkaBZUALufc
         52dOIKhZ68+CpoQ+PqXl5Ef24M5FUOiBC/x4ypVPAhVDYBS5qu9EOxikk9zJ3BDguUY+
         16MSlhxMHsltuS8NXhk3tdrfgPCeYG9p1Ir0NEk0fkoyDGMJLROpKra+HyA9KtXDNHJg
         T/YkYGDmdxiPWpTocm/0w/Z/ocIwOf9YpUKKEJEBX0rDKo8F5mqCI7tORJeh5DkHoRoh
         k5PQTtLaKt2ltwTY4n9mbc6zrj+vwVbS2HfwQMX5ODe3KfSJ9s7vskIVm1uyd1d7p2L8
         RsIw==
X-Forwarded-Encrypted: i=1; AJvYcCWPGpYG7nd2aotUp+881h6bJ/qTAFL7HxSPYungV4OtcbvpvdAwXZQUnAauN0U03bZ/v2VmN3qOI8aD@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH8Hf/3apWTAX//M3cFlRi812+ykMPtmez0a8z9Yr3BnID81c
	fpgazbj7K5xC84dh1xOzji5c2cZg2PRcFzN+1BEmnd7izHaOxiNb9646bvrdd/TlNSU=
X-Gm-Gg: ASbGnctgVDWaySgbAKDmazyF/GA1Pt/ihh6yWhS1Y+ENIC1LqwqqxSL5zwVD0vIw7YO
	qohnxITCChdypiINeZHdwCHReqMnSkjqCGfcLgMi0EYmvtO82PvzCSkR+C+6d7nHKGBvu8MHXRl
	JbEBvKLc1/FoILEEC4Hw/9+dwKDR4cGy0uhgjpqbGDedb/d6hp8+8gPRwRJ2Yo18ykZKkSfIj4N
	lADKTdC7QVLSSQKPUa7jpmIO/zQ/L60Ib0KwH2sCwFXuRhLSp/1Wpyo+ggktSP/1SQpZieXAuUW
	uTbszGkRLpeYQZD/sAvY/ILnvlmdI0I1gUTS5jcom7BAsNYTgWzsv4ry/Gw6n3MHkQ6AVyWAne8
	oeOTEndsFcOFnUCKNRPgfVSVNQw==
X-Google-Smtp-Source: AGHT+IGeRnOd7ob2gKapVZ+ZpcAPMPY0lyCsIqwb7pq8pK+WLPRotww+69t0puhy2h4JJ5sqdI+M8Q==
X-Received: by 2002:a05:600c:a08c:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45622f0de79mr56845305e9.26.1752597543943;
        Tue, 15 Jul 2025 09:39:03 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-456114a417csm87842745e9.25.2025.07.15.09.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:39:03 -0700 (PDT)
Message-ID: <1b62c265aee13fb250aee653c1b1b627e977917f.camel@linaro.org>
Subject: Re: [PATCH] gpiolib: devres: release GPIOs in devm_gpiod_put_array()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-gpio@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 15 Jul 2025 17:39:02 +0100
In-Reply-To: <20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
References: 
	<20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-07-15 at 17:00 +0100, Andr=C3=A9 Draszik wrote:
> devm_gpiod_put_array() is meant to undo the effects of
> devm_gpiod_get_array() - in particular, it should release the GPIOs
> contained in the array acquired with the latter. It is meant to be the
> resource-managed version of gpiod_put_array(), and it should behave
> similar to the non-array version devm_gpiod_put().
>=20
> Since commit d1d52c6622a6 ("gpiolib: devres: Finish the conversion to
> use devm_add_action()") it doesn't do that anymore, it just removes the
> devres action and frees associated memory, but it doesn't actually
> release the GPIOs.
>=20
> Fix by switching from devm_remove_action() to devm_release_action(),
> which will in addition invoke the action to release the GPIOs.
>=20
> Fixes: d1d52c6622a6 ("gpiolib: devres: Finish the conversion to use devm_=
add_action()")

The culprit only exists in 6.16-rc for now, and it shouldn't be
backported to older kernels, hence I didn't add CC: stable, hoping
the patch can make it into the 6.16 release

Please let me know if that is unlikely and I shall send a v2 with
Cc: stable instead.

Cheers,
Andre'

