Return-Path: <linux-gpio+bounces-27728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A7C119C4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EB404ECF49
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9702FE057;
	Mon, 27 Oct 2025 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AY1Ok+NS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11C2D7DC3
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602704; cv=none; b=tKzmLzl5axyYJ1cGsWiYss/0HQPti5VlHUECfmsJ3JrotWSjvnBO+pTUCTrQNWj5E/FZQ55Fw4M6dpallC+x2vJzleaxe9m8L1HFQV587nm6fqtxy9qAZ1EqBy0E7X1cHY+yBCxuL+SVXUCaidzppXIOrguWtTOd0st1Cl/q7nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602704; c=relaxed/simple;
	bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxdRG+oTzALfZQCCrrGIbJJfHb5rwIEVRcHhnv8hpZ8vATmq8XHCbTXD7ZrD3AydvItQtyctjqIPhsV++U/RvA4YUz/PzQDxkDpDBYer/3R51DRYXt+83sjN6jTWhW0HrOwh1nEOnEjAlDlBtIgOBDEY4YbsdnHTyBoL3GVec+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AY1Ok+NS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378e8d10494so40607971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602701; x=1762207501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
        b=AY1Ok+NSj05rf5B6Qk9YA4ZHIYVjoSO1m2vXDJeJK5UNKe9mRGKsXW5EnjQ0+JwY6L
         bInfp+u8gcsWJtvLp6SYv5te/smbG06Hrx7cLF85ElCL1bWXT+uTCn2Emih0ODIR7t5x
         HBLmm0G33Xx1mX8/lmv2UH6YLP6fZytuQTv/frdf3MnQz/QHmHrt64Q4OKtAeUiMcezu
         L15qNzUqKfgFWdeS37d+PdpwXF/5wVxbb4ohDQ3FbZjiZQrnXPF2TR+NQX126RWOO054
         7y+dcqJ0DhZBbZ+k2auEkaEG2j0cyzAOyMEnGX8Qpw21DUJCAz4NXickpHwIsoEl0lXr
         +NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602701; x=1762207501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=881iDkPEZh85ObsSmrMAZ48Htve0Wj9g+gfovyJ15uM=;
        b=fWBoCGBx7eGgkLDkMypMBGV+IcymP6M5GMkyt212iqcft2mokIbh3WbRYO1PTRO02G
         h5qpXQiBSsnZlsNQYPJaFTTTTpEZoy9NsJdLrgIMrsE59nE+Rm+qhkxL37yRWRN24X5u
         00quo/DHlz42laL6xhAyR7wUoNnObPTMgyhru0OaBNyuEu1f5ZCDBycoVNnFSI0Gr9iU
         e2uJSMS4qcldkXAnRxYOZsU+IinU9GEaRqF5Cdq2dFRkoiPsy/vO4Tff9X75EszmCw0s
         JURyM96ye8XfFGY5G++w/Z0lkQ8c0faG8LH4269PuR9EIq9xDJygTLmdqdBQaQAuIyKq
         cizg==
X-Forwarded-Encrypted: i=1; AJvYcCXhOYDs43z7oP/+xLxFDQJv66YPlodoDnIKhdqoIHWCQbD5QOoJ4uQcRMWXZob+njKra71U07ckEQwF@vger.kernel.org
X-Gm-Message-State: AOJu0YwJs4qnJv1xs0UpMff03IJNdS5tgso3WsET6Z7E8AFA0BLkMS5B
	/jjUqGqsblXCrN+42P9JsYECeU/nilf1TTxwjRp32YEsgDLhKEO3q8gdaynJS6FO11rtAD8MoU4
	TZCbg4kNdXfLFV02BWNvS4W/GrtJBxmuKMICtS5Phlw==
X-Gm-Gg: ASbGnctgg3OOmGCx8Qxb8hvPf7Gxt1QP2hkUE5voDDzB/G9qmt/hmTwnFMKGbiadMh1
	QtBz+SaShSt8KfLj/U2wMJsi8sa1vnnm/SWNBNmeiZt/MBzs6wVMqLsMzVQ+dRCHbhvy0e/8Gb3
	gB2emujP7BhrRiOBU2/UNgnkhrByFM7IBSDpz+op99YOHKb3x1xgap0upZC4U8aS0f3fTu5gAEl
	bAWOimYfrkTbJSyzIuI89PbnJZ2+Qx3P3t8GDVLke9ZSoN7ng91WIZ2fs0+iXc7TKiZ2w4=
X-Google-Smtp-Source: AGHT+IHoUF4RHiTK1ixTbcpPhI4tBBI8uNgdSo0LDy74WVyTiTCN+lBwjm/Roz3VFn6Yvs6CWMINeSQ/2LwI3eIrZ6o=
X-Received: by 2002:a2e:ac13:0:b0:378:d757:d307 with SMTP id
 38308e7fff4ca-379076bc3a7mr3168981fa.11.1761602701023; Mon, 27 Oct 2025
 15:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-2-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-2-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:04:49 +0100
X-Gm-Features: AWmQ_bkqvtHBv2ihzMqbHUb5leNu-ZCVXzL1Rr2PRCeRlwPcmd2dgcjDCOHd-pw
Message-ID: <CACRpkdYUt3mZX_KjFps_BSRQVrPcn70SrwEJGKRQUjHq3VXcDw@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] pinctrl: pinconf-generic: Fix minor typos in comments
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> s/specyfying/specifying/
> s/propertity/property/
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

