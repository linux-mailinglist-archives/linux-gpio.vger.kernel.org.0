Return-Path: <linux-gpio+bounces-25735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9AB48D34
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4FA3AB18D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5A12FF17F;
	Mon,  8 Sep 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrWa95Z4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD92FFDC1
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333817; cv=none; b=dxD9hkgza0LjAWl7Sk8EFzwYEjejfDQ2G/28VmhetjPCHA3oNA1CnusoqPnKPhs/bRR/1iJdrFa3XOMAJ+979RlUkHtYcZZkCDdO1N/1h5rlBfz8wv5LnJVXGxDtBA6CU44/1qSQIeAre9Nv85FWQgpT0OBZZsqTPJB1/ENc1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333817; c=relaxed/simple;
	bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwafcDcgpWA/DJaONIMo9TNN/tNlxsEMqYX5sIvk4sDiCyD0Fxgayp75nzFctkjeVkuRf8zzdfB4RZhjK0zxIC/q56eSRiMkod7giw+OYNAaVYJhDoiHINlfp0Yi3CGA46sJS99wni7ihOinPEMu8Ia7jXf4CTCLmlKLJWzwhMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrWa95Z4; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336ce4a894cso32223941fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333813; x=1757938613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
        b=QrWa95Z4MYPPnLg6ceKYFhqyMI1axWxRHnDKVhFpjQMdwPjibIdK00e5xh/iFpRu8r
         Alg6PmhxzbLE9Hb7MpBHb6OuN6AxTWFd34sEfwyZ/nWIUvyqvDCzCkuTPuxWCknWg43U
         SSECVuOGa0t9xogdY/S+XSquyeOVT8t9MW6KpMgif9sctVKlPlCbKjYtF0vwlla7GPoq
         OF5XgQiFoqChHDiSrmjhtJHdDL1ervBemjowKSOpyhaJbL56qbt/6A60x9oCc0bP2Q3i
         uLO6ayrXTuOvfQjzfgFJBJbLruYOvYO+GQlyIJzYbIsO1t3RRyl1qMzbJJGC3d1F1daU
         eS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333813; x=1757938613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
        b=Gn7RmoMn3+pq1H6W4ffwgQQ7W68NZBK1UuYa03ibYEvsHIMh14bIw0QpzTrcQfX0C+
         4FaW/HXl0TkURqltLMQbASQ1PhXuEbaeQjcWhYe0PmT+XESNoDOOs93Bb3NqgoHf1/W3
         hjYu+1jQtwFDwiM3+oo2wPvdxmraDHLPQ2VRj/dZEXHjiMfaJf8sxawJ31tSHVO/y/Qv
         YaURlSUHHmY2XAIVTlwmcGASKxn8/LzWG4DWUDvbo11leLs3pDCn98sv9wdyoOMTt8ub
         NdWzhH6e5YA//h9U5fhUgZ0EnCzYyaUhUL+vJH95TF4+86gRKpfA6RsEEtVgTGMvA+3A
         YMEg==
X-Gm-Message-State: AOJu0YxiM+RkwIqYTJukn/drLPnsk9xatRrQmCX8qFglY3aIZw0jMDVr
	uwEul2Dvin5OlZsS1VMc0lURie+BsLNtUKqUTIe06wavEsJVzBy/agIq8XrODnaFj26wgCuuXpO
	/O/0BfxOngRQHTHB5sbUNN3v4e9SsE8U2mADufWumG90BWQkJfeH8
X-Gm-Gg: ASbGncvyXE7/Xpu54SVWIKKiR/zInCL7adaSIECKVF2E46O+5hKkoTYDCXZOBn9E5FV
	9rwnVnILFb2KuN4lkH52G7cQ1UH5meyJjk8y0lKdXVKe7TlAzIcKwHYMeosXZuBlvcbm1Xr+heb
	JBSUECzY3BUkl0TzJgFldoxlbW/jwDqdlnTCPSpvExQViH9tt6S8br8osuxEwQOsFAlEKA/9kZk
	6CfRcw=
X-Google-Smtp-Source: AGHT+IENckmMCfNmV2qK6+0jQMmoJ3XLi3L/H3pMjzhD339eFASpes92o+TzXBkF1s8o7Joe/TY9zvxmOgCWc6/zrlQ=
X-Received: by 2002:a05:651c:3248:10b0:336:c0b7:953a with SMTP id
 38308e7fff4ca-33b56faf551mr21546101fa.1.1757333812623; Mon, 08 Sep 2025
 05:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
In-Reply-To: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:16:41 +0200
X-Gm-Features: Ac12FXyJyrBbHh1sBHAvKleuXhhrVW-bSepE1vsBUxUoCXy7txd1XiUFF4X_MgM
Message-ID: <CACRpkdZL=sEQxQAHByKrhxB7F+4XVj18=_M99ZBYqFG28zoW=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL
To: Bartosz Golaszewski <brgl@bgdev.pl>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:21=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This generic pin config property is confusingly named so let's
> rename it to make things clearer.
>
> There are already drivers in the tree that use PIN_CONFIG_OUTPUT
> to *read* the value of an output driven pin, which is a big
> semantic confusion for the head: are we then reading the
> setting of the output or the actual value/level that is put
> out on the pin?
>
> We already have PIN_CONFIG_OUTPUT_ENABLE that turns on driver
> buffers for output, so this can by logical conclusion only
> drive the voltage level if it should be any different.
>
> But if we read the pin, are we then reading the *setting* of
> the output value or the *actual* value we can see on the
> line?
>
> If the pin has not first been set into output mode with
> PIN_CONFIG_OUTPUT_ENABLE, but is instead in some input mode
> or tristate, what will reading this property actually
> return?
>
> Reading the current users reading this property it is clear
> that what we read is the logical level of the pin as 0 or 1
> depending on if it is low or high.
>
> Rename it to PIN_CONFIG_LEVEL so it is crystal clear that
> we set or read the voltage level of the pin and nothing else.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

Yours,
Linus Walleij

