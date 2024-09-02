Return-Path: <linux-gpio+bounces-9523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F159681B0
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7069B1F22A55
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE11D185B78;
	Mon,  2 Sep 2024 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKQS66DY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D7185B49
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265620; cv=none; b=LQ0S7D+jE8bnE4bczBUmGej11pMOYFrFo4aylxnXxcHNq2UZ1RICq1jPDYzUwcxc6FdgfvRATaaF87lxCtnjeFg1aPKN4M31xbzXn6ySHykAiijZhS000EY8Ju/4M6xb5245eKFmvizsyGtjne1XMPqnszr86zC33A/pLhncjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265620; c=relaxed/simple;
	bh=4lmuq5BO94kHKYjwf/STfshOSd37lqKljCe+/DQPnQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZhyqrE0KfJRwW8yV/j+S/lGDlYOTI1ncWO6Eiej3mFMwrxRuHB2h2VNBZs1bd8FwX3vwpFfiW+5zsnu+yiMGo6KbHmi1PG3V00dBmclj3G1y2ELf3PktXPSrcxT1wOpy2qukvwbKuR45u2gtHtu9ghGnNwEWY/sf/rTJ3p37HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKQS66DY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f2cda058so44197131fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725265617; x=1725870417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gqoKM1aect4l0xgmZSyLQOJVqgjUZqiT8L6Ldx5788=;
        b=BKQS66DYGwCmXx+ho3tP1ku7WGrTdKuYxTiBmj9XaD/ILWcsJKsPrf4u1rd1eclvSA
         Sz6QSWxUWIOgq3Xmy/cPLkHwuBt3z1uYAFmTuKafMKhbrYUlV+GDYoODsgMpVJgrXTuT
         JDUF0/MPdqxJOzMECveEuITXpp/ocOUsazQPZiiO4xS8vp4I8wHa4S6wL+oj65z/+EM/
         /tdhDijme7VC5sSFZKMEuMEC03jJV3apXQs2HaxUHjZZBp5ZIrvvm5oOybVIZKEgnWZp
         JzW7OsyonB6nH03SkA5LgEij7iRpu4S5GY9s9D4EQzUZa0HT2PQY9TNN+KuNbFQ5378O
         4rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265617; x=1725870417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gqoKM1aect4l0xgmZSyLQOJVqgjUZqiT8L6Ldx5788=;
        b=bjmXntJ7IlNoURnKA2le2La0kEfpSKSqM6vlXNeWFQAX8BrBeej+nvFP9BY/l8iY3B
         gOk/tCUOdeMbxiQ4MwLT1rnFOXZLtnYd18cDSwq+r3P1IN73yKREvHnxyxRJyb7p1Two
         dssy25JJsR1zZRnw1u7MSmwgr0PCseEhFydfJORUQ384QHcYg6trYemAR8rmCbCIvRBj
         umbwNmZlL1eWG+XJKb8PpyyDY9cJG1OvD9qBbDa9jlBKtSjVdhDdfdTZW9fXcdo3ingr
         UK+0V2KojnzabE56TcBdbk22QkeJcDS9i8jGFkxBRCY5opfuPZhPEX5ifsXwlsrL5bvr
         S6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWAjjCuoheVDhOlgkjSCqiuzCSkJ6E6ASh8qJ1S7CY2rN9dAXx1Y1woV3s5GTEp1R3L4vGbZqkfvoW9@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5cIdQbuYf1/Ff5LlA6DkmHgClRpkte4wvrxl43Lk5M5rUnSN
	v64jZc5moNgFe/Ciz/PGMpS+0ILw0lpF4L2DV4k0wYi1Kn0O6bWNX082/7nSf4+vJlQ5tzdM9/d
	CHZlxwDNppEqerAUUC6E+71iJhhImDE6k2n25bw==
X-Google-Smtp-Source: AGHT+IE19as9qXHa80m04976+p4Hw7/SgTBETcs9158iDLNlM7aXWSyyuCdphZi5UDS6RxRBqwZgoqzaVDQwX8yRgX4=
X-Received: by 2002:a05:651c:2209:b0:2f3:ac23:b1db with SMTP id
 38308e7fff4ca-2f61299d997mr48523101fa.4.1725265616566; Mon, 02 Sep 2024
 01:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829064938.20114-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829064938.20114-1-wangjianzheng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:26:45 +0200
Message-ID: <CACRpkdZc2L2jLufmfrWzqCp3A4oS8w+K6oD+FNyX5pJvE3aw-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: k210: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, 
	"open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER" <linux-riscv@lists.infradead.org>, 
	"open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 8:49=E2=80=AFAM Wang Jianzheng <wangjianzheng@vivo.=
com> wrote:

> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids the calls to clk_disable_unprepare().
>
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Patch applied!

Yours,
Linus Walleij

