Return-Path: <linux-gpio+bounces-28346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01996C4CF01
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1FCB18875F1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454CE338902;
	Tue, 11 Nov 2025 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwJe5B6Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C089337BB1
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856041; cv=none; b=gzBXYFVQs9MzrJ/ZiSErh6JQ8HuIZKsqdvUret0woMU7rUbuzxl3peJTffBWvhfYGyg2297zYzLPN847e2VhhHJS5Z/MKPLLfOdqz1pPH9YmDJU6wEVIQYEDLyr2A8NjXyGJbVaY5+Bsgkd0pDQx1ypCb/Gfy5g1oXklR1cnxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856041; c=relaxed/simple;
	bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+hXBbbVUbiO5tWlbnvFjJbdMT/arRkUwKyKk/beBlAcY75S7dFEq+31P5onqygBy8THOKijB68cj0IpHUCUk0dgJXcYApKKa2EHeAenEVq2QPJ3utq9KMwlUPXUDQweRBJ1cmbAld9FeYfaI3EfPMq7w/jObwanysannHKo7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwJe5B6Z; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787e35ab178so26117517b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856038; x=1763460838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=MwJe5B6Z3IGeLMOqgsNvZFEjNRHUlq982uY7NL9wNNhyAt3zn8VRJep2I/v8PObOIT
         8SwgHtTAiF6FSzh0YnA+HKuE2gnse+20y3qY1qmrkZ0Dla/+dKdVMqxpPQo8vBl65pl7
         ZdxpZtX5sorSF6912jDSaSa/URTCIKwXJRTa4L1wMdev03/GmOlJkPLiUkKuIWGIQCgu
         MI0O45RTPgla75V31QzMzwznVdkWxWmm/7d3qW/olHsUA6s3rfRuGwzmRmIsuhPINaHb
         ZO8B3XOZgcm9zSRetSfGEx8UTqkQrk/33fumhD1XtHspiwQi/PQuraNStDSVzry3x3IZ
         Wk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856038; x=1763460838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LeMwXNllT4LhHLeKTaFba9eFWNp9e0Refct3JU/EgW0=;
        b=h0H9pz87hwzdi5rWCx4KiuT3bqfS5+tr38Hw5LaNwKuekmJOCoRcCn6OnuEgttINx+
         hrSKh+i4S3SuHTyej6QUo7t+fHKVVNht7Zsxds7AFhMWfb4Gzssr6Z2EisrdHBOUSE4s
         Zl/VOhTraHw9qToblEz+w5NvM49TxfLDDO9GoeE/Wxq8jlYi9ekJarxa9oPBo9dwTXeX
         RJ99jN9UcwoXv18NE27NCER7O/nE8k6oqY91sNZJLx7mr/1mVG+VsaAdSJ24hNQhbLUk
         qZAFsG92h+Kk7q2zxGDSnOKuusCvHi5Nz68VLo8AN08aqgEleHPYcw1P1xSax2s2ie+i
         r4/g==
X-Forwarded-Encrypted: i=1; AJvYcCWk2uqRaDEg2NHwrB5yEL63UjIs1i5gVpKGFf18FyVGKDIe7vCxom1gbOSFwoPxE4m9lsxHuEGMfBsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzLijXBR4wTbcKWriRTpm2bzMouS1h4ICud0PY1U19BLiYcfCTW
	qB5S+fPrmZ5Qzgy6wjRkJkvWOtqFIpJyx5rcrS5rH/bzs2iHBGXnZeWjGCz7cLISeJQHnOVrGz9
	79Tf03RuRM5PQ9oXTgxuL50ZdXcasa9olyl+T7PbZKw==
X-Gm-Gg: ASbGnctkIQKO91qZeagfES30pnZaExobJj26ElayqMExwbMqV1kRKXxKZMfBnSXpr7i
	KZ3Kky5FXAk3CImmWf1MHIteLHSbGbTI8U3wr20cQEGWUwRyAm2CE+mS6UWnME7Almkc481tggZ
	3HVgsx+8LZkYShmueb6CT9dccsiP564uqSJJsEnW/HLF3t0s/y/BNUxzKm0Vjnyuvw41qMyECLM
	NU8oZL016mBL6/lcpBRy7SRr6rGte7lzJtToLVN7hSjSDmA0LUgh0cnydrtbPZ6y8trSAg=
X-Google-Smtp-Source: AGHT+IF9Qzu6zmE2Iio8Nz23xz7uKZaMMjTrJFnhpC9W7T174pmVZm6XJJz8JqOAQn21MLhQ4SKvuQGEPKenwCujUTM=
X-Received: by 2002:a05:690e:dc4:b0:640:db91:33d4 with SMTP id
 956f58d0204a3-640db915617mr7528496d50.26.1762856038239; Tue, 11 Nov 2025
 02:13:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de> <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
 <20251106-strewn-carport-a33a8b812794@spud>
In-Reply-To: <20251106-strewn-carport-a33a8b812794@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:13:43 +0100
X-Gm-Features: AWmQ_blovY8iar-yYYC_DuviA6U5c_hbl8gXmu0oONH393Qf8f6FhAsUxk1NsNQ
Message-ID: <CACRpkdYbcc_0=qwZgLhpTi1NNjkQ88JuOANqTqTfwMrUs_+OfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Conor Dooley <conor@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, frank-w@public-files.de, 
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 6:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> > > Got error:
> > > said: 550 5.1.1 User does not exist -
> > > <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command=
)
> > >
> > > maybe this can be fixed while applying?
> > >
> > > regards Frank
> >
> > Eh, have I typoed my own name?
> >
> > So cool. Lol
> >
> > Just in case it's needed:
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> I have a vim macro to a) save my hands typing lots of tags b) make sure
> I don't typo. ;)

Typos happen. Also for me.

A good idea is when you change mail address try to negotiate something
simpler, this is one of the reasons a lot of maintainers have simple
mail addresses such as linusw@kernel.org (which will be my next
mail address the day it is needed).

Yours,
Linus Walleij

