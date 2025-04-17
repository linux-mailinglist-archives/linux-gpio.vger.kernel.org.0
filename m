Return-Path: <linux-gpio+bounces-19001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B9A915A7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D595A423F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1CA1DB37B;
	Thu, 17 Apr 2025 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjLwB52n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384E621D59A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876029; cv=none; b=UPx2dGF3LNxrEFTDddgez8U7RDcO1T7QcxHjE2mYR+4kISb0dPnua6jNT7Ym0ZOQSgNsX+8qRdA2cMqXeKT9owPArTrzCKVAiXFCmGU/NMm96fJIcdGwp02aVyVakYTiXxBdZC4luwZEV5H1eYHQMYgwXoMBkuCjJqraAGnwWHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876029; c=relaxed/simple;
	bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTJ7qtzYu/NfGJhK5KK5ln0C4dUpcT+HUvOX9tc4+zEHzyKiTyq6Q3qnj18dqR6hXVxX0ukc4viX9bUMnO9JLEA0wOv+toNmPuTM7lUEHJzK+2vHNO5F+g2zS8AVmei3ebBN+ya5nAXa4T1s+meFL5AScS1h8JlNivm3F8Ymwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjLwB52n; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54addb5a139so544525e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876024; x=1745480824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=IjLwB52n60q3Q9VFKKP6XWVr6fust+tzRAz6Jg9rFcPHO+R1OsIThj5zvLyXvAnsej
         0m0gnoYOfXokeje20IoVvefHq4k4vf+dGcw4l+ZD/de4DFG2ByzRpG4UQRdoc5vFTu0F
         wbis8hSL7RIxWyMpA7nugFAL+CDgUE8JItkfXWZVOKJLwca50+krEIuG22Ws4gIx/gMb
         fo2hqWtwkyHSlnAdvGdreeOKULJEyIArlVpbIT40ojQjy+f50CS9F9KJW/BPhEKWqnIg
         ziK9pJsXYBD2oPtAXbukwaGZsrau0Myv8dA7jqiGsahbxPnFFD7mq2ZHcB571Cbl5x21
         QkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876024; x=1745480824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEyznqoBqrdJu6XKj04AtQkuSGwFcw9ym4LfF8stkeo=;
        b=vGMsBxLMyetMnxPxuv0eQdlKvmhHskzYQSai0L7Oa5xm1TBZIsS6doPQX0543ydLmQ
         3uvU1JQPAoGJ0OsEktUDFP9MHd0dFub9MjthN6k7hDKxDo6cGb0YirAReNlmPTyS7fZC
         OczDll6+o99kie6uBFoL4rf+jelPRJTIhoCH1J3/KsVeDXX9W8XpoVoQY91Un4PPhgvS
         k9ZAoh1YVtLcnsvXCyk220Hcn+xiQn3pBVnIqsI6SIrCbLB7bsOhfaY7OyS1bBD0HPmo
         SeWlwvE56WAxtPfOGgalBP1qRB9RCt1pRxXZ+NMbRq1RLlvqnewYklRwj5HOmANaaogL
         4+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkBs5iAM6EmdTJlqVFhEW3JT4RQnLoWOT8Zl4GSJl89ZFGqxrQ4PtxyGXvBC5rK5tX9Kr3R+LNlEz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ptTjAhZ8zAZPAImVa+i3zrmBkyOixOSZP1aXIs68srej+5wv
	dPvVSqebg2lJvrLrpRCFZfHTHC9/Plhl9jFr+lhhC0A8mniKea9WqMubi1AMgGZWsoD6kH0zw5C
	Pnl+63HOtvvHkIV1FC8FsArSZs7ystyU0/JMWBQ==
X-Gm-Gg: ASbGncu+tfP8DPqASO5xrlCrGciHWzeFm7OOp5H5b9XxCP9ER1qxe0t+S7r6YAFp8AF
	OuDPoo7nMGJDBaDlx+pI8ScHoIpymDNfdG6uQ90yflGt075dSXXHtrwvp008x3/gGbNdpva9Pb6
	bmpj4YupY7V5m90PLxgI+SPQ==
X-Google-Smtp-Source: AGHT+IHsWIAbtRpfryXnt3qAIwy3EE4NveEHC7HyLBuEny9/7E3MO+B1CV3UsgSfANPfkNtKQcLRY1ygdj94mYcsZKI=
X-Received: by 2002:a05:6512:3d29:b0:54c:a7c:cbd5 with SMTP id
 2adb3069b0e04-54d64aab2dbmr1542697e87.33.1744876024309; Thu, 17 Apr 2025
 00:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416150847.3422218-1-Frank.Li@nxp.com>
In-Reply-To: <20250416150847.3422218-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:46:53 +0200
X-Gm-Features: ATxdqUE6Yg7082az8t1vUSLeJgtF1F2xgv02wcz0LZ7Q-4BmoWJnqMUoGaW2MtA
Message-ID: <CACRpkda42xO+7tmp+CHPfNgx1YEXn6tYDoDXYJo-EnphH9cTXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:09=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert fsl,vf610-pinctrl.txt to yaml format.
>
> Additional changes:
> - subnode name force pattern to 'grp$' to align other imx chips.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied!

Yours,
Linus Walleij

