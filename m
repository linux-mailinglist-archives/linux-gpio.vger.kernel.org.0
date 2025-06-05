Return-Path: <linux-gpio+bounces-21043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFEACEFDD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CEB17A2AB7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C77822B8A9;
	Thu,  5 Jun 2025 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kt+WSbE9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DBE227E94
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128581; cv=none; b=WEn5OQcEj25LtJk8DieKV5NnxaYd9yAMQIU2KAzdx6ywXz9gjlBkaXD6ARlCUNWfTSGt2Lac7gDnZW357cl4S6dr2YLRpuFBPdXMdybBeYIZ9tsJpTM8eaNuZ5RDPVddfIdQPcVoYBXss0A6enOHgZtw4HQEpWfYxgdXcl5FRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128581; c=relaxed/simple;
	bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4k7OjiQNkTPe4uM4vGee1c2TOD85ROYGzqj5OYRE6NJ0MYiWOqvBgRFSsfevxtW4ZBXYwQGTN60ckrbwgs7ZpOwYnBFuXOzhAASU3FEN6mCC6b6aS5nOTGuU81klY3gY4E5UGY1KfNFlmsEM0kwEL+uBwDvF9suwt/4puq0aDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kt+WSbE9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553331c3dc7so917800e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128577; x=1749733377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=kt+WSbE9nVghB9lTKcZ2gMF5L4D6eZWSU983I2zvI7VoQ7V5Hhv63E2xEnI74JT+o7
         sp0Ej8cbYaHBZzztRNl58gVwuOkRUz0bT6dw6qZ9kK7mNOsA301Dim+8bgVber4bsLlh
         mEownm34HDEqEkntfRI2TD2j9EnpxhTp1lidRVs9FRbrIhHgAZtJ79nEUHTV4G40uLED
         SrtmhtGs6JErShVfGD3yl7+c3vjN4elcQ9ab3wQGOz1C5N/8UreIcYzTdujSwIDGWyAR
         lglBNHPmSXcgnBRo1j0BviJ7uHwbi0Fr+uOZNS+tP6pSQxrL7Y57nna0TVMEnEeJrxgG
         VWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128577; x=1749733377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=SuOiYOceO0BZT524MMZJJLuJGV/YbvtHxnMq2lygvrCkdiUYqTBE4X5uNwqrCMXSci
         9NLTZ5zNWWTIh+w37hNJhvJdAbAUmDuxNsiOHJiFwbv4Ic4wW7wf/+K3qVN6ne7EQtBx
         s7hlpl7lBOD/NDmc35j3m8CgPHdJesDE6bgjJkQV84VhAd7/YMWLFNTfzIMVxy7v9pMP
         Ijs80PeJP37PVhnidmYphM54pRqKCSeXsoRqHVurRX43nMgFxRMsKdu0NuLFCZiaf05g
         yfYY3lwk8PkCQR9N1vyMDReSs1jMXmY2z6ESdx351CyLh0UkHxqMUl9kKgI67nm6OFk6
         B9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVESXnR8KclMKa+2kGCE1a4svwHlMuaCtxr/57Han15GXq1H4aWGc01F0KkJbg3FtpkGEikpFoo0abL@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGTfgfpvtXhUPMnr8tltxWwB8aKA36BqxH/JnbkSbVwSYOyUY
	UhCnKA/1GiWYaibUMs+JrrNSHpA1tmDjzddsYLnLB6xVS7md6gZ/YcJVru95xgQ5ZLqhhILscE1
	VGPXWUizpirnuevYSiwrZ+qRx/ImvdDgAjIL60Go8ug==
X-Gm-Gg: ASbGncu/nk9+hGge5ond1Ebcjs/b1KaXU7aOe/Gi/VhjnP3uBkrFK1I0iQ/HZmPBhHc
	HQtA6RzgxQ2BXZqn4Pz3fHqlh5rfDz7sxNxkBrfmcg5oV4bRhqGV6zgdJnseUn8ZdOk23AY12UN
	PIATu0xPjpU1M+E3DrzKP5AmNoZWheY27K
X-Google-Smtp-Source: AGHT+IEtlN9LmFKCqkTfr1fMDsTcWr6BPb/SNfXLFckAF9Sr8ZXGsmd9lFBvMAQkVfe0s88El5iAUEXMpQYKE5AAkEc=
X-Received: by 2002:a05:6512:3043:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55356df2aeemr2183360e87.51.1749128577147; Thu, 05 Jun 2025
 06:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:02:45 +0200
X-Gm-Features: AX0GCFun0Zlf8oI1kptxrVzEZHeoQoovvg-1R2vISTKQmzQE4bFTIdqUSf5gGUc
Message-ID: <CACRpkdZsyUR6_Rbxcbs-yUUm=U9UKGCuFp7kmmogqsUAxzTZuw@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

