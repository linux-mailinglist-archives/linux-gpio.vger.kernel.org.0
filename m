Return-Path: <linux-gpio+bounces-14325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AF9FD7CC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 22:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A337164631
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 21:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622651DD0F8;
	Fri, 27 Dec 2024 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FAtN1yef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DD415250F;
	Fri, 27 Dec 2024 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735333913; cv=none; b=Knh8c4GuXOuMYvDtZlDwYsyEfAzD/D7MDZmlviEdkncIrbPaH1AWo/yi8YPX1nYdR4cRCRyMtxmDzXHGoqBBkfY8Ub/fD7j/u3fXcb+ZKSjLLuGX8Sl1f/I94VdMd74Odr5P5Z2EnhpCfyIXOrYQnibXFTAVv+HlgF6GFsqHlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735333913; c=relaxed/simple;
	bh=FRMpiSH06KFivBIxY8lkW7tGs1+085pmCCgXd/iebxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRgFn23fpFUS0YZN5JQ7Y69Je4VH7Su/JU9GmlhOnxUfvnr6SCVRMF7RCkgxHNo79KKprJQoAA9RBL72EdZNixiTAHa9FGQc+ja10ZQDpwBBoBAsb/bHKt1MknrKltsHncEVWgrXxcs2WZEJs/+1W6DYvMJpAEJdNct2CNqKajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FAtN1yef; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21634338cfdso133029385ad.2;
        Fri, 27 Dec 2024 13:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735333911; x=1735938711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3fULVCiFHHJMJ0GhUVexYzyGjwyjmaqKAkJOWoGmw4=;
        b=FAtN1yefJIi8xYXXEwX1fs25mKFCjVq1LUmeR0SxC4oB3N4oK9pLqzydpppp9O0yzE
         BTraF/8ds9mxXBU2y1XjlET8BF/RqkOM3nsFDPilfpcYde0883OEzheFldUfdAyVafdK
         oL2W19qTa5VYhhg9eABIOnPoSXg5L1und9qdQIwANTIB21DmXJNU2s9naERrVLLq1aRz
         VFVwrFn59P7g4FQx77Wvm5p0g173QX5zw3itZVSe6x1k6UYq3WtW2Mwj02MYGZihMJdG
         YuLA9+x7h4KKOMTy58u61/tMxdKGueaKs/eqTF6ZsoYBIdedsckWoVjAM2oldUOQtILo
         m2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735333911; x=1735938711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3fULVCiFHHJMJ0GhUVexYzyGjwyjmaqKAkJOWoGmw4=;
        b=nBmqMk15T3fvyorU0qU6BMW6JUqMnaYdVVFxbV32CQL5Jetgw4evK2vjJJ/LHDrLrk
         iWfI8tC3ZtYE0nifWkGUvPYSmqyU/Wm9jMfuQUDWQF3vjdX1uZ9cF1NdOtqQF/YU5NBM
         ipmSfXFxxXV4by76tmyRXs+deZCe1ZPOFm9hiysJNb4s4qCr8NXH36eADwA7lU4lUPUc
         3f/ycLwjwtwWij4bDoeGjpzxgetc++qdKx7FjzuY2WF/2MssOQRS/J+5ccj62tyLesS4
         aXZHklsjJnTm9ATXF87vC6I8vGV6d45g7xfl4HkZUqYeXZvSxwJtkWCDwYLAO0BTrg6W
         IquA==
X-Forwarded-Encrypted: i=1; AJvYcCVRJG7YpZbCcFVuY/TWV11Zht1TxB9z6GxI3CPtgo6CK4i1AfLSCwb5aDwqUHwK0M2GvXunIm5O7IkqKA07@vger.kernel.org, AJvYcCX/Gtn9a4GMGxYC1z6sgkukAkG/xLtI+vabS6pm7yHS5XXFIsZNPi3/zjZZp/HtMSplEWuetsrECvvIUg==@vger.kernel.org, AJvYcCX16//7KekwrYblXRX4gz8Cpn+VfBXGG6cTKiofsYy1ENhmTclIjt7f5SQBI1H0YnLrd5s7KzaRKcO4@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQVT3O0+4XnWDmNl/DhBSMld2Yf9Zz1VnWBZUaVqIX7MqR8TI
	uSVu6L9At+mr8x0szUVDBnwmkSZK0LgX1ORmQwQ0HsXtQni4xcZZkbz0Vv9Q/p0kpqHf7zFCpQf
	5YrUwsR+7C8hXp91V7Uy7urv+ckQ=
X-Gm-Gg: ASbGnctNd2VknAH5pJl32Y3RgsyfQK3socDnkvrwXz3sjQBUBPoLBBJO+2xe1rZlPZp
	u60gSFatu5OMC4zLVfKd+pWiO4ZA1nDQeGrVIPrW4HHElfKMcuABLBSs6Cpt9Psv/Yy6rUQw=
X-Google-Smtp-Source: AGHT+IGCfrmdKAEUNMf3z5m3vwsnLOvYuRrIEQmtrmmSUhupBO37Iqg7DE5f7EjXjnpdNGaWSs50IH4PVeaNoh6JaiQ=
X-Received: by 2002:a17:902:ef09:b0:216:2138:3ed1 with SMTP id
 d9443c01a7336-219e6ea2db6mr403735565ad.19.1735333911039; Fri, 27 Dec 2024
 13:11:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com> <20241226-amlogic-pinctrl-v2-3-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-3-cdae42a67b76@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2024 22:11:40 +0100
Message-ID: <CAFBinCCbipebu2sNseNqatfBYdsnW1ouccWBH3N0JTo6GjRG_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

On Thu, Dec 26, 2024 at 8:57=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +       if (of_property_read_u32(np, "mask", &bank->pc.mux_mask))
> +               bank->pc.mux_mask =3D 0xf;
I don't see any documentation for the mask property.
The discussion about the dt-bindings is still pretty heated.
Everything else is already part of the documentation (which is good!).
Please document his property as well (or remove the code to read it if
there's no need to have it dynamic).

This is not a full code-review. However, since the discussion about
the whole dt-bindings is still ongoing we need to make sure that
whatever we document in the bindings is actually all that we need to
write the driver.


Best regards,
Martin

