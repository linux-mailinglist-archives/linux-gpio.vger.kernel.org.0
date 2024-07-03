Return-Path: <linux-gpio+bounces-8003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2792605C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810B81F216EE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F2A176AAF;
	Wed,  3 Jul 2024 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c61hXd0T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24513DDD3
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009919; cv=none; b=KxcDyURXJ3edAEORZ3MlkAmCTY3UVqh5MlWPG3as58pwEpPbiiyS2WWLoRSBR4KM6MG4EXMOeMh5lugmruV2npvK2BBO447ZTfIjhx3KctXSgpfw+jTSN389mD8YwCTZ0u18q7FiEyhVqYS5WhtKMDgUsJVgRKuR4V56N6oXAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009919; c=relaxed/simple;
	bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+xjBOzVyV5iVlduITkTZVav3rZPN53v7fjYiQYeyJ6JMUP1wASPopJbMpekVm2Wq6yb6niYcgCoo3Ko5fG5iDUTPkj0Ltf/c+DjmxWZntkTn7S5TSvENfXxw9nyVAwwASLhkMt/JvqwCK5y+9dyb79yJrFJK3B0fHnp6d9vCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c61hXd0T; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so71300291fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720009916; x=1720614716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
        b=c61hXd0Ts1JjFiDDmbj8mInwuiV7u7G7W1vrZWMmTKZi5+T5hIogFZ6/Hp3Awc+MFf
         ISnYyD06Y5XUYfAW4IEHsUO5+ZV/iIREv+IMT792WJcxnQ0e8ZFizNI0BM7wLVWPTckG
         9mnOWAjRjfq28keQVpHzla9UdScNO+Fl38jHjJYb7GA8Excx03sON/fv88b/9depkJ3Z
         vtRTCt6C6PUzkUjzb9ZFRSlq2oeD8+TdbGFVsCBTGdp0hRhRi+WwrmSf4IE0H8Y6dFV1
         ePkltkmT7y1yeWjYziH19Mpj0dhwH00343AFuZHijCH7aaZBEPYAPlIymIF4GH4CRlVg
         V+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009916; x=1720614716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WsJacWyt8E7yx/VSCN49ZeOyHeRmLxybP/jwc6iDKQ=;
        b=PYDmbpEZYZsjgTdC62ZIaIi7N/2gez2pIZTXKXAqXEsscJMxlSi3H4UuH+c34nhu4G
         E7yVesTx2ODdv2jQdWzh2w7G47FexPSUFJpZvxz8fTrlAKa5EiYEXD/JFnI8As+4SKR2
         zoHnaOctGIAoG4WyPMREdDFMvRfjdOtaRbqzaw6nNtDFZo2Jt0BPafE9RsjoKnf1XmTx
         nQwLzxbgBBmDvDQE32sKXquZnMN/gQQGmAbhkz0uqPB4sJaPs4DizOaeQfoNurlQf57o
         JgUK24fuUdybYyQBjfzvC5zQC2kneFI54O5OopT+An1pvFGEi9JoSqY4YN88jaQHjqDZ
         fteg==
X-Forwarded-Encrypted: i=1; AJvYcCV76gLQ0hdktGooGjh5aZd3rVS5+CEGckURRCC7aNd+WGh9DkS4GH7AhJDEY068DkzQvCqa/SKzXSNGYrdcDIt2nDaDl37mJfz/NA==
X-Gm-Message-State: AOJu0YzGabQ47hDKXVWKT1zWm4/7bdUnu5K9zWUMRCW7pY33o6xHAfbb
	P3POeHr1GYyDjIpKgY5cwTuXFJMeXsd3TilDGz+RBz7Ts6OygaWNkmgqTZtgcHHYbQMClEz083w
	hr90T6yWLexyMisPdDR8ZTTFwqG++H2rEpDokjQ==
X-Google-Smtp-Source: AGHT+IGyU3wFEVZSUJ686bAHyx26jn9iQj70J+h9EnuMaXqU4LAFuMwiO8Tl9bWYBd1agpNYYRtBxAHFq2cglzpoNZ4=
X-Received: by 2002:a05:651c:1a06:b0:2ee:8720:b4b8 with SMTP id
 38308e7fff4ca-2ee8720b68amr10644331fa.39.1720009915916; Wed, 03 Jul 2024
 05:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627003654.242870-1-alexey.klimov@linaro.org>
In-Reply-To: <20240627003654.242870-1-alexey.klimov@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:31:44 +0200
Message-ID: <CACRpkdaxJdr-B3CmL3iUPgZHo5sTLsisrDaaBQaPpug5tTQBVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: increase MAX_NR_GPIO to 32
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	andersson@kernel.org, krzysztof.kozlowski@linaro.org, 
	linux-gpio@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	konradybcio@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 2:36=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:

> Account for more than only 23 GPIOs in LPASS Low Power Island pinctrl
> generic driver. The previous value 23 was chosen to satisfy existing
> SoC-specific drivers. However SM4250 LPI pinctrl uses more than 23 GPIOs
> and its probe routine fails on:

Patch applied!

Yours,
Linus Walleij

