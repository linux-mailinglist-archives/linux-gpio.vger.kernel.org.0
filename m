Return-Path: <linux-gpio+bounces-18816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1019A895E5
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E203A23B2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F327B4EB;
	Tue, 15 Apr 2025 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HO/S8o+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432627A93D
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704014; cv=none; b=FBotcIFsbFd3SqkquoehJo3q6vcq2vjhZzdIID1o6f8rvkTBAvhvndiZgL4TMvjlIVYYNKm7zTr+fWLjTmzZ33ftCxk2aWHKWxmGQx43g0oxls6+PapKOQPoRbI4kYL2zovTmcu18AYt0WDB08mizt2fg1lG6Bs0lIgEakm7Y3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704014; c=relaxed/simple;
	bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AebiivWb3C8K805dLSCrRjZdjlNZ2zbTLP9291PfsUrPXZDQLGbE83wRNsJvqEUPaAZvxCKhKy8BbzDsk/ZsGMwo6jpWVMCIIJjCW+mq/qNx9NQ+FW8iRDcsiivAE9HGpQyFeuqa/Y/e/u37+85360dbDW9PpXkORp8CCunJHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HO/S8o+h; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so46808631fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704011; x=1745308811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=HO/S8o+hH//VO4PFiDPmLKyG6tre9uFK5KG7a3Q8ouystAPkpSCL6JoA+2aE/u3H/O
         k8G3KxIdrof/Ml/SXK5gGXtk0S6gTqHExciAgXGIzWQcdg3JrTn/ORzHBm3pl/Tx6iqI
         bcTNuQka4j3ilQIy9lpGppcaY+kv9pTlhBlc/o7FFRWbSkKDew2eNzRPpuTHzQubyak9
         YjFhnF4StgMZTjpAHQ/DK3O9NyqJd7UeLkdy0MoNNXIh0vil3TsTtuBp+gU1F5TtLVH2
         3J2m9nnyckQXPGe2SafxAJsW1E4bKMhz3FvCF0ft59hpIs/rThokKGvTcOPnsjLBCPof
         6olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704011; x=1745308811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuiknlKiSA+WD7K8fGty1GjBqI96wU/H/9BL6EACW14=;
        b=HNvV/1g8FXdyL9SXZv5UJZa0YU+Z+7DaO0g+StuS1Ink3BkXxp3QkTeVIg+PhYLdKO
         1i/dBaeiY9IOdhi9kAmmkv+lLujpF5KaoCykwh/+50GSjLlWHLvdOJCubXE70x1TXHQu
         8y+9MIYsq3j6VP7RIesXUZ3u4BFDRWa2Vt0wFhKn6wiwIgd+T87g5pnv34fzapvTkb5a
         2tYHmPMxiwykGU6Um9VZsx5OvgwWKDEZ6+Z6of8MLojGhHmyHTKcHkBS3SEPw5JovnQ3
         xE8UC5jXqw5RS0LhUGPTQ8I9uZHkqpiY130A0ZOQJqYW8DZ44vkVK0xR1Bdy2MNZ1I2t
         YFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa2Dpspot2tMnozlrE+lxVUo4QuJCNKnMurtfq4CZ+IhbY7UIVT+dpdYIygDeAQCR6yPzz+emFhgoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKaEiNv96/2uGIR9zhxZgizGfUVw1hboyX9yRiQprpQMnuRzb7
	a6S1GFJ1K/6XJ6o5zQTWs5z6/ALHuw0m3h8Qk4uEYh782h3iPaxgGi5ZCzlOUcXfJP2YGRDzOMT
	6axwJyPR5q9H4yNGXy2YjfrhUv/PMVpu+0tdIyQ==
X-Gm-Gg: ASbGnctu5NdjYFxalyOBCzvEtyxLVQI5+Z0fej6c74+mXXj8kgo20ZbK74QQGPd2766
	ublvg+37E1/+/MfkRinaodmbjitU/4N2HBlN6AF/+u7FNc2+7D8xYKfZsDzPhQvJAQ9Jy34wN9U
	cIihiI9aj5b7/+4zWJuvMIng==
X-Google-Smtp-Source: AGHT+IHnxXKT+pyd9gBpYCbMyVQZAO7XqVpYGkBSNYSVfaaSRz2f0QOsZvZ5bl34m2PPRdwZD5oWN80iP0qENOxIShY=
X-Received: by 2002:a2e:b8d3:0:b0:308:eb34:103a with SMTP id
 38308e7fff4ca-31049a7ff11mr54687661fa.28.1744704010562; Tue, 15 Apr 2025
 01:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401135026.18018-1-ansuelsmth@gmail.com>
In-Reply-To: <20250401135026.18018-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:59:59 +0200
X-Gm-Features: ATxdqUE1-4C5Fb1JmQvyH7hBozN_RXpvZiZvSLKiPhH1VCoFIEKXbvFQJXlM6ls
Message-ID: <CACRpkdZdFhpixdhsmN=oCEmdAuabUpXtQ9RRh0cFRuxfYXJ0Ng@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: airoha: fix wrong PHY LED mapping and PHY2
 LED defines
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:50=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The current PHY2 LED define are wrong and actually set BITs outside the
> related mask. Fix it and set the correct value. While at it, also use
> FIELD_PREP_CONST macro to make it simple to understand what values are
> actually applied for the mask.
>
> Also fix wrong PHY LED mapping. The SoC Switch supports up to 4 port but
> the register define mapping for 5 PHY port, starting from 0. The mapping
> was wrongly defined starting from PHY1. Reorder the function group to
> start from PHY0. PHY4 is actually never supported as we don't have a
> GPIO pin to assign.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied for fixes.

Sorry for the delay!

Yours,
Linus Walleij

