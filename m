Return-Path: <linux-gpio+bounces-14465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE8A00A8E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121941884CA5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 14:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8D11C5F29;
	Fri,  3 Jan 2025 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RuFFVzi1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE138DDB
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735914742; cv=none; b=smxuJ15efxl5JXCO/aWs7QhysRQ0KI5X7IuERm9M/pAF4reZMX60yKDGK9A2BjgWVuYBclF4oUxYDHyLLr5JdeuS+JMudsyxlT61Dei4IqWCPgsOendGdvLlyvHL/et+jk6h5P4g1xjCsauc91/h5GP739UNDXv1zoImGmttTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735914742; c=relaxed/simple;
	bh=GMH94PkwYolFoXlV926QvU9+B/HFCNn6WV845BDJ/Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO+3kuSUVlMqvRXDrV7YlJtbXCFxqFj2ASo8lASd2Q6hKr1W3XGerk6MpyhUnhnCRiBPCsCuOqxp1gi3XxupSlEZZhxAEsJsS9wziuu9hM/RezfZlppg8C4c8XCBXeQQ74Wd5XjAIMXAVwaoYng81Xvh7IjrCE3R9optpIgN3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RuFFVzi1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so13171659e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 06:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735914739; x=1736519539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UX1/btBJ12z1ChAd+1WwUG9+MGsLbsruwkOGkqnmgI=;
        b=RuFFVzi1sipnrz5GnsHnKN8mv1GbHGDocDzco6IMjHOcmVm3eNi/gf834KWx6dSgmq
         nHDQyQErYf+zhHQ8RyZHDfN81ahWat2yiGTkhUJMaTYfC95hPntQQlYLB92YaXRWW7CA
         IiN/sXdwv4eH+VxUxlId3XqTydTHA3+jDKK5nRW4iQY0L7RRfxe/puqv00SsyLKb27vI
         nLE2EYjvFlV9auHAVf5IF7K2NJ8LIHes0pBHsxxs1abLpHump0w9hcy1y1EMnSLIWvTl
         iTCDoQ9PXwgUiRkhZJnQZUD9liJZ8beHzxSECb9VJ5Ft/7+bjrFR1jDxGBIXudTHDNwz
         luAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735914739; x=1736519539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UX1/btBJ12z1ChAd+1WwUG9+MGsLbsruwkOGkqnmgI=;
        b=f5mlajbg1NlSRMbqq9g48uuVXwlrG3XQw+6qY0iVgCxJA+mOX7IORuEUpj55f7dkuZ
         TmJXqUjLclTB70O5M6Hs1IxSdc1mMWN0HMQipC35Wtp/i/Rjl5ByYAm8NBdFUsv3qBBC
         0NGjuLK8p4kzkZZi229Xb3/Vm/kXhDkLYNPBYHny0rdA1dmLqrOt8ou1tAzshGe9Pscl
         BS5I/cgMvyZG1948srz52K5zTYbJ2StMAddmpkTk3p2Mw8Z1yA0RS9C1PB/p1oQxclnM
         fJBj5JcdZ0tM8QJij6Re2sNWK1JjnkWqShnCaGcVutdYiURgCRLo42sk5rdx5eTg7qQ4
         U0+g==
X-Gm-Message-State: AOJu0YyUXMUKAQC2XMPiF+TCmASa67coBYR//WvZ10yPDA8C67nkZqWs
	yvoBNp63x9XWokM0YTu2umP3yGWaSqtyRXE08w0wzDtOqbUkCUGFFYk6K4hAjFni4Q2Y92Lc63N
	2u6y2gN9cUXXilnVaDEAacU9AAD1cahRru5h1GQ==
X-Gm-Gg: ASbGncvZy4igk/DX+Tr8rClM2b0FzTg6+ekLxnQSbtNAW8JbHd/j+Rc5FESTiA/935L
	FfqemvR+5mrWcGUx6ldTlfJObfRFzX0jUSLHYIVzmXUf1TgdEW5o6BQY5nIiIeAhizqEa1w==
X-Google-Smtp-Source: AGHT+IFnmR2E6OBO7z/KCF2dYVzbxVB40AYrhjb5aNctwSWC/0IRQusdvS0Q84xlFevBuVkwziozkA8trR3oT+G+M8I=
X-Received: by 2002:a05:6512:4024:b0:540:3581:64d8 with SMTP id
 2adb3069b0e04-542295246d2mr11537897e87.9.1735914738899; Fri, 03 Jan 2025
 06:32:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org> <20250102-lifetime-fix-v1-2-313a6bc806c4@linaro.org>
In-Reply-To: <20250102-lifetime-fix-v1-2-313a6bc806c4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Jan 2025 15:32:08 +0100
Message-ID: <CAMRc=MfjBDbqcPvYMeUk3DBNYJgjmC2SxVQ-s260FB1s8yVROQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod 2/3] bindings: rust: libgpiod: turn standalone
 doc comment into normal comment
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 8:41=E2=80=AFAM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> This was complained about by clippy:
>
>     warning: empty line after doc comment
>        --> libgpiod/src/lib.rs:461:1
>         |
>     461 | / /// Various libgpiod-related functions.
>     462 | |
>         | |_
>     ...
>     467 |   pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool {
>         |   ----------------------------------------------------------- t=
he comment documents this function
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#empty_line_after_doc_comments
>         =3D help: if the empty line is unintentional remove it
>     help: if the documentation should include the empty line include it i=
n the comment
>         |
>     462 | ///
>         |
>
> The comment more seems to be of structural matter and should not be tied
> to the function immediately below it. So lets turn it into a normal
> non-doc comment.
> ---

Hey, commits are missing signed-offs.

Bart

