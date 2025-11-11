Return-Path: <linux-gpio+bounces-28351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52333C4D233
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99531189EC57
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E160F3502A2;
	Tue, 11 Nov 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoAMdZ4G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FF34EF07
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857832; cv=none; b=uua3xYI9rLf1lZ737PaIl8xp7B4ZfKevdCPre1fr5NC2FmCmke6CtVeySWWqY9L8P0j7bOJS15+lhaKT+rL/+LOzxlCwgdRh5rxZl/iEDK+1mW7FOHXzaTGLagqyubui5zHt2uc8SCTrMyXn7cTHchHLrT9U+3QyzjcTbWbp13M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857832; c=relaxed/simple;
	bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAWX0a6wK2MszIDfkLEpc0v/yhKoWX1UlsHKbBPiRqJgXesSLLegU7FqzsUE8IYWduLfuy+a4sE+tCBAIk9XfoHIUUbI5mCi4dmQiS7YtOvOa4qEJlhFQ2M4YKyeCtYa+LsvixrNpafusFimsENDJAVnP1Cb4yKbPXpbp7kvKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoAMdZ4G; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787cc9de986so32040737b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857830; x=1763462630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=aoAMdZ4GDsVZXOdtQdFRhrMS2K3fyqxHTQL4UBooKSpJdPhUgkBSNYsJV6WvoT51D7
         cyxRV9vXmiA5tj54QvVnCyMyzWGqR/Hjv/oXFkTmuUVpTb0BMJWt0qQXel/hVwMDraIP
         QaAo9b+LpZvYzkZCipeF0l6LxqvcGbwbkel0tt3liCnkLeUzc1LUySbp/ITGRYfcelwL
         Mat6DeVw7O1sck6zgrNz3B+T3pEOuxgkdY6h7KZgTMtNLszAf0bFk1mLgZcYHsI+S0QS
         ZMjtGjd7B3q8FV/rN3oVtqMgYclaZCMKN6h6TrSmcZLcCOG2Pju2JP5lxRq6IngdETGg
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857830; x=1763462630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=wlqtnMSPW+uWXfIxBOncCRnyn2PCKUSP3tsYldj2GCRtmKh6NbVbqnpvaDmXuE9JcH
         ILJ/a2iDiNKolWqvd1T6MmeLSlDzqsqhTjDFaXP7hGtR5WcThnSNLVsRyZecxhqcV/TG
         bNd+L4JQSWsaQMMxL5Sb7zIKXbU+jr55mCjaRtVTJi/ccFyQiKx0eZWTYYR/rkQq2O3x
         CQ6eALLRmXZQyslj4/q8qG2g5Fh2ZuGuivVlJDQh25mzdaH9L1fWVUvTjr3CGNhZexYj
         SMV7cwYEPgjEEjH4eNMbSrVcHvRz7ddCJ/NS2Hgzt3Bhw160YKnANumEF0KFmU/NHjpP
         2LMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRw2nd3DepQpc9loncGS5okawCHesWa0OE1EWJ2kfjF9SpjIfNnw3DQIbxTgkIWgrIwyJPYacj2Scs@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJ8+mnkH/KeNwi4Wk4Vov59V65Z2Y1ZQgdiUN5Ck693Bcd4H4
	bmestKQ4miEJ+7E6isEm4F+A9rtCp9vOBxEqav0pZ2XhucTTF5cDf1b83COn6aaosRx5Sckipe9
	CMF/tLDvGk+mNM3gTyDBRfDTjo6OzkE/0d2J9apYVyg==
X-Gm-Gg: ASbGncv8FPauxSpUFbIIoTyf9Kze98YlEbXPyLrEFUDDgfDBHGP/tME3M97BaJKH8DW
	5DURB2oBsryIdFdkH1w08uQ9OsnOtyVmLygJC+EKGxyZjzCx5Zwkgd3a/iyoUFki224Yf53qofj
	wPTOPbUyxigBz6suWaah29J0/9E2kXf6YsTRDMX8b/juSgJaVOV1Nb0+zm7IQ3+Ra4kA+h8ouMp
	rxMlJwUhfgpL5vFtSJzuoMp92dhNYl6Rv4Zm5N2NvvTt6PpvsTzBGxys2LRvaWkqHGgUDI=
X-Google-Smtp-Source: AGHT+IEi46gFe2Gc58dgZGHKXPtg9MeZZjbfraM5Zhb8zF1ao1O9DUHuINeceNpyj8ML6p+v/cNPJjLoRvHJIEr4ZNE=
X-Received: by 2002:a05:690c:3505:b0:786:9774:a3d2 with SMTP id
 00721157ae682-787d5470c8emr109020077b3.69.1762857829792; Tue, 11 Nov 2025
 02:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:36 +0100
X-Gm-Features: AWmQ_bmyzwb3DdThSflgKKoxHLLAiD3IBdKLnNpObGkxmw37AFoyfkH61KGqKvo
Message-ID: <CACRpkdazzchuetece8WOJ+0D002HXhUvK6d47JmyeAauopoZXw@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] gpiolib: support shared GPIOs in core subsystem code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As the final step in adding official support for shared GPIOs, enable
> the previously added elements in core GPIO subsystem code. Set-up shared
> GPIOs when adding a GPIO chip, tear it down on removal and check if a
> GPIO descriptor looked up during the firmware-node stage is shared and
> fall-back to machine lookup in this case.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

