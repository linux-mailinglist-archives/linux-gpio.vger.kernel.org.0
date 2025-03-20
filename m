Return-Path: <linux-gpio+bounces-17813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B7A6A0F5
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5104617BC24
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 08:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC5F20C02A;
	Thu, 20 Mar 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWhxWzso"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AA20B803
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458416; cv=none; b=IYhIPW1P2coO+lB2iQVwxWSeLx6VyEcAg4EtuNwyqZZO4oBNtd7wlGOUceXL2r3VP+zlV1WvJ+1lwooQsZcLJHbJM+kMSeMCzhBy0OZpVY5ikjWvP2e7PRITlgfxWE7JiVJMwjXeR149we9SbhYMSPUziRk2GlzzTR/FrKbkVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458416; c=relaxed/simple;
	bh=6Ji1RBIOpRF3KKxjONADrWSLZ8hGYxB9lOHKQd1SPN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvSl8xU2+TjWUgUrSbyIKTlPAVITkU7U1HbbTdyemz2AXKJgjgXbbo3+vp1OQTh6Y37y6xFdp9fpJ1FAu0UTozQjdGVwFPw2LFfohoAihooypBPrUUmKmhEZ/GrQbX0lyflBR4VQJSYkBMqwP3UvfNA6QOyPRk+KMK0r7t5RsbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWhxWzso; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so565671e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458413; x=1743063213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=nWhxWzsobggiluwJCxbDVfDnPmsDCfvAABhSrHVU5Iw1vBbjUXA1W/RkeIUwka7q0N
         i37OH3tnLf1Na42ip7whz+23z+xpuTwg0QViQMQwueWsGXdEWqesVJxYMqg+TJdEVK2I
         5G0wFEosfn1XtAEaq7eRrnQPdXuUE00Uhqhr3tGOZgfcTOKv2Ew2yHN5BudbFdfaAwaa
         NdTs6KcEJNc9SB6rTscuRJwz4pfJ8tHKnYRvx1+n98L8LOa35gjHvGaFZOMYrA2xQpbJ
         n/RbxVB+RmoqP9WaTzEpBCtVho8h9QnZmSRDU8/VtvbnKWUWA1ynSRyBGrAvJ1QkgRaB
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458413; x=1743063213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=YsdizR6N4cTp0wUG3A9bluEs47OWBb2Yr6dY3Y6/IkRsD+zG2R5i2cRkVt4dTCEypB
         lmU0J6Ib+kO+wWppIiuLp3/SgX38b7+n/154brsH7G41KNhxJYm31aoZH+fKo5rI2P/G
         jHFEyPZTRg5Jbt5zsteS6LrEiyygFr8C34Zbn6FhIPsDQiJwypv0l55S9jw2+bkJj2SB
         9O+Jbby9+79LWgvt5+AcEjFvOteB8FCA5Y5CISmUj+7D9gJHV/33bk6WkY8Ev40deUnJ
         ESf1tFrmZd2WFGT6ejX12pnm1tVdP8WxkPmyW1Ce9rIZdmyZclY7jLtQ40YrBlHxfLPM
         wUBw==
X-Forwarded-Encrypted: i=1; AJvYcCUiqXk0ImUg0xtK80dXOaw2h0mi7zvpYgL3DQlI/yAB/gspVCmhsPpNlP3xs9/tuzvCUDlBSdIwd2UI@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQRtN+ujA0qvSXa/T135LTtZ9pESDmBbAyNv/wLSceEgvQVZv
	WYOsiXcqHEgGPQTIy4QVPxag5LVxBLpg+QDfDE5LRbNhT+v34KKB/umTd/vJxOJH86g7IHaUBxb
	xrmomZByxzWQaCVmWbNyaI/hvE1OxedEvS9RWTg==
X-Gm-Gg: ASbGnctZvTHHXpY12QvrUdOB0rpByuEwrV7FN1x9vodxk9zCW4NxJWbvRUD7mX1RToq
	jcZoe70NJNxpUniXONaXuZnACqJl17gDoXlCXp/q8p0xDtyyHuOMqbFCLBMohuYvb2TMkI1Hypc
	z4ryPjYpxUinCYoxCa1m0+Z8U=
X-Google-Smtp-Source: AGHT+IHlRAMm6DHFmGnX4O6qtM7WU7UfemcO1DW0vJWDefpFUiW/wKer02pkqfNiLKCodEdnMprWlIdw9ApK2Vl4254=
X-Received: by 2002:a05:6512:3d27:b0:549:b0fa:6733 with SMTP id
 2adb3069b0e04-54acb1fc7f6mr2205401e87.37.1742458412840; Thu, 20 Mar 2025
 01:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
In-Reply-To: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:13:42 +0100
X-Gm-Features: AQ5f1JrO8Xfjg5ntIWbaCB7qZbTiTVkH-WMLNIyd4WNCkBTjqRZTBB1zv4h7_O8
Message-ID: <CACRpkdY1NhHQ43L+pAoC6EC_ydJKY2u+P=nhNAgo_Gw9McNngw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This should be >=3D pmx->soc->ngroups instead of > to avoid an out of
> bounds access.  The pmx->soc->groups[] array is allocated in
> tegra_pinctrl_probe().
>
> Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan, excellent find.

Patch applied!

Yours,
Linus Walleij

