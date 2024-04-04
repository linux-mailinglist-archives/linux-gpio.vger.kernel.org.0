Return-Path: <linux-gpio+bounces-5080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B489864C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 13:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375C328752B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6806083A0A;
	Thu,  4 Apr 2024 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVkYGhWF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B5D7350E
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712231105; cv=none; b=EmC2mg+jUaiHPzJkyHtA/AAraJRb3ie3AyZzEADFxfHrjoJLR2K1f4hw4CFE3vUGgvS+Rb5KepkwRCCzRVfjgYjValUEX5Xzui5NqLIItLGtpoSkwEX8skfVhyl2Aw0J0GxtuxENPRbQqBsWDvhh9R8EGeOrpKIA8j6G2kXm07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712231105; c=relaxed/simple;
	bh=/eLKtqRVMeBA+chi62xtVXaYNjNu3QL5M36nmn2NBgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsCkf+F4gxZA/CdmwG1X5/J2zGjtIOTL9Diuuyg4IjmaVUSHrJeeWPNDNwdc2rq/Tm9ZpiuZaDfQc+LnWWxaRYsWJeEwM0jEATb+uccVGVYfd9ZhWQbauzvmt2btDZp1QXYEA8r29AuPr2Hveual05RB7I3VB2kY0peimbf6HL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVkYGhWF; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6098a20ab22so8078287b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712231103; x=1712835903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdNenNQMt+7XONzUW/9kB2yS6/Tol2kmLB8BmO6OGLU=;
        b=DVkYGhWFfDN55ztook7u/m7XQt0/1DqgYEDQnuFZDO2f9sTQTLBrFr98sgJSAEPBTy
         CYDUBrddaT3BTeeVQRTNHoomuhfbL0h3ksiBLbYWOwRkpk0Tk8UduqsZI0hnh9URk3Vg
         XHCtdeiQw2W5IchOzIDCB6jlUZ/zutD7CWvoo+hqXzZS6AOTaSjDRhSRQwL2G+dVBalC
         s6d3hKXJiDE7l3BHaoYQ6gKQMhHAHA2TUjRFQEU79gotNDh5VHhpOvhyC8A+VZm527jM
         sFjPU+MfqQUo9YVqifBt9t30tT0EnkjMtQ1g4bHx2DXAQ+TsgVtqR6jiAdxPCgN5o7ln
         BA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231103; x=1712835903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdNenNQMt+7XONzUW/9kB2yS6/Tol2kmLB8BmO6OGLU=;
        b=C85nbkopG6b3GTVx40dcGfJUH9XksNEttY9MOZLZfKDb9NOEUj1WXJikEHQqbBJ8wM
         8D1AVWeQq1QANp/WHdbEb/YbZnvQx27QmF99Yv4ePC4YDxOOGoPZKsS2Q6VhFgAQIvOh
         5UtUntHpmq0LCrHBpsC0bASHbbs2W4U7PecT/U3IyxObSuT1mg+rlakCm2EoUbvVwqEv
         E3Sv9qntAYCQbvc2MWeaypNghvRKtOumiwjsO1a9LUUEaR2DH4mlL/+Tt3qubkgKS7as
         /QLshK9Mf3V1WK6/Y/14A6vwytYT1vyA8siYWsNAJzMK5dJryYuBi3hNAdwWQ3iVPp79
         atMA==
X-Forwarded-Encrypted: i=1; AJvYcCUC/KGsxyG75jogsEEGUD8flmdqthYMj3tpcFkcl/i/ToyWZYYxQXPacS3kakoOce4Jw3+rWJOjGXzIaQsuZ8u7J7LjDDf7zFNyjg==
X-Gm-Message-State: AOJu0Yz56XaspbDMRFlG8I7wPuWcf3vutcxjTT1cQ5/KDXFd9DKhpBIN
	/fn6HDdLpI1i7C5Oabj6ubXU+dn2RFCQPQ5VTCsEozbuCoK5143HceVCIbVMTp5U698JO5Bt8zU
	jZ/I6zDbits6NK6/HifX7DG8golqo5+w58Y352A==
X-Google-Smtp-Source: AGHT+IHx0tbRHl168yEBc6/WvmuxrXGfc7u38wmDLosnPzuHcIEhg0s1LVsQ751gQ9iNeQVSKkhCvmykx56Fu3EOO5U=
X-Received: by 2002:a0d:ca02:0:b0:615:8174:61a2 with SMTP id
 m2-20020a0dca02000000b00615817461a2mr2142897ywd.8.1712231102703; Thu, 04 Apr
 2024 04:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401141031.3106216-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240401141031.3106216-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:44:50 +0200
Message-ID: <CACRpkdZAuNXGyg2wwYcQG4oO9w7jPS6vj4Vt0=kqX5fJ+QpNmw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: check error value EOPNOTSUPP
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cristian.marussi@arm.com, sudeep.holla@arm.com, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 4:02=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The SCMI error value SCMI_ERR_SUPPORT maps to linux error value
> '-EOPNOTSUPP', so when dump configs, need check the error value
> EOPNOTSUPP, otherwise there will be log "ERROR READING CONFIG SETTING".
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
(...)
>                         ret =3D pin_config_get_for_pin(pctldev, pin, &con=
fig);
>                 /* These are legal errors */
> -               if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTSUPP)
> +               if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTSUPP || ret =3D=
=3D -EOPNOTSUPP)

TBH it's a bit odd to call an in-kernel API such as pin_config_get_for_pin(=
)
and get -EOPNOTSUPP back. But it's not like I care a lot, so patch applied.

Yours,
Linus Walleij

