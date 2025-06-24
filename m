Return-Path: <linux-gpio+bounces-22085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C805AE6F57
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8272417F27E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159D7246BBA;
	Tue, 24 Jun 2025 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpSnrxcg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E11946DF
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792573; cv=none; b=dHUgZnk8t7E00ipLKgvCb3pUVASzsKyh3EVVGgurn4tyJ+WplPU8sckJQ3Ro3Cc/ZtaOn+fj3U18H4DfGgsfd8GU82buJWrGxbch9rLtWt4q3gA5LS8fqsYLCMGd2xm7C8qbL8xY7TMKsmDz7Az5cgvPTlpbFvtDetiIK/G9NNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792573; c=relaxed/simple;
	bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9K7aq1IeOnh6TXo0Bu0Sc0UWQMS3SorgD1XDI3j0tOYV9iOgGTxwgjTjDQPUj/xyIq7sLN2pLDRuRqItEX5YoYXKJsPLT5iiCyuHIcf0xGQe8rcrxNXtDTGKR9xmZ+A2aOs92CEONRxwvAPa+i/PJx2WUJIBZei1Nv/KqU/LzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpSnrxcg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551efd86048so826761e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792570; x=1751397370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=YpSnrxcgP6His/jiye0hx5Tm1sOZSmfyn0sJdK7DtV9f4uim+LANBvNc8LUDl59lLm
         tmmhp313Uz4S7donnbcaJ0JF8NUMpc6Ru7CAILtRtikbmGbIJ/zYLAFaxY0r88YudGZ/
         IBVp+hHIyGZSLR2Gx2jimgSI/BP5toWa06oBMJiqFYDidQZR/4Rr3hxf7XQUVJV60xVW
         Tlokco5egdeRs4+5XGuxNlEE+fpWvz9wyffeD/e/LgwAw1bP6yVrL/Jur3ZmDKS2AP2S
         h3ik/aD+ZmHB6NYpNm9mNZnARiM137HofJmqV3k1b7n3bhIN4uOKhHI+uj11rxunhcoq
         g1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792570; x=1751397370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihWWakMukXt8Os5zOHseSTg4tzKTY1m9zw8OxkJuiHM=;
        b=Qd7uPy/B1VKKQotoWyZxR86+rbMMan6EVgy/Yd4+z+YqFkr7vX4FOakI3fxn58xyyZ
         TwYwR318s2YsFUhvrzBEBI1B/H/GQMPqwT/A5C++ohlVFAwUrhxHR6gxR6hgDm/iRykC
         foETwmrwHXJqlvViRQ1ns+lUd7052IzzgWZ1PKRgQMVLJurnbKChQj8kGGcc6eZ6euZC
         p0s+vGZSxUa6jClwHMT5uzmYXduH+8PkF8gSomAe9pdnTrNGNktvKHn/CIfOK44mJIS/
         v3snYrttboB3zbIcSgf9LdOENXAgJjxFr5sDVlF5VlTkB1GOW7t1CafeCSOAcxqUqmD2
         O7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVDc7LfttIVqT/o7ud8N4u6z5ykI5lrvoBeQOPqRKDLhsQOOScNzXkG6dLBxpUnqz4a7gTunum2KNJc@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1pDV5sCnb904vKzrPcnwdWp1FN5DjEZBAO7HuV4zVjnVSIXQ
	ly/ciKL4HFwEmzm7BHvUMjvSK3SDub2nxeH1csoCBcswlV/VWHAnj0Mt9fTPzn+W+tvYudzhpNJ
	MPl8b5uASHOPH0xctFZUylMgzIoOZy7nH9nIXOI/Kkg==
X-Gm-Gg: ASbGncvTdykff66ltOhjUxrlyAQeGGfTnX4ochGgEuaJYDZGq7e0I9S1Rw9kqUcfBPb
	YcYlNghWHl7nYmsno7lxW/3jwfbNa7nHvQoH2x/7chsek09hMt++MAkB+4cCmESoHAe4nVQ2+uG
	xupojVtZrYjkWVJ27ZPL3IhMem3C2c6GLtlPa+hYeEKuA=
X-Google-Smtp-Source: AGHT+IHmRRS+snn9ezdisZXjq9pNKvNF1NOIie7MqflwaPNY3SKz61GchJJ41LtKpgJIpimyXyrJyvJ1Pacxv1Ru12U=
X-Received: by 2002:ac2:4c45:0:b0:552:1c1b:561 with SMTP id
 2adb3069b0e04-554fdd23ba8mr18893e87.23.1750792570121; Tue, 24 Jun 2025
 12:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620010345.11247-1-chenyuan_fl@163.com> <20250620012708.16709-1-chenyuan_fl@163.com>
In-Reply-To: <20250620012708.16709-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:15:58 +0200
X-Gm-Features: AX0GCFs0q4vtQFV_NNK7FgYpbrOMY93VLrNBvqqOTi5xPuc96sQtOMY9VoZarF0
Message-ID: <CACRpkdaA8UQYX8bFeHn4JCxLgK_-UxR_n=ZCZmgbk8tqSgnFAw@mail.gmail.com>
Subject: Re: [PATH v2] pinctrl: sunxi: Fix memory leak on krealloc failure in sunxi_pctrl_dt_node_to_map
To: Yuan Chen <chenyuan_fl@163.com>
Cc: wens@csie.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:27=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In sunxi_pctrl_dt_node_to_map(), when krealloc() fails to resize the pinc=
trl_map
> array, the function returns -ENOMEM directly without freeing the previous=
ly
> allocated *map buffer. This results in a memory leak of the original kmal=
loc_array
> allocation.
>
> Fixes: e11dee2e98f8 ("pinctrl: sunxi: Deal with configless pins")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied for fixes!

Yours,
Linus Walleij

