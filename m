Return-Path: <linux-gpio+bounces-11217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360199AD19
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFDF5B27764
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4503C1D0E20;
	Fri, 11 Oct 2024 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eB3Hpi8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812701D0DFC
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676207; cv=none; b=e0y2Aizj9stuZEc22bysRjxd92nOKMHjHKcT1KmTh9xYTNVpHpfCimwmhHaWYhGwGJXeT4cq4HSv1ZEyJgjSo47nFrEDPQB8b/wxXJhi5hPEwClh2Vqrb7YFYKO48HOSk60fxJG+CgAq4qLnaX6Q4JJAf0Wz9U8JUPIi4hyb1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676207; c=relaxed/simple;
	bh=6TLUf/ATlE7e2pQqOZRINjCiXODcXN1p7a0d6zE5co4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWNJ5LAn/aTdUfmEzG2x6G6wBp0mhgYo0hAzs8yyPn7RcD8qPrV29w3OG9dYjEP/1oulv9c+wp7Og/fQL6b4Sy9CMXrpSzz1rmsuWYce7I78t644xr3XmlJvC9pTRw6BhbA8MOHAEZ+l8PWN0WXgXIVqwwqawylOpTmDmSsyBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eB3Hpi8e; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e34fa656a2so8724207b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676204; x=1729281004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TLUf/ATlE7e2pQqOZRINjCiXODcXN1p7a0d6zE5co4=;
        b=eB3Hpi8eaoBRs4yvK8IwdNV2/2h9+3/chq3wrR2HybSUP+yD3rVomZsqcw7/QCP5Ht
         7mfVvEVezuUgx9rgexX1vNXaRRlSVDDnkZ+O8Xd4sA7TciUEez8W4FL/5QYxzIEVXdcL
         zhczK1c0t1pwPXSn814P8jnhxvuxT4JA8C/wfObMnZuKC8Xxl5UculmSygePn3N/JC2X
         5kQsIkKO2Vgy26MFVW1G6AHQOq4lZMip/i9uJHThtkfT/TLeVYk7sYxRf++A2P8vc2a9
         9HnoOENeJYX5yBFXmuK2DR1yO7RKCXmMG8UuRXL3x6r8uLAXOX/kJh/GPi9QJl/0uz+9
         kpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676204; x=1729281004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TLUf/ATlE7e2pQqOZRINjCiXODcXN1p7a0d6zE5co4=;
        b=DAjRomRdcu8l57ldoiXx/3w1NupGFEOsFi6yl/3WVx8bkooNu3MH6LROs8f9nkZAYw
         56M+8Xo2y+OIcfm5sOKpLAFTcJ7tSY2xJ5wiWTBn6EyXJ2ULDwSYOjaBLnqKSbqXB2LK
         O3GtyPu5BH9cDV/O0ZjOpUSTWJGSOZ4E0gn2R0S1awDZSUYGP+bSWezkJzYj1X7V8AFf
         enqLjiqvQky2e5mkHzFKDmPLlXmVlsTEWr25syqfKdRBI5cxu/oMzN1l0FhSRGdpGiRQ
         g88YOHzBRv6NkXX5fw5f+RENmq3aTX7eEbnmXEar+IwBwV7YPXpWR2uNSCYJe6d9T6Nu
         QF5Q==
X-Gm-Message-State: AOJu0YyD6DoKyvp8rv1LNp4dYjR5aaexRn3zSTIzLyjHa8h1uIV//Ed+
	yfpBxhNQNTPI+iQ22a1/kQ0Mjg7MBRvGjx40Se8IoIKN1g934G1AtqNfmtb+V0B5ZPK+FgBbMt6
	QPQ687NYgh++kKnRvRwUTdtsTkWYKEXgjRDomjw==
X-Google-Smtp-Source: AGHT+IGMYZYv3QH1p8fiIFwb3ncvr4IbqJEH0UgaRTuTB2gROCOdl+vHLGHIzDLgiZ/cun0EKg3aLWmT7ACTJR78Auw=
X-Received: by 2002:a05:690c:89:b0:672:8ad4:9461 with SMTP id
 00721157ae682-6e3644d3f59mr6143997b3.41.1728676204525; Fri, 11 Oct 2024
 12:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008162416.85111-1-brgl@bgdev.pl>
In-Reply-To: <20241008162416.85111-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:49:52 +0200
Message-ID: <CACRpkdYrLBk4yz+s_xR+7oGKPS=+BPA2qCCfDBZTAw+FprCHtQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: use devm_mutex_init() to simplify the error
 path and remove()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 6:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Destroying the mutexes is done at the end of remove() so switching to
> devres does not constitute a functional change. Use devm_mutex_init()
> and remove repetitions of mutex_destroy().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

