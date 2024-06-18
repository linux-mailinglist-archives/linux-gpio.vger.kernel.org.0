Return-Path: <linux-gpio+bounces-7522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA1990CA9A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8CD4288439
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1978415ADAB;
	Tue, 18 Jun 2024 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaXabhMz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893213A401
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710888; cv=none; b=p6SrfKhbMBMB0YNkTqK+vhesMZ5alB5qADZ966zSeFu4Fu34x4RFsBr70Gvm8owRIvBR9VLg6Ejc5XbzQpPML1GnfbRL4QUSiCHzKEaLLvzpXedgfxpV82/JKBfoFPcmjQ5R7zK33JaWrQ5rBnzOduQSTP5jV61+yspOrQ3pz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710888; c=relaxed/simple;
	bh=sbJtr336s1UhU7qkbnOi2lIzbuIg1Sjdx1C00OBGp0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wji2qKGtNSd9qellr77bhPwle72wGtJVMwfAx6Ma+u767tTCpnCkwHKqeOZPvhlg/i5ZFa3ucKSRr2rHYUoKMEvAmfwID2F1oJY1luWEtKL3e3lAXhwPn4BSxfw8DOIWbe3aMEWw58IGAo2YX1Eh3rXdoQY4kQd43GTIbLIC3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaXabhMz; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c70878c54aso123081a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718710887; x=1719315687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbJtr336s1UhU7qkbnOi2lIzbuIg1Sjdx1C00OBGp0A=;
        b=QaXabhMzTsrNbLItb+PsXJ2bW01kTa/G8LohZ8DXLue6B0kBW0IpjAYX3FYjXD28SW
         6HJ1WjVTzisZVIUADDxw8sKax56CcgjdZz8KSpwQYA3gwpCJ9KlTZrnyxu1xIeI59tvB
         lK6cpCddkrIiZRbWf0/xPNenOjLtcz+waPZNA0AlP9ALy599AH7JbDCMSp9DsIMqpLCI
         by94jDufN20NOYlwF5QBE6FXId07C3WdDNWq6EVwLHbDNfoAFqEKPS21hn0Iplq9Knsm
         COJTU94r1HgcUtb27LUt+g8urYzaymvlwcIhF1pUG12IRearExuLtbTQrVsJvZHyZzci
         67Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718710887; x=1719315687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbJtr336s1UhU7qkbnOi2lIzbuIg1Sjdx1C00OBGp0A=;
        b=sqjBfqCiSDSDJGB64GialXsD1BymQczDm7qkHdcO/JglQSy773KBnnNfK1apoRIkdd
         FXaOBJdEfPx+h/YkkGfsibeQPpgslnJJ82gL7yL9BJZhoBr0ZgWYsh10QYkGX5OYiAmN
         TLV3SO+AhfXJ48iiBEjArKftqhcbTdAJoROxTmIrHeN0z/EKTwmAZOH0/2XIzB/JFH/P
         S0BpTXn/ARF/afA2qG6wOYC1+xSBILEFYCbHD9msZ0m80oCrfdrf2cgXRfc4f0zAuQBF
         F1tHCR0FF8cWVTZNILXXq5CryN25mbV6ZR8M5x6BxASSuR0PYWfl3AGxgzmz4h2CiMgi
         xB/A==
X-Forwarded-Encrypted: i=1; AJvYcCUrHHN8RNSVpCHptEMbDDDNjdF4hmL9L0i4N5fmNL23Y4aOu8N6iR+kWY8ZdSaBqRux8mE6oCe6+j6YB7pXQAchty5UY4FKqvEmtw==
X-Gm-Message-State: AOJu0YzZo1yej0ET+vHoWZRcD/LpLV0RiYMZeAFAeDI2b4uMlVSK+DTT
	mNouyOvAB6JlF3035Lzx4WgWeZXgtE9MrvHGGyPEXNaw38o0GViMhBHXaU81Up7GPDTH5KCTFTQ
	UjsNKkloprkfCUOacu0KMzdmgrNs=
X-Google-Smtp-Source: AGHT+IHwRuuqMvw/TDZYYiV28wWTGk+dny3ggfM3e0y3v9H3lIwEnr47m8PFYijGOeeINxzr8ADkFabxNqzCRU0GXyQ=
X-Received: by 2002:a17:90b:1107:b0:2c4:da1f:3f6e with SMTP id
 98e67ed59e1d1-2c4db9563c8mr12161525a91.2.1718710886687; Tue, 18 Jun 2024
 04:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618-imx-scmi-generic-v1-1-67808a48beac@linaro.org>
In-Reply-To: <20240618-imx-scmi-generic-v1-1-67808a48beac@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Jun 2024 08:41:15 -0300
Message-ID: <CAOMZO5BWOZZjhFEr6sUq_HM+n_pU_SUSG-W0wdL4Mg0tyjx0fw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: Select missing features
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 8:26=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Fix the compile problem for pinctrl-imx-scmi by selecting the
> right core features so the symbols resolve.
>
> Fixes: 1e37f761d016 ("pinctrl: imx: support SCMI pinctrl protocol for i.M=
X95")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406172317.Sds860AS-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

