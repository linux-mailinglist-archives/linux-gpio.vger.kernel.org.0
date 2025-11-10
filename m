Return-Path: <linux-gpio+bounces-28288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C33C45D1F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39EF3A2BC5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9287F302163;
	Mon, 10 Nov 2025 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+2ybnZ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A125A288C20
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769384; cv=none; b=BMkzUHDDOC2Q6wd/reSLZQ3ruLEVA/0qwAj2g40temHq2UQDopKD1u+VX+3v6isx0nMQU1IqdeQcwe0lJCZO7NHy1tiPbHfSzUO8PXjJhI+8lDI/fn+wP8yB0X7ubRwFqA3Z6yJFB3izTMe8H0dEWK8a/G+pG+BwA9MOesMXdt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769384; c=relaxed/simple;
	bh=tDhf8qixrDvFldi5/wrQHvvbq/Y7Dz2jnieCvqBR5hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ca9Kak6rykOkU8x7Jx/g4LK+prgbkjSm1tOdS8a0H2Q+imdsq+QfkLdCBRJVLO32L3Cr02pRHiSilzLFk26yvXCKtqmAN6DolBbN/8EKS1bD3c0/hhMKKo7qcT+nCTkahJ7FMFjHdxZWxUcRCe59E/ZRKH96CDtP2BwTfUhoavY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+2ybnZ1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5942a631c2dso2460402e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762769381; x=1763374181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDhf8qixrDvFldi5/wrQHvvbq/Y7Dz2jnieCvqBR5hg=;
        b=j+2ybnZ1I86i8SvXdiHb9YpvHS0baO0DllnCHI2/YHXyM6N/OyODyLVtZY299lmAoK
         6TETXDVrhjrZ+TL6+k7GjVMiPF5gD3RptoH5dG7r8Zmxcvauv12mAG5Foowb5e+wRXRa
         IyaHgaAZkKiZ4KT2io0lDcwtanQN3mBL8VkuYQeEZvk/oTTY7CDpaaL0qlgEoRITYh5X
         trj6e4gE+KltwVxcyZyl2lgKcSpt+K1CzKcx8+R7k85aqtfhs8z7tQlDJK3k8fEjoQZP
         JvIr9m+2O3DD3pPDLQ+ZwcRDFKhzQllIeR2OXrR+/oiKROz4RvID4cvupqJxrw1JXTFm
         EGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769381; x=1763374181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDhf8qixrDvFldi5/wrQHvvbq/Y7Dz2jnieCvqBR5hg=;
        b=xJ7WKGnIMlROJzEYUasK1qNHyFTUWuXj2iUy3b1jELevPk48a2F8nINLJUmbBNPtAe
         cLxwFahNRIUDU7ouklVaVGQP2zTxqPfAt/4BhkxILUU9pRZMGlh5CuhWbPAyyXVLW3qp
         4PxneF1I4QaES1uF8820MOM2au/ZTs1h5uPmZq33ZxxYfbO/xvMbI7+3Tpq+l+rkl59v
         felT08AW7VOaYS2CSEJhKFMijByKdLGkIXgGl1knv8J/qp8UBq8qOzpKgisrReRymz9/
         cpRYZr037b9noLtdMcwAGrWO9lx/iA0xSkEX+7QVKHcTxuWKAMIl183o452u+w9wZMxp
         gRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUhHk56i+qsXhlwGznPNHtNzzSQrDPUxnonDtXpFVCe6CycqDbcgcmFv3Hm8XSzHJGRs+B5QPTPsu3@vger.kernel.org
X-Gm-Message-State: AOJu0YyhWI8ANsJHRpfG4W2jyzX9vyRD0wiqK0FQ1InHsKLOfh5aSZp6
	1m8MPbKllkVBlEnneuZ/TB0CJkt30W2cMezbEuP/uDHUarKc1o5+PaUSJoceo98KiU33SNVbcDm
	J2VBB09bmyNmeCOXF3HFnj5MLnTy7uELZsx20X9XxeQ==
X-Gm-Gg: ASbGncssElVK4Wbxz8GkHc6t1OhnfOeHvZbUs55QWbc+Qtalt/OpNZG6VvrxcaEnfMx
	EgHgdLdXCfno/tGPs1DND/VuYW94NmMjxAG3o+j6atVhUmM5RVIhD43fH+R9kaeAkOHq8UmqMZi
	pwN61cnAirtUnsy61DZ/JHWAgoUJalUFxOVMeEBcCT4296aEfubt4QBr9K7BF2c0rAgU9/KbikW
	oxE/BIi6jF8Z4CTWMyDMv0ZRxBh8p8nAAvMf98n5YWl/kS8huJu0h2EUQhN65gxBspuT98=
X-Google-Smtp-Source: AGHT+IFGPVnaDRtv2gClXSnX0sH/hU/2tQYDsgz3FSsDzfiozT/9TYr3cARpl9kJdemTQgStsHfELCywzdcTfbAOhKg=
X-Received: by 2002:a05:6512:1325:b0:594:4ef9:41f1 with SMTP id
 2adb3069b0e04-5945f1db816mr2146235e87.47.1762769380663; Mon, 10 Nov 2025
 02:09:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027212642.1710144-2-robh@kernel.org>
In-Reply-To: <20251027212642.1710144-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 11:09:27 +0100
X-Gm-Features: AWmQ_blogvQPPAETGlrOkDS77tME5aB-9Sv0mNqgOJbiE_S-LtUsi9rfJh-GT20
Message-ID: <CACRpkdZTVaBeSPOFcVAwB1avUK21ftRrLGM=0bkBjvxOfo=XsA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert sprd,sc9860-pinctrl to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 10:27=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the sprd,sc9860-pinctrl binding to DT schema format. What's
> valid for the the sleep mode child nodes wasn't well defined. The schema
> is based on the example (as there's no .dts with pin states) and the
> driver's register definitions.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

> With this, all the pinctrl bindings used on arm64 are converted!

Time to celebrate!!

Yours,
Linus Walleij

