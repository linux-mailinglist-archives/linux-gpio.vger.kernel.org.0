Return-Path: <linux-gpio+bounces-6717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4F8D1653
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8E51F23145
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0825D13C81C;
	Tue, 28 May 2024 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICip0uRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696A13C683
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885251; cv=none; b=JZiAs8iyJSj+pS/y6mas2mooBNOjv2VKeKd3vX6O8AJ0adaqJ6cCLI0TxcAinLyPoWyP8XGs392nvhX6XKrwOD6BF0utGG5iYLSDzjBL5djhFrC1Wiv2RNa6mNwo32xJO+22bs5eF02xvFVQFH+HhW6gqECVAJCjL8QE5nV1SAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885251; c=relaxed/simple;
	bh=ACwW7cJHDZpXdK19RU//5+x4cTOgCVACeuCPdpb8wO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/VJb1MC2M7KUCKRIl6a4lqQO6atDSdvjxMTEGj4bOocWh39H5NOT6cqzoXR4mXGbKQ/UjzxopXwl0z+Bi6vGwVF8ExvvYALXPEfifIa9AnXAeZcITRgwWsi3uWWe/+uBthb46E6gY+U5J3rFmK3enXprhZ9GVVMlISQYcU2PCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICip0uRl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2bf5797973fso459423a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716885250; x=1717490050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BKxjMxlyw0XAlkJtEB4TwQlKN+zhIEews65jxWsW5uk=;
        b=ICip0uRlLVi86EkqoUhfCgL3BQXV3gdrDglHno9TshMPwGy+jdDDC+hSzs+DM5iTuA
         R9UxHVCi/f7lAG9YHMNlM6XreKrlndV48T1cqHcUlQ3V25H6XFUc+XIb0gl9+biPa1g9
         i9n1Rk++rVQtJfunDR9FE30TJoom0pe63J5hZ2U2S46mZ8xrww+8FTAd7o3DvPOk3LB3
         FbGtm0OI8WvHruFyqTnPgLGKlC1BwhmeaLzE+EzffLNwoaU46w5jNMfFk74wcPozYaMo
         LY+ZdvwY4gJM9NMBD6Rw8pSYd1jxsQsW5NCfYvtKp3q7/DWBvvyrB6VFKXGdKKeR5aMc
         W6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716885250; x=1717490050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKxjMxlyw0XAlkJtEB4TwQlKN+zhIEews65jxWsW5uk=;
        b=RnZOMEfv+fb/14paTQQectQGdEV3wNFPMESfjRtCE+fyYbUztdMZbxA/xDtG9KZo/c
         tpZtS2RnA+ouxDajoTJoQe+EsGrGmkKcMpYESWcejPVR/Eu0lB6rloO3Uk4kL+uVq8Qo
         XwxD9ENOdRqq3h9xkK0/6I7F6yiMNXnVzNjZ4Mfy4ZnvFK9GQQhLgdFWQltc37qMp0v4
         meCwKS8s75VKuSdH5PSl8myBIzax4Ppx52reh7F3h+LZv0S2etFBJR/cqas1qEW1E95T
         IXIdU2M659KqmCBU+Y117qM8SRbMeXRRy+pDiHyaSCytNBQXp1jhkTadyjpweMruWw4B
         C2ew==
X-Forwarded-Encrypted: i=1; AJvYcCWjQQTJ8fD+dX6KcWHfhJRLxKhLvIXS1Ruu9GhpG6T4z2NNRFpKXSwd9MColTfWZwvUwPbLg1/WTgduBi70fb4mPGVm2glsPcWxxQ==
X-Gm-Message-State: AOJu0Yy22s626GcviCY7tq6lRbaPnq30MlYVHlVG270YtSJH82BAVXWR
	SQd3re+ppeEAYMoloz3sVd+vYhGWnm0X0bDb9BLnApBuia5h8qKH
X-Google-Smtp-Source: AGHT+IH8vmv0wJSSw928SlEjx0/t6mGsatcPhdDACvZJGi28GVPgp9MTvjwqcWmZjU75FFv1B45rCQ==
X-Received: by 2002:a17:90b:fd2:b0:2b9:7a42:e3ab with SMTP id 98e67ed59e1d1-2bf5ee148d0mr12321115a91.20.1716885249736;
        Tue, 28 May 2024 01:34:09 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f50c450sm7202247a91.17.2024.05.28.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:34:09 -0700 (PDT)
Date: Tue, 28 May 2024 16:34:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3 0/4] tools: tests: fix a few issues in bash
 scripts
Message-ID: <20240528083405.GA79126@rigel>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>

On Tue, May 28, 2024 at 10:25:47AM +0200, Bartosz Golaszewski wrote:
> Fix a few issues with tools tests reported by Andy.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks good to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> ---
> Changes in v3:
> - Use $* in the message string in assert_fail()
> - Make shellcheck happy when using find exclusively instead of find + grep
> - Link to v2: https://lore.kernel.org/r/20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org
>
> Changes in v2:
> - Use double quotes around $@ to prevent globbing but allow variable expansion
> - Link to v1: https://lore.kernel.org/r/20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org
>
> ---
> Bartosz Golaszewski (4):
>       tools: tests: use tabs for indentation consistently
>       tools: tests: use "$@" instead of $*
>       tools: tests: remove unneeded ';' in while loops
>       tools: tests: remove dependency on grep
>
>  tools/gpio-tools-test.bash | 46 ++++++++++++++++++----------------------------
>  1 file changed, 18 insertions(+), 28 deletions(-)
> ---
> base-commit: 27fe10150f6d5fa78d1a1ef1e922dc8395d1154d
> change-id: 20240524-fix-bash-tests-545bf26447b3
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

