Return-Path: <linux-gpio+bounces-14082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50799F93D9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 15:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 517711897DBD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD2621859A;
	Fri, 20 Dec 2024 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5lQq5Eb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1A215F52
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702718; cv=none; b=EUlGooMGztdCgwA91j4uSJfM1ItZSVrzbXEzmusp8/xwaA1hLBp0bKHfq5kZZRy9OFH6HTxTVQvl9C7dfzw5dNoqI3XTgMxwBI64k5sgqb4j6vZCF7X2qvBTSC5PHzoTXZ6EcjtPfvH/lofdJnJS9416yzUSK/gyozQu5M4OqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702718; c=relaxed/simple;
	bh=Kiopql5mG39LfjQkUHlAwpBzUinzcBdKBINb5tWgKVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsNkQ6i8KVoOHVBd1ltBaKOEZB9qipZ7glzHlpsOstOpWTnZ3Hr6NDDXvK9/tI2jtKqoxUkPlhgsmCGiSRvTzWV/9KTCbFmFUowz/S33yuiFoxAa8n9x4LjJVl4Ffk6YXwx22V31GQsiqW8b+UJ1+KuLKVtJyTVyqwDuPCZ9L8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5lQq5Eb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e384e3481so1701122e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702715; x=1735307515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYBFSCiCyUvyU043AbGfSFvGaAjaV7SOdDx6T/p1d0k=;
        b=Q5lQq5Ebv+hFH3KbxNSfklREX7eAv+M6AAbASV5fasIWqZt3aGWeQBpMCitysgNjup
         E0SmwjYaw7CE9Zw4nA7gzMcg9X9ha/0ns8Z9/HwFmifD6B7Fwn2gBARmH/mzehTVbfkZ
         hjn1qYF4FwCYuZXSqPti9qtVHkoZfCu/CpBdRMoXeEm41iNZeYVKWJrcvFhrq+VveHup
         c7fCZw0Uki4iB+mwrPriItU1CH588ku8Qp34tT6nbUvE2Pe4WK3wm28olqU0UI7ekvDp
         AfroiVIFj0Oxa58AhyS8l9W1si16mLWyDHm7jVkwAFu2krbUh3XXi4FTyIBd5L2tPO5T
         xVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702715; x=1735307515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYBFSCiCyUvyU043AbGfSFvGaAjaV7SOdDx6T/p1d0k=;
        b=BwE7SE5JR0CKXQ/hKnYIzOWT+KV5C0oeXYuD6bafh94BNDBXsGPJFxBKgcqh4rzDLj
         YwHI1hns+smEvxOqAchr5fLZD/0wfxlXRA15X16FP/q3h+v7YpikoIvf0oMe15l09TjM
         fK7SCu6iCNPskinOFA7QZdWlWXg3cTfv/m7JqFWpHkuQToAaraj6S541AW9jdAzYu5nl
         MHRsDlBTeJ2OJDIsrBLsZopLAFEBZPyq1jCqIoiBBI1QJqJ0pa8tbScl8l4o06fWD3QV
         kmfDyLd6RI+VOB1cjp0uHXkzV6M9sMZZgb+ODwDviCDkpvZOMVCNdfkjPmflj2HlFGbZ
         sxWA==
X-Forwarded-Encrypted: i=1; AJvYcCWGFSl5+lOYDa7kJtpmure53J5hTbaexQifNEAb7Bp6kTQf0Jspd6yboU4/QZQoEy2obdv09lj8XoV4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKah93Szw8lgjUTSqO1HeX3AtRF88f7HwN3nIFqijYqGbdSJC
	Zu9cI6zRXOlJspp7u0EmuA3z0+5EGq8Hlu8StueCV51X+Ot1LqRmtLLwvmjiHePWnI+DabE+WxM
	fMOpQW5H9zpUZCYAwe9oac1qmxZNCXU1tNJsTIg==
X-Gm-Gg: ASbGncsV24kT2ASWRGsUC8eOTlimpmhqIuEnh5Z/6Elkj63RYVHkVON223a6HwA63TC
	SDYQ7h85JqDptfwguZQXnAsyG5h4tUxZLwQK9rQ==
X-Google-Smtp-Source: AGHT+IHhIuSmiu4+8ioI5FddxI9wUmYb1zP202zwwnmqh+tea3FqXsZpqk55RmP/DtXsDzk/LJawcMCLKsSyVMIK/bk=
X-Received: by 2002:a05:6512:31d3:b0:540:1e5e:3876 with SMTP id
 2adb3069b0e04-5422957ace2mr1052406e87.52.1734702715210; Fri, 20 Dec 2024
 05:51:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217153249.5712-1-pshete@nvidia.com>
In-Reply-To: <20241217153249.5712-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 14:51:43 +0100
Message-ID: <CACRpkdaYwhy+-q=gQjT6WR9Ye8tgK6G9Pr3xzP7srxEH2R74sg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl-tegra: Add config property GPIO mode
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prathamesh,

thanks for your patch!

a question here:

On Tue, Dec 17, 2024 at 4:33=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
> system:
> - When set to 1, the pin operates in SFIO mode, controlled by the
>   pin's assigned special function.
> - When set to 0, the pin operates as a general-purpose GPIO.
>
> This SFIO/GPIO select bit that is set for a given pin is not displayed,
> adding the support to retrieve this information from the
> pinmux set for each pin.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

If the description is correct, why is this bit not unconditionally
set in
tegra_pinctrl_gpio_request_enable()
and unconditionally cleared in
tegra_pinctrl_gpio_disable_free()
?

Yours,
Linus Walleij

