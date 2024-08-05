Return-Path: <linux-gpio+bounces-8567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 102AF9475CB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5812810F8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFCB1494D6;
	Mon,  5 Aug 2024 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6PAh0qL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A71487CD
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841940; cv=none; b=GG1+WNVw2JjpiR7Ip1SqYnG5HZEUP1BLAyGn0YzXdoprFjd2Cy044sFqMCEluDDJ9FESqO3097RVoOmPOsWJNW6/e/plFOfbzfeDcyyngAi3DFSMe86Yqrgv5ZuvQKS7yAJEgl0W8zrY7F6f8Zw57WVTL47qR7UclUm0VhoRkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841940; c=relaxed/simple;
	bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEOHIw0HSbvQmsIPiw0RlAbs3CciOq+GkB39v0DyAyzNAs9Rogv0tc+f6Pu1TtymnQm0uu0UUh1sDlteUusbzBrwak1mpnqSDSqr6VJ5lQ3WY3H/cSRwyPcgtehtO2FZysqL2RR5tB/9rZzEmyArykVGaVydzT8hUzn2bj4Jwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6PAh0qL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f025b94e07so127804601fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722841936; x=1723446736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
        b=F6PAh0qLfKee+Y3rTW845I1uCLHQ8Rat440mQtdrBlKbu1YgPXbeks7bBSIDeDewf3
         L5DTcEC8LVH3UI50m4+VgtxaVOm4ZwBWw2L0Dxy3nrc8yfypPVPXLMlCPOKQavBkFQ8F
         lditnSaREqLIOnKCTUdqc4YnptJaxCObsRyLX5pxr3BVJGrJvdQQ2KphuO7/O2RFPgl0
         FGtMUwWdJfw5cDcFLrMs7TXHs6P8844Logeo/VYGtJJsnIB8Ck7x7Nv7Gm0QV8W9+OTK
         WCtmYh5LPu77CoRPDoNnN+v5mij3ZVBFtZrx0e1VVhGbe7kogpEp90R4uYyWiPRs19lr
         W78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841936; x=1723446736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
        b=PctqlQikqgoAAr+ugMCI81FkxxKRuCNvaWrTeLK4p3OJTIweXVCsni/ZBoLqsc2txF
         rLTpnpng4c0quuzDWF10l/VIkpX7NBffbc4FfzzQmok66rXDOrYrGN7zT11IdDeOZhyp
         6srVGOmcttlB4x+zxeSVf/wdXIqJprjDoZvivzy+xygsiW+7Sns/E34nsl+3aqLlOYCs
         q7R5985z+NA/03vyeCX2g6nChc+a3NiFVDU02962Oi5hQsSM0ewuSSBowFkZgFdBhgPL
         FvUdNw18MmKgEyV/8XRNmwIsFag6t4zFbTuoSyKRPAfn4bcUkv4WtD5aWwIjvBCv4jw+
         MkNA==
X-Forwarded-Encrypted: i=1; AJvYcCWcKfFwlaXjO/dBj4p7OIZeJdMqt9mw7Lh+ypkwi9xXF80dm1V5g9NWuhtVjvkX0dh+ogv5PCHlpV3/J6jkI1JUHfAW9mG4vMG9RA==
X-Gm-Message-State: AOJu0YzBr2FhwREs8V21oUKw5op5qw495VD0a6olCGlwYlGmsiBwP8z5
	gKuJP07L6Xt3f1tZht86zy8uJn/WyL24Nf/gvddm4cZr0yEkO1sY/pcp2VRoXSNp6sckGtMTDBl
	7GT4E+iCyvEUuHNIz/alEQ61VPZxVCl8buqQtmg==
X-Google-Smtp-Source: AGHT+IElD4u06pL2HqZSnzigcAhhzYjCaxNweUiYxJJqrtc3uoIYmMUVpFh1OipooKZyULCeycnfHLDZuNlVtaX4yQI=
X-Received: by 2002:a2e:9b88:0:b0:2ef:2c2e:598a with SMTP id
 38308e7fff4ca-2f15aa96971mr72869621fa.11.1722841935651; Mon, 05 Aug 2024
 00:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:12:04 +0200
Message-ID: <CACRpkdbaGtZgKFFjxGcerRi=sC_WU=-fnGt0D5u9pFTh85+kRQ@mail.gmail.com>
Subject: Re: [PATCH PULL] pinctrl: samsung: Use scope based of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 12:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Link: https://lore.kernel.org/r/20240504-pinctrl-cleanup-v2-20-26c5f2dc11=
81@nxp.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> Hi Linus,
>
> I got only this one in the queue, so sending directly.
>
> Best regards,
> Krzysztof

I missed this last merge window :(

Can you queue it for the next v6.12 cycle, or do you want me
to apply it still? Was thinking if there is more Exynos stuff coming
for v6.12 it's good to have it in your tree.

Yours,
Linus Walleij

