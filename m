Return-Path: <linux-gpio+bounces-27725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D2C11970
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FFFE189C8B1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 21:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC578314D19;
	Mon, 27 Oct 2025 21:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlVpWzoo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E830F93D
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602231; cv=none; b=Z6fkOak3wLmbQCpeoM+pF079zuHGMsoKTMTUKHGjMS23tmkyvIbGo3yTS9J6mGKByPn0vkEoqllG5VLQmb5FnE6sNQrgrype9c5ggpx1pX50pMAcCOkrIZ549dIbZTSYtcCX2tVCvNNN1aYv4WKGFGos3Yb7SKyDGOZYCwBN4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602231; c=relaxed/simple;
	bh=uzn59MLbFi/gXQcmwNKcLTbahfjA0CxJvaROiMoRzOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWdp5kj7VFrgMhhPPP3nw+RtrQ4cK13Y0M2DeOhk39GMggKPmxzIyQHObl1pqGKGPY0Th38RqJu8P/PDe9O/ncPxyMdMDsOGyOwjPJkyUCPrYUddV70gOX56h5pIfz+uJBl1vuNBoOM2RHe+Us9xwmNzn1ZykzxXRWAtc8O3S4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlVpWzoo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-362e291924aso43110361fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602228; x=1762207028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HsbPG1hM4cDOntTcBmV/JBGBT4YKc3N+I+tTErEYG4=;
        b=BlVpWzoouqoZFjnFj9d0RFZNURDXt/jj+N38Tx92AD5sfPL6kPzMCNlPFwHVa4CceT
         PuwkIYX9jKb2+26YeKUxiG2D0AgsHvUVVknLZrp2ixiRxLj3p+zDhoZCEswRpUC3S91T
         7QbH05IwTFSYKl9UTn8zrsOW06Evf4yYurnPXESvn/t8oyZ0hR7TSDZbXWwThnJPz8Oi
         Fh4Iqs++cdQjm44dlwHAUIQRb2LYof6ENm+ZwrilwNhbxrRhjNvsqvJuJ50phiSAzB/T
         JYxBGW0HieRTXts3JY7z20kyUU4+661VVXdcVOQaU2AMzaRBABtOIGKjaI29IPs+mCVz
         7yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602228; x=1762207028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HsbPG1hM4cDOntTcBmV/JBGBT4YKc3N+I+tTErEYG4=;
        b=O/qyFztzKGd0gfnZgjUqnN2E+/eJ27bQr46Qe6ohiFAI5E9bjPFX2bOM84IS9Q+EVU
         cvx4Dh8T+o5RhjFXs24KYTxb1S7ULBj50VXeXqlMcV1yGJimarwrsS/1q73mQFjEEdip
         6WBf3qNxEAeP1/v8uSF6xPmx9MssZcDbJs6g6gj9hcxZiykL3t1JXB6qFsFTGykNPT+E
         TrW4QfgL5vTElnDXrE17Bj5j4NUFB3OaKEceDXFKNWMcYNWlD8bVImtxxR52ioAKhTjm
         vs7RNJiVKR5ZKPGKFNdLaeEUbSE8fgzWKvFBT/qQXP+lbRhK6JDzZg2YKgNYtc9dKjbK
         Qlcg==
X-Forwarded-Encrypted: i=1; AJvYcCXx+d0m+GA3V166qzRNYGWrmnCt6+LdzMNyvILMujJglhIf8RL0zN9zPRBFT5SQrbd0B2oTHvoUyGCR@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXHDCacidMvdyOksrgYDouMrHWJy/cpvbrhnHDnUxIGZySfAg
	4Tu+8xqRul6JVIp05FbXbJtu4QvZrTUR+NTOR58Fn2cEyRVEr9R8inBOeqydwI/3K5y5DP7+nCZ
	VTcvJF3T7rOJDtXv8wd9c+ptTkl9xAVpy6TkX7MgB3w==
X-Gm-Gg: ASbGncs8yCorByJM/J4pbKN0YgWqNHEMOsbLaRB5mhAIqXzao3SEz09nfbZ+umGDCsI
	8A9F0lRn1ojJGHFAtRTtgA7uUOaqlorgIsR9x4vmThv6ozoz/bkTSX+1fgoDfVZvGrBYJv2pE2W
	93eWRut8G0aH5mksNyC2T6bTAPEcetm5pgUmHAyZpLX+EPaaIZU/c8DtA55kD6zlIRL2t7cciG0
	m8w/iq6uzfeWq0T3ydOVtkib5BsKTfU4VMsDEWVvgBDe2iJTPRyfur7N3LcxKQVtAt6JE0=
X-Google-Smtp-Source: AGHT+IEjLIfgc64R5us95+fFPO8BWmx3IOi8cmIKmJ8GeDaDyGf81wbf02WQ2hQUkaBk66OHmS0+B2OIi4naaYvPItc=
X-Received: by 2002:a05:651c:4356:10b0:36b:631e:2aee with SMTP id
 38308e7fff4ca-379076daf0cmr3058091fa.21.1761602227957; Mon, 27 Oct 2025
 14:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
In-Reply-To: <20251021070410.3585997-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:56:56 +0100
X-Gm-Features: AWmQ_bm-rkyY9e4T7v9WO6_vxIZ23JzEk1iQHKpy0OXLbJlzhTYiKf9B8Mvl6g8
Message-ID: <CACRpkdZAaEim0yJLkXNctJA0jBFj7LGyTGVvy7_mMf5G+vUWOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add pinctrl support for Sky1
To: Gary Yang <gary.yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

On Tue, Oct 21, 2025 at 9:04=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Gary Yang (3):
>   dt-bindings: pinctrl: Add cix,sky1-pinctrl
>   pinctrl: cix: Add pin-controller support for sky1

Patches 1 & 2 applied to the pin control tree for v6.19!

>   arm64: dts: cix: Add pinctrl nodes for sky1

This third patch should be applied to the SoC tree, Peter Chen or
Fugang Duan takes care of that I think? Not sure.

Good work with the pin controller, now is a good time to just
go on from here and fix the GPIO controllers using the pin
controller as back-end too :)

Yours,
Linus Walleij

