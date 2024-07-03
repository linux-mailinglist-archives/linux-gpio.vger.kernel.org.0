Return-Path: <linux-gpio+bounces-8009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF59260E6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8D481C21014
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B8B178CEE;
	Wed,  3 Jul 2024 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUIWeMOF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB091422D8
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011080; cv=none; b=eZJ92Pp8yqNWlU6coBHyoGlXzy5cObd+NDEO+Nfh/ZAL0fI6rPRoxuypptTZNFv42EdWVok3S5zGvf7cp44TUFQFhD6azjLPSkDrR/ou5+BNL9qt533iNVg9nccBCKcErtAO1nJ87HWaPvgtOaXPA3jjrYHqMjMPOXrKR1+4aFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011080; c=relaxed/simple;
	bh=ZZVkBBnq2f3WMD6/iuDrxcJPNCrmNZnRew3n6wDwu7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mghDs6HZWWELAbDDXQ6d0yAEZCDReuWRqyiWmxhwXbAtTpQsbPiAahEzKBsXRscd8EybX6bxuj5iM5DysfNeZIFuCDziz03T+ZFWol2332JSCXEzO7A1+kVUkoglIvXU7NKdjw0FQrKIx4s4IMO3lW0xbR6Bd/EmEwLJ4ZoT0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUIWeMOF; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso5060779276.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720011077; x=1720615877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZVkBBnq2f3WMD6/iuDrxcJPNCrmNZnRew3n6wDwu7s=;
        b=tUIWeMOFUIgmXLDzOrCdgsQmOerepX6Dnfxfqm9IsRir9pGt2R+Q3hgOIuiDj4SHuk
         djxH6Knc2tL4VhbRfYJAXQRGTS76g5zD9ILfTFEPOMLKY7gXaUz2C1FCE6A/no0EUwoH
         JdgIG273Z29Dw/Ves2Rrb+pbSLEfnyuHm7qoNXYkVCO2z43mztOEBq2rVlbtGAJ7quE9
         lCY/SC5UaUqxqOCrC0coJtjKmS8jH82kbLwr4p/TXrPjGXjNXHy+xSpeav2UfEKWKBXK
         YeSZrwSajAUa92BJAuspUq563N1GwW4Y1PGkuWYYGMVBMVh1hqUtAqlnKtvs5q8Cvd/G
         sDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011077; x=1720615877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZVkBBnq2f3WMD6/iuDrxcJPNCrmNZnRew3n6wDwu7s=;
        b=m1NfDkQb0lgal8QcNKnfmPfYknIdZJ/VqPp79HK+rVceCqU+xDnw+mXKD6cJ6qTmzA
         mKagWecwoHOAqV7wKqCnzYqs9EE0DJI04lxzhSN87IRKAHVpZi9Doi9vEYoV8n4Tqbum
         Qth5VQjdZT0oNnnI7U0k5uCQHWHWCUmN2m/rPyyoEz3+NRqlawOqqX1PwCFDnARXKMhh
         i+wznU7cZYyMolBTTuS/LhYatU8VExaHJ3lyFBg9KMxzcLgIftGXOSdfSAExOUwzomai
         qCDs7vev3Rzn8Dq9QGlCkK3aVd6gF2PGWMIQ06/9I+Y5a8mOpLmSXg3WNYU6znmdKpIe
         X9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUigQlLNUB3wRVAa9XxR0MX61Ks8KSvN7R3V9YrVMA101D7b33sUFDGUOA4w0Is8wNgN/5+i7MzJ63dM3nX34VcCOteFWutUDT+w==
X-Gm-Message-State: AOJu0Yz/je8rlOOOdpxUca6dJazhGgwq2fDAngxSPtYC9Ai+8v+RnnlE
	6YmQfk8LiuBd9DNVhfMisLtIfqylKBxbHnd0OEoPcPglwd/Waci/UNbVuXWdbJiMS/mTrXFPf4L
	jyBMh+kjtWh5uCEJFyHlDv8WpdWLtFTy5wVRs1Q==
X-Google-Smtp-Source: AGHT+IECrd8bfdv0TCVTEGytAoZV0MmpC2JqwWFIdgBO3sCCPGjShflQOP9qVEN/9TFxAfVaWqkWmk0wLDZLlLAKfuA=
X-Received: by 2002:a25:d692:0:b0:dfe:4ab9:1cc1 with SMTP id
 3f1490d57ef6-e03712615e2mr10259122276.40.1720011076677; Wed, 03 Jul 2024
 05:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627150610.469645-1-nm@ti.com>
In-Reply-To: <20240627150610.469645-1-nm@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:51:04 +0200
Message-ID: <CACRpkdaY4xK+yegDHjkUReRydc3oVLy00i73KDRasCwxkkpEGA@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: pinctrl: pinctrl-single: Fix
 pinctrl-single,gpio-range description
To: Nishanth Menon <nm@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 5:06=E2=80=AFPM Nishanth Menon <nm@ti.com> wrote:

> The binding is supposed to describe the properties of each element
> of the pinctrl-single,gpio-range array entry, however when we use
> "- items:" instead of "items:", it explicitly describes that there
> is just a single entry in the array.
>
> The pinctrl-single,gpio-range property should describe more than one
> entry in the array. Fix the typo and adjust the alignment of the
> description of the entries appropriately.
>
> Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use =
yaml")
> Signed-off-by: Nishanth Menon <nm@ti.com>

Patch applied!

Yours,
Linus Walleij

