Return-Path: <linux-gpio+bounces-3052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F884C904
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 11:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C052E287883
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 10:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B806717559;
	Wed,  7 Feb 2024 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDO9i16d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FF17BBD
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303294; cv=none; b=rreR9hxT/zJBFJRveuCiSw1goYBqEs/kF35wB/5gWSVn0MD2VSvXwLrl/wZF6n/Z1xn+poYFOBq9qWZz5t1gk0shPdDcoJgGtqnXwvqSmgR7UuS7jYzyzHB7DKQRTeF7625za5/PYB06z7+CVEajATiwwGSUM0OT19ez6wWX2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303294; c=relaxed/simple;
	bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4TdH1+C7aYHeFOnlVKVa3MhU3y3hVpl8VWKzILovm4o8WROGElvpscKqfiars+cd1Z9zDXmvdIgwZSqwldxpY3LatNV7bgBLboZ0jMo6CKbYTeQrSy4y9rIHc740EENxwc8QqG70Lc29UaZeM8DRDo4ypr5yz0yjxz/ynUBiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDO9i16d; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc730e5d88cso379600276.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 02:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707303292; x=1707908092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
        b=HDO9i16dkADSVvq6bn0Sbo+lrGoZqVgEmDyNnddeI8nc1hnZq+Ja3AMz9KQ3uYYhLz
         /dccogs4m04hXV8h8p3iFRjmnsa5oOrDLB7agajpybVu09VFCRMSyGM5GEzQAz4jkTEa
         X3Xn8Wu7VTXOR+alvwQIax07jdzy/X8V3P/4U9aoIQtQafuPuqtviS2tHCs8dTP4MCaD
         0BlbgxAiNQYneX9QIZqfqVoVNV1aVZYGWgO1zIV8s5aoXVjGqJrhrzaXYnRgKY2xIN8/
         fOrvWwnvq9iDaWDiPfqqjPR6e/CWaSymQpokA6dJcZqFEjHkdip85CsKVqK/BVgO10nX
         2GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303292; x=1707908092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqRyfre6hpYKrbdFfgct1DMOhUQC1J51jmJyfuq2n8I=;
        b=F7Rs6D1cqwVPO6e6KqL7LHiz6cFgt9RYeJufua36a1cNcpWBQ/NnNxFM2l+9r+odbw
         UsAlZ/pTIzSTshHCQkiK/mUpV1UyQOyOpL1zQznPJsH6Nd8QaClAnzHfuALnL98Bh/H/
         1G6XNsPUVKYUIiH3wX28LMacJ7cBEWcaMenbMTnb2bXNfncG35xSmCJUKyfRfX49CbmS
         018iNmHw5M/XFu1xkdEF0uHCvWHpZsUB0szjPUON+SvzAI4rez6ecCiXRTNshduSfTkv
         qXjU9gTegHMXuwSPIshZBbDynPkOIFgsoUU8+8qD4y0mdWzqsE/Xej6/LOY0Zu9U30F/
         E18Q==
X-Gm-Message-State: AOJu0YwzHK7EnUcmrggpaedrO49TwQtAycER+TJOMl93cN5+DG8IoBAO
	F5iA6jpGx6rIWthl+pE4SoaQVI/xfzHCgytdLr56TUpEYXIIuUU8KHU9WmWk0h+Ye/wZi2ZL3YB
	X8sW2BRfGwvvIlhP0PhJxpDBdx6sZlsSVbJZatA==
X-Google-Smtp-Source: AGHT+IGDflkHEVBa03b1Bfl72mpon3cdcyEI04qMZquBPzXoVaoldzCLxrdhfuAGz48oB/DXRZc65MMbqgc8o/+1+XU=
X-Received: by 2002:a25:2d14:0:b0:dc2:3818:f36e with SMTP id
 t20-20020a252d14000000b00dc23818f36emr4815404ybt.18.1707303291509; Wed, 07
 Feb 2024 02:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202223454.1667383-1-robh@kernel.org>
In-Reply-To: <20240202223454.1667383-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:55:04 +0100
Message-ID: <CACRpkdb+Z8oxBa7kibHdob1qk1eVKiSm1MaY+bF442d=ztdmdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: nvidia,tegra234-pinmux: Restructure
 common schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The structure of the NVIDIA Tegra234 common pinmux schema doesn't work
> for restricting properties because a child node schema can't be extended
> with additional properties from another schema defining the same child
> node. The 2 child node schemas are evaluated independently as the
> schemas are not recursively combined in any way.
>
> As the common schema is almost all the child node schema anyways, just
> remove the parent node from the common schema. Then add 'reg' and adjust
> the $ref's in the users of the common schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

