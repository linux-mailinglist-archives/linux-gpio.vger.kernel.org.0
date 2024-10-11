Return-Path: <linux-gpio+bounces-11216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDF99AD14
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA26282A8A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC81D12E6;
	Fri, 11 Oct 2024 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2LSqeHN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF31D0E2F
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676130; cv=none; b=Ce+LUUNlT/XifUvOZN9uN1wYW+V3ngULiZC4zxbQyoV2d+x7TSe3OC3G56prH6qaqgeulrSzty5W/XNzkTyPfzPNCpiLERox/+RD1ODr5Smf5OQffdHC/vKMqLPSxzIgz3jU5R1STRCCCDC7dPtxrmZ+J9EisuUQ5LvoAYT6qsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676130; c=relaxed/simple;
	bh=nPrrWFEkh/n2rwW9DN6U89zucgrkrCgU+Jm4I59wVB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5SZBwpplRtsrFVS2ka5hw2uIs5lfAQjwqoqxlp0AvDUZ2U01aHZJPZHnUdfHcxltqm6yM8zPyyKpf0ymy+ViLHV7LcujKbjKmM7cKJnCF32TAa3PB4cEaAS9SRY2G7fBvVduERJXPqW+sSthpBV5xGKsHA+B9CVl6fl5Qu+WYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2LSqeHN; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbc5db8a31so16977947b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676127; x=1729280927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPrrWFEkh/n2rwW9DN6U89zucgrkrCgU+Jm4I59wVB4=;
        b=l2LSqeHNrPE8sEGGeFbmBXTt2+BCxSfXWqfmcyRwfoWpuCUCGvJZeAVYNvR+ykUqCo
         b2iWibJH9z/PuViVNVrbkz3JsqsDTpapSVPLE4xBFVOaYhlWzpKTa8U04uVFtpMYqLye
         vMUQUrsNIF+4QW7XJXkL5HJU53ajZZrtPxQwgoEooi633B+bLzgJw2iSWpgle8aiJ0P4
         xeEmAeUs/UicS5gbtoZrj1dU6xARWJVxoiFziGx/Dfd+/c5ZLUlMYr2gzX48si58AN1W
         HMzDT9BSoJEvswGkJqwyhG1HHR4/0TGYmtAys+Tfc6Wd2BeMpQY/++pvLue6LyrFVmNF
         GEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676127; x=1729280927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPrrWFEkh/n2rwW9DN6U89zucgrkrCgU+Jm4I59wVB4=;
        b=gFjECHa4WK8jx8Ay/U7tPki0XyCDmriKGHg/KZgdmlJ5kyGHj8iL4VGfnpnqtDfhYA
         6NlyPvxW16kIxWAcRCRZgy6uQD9cZ6n8sAMaMJq2bDNyqu4ilJAHO5iDEgZ06QL/NuJD
         hyWOKx+5978HfRow8CISw3yxBXtRA3wpmElSNjzZwjOWUdSfDLYHtf7j/8k5dyVq2k3Q
         GNhJ//CCbtWLEtdGhwLeA4hMa0bAwmC84tdKvsSz+fIWxVKudamyGMcAx2hjTHmSky5r
         Gjl1Zfwsc1WcMaqm6KmtIpts9pzjAf0gEnjGILL2shPfR96Apg5jRkF18MxPdyl03fBt
         pFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzLnNOvZwT7R9e6Y3JQ/9P/fSN6oXA8b+qzmiSJbwdxvTSdZFUjOxhrN4eeFoOT+SGSwPU6bltu3v3@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEq5tUYTCW/3p6IS5iXliUmnZ+p7xDUfhPRuoGxa7IFUkjlBL
	Y0AjxebiNatvnhVg1NidvsTnlBL9qlGkTyNPoz0gmNtun9gay1yBXXDQXOz1RmijmWDeAkEWxvy
	/uPxW1XC9MrfzFUUkFHB8Yo7ceppaCdnSJuCq3HP305xZ577Fw/g=
X-Google-Smtp-Source: AGHT+IGcgArKV9Ezyx2JxXIT5g/tpC2AAQqsWGKx7COvsSQwXw4Ct7g3+6rTQ0Ix418MqQv3uMJC5A57ho9IASI8Obs=
X-Received: by 2002:a05:690c:7442:b0:6e3:1d8c:1224 with SMTP id
 00721157ae682-6e32f29c8e7mr61767057b3.20.1728676127524; Fri, 11 Oct 2024
 12:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008081555.23465-1-brgl@bgdev.pl>
In-Reply-To: <20241008081555.23465-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:48:34 +0200
Message-ID: <CACRpkdbO6cQL37DNozuePACe5nT-DWgzrrBN8SLEYzrFrJKXPQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: drop dependency on OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:15=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver doesn't really depend on interfaces from OF_GPIO so the
> Kconfig dependency can be dropped.
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

