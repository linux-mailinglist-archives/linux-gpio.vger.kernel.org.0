Return-Path: <linux-gpio+bounces-28388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2AC52513
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D47894EEFBB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 12:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE4E335090;
	Wed, 12 Nov 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxo36mmt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B75A331A73
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951427; cv=none; b=spFMkh1Z8TBRvJdF9xJz024VX6c4br/K32V6kVMbw07UvoXd36gMlE1alzixxlg98tWlcsTveg/moBPCaShzOoMVDAeLR8qIN2wAJoWCBHsAAufZiRMfdO4Vdm8RSJAvF3aPBErFPl6htxRlXFxTZlRLk80FrQdtpJxSTm9bOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951427; c=relaxed/simple;
	bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVvh2zBf3j8FHhySs9NPz9ez760YhXUiUL+E8yZGSIjzlbqeuB+Avli81nl8XvRVt0v3BjAC/O5XkEraa4lGsHgu7uZVw/RzHAzgYhAUeYLY5fJpShpEFdtaMzoGvHOC8YNxGjolL5LhhMmFeiPPGzNV5D7m/vE6LkGJzN26pQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxo36mmt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594476f218fso561067e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951423; x=1763556223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
        b=uxo36mmtj8Hh+wII3sTWzpG8uou1bkkJCbYDvyvOcxOOpzOUM7cmRMlItxiPTpT3lA
         0G3JQ0olpAdjQaaMDHrN4TDKa9GjJx7tk6u6pd3Mc2Txjn7ROQuK4pSzF8Gq7fX4YyOk
         MZjPar6m400HZLMhAqlqqVEBOJxUwcjMmfTtUkAK9CMhlolvzTw3+2VH+L4mzl1GdxMZ
         qr8/FIgPcanmRg1Oen4DdUs9Iryg673YXkKnJj6U2FDyOB0MPjflGMfZpKyT9PHjSijc
         u+lPz5943ICxpmNykEHYHxTVJeIAbR2JReXirkb5hro76hxAHTHg91ciWg2dX/tjksOM
         AkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951423; x=1763556223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
        b=DgBFClLVXNSDBNVmjjWUSppsIlbOc5kOLZazhOxANPjwm3vh194DgtCFk4b2daYGBt
         swcEnBz7I+niBPHJtJPHKLubxFqi53eWhN/ouUBKTAz8bezHg0pHyb09UePz8EHDYTRR
         odQizBK9wZ1AEhvGX8u46ahYvw4gCFG4KVhd2LkVsjVtrV+fmvhPMA9pWz2w+5bqYbBc
         xHi1/TqApLEHeczxvx/JChva2sLhJHeEhvQIVzudMFYgBbyjKAAB4BN4qDiWTyo89LE5
         OvpqloZGsR5vg/Qum4jeM5xBRA1XUs8XAHtXGonUv8EgzpPVmqhLur+KGexrXWHolcg4
         EAlA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gY0dq+HS4AOwtVQkeTyyW4yka3zBdqAJOKIpLD/bAqUiHtXINijGSjepF5Cw9wyQM6IPS6ZGI/8y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3c0r7swpci3K9ieIdUcBhoh3jzYkgaqimLlchg6h++7irJQc
	2Ygmx7nch+B2jLyyIrifI+kFAgNZOREi7fPsSOkg0IuJYQDGuPZpseVkNrW3JwmTrKpGl2SS9Ox
	wGCqU1GWjKAXz9CmGPSZSsPWTnee72BBssQyQrNGCNA==
X-Gm-Gg: ASbGncuaMy6AKCiAo59j+EjuUchHqk+kHo9iMX0JHHFySiCIPgffO5udhK+mrfBNv6s
	4LAkTD6PImpA0zwBMDEyfYdd4yuJ4DXnITpWD/g5+gdc+oFY0Orcu4bvTEGWft0ywm5lggKRHuf
	3SMFX7041xVhWs+4hqd6Oi9vz9aqx7sOAwiTTfon9cUFaGHgi3+E5W2V7r1hbDyEaKystkAb/k3
	A8kko+HLU/YLg5lHEzRRp/zWO1rPSuzcfocUsMPGrVm+nD9PC6bCpTgNqHk
X-Google-Smtp-Source: AGHT+IFKrAN2G2zTZh4SCpeU6gZa9GThIvhb7rVDTGkR/MLZ+R0xImuA8WoUYuizes16PmjbOY9KlVCaKR3Fm5qO6C8=
X-Received: by 2002:a05:6512:b9d:b0:595:7e01:6b3a with SMTP id
 2adb3069b0e04-5957e016e6emr28072e87.14.1762951423456; Wed, 12 Nov 2025
 04:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com> <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
In-Reply-To: <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:43:30 +0100
X-Gm-Features: AWmQ_blw_0zZEbC2wTIU0HIhaE3Pg5Px5M6V4b6IhL47o7V7zMZgJkY7fz-LNV8
Message-ID: <CACRpkdYEbxtjoi8KQxS5fY6xr3UZwQmG-yKvT3L8fRcCXDaAwQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in
 pinmux configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org, 
	jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, 
	quic_cchiluve@quicinc.com, Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Praveen,

thanks for your patch!

On Mon, Nov 10, 2025 at 11:11=E2=80=AFAM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:

> Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
> to prevent potential deadlock when wakeup IRQ is triggered on the same
> GPIO being reconfigured.
>
> The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
> handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
> msm_pinmux_set_mux() calls disable_irq() which waits for the currently
> running IRQ handler to complete, creating a circular dependency that
> results in deadlock.
>
> Using disable_irq_nosync() avoids waiting for the IRQ handler to
> complete, preventing the deadlock condition while still properly
> disabling the interrupt during pinmux reconfiguration.
>
> Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I applied this patch 2/4 to the pin control tree for fixes.

I removed the word "potential" from subject and text so as to
reflect what Bjorn is saying: it's a very real issue.

Thanks for fixing this!
Linus Walleij

