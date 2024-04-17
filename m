Return-Path: <linux-gpio+bounces-5593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A28A7EBC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 10:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3D401C213BA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDE712CD91;
	Wed, 17 Apr 2024 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xh6WRD7l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E112C462
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344068; cv=none; b=JtW/j3F9FrUYnuDxC16zR9cGhZ0GSKuiHkMFfsut6ZVZwy4qj8aDxZNzsvDuuTmzOrsKYFtfIPB4qAKNGbl5yLOJH7DuL7ipxmeFF0TpxDB7+YTJeGiq6pkSKpUFa5bk6eMHG9vn2Sfq2o2NitLzEKzdjOB7JPFIbNKp2iQpnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344068; c=relaxed/simple;
	bh=pUr9jUEluNjDUpKL1XhdOT0Lv6IHStg0F/BBAhk+RbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXF3EW5eX6Id/CxML/thAWBIIXGQCOElm6w0CVwZhZXTKHsV4h+SWGEeJymQksERiuxVpjn/8fi7PfJR84wbVI2w5u8+jaz0rcMz2jWLfLYmo0/f0o8N5GhmfmEswVWYe7mi79WU1G49/qnMrM3EiS0IOcKjpxnWvSYcoPdU1Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xh6WRD7l; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso5291129276.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713344066; x=1713948866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUr9jUEluNjDUpKL1XhdOT0Lv6IHStg0F/BBAhk+RbY=;
        b=xh6WRD7ld306d7OSyUtKRE3GHJ4Q9HJEBPDl6c4eoBdNtUiRPQobdsdQPvWc7bpLYh
         uVvjfy0OAVws+6K8shCTwuQaGlK1SWJoofC0AKxYhpNthXHXxyIJTvY+nxFuZdnxVFF0
         BIyFm8QaCOqylccZ0OXu1pg84ww1rmbeO6ARKfqken96yH2nZWzgN31+aPnzgTl0wjkX
         oRVGEwJMb4C1LbDx2gBl8ziOigHSE17akvRjzyCqc1W4W7OlBOpoO5KsvlzABOYnTWcr
         Ald3uueXCR/sDSQlMFcQ32hhOnsShpaixeg3BAnjVVWS3/p42MoXEAdkWcweLeZqbXSk
         /DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344066; x=1713948866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUr9jUEluNjDUpKL1XhdOT0Lv6IHStg0F/BBAhk+RbY=;
        b=fwdvKQnkJe//jhZxicgFe0CBDuaLJJt233PYkx4eScpn2BMtuZzojHlqpyfFkUB7mC
         7non3S5qtCSNqCIn0zG0Jf1jgJ4R5nIX96A3p1CHCVOqOyALW9WTv9wbJjzlLiTxiTFw
         jf7XeFafrE3oor8nuJp3SvZF74JXgkgKP2pScbsdpM/nXE0vBuNX/v/HrsWPICvhiPAk
         hsd36On7xeq5O3C/5lKK4CzYmKlkVlvgIngO0qOc6LxJnnyMGaWrLfC8cemWVgDzH2rO
         QdeAneLLsxj3L48XibL1TIFrWu95f4bjphJxOslb7o4pat3p0p62ZY3EHpkllQyVtmjo
         9ayw==
X-Forwarded-Encrypted: i=1; AJvYcCW40SeUCKIpyffthHrdXRCF36T61N6vWU7WIVUtxAzNCki9kTqGJ/pemFuWGP7pe+Itn+evzhsLWYmuTEd+v/KOD4uRI/nv3eHGCw==
X-Gm-Message-State: AOJu0YxjL3ISQXmhupqt+crOEB2uoD7JOD6vATiJs3mWZNkDbue2QAY5
	u7k478BX8GlsZ3GE0MulmhCMM/xo4EwB5X5XodHWG1+yo2r6pkHeNwePViiNesa81ETDKRwV3c5
	dJ8vwotWCckOtbjvERFfDlbNeR7aR7lMz7exnQT1xnsDA+xZt
X-Google-Smtp-Source: AGHT+IFoYrocRvRpBR+ypgZ5EFrRrR3n9ZMMmvzxL8rh4lxaQr8TltkxYPx92/ZFTYrzZqdNCJc0eLD6/6tpslWM1b8=
X-Received: by 2002:a25:860e:0:b0:dc6:d457:ac92 with SMTP id
 y14-20020a25860e000000b00dc6d457ac92mr13322625ybk.31.1713344066422; Wed, 17
 Apr 2024 01:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412005128.2937486-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240412005128.2937486-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:54:15 +0200
Message-ID: <CACRpkda3SQ8SMy3eFE5KhmFWwEviF0gUSYiWEMMVN0Fs2=8yhQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: print hex value
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 2:43=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Hex value will be easier to match hardware register bits layout,
> so same as pinconf_generic_dump_config, print hex value.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I agree, and it's debugfs so not an ABI.
Patch applied.

Yours,
Linus Walleij

