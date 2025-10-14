Return-Path: <linux-gpio+bounces-27071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7BBD8C7C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51CA192286F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AB02F83DB;
	Tue, 14 Oct 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxeybXKM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D12F7469
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438354; cv=none; b=UZSOJYddOsQE9WWMC/WcRRuYFWHX6FRjqbaxih8vTzVXjFIc7Qq9yx8MI39JY0u4oSFNfxxkfjAJpzxNij7NucvPKTuPBmwOy1WS5cZQcXn4XBL743Wzr3m5DA/GGOFUpeAEo5Jc3WHkjO1cS2ipyH00veRwKygi8qdGunEsdrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438354; c=relaxed/simple;
	bh=F46LslSaUY8DgHN3n48eTxDvyLVCIVU6v6jJMKyIwqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9+3ooO/WfwgluTBRmbnbWi7uBY+F5eMiPZ78XUpS3fw2aj0p64pxgSboHGLQHP5f8g5/US1M9MPHc7MwvegRbTJ/7HhVgctmkofPEGn8u53xtKmoFUoQmqF5s1OY/3IGBQi9xMN1iHMLN1eq96eTWzx8XzC0AVqjgMrhoOzzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxeybXKM; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-636d5cefab2so5503937d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 03:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760438352; x=1761043152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pokQkIgmHHvIRgJkKC6alt0eQ0/5qfJ7yTlxa5V1+JE=;
        b=xxeybXKMPyFClkUlOE6EOVALKUp3IdnHkEM/kbOHi4mk8DobAkdAuUOcbKvHgl04JP
         Xn8jQQsp09mcPDrIdK1WYyrjERNC7O2odkJuODYzbGG8/G/o3Ali1RcIJKtGdqMTaeFw
         P4iUJUCVm7Dcq71H7CWSL80ZXV06d76VHl3n7MQtU2SjlGeVnBazKTsYq6d4OG4rKbB7
         re5dF9z99boMgsDuAMHfYO979xYa5B1SULcIP15fds+LNAzG7whxYvQD3cIzQVwgOTg9
         cSvECmOldOMc7MbPQW85eUimutx/SyXd8dtzBNP25PiDzGtznkazr0qvj6fg05a4aWJT
         gCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438352; x=1761043152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pokQkIgmHHvIRgJkKC6alt0eQ0/5qfJ7yTlxa5V1+JE=;
        b=I+E+UeKs6hACNlPM5ZaKIaLXDMApwZRdNZToxPGv377SpCUSnbKFISe/8eQ4a+XcIZ
         tu/2a8j6d0g1aohX+5MACfdpcgGF4t29QC8cIhxvKT5q873fDfpJpP1sd6tgU1mGKIf8
         5HgPQQRZGJK6DeSKUF8JbLhakhvYSSZHD+KwI9+NXajIUlHW3vm0YXffTPY2tPs539Lg
         1EU4Dlvs13rMUZOw4eLFvNfEUn5q6giNplMqhHixQzgGIXhqe+p+aXCRCoA8Zz3VKlvp
         8Db5SO4Z/vDjxHlt+NJyViHhp6wVmHVLIDSBgFb9nllLzcmycsZ5JBJj32SZ8VXgXFTG
         TiEw==
X-Forwarded-Encrypted: i=1; AJvYcCUeuaRr/efu6H9zbO3UM6XKu6dmYbsFDmX2gF9EU9x/BnINW6Kkkyz+OGJKI+/DTfqM2FMW/FjBCcl6@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQCr9VIBXQKt3vHBEr127aqEC++DFEBfJ1EOsG0g85NNzI+07
	rX7SiNjERnBkJe++SAIbsOVNxEiqTFvhydHV8kwFwzPbSHZL4Wo4Ljuk7tkpGcvm8OA8HDhpw0j
	EclDOp5QVpX5iNLUTjcVkLHURMuLQMdZ4pUWj1rlZng==
X-Gm-Gg: ASbGncuiMrdiGgJM0wJmDg1+n754Rd/EQ90rWrAaE26ijfLZWlaqUC3QbwZlVuKO3tA
	CNQwAn572zDAsc/wiG84a1LvXWS3vgNnRU24q536pEzMyYopV+CrOJ3zzuPgZWnXcHfrnGv1GwE
	V+6NTTv1AzDmw5QahxGwH8gFgBUsQTwCSssjHQN3JlY6g8iRbzZwR/3v+giHBe0zxmOQIKQW+C7
	at4ZOd1nIULe88/MSoitd0RjqgHz8o2GHylhr1K
X-Google-Smtp-Source: AGHT+IHX+689HJuQIzxGKvDquDFhGYNkr9Ghi5QtgsmKgFKWhP8E8odTxafNGNZGGvvjaBJpeC/l8egbUVvSv1BuNt0=
X-Received: by 2002:a53:acc9:0:20b0:63c:e930:e35 with SMTP id
 956f58d0204a3-63ce9301f39mr13020069d50.52.1760438352092; Tue, 14 Oct 2025
 03:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-3-ziyao@disroot.org>
 <CACRpkdYC6ueVGngC=KMqh9aW8DiMKWyxoa8dqb4N3sEEkpdsFg@mail.gmail.com> <aO20G22p7OwJq6C-@pie>
In-Reply-To: <aO20G22p7OwJq6C-@pie>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:38:59 +0200
X-Gm-Features: AS18NWCg4FakAHKpN6u-x7lmptkHtb5kz_X0Y5yrB5k3cupKvc4MDFUSFgWvd_k
Message-ID: <CACRpkda7AMiJEVioOVANpQ1oe1rh7ejKs6=erA=hYQWoyLauog@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin controller
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yao,

On Tue, Oct 14, 2025 at 4:23=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> To confirm my understanding, would you like to drop the outside node
> (which now refers to pincfg-node.yaml) and refer to both
> pinmux-node.yaml and pincfg-node.yaml in the single level of subnode?
> i.e.
>
>         pinctrl {
>                 uart0_defaults: uart0-pins {
>                         function =3D "uart0";
>                         drive-strength =3D <2>;
>                         pinmux =3D <...>;
>                 };
>         };

Yes this looks really good.

As you see it is also very easy for a human to read and understand
this device tree.

If you want you can take it a step further and use just "pins"
instead of "pinmux" and infer the function part of pinmux
from the function listed there such as "uart0" so you only encode
the information once. But it results in a bit of tables inside
your driver.

Thanks,
Linus Walleij

