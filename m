Return-Path: <linux-gpio+bounces-6031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F28DE8BA826
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 09:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E651F22348
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 07:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08FC1482FA;
	Fri,  3 May 2024 07:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXY54Cev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58612B89
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714722965; cv=none; b=g4UXhn/ixEAvUsWa5WiMYn5lwMTCqwzE2UnRsFqi1TdJMWUmySGNlgnM06EMIfXtYXjGQuy4pJNR6bdyvJn4ehSgtj9s8fUekBB09SG3Yr7UOiBZE+FS+Vh0oZHur+4g48ao3uUKVXZsHE+yREARRLnHpKjCdT+F+eHMY6v/AdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714722965; c=relaxed/simple;
	bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPEsVNaPKkHuP3gI4UkJhUw+QHwM5j1UAxx9RTbaYLUEFX0NwurtnaBnOhh9oVZS6+ZBG00KMPXXuPOOQsj74TjfxBaPOynkppyMizX+hdhP5HPck4IQRZTTX73Ypsbsn0EoOEdHR8aBODnJWlHH4Bdzb2gTUsRwvzSN7Gaxcss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXY54Cev; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de61424f478so4042480276.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714722962; x=1715327762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
        b=NXY54CevZEj1Kd4wbRD1Y84a+F9+fIkUy8W7fVvqsV2/1GNre502MmCofiNEC97SIa
         eSHLFUxxHd2uSX/Kw5VvpSwryNxN+3fLYyxbkUYnFT0NI0GN+lxUIxxbpjhIc+nV9GZr
         0rDuj+QySuwfKYJapEbj4VdUssa7c8Bw6Np/+PYsiZ0eAdI0daHvf/X4iNlfJUCnLL0+
         I9S/lz7ioakl7IikhdXP8nobXexORI1qQF0cRYwwiEQnqzgbXIKu5mp+6qzbi+xRVN95
         NA5m21JRmVix0IQCdL5spOngDrn1a5EZ8Swvqfq+PEFzO5d7Ve0rI3zRTG/SktOscF8F
         NdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714722962; x=1715327762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep6dJa+eib2MWb1RczSFiTE8NWenqFi4Oi13uS/LRhM=;
        b=sEWIyv7KnTrT0m1oAOfvec50WX7sHcwxzhbxYyUlKUiQgFQj8qPNX/wuwlpktrSRY0
         L5Azy1NXZz4Mkj5tKG7FSfPeRmgnZ+Di9DAVJLoFcuzg8YCWsFifQnQzLKL8AlZVjus2
         +QINm8kRLJCwmJX0mrWjqZC8iAQOyZN0O/GEOJYMbs1oL9Ei4eeylq1PGBNy/aBaI0zX
         52z7berkA/GiT36I54yPrL7rS7euKUmFB4L2u4ROR2RatST9GTw//WByeXmR8jDQaVws
         EcungwFoS128dwrzDtMxmiuxfXhJtomhqckWcs+BzjvFPMCSyVLm+ciX+rV1GAwlM2ip
         YvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcPFPkuJiFWSFlntTwn2+pCJ9gNRdEGvYf6dEsREyEI9NeOXPyrYGDZPW6otVVY2K98+lvLinQgjzGfdkWsKqnP80/nL/6MyobaQ==
X-Gm-Message-State: AOJu0Yw+DPa5/uhP0QBrjm3NK+QcuVvtQ1fSYonrpgm0Z4LLTOp0WG/k
	82AVRye4mvIkSNRZ8GSm98HgIQg96dN6MyU6BHewUj3JIS5/bGZ/yzO4ZrQGP8m1CNB0PQncNrO
	0FqKP+lLeUWtRW0DjGLCLSbJENJM2rPlIHwQqWxVVuMR70dDe
X-Google-Smtp-Source: AGHT+IG1waPpChDlKKPqRxrWTMe8tmRvUuz2kdqvOGF8Pbo1P3mQm0IcaVlqwK7WlzOI6U+gWkBKd9aAmVhn85+3mKY=
X-Received: by 2002:a25:ab6e:0:b0:de6:1c1f:b780 with SMTP id
 u101-20020a25ab6e000000b00de61c1fb780mr2221108ybi.44.1714722962639; Fri, 03
 May 2024 00:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423203245.188480-1-danila@jiaxyga.com>
In-Reply-To: <20240423203245.188480-1-danila@jiaxyga.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:55:51 +0200
Message-ID: <CACRpkdb0mLzZMyMejMYTFvcsPjX8sADbkrekU7AFXbKc-MJttA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-sm7150: Fix sdc1 and ufs special
 pins regs
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 10:33=E2=80=AFPM Danila Tikhonov <danila@jiaxyga.co=
m> wrote:

> SDC1 and UFS_RESET special pins are located in the west memory bank.
>
> SDC1 have address 0x359a000:
> 0x3500000 (TLMM BASE) + 0x0 (WEST) + 0x9a000 (SDC1_OFFSET) =3D 0x359a000
>
> UFS_RESET have address 0x359f000:
> 0x3500000 (TLMM BASE) + 0x0 (WEST) + 0x9f000 (UFS_OFFSET) =3D 0x359a000
>
> Fixes: b915395c9e04 ("pinctrl: qcom: Add SM7150 pinctrl driver")
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Patch applied as nonurgent as I assume there are no current
users that can be regressed.

Yours,
Linus Walleij

