Return-Path: <linux-gpio+bounces-12938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E19C70B8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BBFDB2A1FC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B773E1F583A;
	Wed, 13 Nov 2024 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aznUntei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232F1E7640
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504510; cv=none; b=aapkBCHWj6cS7+7ACu+6E8Js3sHouWFo13a3Um69kssVzWyz8Ps1NAN27KoMapBUB/Tf4Mxu3OmE8xSjApO8emo6OrbuGHjsIxfNXUnnDhRR13/wjWAkIVgbEBrjr/N/VP1qMglISJkR4B1paeBmfDlUHUk7cTiEsM4vw1HsizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504510; c=relaxed/simple;
	bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+dOTmHeNLIoOqnbGjJNpCb6p6bNLLqaDORBhJLVkUFzIutOE95/mV979SW8cfDimyR+5DeVF/9NbiS2Cr4f5JkRArXS1HnwE2vgvSRVOftFJTre+TyxZfPJgjK7qAF2LGnd+MEks8Ybf/wNse3dEt1dv2u40vxL6qB3uqFAfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aznUntei; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso60974231fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504507; x=1732109307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=;
        b=aznUnteixRWDVvI6G7u+MzIzMmL7kvszPN1cd9mps46/4t5euFumMBh9pndD0vo6aB
         1mJO6Rdq0GqOFNN4jXvnsiBnd8dvBotC/oQ6b/4Rv6cmQkhXeqMzmf9l4J24wM+QYASq
         EMo44LvbVgTYIoF7I1FRXcamKXbrIKKE4kl8d0sFLNe+GF5ReXM9sGNBbXp03CU0aISn
         tiuPPWol2Jz/aCMRrU+REwwPSSHp/lglFjnMQP4r0RHdVBlYjR5tLoK1F5dP/7tw2ftP
         EVeQN69H/lBNMAsca91uABvBlrqDHdC8g1/tBeJfg0eYztYfgiDGPiwokol3w4QwWg6C
         tnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504507; x=1732109307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1iJJsP4fxx81YgiXQugBdedKb3vFmcw2IIeFVVTfWc=;
        b=BvCG7EYafDeEZnj032FrxHhvK6uzFs9zLJC1W7W4I0VUxJ4PM4rvD4ELGkXhapelhY
         3qo6WUkds4ah2Uweau9bFFdiSyc5Sxb3O0PL+6g0VWBhibx5uD2caRU0MjxgQ8CIomPX
         kUqxEfhXhhGLqJTxoo+zRQ76J+SWYu7N4njdQ29innAiMXGyxdUFlipOauUydnFyZxG8
         tdifSNwM5MBWWekMhhpvqMtNaNZNgbxZNpgLe+Yjjt6UZskD25TancPpNNysl5e2n/hJ
         2uWJOXSVnLpneUFlG9LoDBSIUiJY7AVsZj3YzIUV5IUd2WJ8SbteUmbRs4cJQZb5ApCc
         oi/A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Nl+NrE49Vt48a3IE4H/81t+SvRpyH4y/Td5IMiSZIPzyfw/72XM24jYAxY4U5iOZuCYjGeMskY04@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Ql2s1ClUQwOGQjNcpd19aBlWY4Jhq8Dkhsg8tL9qt/aZBRtE
	HkhbHdvjbKmcVTNT1r4Wv7Aks20QjcxxqOfxAaXVDRgzcX7wYKAQJv7XrzzRgAzq79Qkix7FEj/
	cnhuWXpswRsN5lwtNf6v85d7D4PqxPzPaTW3CDwMciydlBcALl/w=
X-Google-Smtp-Source: AGHT+IEkgrAvnkTJ5cspkFy9GX1VNIhsj0Q/QVeiK2QhR4qOF90RwckXKqpwSLqoIaSOg2O9mBFnXHSu7X0RYkS3Jm8=
X-Received: by 2002:a2e:a542:0:b0:2fb:4994:b31a with SMTP id
 38308e7fff4ca-2ff20128504mr98330701fa.8.1731504506913; Wed, 13 Nov 2024
 05:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:28:15 +0100
Message-ID: <CACRpkdaUYuNBANWyTcwbE2fS-STyGiV4hzOQ7rS=Q1cc2O5b6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
To: ot907280 <ot_cathy.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>, 
	Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 9:54=E2=80=AFAM ot907280 <ot_cathy.xu@mediatek.com>=
 wrote:

> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> Add register address for each pin config.
> Add the function for each pin.
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>

This looks fine, but there are no device tree bindings for mt8196?
What do you expect me to do here, I can't merge a device tree
based driver for a hardware without DT bindings.

Yours,
Linus Walleij

