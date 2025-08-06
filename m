Return-Path: <linux-gpio+bounces-24030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC88B1C671
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0EC626581
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1FF28C5AF;
	Wed,  6 Aug 2025 12:55:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A71128BA82;
	Wed,  6 Aug 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484948; cv=none; b=L+16ILslzN007S/5iQKD53XWRkIy3zreuZgbEY4stZ+bphifJdxx7Q7OazOVhqTXL26/+w3s71XYmGcQw4iC98+4dL3lV9WV0aoTdIlLZPNn6lGxZs4p3/w6+ZIoA94My5tEz+ofno7TT6K32ibecHBWs8Zt3D29BJBVshMKYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484948; c=relaxed/simple;
	bh=P3QlcARxJlbh0/x5ion9VtoHQCB+GkTvHo9FkE1LUzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQXI7qI5o0GIYNneRsJ2/ItKfBOPAkghtEVuD8MPZE9FaTmY5BejXvKszrScgcNFe6pX6EumKEkjKjGp9hsbGlWLwwH0G0QKj5XPXvp2QhfJzQ8KrBPT6huPhbzWJU6T6dDRFES2obCvVjOx3baAwgsSB1Wo/tACk22hHAdTty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-539546a2174so1335438e0c.0;
        Wed, 06 Aug 2025 05:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484945; x=1755089745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRa40/yxwREqANci7OnONJHxf0dtTuLBHWpfC1ovFsg=;
        b=i/34fzs/g2l/C6G2j//eYK7So9T5VHQkWIq+lvbj++BatzHkO1xq04rJ6MPLo48qr9
         M02veHYzCqweNjQEV9qcNfPpwVDjhaOh/iDOmn4ZQ+/nRtY2Witv0GFpUTPLGt96Jud+
         E5tE6kqr4VwM+URzZTVFPHkwTo2VJCVSQYXgn0gzhq7gxL4AaJ9jeKUdm37pO2WW1Kq+
         2e3ffJO4T3aRLTDU4MIkv8TcKMmSXIAqLzVo34FGiC6wt3XytH8ZK6dBS9glhXCnh1bD
         Cu9ASmKXgtQ4/I/rvF5E0zXfUH5S3wniAU5VYN0yDjlzbYeNI7HZUaJ8fgHuvFkeg+85
         rQAg==
X-Forwarded-Encrypted: i=1; AJvYcCVlO4vMWwGfdKJJJyPdbdnoFEQ3TUmGiuvLID58y/1pGZSfiPJxL/AyYriS+kgNB8cto7lq+n8kqspwIeufHsWfldI=@vger.kernel.org, AJvYcCW1q1Mg9GPICDwUbwpuJb0urq9lQDD+AxhWKaAz5moTfcbM5XNlh6FlV1vV3o0VnuRWC28N1rA74R8SBari@vger.kernel.org, AJvYcCX2RHLej/0UapmpXYIxjPl2K+uoAfsUq+2q7Jkf+BAgGzqGWSG7RWhDe/Aqzoe1BL6tq6is9cL1dSGM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmsi2smDolTrsYudI1Qca2HhRYSNIlGNGk4XJqyv/fMEA5rw3
	RwYNUATKuX36uXYQgv+OCxpr7YZ4+TVMdjTuFZW4w5Qo3xMKOIxnYAgRySCNFwud
X-Gm-Gg: ASbGncs2WKd6VTHHnHsLEs7FjhSeSbfV4cSh2KAyKFCTv4NC7NDLeNQnnkrxLNqsHQI
	SZsyozN3g/F0FNS6VOrOp4Clw/tDUPcPbPJKiwyiX9Oo06zqV7x8ZqiUsUi1NiBBJGaZ2Cqoa37
	4whNnAO7DCOk1qGMYr0lPiePnmjitO7CXPaWtcpfylFw6Ieag7Lu9D7evrUs/xkk7T2fFMDJzbG
	epaTH82cdXLJRiI532zshcLJwprNvddqlTjDpGha+8T9acYTFjmjblhvYDfmgU/V+u5WkbChjtQ
	lB+iz2Ezwrm9LInzJLdt9SlDwJYN3VFtn7DBlKRUerfksrMHqlBQQ7SLQzsNapqGuB5OD+5okp5
	Tu2DZiaCUIbaVp2/AYI2bIikJliF7SyLnAaDvPSsbD4BG0b275Bpoefa3duUG
X-Google-Smtp-Source: AGHT+IETj8+guXQZHfEpwq2NAFpqnvHhgBPyiDSu5fhpyaOcsvi+CMVh32QwnzoSXAzFNFR2iPtqTQ==
X-Received: by 2002:a05:6122:20a3:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-539a04e5675mr1077930e0c.11.1754484944692;
        Wed, 06 Aug 2025 05:55:44 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b9a5a2sm4190136e0c.15.2025.08.06.05.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:55:44 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-88dbc90853cso1214628241.2;
        Wed, 06 Aug 2025 05:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQpwGOO3DsH4PK5UqIutPAm/4oD29uZnQpcZXjbSo1kvP7oqGO+UDamukN0zkC37tFdOQSqVb7/WJ6iT18cKE88gg=@vger.kernel.org, AJvYcCWQGMq9KGuizN9c7dNl/ASyCiPmLR0lCJ+7q/BDXTQw14ZuABGgyujJubZ1sjTjQ7C93MQE4PfW+ajd@vger.kernel.org, AJvYcCWRBn4czcobDfqqkoz+hh2fYa8ZuBYDjpb494/PxZiEfUg0Hp8oEAWvrbUzq6jcnHvKe2BCr2L7eDECDatZ@vger.kernel.org
X-Received: by 2002:a05:6102:800d:b0:4e7:bf04:413f with SMTP id
 ada2fe7eead31-5037443c433mr1090945137.18.1754484944196; Wed, 06 Aug 2025
 05:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 14:55:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtS27BhiJUPpKwM7tyxa=5G-LjxY791yFcp86zChTB=g@mail.gmail.com>
X-Gm-Features: Ac12FXysSJK7aFOB7nIlDAU84BAVe2ma7iPidAE3HNoGwv9L1h4L9caYralRUc0
Message-ID: <CAMuHMdWtS27BhiJUPpKwM7tyxa=5G-LjxY791yFcp86zChTB=g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G3E pin controller does not advertise PIN_CFG_OEN capability, so
> there is no valid mapping for output-enable bits on this SoC. Remove the
> oen_read and oen_write callbacks from the RZ/G3E driver data to defer
> OEN support until PIN_CFG_OEN support is added.
>
> This is a preparatory change for future unification of OEN handling across
> the driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

