Return-Path: <linux-gpio+bounces-15988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B55CA35A06
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A78188FB87
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C9F23A997;
	Fri, 14 Feb 2025 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bjs5ncKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66A229B2C
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524679; cv=none; b=grIdYOth+RwXTDdRlzpG6f/ugV3QH9mazoykDADzmgBDFxzC8tt4ckZXYW0LKfXr+VprQtvCewk9gXgFVJuM80KkKITx3oxbvl8YHB+NsaFhJd4SyxMfjdA+3SxeuDNnByuv2cIlrhr64VPNVeiPvKgNAU8K8MeD5IfYhA3QblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524679; c=relaxed/simple;
	bh=Bo8I3XX9LPITIfZX8OU9yU3bK3eSvNWJ4YAU8ADPqHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2QQCiDKSQBJwCwXT0X+h2tq9ILhyjJujqzIryWldjRL+X04dTcAnIaHqlsw6gg9JrCR7B/rgpOr5Xn6HPITO1JhsNGENP8Bv5u0x+lqx/xhFE5nzbItjy75NFmlEGb6M7SP7Df4xSwLM6scDls5ZGlGsmtpjfZ20sCvHG71pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bjs5ncKC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30737db1ab1so18741981fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739524672; x=1740129472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo8I3XX9LPITIfZX8OU9yU3bK3eSvNWJ4YAU8ADPqHs=;
        b=Bjs5ncKC0Sm1OW87CpjNqSw2atNE1VEf0oxRMFA4tGvzg4N5ydc2wbwr3sMwjiAxVc
         Gx7hXnweznrhBHH62PfsPgsu7hnYET7lcfD9ZJdPrWu0I7murs7rF1iZnutAkRXWrbP+
         Dr5zzJ+obE94fYN8q/OBFZBrg1dVzsCFQJUuXbdUN6da9ErwkfNFhm5IJvpF2lipFxLb
         HXjMRVfPVp7cE3fJzddOShcl/RzTO5ENJXBuBh9LGjF28HTXbrDGbtmV+xpX6vFUrryY
         KpO4Gc6peVPCkQgcJ9QMZ0Z7YG6YibZVSI4UZX/vcYd7H66ZEaiuKea6Td9eGupDbaMl
         J4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524672; x=1740129472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo8I3XX9LPITIfZX8OU9yU3bK3eSvNWJ4YAU8ADPqHs=;
        b=Gm7NUvtAAUQzUCw41Xn2N7/5jEbnWRVvRXNs3+GCIBo5vVSFTgrB/9RAYju4h7cOwr
         kle8Y4YrJXWURhLQPdX7ettrQOshdUkQCFQr9IkQ9AOLio6OpBU6RyBrOrRPBIe3EZfS
         3faYEgLStBWxIuJ/erIiL4mxsF9go5ETtEQ3XvjB0viW7rsGoRz6JwbeQq9js8wwAY55
         aPYvRIVJDDpxy7ID1/Ce/vvlSivvZ+0raHQwrht1DUeFKNKViyjjJowTRC3MdEWcz2Vd
         TOFobOYy+MkGWzxHDm8PBnYc74BaRA+SWY6dE0dXNo3LhfGTNFtRbt+CTrpVywSJWxLf
         OMVA==
X-Gm-Message-State: AOJu0Yxcg4cE+ZKzA9/iINYG3sBr5uz3dvo5vd3qD09f4s3t9P71HJFf
	uWw3Wj+hEAh5pfpBo0kQd+NT4PA3VP+u4Fu94Nxb1qFCaiVIonns25qugzQxA4XuOA6rF6+NrEu
	f9LbNUmVEN1/J/xxJv4+7ad5Y4Y9MEh5bmVMF+Qe7/3EPiHaT
X-Gm-Gg: ASbGncvyHL9aHfscFRntfsNPYdV7sJHabIjaGkNqNIizo2HGfow+Td1AarlOCKIUozo
	bPyIREHslvnFH6nM+TBOhio1iMd5032o6nUuG4x3isnLFBIYXRE3y2cJLGY85vx8wK8rZ95FD
X-Google-Smtp-Source: AGHT+IHU5qdxOkAv6Jae66t0wsng6vO5Xv6NqwmPurl4ZG9bzfn/Nn7m6QtQAS5dFQYWnG1i7HzkF8bimm8nUdlf/ps=
X-Received: by 2002:a2e:7c14:0:b0:308:f580:72a8 with SMTP id
 38308e7fff4ca-309037c2656mr33034541fa.11.1739524672511; Fri, 14 Feb 2025
 01:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210102353.83132-1-brgl@bgdev.pl>
In-Reply-To: <20250210102353.83132-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:17:40 +0100
X-Gm-Features: AWEUYZlcSfYNN_k-IfmuIzqakV5f_5CU2wOYEMTl8r3_lvKU6RLwUpovGzqEbF0
Message-ID: <CACRpkda9M9cPpg2_8EgbPUZ5-gqCCg=BZ47d1y7p9Uf6HKjZHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: move all includes to the top of gpio/consumer.h
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:23=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> is supposed to reduce compilation time with CONFIG_GPIOLIB=3Dy but in
> practice there's no difference on modern machines. It makes adding new
> stubs that depend on more than just GPIOLIB harder so move them all to
> the top, unduplicate them and replace asm/ with preferred linux/
> alternatives.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

