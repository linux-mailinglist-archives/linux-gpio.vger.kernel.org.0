Return-Path: <linux-gpio+bounces-25323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D71B3E454
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2B017AA38
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84701DF751;
	Mon,  1 Sep 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVE+raH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E418217A2E6
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732299; cv=none; b=X2UxIzGF9jrA0XI9QevOyE5Ftzta4Dm0y/IkZorOO0mDpgZK03+CYe0VbJUJigYOByiHVNRdvomDMdzeEhhZpVipxtGkGw5q0WDm4OV6DP6npPvNKuJ5N3CqyYSrin9098cPgkKAYobxsuw7bcNEZOkEcDNXESC9mvIErsORcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732299; c=relaxed/simple;
	bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j++2Rdo4dDUdYGBz0vdfnlAMcgUShaD/Y+aurNpIJU3A+JH31TwURr29MEc1qhuoxcb6B1wxghAp88hAI+5qIw22D+Idf5FCuIolzXKJsAAPOdwippUWFQGVd14FO0reTYOv023yr8kayWOyMz0qH6KJbejPqjTpBWGATzDCsbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVE+raH5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so1967322e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756732296; x=1757337096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=;
        b=jVE+raH5W4w3/+ewfdBBbCYw0l98atQRkgjDtidnGbysDP2Pyi4HkQ0BoReQ/hgbqK
         nm+FrFgbt/tdN8nFsi1JxDK+/pC15i1XYtRO1Yp4PwS8p7S9DyR5jIFX0CujYWwVYu/e
         Noxrm3zCcucDeFuBkSWI9z/ckEZlt8RQUlp7pTzZ+BgYWOf6UW/sRMBzkv2uv62+Q7Pd
         E2r4MtFfeeDlzIPqP3tWuJvxr6E+3i//oKYlVSXaIsaFpzfDu6XvmnXZ6xeKo0nEZAoc
         pULBQE9cEzNOj3WNwahS5o6pAdCmh3Ys6xaDHnVrVYGLV9Si01LMWEJ2pF4L2K68dHfn
         cWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732296; x=1757337096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1/2ukhzETswBvigFCZUS4xPD90/kXRG6GUxtAy8yc0=;
        b=G2vYP7cCxviG2TaREap/xHmkNtIv/EKcODHfLv9Sxg5JLX0FQz9VaYKNuz/bCmrtt1
         0Cjnhb5RbhpM4enxWshSXJ4pCd1SAN3TzuCFgazA6JXfxQb0HeigkWVxyQW28T9lc7z2
         PgSY9d/+0RhKjiSUnG8bn8wQRxbBPeSI7f8MlksshNF6jlO1DeLQ7URP1b1gOaSVGNQW
         otyKBJZ5YSc4BtObwWi4uPvnpa/G2xKCkgMO5hx2pWzp1Q3Af6kkD4v/MxCjf4JfhwyG
         YhJZ5GhESUShz9FgDpuEFQ7CzI3o2kWeq00bVTNvL4wmlWMYTqu75O8e9dpT8FF5/kvP
         Vkyg==
X-Forwarded-Encrypted: i=1; AJvYcCWXSymuxhIMhtZsyeaDW1k/iFX4NuvaZvodv0DWURcXn+3BIs1nvnPBH5j5PXkxl+tyIg7T+4Bq8oPW@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqFAxxgsSWCpGNUm+eyOa6YOpoMgPycENFPhTZqJPe1A9Uonu
	on0bJbTmQL/iuwh3ehxcECsYG54gtPVTVzbdsBzhKGsdWw9RxMnOJWcFTjnzlbtJppMPXZLFduo
	CsKJaRL+N8iKOPBrjZKSp5dt9OgLIZXaGWPkyWxxk4w==
X-Gm-Gg: ASbGncsO87CeZQXML1GnjqMq6Ylwp+vpQM5/RTjgIz5LrtKclyyKhedfyi+6NfAADl5
	5WT/r2eOBXmgOMEMd6FEafggopQt/oSM/jnK2SPnTIEDyQqq0/4mPuiypTXtk2aFV8IX6H9RKS7
	8PbxFiwf6oG874SFIZ5j8mUxNSFsZtBG7aGJAymTEmnpaSTCAHalgiw3Fx8asrvekOLYsabD/RT
	E+PT3E=
X-Google-Smtp-Source: AGHT+IFdtZUV12X2qQohTcmgXoI8sX/n2MdDB3IP/SMHaxKOnh4rNFzghcV2U9qSUnmpWORF0iKHeIacxU0C0GZ7Nxw=
X-Received: by 2002:a05:6512:2353:b0:55f:6a6a:4955 with SMTP id
 2adb3069b0e04-55f708bff41mr1832610e87.25.1756732296026; Mon, 01 Sep 2025
 06:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com> <20250831084958.431913-2-rongqianfeng@vivo.com>
In-Reply-To: <20250831084958.431913-2-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 15:11:25 +0200
X-Gm-Features: Ac12FXzMx74oEGw0sys3dqlvnEr6aJBPDjUSlodZm8Lf6MbYZWveT4WA0nkRQcE
Message-ID: <CACRpkdY14ZuAp+mg==M62draaaf897Ry-Nkh93UR132iUqnLvw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Use int type to store negative
 error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 10:50=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:

> In armada_37xx_gpio_direction_output(), the 'ret' variable might store
> the negative error codes returned by regmap_update_bits(), and in
> armada_37xx_edge_both_irq_swap_pol(), the 'ret' variable directly
> stores -1, so the type of the 'ret' variable needs to be changed to
> int in both cases.
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

This patch (1/3) applied for next in the pinctrl tree.

Yours,
Linus Walleij

