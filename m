Return-Path: <linux-gpio+bounces-474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E58AF7F70DC
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C791C20E3C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CA318049;
	Fri, 24 Nov 2023 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOsL5Yn/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205841716
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:09:19 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5cc5988f85eso17224707b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700820558; x=1701425358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7d06b6G7ORlrNQJU6TvzYJsppMO/COUWuckfBOPugA=;
        b=IOsL5Yn/2ONsRx3AZY/b37Bgaf/iyqpidxgZj6rw7NYkgqy5vAPljchwXUoAE3lGHG
         ZtQ5INVkDN6krE0PJdIfU7iGgdd1Q3T8z+OyF4DvIJ3g1+1GZ2bdB5FxVaIJJ/+GP+6i
         6ouSe4MuFwLBR2IXDibvZis2sXd4n/ptZX8gSX8lBSfM+CrC0VCdSb7/Ecl6H6Fqv41j
         jacYAw9yNZxJ2NLhp1ZeSYH/NnVRtyP3NiSOOEk5/+r5P944J8p0C/+E42F7wPPFjwQm
         bKUbbHv9h/TSt2OqOdwSztMGOnO8cbytFPoLPgxUNghRTcjxJMUQMtDqiQj9xm/3ACyh
         NoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820558; x=1701425358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7d06b6G7ORlrNQJU6TvzYJsppMO/COUWuckfBOPugA=;
        b=Y9fZm/x9fekSgh1FE3/kA/YvNRVDwpO26XMD0QURDFW+Jqt/z2fQWOv4NPHnGee1P8
         MmC/WrMp+vzZYt4uW4dqp2C3uT3LQjjF8nG9MOeR3nar2DCYVbbWje4yCNFgJGJWIl3C
         o2MotGSUpy8pc4LS/0PG02G8cJtuVVAh2a1coQ43cCeq9/8D4OPUGnVleU/9s/6ZVTuC
         3oUsAXvtf/DgKrt1p2kxLvjG20jimN4AvUziBX4+UUbr6b+Vyazx1ThwWON4zuB5AHmD
         yGJZZco1g3FTkptVnaceIFjRAmtSFYwh0OluN9A2r94oazdiWubpECDlUq65GYxCVHkX
         gqIQ==
X-Gm-Message-State: AOJu0YwBu6wphg8k1OK7rZS7FkX8hHJN10hkD0qqWERTqMBGxKS03/Nz
	opUldVKhFO4pIccP7g5W9n0QR5vWGeB4eXJ9NnuCuA==
X-Google-Smtp-Source: AGHT+IFZDOwR7JExk+WTPrKofyiSPhESOa5Ty4+gyeA49vmY5GeURfJ5lGSFWgjatvyDMJJIGKpHsSimm4ZZ6CjLiag=
X-Received: by 2002:a0d:fa01:0:b0:5c5:b0f7:1087 with SMTP id
 k1-20020a0dfa01000000b005c5b0f71087mr1855847ywf.40.1700820558337; Fri, 24 Nov
 2023 02:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com> <ZVzy227f3cIiTmtE@smile.fi.intel.com>
In-Reply-To: <ZVzy227f3cIiTmtE@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:09:07 +0100
Message-ID: <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 7:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:

> > The pin control header provides struct pingroup and PINCTRL_PINGROUP() =
macro.
> > Utilize them instead of open coded variants in the driver.
>
> Linus, I dunno if you are going to apply this sooner (assuming Jonathan i=
s okay
> with the change), but I have a bigger pending series where this will be a
> prerequisite. So, when I will be ready and if it's not being applied (yet=
),
> I'll include it into the bigger series as well.

No answer from Jonathan but I just applied another Nuvoton patch from
Tomer, so maybe Tomer can look at/test this patch?

Yours,
Linus Walleij

