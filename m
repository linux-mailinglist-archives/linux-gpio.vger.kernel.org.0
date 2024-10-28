Return-Path: <linux-gpio+bounces-12269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9D9B3D84
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 23:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7CA1F22415
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 22:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9781DF972;
	Mon, 28 Oct 2024 22:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="itz2U7Yf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AC17D355
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730153444; cv=none; b=m3K2dlCecU3hg10+vlfZFEwlxCUafqgAyV5TITU3PXZKuvgwP8E0u9v1X1XRm1b6GT1v7IeLVnXzZbkEzanOk3frgn4Hs9GD8HSTYUCXMCFt/4gN5KG6zm+gnvNCMXdAve9WGnUqT5Jqm/Uk5tYUz7UYT0Svva8Lj4D+FNrfnro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730153444; c=relaxed/simple;
	bh=0joOEVfGJ/pb/7rS6z916+AKetXgpvSwhXyT9bKzZ+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAQBuLJyFX9zV8riI5+w3VIiQqd/4nRiPN/FmQLzKjvnYo0vICh3pMy8VPv8L3jEC/bIeOmq0jJkFaFVucw8aurUFiTMaPPyNfS9uGtc080NsbtkxfvssgmuaTNLVMiHRLjyyNQmxKixaCz6igPD5OgvCRZq8z8Jq8G3XXrS5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=itz2U7Yf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so70003541fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 15:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730153441; x=1730758241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0joOEVfGJ/pb/7rS6z916+AKetXgpvSwhXyT9bKzZ+Y=;
        b=itz2U7Yf1+UO4995azvKeikePT2h8l/CNdCRiU53oe0bi5rpIA8MAnNYxyGSFPeIEE
         uLDHr1L9abNldkzfPBRN3GxmJcHtdxG4dSm+euWYw3qtHw7PskCHd2t9fQVlAQFc9ysw
         hYCeDBXiws4d6o3RRuQzf33GHFtCzDe43CRUoVxFYnao6cE3cFUxSnQpCoeeBD7oM8FA
         MAAJ8sxmEtWqvvZhkHq8Lx8PHHLcazBDi0lFInydun4/xB15jjBsWq4vV6fqk0lPbkpV
         YTU99DdzMatCBiOsenA9M0nM/01GNSZeksbDQ66ix7KsbnTCuXS0TUcehf7alfEJsTu6
         Q+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153441; x=1730758241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0joOEVfGJ/pb/7rS6z916+AKetXgpvSwhXyT9bKzZ+Y=;
        b=kUR7n+8/2o03y54Oxv5SjlcFQw9Bns5tjusdHkoAmeo31Qhv6CzoCCiuYMvZ/2qlkG
         d3N4N4Qv4q90SHFXKdL3QDU9dUTx8FFI8WUrhm+zE4YfAN9pTEjupiGCsE2O4K8iyUvE
         FXttRc/19uZxf+YtHRjqqJNcxeNQhGqmB4WG6smpLCfSa94UkZG8RiPmZSFLg+4t+PYq
         DfgKEptq66UdGVgMfuidgAuUkksM3w1DGU3wwhOSp2rqjnBR9JVcsFUvqMoS4HacrRdn
         1Ztuf1/chAjq6l/pBM+tfkLkbvecZehWqTA6Y+7KJUGrHenul1O0FfnPcEPKynz/Oo8e
         WI9A==
X-Forwarded-Encrypted: i=1; AJvYcCUay2y2NtTePl25HiJMqjAwrk9h3d84FpytVg6WODl2xFfFO75ZrTxG13wQiszkH+iOcDKEb+521Qy3@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFrPVtMlka3hD38HvhmWJfiWQGQZxvlrsYB5U1kIk+vB1nrX2
	WOAKfx8Q92pNe8eCrxoHSirWzpvHZQ2G4D7vqUnbDAlV1+n/Hj4SwTS4Tpl1KIVuY5NMf9goS2r
	BETx2+QNTr6t3nGGjcOYCqBBHV70eSkQ+RYbwgA==
X-Google-Smtp-Source: AGHT+IFgBM2WuTO54JNNNG7YiNFv9JtCLOpE6gjQUKOR7JSJXSgnKxtnYKZNWV39C8PMPul2AFWeNCFHJt3Grqjuw1Q=
X-Received: by 2002:a05:6512:3a96:b0:539:9720:99dc with SMTP id
 2adb3069b0e04-53b3491e09dmr6272347e87.46.1730153440986; Mon, 28 Oct 2024
 15:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:10:29 +0100
Message-ID: <CACRpkdbfhbtUmmE9M3qLuM8LmPDYKvZL_znVnvGqGZwSB0=Nbw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Use traditional pattern when checking error codes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 2:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of 'if (ret =3D=3D 0)' switch to "check for the error first" rule=
.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This makes a lot of sense.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

