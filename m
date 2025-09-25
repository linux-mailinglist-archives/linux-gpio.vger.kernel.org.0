Return-Path: <linux-gpio+bounces-26572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E8B9DFAA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 10:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78A5B168EA5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 08:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDB426CE2E;
	Thu, 25 Sep 2025 08:09:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306926A1B5
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787766; cv=none; b=gpkXsJuamRgpp78zxahORXMBMvJ60Ge7EVmFOmmgEDtzeW35Hi0h3JNAWqbzcz0bA0LGEO9i/SGsucHmPXEViBzIz5K3wB+f81dApSjxE1qDPAeLYecllLibQusNy3BM/zdxG/zRZqYd8+Qp/TGEi1gNcsfFxQkTX4ltaF4nn1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787766; c=relaxed/simple;
	bh=NdLPCWYGKs4Nnl4f/TPtkkAAU2xiHmYr81MGuS2MbZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LV2vsOJraM9RgNCoM9qVVh19gHGWISKo3ORxu4e42OmSbxQTrO7AJ5aLkiXpoFjlYB2CPhtnA3Z1Bqcdy/vX73N6PoMBuJeaZvPefRffryNfp4DVNM3YcHD5XnYwlKEV88vNGPsogtSo5s80HH8WU7bndl1qq/XiocSzlpCAVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445806e03cso8938325ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 01:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787764; x=1759392564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUcMlfE8b4AOAO2p/aFN45tB3uALYO0TSoBHD4chZzo=;
        b=KkJKIwvRvuuYkJI2uyGnn/lcWVGew5fxDfKq/VIWkwwoXM/6fPu9JVeppg/ppwRJJf
         leRWCIrIJpCgzwi59KP7T69Gcr6UjoBWXYIoQrWeEtSdet4/ID0iHpZIMjW2K4nzrWlF
         lPRsi/dF3TOEuaykbQWwKtlq64Zc+naMrL6csBN4lKKdBeM/ocnI+yRS/5CsdEfVUQq2
         ngiAlKlPArYSCHtDIyAC98ewOj7LrmYrPyIAk5G3OwFM16WOAV9QPMw7ox8kOXgXNxbU
         amHbLaOgzuuNqP15QctbpBn9ntr/GKOqCf1ik+iqjcVKaJFh3ZFazAl9JuUav/QygiUr
         LikQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoINfk2c9lbDvMRf60SMVWyrZ3N/DmJPzedP/arIF40XEf4ntyuItdm92iJZ5Tykw57CYvjcBoX027@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOWbC/oeKWYmridEugmzvYWTxQx1xTHIh/mieHYBflKqMrxLk
	9hNZODuz4K9QHQHUSEEyp/l/Jq8MndEaIP4kWx/L18zEBDDaNEQhCMtyvK8HTdKE
X-Gm-Gg: ASbGncu7w/qvhPopxBOr/J1uzv2HVHXXo4OsZ5ayMIGTLl5KhCCTgvrg3mtJnGHtn/g
	/v5ZgyIeKw8nfhezib34By9AHuJ5Yzpecyl7LCPGY6/uOyaR0luyMeBd2wzF2frJ49qS6dUT33m
	94ZeF7bzLlWDtpuwnz+NsfM0eGxxv+hmdKRt+jRCQA/spkfa28jwlnvmqP6pmOWgxBT1vu+fGu3
	venwDqu5WOTZPqf+17FSj7vwlt/Ro6fQaqlU2DNB62hn3bCOPD2v+cguTJxjFCYdPA+esMdEbgg
	xfoIpKB+D10taFffh0cqHk+He+PL6sXAlz17/77SPSoSvDqIxU9ozISs9EjWJmkEZgmov7P15J0
	7JsvUufmmkNKTXg94b1nXs+Li3dKj8W8LdLZnBTyH+ol0kLN+mHSLMuWnVb9E
X-Google-Smtp-Source: AGHT+IGwYfMRllcUftSZiNu6jkfnidaN4TVtldbGOSUTwWbOZbteE9An6nf8bgjPxIkQ1CPzU6miPg==
X-Received: by 2002:a17:903:2343:b0:275:1833:96e5 with SMTP id d9443c01a7336-27ed49d2ca5mr29928365ad.24.1758787764450;
        Thu, 25 Sep 2025 01:09:24 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf6e7sm16369205ad.2.2025.09.25.01.09.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:09:24 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3306d93e562so777020a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 01:09:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq+HSWZjdZv/Nnqn8xznPykpScnzsEu2Wouuwc+tpaMHg6RwPxzmZDy01KHTAW5gQl3NhR50nHEN+N@vger.kernel.org
X-Received: by 2002:a05:6122:90f:b0:542:2912:664f with SMTP id
 71dfb90a1353d-54bea2f2d56mr980779e0c.10.1758787332548; Thu, 25 Sep 2025
 01:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 10:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
X-Gm-Features: AS18NWCyYwXSHgwWU9cjWnhwFzyaiaKh315kbRG5kwTsoewxQN_WDT2npG3qPmE
Message-ID: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The (typeof(foo)) construct is unusual in the kernel, use a more typi=
cal
> > > syntax by explicitly spelling out the type.
> >
> > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> > use more common syntax for compound literals") in pinctrl/for-next
> >
> > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-=
v1-13-9f723dc3524a@linaro.org/

This is the origin link to the patch (by you) that started the discussion.

> >
> > Looks like you (slightly) missed your target. The correct link is:
> >
> >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com

This is the link to the comment (by Andy) that questioned the construct.

> >
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

I know ;-)

Given the "Suggested-by: Andy", shouldn't the link point to the email
with the actual suggestion?

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

