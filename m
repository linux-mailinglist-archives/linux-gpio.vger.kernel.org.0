Return-Path: <linux-gpio+bounces-3683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589E860D5E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F908286E9E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 08:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5BC1BC3B;
	Fri, 23 Feb 2024 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pwMM3GwF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC32511E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678700; cv=none; b=MbHh2NeYKzdcQ8x74k1LEaZ40U1eLbdYpHP0ZHVFADavAhCDDOEepuVQZKXK2+SAriylLaRHNDtwAlo4O4x1UkYKgGvnhjX9GXOyZ8ataeUgf/vO73cXH8o5Ow90ppVPInCk6dKtAhMvSoF4kIi+PofPTH24rtQClKxLUN27S7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678700; c=relaxed/simple;
	bh=RLhd7qhilfOEGtRcVtu/Mz8cYidTto0DEhynq7GPsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgVrtRo1urqKC6ciSJT88VNVyiT8Csreft9jpemt9iE6bEYZRS8+SkJhQUgzMQEZIOA01/vMFV+nJtjqqaGrAKH/V72V0o0+nBiRdXWvdkK8FfTQK5y7AlOSnJxBGixvqhBFqvaSv6pZ7sSLJxoyBwo85lEkG07tJYA1vv9YulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pwMM3GwF; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-46d745c4fa6so23562137.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 00:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708678696; x=1709283496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLhd7qhilfOEGtRcVtu/Mz8cYidTto0DEhynq7GPsgE=;
        b=pwMM3GwFG1vtuJFVhPcltNmXMdwE5zK7WCSoi9dCnQ28z3kmGwKFzBu9MV3/G5U9eY
         R9AsPkinyOfrTs4IXU5hw8OnhgLOdK17N+ABixFN7oZliA39Xo6nJUY0EZE5kEXgXsjf
         juO/6nGfu3CDE9HFIet87XtXpmHwCe692W43K2OdXudRiDfGIVVQpjWarAyyrgD4PvTb
         A1H9w/Nc1ZGf9X2cUoMD8Y8zhpjJqMsO/D2/beH+6g6inCnUTHHjYmubFltYwTTMb7dE
         LNuCAwegn4F2mnK27RttctCK+zbuv9s0YMvAyeYYl277l4dY24l6zh3dKyUt7pZADsvc
         aiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708678696; x=1709283496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLhd7qhilfOEGtRcVtu/Mz8cYidTto0DEhynq7GPsgE=;
        b=DqzYC90lpWXI5lFe/2AF2Kjg4kz0PO40dx9Rk52gcR6wnG0VPu+LpStieSHP/rWYOR
         NTlwgkVuiiTiFfTCPslmaJLMaHl68NtzvJmz6f9K8jR6y3biBAiyZZD6OoV4tvxk4Wsn
         YSj5Dr51eHxmsNJsLLjIZwbCds+19Lo7xxypc2W49EgJnLf7131AtmNQgu0L3h/m03hv
         02ozaqYcOn8hO7wY+FAI749pudYlyh5CiYtV++vqtJxCtpC+XFtH8h0PaAW4tHPYUPID
         RDvTJd/kBVgDsQfbTf/I65FCIktSgxG+dM2E/mdM1qkz4PAw1xXP9JVz1I4ioj88gcl3
         7CwA==
X-Gm-Message-State: AOJu0YwphP6jZh7AO138/nMcjCCialr1nrZCCjJQF+ZFBNxZu3bAfPrR
	X8p6g4Swi4za7j9mhTBNR4filb/hD2FQ1omjBjed1HrPNu6Utvt5E/5ALQeFxrWoEYZ4FjWd1TG
	RuWFDWx1gemDE9cX2+fke7oZW3hXS8u3It+CCuw==
X-Google-Smtp-Source: AGHT+IGqMdtDrEnxt1J9qHmJj25RU9IrbUByJvWaLHbMztnXmiCKb+ttA6tN2tXEYCkSVRk4k6/V2C+1NNwDiOYjK/k=
X-Received: by 2002:a05:6102:54a3:b0:46e:e861:fb09 with SMTP id
 bk35-20020a05610254a300b0046ee861fb09mr1258425vsb.2.1708678696218; Fri, 23
 Feb 2024 00:58:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221102103.10099-1-brgl@bgdev.pl>
In-Reply-To: <20240221102103.10099-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Feb 2024 09:58:05 +0100
Message-ID: <CAMRc=MdQkO4B+-szx0Q98S3hFdM2RA9c5JCRpG3zCuy-hZf2wQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't warn about removing GPIO chips with active
 users anymore
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 11:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With SRCU we can now correctly handle the situation when a GPIO provider
> is removed while having users still holding references to GPIO
> descriptors. Remove all warnings emitted in this situation.
>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch applied.

Bart

