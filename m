Return-Path: <linux-gpio+bounces-2674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E3383F28C
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 01:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0913B1C21FA6
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44AAEC7;
	Sun, 28 Jan 2024 00:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biZnbTlH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC61645
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 00:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706401849; cv=none; b=it7ZofPgXW1Q4VkS5FCbF6OdJ+QMmcUQNL8aQ18bopSeQQoWqU4k+D5o7ROSQNKco0d0GaGsWdoCPVwod6nf4FP0Wqi6aV/W7e6mxUPJzYfyFHJPZM3/cVoLlw9EjX2QQF9Xxzkm3zm/JQC/13Z1MHKEdcGEwFw4eduzg+RtMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706401849; c=relaxed/simple;
	bh=6XeWa9wReTzghX8am264WYPfkFIN/SSiF0UBjGJ3W+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4amLRCbMsRZ4cYrKUMx3EHfrvWVXMOiflAZOuRqd1RmVTkLBqPf6ccApQmpFviwx4OLiDB1hY87jzqI7VuERZer3HZx9qatzmWxmbX04L9Ns/tUcstUBqf/LrQEyY47ZyGoEYhVujP4uCMsNDnMc11OxmF3x8UMaSKs/AP9w/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biZnbTlH; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ff847429d4so21208497b3.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 16:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706401847; x=1707006647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XeWa9wReTzghX8am264WYPfkFIN/SSiF0UBjGJ3W+k=;
        b=biZnbTlHrEq91I6Zv/G8RfPNW1HlPoUVK7+0XNmxySddAq/gZFt36KUFk6eadAF94W
         5EB3iww3ZwdX0LQrcdb7enk7WKD4j0QiAYyxIzT0DHsgHDokvrgYRJqLhZrt1GZlY9N8
         bWy+NZDuZpgVNZCd00UZht54zVSap0vff+TYB361BGlIrqqSv7FSb1eZWFFiiJY7yOXm
         1FvoTiaBg1OwrIvsbitb/SNEzUO67KY4ohMyxhhf82XDbMVLK7rL+oL2xHJskwxvUi19
         79leAfmPNqnNdaoOGuYU9PwU4wxCzzYOsJcalxucmNt1TZf63zwT+yt6ku3h3UQPv0g9
         jjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706401847; x=1707006647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XeWa9wReTzghX8am264WYPfkFIN/SSiF0UBjGJ3W+k=;
        b=NFbHZk5gYeZ+Yad9F4qjslJjlsls6Qp0WMYyUtHB/49Hi5pG8fUgxkCwZnTW6mkQ54
         0teyydmM4l3RaqCIC/Q5nNwp+1QjJSg9SN68mifAZJH1Mzy13YdWx/geCxM9MDug0uF8
         Utr23rzdzcMZojgBEYHlkPZV7BzkWim5GtUARZAhDW/g1CzKRIgq7HUSrynL3P34E27v
         MubgzYaC2hkPaRGT1tdjwYhdyKRQXMuZ5kNHakPvAxkhvgNNsKC7mvaIswPhEyYlYD2t
         eKdRKdjz3ZkMZhPEsw4Y73A/QPg7r+IQFYYCL2GqhZ8lcMWJtmMd9KpBxbXezmsoty8P
         1/hA==
X-Gm-Message-State: AOJu0Yxhojs66qyOFgWEOFGfSL7rrdExTI81BrREkl44lcwCo/Y2WHOO
	Y55/rX3aYwGXaNOXM/yz2VzgdFXi8fqk78W9ithL2WQ9vIcPRjKTvrxYlZDo0K6IvKxZmKZGdgw
	39KcljMti0/9xhjVND9behu4ryKSS5kq2svmvfQ==
X-Google-Smtp-Source: AGHT+IGxs3s4swA7aJvEB7pT6rtvh2/gd0hceFpjYEOEUxrbCgEYQOKDnDUlCO+e5gXGU0buzAnJVxVqviu2TJZaXKE=
X-Received: by 2002:a81:8450:0:b0:603:bb3a:cfc9 with SMTP id
 u77-20020a818450000000b00603bb3acfc9mr1244584ywf.71.1706401847078; Sat, 27
 Jan 2024 16:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:30:36 +0100
Message-ID: <CACRpkdaSdB1TZ9qM6YwJTExNMw1W9Rb450kt=6tJLKUixEeDSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit
 address to hex numbers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 9:35=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Regular expression used to match the unit address part should not allow
> non-hex numbers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

