Return-Path: <linux-gpio+bounces-14320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E469FD659
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 18:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C251615C7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5B91F76D8;
	Fri, 27 Dec 2024 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRtP0dwr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6531F708E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319199; cv=none; b=t+w2Ywp1u+oK2482rLW33ZNsL6IjRxU7cGwlWGBPH68eKrVt6sKsa/clslNE9CnK5y+1ow7uTv1re2fbt/OHN+UGWr0GbJjHa2wM/e0/v6yhiUcpM5LvGgtuYEMf4frjNAbQy3C7ozofxHjJLuNgnW9/b2TjiyuzqnYo3jjFEkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319199; c=relaxed/simple;
	bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gb0HvTFJRNnTVSKtmgshuWpfvYJ1UXZVdD4Sg9oe+xZNvhGqQCnw/Dl+PfDm+6GuP1j4HpdUCo/Y1k6lRLJCTvgZzlWoHvTEUzBWNAatSd1sUVxlC2MUSgX0+pQ8buKggyZZ8iZDAaINM/e/uEeAn0mJqCEEPP9vKl40lU0vMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRtP0dwr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so7988487e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319195; x=1735923995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=JRtP0dwrzXtKV1p8C7ZMwMXVv0XqQ6G86dNwoxsAReyFxA/K3XITue6WlLouLDnXDc
         LRRKYkbiCRpnob7QAsIdyZ3sx8G0nfNku1m2KjvEbrtf3Jd/7EJBD/PMHDE3TdnmQISL
         TQSDyYhilknqwqsDdjqedeCAQFhdrD7ZiQOpAJoDgSvZd5ZjXx/JqEUQTOS6T1dVAj6f
         3efv7I0Su/rhcU5ed6VU7EaS72ttPuadERXj62jgGTNdgfuImIjhCDblBuIniF0Q1jv+
         /XLnZYehGoSqlZPCgTsB5aej3xasfqW2xj14nGTEDjEp/6R0Ff3lZeI5MmOzfchCxNbx
         f6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319195; x=1735923995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=oHRsvW/H3Y3nhixo+gbLjDpxRtyp+sbz31Q0ab7mUI4Exsl4I55E87O7luMHL5QZTs
         8Z0LL4JhGqMgIQCqa24IuWKi74DTDIDOG7iy7+lo1uBB9zi157/xYB6Zfx7GzwIgq3zK
         clNmSokyoMqObGf7LAzwpwsMX4gNk7q3XR9ztEn5zj0C753+i+msB/iFK4T5Hyjz6oTF
         hMiDKwzAfojZBWDBZTc/YnFI3jYEaqOOg+t5QRHTHka0HGalyN4y2yX4xpTw7nhxNJqo
         JAykGv1DK3NyHRjC3m7Ba96uOcSt0cpuYngzFfOT6LwfIMG+Hwemy2JyM4F0F7qKq9oH
         or8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJZxXN7t3YxiJuK1+a5avh+9vhko6tlLMPqY2ng2osXV7UpsSAluxw0okFNxYhraFjPp/ubYwuw4+8@vger.kernel.org
X-Gm-Message-State: AOJu0YxQpFiiIk8WWFIrsD9ERLILx0ZyB30HeXgewgoFqoLSo+ZAjG4V
	aZ4obIHMpFCZuHrouJTT+7odDIE8uH3yuYNpHA76sc+pgANk25TWX1FZemh2g8O5ExOeimTcx88
	yCduxRwRsaYQwmO6XcPUY1HkMxk27A66gWZsKTQ==
X-Gm-Gg: ASbGnctpX3+/TguGKCCVD3IOlkCvjizWhlFjUgNd9OI44tRY1cR51EtN/lPwHcf5HGc
	0cj8ffjo5ISbI5NZkxAZ72P1SA5r54yHa04Mu
X-Google-Smtp-Source: AGHT+IEAF5Jp/QDipLuJyJQRV1ZFYVHjt8w4LULM8IF+C9aJBkOnwrc7elyqOWcRa+AO2vKIjyJhQ/+3xwflHVTRNdg=
X-Received: by 2002:a05:6512:4385:b0:542:2972:4deb with SMTP id
 2adb3069b0e04-54229724e47mr8311291e87.18.1735319195404; Fri, 27 Dec 2024
 09:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:06:24 +0100
Message-ID: <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
Subject: Re: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Saravana Kannan <saravanak@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 9:21=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Current scmi drivers not work well with devlink. This patchset is a
> retry to address the issue in [1] which was a few months ago.
>
> Current scmi devices are not created from device tree, they are created
> from a scmi_device_id entry of each driver with the protocol matches
> with the fwnode reg value, this means there could be multiple devices cre=
ated
> for one fwnode, but the fwnode only has one device pointer.
>
> This patchset is to do more checking before setting the device fwnode.
>
> This may looks like hack, but seems no better way to make scmi works
> well with devlink.
>
> [1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=3DCfZ=
WQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Please drive any devlink-related patches by Saravana Kannan, he's pretty
much the only person I trust to know how to do devlinks right.

Yours,
Linus Walleij

