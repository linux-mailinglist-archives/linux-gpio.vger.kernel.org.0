Return-Path: <linux-gpio+bounces-24764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE599B30079
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 18:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34361170A79
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 16:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFDE2E5439;
	Thu, 21 Aug 2025 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXAUBzTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1992DA767
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794897; cv=none; b=PwzeYJHk5T4boaOsahx04z6p1btobbNDyahohVfjM2FaPAviKjdNhpSFvQVX3k09jWfNn1RZ9erQcgQFyWtA516O4+c9pns1BdkjLbRZ2Jdr6eqWczYtQ2cP0nUIqxtnxtwMwjF9ODBigupZaY/7bfwJkfFkBqVwksv0OjRvP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794897; c=relaxed/simple;
	bh=JjgaMxWJ9qbUm0986PYJxcTgcZRuZyftO3FNY5Np63E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXaIOKQThjaENggMoVUffx/J/K4E3c5QqTMYH1T4drlFj0PbiOnMPV/+mwpLJzZk7nNcIRMxDRZoJMTQiqlzesHP/hnmu+jpegijfoUOoR6hxi3D03qRkHY9f3JqLT+UWjKd2PlxwLu3Ju+DT0UuZY3WVqBJRjJI36Ody8sfr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXAUBzTt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce5253a57so1287050e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755794893; x=1756399693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjgaMxWJ9qbUm0986PYJxcTgcZRuZyftO3FNY5Np63E=;
        b=qXAUBzTty/1Y3VZQ8f+s0JBk9dZnF84hMLcKWS/ta/DGSYHXwPzAmzuyr5RURVS8jU
         NS/QUOLBZ+KmovR5FA3YWhXrlHzZIibRR/gMASYqtQVHsU6i+hDGSg6/mdkKreBI7lfs
         DC9tSc7b+xW0IRt5K9AWLwn61MDhIa5UOER8wTPwNd1+kD5d/1Jkmh/p9hopa4iUoBXM
         6G3sYULdSj0obmTvVkafQRDQMmHZKREJSZv3Y4J+lRLyRmyB6Vf5JlJvoTlaLgHORI+E
         so5LdAFQkTevhccS6NnikkMCawP50VIq5aJCGE0bY7lhqC0PWRd9nqXXUOKazATDY8SG
         Mpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755794893; x=1756399693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjgaMxWJ9qbUm0986PYJxcTgcZRuZyftO3FNY5Np63E=;
        b=hd3WO0QXRvo1dhJDgpf+KJmGr9xymJ3vxaG/aJBrv4BaaINDPD5+QQ0y0/slowPVSX
         MhwVdr6eiEdKXeST9DaNn3MQkxYPvWPN6Uag7GAYrw28M56VT3BaWzzUqpso+taJjW6z
         iKH1fd+N7YLpeLwie/w0qRbhAzTzQk8dtVgaIf55UBZGuS3vZ9tTOZed/D1ySVNZ67vm
         inJ5AYvX6FzF3u2x22MDo1TNR73fuT0oXZW5Zk07LjSgQxVVJdHcqhLazoUSJ/9vWBJt
         6nd2O5hEAKe86fIUlzf9hK+JA2H6gCcuVLXtFy1kPhbsCJsk/3tZ/cpXmccNSs2ceTkA
         pJag==
X-Forwarded-Encrypted: i=1; AJvYcCWdA7v6V5MMLDf9SLHm208fOC1Vc0D9xGFtPy8rhVNa6oSI3PexgvSnOS3kJPN3vLDsOgByPXD8fWSR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrx6xUfDwZE6AojxmuUlDGduc4PMoVtFM72lTIYx5wqyXwHv/n
	JHc+fE2POA8/COJY3+85jKT4pszivRFU7UXcRNCxKHbjoX04o/yrjfMJOpuVfoYJ1M8VS7w2EYQ
	NSpwrXQaGqYZT0d5R1VJHLHu1YK5N1jiF+EdFrNqDsQ==
X-Gm-Gg: ASbGncu/RZ1wdckojqPIhqmHy/idGHyI3qfP99GJ/siE7WLcK7H929J3ufqzbT8IcKn
	Do+3T13a/oL3S/AbarR/sqQRUGGKrv2vAWj8xGCo5ROyYPYXNflhu0hd78TRxpLrlELXuBXNLoc
	Rfav4vPrBDAtMWoE1c6tWXxbDLqbUKHZ4nvFIBk+GIKReyAUWh9wf+0wQho27VS4wx+W3gPwv5n
	52H6X8=
X-Google-Smtp-Source: AGHT+IG+3TRj8voJKTnwJVWxrL5l1oYpH/bU0LUo3gd5FaJMEzvePfb3DMbpBjz0hjYrM3LeuxGGpWK2HuDJsMGa8c4=
X-Received: by 2002:a2e:b88b:0:b0:333:fa8c:9aae with SMTP id
 38308e7fff4ca-33549eb715emr9619641fa.18.1755794892780; Thu, 21 Aug 2025
 09:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821101902.626329-1-marcos@orca.pet> <20250821101902.626329-3-marcos@orca.pet>
In-Reply-To: <20250821101902.626329-3-marcos@orca.pet>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 18:48:01 +0200
X-Gm-Features: Ac12FXyF_gVal52SyMhu7-iG4ESsRyyY1LZkPXX1dXgmWEJaBoPIOjMINHQJZMY
Message-ID: <CACRpkdbego5WMzPV=xixkfM1gfKoULxXLgfDiEXpz2dQUgw5ZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: vortex: add new GPIO device driver
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:19=E2=80=AFPM Marcos Del Sol Vives <marcos@orca.=
pet> wrote:

> Add a new simple GPIO device driver for Vortex86 lines of SoCs,
> implemented according to their programming reference manual [1].
>
> This is required for detecting the status of the poweroff button and
> performing the poweroff sequence on ICOP eBox computers.
>
> IRQs are not implemented, as they are only available for ports 0 and 1,
> none which are accessible on my test machine (an EBOX-3352-GLW).
>
> [1]:
> http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_Refer=
ence_091216.pdf
>
> Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>

Wow this driver got really compact with gpio regmap!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

