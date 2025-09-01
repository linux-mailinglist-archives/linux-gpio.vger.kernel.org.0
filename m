Return-Path: <linux-gpio+bounces-25321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51385B3E3C6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF479171753
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FCA334369;
	Mon,  1 Sep 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/gO95zb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D942E0907
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731360; cv=none; b=DItE3P0r+36WMtFT1QmqAOEEQDCaw7sBGcy5tqfp+c1LMCnUYNlEFdM2tHjRTxWrd6/Mh/kRa6Cp5vmPlT6UQ45A/sXou7OpIj2UJfnHXI2DXsn2tPbHiCRDbe7nFVblOq9LR1Yj7H/iVu3epF+QYAgs/XS5n0RzMzcAiq9DKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731360; c=relaxed/simple;
	bh=pHzvO7FnuG3Y8cfVPYEujz8Pd5Zq+LpomOEmuXlPsmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWsibbiXYF4mtbuJPXGiOqtvtuzSE8LeQSrHZUYGnQqiiFMEsMSFFnlDt+H7TOS3RTbvCV8R5sxVeUq/ctcALjbmLwmkmqxKzO66nSZ8asB1IL1UYxxVSQNkIYpZNZ63lqrzXedqnwVST/fbvFbq+fm+WAQnfbT7lliR6HKhOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/gO95zb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6aef1a7dso2694827e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731357; x=1757336157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHzvO7FnuG3Y8cfVPYEujz8Pd5Zq+LpomOEmuXlPsmw=;
        b=N/gO95zbSPubz8+fzkr6d8SHjON0h46SBRktPorCqmn6D+B82hgZTNEFmMIrupTg7R
         zYuz1kGzhik1SEt9feAOvaWAXpXgiefY3MFfD2BaCPBi53k0cOcbRagmFsqnlVUyk6tR
         eZYJI0SZfFdsYy+rdXQmOxj4VU6vhVyGvoyqT1K8H/1nNTs5jLSGr1UKEeInicwgDZEv
         C1Pp22q6QByns6Lbc0MUOvKDRxV623kJr8bbYlcRqUtYHiHX4LwzlB0gLO25abdxq+Ai
         IVXh14nTxPWDT4FxghiQTce7Jmi1kVm1ujQCljSHUP+Gf2M4pI05A+8ZBZkArkgeKrxj
         ZeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731357; x=1757336157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHzvO7FnuG3Y8cfVPYEujz8Pd5Zq+LpomOEmuXlPsmw=;
        b=FncKloHvXpWo3DeoYSAI7NYrzyEaZ3QlYWUeZa/DcweMicdrxsGLjAGsY7e27FZeJg
         MaQ1jOX/WkBOG2okUYkbwXAUSkumF6lunS5Cp/B061WgpMcXD4raGQ8bycXY1nppDR37
         UFJ8vODJdM1ZibHgZ1oeIH5nnyk/nCClg3FlrmFL3UEtONCDFs8YGulC8sPB+0tY+bdI
         aySg3aII2EelFpcJOuYTgdgHgH6uhr02DKKtBqfH4bDnzzdd21x3VpgYe5jK6SuoBucx
         wLd54R8LXqCHNyJwh5MUID1mIT8qnFVZO2ybItXTGfeBd6SeBoQnLHHBFDH6oVs0YpFy
         uWKg==
X-Forwarded-Encrypted: i=1; AJvYcCUKb/urCryWrSuFjhQzVYSfakZyVoJ+37ICrlKizE/oqeeoOWbKEKo2Hazpl1kAlQMOI+A2f4NBSarG@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLYcnR1o35oVtbOcCXGgKP1ZG1N1eAjyaWihsbzNam1G2y1Qt
	S+9TB42LrGgCi/8dMLq0XzeLeB8qSW8LrpLvsh8ce2Ko6sNZ1dvTuL3Cpr6wsAuOmBFssNKk3+f
	qp7u9UYaWmvDzzn5mwXc8+UxNGUwggF8Roh2t1JRC44pvB42fG98f
X-Gm-Gg: ASbGncsoARmWmYgMHV41LSz7lStBUYFv1Z5aQjgPKTE2zEmkuBNdmiX2B63VJOcFDK3
	DKN7fH2+I9ZDzS4QKCdtiq2VvalXV3SuaFV7qoZ81av7dcI8/8pg2gykDO7FJyu5+f7LKTet4M5
	hsRYGYS5t93lV/7sV29pUjYD4mI7BclFaoFo1P3cu8+Jn286w0kG4M32cRpn16jJn8ccS63o6fQ
	L7glD8=
X-Google-Smtp-Source: AGHT+IHDj8cz7cQZ3X0v3+zhy0ZHW1Bc0Ee2H0FX5pElqXb7vIdjHb7N5zlkeIrybjYoRm4vWr0BKtNdjorjqsqto2I=
X-Received: by 2002:a05:6512:4608:b0:55f:48ab:a2c2 with SMTP id
 2adb3069b0e04-55f70995397mr1725798e87.35.1756731357115; Mon, 01 Sep 2025
 05:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com> <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org> <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdYC-3qybKW7VH5MVfBc3oqSrOa2RTt1Q=p=HHsi5drGOQ@mail.gmail.com> <PUZPR06MB58871C2E108BF1AC057EF461EF05A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB58871C2E108BF1AC057EF461EF05A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 14:55:45 +0200
X-Gm-Features: Ac12FXzfjnaic5AU3gd0OQUgGODH28pTgWB36lmJD5eBDGGK5IJq6vSA5jGXlos
Message-ID: <CACRpkdYRTKHy0ace2o3NAeuSR3oai9fZMPrN6qQr3Lyqif4OSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 3:20=E2=80=AFPM Gary Yang <gary.yang@cixtech.com> w=
rote:

> I understand your thinking and try to support the standard referred to ab=
ove.
>
> I only need to spend some time to research this scheme and debug it on Ra=
dax O6 board.

Thanks Gary, I have this board too so I hope to be able to test it
directly.

I haven't figured out how to boot it using device tree, everything
I have going is using ACPI right now, but once I know how to
boot it with device tree, I will be happy to test!

Yours,
Linus Walleij

