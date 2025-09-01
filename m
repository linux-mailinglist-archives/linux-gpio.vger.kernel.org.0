Return-Path: <linux-gpio+bounces-25324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D77B3E44F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 039481A84821
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6943F31DD9A;
	Mon,  1 Sep 2025 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBvrerwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B92FF167
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732321; cv=none; b=VNrf7UcUgypg4hDNs1WkRdxFHm/lHArqZYzTkfN6Ku8JVGz1gKSokm+9k8ZEKujrUXZdPPDe8zWWGJB2Feh9hnP2ADp+sSl2PfQahRFbMLX1DJSf96VzmcMwq+arXg7UzEQLVLUja/HdygAzSSFLuw3o7d9cj8MToCFRwZ1zid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732321; c=relaxed/simple;
	bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrUg7/TN3fG9Oc+ClFhVs1qS5P/bErbO0QSpCW28k/pipswvhnolAyw6Zo9+U6tHfjhFh06wPhq2JyWZWVxtK0QphaHcVfvXYi9LfVl1/fIoSL0/5JP1UCFuoUOLaFlaOuEsyrN/hcmjbKNlI53ic4wLe5z9FCZVnV2Y9Tk1/9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aBvrerwZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f6017004dso3913540e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756732318; x=1757337118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=;
        b=aBvrerwZ+FakjbUOtMQmkU+u7hxViHpJKgi1rMIr0m+Mpzj3EvUUpDFJFpQj5QvxDi
         eyC+l2/5ss3dRPl87HGrtWFc0zeeEAzd+19syYFq1zCOXyb4JcibHcamMAh9eGmEbd6R
         5YqeeuAiozNorbWuGz+OdOSqU8vw0KRMmMiH2vnChem0c18SnB4LkEVihxHKAbo9fFkU
         LPmLoM2IB4ncDjVKEKJ2KAp6dYC45MsBO0nPL6/yfEcZy8M6Yh/LXMYtSqQ52usMptp5
         1ZQetYjDtMWc+bUXlwkVsWWXnHflC40B2pz/0HPnYTAQyTtsBliXaP5p95xtv933jEpn
         GnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732318; x=1757337118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sObTShEZy2OUUveLhetL927VwP7OSOCCeucbREwYZSc=;
        b=fE2tr5SFsJuJKQoe9qJl+JBzmC3Ueyon9kYqgMQKp9xXbVMrLKRaLHUKLZKoT4h2HR
         qXam6OZ+ZyVGQMz8dXuKGeS9/aVahCcAAlvVUxJDiURG9ZO/LNBtbbzIk9O3/FvamJR6
         KmIjLz3b/If05sSRMGUKGfiEThlPV/Jw4bwWfGseoW6o5VWjQpoYYmXx+LJujKfJkF8S
         xEM3VcQ9h4misN6Hb2f7Oc2Ts0YJmahAorZTBMTjWe/ubsVgamAhbUyweMy7z7lFPZhZ
         H/BL2MhqDmwqPejMcCS6YVQrHI4cN8As9d0uYI05oh80fyj9SvSZarvJZufF1in/B+fS
         lsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2hJGgr4lTC/W4gEGrAhEt+SYVB5VGqMyn9yfAx5B1D36aNg6NgY9zSo/54++VSI/jr3s7rI4B2Bmh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2AzP+MtImVa8XrQSq96nEe8NXdiMrY+g9ufQKNczDG7kV4Ii
	bk4EK8rQgwVE/IwNPkB4U6ja8NOEEkRFPwYPQ5Q/NaNjum+mKn7O77FkFKi6Uwx16YwZHJYsrCE
	AcIQQxptqo6ZTtXPp5y9O0Yo2hREl3GZ3ZTmGx6QIBg==
X-Gm-Gg: ASbGnct+yRK4hf9dz4fA9/mRJ7hWbz8n21Pdx9czs5qwAnHo78+MWPVZIu1p5CDKmFq
	N3nn7efvwH4vPtEhJcVA8H0BixkGXOlZP/8ReGeqPFNH2yaQYthIelIVDp/+v3t/rP5e0PftidF
	U2w0Nz9VXA9wKpqII1AxoW7/RNi8vSfflbRTN8ntPBntC2pXLWhN2oGtzwDvxe//t3k8fEtk4iL
	/W7/mY=
X-Google-Smtp-Source: AGHT+IFq7h1lPoF+hrBQ3kLFvKvnvZ/34QfLPL/Ze8E58RG2MM4xOIC/Bsgm8sKFufC9Ni76c/KIQO1b5SuiDKts7XA=
X-Received: by 2002:a05:6512:4017:b0:55f:63ef:b2b3 with SMTP id
 2adb3069b0e04-55f708b7024mr1931724e87.22.1756732317565; Mon, 01 Sep 2025
 06:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com> <20250831084958.431913-3-rongqianfeng@vivo.com>
In-Reply-To: <20250831084958.431913-3-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 15:11:46 +0200
X-Gm-Features: Ac12FXxIooDBTyEdgDOjs8vx_SnAk6yJV02Zl1vZBspK7El30WHuPVZOHdwTquc
Message-ID: <CACRpkdbNDCXmWZ3AZS9SVJ7qzhprNTYCVympKQN7E9jdrDDzmg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ma35: Use int type to store negative error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	"moderated list:ARM/NUVOTON MA35 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 10:50=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:

> Change the 'ret' variable in ma35_pinctrl_parse_functions() from u32 to
> int, as it needs to store either negative error codes or zero returned
> by ma35_pinctrl_parse_groups().
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

This patch (2/3) applied for next in the pinctrl tree.

Yours,
Linus Walleij

