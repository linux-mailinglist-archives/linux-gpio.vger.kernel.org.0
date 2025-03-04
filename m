Return-Path: <linux-gpio+bounces-16993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB0A4D578
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9A80188D3D0
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E701F875B;
	Tue,  4 Mar 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxAjPqaR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46D1F8736
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075026; cv=none; b=QJOxNHvlzBf23eeGy/OUApygsqYCiUOtbc1jsU39o6ACH3rDVTD0m1IhYviWQ7ZJH6REvEwKnRhuyfoFGCvnrVlYYuUGs9zOEEOuNua/tJhll4gIJtMeKKzvzDRQSPnJuPXLn1H8dRSkk0OcHBCo0NVUNOqGjN5v3tn6cuSzXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075026; c=relaxed/simple;
	bh=sW335vmvtfvYEmaka21fFYN5MW1M94pNUFyg4zfSmOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+l8V4aMC0xmXm17kcarrzVE91yyse6d+mmEWVjgrFTS7y15PMU3jjFNt+ypaBgm5tpPZ4QBTf14s8rvsh06zt+EvXUpLXlR7zmoUjAbC/eGQnNLrllYe+6ClqxynYeuTkzvbyzgei0/y3Q0aCuZ6mrdRddUTXxwe5Ql8X4CCrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxAjPqaR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549644ae382so2456079e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741075023; x=1741679823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW335vmvtfvYEmaka21fFYN5MW1M94pNUFyg4zfSmOE=;
        b=kxAjPqaRB0bbaHR0pCFRcRQD+t1TKYz5mPoVHxw5+9FSwf60nbz8bsr9YxqycKbd+R
         JI8YCgTARUcfnyWg4LuHqHLE5jY7nNfaClBgNpuB2q3+2SogeS7GDs7CSo64qmp1f3jc
         OdJWMXyz8dsu2C1I1WLdfzXWBULV1UpNYVrRPduFAQ5HLT3p1C3SeSU2lyxWaxWVaQIX
         U8ZW06XawCeUxs6giW7Xbven1Tg6UeufXKuv97JJt/BKSwSrDiie0iNWGyxzaqGnneBC
         TykUcAujZTXPC5/K7pf2vGZbqRq9n3o66WF3WYB6d2OIDte77Iob9fsHfk6m7neSwIZ5
         SwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741075023; x=1741679823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW335vmvtfvYEmaka21fFYN5MW1M94pNUFyg4zfSmOE=;
        b=pnC2yK1KRHHubszImSayjfkadnvQK0bDZLAdyMUV8y3J7AjT6k7VTUELVSWzkz5hN1
         uSuZtfIT6XD5gMVkA5Re1CX0dDPOpA9Uof59eCckEafofWeMgy5MIAUk6Q7nuMYll7uX
         Cj1G6EDrjzLItVJIeGP3ETIjxFI8PbJzyxWuyq4Egj2WLFIx9ZN9bgyfQ9qJyjpQUfEH
         U7PnL6zRWKpLThg82Q/sSeU94h3+VkvIU3UaLb2PfONiyEd9MyNYiyhCN546tmXkBspU
         AGL0aUYPWFev8VUzyPIwvtcnr6L3FypbNkCAoNg2dPKyUc3EKD+5myEfGuaY6JzL5ChD
         Yh0w==
X-Forwarded-Encrypted: i=1; AJvYcCVw0RU+z/JOXbjJOLY+dtHgoHZtfJSaoBCJkQjGbviRUuzau3pPsLpsBBUfjjMTzqtQAm0Hn5HLALOa@vger.kernel.org
X-Gm-Message-State: AOJu0YwoMF7tLJMrv5WxR8qlKGtnnPYlKwCNd639OCabN/xRpUIQcfsR
	fqE9P8ZFWySXoqa8NsO/RLI45K00SrqwTADRPEbXu4jrm0kHL1mpdcHm/z1DonTuol/H2aOmIEv
	w/yaLXkYNKhhsbGHZsokKMHlEj7JpwrKaKn0g4Q==
X-Gm-Gg: ASbGnctRDzkuYNOnoFQeFLQXGFSc1XqVVfEejNcdpY1E+faxTejR5pdnmMMMg80JOnK
	XS7cHM7cC15PA5qxfIsK9gZsDXXWoUOMzKt8v7EuZLCvQG9A2pSBN5KCrZNYDm5XByyPqYcifyI
	PslkWYeKzKy9Z12jQIExJlQe+n1A==
X-Google-Smtp-Source: AGHT+IEC45SEMzq1znYQylPcN1bDBXravSrfHmPZ3iZfnPgxT5XNdRhy75iGuFWtpRBT6l+L7MEoL6EyvLtuAZmNlU0=
X-Received: by 2002:a19:ca08:0:b0:549:55df:8af6 with SMTP id
 2adb3069b0e04-54955df8c86mr3865824e87.53.1741075023137; Mon, 03 Mar 2025
 23:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740745270.git.mazziesaccount@gmail.com> <50003ead72a41672ad25e90b7a273ce48f04c8c4.1740745270.git.mazziesaccount@gmail.com>
In-Reply-To: <50003ead72a41672ad25e90b7a273ce48f04c8c4.1740745270.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:56:51 +0100
X-Gm-Features: AQ5f1Jod23brmYoB5KN0x6KAMbdCsgZ468CTcmxQ4fZ2A-aCMV_-agQInBIxzjM
Message-ID: <CACRpkdZ=64sgZuyb9sEF6+kOVxPcBdiVvkGgQSio2wO3kpeChg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: Add a valid_mask getter
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:35=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The valid_mask member of the struct gpio_chip is unconditionally written
> by the GPIO core at driver registration. It shouldn't be directly
> populated by drivers. This can be prevented by moving it from the struct
> gpio_chip to struct gpio_device, which is internal to the GPIO core.
>
> As a preparatory step, provide a getter function which can be used by
> those drivers which need the valid_mask information.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

