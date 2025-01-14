Return-Path: <linux-gpio+bounces-14776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B58A106D1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 13:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFD0918872E1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 12:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910FC236A73;
	Tue, 14 Jan 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y33ZH2eK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885DA236A61
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858307; cv=none; b=CMrOjY4pamtNVdCpixExvGsQH7bzzdjKvkOFDtNHkoidDHTpQ9rpehq20PCbpO9mj/cq4wo+Cvt56nsOlBk2VZPul6UG01chEY3gNhhG8K8Sb9FdRwycU5uncongDpmALtQ/wXWdyQSHMR0TQuFmkzCdNVWr2zMFB63aQ79HmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858307; c=relaxed/simple;
	bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9yQGKQPLZXs6udJL50cc/viGYkZTYTsJ+ux106wkUQ90Y/t34nxwK/5eKLA0IEhkA1C8YVL0zjn5YvI4IGAFxk+Pk43JC1yoo5txKkZRLWD78JPUH+Eazox5QPtaov/jI12DtsK5uXm+Lr9MD3P/ZIV7DGFzed3HBiF08bhX40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y33ZH2eK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401be44b58so5522539e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736858304; x=1737463104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
        b=Y33ZH2eKghe/9kGMTVzUlqsuu/1JbuSmT1LaSncIGPHEOU9g/gBmuzvE575ckLx0wW
         1hxzmeetoQHo5jCpScBMYzTlUXW5gjqUfi68j427418LuRPkzh1h3QBj1Pbwb2u1ER4I
         P4sj58CM4M5DKPtYphrYzXjcjxRWtZ/amQZZQnBCymSQZ73v7VXg4gl+h3+hhhOiLgsG
         teOO7+yqb3Bt6SXelufjNThbNVsN7FCqnpUuiRSdnUIvfXNFist9/Td1sUAv+L5J9X/v
         whKrRiavVdxdfgmlc9w48X2SA0IEpcx82Hla4HGimDiSCeNKVHy8THXOohI9MUYIjlv7
         zzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858304; x=1737463104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
        b=UQcfDuggKfbfQE9vwjFpPrEgNlKvdG0gg4SesvWDXR1IDekc4TKeiTZ8othYqdveMa
         ZipotOyG4OIRFFJjSyuSzKV7GH7o2fOFgXRyIeGYEpk2kv/sBqn9IPjywFBiAhLHEHWy
         MAL/mFqQ3uwGDx5zPs1xiDdKDjiFSmNRjTqCMsAPwMkYVj13C2W/BqI+XJrcp59akRYg
         6W8E2DhhQdob3OCjkuedPCFJIuV1/UDdEBuZ/Ty7FACyrtZWsQFdLsfFBUXNGH6fnvOp
         /UxB0QYDOVvfuXhalaneZENTQBa1+BtGV4xlNcV39DFGyL0hV30nnnoetuHNNuHS4toM
         iX2w==
X-Forwarded-Encrypted: i=1; AJvYcCVL8L9K8pzAwQdD/L9KYQfj8CaHRuccmuI9vUziU6TmRvtV1X8q8xzx+47SoWLeiCrbwBlHXtRTbNNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnmzQ3h5BANSBmV8c+djW8W70uunrQfK5t6SZeQBahkqiKeyw
	K3iyMsWhDcrmoB09oXRQN1Wx/Bb3/ibIaZI9zCg223LX3CvC8IF607BGzFFKUHX7/Ve7yByCJtQ
	MeZMbHJrx+YDyWt6Ega4AC46FHu/K02qWNLTtpg==
X-Gm-Gg: ASbGncs4mbG0sFNpZw9c1UlSfSZZ65NOSVnU9nAjMZJf6e6wO6zfOWa/y4rBQqjIJXv
	mLASXYhJ8mqnIUmRzZprZK1umaf839nisbcfO
X-Google-Smtp-Source: AGHT+IGcvU/U3n3KiVK8Pas9Rl6/CCuxSKRYPHEejh00b9yg8f2JKHdOjjfDGEy+haFbClEH/nX0/RcLgiFJCruBWNo=
X-Received: by 2002:a05:6512:b03:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-542845ba92amr8849466e87.16.1736858303656; Tue, 14 Jan 2025
 04:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106220659.2640365-1-zmw12306@gmail.com>
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:38:12 +0100
X-Gm-Features: AbW1kvbmhkHMhFNltkPbxNdF01Aj3zGBI5__ealYxb0W8ke6YgJlZ3LsL-hjuu4
Message-ID: <CACRpkdYG6EO2x60Hj2tN3ucOQsA1c_x2hh5gd4frr=D5V=Lbgg@mail.gmail.com>
Subject: Re: [PATCH v10] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, marex@denx.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 11:04=E2=80=AFPM Mingwei Zheng <zmw12306@gmail.com> =
wrote:

> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
>
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled wh=
en LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Patch applied!

Lots of iterations but the end result looks really good.

Yours,
Linus Walleij

