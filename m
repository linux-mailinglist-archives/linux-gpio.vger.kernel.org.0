Return-Path: <linux-gpio+bounces-13960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD229F4CB8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D14A91885EC1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 13:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36B21F472F;
	Tue, 17 Dec 2024 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSFBxg0s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28081F4730
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443134; cv=none; b=mjKWDt4wo1dc0jvpgsVL71neBoh3z8OTzO5/H+uePJrBVUPevqL7rrtH2l8qAaBqDUxlr2/pKG02TwdT9jtsNocVfIKlcpGDIa3NyNS1kIA0Mzs9KcFjVAevSWVFrzbKzt6Re+TBH0v+5zoE33qSn9AZ7tqrxQDJFf/vnQfcH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443134; c=relaxed/simple;
	bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUDjl4+oJC+lQDzv7XwAN5BByIGBQmWdAgHkd39HyS2UrKyRZXI6yk20nfx1yNVeNsgJfEot06s7n1kkc21rX3zcRuXI8WBzzN/5xyQj9ZmSyg1NUOauXoQMC7gt03akuHMURukF2mm77iOXmg7PIl+YR4sE+P2ppuxWzGULqeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSFBxg0s; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5732348e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443131; x=1735047931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=eSFBxg0sAGlFzGgeweOSawIgvk70+TmjYN6ArqYGOiEU0RJSM8d0scC5wXjVNSiiNn
         JSG8kXblWz/waiO/LOio5LjxfZHPnCByrKvo3sMo0Ijv5eLn+dnsshjzeUT9t+S2UEN/
         E+SrbT2Z9/La/TZK3hrSI58b+SaRjOjVFRBdXpohW+O7AJWotv8YwykdDLdiRXgCFolx
         TIftvwFCErjf7nrYRjnQLkKRAui1++A09yaKIpwDB0GgwxU2BIUfMx05ol1IGGcKSbyZ
         Yosmfm48mYiq0VQhYXE+QRFqc2rtFi/u5GukTMORzPvK/KvgEjQe5leUhDPgnEP1aBqx
         kASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443131; x=1735047931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=pmyFC7/ddDwTiBYwYimtqmBs1R3rv8YQvLrDzLn0ugYiRwrloRMqDNGcsmANeWNf0+
         GjkdB2NNFUj3PkykLXX/t3zZhAXOMUWb8rKQdCXnVoGYKnHCGefFz9rzxr81z/vHNu3J
         C6KDyPT42O2KEfjfbM01W/9KyShlVF6+2oROeP3WxVoF+/HnXkgDqBTqlXoW0rATounk
         q7hlG1FZb5AFV5oYDmCftM93YJOIAJFVJ51KAP4qRYRkkCfZoDIIoN4nJel/OkfYmIde
         7tkZEJkoY3iuTb6eYchlBGmqR1h230L1fBUxanNNWgs9Z99AOVEmTaOEXrQTn7LKvlvR
         bQPw==
X-Forwarded-Encrypted: i=1; AJvYcCXhYbkPZyMbQUdafMveIYEx50/znPuA89i8VTHD26QuYIzol51RhIWyjYiEM2eZDwKlyBVRoItkcfTE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmg9uusxGO5wZMR2m+UWaLSUIT1N+ufhgQhmPq2RUB3QsPXAcT
	NsF6GfbiPSK4MaSrUWqlpy6iZfcejpdLN/8yRlDZeaYE8AMRTCT+NiKrBI52E68zhK9zCo6ftv8
	OiBa7SmRqhOLfSGYdqJ31R46yLcfxLMX/McQzvA==
X-Gm-Gg: ASbGncu+ciiCa0YtDZgLLNonW6KJzpem5xaxdvsJ7/ItAGEhFhd6yK6RG9z52380kxd
	tEEvbMWQh+/KgXDhSnaQkrTmY6JOlgHGRn0mdsg==
X-Google-Smtp-Source: AGHT+IFR6FlyV7xGudG0pVgEPvwRzGY//Q2aR/ufrejSiOLM3v/BAnZMkPxq7smAseJgipFLo05KDrbMR1c3Zo+kE9k=
X-Received: by 2002:a05:6512:1383:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-54099b729dcmr5985204e87.50.1734443131096; Tue, 17 Dec 2024
 05:45:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:45:19 +0100
Message-ID: <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chang,

thanks for your patch!

On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediatek.c=
om> wrote:

> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>
> Change 1: change EINT from 1 address to 5 addresses,
> Eint number is stored on each base.
> Change 2: Compatible with 1 address design
>
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>

This patch looks good to me, as preparation for mt8196,
but can one of the Mediatek experts please
review it? If nothing happens I will just apply it I guess...

Yours,
Linus Walleij

