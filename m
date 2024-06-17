Return-Path: <linux-gpio+bounces-7478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9390A762
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D5561F24148
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D688418FDC8;
	Mon, 17 Jun 2024 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNphIsM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598118FDBD
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609685; cv=none; b=ButsKYS8PkYALtMXSGSsTmQXo00QkOkBqTtvI+/CbdM81GMjLLXVfBd9wvwgFMsg0FdQntw4SvKW3I9usvPnDzw47XPTEaLW48A+xV/9c286w739kSYmerpuXgoGJFxanJDjyPZe4ZbCkbLbRP6SntrYK1yuDFlZoC+etm7xWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609685; c=relaxed/simple;
	bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1OHwTHhGXYQsWs8paBmhtw7jOw9BXRYEIxIDDtqZs72EnPmUT6Rii9uEay4ZiHWBdH/nawgt2KdDRb19wK963usQf+aOI05nkmAoXa6YQv1o1XBpsMJZgZU+m6xtXaGTCWbWQ84rcF6WcJyfDjyOYLGJl5DD/dG+EwXjZ9CxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNphIsM/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cc10b5978so75439e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718609682; x=1719214482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=mNphIsM/hoVzAEnpb0VtBzw4GG0kCULFsFxvBVPMa9nu3Ay0yXAzxFcQ+Au+C4LCtl
         YTmXzI5MR5j8KUWcWkWKFuaHeM5Q6HkBhfzCNyRkETCOah3EU6esgE89oU5N7mid0WYG
         +KZCeKKPZqr+Zn2rzXm0GhPsRPZVazf81+zF8jjeojdJfpCf36RYS1v2olQTGL3SxwJ/
         Fa3OZfqJmAObPnDwnyZlZl2yWdFJJWQpt0q8vyX+ESzZTs2fp+SZzaFd1Q4/qU0D7R/+
         b3/CxuWfl4becH4m5AP3q6y32TM5c5qHJvAvaHoro1mCVQF5+RIF8e65ZB/DpJO/MZCj
         P8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609682; x=1719214482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xoq4EUAvhohkGeVSJqSuDIOlvwFj9GujMdx8Xhlpyd4=;
        b=btJ62xFfC1gLtq1lefob8GGw24fgax16C4Vzw9szrXpqWNoh55GBzwxOYRtZKSqeOg
         VMNjZCtt5R/thkCeMtbotrBQCic57TBpwl78cXjosmuVAJT2A60cNaivejTd2XRjbq2n
         G4FT1F1Nr/5Y6SjWrN+HnOau64evMfxpQsv2KKXrHjsqLRJKQ3MTeNQ96Cc+X8s6IeB1
         ZwtJQzI/AMkRe0e/KqzDAzqwk96f7ihCQ5ZZ2GWgMSiiNZRbnE10fa+EuejxGjPRKwIw
         0GUd3C7F5aY4iF3RVDFoJhL1aYxQVrbvNb3+w0e/mj1HnCcc0UQom5SErNIiVO6zCog4
         DWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjnodBlbzM9Ou6JaAqlMOtMZ3Pw/UN40X6907B0r8LphQFOvz6sdDQmy0Wa35m4kng34AUTdjrPxwr0OyrkN7Efm0RQAU1t7s+zw==
X-Gm-Message-State: AOJu0YyOujoUG9zenNNkTnverNDSIeRuqP4OmbrMX20KmSl4GHEdrIih
	j+lJtD1PpCov84MnISEGJcxEhUroGJIFA9O00C3FEVCuWM1OKPNhbwu7mapY++4UpKHIlsx1q8b
	oMW3/ygn+Ox/zxnyQ2SbpaTKDjN7UXwckTcrjSA==
X-Google-Smtp-Source: AGHT+IGqIDqoMDiWUnJbMVSGr1EJQQ4GFqNlfiC0YOW4DAh8bCGdlwiNhRqn/j5asJGjevkFUoLeA+A2JuGUQ9QeAF8=
X-Received: by 2002:a05:6512:3c97:b0:52c:adff:4bcb with SMTP id
 2adb3069b0e04-52cadff4c84mr5977471e87.53.1718609682402; Mon, 17 Jun 2024
 00:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:34:31 +0200
Message-ID: <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing
 functions and groups
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 5:03=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> This short series cleans up a collection of binding warnings concerning
> use of undefined pinctrl functions and groups. Together they make a
> reasonable dent in the volume of output from `make dtbs_check` for the
> Aspeed devicetrees.

All patches applied.

Thanks Andrew!

Yours,
Linus Walleij

