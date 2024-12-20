Return-Path: <linux-gpio+bounces-14073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547149F9297
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7770416D822
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B1C215706;
	Fri, 20 Dec 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NmYnYINp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076F2156EF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734699235; cv=none; b=mr2wxmQ/H3YuT2yFbRjscqBw4L7wr1hdhIBzz2qxIPwGKKiZL4WYmQ0fY/L5pQZ+22nlpyHXS+r+1ji/y583aKIuauiUGcfOTFZeDSWhgG8KeJmqur8YUsRKsq7eSLsL+uwfArbj9RSrVEb1BUILQ69SYty5vjBbvBgwvh+AzFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734699235; c=relaxed/simple;
	bh=2ijew9uOxRboV6Jm25/29TJF8PLsjBkkwmLMTxyZQXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhpIuKgFcbxKY4zrONSZtcqqwj10xgkm983C14crnfUoDQ8T4E8qM8fr5SQ4e3EhepYwUOcvc2PJVStf/P42fJSR4/cG9WPRlBt9oil1gu3ha1y7jSRlncw+4jZ7yTVCsAAUIEfjEVTWDy++hUfF3INTUhMatWDQChn4/8RxmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NmYnYINp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1883581e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734699232; x=1735304032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ijew9uOxRboV6Jm25/29TJF8PLsjBkkwmLMTxyZQXw=;
        b=NmYnYINpD8+HGNtgWcMAgPUW8OnIiInTCDMaPi+Ekpy76lK9QJIR6FC7KNoLK+Cjl0
         YGxPnlNE7lzgGFaK6QwqUdrOj5JiZ7yF2hYqwYUSJfgSA/cWztLllE/Khn+gM8qxyEM1
         cY8CJTiPrdK11/AzuN0u5ERvn/eIxzI099FkDpiQ3Xom1JDsvYOPPObXDxi906ZL/XcJ
         wAs3kTZT0L/V6SPi146uV+VYirx8TcipsPVKvXbk4OsIuaF5jblm7Ep51HScugvBGuvL
         XJk78dJyLcantvu3aWY/D0/+/f9FD01TQla6cw/3OfSUK89VvYRv9fmb1l5nRzAC36HH
         yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734699232; x=1735304032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ijew9uOxRboV6Jm25/29TJF8PLsjBkkwmLMTxyZQXw=;
        b=Q+Qm8awWi9SIx2pfgko6spVABYFDGoRzAZoANWlE/FYDNDFE2WOULGIg2J8gISZTfM
         qct8LNX68qcx2rVD4bBP8jAB2SibB1u2ye724nuKMui93DXDIyFkOEQh8sGyU60wUJyz
         D4Wh0j6259XAMR0Ebr1mzjFCl0dN9/KxxgJcgluF5ucDPxk10sLdlhRSCb5941AT7o3I
         rteY1xgmomTrmocckK2YcLOQUd/4zScNwUput5ZCbPvGgCoy7Sw7spjEvNY05/htLVmF
         ndZqwYg+LTaTF+dsWc/vV2VptRKXLA9L5ApUyqeWlzYhcQG1caas+ME0XsBhFXhV6QdK
         znKg==
X-Forwarded-Encrypted: i=1; AJvYcCXpQ+I2kmsb6nuhonr/JkBOZtcgA7R1rKKK/nTQKHvYFkFJ+8ER+P7Ap3VotH+nrfRC8uF05hwPcgP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4aZ++k6OQ18RmoM7cM12aJqWHF85toJnFKKOhKYodGKWFjfi
	VaIfv/6Xlccb0C8ru+CERURNpapcEOI9t92pB+CJcr4MjEXmCIGJ8Dq9PmUD3aM1/lMadyPQeRA
	NH60Qxj+xj/f31xCdByiqGXRIl5G9jIyFhJCnwA==
X-Gm-Gg: ASbGncsapHLscgQyQqXwJUnIUzCSstCNb16ElWQNvK9NXqnBEj9NEOlCEHBqSHSzfCM
	ZmGXvFj0XOKBN7Ak8S1InZDYswUlFbI47zAx2RQ==
X-Google-Smtp-Source: AGHT+IEZWMRifc4FR4axtdKW0fCIhp1hzST627Qn6Trhpgo8gXhWYqagPER6U85jnTIy5FPQCYO/byX5x52wVAVBul4=
X-Received: by 2002:a05:6512:3a90:b0:542:249c:2156 with SMTP id
 2adb3069b0e04-54229530077mr854248e87.15.1734699231985; Fri, 20 Dec 2024
 04:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net> <20241213-gpio74-v1-1-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-1-fa2c089caf41@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:53:41 +0100
Message-ID: <CACRpkdZVxVxYReHpze7ZZmsdXbMr0s0Rhjc1Ry6CkQpB62n6bg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: gpio: fairchild,74hc595: Add On Semi
 MC74HC595A compat
To: j.ne@posteo.net
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The On Semi MC74HC595A/MC74HCT595A is another part that is compatible wit=
h
> the Fairchild MM74HC595. This patch adds it to the DT binding.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

