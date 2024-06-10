Return-Path: <linux-gpio+bounces-7320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960B902594
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 17:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4DD2863FC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 15:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F1414535A;
	Mon, 10 Jun 2024 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mxfnup4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895513E8AF;
	Mon, 10 Jun 2024 15:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718033075; cv=none; b=mE1jOPsCvG4udg5sNHFvCtFP2K1HsMgMfvEeFmyfwaVsqx2j0aDOdWaqFW4Cv6E88ztXBj5rwDxefGny6Qu8V/hAuX2v2KK2Ky9LBPwtf7KUDm7tRJAJdUmI7Y3Kt9JgUMRsuJPH0FVvowKRjdiIsAzKu45xOb7JRAP0EhnpX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718033075; c=relaxed/simple;
	bh=q9+FJLbpkmGw2WAIUMbjsJpwfWDGBNPE/bBMMS6IF5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR7KYHa8CX/plFFzdj/V1eo2iO59On/v5R2J0TnhYZpEwgOaSc4COAsE3Qolu8xVzMpvMd8Mtadw881u1E62ceFtZc9d0RDpHpbu4YVJ9LoCC5ZS7eedaY6zG9803ZAj7wvm2Y9sor6ne4Mfr6bojBRJPlUUlKVQCU6F6IMbqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mxfnup4i; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso1681855a12.0;
        Mon, 10 Jun 2024 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718033072; x=1718637872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9+FJLbpkmGw2WAIUMbjsJpwfWDGBNPE/bBMMS6IF5Q=;
        b=Mxfnup4i74kDWNVbQalM7szw8mF8c6DVlZ9FqVvE8luECfYuGjUSPBjmNiMGHVAplV
         PeaJYDTHGpniUXnamu2vD8KJz563oEzJRYZrClMsspMxRv3Ncos7hwkjD5fgPO1XHBes
         ciABWRkqE3BR12BbWcbg8osOc4tiJXWEmkaNuI/Zi+U6/1LoWnI9FtYZyfV8opg13+8f
         /OXrBwbdXifuUSjyNCHPDePTzXbi8SfjoHFP5Zvz8ifGam5KNiuimyiZVbaShArtxDkY
         LMDWNcYA0T1aTMxJeEZrNklgKzYBzV46F70kaRJpn3YJ29FzTsYX1xGksCQzrq1qgHjX
         Mv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718033072; x=1718637872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9+FJLbpkmGw2WAIUMbjsJpwfWDGBNPE/bBMMS6IF5Q=;
        b=QQyLRb5097h+0OFfOl11TQpUz1WjDtyRSRRD/g8jgZ/sbd3lA/Bbxg7sLH5d5V5Tvq
         zrIcHAC9pTAIcZRO2ybNoIseFIL7QOdOV0ZE2+aRSKjKUfV/iXUB5X8rg6laDjscgmiM
         wNN0qV5I80bHybfO4YhEaHeq7ahDFSu/0WZxLrR8zbp3Ki2wk0yn78oGyOXdG4CaT4Q/
         cJiwa3cv1MUg5E3FarUg+tKMcdkBInRoIZDjKosjlndMRQJUP5CXKl/rtqdKAeWC0Yqa
         NPHgO5uuv1DQPozobW1sShwZP+xAJ3SmywqCWgJF80p2LItlXq42v75i/Gf64CGTDpC4
         TOAg==
X-Forwarded-Encrypted: i=1; AJvYcCXdkJiWH6wNavrdUtwsT2SbUmcLPBaKWXF4PojIj+kpBUKYBJ0YoPo8LkVRQuaosLakXTIPuEkRovR0n2rfani5mbjxW4qkez3ArvHskjwEVJTxRJX+GxoncL3AOnxIKGZ4HQ5rvnVJzg==
X-Gm-Message-State: AOJu0YxuhiraIB5321EdhhiDsy5uXAYH+M5csHmVbYiWFiWNGbLtrcla
	RatST1sE/bCV1dCLjDm6BK8sc5VM6f92z2V1oO5Opxq5GHK/+KMCEZeMGRsMrrMB+ypggvhLg0z
	1usUOv3v8+tSUW/2GmzXgy3XQmWYD3HOb
X-Google-Smtp-Source: AGHT+IFNyQ15jXyjkoVZr6dT7/WR+f/DHHqul6Tv80j455lbaX93ut+WTVwOmCHosMzgej2TJF5rkgJv+/hwOZox0lk=
X-Received: by 2002:a17:906:fe07:b0:a6d:b66f:7b24 with SMTP id
 a640c23a62f3a-a6db66f7fdamr753842266b.75.1718033071698; Mon, 10 Jun 2024
 08:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610140548.35358-1-brgl@bgdev.pl> <20240610140548.35358-4-brgl@bgdev.pl>
In-Reply-To: <20240610140548.35358-4-brgl@bgdev.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 18:23:55 +0300
Message-ID: <CAHp75VczROHVKwAi8j4fxR=L3oKJ_5om6rEAriDNFxh1dMRxRw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: sim: use devm_mutex_init()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Drop the hand-coded devres action callback for destroying the mutex in
> favor of devm_mutex_init().

All three LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

--=20
With Best Regards,
Andy Shevchenko

