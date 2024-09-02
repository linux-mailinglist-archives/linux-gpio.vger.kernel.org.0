Return-Path: <linux-gpio+bounces-9519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0396815D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1BB1C20BDD
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FDE181B82;
	Mon,  2 Sep 2024 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddCwHkzE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241017E017
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264417; cv=none; b=lptnQTQ2Acl+/eCktiDtRrO6kURJeHRYdF1kXIHNRHd6shWSoz8B5WGzRm6fFCXH++dCFApYaPnuPL1H6sIQegbkwAt2o+Ak1bZmXZttjudvnBVvZw2ganFGQsoWEo3TnNvI6F0gSZKDP0lNmf+HnQ9fBunqEj2UK+AJUZ30G7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264417; c=relaxed/simple;
	bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJ8Wg+q2fv6ggGXCPJpAAKL2EMRee3boNSX7Wz9w4BKx5dQ3N0FilQJ+lv6mZyzTKPS/AFyitcJNAHOJQzXUzUn5BdJvdHBaKF1O+rCquM0ohBQrHekNu0SZYFq8CzEjhwqUffoRyPgQbZgJHc/HP9UbAYPHEV7GsN9+KrSI7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddCwHkzE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso36226891fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725264414; x=1725869214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
        b=ddCwHkzEL9TjEYRTX67i7iNpit3Jg8ft5mSV3pcgWRM6PiDtGnSQ9oSxnATnP+19fe
         FpyWJBhH4jAJ1rAOm2Mo17XnLVaoeosTdulsHFdBSBiosC7pQjIjpTDEiYaaGk3Vozvf
         brvr7wxtVAXq0l+tmdl/sX1gvRmKhz0+eTpTwUycsUrMLyHZWABMmT+BtjbdhbQydmdl
         BYR1D1ha1nycgdixttCPj1hhF9OhOInxO1LZKqTWfS6KTWdzLNcUn2Wu4QWJ5FZ5CW1W
         yKhQCQOsGSgYQtxoXZi+XmvLtjUtpmUN9u2H9QYiRqpLNCWs17JBRDLfzd/lPrPqXBcA
         CYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264414; x=1725869214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
        b=rq66PzgRVkXy3CaW6qSkXTCbJ7fJKkf9bjIU4HQ9YA2O9+TjgBFxK90+DhQQEIKVfj
         Ra+2X7eGY0QTZBAddj6I/tSJB8rYLXE3PY4f38MCOemMhtgY6+62LuME1Z2v8QBDLkEZ
         8xwTLCf2VYRlj0MRyRr/rMcV29TkHxZuezsa6qUV4wueWjjEcQ4AtSDOyh6sEdyosDuC
         +VEEvb/09cVhx3M7wSVbotSk3mEAAGncnX+KlovXoujgpDK6CDAHld02bSVzaNw+6STy
         oSFQbIZhLc3SoZjDnGmgLa8k2uA7oaB8qha0t+ms1uo/FRtv+xlobDjo1M86ngSlRbjm
         b2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWmfvIE1NYD0JAxeGRCX5QAB8XACvIazW53Ky+Pbb4rzt+E7FOcL118ZdcDqWP9b/U6U2gNwgOaRytp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4bK6mtHRrKrNQ1xVzlXtwoZLwypA8tIPSPv0VpheT+2ADBk2n
	JGTsNglZzmoRtEsIIkfr9hZgR46hcmcMJgva3tj/kAYmb6hKs9DXtohHqkv+O5QN383W7Qz+y0X
	XfQPgoBduqlzKN+cHvQlEPwCI21pKAJF2ifpskw==
X-Google-Smtp-Source: AGHT+IF4P8ui/j6LwDmVgLebzGM0J9kbwtfhbveDHdpWZlQv2O/gT+1IzNGgnwXiG1DtBB1NINJJMQUuzvVqS4VTZaA=
X-Received: by 2002:a2e:be8a:0:b0:2f1:599e:bdd6 with SMTP id
 38308e7fff4ca-2f6103a0b89mr93767261fa.12.1725264412924; Mon, 02 Sep 2024
 01:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829064737.16169-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829064737.16169-1-wangjianzheng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:06:41 +0200
Message-ID: <CACRpkdao3pSp4H0Nrr3rBbF4NbBw=ePxrgBYwNOTecpxSqhNhA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 8:48=E2=80=AFAM Wang Jianzheng <wangjianzheng@vivo.=
com> wrote:

> sunxi sunxi_pinctrl_init_with_variant get, enable clk and
> deinit_device disable and unprepare it.
>
> This simplifes the code and avoids the calls to
> clk_disable_unprepare().
>
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Patch applied.

Yours,
Linus Walleij

