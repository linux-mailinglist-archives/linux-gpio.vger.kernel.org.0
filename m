Return-Path: <linux-gpio+bounces-6028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FAE8BA7AF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 09:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041D81F21EEF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 07:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29296146D47;
	Fri,  3 May 2024 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qU5LgpxI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B44146A93
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714720962; cv=none; b=S+s3BKrHxA1nzUbngxe9nsy3WxUFep51E6HTtYDvdCeY06Qz3N1JMK6jLouQ+GbgKdFVRKq0DAfXqr3CpAErLogBPPTM6M7iO6mmw6BwZg3lRyBDKdG/2JldA1s4cx1ulLt7pHh15Y9cizAmGmjDLzEYKgFynsMtPvEGCANJCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714720962; c=relaxed/simple;
	bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkwZGrz2prqHsFkVETkiRliCU4LQ68qhFLj8IWX3iTD9Q5YNPH/DNmGvuDjbxqBPNdBWb5Qp5VySpXMCn5Sm7qJtZyM+cilm0ew3QlN9/+RPiDmtzBZj/BM6zpw61yjXDvqCTV2rb9Hiul8EUGAQwVgx3x4GXm8pqvIoWZ8eXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qU5LgpxI; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-615019cd427so70374477b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720960; x=1715325760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=;
        b=qU5LgpxIUW7+oCASku7e5IjSxJ6TstrilYAuifcMAaEApKrTI2Eqn3pqWRBq63uEBE
         dq6i439/k6oCr75XNxP04p/0W45iRJIQiiTkmzMpAyN2vTuEzCm/PxCh9c5N9F0S0Vzk
         2FnFTJPgz0tiAyxd0UuorxkoV1t2eUeswwLOT0473g1sDobXjXp3oWfJf2gsHSw6FAU0
         BOC3+d9Mmp3XnoM2u91ja2MwlUu4qEIw9zqQb1E9oBQj4/cAuXUEDFYP0pUW2jcmyMb4
         IF2MuX8zE2xg/5o7KObx94vh1FFmZHEXckrrdGWarUJovP2AZOqhVytAUGQ7qSCpPfqQ
         Xjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720960; x=1715325760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXiT6DCAy/foJvChspPeS9HWJhqsKPTUJeiKjZEGmNw=;
        b=H8uFZby7t2+q+WWPeCg8Ay9lcdfCzYV5NrWvyjmwRBP8lXr44aEgckqy8Spbd1Yzzy
         HiI5InFElw4wktZYOTW1YPRRWkhBETH0dFXqsidn+2OGkgHVw2vg89DiCyUebCAmO/lT
         3watK8hkt6mD5+bbLEyav0g1sC9jAH2q0v85ZnZIIRRqEabUsJ9pq/2U1sQxWO0hWeuP
         jbxeMG78kFsVMwbVvR8RvqVVw/2sSvPeinczvsY66aJRQ3GhPMyDtIEB0+pcB0odVgpb
         7X8iSMkEU44NBMx4QH/11Mem/xkaPz10TQGExg3Yt+cgC9MVVjI33IuJdTFgR22DDD5A
         Edcg==
X-Forwarded-Encrypted: i=1; AJvYcCUFkPnHFmM+0TQKjQ7d3QpEuU7KEScR+4Duji/NNyZvApo4Skj9XYOnL1XpbTKIX97AovvAx/TGmgXSmUwLxuNp45I02EHDP0+IBw==
X-Gm-Message-State: AOJu0Yy81dPRW0zWYV8fQ+w462knWThrJ6/I48WqhfTGNbeze7ycnEtO
	EBHTuIT+MA9vcy3i6gyDC3OHvnV8iX5DiXyhaRHVo+T+agb6k83GecFcioXwHjtyeSFQP92gZEm
	o1F8eE3jNthtCMLPq6iQ+CuqdFUAtSb+/qJdP6Q==
X-Google-Smtp-Source: AGHT+IF70GUA/nAYgbcBRArz2QcjffD0UeeRjlZvnQVAeEubMTdu99BOh7TpwjSj3+78vjD2hwmUTAgJU1ao3wm1tdU=
X-Received: by 2002:a25:910:0:b0:de6:dcd:20ae with SMTP id 16-20020a250910000000b00de60dcd20aemr2064275ybj.27.1714720960659;
 Fri, 03 May 2024 00:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423045502.7778-1-zajec5@gmail.com> <20240423045502.7778-2-zajec5@gmail.com>
In-Reply-To: <20240423045502.7778-2-zajec5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:22:29 +0200
Message-ID: <CACRpkdZqdivw_ieON-PsT6scF8YUp+LybYxiuGtr4S8eaT=w-A@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] dt-bindings: pinctrl: mediatek: mt7622: add
 "antsel" function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 6:55=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
> the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
> pins/groups"). Include them in binding.
>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

