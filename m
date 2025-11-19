Return-Path: <linux-gpio+bounces-28766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C82C6F436
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7DE99364712
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC1D26E6FD;
	Wed, 19 Nov 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gg04QoV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9C23D7CA
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561823; cv=none; b=Yexg0Fi7SzN9BxFty/alUvbteBLfPG3TJZexfBYP++hQzO7AXwUdZupXCniKiCZg98/HYngRTIP+K8R0DNM0uPCseRfFO2tfO1aGfRVzOPEYJGTxxqh38NJkD9Pf/FiQmBngnTKfMUBLLQ7EeCHs3hnMmLVNxiY7iUT7QyU6WeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561823; c=relaxed/simple;
	bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrd7XjJhGDxjJfW16c5xnpraXCw6qeDCaq+57zh7M9WpJoqflQoLY7HcFAGAc7Dpw/W13CineeJ0GnycGCryA+RMdIbVagw9xAedesdkspf5a4+Fmg1OAL4vIlBcOWUoi5iWMgWdiQd26YfP5lTxSG+9y9UGAewxfzEtnz9sWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gg04QoV8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5958187fa55so5089067e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763561819; x=1764166619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
        b=gg04QoV8wv/+a8a1QIkdPfWGLdQ4Ws/yw9yIu2xM5P1gfu8hu9SvX268d3avRMyuL1
         ExLpQCTlHCjeM0rcBdqyKJBDOv8LAX50s8GRxuLs0ixpvPeeplGHxDueNLVt6qDH6+h/
         h/2E4MTHUxJrRVHbdtZUF+wpQibP3Bm1n7w+YbeAfz+E1oC+X7OgAW2Im0FZGq4JkUI2
         IIjhQaNMSfWrlTkd+X6N3NQ2FcVQA6/efWd4pZs5b6CecvfBmSdYhD4xzb93uoZRljMo
         k9oJgeJenirCrp0lrTJKut1WtjbQqEIE4YhWt+UmgyP3eeKIcX6jRCo++whuSqhrDMjq
         A/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561819; x=1764166619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
        b=jkazOl8UNKyMYxnmoifpgktoeHZBhzJqW1dBQOJzX5anqtElV4YaYLYiOHwp7KT7i2
         RZBOExSu/rF53snOrrH+HS2Vg7fo27armep0SVUP/6s/BeH8DWXgxFtd5cCBKPY8yaiY
         w31cCLfGA+va7drqEty4uUlS2/CIy+qZQt0h9eBVUTyYyyv7elRM2FYMDTfM+6Upik1Q
         Fb60Cp4N9hrqSrsWpdwTmAdXUTbJQzgbyAmFxLh6uImKGEzPBUDo5mgcFuj7vOIdb5Te
         Bup1Ik/z3bONO0qP8N/pwv97K57ybA5zLDqqVejkrJFGZfk6G9MomHwXmFlTpU4dzXqU
         C1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg3KEj69t5a8/lT/qw0JncKdpjKQnS6Q1Z6kaIG8CkFQpxDkbSH0R7lxTpzoYdH44ZEfdtKQSL9X4H@vger.kernel.org
X-Gm-Message-State: AOJu0YxNIRCgmUclvq9HQNnViWeKaY5Lez229+HLpab9hd0mBhDxiyhc
	avmAKC+8VQiSgT4IxnR2bKXRIWpEdGafxxDW/Xa3lB0gCgTElW8TGxn6ltO4Msg7/PMwPAFaynq
	pPphVLLdkgjkzpp1Neb9+mjDgjrWrYW2iMeeX3WuXqw==
X-Gm-Gg: ASbGncuorD6LZEQokUgK2aRCLgcIl1AudHopTYtd2XEFXHmLE2hGUvHOYeK8sXt4kdC
	3/nZHpM4ALSLrmN8rqZwc7gJ2FfxS63qAZDCkozLthQgY9AMVDHMl2f7XU0fmTna5g7A9FPYRhJ
	P+cFRzCfXgq4MSSDTxp49thWsT3F2BQiBRKva/5yWuhngcSvWgkMvWAkBh29ge5lZJYzBJRWaHZ
	0apLEV5Cmq+VI2xk8jG/UwKFZOfYRwj/2hZZCQIAoy57n2HtOVl3KtGSw3oAAiUlBYIDyU=
X-Google-Smtp-Source: AGHT+IGairnJxnYRKkuHYVw0JVrBsc+2FMWfccI9lHotg2DPX4sHJAgyu5upYOPaMi5aXgvof+7aycNKLZqXk7xQ9eo=
X-Received: by 2002:a05:6512:230a:b0:595:7dff:ebb1 with SMTP id
 2adb3069b0e04-595841fa4d7mr5909063e87.36.1763561819191; Wed, 19 Nov 2025
 06:16:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com> <20251118161936.1085477-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:16:47 +0100
X-Gm-Features: AWmQ_bn95RYU3PYx77I_yIH51aH6sidmJ5f83D5VEpU-6oaLBlEbr7SStcwerBw
Message-ID: <CACRpkdYuRas_jgi5K9hbxtJLrxxQ+wS-dJcunT5m48qS0tKXAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for
 enum property 'st,package'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 5:20=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The property 'st,package' reports the SoC package used in the
> board DT and is used to inform the driver about which pins are
> available for use by the pinctrl driver.
> It has historically been declared as an uint32 enum, where each
> value is a power of 2.
>
> Deprecate the use of the numeric value and replace it with more
> readable string values.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I think Krzysztof is right about this, deprecate the property and
(re-)introduce it on the top level in:
Documentation/devicetree/bindings/arm/stm32/stm32.yaml

It may be a bit quirky to get to this property from the pin control
Linux driver, but it is the right thing to do.

The Vexpress has some inspirational top-level custom properties:
Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

Yours,
Linus Walleij

