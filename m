Return-Path: <linux-gpio+bounces-6374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFE8C594D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 18:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47207281334
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8BF17F361;
	Tue, 14 May 2024 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns0gklQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22B1292D2;
	Tue, 14 May 2024 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702739; cv=none; b=qrp2CCZAucxkRT3mA46GONfoMOlf7z4iJoPlAAvif1trEAYAbKjKNwNGQVKCofk4db+A/64culD53DtlCj8VqXfBjafPxppQtoXQ4PKVL3eUTLTsLknMqKFNnpdZVUCoktuZTDN9xy/nrJ1r3fTBy3cLYJmZC6hXAkL/OfPdVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702739; c=relaxed/simple;
	bh=tpiw7IYuGjhBXF2DDCwDzTvk5q5Xhwg23VZBJ9+60Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJX/c8SodaXVGezLCzGk1lHBPk5wM/0p8Ckle/RjfWBZPXCX014CYYlbH/ZQ4mqH3Y6VjZJt3AAgwqUc5QjM9RWvuBBpMGknINnvBt8Bjiy8Np9h7ZfA0hv5W/1fk26n7y5V2i1T5YLZ5GZub2JBZBSmmAw50UjVIJItdHF6rho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns0gklQ2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a352bbd9so59232066b.1;
        Tue, 14 May 2024 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715702736; x=1716307536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW1Zk+kCimN2Iqojt/YnfpXJKfkUntvLK6DTSR9T0HM=;
        b=ns0gklQ2AkBv6MxF/wadcyvr+IXytgX3d4osjkoqrjT3bp3JVv3lV2pP9T662NbErH
         H/dfQ4QWWmPj4r8OeO+uSTl0mmMuRZ+QOJlL4ROlQ3Y8UvMd7eqy+BylxNXIBIGBAumO
         tlq7D1pKn0E8JmfNdO1/0sHiRO9HTq+e/qeYRLyh0QmuQb8iUQrm9a+47r9P6KNJJrUw
         UUMY/pGW6fL+TZemcTOYEvsXt3HSDBxeY8MAimThrtelF2wIP9jGuDwEdXd7ENPWscLC
         fZNuaX3VKdi298GjlgSI2RtibNNIDn8N+lp9Ev5DFNSYYkbG5iwf+HPWCH9HkXCx9+Wy
         vxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702736; x=1716307536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW1Zk+kCimN2Iqojt/YnfpXJKfkUntvLK6DTSR9T0HM=;
        b=lnUJ4CBS9HGSvy4IJncD1+UdFAtKh36i9HUMCyhH08hhBvdGovN3sovDv2KRduns2x
         f7HNjSH42qHTIRBdsQDAwZSAuRp3J0r4ie505RrbaYxWP66tymGrGmMdSFagpeA95wwB
         gJ6x6DoCpleoy+ZuW+O+SwH83A77iZ9SXmIr+w8wq2NHdwPYwkMx4rPJmOpH3UyzMP6z
         IWcKb/LqiR23SjYBx3r1hqwxxeR2+Vt+WfCPaFL90f4kKUOSTnGO+cyr11o2KCJf9Quu
         gsT4G29Oa70mBk22lTI4JQxP73xSy1ewhRPnxz3X207WOh2ybebRjNXCBHGbF0cEPxD8
         jbjw==
X-Forwarded-Encrypted: i=1; AJvYcCW0wXHtli9mhSgeN1I4XV/3sRjxwqSPZZ05cTQnye5WVfoKGQwVaWzsmpKLtBOQWqdzs+1zCbsTX/kS+s4kOYdtNn5l9W9SfjkTzPOEMzqzBK3RdFz7Wl2iDqilodGmCMyK7vcfrLkXtq+MKAYpomPxU3vsoNV/WgyO1OgjSiReDkxgXEOeLAlm6I/kcDR0IJkyEOWfkjrdzSeBxS6RfU+/rjIG
X-Gm-Message-State: AOJu0Yzdh7KiTiX22DZz2BbWJ41Z/GWQ/mGCycRfV24c0XHhaxrzZWF5
	8Ukkt9Zq4h6kfIc3UwZ3moRKpEGVEu4ri6KMKJ+AuTzPjdzP67EfYqTP6/bPa5TeL1e3Ci054mX
	772WpDmIm7q1q6uNbPskR2NLT1d0=
X-Google-Smtp-Source: AGHT+IF1K9kLqXaF/wSSHniCW4SSJsP6V1e2Eey8FppUfEal0xssx45EV2LSI4Ou5zR7+iz4dGAHI/k3UMcmiX2NRyw=
X-Received: by 2002:a17:907:86a9:b0:a5a:24ab:f5e with SMTP id
 a640c23a62f3a-a5a2d27d8bcmr1377625766b.25.1715702735782; Tue, 14 May 2024
 09:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZjpMeVk_HiixZUEu@hovoldconsulting.com> <20240514140446.706847-1-quic_skakitap@quicinc.com>
 <CAHp75VcfYuukpLg=F36ykddsT9SpfdGNyyvVeyw-Yvz61Lrq7g@mail.gmail.com> <0a372307-8887-ac97-54c6-d6080e64540f@quicinc.com>
In-Reply-To: <0a372307-8887-ac97-54c6-d6080e64540f@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 19:04:58 +0300
Message-ID: <CAHp75VddpSz9Z785ey1FfgDMPD-zY8gesrqD1rt8yGdc9Pz-PQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: johan@kernel.org, andersson@kernel.org, broonie@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, johan+linaro@kernel.org, 
	konrad.dybcio@linaro.org, krzk+dt@kernel.org, lee@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 6:05=E2=80=AFPM Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
> On 5/14/2024 7:48 PM, Andy Shevchenko wrote:
> > On Tue, May 14, 2024 at 5:05=E2=80=AFPM Satya Priya Kakitapalli
> > <quic_skakitap@quicinc.com> wrote:
> >>> On Thu, May 09, 2024 at 03:07:02PM +0300, Andy Shevchenko wrote:
> >>>> Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
> >>>>> Quoting Johan Hovold (2024-05-06 08:08:29)

...

> >>>>>> +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) !=3D 1) ||
> >>>>> This should be an && not || right?
> >>>>>> +                               (ARRAY_SIZE(nldo_ranges) !=3D 1));
> >>>> In any case BUILD_BUG_ON() is not encouraged for such cases, it woul=
d be much
> >>>> better to have a static_assert() near to one of those arrays.
> >>> I think the reason it is placed here is that the above line reads:
> >>>
> >>>        rdesc->n_linear_ranges =3D 1;
> >>>
> >>> and that would need to change if anyone expands the arrays.
> >> Correct. static_assert() cannot be used in the middle of code here, it=
 can only be used at the declarations part which doesn't serve the purpose.
> > I didn't get this. The ARRAY_SIZE():s are defined at compile time
> > globally. How does this prevent from using static_assert()?

> The reason we added it here is to make sure the nlod_ranges and
> pldo_ranges doesn't become larger, and we forget updating the
> n_linear_ranges.

> Adding static_assert here is not feasible so adding a
> BUILD_BUG_ON at this point makes sure the n_linear_ranges is proper.

No, static_assert() will do _exactly_ the same with better error
reporting and location, but what you are trying to say is that the
location is chosen to be near to the n_liner_ranges assignment which
happens at runtime, that's why it can't be used as an argument to
BUILD_BUG_ON(). Based on this discussion I think the comment is
missing before BUILD_BUG_ON() to explain the semantics of 1 and all
that was just said.

> >> So, BUILD_BUG_ON is the only way to go here.
> > I don't think so.

As i said.

--=20
With Best Regards,
Andy Shevchenko

