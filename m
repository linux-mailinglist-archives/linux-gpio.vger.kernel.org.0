Return-Path: <linux-gpio+bounces-19163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB0A97DCA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 06:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2DC417E798
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 04:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DBE27466;
	Wed, 23 Apr 2025 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqEVew7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682419D891
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 04:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745382617; cv=none; b=f2T1gsxpY/ChkHLOfnfEepqk+H+2BzY9Z+/oOYQ0d6SVAZ9Oy7mmCIlWhGc+Mimo3ModDEWLAVEyYSMnWMCbBkqBWLTNmdbsVT67Qt03IzhxL6XfVZWr8PPPqE2a3tdcmEAstpb+HveEHexNAaos/xTHIce1oKbRFImkkHYzBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745382617; c=relaxed/simple;
	bh=achXtz6rwLbu9XmwZmnEaiCOt8003iCrUCOin3J66EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Beyel7QDpLWp7QwuySwCjzMo7DrCtBMcHQabSNDGEKuEIcgZ0l0wQhbgX1YMVTxQnvR8k/8Gng+c/CQ+IK2V7UxMnuhZZFMjTYaF0YEZK3L7YkPpMRCD1OTXJ37h9G2PUD0biLARCiyReo1mnKgnn8u9x44pjpfaBWnXepTmPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqEVew7b; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so8461273a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 21:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745382612; x=1745987412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXzB5RexpHtAUL+rdy5KufFaaJ2alxrRbNyb8+CbVlU=;
        b=HqEVew7baapQBG2Os/pBqsM5EtIW41L2QilYFzF1HntRhVc06dzG9rxrMmPdDdh9ml
         yXUuvNE/Vl4ImxkE76KKjtwB8tE3/cqM8bkTLFTx6FM4DGLwP/hjN8XWTRoh2G3yy/8U
         QkdihhWlEPLd2DpOKd7CIOROp21en4t7awnrkUOOaK0PH5w9CPU0ymh5myK1SBUyHCLw
         zi2lIz3EXYwdkA6IaQVbDTwM33zIwEVlRuPX4ooT2Iwd/JJmSCQqrtzt03yAs4p1Y+VV
         DX/j/dR0gUAvKwSllrfjIp1HH9f2d5C4CCrD+nxIg4QNzaMbWWhB9BbatAYo5+gUvCFY
         H1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745382612; x=1745987412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXzB5RexpHtAUL+rdy5KufFaaJ2alxrRbNyb8+CbVlU=;
        b=LBTPMV6tavOZ68rdsJqPlhj0/aTk64Bbz6nfLvBXDmy5y9DHVNnRqlRdh2BBlkNxWu
         06mNcAlREo1Blpg4ctGZXvHZwyl43wqqg8XfPbI5ILbvXex0ok7YL8WqudzoChnI+orM
         Zzn9k5a/TgVjNoQq4CoMyKBp0nL6sc+OK8Qz5xvKrHCbQYqQXkraL3Envhe6Eacs7igR
         qj29Bu5mgRVLORGGG8K5Cpjm9hQsl7rEb5ew4TrNUGdGWtOOAt8+gjp9g9Svcn2gY5uM
         qBf8tOxd0HLF2BfamFeN0iSMhdnBjkHPpEkV49b/kFqeDS/4q0ur24UhR5P5rX8UEGdr
         0THQ==
X-Gm-Message-State: AOJu0YysiPjKX7xnGfaj9vPBN5rVVmxYzjp+wzflzgBbKAY+6DYjy4qM
	HiiD2HGL6yTcroqF/fKRb0vCpileJzc0m118DVEo91r7KY6DyqdVLBNafekXjDV2GjcfXOxySww
	1AnSlNH+2+qhMels9FkC+P8e1CaxSBo7B
X-Gm-Gg: ASbGnctMlcg7LTgViUasnSUveVfnhFdVENsTU/ivo6a2SHp31L/0xNQKZNHykAeeNqH
	ZdpMb2Fj6uWyx5VtClgorFDYHNFLK33ECuWlmEvoif6g2g16pFL5JJfkDlVIoQHZWA0lk9SCcAC
	2mwOUOe9Wf/FWudPp7t4nxQQ==
X-Google-Smtp-Source: AGHT+IH0kJBqLXW/bbj8BuxlmAVfOC994OI6oDR6Ke9tRzLqzSOxxxcxyTh8PnczFEd99EmychsGhqAnVaMYJLyQiUI=
X-Received: by 2002:a17:907:3cd5:b0:ac7:b368:b193 with SMTP id
 a640c23a62f3a-acb74b7e64bmr1536176466b.27.1745382612199; Tue, 22 Apr 2025
 21:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
 <DM4PR84MB18295F44324CD9AD83F5810787BB2@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DM4PR84MB18295F44324CD9AD83F5810787BB2@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 07:29:35 +0300
X-Gm-Features: ATxdqUEIJ4ESLhUmiob5KTMFHEA7y6cSjWZhfwm8xgLEsl1fIxCvwsQBmXegFKs
Message-ID: <CAHp75VeVQruB7m1WiXTfTEt4ggG9KNLRH3oJ_O9y5A+h=hh+8A@mail.gmail.com>
Subject: Re: UV platforms to test
To: "Ernst, Justin" <justin.ernst@hpe.com>, 
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 2:29=E2=80=AFAM Ernst, Justin <justin.ernst@hpe.com=
> wrote:

> > I found your email in MAINTAINERS for one of the UV platform related
> > files. I'm wondering if you happened to have a Skylake (?) based
> > platform that uses the
> > https://elixir.bootlin.com/linux/v6.14.3/source/arch/x86/platform/uv/uv=
_n
> > mi.c .
> >
> > I would like to clean that file up, but I want to have somebody with a
> > real HW to be able to test.
>
> I would be more than happy to test your changes on some UV hardware here =
in the lab.
> We do have a few Skylake/Cascadelake (UV4) systems available for testing.
>
> > For curiosity, this file pokes pin control registers without the
> > driver. I have several questions as well to make the better approach
> > on how to clean that up.
>
> I will do my best to answer your questions. If I can't, I will pull in th=
e real experts from my team so we can both learn something new.

Cool! This is what I need for the starter, output of:
1) `lspci -nk -vv`
2)  `dmesg` (just after the boot to the point of the shell appearing)
when kernel has this in the command line 'ignore_loglevel
initcall_debug'
3) `grep -H 15 /sys/bus/acpi/devices/*/status`
4) `lsmod`

P.S. Note, this message also appeared in the mailing list, so can you
share it either with a private email to my working address or via any
file sharing site?

--=20
With Best Regards,
Andy Shevchenko

