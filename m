Return-Path: <linux-gpio+bounces-14633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412DA09090
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAC53AD556
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7501E20D506;
	Fri, 10 Jan 2025 12:33:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C052063C9;
	Fri, 10 Jan 2025 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512387; cv=none; b=ovBd0gnmc6iXO7x8lfpwOwES1iGvmXZFDTlj01cNAjGAbIxcBNOYZUouQROs7d1/qoJ0gbpskT3ZSsnHdNuGEoxUviM6FjuOTTygPv4MXiP7LNocWr3CNI0WyxZ3ffpiCnr/k4ay4VAMv4tl8ilB/H8LCRSt+xEP7vGWjDDeVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512387; c=relaxed/simple;
	bh=3eCtxnuOyDNNjas3Y6+ge+hPqvTIXWygLh+ZfBqBYNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbGnAxDgdE4aHfv0KaRjrU0PkpTBaWrhdSBc6EWuCHvJjesqSEjVtL9sKhurH9Mz3UPgzt4/PNkmmohXj7fUgNCdfyKBimXYG5Z9xlXxDQknmSNsnRaavEZPKxOy13pgI2fl60y8/XF1L/FHohEIbU6huyQkmGFysapBlNsOmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b60c221587so812009137.3;
        Fri, 10 Jan 2025 04:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512384; x=1737117184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu9iXVSggU03D9/r+Bo4xPbYj9RK/9WnPGtp6YB2g5U=;
        b=GJD2WSkqfFSFI++TgAnhu9RxquAS8eMImTz0sALHjWG8DLUXYW+Zo9jrcQOPMXfkT5
         Bezpnf0OAcFgkD7aooU8i5DL8n6VX4bqL9UeuvpppH7/JlTsSD46WapAOPHeLoAIOg94
         sQBIPNjXMrY9rSGEuPUQkEtjJvLygR+iUaX0dF6yz31FtBtUWGtbVhVulC4B6/3MXADX
         LK7/1NFE8Ym5NxcVzz5qf0Q9QB/72+8bOLNXip3QvYvrx/INOmYTDQgcO2LLiL9wirlQ
         5yDPbJndDgVoPupJ44Jpgzb7d1DD75fDXGgWdQ3bNqjH7lyBfj/RkwW2CTi6dpkMJQZZ
         uFeg==
X-Forwarded-Encrypted: i=1; AJvYcCU1/9JRrqSNcdGwY1eC2JBMHK7GvOK3sj7og1Xcxvr4X0LK6K0PU4Y2VTdL67jXqOil1//KU5G5yGKysejiescr9Ow=@vger.kernel.org, AJvYcCV0LYeleVQzHOxPbvVz8Vm0veoekQ68GSrL0J1f783/YS0hw1BzNDVYifOq/nPmPuOjFkLmTv3n21Nn@vger.kernel.org, AJvYcCXOMXCY/r0RJ8agRbNSdcwA/V094NzezeALmyAoedeQUn+eerWkxV/Le3tL+xe2TAt4b4uApcIL1yt4dMJL@vger.kernel.org
X-Gm-Message-State: AOJu0YzUF29YFjmLGEXa9zsLU5LsibgWTbzmO7p51mX2xQpqw7+tFYrZ
	sj6FLaVGhXlvDlJ9+rOgyQLuiIprKLi5Q5ayowTi05aOdteqL14+blSv7BeT
X-Gm-Gg: ASbGncvSSeaX7FPRtbUPMpbdYgqo6nXUBEHSiM0T0bPV+NNiqD7nqQtJihb5+FY2rTx
	NiBojtFIEC9+NTkIpZ6vhfBRPzY/tXgbNIzOkW2TefAnNw/5k8Fl47WRromNcCwzIuGdJKwX7Tw
	OEMbfOeA1Icvba7N0ab1Xnf7tZuwQD1VNOYbxySbyKfEkW+2W4yEfd9DalIVdi2ZlR7kRsWN6G4
	hD3T3KYZTDnU4BoqqQ4Hhnb7rIQJhSq2zC4n0/nUfqch/bf8Kk78qwtAIwhYCidNxZaV26jPAor
	z7IxH70mkAjGHaLqn2M=
X-Google-Smtp-Source: AGHT+IH+kCmRjlrFdMKYI85x5G/AcbQawCk4QABNX+N3hd7+wV5LwKLEhnDmRg08VXa9mx2UA4wBRA==
X-Received: by 2002:a05:6102:38cd:b0:4b2:5d10:58f2 with SMTP id ada2fe7eead31-4b3d0e0f279mr9622760137.14.1736512383680;
        Fri, 10 Jan 2025 04:33:03 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f4a5ddsm2271595137.11.2025.01.10.04.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 04:33:03 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afeccfeda2so1230163137.1;
        Fri, 10 Jan 2025 04:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXHHRBy8K6+nUG1Nm9SGIfz/r1YQ3icc2hPXrco38txVFdrHa4UvJLotSRJFwnGkJoHsQMv50w2odnxs9Hs3jSKio=@vger.kernel.org, AJvYcCW4oL23nAGMyzFXJBsO1FPfNPBopme1bzUqu0iSSNSfnH7PNbtKybg2QONoCezYpCHAlRigzsMgGNltJo7/@vger.kernel.org, AJvYcCXR2FB0I+dSvNkIsBmdp/zWZr8PClUKdPRyfsh8ax/WmtaCqoWtuHRjopyh0pLyb6GU5Haq7q/Tcqwg@vger.kernel.org
X-Received: by 2002:a05:6102:2923:b0:4b2:4877:2de4 with SMTP id
 ada2fe7eead31-4b3d0e10229mr9826896137.15.1736512383328; Fri, 10 Jan 2025
 04:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107105947.321847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWHYDV=R6pVCXc-Upwi=egW1UYO0XJePE7JC4WGbaW=1A@mail.gmail.com> <CA+V-a8szu6-XeCQU0_6EM64YB_rsZOqpjimfRfmGT02enEToKg@mail.gmail.com>
In-Reply-To: <CA+V-a8szu6-XeCQU0_6EM64YB_rsZOqpjimfRfmGT02enEToKg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 13:32:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXon=0UJyKNuud6+cBcjAqweTgYwnN-OpJT=jct_iHjaA@mail.gmail.com>
X-Gm-Features: AbW1kvbofti7DqB_mXR1tu6kX6Krj2N78L-rWC9S24bfTtePSPc5SMZxtswI5kI
Message-ID: <CAMuHMdXon=0UJyKNuud6+cBcjAqweTgYwnN-OpJT=jct_iHjaA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use configurable PFC mask
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Jan 10, 2025 at 12:52=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jan 10, 2025 at 11:30=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Jan 7, 2025 at 11:59=E2=80=AFAM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Make the PFC mask for the PFC_mx register configurable to address
> > > differences between SoCs in the RZ/G2L family and RZ/V2H.
> >
> > "and the RZ/V2h family", as RZ/G3E is also affected.
> >
> > > On RZ/G2L family SoCs, the PFC_mx mask is `0x7` (3 bits), while on RZ=
/V2H
> > > it is `0xf` (4 bits). The previous implementation hardcoded the PFC m=
ask
> > > as `0x7`, which caused incorrect behavior when configuring PFC regist=
ers
> > > on RZ/V2H.
> > >
> > > To resolve this, introduce a `pfcmask` field in the `rzg2l_hwcfg` str=
ucture
> > > to make the mask value configurable based on the SoC. Update PFC-rela=
ted
> > > logic to use `hwcfg->pfcmask` instead of a hardcoded value. Additiona=
lly,
> > > update hardware configuration definitions to include the appropriate =
mask
> > > values (`0x7` for RZ/G2L family and `0xf` for RZ/V2H).
> >
> > i understand this means that SD1_CD has always been broken:
> >
> Yea, but since the TF-A configured it we didnt see an issue.
>
> >     arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts:
> >         pinmux =3D <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
> >
> > and this should be queued as a fix, and backported to v6.12?
> >
> Agreed.

If there is currently no issue, there is no reason to hurry, and
queuing for v6.14 (+ backporting) should be fine.
Postponing to v6.15 might cause issues if a new user of functions 8-15
is added to DTS in the next cycle.

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

