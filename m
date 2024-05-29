Return-Path: <linux-gpio+bounces-6796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF18D2E58
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB6A62888E6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F2F167295;
	Wed, 29 May 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXm8Rrb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE21E86E
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968178; cv=none; b=TF6zg8SYipfK0srMAdk1UhUjrKtg2EwmwIgwvfrvVbcnmdgiDLEnD/7D0Dzk+qcAMGrQ4tMOEd0cZTbn8eRXAe2PzNb732RZmhctwOBnJe0QnCuzwiZFo7cS0VKywDhd+YlzYkcBPwmFp9II8sYbcv1Jpi0HUP1+jOsFWZOIiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968178; c=relaxed/simple;
	bh=Q/nLvZ9ebMbKWDAfuBKkm9DIkm0SWKJ80JMb41SoLPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMlAsTcI5/8F8hFR8I20YUsgTvRvHHXdZQxDcd62xD933vG0lJXYY+NGzh+21yw7aImvaiSgIe3M9Y0vSf/YDds5VIyJLSUin5NpA5ZsalHnkEfeLbj6IlLDhQ2eDtfEiBITGzn8+b0/0Me5e38G/TsJbD3cKkmftTIjNshKOv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXm8Rrb2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df771b6cc9cso1773903276.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968176; x=1717572976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/nLvZ9ebMbKWDAfuBKkm9DIkm0SWKJ80JMb41SoLPI=;
        b=eXm8Rrb24Zqthic8ztxHVQWmSOGnrOUgcg3lSdJXsNtag7kMVCAIN6GJA4nHNZkYKl
         xRNIocG+GS0Nx/M7qYDv5XQB5QpAQ7ecUY31K4GWhaV0f+46po2Vz2WYlp8n7CYMo/1L
         KPUqjG3F6En/zOshpPuv6S/Fe625tUIio0lNfAmuyEG5KGX5eg6naYCfSUGOLo7GYFYz
         7bc8b0JZ3A7lSab0JlxBeRKHR1QlfGAnU/4o+ARiiKjOns1sDWUJFr6ooawzM0SnMbxj
         O00bHcn4/2JAnK+A1TW6SU2PJMBg7fNi4Zm5wJoZzxJuvQxKAkkqefx9NY0yHVICOMpX
         0Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968176; x=1717572976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/nLvZ9ebMbKWDAfuBKkm9DIkm0SWKJ80JMb41SoLPI=;
        b=i9DpSzOWHZD8Iou9IbW8+vRpho9ehbrvbA26lPZV18YKUGFi6/4/ausg96HUg9pf43
         195ylfoFbfiE8JLdzhATpPEHL/dFyJucxV6GaaiGN/w73NxRtu2nCsRijzZiDN/1JotT
         gsBK1iFxrJm00KcRsQrCspDHW49y3QUpaKgeARXFKhNie3buvpL4anjdMYpn+yy02X2m
         ZcUcNGZjAzNICUaluV/T3FQdQLXshmPaEeYcfzeItgpJkzWNHVIqEaTYo7UnTulCDyi9
         RybQUE55wB02/OgKF/pxh2LbayStXE5S10pT9krIA1FsPk8W54MpvTA3riamFWGc5e3C
         II9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi6kWLEDBH1cmMLKcLlk/lGcEwkAphRW1Mzh0ZIbtuAOzHMbc3ZvWNbDVyMkhzCSNBqcEEn4TTiNASK7ddcL55hVuAe0N8Ph7cfQ==
X-Gm-Message-State: AOJu0YybFiNOhDvT/CpB+wxYDLJI30UdbrwYM8Tvkc3Q4WzziGr4MwUe
	/ZK+8Fl8x2W6gm4OZgnNjDKeorXqZF5f+GZuGA4pXPSJE9D5cpNeY8U/GFrV8UAnDZG0lPXj8+U
	wuBUWSxho+ZI5AKQf3u/dsvywYeGCo/37kL9kDw==
X-Google-Smtp-Source: AGHT+IFlX+rjINhP6rj5KImP86n2ckidVC+rBC7U7ObxqdZfbojFCSZHlagJ/LaoPf753xBgaalezz/mT4lgUB82gz0=
X-Received: by 2002:a25:ce8b:0:b0:df4:978c:3794 with SMTP id
 3f1490d57ef6-df772167874mr17998282276.1.1716968176161; Wed, 29 May 2024
 00:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2413a1f99278d70313960f13daecda9ef54172d8.1716807432.git.michal.simek@amd.com>
In-Reply-To: <2413a1f99278d70313960f13daecda9ef54172d8.1716807432.git.michal.simek@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2024 09:36:04 +0200
Message-ID: <CACRpkdYsWjCmK82P=fqxSJX9WstF7HEYUBR2fUYJEDzfGrV11A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-zynqmp: Use pin numbers stored in pin descriptor
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Swati Agarwal <swati.agarwal@amd.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:57=E2=80=AFPM Michal Simek <michal.simek@amd.com=
> wrote:

> From: Swati Agarwal <swati.agarwal@amd.com>
>
> Use pin numbers stored in the pin descriptors instead of index value whil=
e
> creating the pin groups. Pin Id's are not same as Index values for Xilinx
> Versal platform, so use the pin values from descriptor which works for bo=
th
> ZynqMP and Versal platforms.
>
> Signed-off-by: Swati Agarwal <swati.agarwal@amd.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Patch applied!

Yours,
Linus Walleij

