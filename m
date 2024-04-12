Return-Path: <linux-gpio+bounces-5401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDA8A28BA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 10:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511C71C21C4A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 08:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32C351C27;
	Fri, 12 Apr 2024 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImU1UnhZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C724F613
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908987; cv=none; b=se+qiD7oLzPFIgrXIYNL7bwSv8Ac+KKfW2wStaERCDL1nDxg8IlXzw26sYdBR2f3dENMxiJGVWNjWk0h+n/llD5EIaKF2CErq0vWSL50472GLBtesXyXhfHZZIB3jbZWERwFjPDq527oTT6+Gr6wY+ozo5RJsBp5d8KBqN6ePHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908987; c=relaxed/simple;
	bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bW+IUdVsJgo+4JVCiHm5yvvz8SLcxi8Fb+/mrvmotbz+STdqSF+cU4qth74c9SeGHBQ8ypfowiyuTe2FJkRPciWLRcp7UHxfGFixduT1X4Qgi5Z1mrXcD8x9aojbbEOgFrs6ZEj5EDCnKBvC5VQU0X56EyqWoVkW5d+MEr2Xnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImU1UnhZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso633759276.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712908985; x=1713513785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=;
        b=ImU1UnhZ2/ufccb3yzUsHb+oBUyp1yDFgtbfxbdrHFs1GwOydsjMXUnS8Kgb2sW+3Q
         y52j+zpOh+GICxPNb6G40YTu+shIpHsLlYSOr1wny73PfRqBwCwTdy+DO4VjMTiJY9qL
         izSVX2NqG4PTtxS+OxavX9kBMHgEuy2CmJbhdSghU8/rd86MVlCoCrLfL+M3hNsn1b9j
         3bA6PZNPvRveSwRovI5pjFnX79S5+gkOmKK2ne35OakGlbCCE9t5CZ2FmPkiHZAoVv7W
         aWkiqZQdRNrghu6Wm1p654K5dHYdkHZzMlsDent6VYYHCQeDxX86Es8W3oj8VFdwpKCF
         fLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908985; x=1713513785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMvckcWEuIps2ST3PWpxhiXW6z76nnxipwsXy7cbOcQ=;
        b=D1AbRvv5I7dxAnMoelm0ofKAOB1WTFNGCggZr+VlV9Bpc8AwOcsFBfcjWVoaf15AqK
         KkKETSgIzAR+iz2zXLLkxRAe8fn3XTTnJ43g+2sNAD/fCigTqf4ZD+X+2bq9tk+ivf+e
         6+0hUr7Xc4TOHfq92PHO/5nr/T6ZAduCbtrlPoS+IBuvHSXeNbibgqp2ZWUONXUcz4Bi
         4lKJ2vIlav85R54rc2hJnZOgeY4u+SABArrKijly+0Flr21FyJE91NIMNw1K7LMS0f0H
         dZ3AK/GegCLmHb5rY1+fD+3kXdHccf87kBmgBxHVPUl1OktVq4bZxS0IEkGqFEPUGGuZ
         Lhmg==
X-Forwarded-Encrypted: i=1; AJvYcCUUjAuYtx3qDHjg0cA8L2ImXjL6Ji8f0h4qNMdUp4lF9NHSpqtrsL/8hNDAcv5+arhmKw7ZyNAOlmCTp4xXA4AEQ3DjtNDRhFUTwg==
X-Gm-Message-State: AOJu0Yz7H6IXlKLiUd7XhTk/gZTQazw5ALpPKfS7oieOWjmwl70ln4L+
	VMB+evQdkr6esY4/tyi+Q5hob9Uic8ERaZ3aVtToBjZ4waIjSaxJwRop7rlp0k1B4a3o/J17557
	6VuTFzAQFonPPKUFPaLfgDbODNpmVXHRa1kM/YA==
X-Google-Smtp-Source: AGHT+IFL6N72A/DwsiHCuflyAbDg8zkwyetqZEftIvZpoI8NkVqPM1+X6exx3vuVrRm5YMeQMMOGJ9flJp9ZQ1araAo=
X-Received: by 2002:a5b:b47:0:b0:dc7:32ea:c89f with SMTP id
 b7-20020a5b0b47000000b00dc732eac89fmr1814859ybr.15.1712908985165; Fri, 12 Apr
 2024 01:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408105128.30586-1-zajec5@gmail.com>
In-Reply-To: <20240408105128.30586-1-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Apr 2024 10:02:53 +0200
Message-ID: <CACRpkdYxd2XM0Gg7DOWQHxK6c1egwcb2xZvP5QdmfC5P-8AHPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt7622: add "gpio-ranges" property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 12:51=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Allow specifying pin to GPIO mapping. It can be find in in-Linux DTS
> file for MT7622.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Patch applied!

Yours,
Linus Walleij

