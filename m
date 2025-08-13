Return-Path: <linux-gpio+bounces-24335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6CB2420D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95FA33B4CD4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E712D781B;
	Wed, 13 Aug 2025 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UNkkIBzL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3722D660C
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068231; cv=none; b=Lu+NRkRkRGloXEny1Eqah+36YCzGRarN6sRJtzkn8pi/S/rfYy8O3JvFV/ZM/9fREd+Ldr8LKHt3QqcO7fff9Ked6NckdNAnYpuoS1rxwk6gnG/YubJtiLOrklWe4TYAbjev3Sedrs7YkAXiuHykucoT3evMVTj771IDL5OqWjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068231; c=relaxed/simple;
	bh=nZY+cJyd3xSEmAibGwZCiYLlU/UC3MbFVcRyhQ7nrso=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=GozI4zdM6+Q64E59durcT0fmAsQ8F4DRQaK8QuHt7HjiEOs08tqF059Gkg0FoHjVxqnORQVMVrG6r1T9+LJrF2CdSSFRo4UzYGJSKuuPREScgGVUuOzKHEPW5gyQuTweXOiJdGnWNwgKSFdAEYBjcmTJtbOdFUZWXMIjtY/ugyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UNkkIBzL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af922ab4849so954948666b.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 23:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755068228; x=1755673028; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oJ4YX24n9NM5IoXYg4AOPvO7L91Y/50sfdwBHI6YJ4=;
        b=UNkkIBzLNniz5n0MUWFS6a7tePIetShL/PylrHHa+Dx7eFIj7b+MQJ6L3p7Rrdi1y2
         lmm1e9lfvqxWmQDnr66jWoiCkrgVC4HbM4JCVv/nohjeKi7jrG6NwQaez/cELNEohAkj
         foZs7sz4niNKP10yBF297OfKOV0+CCZJPr5DY2XpTB+jKYHbCvskbHKX05wlg1EyorlC
         YOcAHJqdM3zzebfqRn8cSTQ41TTkoD6r1MtkcEyr5Cizh9ZXMKFy0jTPC9jOdStWo+Tb
         +/EKl2ZP66+gBWuc7yL8hOzVRxG8qJXs6A1eGMtC12+tYN88CvSBwdkb2Xh/7ELzcmwe
         JHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068228; x=1755673028;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oJ4YX24n9NM5IoXYg4AOPvO7L91Y/50sfdwBHI6YJ4=;
        b=xVnWeLVmID3U+Jj6DJYleN7wRfAEnqlrUNWsvCjIX1cmpx77VkljJ4qqKNfT4kaRGA
         rA71TbYe59t6egiGMlHG83EfYY+5ALm7mJo7JY6DKzJ6YfRm3pKokbma0jWFTbmQBTNB
         +ScWGl6CvuQ9275Ts6pIRZVMzbObqCNVi+2GtuC6GKLthqS/N7gLOdepEIOWnT88exK2
         gi/OepVc1iK/EH+umfyXd0d2WWGKgvcyG8HaGhJSaVYZUAMyYUrYHjJJjyWG/4VbcZK/
         kOaaywtosF+ZOHYYP1XCSKwN2boj1umvIIl75wkkiy322WMPuAvfYkKNWCDThW24Guq5
         zFPA==
X-Gm-Message-State: AOJu0YzPgFzre09cBoc2zuTETCJBOsSn65gxFwKVL3ZDjgES0U0+WL8t
	gSts02tIcDkqHMQRKezCFv1X3CsH3ALCmOmV/dO3DoCCHqDQBdtKczo7zZtRm/B2scU=
X-Gm-Gg: ASbGncvIgXx1yQ6ARaFdYMvju33oryxhSOe29zdE7otMLunHG/FtytR//eA3cuUr7Jo
	lFo9xD46yQxiWgW9Vr+2IoLUFxhATKhqK/0rLrMY7UmW3CswY4MLZOhElu+OXu8/2IF4ixlB1Ju
	yRMs06cfBnKTBBxB1y/3kugYHWfMWeae6E7hMvE65fVgrmoCYEadA1VsOW6iNAqCFRh46wAnAK3
	+1G01cFHRkb7NidvMPyiR2kYoj5zBt1l6IoylR1Ua9SpPR/iAM0tvsfW/4lNSIcEd6cnwqWSVJ1
	J05o7duNZUih2b2vS4Oz8e15e3SVjhcT+cDpQyCyEB7RsJhOYV4ZhGdqO2VoF7zx51F3PqiZkDM
	=
X-Google-Smtp-Source: AGHT+IHrCxOsytx+WXwB5/yoGgUQrnTnUxIJHXkd2g6TkaABcwrA4geHt1H7eKcEcNp/tfCPGIy5Tw==
X-Received: by 2002:a17:906:f586:b0:af2:4769:8917 with SMTP id a640c23a62f3a-afca4df411emr177318066b.37.1755068228138;
        Tue, 12 Aug 2025 23:57:08 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3361sm2341711466b.39.2025.08.12.23.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 08:57:07 +0200
Message-Id: <DC13RGU9W9ZT.CZ5AF2NIEABS@riscstar.com>
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 08/10] bindings: rust: update intmap dependency
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-8-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-8-372d698f23e8@linaro.org>

On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Bump the intmap dependency for libgpiod to the most recent version. The
> IntMap type now takes two explicit type arguments for the key and value
> so adjust the code accordingly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/Cargo.toml          | 2 +-
>  bindings/rust/libgpiod/src/lib.rs          | 4 ++--
>  bindings/rust/libgpiod/src/line_config.rs  | 2 +-
>  bindings/rust/libgpiod/src/line_request.rs | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/C=
argo.toml
> index 8b719b7647910269ca2c91fee685da7fcc67feb7..d7fbe7b3669750880b815832a=
2e5d7c975ed4d7e 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -24,7 +24,7 @@ vnext =3D ["v2_1"]
> =20
>  [dependencies]
>  errno =3D "0.3.13"
> -intmap =3D "2.0.0"
> +intmap =3D "3.1.2"
>  libc =3D "0.2.39"
>  libgpiod-sys =3D { version =3D "0.1", path =3D "../libgpiod-sys" }
>  thiserror =3D "2.0"

This lib we also expose types through our public contract. But the
explcit 3.1.2 floor does not seem to bring any transient bumps of
rust-version or other libs. So it seems reasonably low-risk.

- Erik

