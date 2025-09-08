Return-Path: <linux-gpio+bounces-25746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F75B48EB1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 15:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 967184419AE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1462F30AABF;
	Mon,  8 Sep 2025 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWAKFTfs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDC309EFA
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336749; cv=none; b=p5YvuMlbwrsxz4TvAcIDFiwxXTPTqI5RW+TvC1vFsARkaZLYC5rEOErbzBFhz/JQIKjAm0239asSFZI8VadbFoBu4MNP/AhZnc48ZPoVdqLAwFOngMAm1iHCXuTWjNOlhnpXohpMOH8lfhY1bT9OMReg9bQ7SO5NC4mHw/6Nie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336749; c=relaxed/simple;
	bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbG/8qNidMNDXY5IPbR/zaU/oapB8mn0BhtksV6/Uq4srIQZEaSv9/Mff69b5828HEZhYbkKZBAVfNsU/cPJTBUGbs263T0wn3qa24Evph7QjsTwS3SO91y8WwxVoRVIoWA0+OCIrXL7J/889Dw9Z3dmZwBQhtM/kEzrxdqfwXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWAKFTfs; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso5105602e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336746; x=1757941546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
        b=wWAKFTfsK1JlnBBVH6qjsuFVaE+Mtpm4d79TTwBjvveQEuxWzd5fwUCWUE4DHHvA83
         5BV5+CmZERW1sgjSZfjm7A1JKEtmyBvPXWv2c868IBpGiZR5XbZT69ln04lkOghoH8Gq
         sJz1f4Dlb2ZTd5Kj+O93G0ug6nXvwwW6Io/jjRKFHOQfQtAoBnMdQX4YpmKQ7PAFdGCD
         2VtD8QSDpbny/yu3CVH/owmHV9KHyeDhTU1FkJnDIHY7/rXPSBi109DMeJuudp7kUDAY
         RlClapLN9wUQnpiE895qF+whFGZGOuyDJX0uqID6hiS82Zp1QduIj/5L1OHLxdhz29bv
         248g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336746; x=1757941546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYN91bQqUrNYUhmQdW71bD3/SM1otCIFFxtgi6WtlVc=;
        b=fWnf5jEbgSh/2LvKKYebYn56IUhei+jsanbej711xwBWYNDHELL+tkro28W1L8s3A+
         5xcFl7H+1LAaRsP1IyPpOSQNwrAC8mfHZ2OdXS9k+yCcpbvardRL4yNpxt0AlfycqALb
         xiPruK5oWuYPy8vBkbXEgOr07cvP1hKDuPuIcTGYuxJa/YQqFh0L/xvE2DvQO7HOjuEh
         Tq+wrqV+FUFzbJ8yDRPbIeahRGB5+gC7pumm5ElVQ2GUXDiP04bT9VVv/eFcpopKFedL
         2eKQQaezZR8sV+RUSUPnZnxTR8Sm7x32WG4wQUkRY/E3mveFaGm3ljghuTYEDrJw+Xec
         w5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSCDu53uJzTq0JDGHJff+NWd0Me421YPtaCBluzIGVYFZRH6zjR2+UYJJx9BDlHD7qiGHZVgAou+aH@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ9aHzutUZlN1f08TNQd6wS+S9A9UK7zx+NTTP8rVdI4l1jCzz
	yCsPp30C8vi7VDDx0GWEAoAXWSqR22KlEc7UMyYsSxvhnvztLOZzl4tCCohSHc/VgPPO1xZpLx7
	3LH3U7L2aIyeiaOM60IWPtKnbMc8ke81/vZcH1cKX+REabmBp9eJN
X-Gm-Gg: ASbGncvzrdJMp9tbDutt4JAyXpqLava68wuu7r8rY9yri11SRpEPa8fz30jcYh5X6+0
	WxfrzM9Uh/r/IRIKelS70I1j9dJBWMitFXbNTTCOhG7mQohLScpMOV6nO2VVNDMMk+6/6jSCb4c
	lQDp59r0EvH1eq78QoD2ADrk0oFYeBbGy1idu3DRCM3h2Yswa/adVpxmA4ALVkw7jPXqdY99nEi
	77mg9bTv6d7RVJqyw==
X-Google-Smtp-Source: AGHT+IFlTN8OpHYsGHM62R0OPEAwkGGAxDlHW1WL1Lov0st1tkOFwInpDmo4NNdZazteQFyHlXy5vp/W4pyIsH/Vy4c=
X-Received: by 2002:a05:6512:33cf:b0:561:96e7:1048 with SMTP id
 2adb3069b0e04-56260e42bd8mr2388356e87.31.1757336746015; Mon, 08 Sep 2025
 06:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
In-Reply-To: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:05:34 +0200
X-Gm-Features: Ac12FXyXUXNncuUUxovWiCD-JsAXl6Mwe1cAZlACtOqaRJ3LpgqrnQJl9Rw6oPc
Message-ID: <CACRpkdY4Wahd88d281Gxc+oGdHtpiZWRFUhd3W3w98v4qnj8uA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add SDM660 LPASS LPI TLMM
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux@mainlining.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 2:30=E2=80=AFPM Nickolay Goppen <setotau@mainlining.=
org> wrote:

> This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
> introduces pin_offset field for LPI pinctrl drivers to support
> SDM660's quirky pin_offsets taken from an array with
> predefined offsets from downstream [1].
>
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27=
-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>

Patches applied!
Great work on this series Nickolay!

Yours,
Linus Walleij

