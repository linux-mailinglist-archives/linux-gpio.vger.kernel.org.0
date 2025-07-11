Return-Path: <linux-gpio+bounces-23182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD8B02424
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCE99B42849
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72681DDA14;
	Fri, 11 Jul 2025 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYUoaaE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069371D54E9
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259933; cv=none; b=P1vtZafc78Tq2KlJAZIDSH+bmuRZCm6J1cf9oIhnUqDsyEjXJU5sruYKaQ3gabRWCPX8U0qAExYBLGgao3gr50J4loJN3OlQ4pTXLwNvknSFRu3Ay4kwsU7QHw3zE9GN+E8vmlnNUxJH/sztqB7pExgASO4y6/QOvkOP2ycMdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259933; c=relaxed/simple;
	bh=GQ5fC4S1mkqPz2zMh5GTicpftwvZuHxi2EaAug21viY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAzRXUne7WaxJMyiIbk4bgDfdsbTHFm+ef3vnQ9eTBom75/6q6sQTquQx4pm0WG1uTsWp4J4Dyf8A8W8Y71klK83wvU9m9rG1impDSEtqa292WB/mGhiXHxto+kmrdkgq9kdz1yJ9FNFGjEeasUk1smj30OohjX8FtkstC26eH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYUoaaE7; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e5e6ab7b8so24029197b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259930; x=1752864730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
        b=pYUoaaE7s5OynAQAH/ehRj8upc1P3MrELvCeLvTeWe9LmthIRYlGVNU2240rJ+FGIb
         qQZzxQCXRirLxEEztEvv0Liopvr0r/wSzJuzJDvbIJY0DXauYnEX3KQgwrkDHqrrzpz8
         Z/6I5dXfJsKhYpkIGUn7lPNXjF9VHUfLwvuYGGVa2MciYZKMRyk5tWhk3o/xfqxzW2/w
         Ps6DwPi7dzioSOVPKUjJkmL9gf8HcMLvFcSvE/dOAjgjl2h3bkEq573qDLpoLqqQragI
         2GlQKVAC1ddvcgp9ET5GJBIMXJLMS1YrcViEjI7AH7iwZJBainQI8eclCO4clelcKLeJ
         QYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259930; x=1752864730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0H6HqwurK8du4Yig7CnNYD3RLplnogpWij/DKV6wnM=;
        b=acUccBG7Evxoid1nobOaPAD6seB5gwGXdt4fdWsTIXU0iWYersSoVKrJxABoybPtUi
         VaZxCOMguzNEyzSRlmOyS6xcOHj8c7JELslWxcsBcO4JkC0NJx+LmSMO+Nx/bTF+4JAn
         ePN/W35HQB+/hA/laRz/MEs85v64W7LRgY9GzrOalpCQBxSeME3jZIsTkeXGsfL/i0Gk
         u0+wpCYe2OkjPGRMA4ulBLkxskME9AxqSVbdn6/2trgU1s0wS2PTwgQQRJmRO7JQmiCq
         cR6HbVdFRfx7SHnWKVEIDSWnm0jyIR5XMBhFNmEacfOgSUogdRWS3YYnvu9Q0I+MAutB
         fTcA==
X-Forwarded-Encrypted: i=1; AJvYcCUwNTriWyl6QDuksyxGvJ6JUQz3yAwbd2oXICYlhMmvTlFK1nfu3dvySb8PUKuD8yA7lhlDfj13lVbK@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkVv3QZJ1CGwAnrlLsIAa4zJKQlmO2Kows14tRFYimZxDG1VI
	XjLjySVS4Jg+Ymu9Qxag8WSNpcGZ8jy3mD40kaZLPx7mMXWUHnIosVWE7z1PaqxdBxbWFi6HVvp
	FYJ1NZ1Tm4NDcRlIaRw+nsaui/CHrJhsL8vT3TQIbYA==
X-Gm-Gg: ASbGncv7jG+3EUxRJlqCvQsF8BdcMZmojR0EpR0FYTNIkrbkdmI7wkMG/KEf+c1tm86
	hP2a3xwsnIHFpGh4nEpSaMAbkpAlZtf8M/NM5C0t0s4YuikdgtXzfbL7joL8IErniTYex4qfSBH
	XH3FPJF5Qh7KEber8nW0qmCnbK3WKZjzC6HnaOahkegXZM0eJ9ZITOFoNd7HQzco7LpnXWD5Wlp
	v9QpHE=
X-Google-Smtp-Source: AGHT+IFufbqtAPFq7ox05U9WlMb90rIorTP+4zmeOZAsbdsvZ9oDhtS+8uVsO137m7BSFuFbQhKQyBmLxkmw/Jfm0ww=
X-Received: by 2002:a05:690c:6ac2:b0:70e:73ce:80de with SMTP id
 00721157ae682-717daeb302dmr49577697b3.25.1752259929914; Fri, 11 Jul 2025
 11:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com> <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
In-Reply-To: <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:51:56 +0200
X-Gm-Features: Ac12FXxNxgzgzDBEHJS_Xpef7MtqDivB9Et0gKV7kxfFrSfbv0PvRNxLHxkuJiA
Message-ID: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 10:04=E2=80=AFAM Clement LE GOFFIC
<clement.legoffic@foss.st.com> wrote:

> > +maintainers:
> > +  - Cl=C3=A9ment LE GOFFIC <clement.legoffic@foss.st.com>
>
> Oops, need to change the mail address here too.

Don't worry I fixed it while applying the patch.

Yours,
Linus Walleij

