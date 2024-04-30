Return-Path: <linux-gpio+bounces-5935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5E8B6B95
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 09:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8970A1C21D3D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 07:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AF822618;
	Tue, 30 Apr 2024 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1MT00pc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F3376E5
	for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462063; cv=none; b=vD+T9p21IMfE3caVzdFI5LSwPMF73IrjyKg8OtaDauv05RcWNCyYUzQMqQPl5gW4W2kcfkx7RggCuueidBs51spkaPZoTtpPdFdGHSpeShxj7cLhnGfWD7lKtCYIGI+FII8S+r8vkpBIn+jcBQJcOdNyV4Y7qD2UupEcf2WdXlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462063; c=relaxed/simple;
	bh=M/hzeBG6OaWFku1EhbZX7s3qNTyz1PRn42pLoTcmWto=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RyobcFTF0TSFcnkVjgRyoAQspCX8KH6XfSAC5X/wfsQjUPAgDcW6sNNTYlMsM/OiCHsDpdkE/K59nkdJqAXyHfFBXRcPPbhGlwNAJWTCEP4V92DJDFZoMwcBOSlR7q7DyakHvtuhHVpVDg5stTPxfrCkKfQXU1EMqFvCvoOpbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1MT00pc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b5dd5af48so37777965e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462060; x=1715066860; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M/hzeBG6OaWFku1EhbZX7s3qNTyz1PRn42pLoTcmWto=;
        b=s1MT00pcoO+R7Nh739Qy/1BS9/63srFTbpyrg6LS9cNS01v184tbOlOYoSHYSw8efP
         7trOc1aJhQu34eUEhvv8z/ihYcBEBIuE6iTftT1q5KaShTTnYc0o0jvprkIFemnJmQ51
         pintOQivJd1ZZ+n3xq/tyX9/Sm9cdMU+hXSBN/6nwH+0lRgDiBK5sW1m/VbzGvu79tPj
         vNa1e5tazlw4B61L+ardquVeETIGxHx278JICFnsaj60V0WgsBKXZAwgvF5choMfxcgd
         wowJKQIZJDjMsBYvgKKMBhovajrGOktNXy9eF0LGgH3Vm19gJj1A/d6yJyMGeW6QGnbd
         1/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462060; x=1715066860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/hzeBG6OaWFku1EhbZX7s3qNTyz1PRn42pLoTcmWto=;
        b=kg5am5q7MN10uG5lanBcVRcEY55E9OB1lrehtrFdkeWfibqAK37U1qXGLVct4RxpUi
         oCEiY4QRpY2HyvyfaPH24kDOzGZIUsFUnwqgemjcyLK5tBn+pcwpTCtkdEozZP4Gg+9o
         bPw7UN50VM9O65ojH9oQpdQVp52ZPQedTlPGXiCOJN0Ze/5zRUQpepgVr14dWiAFKtdv
         2GFjqumnYM3OrwLJyyB90Uvqqgc+NLYp4SqSLa93iMtEfxEAOXRiH4/JNYITsYcKTF6C
         WaJF9VvED10wO5NrvTo87kMhqUCIHHtGnFZzIA3OBBd1iU+wYWvE66pZL/4D7Js14NOt
         /ccw==
X-Forwarded-Encrypted: i=1; AJvYcCX1qZXCX8NU6Wzi2zBhyp5xRNJYZaQ42Ap1RSM5Dwwq+85QW2xvXM39CbZemIM0dBwDqHB/92gOQaVcgqqHVo5GJbfaOYlK5LScEg==
X-Gm-Message-State: AOJu0YyBFu10iebQRe0H6E+5ddxEtpaYfWFYA/cRuWkwoAGLEnqXLhvJ
	bJReokSYDp9yVW7Ki1ARGqwwGQuNJanfICDYdiF0jp9DdMsLtzWh7efX4k73x+8=
X-Google-Smtp-Source: AGHT+IFIu1343enMW9iVavH8FHdSsBD2PkgGl/FjmA/oRCmHYmy2D2AwHMnE6E9debZFQIezWJDQ9w==
X-Received: by 2002:a05:600c:3b23:b0:41b:edf4:4077 with SMTP id m35-20020a05600c3b2300b0041bedf44077mr1218130wms.36.1714462060021;
        Tue, 30 Apr 2024 00:27:40 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c500700b0041bc412899fsm12666330wmr.42.2024.04.30.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:27:39 -0700 (PDT)
Message-ID: <5da47eb853c0acbb6111d6d885cddb475e857236.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: drop redundant drvdata assignment
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Date: Tue, 30 Apr 2024 08:27:37 +0100
In-Reply-To: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
References: <20240430060304.12332-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-04-30 at 08:03 +0200, Krzysztof Kozlowski wrote:
> Fix W=3D1 warning:
>=20
> =C2=A0 drivers/pinctrl/samsung/pinctrl-samsung.c: In function =E2=80=98sa=
msung_gpio_set_direction=E2=80=99:
> =C2=A0 drivers/pinctrl/samsung/pinctrl-samsung.c:633:42: warning: variabl=
e =E2=80=98drvdata=E2=80=99 set but not used [-Wunused-but-set-variable]
>=20
> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404300825.6lxLwvUY-lkp@i=
ntel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


