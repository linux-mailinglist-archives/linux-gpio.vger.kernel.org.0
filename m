Return-Path: <linux-gpio+bounces-9110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B40795DE58
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F48D1F21273
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066F01714B2;
	Sat, 24 Aug 2024 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2GHm3BY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2228156F42
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724509775; cv=none; b=RnSAM9zPhN9/j2QiqiU7Bupm9qjAAbQI4Odj1RYvj4rgpQru/vtSJJI06cKcdZ0rThXkLUB4ar0ygvqEWu93+wjXJCjjVovgxBHoBkSrnAF49R1l337+awa/01q0S4ocNDqWAZvxtNo9Yy6+HUax3EM2tl9ZDMM5PJke4ldCxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724509775; c=relaxed/simple;
	bh=Kgr5QFWK88DwlsghmM8CNchK61zBtdlUP0beg1PEIJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mr+BJf+MGaxgwxrF7YHapz7UZNkKcZ//nDf6Rw5xGwMx6hqb8Kt6VchaHwHisIyUC4AqYHYCl4JXA0hzf45LYtfBdKbNWEY+Cg+eocOjM4YtBOAiIzKo+MAlst6kdbVK3mhy8OiKBZ4hpHInP8bSjKliNSSw8aUzwN4mNlBNjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2GHm3BY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so29134871fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724509772; x=1725114572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgr5QFWK88DwlsghmM8CNchK61zBtdlUP0beg1PEIJY=;
        b=z2GHm3BYsq6hvINoGwvVsD9CAsSwKkDEUMbzJUwbXVc2wok4xhjHPb0102rO9t5pCA
         AH+wOhJZhd3nHym5JzjP42LfihxoYPY7JAzwtNK0xv9RCLQxcUrs7NgrmcBAIpLLjVf8
         BPTB6Filb4C7/78Dm+On8mukDZAxes/mRPEdaNI4f44aNMO6ZzUFptNklHfAi5zcFzBs
         Dr9ZO6sg6mp/Jm+LOO36lzYo2kJF0ohSe5UxWRiSwl3womxYCXW9eqRT5hVtC0mZSYpY
         IxixELJ81L1lL0vvFEw8gxQQFbu6hMvNxgQJyOogilN9d1V9SQl3719YqNbSCA91tJpX
         PpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724509772; x=1725114572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kgr5QFWK88DwlsghmM8CNchK61zBtdlUP0beg1PEIJY=;
        b=XwfLhygYUzDGqucQqoIhXNaLp2UQJ2JwQb0lbQcDKWbOhrDPqLAmaANZSmcTKhtdMJ
         71IhB7loBbcH8RglqSh0EuUEZGEbcWk3nN1iLfKejn07N/SPDIPb+cSyfJqlMV+jso+J
         6tkFsLYTb9AqPz2SjEVRbqogNg0ddBB0FDsZsWqcMWIPrYR1hN1zRCLvRHIdidCqTrOQ
         xkyu00e67QTKE8emBeyof3U4amw3sWTcUPs3eysjHDWJnpi4GeeEy4SEHTu1TEHEg4LJ
         PvINfxaKp6Ibl15YIBC/ECS1xbuQTXDWHH5frZrCdSBVNBjgdXkdWl1jVUuMT7lYc3Ay
         1/WA==
X-Gm-Message-State: AOJu0YzeZYo2aQdDhZrXkOXbaNfYs6J/RaDwBW6Q87gQN/eKFNpadPo3
	jJgjW6HkuEHZOMDElgPTMEVRGC85anyzJpTmZziOiSD99/0eXyfJhYHWK1yIZXXlV6m9APEUWQm
	OqAXfwh8ZSu4+bLm6Pj0HxMFVh+nbnHg0yIyirg==
X-Google-Smtp-Source: AGHT+IHx4iBgK1MDLWJ4b/4jzj04bB/xhuX8Bv5jkzR8IYygzMjeHSB5oyLzsp2sOHOz/YipmpwHBErDZDdhwluMp/M=
X-Received: by 2002:a05:6512:3c85:b0:533:966:72cb with SMTP id
 2adb3069b0e04-5343885f659mr3763465e87.48.1724509771504; Sat, 24 Aug 2024
 07:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819024625.154441-1-yangyingliang@huaweicloud.com>
In-Reply-To: <20240819024625.154441-1-yangyingliang@huaweicloud.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:29:20 +0200
Message-ID: <CACRpkdbL+6MavnDjfw=tVA152Jvc0+jbGrXxi0B-p_Dj=wVOqg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix missing error code in pcs_probe()
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: linux-gpio@vger.kernel.org, dan.carpenter@linaro.org, tony@atomide.com, 
	haojian.zhuang@linaro.org, liwei391@huawei.com, yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:51=E2=80=AFAM Yang Yingliang
<yangyingliang@huaweicloud.com> wrote:

> From: Yang Yingliang <yangyingliang@huawei.com>
>
> If pinctrl_enable() fails in pcs_probe(), it should return the error code=
.
>
> Fixes: 8f773bfbdd42 ("pinctrl: single: fix possible memory leak when pinc=
trl_enable() fails")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

