Return-Path: <linux-gpio+bounces-2776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA5843891
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E765C285CA4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E24D5674C;
	Wed, 31 Jan 2024 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRk2C5U6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9820E57318
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688714; cv=none; b=NEYTCJ3fbCj10ZlYyu9ArJzVluRbsMlISr9HJLJakpvnieFhwku0BKLPyk49W/JsQ8VdIRgZgnRXgslIbUlDogBb8bUxCn0MRJRQtcgSBCpskYkY4tJKq3otnWAO5RipXhm2M1AJwR0YVx/kHnbED1UN/AvI7V2g6+19s9b8Gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688714; c=relaxed/simple;
	bh=PcQqiodcQiMKtYDGQ6dmC9w+ARmjSt7QGStexE5wjLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcnhaIILE2nxKTq0bxDslmyEli6O/hZpCm5kgiT1AqjSGY5OO5Hr0rz5YiSp/LxDTyNyJrcDIMzI8t3b35A0D1LLgqJBgd/vP4LREDZhE6guyaUvGkAnQcGEmL67LM3jMUPYAWyEBMjFZWGLvx45raobDQy/HE5TyTk7VjcSIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRk2C5U6; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so5185644276.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 00:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688711; x=1707293511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcQqiodcQiMKtYDGQ6dmC9w+ARmjSt7QGStexE5wjLI=;
        b=rRk2C5U6FuLDRTHu2h6fjbRq/itIjpRfYupJ4fsC/9b1Eu0c1+kF4yqXnUTEe7bfPE
         38+OBgOsB3sbzyoP7i9k2gJ8F6N98Ar8Ljdt9gEZssuVOdLxLI9sqBOS9O87e2GR4T6p
         YYArx3JvSWJ23IlNWrCwyguvN8CmPOU59VY/OSraxjfGc665afh+lFqmRrtydvqwyPib
         8/70FFWgc/9bVLYjzVN28Px+OFH2uKZ5i8MGfnTxMmfWsebgzHMjNvYukTYP1Fp/5Bab
         qakvC+MulIYGVVydIPA4RtMk3xtQff/xNAY05E7FPkV/Gb/kH0ncODdgQWZ+igOtnOf1
         N7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688711; x=1707293511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcQqiodcQiMKtYDGQ6dmC9w+ARmjSt7QGStexE5wjLI=;
        b=mtbJeGxKxopohmQQf+H74hvUg1POv8jsa6IPeaq0BYBwGXKVGt3ZHPHonBPVRAzB09
         iXRpdPuUaeYKyXBTq3f13akLntshY4vJL7Ah5QxDNfu1AtnTTyPRCEe4Gt+eX220Xq72
         xChTrlR/9fwbuoTms8oQ6KRnE9EUL5CQUf4doyIGxfKqqlyx1sf5axSNsPPXCau7PVOp
         C0dEO/Pi5y0Xcm0Cn/kdtX7YUmJvnAlg2d9DW5tf7UEMK4WoJybwbEuvjdWsfHrfdeOu
         oCAY5Xfjx6fRq/hUDiiSw7JvU5Rov9XzRHOgmsZOt3+i36S6ae7XsXWlxdQ9TEW+9/4h
         GrTQ==
X-Gm-Message-State: AOJu0YzjUxT8FkVj4M80K8NVOFErxgQ4TkvjEctLbJanrElq8w/4SnNg
	5Mk7t49Yl0GzXR6+kP1e9+R7ZwYAe2WsUpdDBb0Jl2puIMiwNSM39jTo3DYDVb+XH3vDkuZu3lC
	cYAh/HOODGwMtiaHk+i/kno2Muc5fu7s3pmY4kg==
X-Google-Smtp-Source: AGHT+IHFWqPWFOrI9H5tbmw2+HKzj8jfq2QGXGq9pP91ehXuKcd3khkhPKIFK8pAB3UYb40otUUVA2FUpUT1ag3TIPA=
X-Received: by 2002:a5b:5c6:0:b0:dc2:4c31:774a with SMTP id
 w6-20020a5b05c6000000b00dc24c31774amr970366ybp.49.1706688711519; Wed, 31 Jan
 2024 00:11:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129153138.3221604-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240129153138.3221604-1-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:11:40 +0100
Message-ID: <CACRpkdZvQzpFgibd=aw+rnaOpVkkb+e-TMe3s2sXOtT5Tb=kYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: andy.shevchenko@gmail.com, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 4:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Fixup a couple of incorrect header includes.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

All patches applied, thanks!

Yours,
Linus Walleij

