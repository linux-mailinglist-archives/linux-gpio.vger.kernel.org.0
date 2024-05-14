Return-Path: <linux-gpio+bounces-6362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152D8C4EB9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 12:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD5B1C20C54
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F56D1A0;
	Tue, 14 May 2024 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOMwTUyS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505981D54D;
	Tue, 14 May 2024 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715678640; cv=none; b=DYvLg0VTB89jZc5b/EV0OcjDuyf8Jy80QqgEaam6oydZdrsxavKJmM1cd0V/GGYcTuFnQC3lXR1NFqgkga0d4BtaxRsWf7G+2AEY1ptSTb/oSz87ANOvD8HNk2bzrYuK5/+KKQlvGOjr2JRrvFbsORutToGAdTOkTY1UC8cWD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715678640; c=relaxed/simple;
	bh=K3OTR8ULFJUtDO5a5s60dvblLbZB9QoBi+IviT7ihzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXNVUe3rFiXs6gQ/T26aoz7SblJIRWFw6sZFw9X61hj5iGrS1+hWU7QF6poq6RXfpuKFpW/Gavl6WLFcYPCai3WiQlbfz6HDnG0mFA0TkC7K8pB9kFqyzkRDRmCxswIxq7zG862ZJ+wEsTR7+HMqgBtLcuNrmthGWBDgqvZahh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOMwTUyS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59cf8140d0so1218180366b.3;
        Tue, 14 May 2024 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715678638; x=1716283438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3OTR8ULFJUtDO5a5s60dvblLbZB9QoBi+IviT7ihzk=;
        b=GOMwTUySkErqcwZkiNfs1NobXPyY54lV+tA629amvtV6dZ8EAl70sqEO8GZrxHfQGh
         zPTymcOIlcv4kZz34YoCrbMms7JvDBPxmXPVbipWSo4TSagi68dPIuugOtEFeH0caY0b
         lLomWlozFXU8oamiBCNIKvspmiIAQV3UzWT1z77z3foyUj/6SzQZ751Ql9DW3NWIh/c/
         mVh35AgKtg2Zcv3uEU2sAMN9DRwwWqy2G/W8KobkADD91eDiy6jGNIR9xGoBtgeLwfy+
         kpYZQsHsr8cMb4rRVXZHat+abD704SnrJKwdMTbqgFzuj/yNGqc18Ssci7HqGbQuIz4r
         mWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715678638; x=1716283438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3OTR8ULFJUtDO5a5s60dvblLbZB9QoBi+IviT7ihzk=;
        b=QdBqXYxQiVFaK0lcqVC3Rl35NShMMQFXn6w5raWk1YAzO40fvX/xOtbKVlFw7bBNft
         zlRQOvMaf2R3f/ZmlM9KcpYaWV1zAYcMI1Yk1OUUj7HMDEXl9UMl1AVSRu5FrsyF3fvr
         ozYLSB+/DoGItFWi2ocz0nWjMXzvDP/LN4JEHXoRK3Eam1lXXzFTSMbML6bw6Ef2M5+a
         za1OZ5MUgH0aVQJcvqhTNYK+lTNAWMaaty++zdPWXNEFyNERGkf07LCzN8b6r812Lzma
         YuyfnfCefePnRF/DVF6eR6xaEuy+L1ywDuc2Gtg2iVlsZUgZblPT+xrta0Q0tWEs/cQ8
         PJUA==
X-Forwarded-Encrypted: i=1; AJvYcCUlteD6w7wyXi9dVMzyKse/Q4TWZFwH/Qy+SeU1zy0mM0vCOIMaS6/Vh7Uzderkr+wxISDrP/3e6Oqwa/ivrv94jP7A4WMpLNSLe6aylRfB1SB6V1HnIe861JYIZ6qfAijh4wT2Js2VAw==
X-Gm-Message-State: AOJu0YxPJfafuNqjM3e8O4UB94sHiQqwees3TDnRq8oha6fF96t75cud
	mrt7k5LvWBpy/+umOBac7LTxIbK5yZCpu9xEFme4qbJXuSdSFYr7CzqzXtw6LTj7xtfln6lmsPx
	nfGZXHIwDyPFb1SqsQ2QcXYKixTU=
X-Google-Smtp-Source: AGHT+IFv6OwsAth00MXyRFnVnDa1HnU+oO/01HnzLFoICT5ktqWvhDysqnOTP47p2eZaYjhrRl0AluW5r1vQGonrPzg=
X-Received: by 2002:a17:907:847:b0:a5a:88ff:fe81 with SMTP id
 a640c23a62f3a-a5a88ffffd0mr61625366b.20.1715678637514; Tue, 14 May 2024
 02:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
 <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com> <d4c03f3b-a8ce-44bd-8897-8a2f276dede6@sirena.org.uk>
In-Reply-To: <d4c03f3b-a8ce-44bd-8897-8a2f276dede6@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 12:23:19 +0300
Message-ID: <CAHp75VdDMOLuRhDNQ=dzoE6Yyah+k-pGm8vY8B2DmFiyPBuftw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, naresh.solanki@9elements.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 12:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> On Tue, May 14, 2024 at 11:55:06AM +0300, Andy Shevchenko wrote:
>
> > It's about introducing pages of virtual registers (from regmap p.o.v.)
> > to access the banks of selectable registers. The cache most likely
> > will be the same, i.e. MAPPLE_TREE.
>
> If there's paging of registers then regmap supports this with the ranges
> feature, you can tell regmap where the window is in the physical
> register map and which register to use to switch pages and have regmap
> export the underlying registers as a linear range of virtual registers.

In this chip there are two ranges that are dependent on a selector,
one is for port selection (which the original change is about) and
another is for PWM (IIRC). Note that they are orthogonal to each
other, meaning they have their own selector registers.

--=20
With Best Regards,
Andy Shevchenko

