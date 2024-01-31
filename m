Return-Path: <linux-gpio+bounces-2791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB4843B10
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 10:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895571C26632
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB5D67E65;
	Wed, 31 Jan 2024 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uycmpNzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97467A1F
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706693248; cv=none; b=M3IRLRJK/2FJ6t9MAv1HqWlGGibwxz4ZqVO8sTclOQlTOhsXTceCNlpKtROskfL33QvXk9HqO1VzwBJ3hOqkDd+o8JijOrS8DHFIaXhXXz3tXQUCLFTr1lCRxVPjWNmgDRmBIS9yLq1VxTA/KMG2LbGxucquwyu+3YP0MCbGcOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706693248; c=relaxed/simple;
	bh=APPt4cZOWHp9Y5aLfOX9xR+zR3jzLxc+ja46scvsMIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkFWuH9rERZ9pTLfOl1vAfD+sRlg7oIFKfAYXEXxDfGfxzpS4Wlk+BsGq4pNmNBtiO2S6P3sOs8pQOfl8/RlZZbUCejdUj5vvTtjVM1Q58EXCtslcsrAp5wgc5wmnMSmagzutOz47tVqmXwNvrPoboUk7HYGMJVyrpEmAb/kPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uycmpNzn; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-604055e48a3so8695327b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 01:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706693246; x=1707298046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APPt4cZOWHp9Y5aLfOX9xR+zR3jzLxc+ja46scvsMIA=;
        b=uycmpNznwNANfNR7j+Jluv0aWbpp+HyPj6OxDUGOqLA485zik22yREAY3eqPcuv+/g
         KT2X+JI+MneGBnbV36oF9n/wHyAtwx3W9rBisB08YGc2vaN5h0vTCjlHJbduYym5rYCv
         wEhCgpK1q2aaYCyD9S6uDk8tx3YDhOX7mh9klj1X2LUn8E8WuxYqXqDJ+ascM4/wQ9yN
         zmtiXccyNKV6O8beCSYDdPhf8XHeAaSHsfcD/Hh3dqZZJ8noDObbR6/P1M3pNw0tAmxw
         70OSQNO8NZAeZS6vCfJfntj7gja6hrir1rXG8sR/Q20EdUr17IHIH0CsiaCcI8ddky8F
         yljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706693246; x=1707298046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APPt4cZOWHp9Y5aLfOX9xR+zR3jzLxc+ja46scvsMIA=;
        b=m/Ric8wtrQmU5E6+/8oubxcqrZj7PQO5ydLvYO+F+XE0NjcK4Qwi5fJ4OwkofNHLP2
         NUcqdYUWRl8yS+u02QQwzlQZOzFresK2Li11noNJBn781l7cAfWq3yWhLEEF7DPJaWk9
         a4FwNmqZ1hS09AN5kfn4NOzkx56ChJmW0BfGcFPdwEN19zVdFpdzjqud7yxxjpf6dl+4
         TbF4fIhxB2kP3RlVTM2cm5ZrSn3Fz7gqoAX9MVNU11PbVTZacjejwlkDAD3Aqiv4Zcxr
         jCjb8cwOnfqvBdcEat1ERyZhzCy07+ImaHRFYuy6GCo9TYH10yp5kVT9EjXsZmStqpEG
         A5LA==
X-Gm-Message-State: AOJu0Yxe2UIZMLpnFi7Md4FutkP+AsQBKI+FOLL2VoAbCiWCAO6trsdo
	Hvh1x5cALtgkyd8YyafJhCwIIENjtRbHYm03c2MYsWwdDOq5NtoVMB5gfE89jah3XtUUKBRV/w2
	0qlb3uHgiAvwK4emMfCIcPpI49MiKmXt0UanCP5UEeVZofZatH7M=
X-Google-Smtp-Source: AGHT+IFwfB+XrMm9vx8s1WntuQFjb6GV4ib5qrAhefKc2Um6vqKn5XC9kjvOepHk5CusYf5ABhGj8I6RUX+zGhFG4zg=
X-Received: by 2002:a0d:e60a:0:b0:5ef:f83d:ab23 with SMTP id
 p10-20020a0de60a000000b005eff83dab23mr967120ywe.5.1706693246182; Wed, 31 Jan
 2024 01:27:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130073710.10110-1-arturas.moskvinas@gmail.com>
In-Reply-To: <20240130073710.10110-1-arturas.moskvinas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 10:27:15 +0100
Message-ID: <CACRpkdaxn6d2BuvKpBF3+9PWxZ2Ur-sdFoxvYRx7cwk-dJeKLA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Check only GPIOs which have interrupts enabled
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Andreas Kaessens <akaessens@gmail.com>, Thomas Preston <thomas.preston@codethink.co.uk>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>
Cc: u.kleine-koenig@pengutronix.de, radim.pavlik@tbs-biometrics.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 8:37=E2=80=AFAM Arturas Moskvinas
<arturas.moskvinas@gmail.com> wrote:

> GPINTEN register contains information about GPIOs with enabled
> interrupts no need to check other GPIOs for changes.
>
> Signed-off-by: Arturas Moskvinas <arturas.moskvinas@gmail.com>

This driver has a lot of users, so adding some reviewers.
https://lore.kernel.org/linux-gpio/20240130073710.10110-1-arturas.moskvinas=
@gmail.com/

Yours,
Linus Walleij

