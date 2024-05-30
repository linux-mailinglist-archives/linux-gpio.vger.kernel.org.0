Return-Path: <linux-gpio+bounces-6954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F78D4CF3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B707F1F22BBD
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120517D37E;
	Thu, 30 May 2024 13:40:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1B17C200;
	Thu, 30 May 2024 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076450; cv=none; b=M6LUKk288jLu0Tc7e7i6Lz2u7PcqrYGavUCN/vhh3AId28zhgm+/nSAmVZpymbsCUw0eexP3LfXqea7d6aTkG60YLUzpaIg6XTCew6EDFLVXB8rsS9HNCeT2oyWYZKokBIzVxDysLbxMCvH5D+X4eFXAdvKSSBpj3Q+TaRHZySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076450; c=relaxed/simple;
	bh=lIlSzIWS5g2c9h1l/ma0n9X4Gfu2m+/T7kpjxSo5BXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okLpfuw8SMbUzqXyr+6fm6hXScKc1Olzms61JkdEyeUgahmxPEszaIp0y3CWjWzMsd8U2bUvAKRV9JWTYVlxni92fZIeeqX/51uQ8FO1mGCf9be+wRaJ9t8jlyIhwfk5AvHutNDTJjsE8WwBehCms2bqBgyQtJ7pB5kG72ZpHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62c5fd61d2bso9348017b3.3;
        Thu, 30 May 2024 06:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076447; x=1717681247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ3f9+fUvgkfKQ2kx2UNWzarW6FXRaKbEJ3+LcKge+U=;
        b=qzT6aWEL0JdhT6ILSAGlwOI4ec46kVp3by8HRBe6zDW+hzX4zyVH7p9rN3Y3GOQla5
         N5u/9PtQ63DbyP6H0idsTcnmDLRf9R4sSJtWJAWPuMBv+KLGzzW2pWhIglZyB8cigwtt
         IJlPBy7TwkGgDOJWpm/13gNqzjxU8Lfgeus69+aL6Wbems/2gbUCeg5xKhE5F+KV02rV
         w/L6SOgYHlubaa+wrMCmYCtZuu0VLJKjYDcFqvsypJHCRFJLdcf6yU4sj9k6gb+JTX6+
         DQt1Xl018NshY8E2sdD1tNo3Rt1kS3+1Gr2RFgkX6KBLnkmBVDzhhD8mxN2DoFTx05Ti
         FO5w==
X-Forwarded-Encrypted: i=1; AJvYcCX/lnuqMsn1chpkfE1VOxjgcZEzh8lD9olhM1JgjUytp8tW1xhLfkEP8nWjmW9oqSJeEyQvjNF1TlBMcb5UU8CkLrbTOk6qyrP7ZoLDznvn+j8Lqbf8KDn5+33UZMWMqCHrphk3H/tQEJyCjCYk0CilicHaPF3yUb3A8DyFmAph9P3IiHtBb7ZTUlfFPYoO+Daf3yLswkwyrCCeRvFQF+CC1+186O5sOg==
X-Gm-Message-State: AOJu0YzR35wFNEjFC8ahAzyYhJ87M272SX1VeZG7ZxbkfARTdCc7G2Yl
	kBhzqA6AGUY2GizPbYcyM9/rdVJkaMdjQjkGiup5brCnSJgFwnhQty9yo89w
X-Google-Smtp-Source: AGHT+IEBb+XMp90PbUvwx7Dx5ZpFDUvPTdcOZ8kmjQZcL6HUm5sl7Sd9cFCinRNSV0/RoC7qm8A9eg==
X-Received: by 2002:a0d:c047:0:b0:61b:3304:b702 with SMTP id 00721157ae682-62c6bbceadfmr19685677b3.5.1717076447043;
        Thu, 30 May 2024 06:40:47 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a3f056esm27910387b3.50.2024.05.30.06.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:40:46 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4dda88ce9so667518276.3;
        Thu, 30 May 2024 06:40:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdhVFquytfzdc6g4T63qzTrmxcZQEfsMMcpiVtl+a91k3he3hF/H+Uk+gJZL6vifceS8nvTpfE5o97xhmLVbGy+22vuqvbuzMW0knF7bdI4Vn5NOVraYa4MbkusyYzKX7hKcJc807R5W/57XSdS4QNaIXrxIwhK8DUI9BH4T4VXCOFS+fBMGbmJOEOeMj0Tlenamch7pVvB4vGcXte+6wknTqFGg849A==
X-Received: by 2002:a25:bf91:0:b0:df2:43dd:f7a3 with SMTP id
 3f1490d57ef6-dfa5a7ce1f4mr2347623276.58.1717076446347; Thu, 30 May 2024
 06:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-5-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-5-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:40:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFayjKtnJpkH5iFy_UT4uXCh48-9zJOJkiyu5pT7vcBA@mail.gmail.com>
Message-ID: <CAMuHMdVFayjKtnJpkH5iFy_UT4uXCh48-9zJOJkiyu5pT7vcBA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, May 24, 2024 at 11:47=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/[GV]2L SMARC
> SoMs, as per RGMII specification.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Yep, TXC is MAC-to-PHY for RGMII, but PHY-to-MAC for MII.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I believe this has a hard dependency on the driver patches, as a
failure to configure pin settings will cause the device to fail to probe?
Hence to avoid regressions, this has to wait one cycle...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

