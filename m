Return-Path: <linux-gpio+bounces-9502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E2967328
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 21:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 087821C2179D
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 19:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B98917C9E4;
	Sat, 31 Aug 2024 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="evNko2g2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B86F524F
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725133365; cv=none; b=jEWW53GCSQSrX+Ytxl6pb2OpHuC8EEDm8KwZc1IjtrUmg4E+6SGrDszswRvP4Ny1qgWIMA4jA7mVSRBuY5Lv3cx040WNDwXX5VNLBhvj+n40eSzAIRf6IKxCd4N6maQDpr6aqDjDnzhuJJiXx4iUetmO3KtV7KRVi7SxBYkvXeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725133365; c=relaxed/simple;
	bh=wLIe4IUlr3rXOUXYOCVMEg9+vli2/fTzveuqBdE9GHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTne13dfj7u94/LhrOayb26cnEsUtDWzuKc/HTTiKbgfC2AdF/lW0k5WSsFwc2SIMUCgl2sua6vJaKqjDTnair01msC65mVZsHsF9F+U5ktiwg8zVeipw/NCOh/C6gnHfZWXNRuN6dP2i+aLZE9n8zJP36bmyfgRp+Jn+HryXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=evNko2g2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53349d3071eso3864800e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725133359; x=1725738159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLIe4IUlr3rXOUXYOCVMEg9+vli2/fTzveuqBdE9GHM=;
        b=evNko2g2iluyBiyaibAI8EqvQYl6FxrhSJqrkq2DQbaI/uak4IZ6c/045UshEVsbGf
         Ea4/82IfO0k4892XxuKHWazNEBiFsefgUdqhoCW30mypKnvk6iXb3WFXrYc3JlCQ4i6p
         HxNfmPNdOvgygFQOACwqSFqhndrYsse2BTX4JmRMk6NOc4QgAAvV9P72YpsORouDU+/T
         4seATACXIDHP5O/2AtBgZ2/4xAUif6PxqYZdhdszAEd1f9tsUoMPOIRmw/+c6bdgpcMj
         Nt20y/EXmrlwlOLpsVjNBnWC4DlczfXj34a+1LbZ+j4x3Sj7YQk4dgBVhglZ/Cfu9dc4
         LUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725133359; x=1725738159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLIe4IUlr3rXOUXYOCVMEg9+vli2/fTzveuqBdE9GHM=;
        b=O8zjF241UQ1mUAwc3Efpj6PFOeoyaPH7MOOnDh1KrXwTWnu3VhqlDq9OViAIxvQ/1e
         Lehk+mt7rVEiMlA+nDm97MMGc1n33VqSz7UooJ571CzwZ9d4Py0n8ppUvqF7edIUIz5e
         7ELstkHuVZ/nK4MGxekAw3wOjmieAp27IOj1c7u22Gp9JPJka29KBk9VpABDGv0ju74+
         rG6z8+YC0ZKv6CyUXYzDAmruV1Jokr6W3cmSF0E0+IlYSYGEVDJDyL+B6S5BsXrc36RQ
         bvoZG4hCP369LM9zH9b//Fba0aK9G0jTMGxHJNTyPKfTAjdIt2qBcWX5xKi7zjuBj00w
         z9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXawsNmnl0WyAMYmxYOylZXgDs4YkTueJh1uaLeCLhN78cJbKazLyn+Cg8gx8fnOjimM6dWQ1ppQ2ot@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf4mpFuZ2OFMIsnH5Lg+v8T2xWzCudgJ468pm/pf3PEwBsnq8f
	ofJwIFg38mfiTOO5OqliC3Rxs0PP5dMX7J91kEGjZNEaInGkSIE7EUxkNeq1+MsegIXA1FPnBWB
	QekT+vGE2LUM23VZoqmFEKJ0vUzsKl/CLlqpo+A==
X-Google-Smtp-Source: AGHT+IGXaOAaM8ATTFJLTsPQZbvE8u2JeHXS1YqeKdSi+R09vxXwvH0uDqw692B7w/bHnB+Lqul6mKznyb5hXo7yP2c=
X-Received: by 2002:a05:6512:10d6:b0:52e:d0f8:2d30 with SMTP id
 2adb3069b0e04-53546bb8cdbmr4316450e87.59.1725133358269; Sat, 31 Aug 2024
 12:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819151705.37258-1-brgl@bgdev.pl>
In-Reply-To: <20240819151705.37258-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 31 Aug 2024 21:42:27 +0200
Message-ID: <CAMRc=MckgUfDFiO+4rsVsk3zQC9P7W7K3DfDfx7t+-0z3dKhSA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: davinci: drop platform data support
To: Keerthy <j-keerthy@ti.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 5:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no more any board files that use the platform data for
> gpio-davinci. We can remove the header defining it and port the code to
> no longer store any context in pdata.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Keerthy,

Do you think you could test it on keystone to avoid any breakage upstream?

Bart

