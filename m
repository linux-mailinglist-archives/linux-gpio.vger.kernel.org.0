Return-Path: <linux-gpio+bounces-11219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E299AD23
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0480C1F22FA2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F001D0F66;
	Fri, 11 Oct 2024 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awnF2X1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153431D0DC8
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676551; cv=none; b=l6/vomawoctA4RSQS+akR3UU6Mxztl6jk50S5ZMyQ1UYLabrqCzJ/sTvh5R/WFWpUuUMTrW+1+d/CZTt2fcLfszzL9S76E7bPu/VeTxoFgiMmT3Rh07/1HkAbAMJ5z2Ud5y0hS7NJs6YzLGliHYLz2UFnP05EIqML1Q4zzMKLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676551; c=relaxed/simple;
	bh=a5D6CRKK6FRSWd/adGyc0iCMDGRKCSw2V0dQAJdi94Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPKurQS6Xhg/PEtVrbmVgijH9TPulxVM+tLQ9YCMNKhw4pmlggyLEPJ8BGdgO0uhYYXeHbE2IF/bfgNVHHaxT4Dh1VZgs+ekQQSyXQoyYHtfH8YRZMwhugmBDGgWjtPU8XSC0wlUvdbXHOor5DzjB9USgEcuq26L9imEhQx/Vqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awnF2X1u; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dfff346a83so24647947b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676548; x=1729281348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkBoPVksNssq3kk3PRQvLrV5w199+kZDVbn+dDVtSPE=;
        b=awnF2X1u+JGwPCfYeQaZfeTDKaUYR3fh61rrprJM9QiweC9+dsMVCOFoVDjvs0DGX9
         Evai97b86I+IM+lRYGckAzIgyH1aWiHIiJ54snKQ8kNU5yDOjzcWyWeC0GqL7jVHbBgs
         tC7SHh2OqiAnSo/WWfXJUHKCanJmkJW/eQrXightxqbWm6ZCvFGPcYUGSN9yUl0BGA7p
         T3d5Vb0mkEIiGscz2YLm92RhuEaGzs7EHsdNu5DKrTMHl6CcB2+Fi75tzBD0TTwxHv0S
         GH+RIwd6KCMa7BEulMKO4I16X19sqKRZb/Ax5yXiFIoN+McS0+jaAMj+Y+ZlKNLsGR98
         gQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676548; x=1729281348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkBoPVksNssq3kk3PRQvLrV5w199+kZDVbn+dDVtSPE=;
        b=ejIAfVL8zh/3CdcAOYjGdzh8AYNvCioQtQYP0U9cZjxJJ8NHzhxGw6vFhkJ2F4gYtA
         yEneMrPAihLDOSv4A9ITZsqSTUaF0SQr/+ixCu8mMkWC2qL9pv/btkJebTXGrZx2OSTx
         kteo+WUEE2iuOA4Ko3TjpzRcmOOvtNPWPx5+wdSNq3GTimO4bSM/wh9PeuRqjF5y3SM5
         b8iDU7oZ/oRRjGKdWdep9032dGClAWDgn7cKMwz+BT540XgjGlsCFpwxO8BLfrwGrY40
         U6HzorhMB8a/QXDgctjyLB00m5Nv9WODTHk6z4tj5StEy+wBvwsSdShVsSLFMjNgYb99
         fAcA==
X-Forwarded-Encrypted: i=1; AJvYcCWL69jZxOXvmCSRF88+LtH3ljLu5q3sEyp8qHKIWlI2ZE8fixLyeUDQ7Mzh3mKKkWDS6ezZNXERwC31@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7dEgjUTLQJXrEiRcdvx7C1Z44MyJdGbyVF1cEADSeF2ZQKP88
	MxEGicsu4Mbsmkg+Lpxt/3lkejwxDlOaRfnG4cqBxktymdr3W1kSVff8B6laqmXU/nyKkG/4p4J
	OdAqTiMh2O9Oi7ZHgkZwZxhFxDD3m6PqjQ9nyQg==
X-Google-Smtp-Source: AGHT+IEm/NZLoO0B4BF4b0vFgq+5uRsH3TsYvJLQRrk7Qkb93mKDfqxwigJ4J2wXtENbFFnnkwnUAWOGHOtZzCq2V6I=
X-Received: by 2002:a05:690c:ecb:b0:6e2:ad08:490e with SMTP id
 00721157ae682-6e3477c014bmr38960987b3.5.1728676547975; Fri, 11 Oct 2024
 12:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010205237.1245318-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20241010205237.1245318-1-harshit.m.mogalapalli@oracle.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:55:36 +0200
Message-ID: <CACRpkdYy9JL_tE=N1=4aK7JG82usxGN6eteTxsopTbFsU0Vh_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: christophe.jaillet@wanadoo.fr, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:52=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:

> 'new_map' is allocated using devm_* which takes care of freeing the
> allocated data on device removal, call to
>
>         .dt_free_map =3D pinconf_generic_dt_free_map
>
> double frees the map as pinconf_generic_dt_free_map() calls
> pinctrl_utils_free_map().
>
> Fix this by using kcalloc() instead of auto-managed devm_kcalloc().
>
> Cc: stable@vger.kernel.org
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij

