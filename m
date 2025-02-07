Return-Path: <linux-gpio+bounces-15514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7BA2BD8E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB8EC7A1EB2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BCC2343BC;
	Fri,  7 Feb 2025 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="anVkvNqm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB7235C09
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915323; cv=none; b=gRrmPkqdojlDavWWzno0aX0oDNBJjUJDwMF99EQSa2zbFhZWNoEfdN/Q/OND0CPggvlkqW3Ku7QXeGev54dga1jUXQRfJY6FPFGqngp2SK5Pn4Es7nZ5h2ZaB69BmP5+bhX27QdL2vaI7YDbub/6RQxbFebu1oOSPdcyEDvB7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915323; c=relaxed/simple;
	bh=wg7M3VeNI1uNtxFXFqf+8CE3L3YU9zZvMgM6VBEDA0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEt6UAyoDp9hs/I920xd9T818MtGRPVwXDPKXsSSxh3dZmCQRSmZAcIWVerwY8jFsXcf9DQpdhD/VSM4pYAd9AWjepHAG66PeIeyDgF8JKK2JQRe/Tj9pDWCkj3ZTTHc8RAxNYUer0iYePxRWPzw1eNROWEOz8K84mk71SMYX34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=anVkvNqm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307d9a13782so15005511fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738915320; x=1739520120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOAWJb2vzX94RdNhQSlGKZAFYwRJCIBEJ11rOyxtNRE=;
        b=anVkvNqmZEbGItitdwZ4ezL5cz4QNRRfxhzyQnNEUPj/570Ipr8Aj6dsPjlNr7DOP7
         6RM1fCBAZ7Dig0Ub2EafXCIXhIqVRqhRQXuy46jKoSkXCURMzZnOQpmz4kWW7yr2vu9/
         AbdKlCpXjrGVi+HZhxed75Dl9SRBgF8+Qqt46S6l9OBxU1Xd98yTu3hRvnW8AfEAGb46
         O+H9a8n1vb4PzYmoyDMoWMxX7Fm/WMbFrGj0YKCBrB8L4WxbLBk4IzrUSu+12WyZ0M0H
         7XJAV2M9iOA41kMBhyMIXKuuJ9/zGv6Uyyw7to5YAC4yFmMLtM8quCxJxehLzSwE6E2j
         ceaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915320; x=1739520120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOAWJb2vzX94RdNhQSlGKZAFYwRJCIBEJ11rOyxtNRE=;
        b=m+lXpA6V9pqX6HPPUmAJ8BWt/rwLM1gdmWnP7jxPuqQ7sO+HAlxA64OPOEQu0HhAiE
         CV5NifBgDxsuYJ5Kk/hVBsbQ0ft0Awi+CSu7n7r5cICVHm/mm37Ah5i7VQfCZhn7PFwP
         Ypthj1F40f57/SZFOsPNoAkRs1I9nvim4jR3aw/Jspz05UGNAyWIejedNkLD+NAQP2F6
         xekg+IdayjFKVVPGkagosk0W1kfnLcKTBvgPkVG2cOoouQS7VQr+CbwJ7bCc1wToinXQ
         T6Va6nGr+o/rxLv6wSSiXowSbH/p775r9P2RbaPm2049GV35BQ+n1zOXV0LZzhIf+edV
         gxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwSMGwXCieLevG/cijTEtRkIsMa8a/eVeMikIJZbBF69pr3eO8qWiKIwf2n7gow82vkt/cXviAH5nm@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWhFlYG1Or717LewCQH6GSZYKExq6IlqswzeXelgaidFLwCnm
	FUVO1MZChsir7aZjNZG/kf1fN1JeNNtjSAXwNj7CnqUdzFdz8VCcpP/628W24LS1IQzNSLay1zi
	jDvJreTXKvoUIa91xroYYQLR1ytRccIuc/UNu7w==
X-Gm-Gg: ASbGncvL425uLDR7WfwH41/aoLBM/0igh4KTzTwsltWimi1dTvJVajhYQoSGrfVdYcH
	2yj/ZJ/RLiqk9Z2lijoTxLOSM2pPzVEW0jgxU4CgjdJnLkeXzKfh6OFHnRKSufRtxtzltqs7BIJ
	R4kCYI0duNcrvssQDSOH7bkQ9/WQg=
X-Google-Smtp-Source: AGHT+IHQN7EW2uidYCyJgniKrSJh5CHau5RAsiJsPpkl9BjhCcmIHhiHYrNsdO0/XG5n25F3cY+ULx/9H3owm0JpQmU=
X-Received: by 2002:a2e:a913:0:b0:307:ce2b:ed82 with SMTP id
 38308e7fff4ca-307e580c8c2mr6906271fa.22.1738915319619; Fri, 07 Feb 2025
 00:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:01:48 +0100
X-Gm-Features: AWEUYZnnHn0Y93j7DoyQ91s-D8BeYKbpj-YuZV6sgQZrLbjP87O4U1rJxsSUKdE
Message-ID: <CAMRc=Mc+obxRPpMWNmSk5Tab6NmwM4gSzoHE8JtFf=k+u23QSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] gpio: 74x164: Remove unneeded dependency to OF_GPIO
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Remove unneeded dependency to OF_GPIO which driver does not use.
>
> Fixes: 3c7469514dbe ("gpio: 74x164: Make use of device properties")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673..56c1f30ac195 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1790,7 +1790,6 @@ menu "SPI GPIO expanders"
>
>  config GPIO_74X164
>         tristate "74x164 serial-in/parallel-out 8-bits shift register"
> -       depends on OF_GPIO
>         help
>           Driver for 74x164 compatible serial-in/parallel-out 8-outputs
>           shift registers. This driver can be used to provide access
> --
> 2.43.0.rc1.1336.g36b5255a03ac
>

Geert: Just Cc'ing you here because you yelled at me last time I
removed all dependencies. This driver is under the SPI section so it
does have the CONFIG_SPI_MASTER dependency. I think it's fine to drop
OF_GPIO here but I just wanted to run it by you.

Bart

