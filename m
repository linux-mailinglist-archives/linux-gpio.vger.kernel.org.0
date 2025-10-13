Return-Path: <linux-gpio+bounces-27024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29358BD2B9A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCE23B3A7B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B65A259CBD;
	Mon, 13 Oct 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAE7f6P2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061E1F541E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353704; cv=none; b=GzQoDLESAP6a+Vzr+jY9ea4kHZ0DHSCUfLP6eSvH8haQHExJIhW0Fkf6bvl6ycWuujEQv6FUUNq0Q6pOoAFC6cw2vl1z5EJu82Y2qNBGoOWaHw5w38FfPcE3whN28f2YyLyD60E0sQ34GaBRs7bpA0ILrpmsi0hnQRDI2yqfMUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353704; c=relaxed/simple;
	bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVAE7oOx1bjyBoEpIPtNip28IQxI98rS9U29EtzSHDeWL0zyCa6ab+X0bXOLVZf5g9WA2r+bG3ue2vGs6cdN9JGZVgQIh/y/h+z2VULmTlGl62qSC4MN9yzWNCIDVRdOSGNjTgmw7N3htvkz9x3Pf8wm0ZjvygK/mFEk0vtoDw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAE7f6P2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3612c38b902so36773971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353700; x=1760958500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=uAE7f6P2eWrSqwTH62pVZLLZvZJTXn17x/Lx2NAB6Ll5/0CYeVZM/SME/xR5PWAGwm
         Dq7H4ApUlspcLKqTnpbm6Lnu5GW3tSoy2934trOHMgg7fvk5qEJ7CooFTb6pJ1Br/8c7
         oTzYCAPoTpQRQhdXlccU+jxQ85sjp4rlz9uBClq5c3gXURM73QXfzkXKEWDHzYbbg4BE
         pIVyqOwQA3kVujILuA/vJFYo98nj5CMJywwLkdZZwrBTI8i0lA0WlP0He8on2rrRg1NN
         WlXallAQTlMmaCJNe4o8dzt40Zl6uGmQdrbzm34qeeDtRmjhTNjFzsoaA3YZUXAkG/wD
         EdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353700; x=1760958500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypTR+U6CbcsupTqnlW9WC9v+pxZ9wGorAvOqUL63jvE=;
        b=lYaufdNH8t3Dm7DoiDLqwbS3Ga/qfmN++BiM5N5iBzhVQ52+0SZwU1Hv1LgdzjIydn
         ENcZOj5L61u75iqMtPi4gkaGwji/bVnx/tec9ZoGOwbe/0+jTa95NY5WbpPahEib0jH7
         gXZzMgIpp3Yaf4fFHh9VRW+lk3B+t/M7mAv9R1mf2ZyFlsS0vc/ILDV3jHpYS1mpX20v
         bV4fTO5Fm9uRss9muDoUU1i/QsQqyuefXalNO0sfYy9IOnRmkDb3PkKccvRdrtl6AyaA
         H2hUNLkCqeNkMkkeIVyde3ZyPrcvdMYu0ikrDnIzzNj9JM4B6H6MvReQmvrxtmTXRlYQ
         jbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG95YwKCzW7MNM85B262n6cE0ZO6ZLP5VZeFgLJ4kSnMNNT8DCDpluXyr116qVq0FmEuaApD8Guhv+@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiUrsY5BG2p4UcrcAkIPhx9w0ZbNnHuwCwY3UCzG4ijvkJKiC
	A0ML35wvqy+yTu+iGM8yTlzQkDms3rWEiZZYFL+2zUOcwyyKooWomQ7bmEtb90aJP+AygE/tfD8
	ZssRub5GOPKa8rw/da7LU5ZiTa/fdxK0+l7CJWI0O7g==
X-Gm-Gg: ASbGncuqckb/QPCGunFZusQ1gw44JmMwQBu6C9yi6xtPhw8GZToyor97rPzXW1aCvBp
	xKssTrGeX08SYhoMzd0XyTZpLf2dCG8CFeokOEbFCoD0S4NxM1yplYmy4KORwC9dfNFG07bZyP4
	qXHoJVj/tNFsbRLjBY9iDCRFgpNW2qqEXDRrgc2LkCVkwOjqnctoT2tEh/iQxKsg9WYmeBININj
	SLDT5g67c4puECqN0DywQQpgndXQA==
X-Google-Smtp-Source: AGHT+IHtdCLd+4uJh0pbUlnFA7Qzu/sxrXL4iOF6wbwTfZv7XTlOSlg+VqyDSfbt690MZKi6vF6Z3aq6/nvgRVaOgQc=
X-Received: by 2002:a05:651c:546:b0:372:9f0c:2158 with SMTP id
 38308e7fff4ca-37609d927d0mr46661901fa.16.1760353700507; Mon, 13 Oct 2025
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
In-Reply-To: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 13:08:09 +0200
X-Gm-Features: AS18NWCm49dSzl3HawLMJssUJLSTrG4CpecVW6MUgTtkI6_u-J70Cy8bMmd9g7s
Message-ID: <CACRpkdZvJ3jvoxi4H-PL307up1nrvL5hNAtWTrwZGwNW+i8Lyg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 4:01=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> The mt8196-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8196_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
> issues.
> So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
> ones.
>
> Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Patch applied for fixes.

Yours,
Linus Walleij

