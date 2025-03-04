Return-Path: <linux-gpio+bounces-16992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45117A4D573
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 677FF188D3B2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916D01F875B;
	Tue,  4 Mar 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpHpgR04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990531F7914
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074957; cv=none; b=B+1Wccn/XYOzy00KqPbjdGGclqHPMZrG0AH7/loMk6jR2S9S61gUemC365lebwECTc90d8G66uSs7gIQtI/XeQHWsGlCy29WeiNeUVSobPguS0DrRYimxKWArVxT6JdY1bAmqRVsV3N5QDnc2hz29IoJM4f4/lr3FnKj30th5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074957; c=relaxed/simple;
	bh=wMro+oQYT8L3eIKeDTeKQmWxyrhEKtJYvqmJAViAmFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfhtklY8wd2+odGvM0ekTI24qWb61jShzt8RF+fMjVBRjYiNPc8QYsZO1vPMOPFr8doixdITrwe75NFzAo1VJaPb2+SQhByW1CgkLTfR6YxmcfOUU+q5UesaqJzQ+I8+e0MjUx2cPCcj3976/4NBlODb615Qw/FL5tCivdmroPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpHpgR04; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bb2fdbb09so21334101fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074953; x=1741679753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ9DDcCt9QUtQRCh/VCueix6q79R8Gu4pWj0lHBrn+E=;
        b=LpHpgR04YegxvVXXkteciN3cJ0lKUmaPebPmFhaA7R86fg/6KuBYzk8SIEPZ7matho
         Bn9whmBBZrrZJnF6Ilnltyu2kBRi7G40t7ZlKMFHqVCyk731U8Y92iuQzIf1xSK357pX
         R7DVfkZ4p6Z0ZVbfDmkqbqYuvQtuSToM1Jy0k2tmmGSveSpMQeTyUik/Z9Hu4c9p2XHM
         /UJpok8T44oxaosD7ZKLg36XxE0zoeAgNL6osIl06fWuL4BB7gpmPpvcbOnFEANZjm0h
         APgob62LWlPkT0L2slXDnUYHOuYywQfk1HXiTWyfVGr2btTXQL3E+rMT06GIlFi6sTBa
         ++1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074953; x=1741679753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZ9DDcCt9QUtQRCh/VCueix6q79R8Gu4pWj0lHBrn+E=;
        b=gD4P4P3tCdKEiilaPawy8lcplvY3Xb+M3uj9gvHchZbiUi6buvV36ULUEKlrGtJCtB
         eO8In/DWzZ/59sUhozQHOe+GjhBSIEosE0LWRj6oDuE75FIeRiBMEstjjokKe+j18qh9
         sFNSyeuC/HThO3D5+tUOuXAF3iBwE8L0qwrKl7sIFh4hK2l5FbUgiZ8oad/6ePTj9w0s
         pmtkjrZTE104vfTzm94Ddfk3C33so57xMNurP/+9vfDs3K8bFG0ZKiQlLh3sINEJ8zkq
         sTZ/G1kOLV/8TMnOlpwXiBbNFNCOn1gBCUKjtZ6PXWjohwIagSK6yPAZRSi3KovoZJV0
         ZSQw==
X-Forwarded-Encrypted: i=1; AJvYcCWCXtAhDGovzXNX8LbMBY14+o2zN4wjiX5Hzt7+VqV3dC9JCAB5bva3O/6LwNjHjZRjoxpmIUasE70x@vger.kernel.org
X-Gm-Message-State: AOJu0YyREa6SHj1UJRBd0Mb8k+ufH2z5ORSKMRhN4Rm9vcFN8SfhKr1s
	LiSrZJP1xgu9+E9yCMZ6SD+oIZ77GWSmMGCnc1f8MTRJnxY0OoeC1GrHGaA8ooxUqadlcoBn8ud
	XvmsLWjWjzfsrakUlvdffxk5KC2yIEPuQyY7cXw==
X-Gm-Gg: ASbGncsWYnq1cBuyuxg22NaHm0AZP7xz2bCggeTb8ST+6RkwruJd+u7L0GMiKz37uDU
	ztf7t+cqEwC+oGjE0JzMNxS3KijhQ8QY1lYOqxWBcRIyFP7++TrST8R1Dt4FXElcx679S1/2+RC
	+Fn70RcdDCOobtggc2eO4/18GsPQ==
X-Google-Smtp-Source: AGHT+IHzVd8RaIZzzyr6YTNF8GY5ofx0PywPASYXwtX0erFZJL3oJT+GFdH/GWC223tClxws6TZBUM7lp+ECMgXu1vE=
X-Received: by 2002:a05:651c:503:b0:30b:b204:6b70 with SMTP id
 38308e7fff4ca-30bb2047363mr34222911fa.10.1741074953543; Mon, 03 Mar 2025
 23:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740745270.git.mazziesaccount@gmail.com> <e50cf74a587b33cae3133a6b9e0081062f771249.1740745270.git.mazziesaccount@gmail.com>
In-Reply-To: <e50cf74a587b33cae3133a6b9e0081062f771249.1740745270.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:55:42 +0100
X-Gm-Features: AQ5f1Jpy987oPMQI8JiveGzipXCGjOLloV363WVv3DPMAv-V3aTk6ejZsBcPGkg
Message-ID: <CACRpkdZE2mtOB2BkKudQHq5-=-dyK6S2Se2hXUH+_equXhqwdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: Respect valid_mask when requesting GPIOs
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:35=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> When GPIOs were requested the validity of GPIOs were checked only when
> the GPIO-chip had the request -callback populated. This made using
> masked GPIOs possible.
>
> The GPIO chip driver authors may find it difficult to understand the
> relation of enforsing the GPIO validity and the 'request' -callback
> because the current documentation for the 'request' callback does not
> mention this. It only states:
>
>  * @request: optional hook for chip-specific activation, such as
>  *      enabling module power and clock; may sleep
>
> The validity of the GPIO line should be checked whether the driver
> provides the 'request' callback or not.
>
> Unconditionally check the GPIO validity when GPIO is being requested.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

