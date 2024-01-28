Return-Path: <linux-gpio+bounces-2672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E983F288
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 01:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACAE81C22064
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA57ECF;
	Sun, 28 Jan 2024 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnN6bWTh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE447FD
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706401674; cv=none; b=rT4NXXwU0sV/dQLFmL/kDswLhuLA0h2hW3IGQODIxqBsWO9xbAvVclhppzOt8ASfjjPzUNZa8/1MhTiyHICoZFZ6oSE3UhDgOG+eAOSWx5NvYhNqI+VPSwXasB8kk6S68bxrPr1twi+C9pi/Py+1kUMTjvbfRdkBEtf8x1IocwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706401674; c=relaxed/simple;
	bh=3G1BZUc/awZCAssluIQWHzMdeWDdPsi0QWKz/a/W1nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLDlcPhF5xqF7pwCZaHEvTqFSx9emaqIw/ExwFWjVD2J0DLNLIZsVTyEdGjt2oxR/J9YlaqaAnUiPMxQuCoX3fGgibpZJacZy7vWsai5i1072yAoFbnrG8gRa5vEHWeqmZOW9bM42amm1BZNNoxwMfX/dTj0aXeDHi5tGFK2zTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnN6bWTh; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-602cd92a75bso15679417b3.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 16:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706401671; x=1707006471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G1BZUc/awZCAssluIQWHzMdeWDdPsi0QWKz/a/W1nk=;
        b=BnN6bWThu7NpMfg8VfYYXG/LgBS5Ix792mJZ4jS5eHGMgYSbOTcpPrU0m1aFZm/7LL
         XXVhGAGAbEZhhRDDiYDfcBxguApjnZUW8bPWLQiV1X2LwNq8xQkm0huDyFCDzafLch8i
         zyq9R8lUrwdTej80rG2GxdlgIokg/bqoLgzq7RR/pqAi2J9pjOOfZLbKbGbj1wj58bKU
         /3qpVeL8UIemA12k0lH+Bh+qJzh7Ic/DTEI6j56DGni65iOAeJE/1JaN0f/eJJB78pD8
         it8zAbrxGdfunjzWYMwJNtSHxAYRtATHJiatmX6NLGRXLZXC0FpURrToHTO1Su52C9Bc
         ewqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706401671; x=1707006471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3G1BZUc/awZCAssluIQWHzMdeWDdPsi0QWKz/a/W1nk=;
        b=L/uVVzBjtl8Kwz7vNRpjKeahT+T52ktkUGjWDlpjLK0RxuxxEjnv0RzYB4lVQF4AC+
         jcAuG+TOIEvGxfAAS9JftNO4eZv21KeOYjp/MIyiQMjRb3GX7qM+si3a7IbGe3w7ek98
         zbG1YFxu8mma+gpitguTVPS8rUcyq+FhNQLM5cckvtF93/MW/RRkAPs+9+a6QyVwc0J+
         JFxlNimpmJezpxr4aWYrshlTqeHpOpAR/ogrLjjk1hCRrzeI1O8P9DBPdGTXyr0jrIEG
         MrnVUsw99lArRC9dcZYkfoe4jBNHEyl6ydenwWJycPUQk1kj/xTfARAQ3ejzSfDOYnoa
         L/XQ==
X-Gm-Message-State: AOJu0YzyNBa06ZBMHBCriRPWHPmUrcbGD0A8ptJRmWngLkCgyL/B0SD5
	do1OWhbf1bE664PP7/0hnRL8ce5DblJaNxaVAdMV2QAeFlM5cedI58G5D8ExYB+b5msF7csXZhe
	mvRLa9Du1Z0279U5fi5dpdlU7J3dVomEkqKq6dw==
X-Google-Smtp-Source: AGHT+IEjSeC4hi0heaZUTpDAlmgTOe454SwsHBCH276W4pkjTAEo3a9iak0Qm8B8Jxx0QZUWAh/wBBvgSnVka9DoPL0=
X-Received: by 2002:a0d:cc93:0:b0:602:c94d:6b4c with SMTP id
 o141-20020a0dcc93000000b00602c94d6b4cmr1654809ywd.50.1706401671202; Sat, 27
 Jan 2024 16:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121-pinctrl-scmi-v3-0-8d94ba79dca8@nxp.com> <20240121-pinctrl-scmi-v3-4-8d94ba79dca8@nxp.com>
In-Reply-To: <20240121-pinctrl-scmi-v3-4-8d94ba79dca8@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:27:40 +0100
Message-ID: <CACRpkdYOj4gDzVNyfkDEsTfHZcQnV+X6bqQ7Vt1KH2kPa0hPbA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: Implementation of the generic
 scmi-pinctrl driver
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 11:18=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> scmi-pinctrl driver implements pinctrl driver interface and using
> SCMI protocol to redirect messages from pinctrl subsystem SDK to
> SCMI platform firmware, which does the changes in HW.
>
> Co-developed-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
(I have just sent nitpicks anyway)

Yours,
Linus Walleij

