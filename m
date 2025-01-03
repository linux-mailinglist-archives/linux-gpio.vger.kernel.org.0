Return-Path: <linux-gpio+bounces-14479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C4A00E05
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 19:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76CA1635DC
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 18:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43FA1FBC92;
	Fri,  3 Jan 2025 18:47:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D61FCCF8;
	Fri,  3 Jan 2025 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930021; cv=none; b=lQi6eGJunJcDB7o533ZNOmT85WZkrRaA6U/SYapd1LNGE+M3zWnmsmIyyjlCiLhoBQFaXiDA9ak8GfglfnWkB2Bm4iPFDCu1DAwIevKucAEEWK8MnT1hwoxxt4LgUlplVzn3uKoj3v+EhCeSHK/E6jx3+K3dq3Vap3qRLp5IN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930021; c=relaxed/simple;
	bh=VofT2qYv9XxAJmxdeKPuiWa2a1E1yRENeBXt2ikh6eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buonE/bv7Hl0jhResNhRb34jJROVHgV4UXbWICJGecE37hTC9o1Oj+jCPB5cTr/QH6P43/UP/TObzugpy9nbdInyE2p+wLH/iOoaAziYBsR1kt51nhRCcGe0MkpiOAOPzjvvLrebtu5NjuxBjAAvmwf38ZU2N+2PqRwXlFP5xPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518957b0533so4030915e0c.1;
        Fri, 03 Jan 2025 10:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930017; x=1736534817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TevZbAiLRa7gjGjYVOBhVXes5Cym4+t4iTP4JXR+Vws=;
        b=umNzZhdi0DKcytl+06ZfEpy19r/hJK8feRweKY8gyovxB3L6JYsdedJm4eeDKkRM6i
         QLhYEwFmoXctUJg22IYcaQkUQltgm2bC2g3ZaJyr2xD3g+HFMKONxCQsAy3LtHR7zdlb
         NXj14KfI1T7ZnL4dQA/qmwGRb2NtP10GIaLQVKkp/0FDIaDW/zAd0zjl4DP3oIWcPBFB
         x3mcuCMtQ4oLVJJGvd5JL2Pjb5JytsKE1nlTJgoyfh2OXj7FQl9iLqUOBJjs7mu5jEGG
         CsV97C8edprc4/nobnzCF/dVStfLkfJ7iw2n92H1q+QvrcGOBG+AO2Y84d6wAGmf0EhH
         1rNw==
X-Forwarded-Encrypted: i=1; AJvYcCUlKzHB66u34/4MXP+M8YbXkcoCHI1gYDXVzvsF5EUCc+eAKVpnoHcAP5ZtK1fzo6eXrH6X23Jh8qxf@vger.kernel.org, AJvYcCVJX0q2l0ilMLy7ndqrdmyUX/78fR3S15EiyXvkQVR2jwVmvgXBWttTjq2w/2Vagk50W4cySkyiiEaIRRI/Ls6+cjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQchlxa4YSjY1o2JhGUDzZuJ8hoDeOP1lS8dtv1VlrP9q9ACsd
	BYT1VcHcaCDBh4CJpxjntV8SlVNK2OhnezgSzSGn+5fLDQHXf1HRiVS9q7wsRUI=
X-Gm-Gg: ASbGncvqJJm8C0wYrQsY+TFOBR3ndqhIVB7vxb+b+c+jVoAjI2kJcF1O1LXLzaDbMcr
	CeyGR5KpbacK5GOFj83Zp1lyhMHaZ/qtkGD3wkKbgYKlrVaqnT/hP+cqa4XSRHugtHMjwQ2sqW4
	xZG2G2xz1YRT6ILFyLsrpytPjYNF3Btv0olRdobpRoYoU6zWNHBjOE5740C5GUFH0fL+SezRrTr
	wmC18oPZAfpMkNSpiFsQhSfgaHq0CZP+yFz2qh/CIMrXuRciMEIen+LfzHD34y6i2vrS8e/Iuxm
	cfIhAH+tbd4711r3v0I=
X-Google-Smtp-Source: AGHT+IGF3dQERzo309Mke3XtcQn9UOLgE6g3ahn98nQPW3ZylmMushkOWmg/5Dlo+Hl+g8UUX387GA==
X-Received: by 2002:a05:6122:602b:b0:51b:8949:c996 with SMTP id 71dfb90a1353d-51b8949cb06mr24182645e0c.9.1735930017225;
        Fri, 03 Jan 2025 10:46:57 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d0ba2esm3253746e0c.50.2025.01.03.10.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:46:57 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso2103752241.2;
        Fri, 03 Jan 2025 10:46:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8UKAkazAITRbfDGfVxCTfcmzexqDj1nvdoj2k7pnnlmVKoOZlNiRSk6ggxRbcFbXJzhrNVent54iczu8iVNT5D4w=@vger.kernel.org, AJvYcCVcIRjvgQeLZ6i+hpNkFCHSfklo8113ijd6Nq9/Eaz3bkNKbkAniZicc6fEpH9DI5z31iwPL5HttnzT@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:4b1:11c6:d3c6 with SMTP id
 ada2fe7eead31-4b2cc31ebebmr39941283137.5.1735930016740; Fri, 03 Jan 2025
 10:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:46:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcZ_Vz5OT+8E6V3zoVMSi3AwroaoOS1tL4ZU14CnD2QQ@mail.gmail.com>
X-Gm-Features: AbW1kvZvY9av7Ze4qP_gyKTonVEkGhFz0W0OxIEMkKNdZ95Hijl79sJM4OIUFgg
Message-ID: <CAMuHMdWcZ_Vz5OT+8E6V3zoVMSi3AwroaoOS1tL4ZU14CnD2QQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Update
 r9a09g057_variable_pin_cfg table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Currently r9a09g057_variable_pin_cfg table uses port 11 instead of port P=
B
> as mentioned in the hardware manual. Update the r9a09g057_variable_pin_cf=
g
> table with alpha-numeric port names to match with the hardware manual.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Included header file renesas,r9a09g057-pinctrl.h
>  * Updated r9a09g057_variable_pin_cfg table replacing PORT_PB->RZV2H_PB
>    macro.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.14.

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

