Return-Path: <linux-gpio+bounces-18820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE962A8961C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21A833A7DDB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BDD27B50F;
	Tue, 15 Apr 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkBrx0Mk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED782309B6
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704597; cv=none; b=CRTf1n+77XQmTxHDWkC/PmZeOT+TZjpsBu16gdlo3wjPU9udF7N/4WJ6Dtu3wKO00cJTWWBEBaJraDnsyrnHyxUF4WJInor+16JW3bBcvDf7SVAH4KrlF27SZgnanOZ765h5vIRNiz3VqSU1efMgo1hrNJ3tAL5d+QY26PHL66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704597; c=relaxed/simple;
	bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xlf68K/RoDmpXFdEZjlqZqti0zecN5sX2vI7BhaOCUQPq5VFTlrVRAOHwyFqeEf52F5AiAeZxsDOEWIifGpMbPYRiysnhgoHzOI0uL9znveXIcqofOgmy4md6qHKw/ExMDV0q1czQ/A/Q7wQoPLgtQnSwB5gWbNw9EkYDCwkA6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkBrx0Mk; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso49969381fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704594; x=1745309394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=LkBrx0Mk+N6nGorcTlMQNKhYWvmiAZvigVLyo51ogtVx9APzBCjOjiT/BIzG7NK2Ur
         t5I6SACfBdKpdzM3WWO4ofcKf+QVtgR3YTubGuHDY3U6zZrUyAbgUEPZav7QBe6LEF0V
         RXtX8C3ybnsc8b8vmHgMdfHEq9VSYV2rx4xEuhi5smhmhrh3u01HtWYbQoXkZx+AkTEC
         x4cWgigPtt+jaLh4qpU3UjQHU2WoV3XFpHkXZjGstPXFO+U+bW/PBF4MqPUzIj/PER9H
         K8AVi+a8r9R+vJqREAJ69ufC0Ev8jnW1vezKUf9eJqZGyz3jZpGCLtt0YR8C2Nr987y8
         USzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704594; x=1745309394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=mQ839LCopbQjg7MDNorlmF0nFGMfEYTAIVY1IfXtoJLsuC20JLnhxMO2SMeEM2KhJS
         rBQiX0ehXIz+Nn+EKBOaol7VoKCXi54BVIr8yDPfkZdTAbzX8WwpIbplk2qasYNW87G/
         qivFS70rG2h15+8I+VJ6gCxgdk7tNrNFl+2fVGBuU0yGEwCkW2e/wv2wzOT2K3kNJ3Qt
         LD7dABURyK5Ka1M9RBxcBBZKa1Rgm4GhXyB+s4BuV0QED3WBKlftAnot2gw7iqPAV8em
         +AYvfgsDaEWkr2bm5tltG8/L7riTdBSSIaj4k8ramrwyp5uVFtqt2SyGKN3TyUtnCm3l
         WuZA==
X-Forwarded-Encrypted: i=1; AJvYcCVlLW7sufweYC4AY6dQVjMWZgEbBBt0OhwKCZiMSE9b+m3x1KnBZogYLCYtj7oFLDnY6RTt3+scGgDL@vger.kernel.org
X-Gm-Message-State: AOJu0YwPsHemYJ3T5Zqfl84wZkVfoBNgBGZkzICPEICKDxApdUSkz4eT
	4AfL8LVvzNIvTrBQefBGAAHjvwAVKtnlY8SI0FYA8aPdwWoHtyOcHcUjI51PwTwJdIn/orfKOjx
	Gq3CIy1rOqWxGhMVGkKBXiEyWujylEsElAPsVFA==
X-Gm-Gg: ASbGncvy+ZYjzTfzUIpsn+OhEtPpiaHlEiMmBsi4UdXWAjLYbiFpxVpL5ppCIZ74I57
	gH1akbwVv6xQgNVnOArd/wGzxXifV1hgwzjT3NZkbyfVgGlnW1mLmMvJF6QWi2WxW6FrGGzOX/i
	mQhr1bo0K2vQiPcwbIcu3jyw==
X-Google-Smtp-Source: AGHT+IEMlMqsPAGJBzvZT2lPJQosRhpvoETScw1sCKukc31T9fTkGic2VsMp5FRUxyJuWIZeSw3pyLssyZGpIRA+vOE=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr52529351fa.26.1744704593653; Tue, 15 Apr 2025
 01:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org> <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:42 +0200
X-Gm-Features: ATxdqUEiPhEWajxjZ0u616Ca2IYOkRClv6g0V-9rh2iDXiM0Iv0_Uzdx0X_IW4c
Message-ID: <CACRpkdYJNLwKFyzjzOeuZofBzoHci39UH-0H5cEM=97koyW1FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij

