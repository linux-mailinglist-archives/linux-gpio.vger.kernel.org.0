Return-Path: <linux-gpio+bounces-104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 212097EB111
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA9D1C209C7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CCB405C7;
	Tue, 14 Nov 2023 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCjSILGn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAA156E0
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:44:22 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3893132
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:44:21 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a822f96aedso66768627b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699969461; x=1700574261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ4f8JZYYq7GZ1QgPyk5lUL7VvIanUd5vXpIis2TnC8=;
        b=dCjSILGnU+V/T1OjhO/CcM5YSJqb7WRH7oPA9v/HFPh9+TcfheqWDVDHebvx+n4jzL
         BZKxN6Sze4rdEqUSN81C/d8CPLy5gYINJ6yaLs/nNdM28H0kRnTdWVaKgIZoYjNYgEcz
         5Oi94cv6kvoUkPfxM0j2HwdqvyHDn8CzZ6IpLbsfj7+FPCFMdXiZuERBifQCflSeENM6
         07ej1OzZ9uM1A8lx6c0FUXcqX51exmecBQAwry3spzT9RC2zwUr1N/PzphSS67ZCh5Uh
         qZ9nqnAGl1mU5ay4Z78lFv6d/F7GgB+y1iZdCRf7e/cyUuZ4EtZlFY/tWJdWQ1Z1H6Hy
         8ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969461; x=1700574261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ4f8JZYYq7GZ1QgPyk5lUL7VvIanUd5vXpIis2TnC8=;
        b=nuDY3igvW7Qo5kYbUfSwpYES7SwHD7AkElC0/XtJvtwJ9T/LR4vhZ6j3P9bs1fQgeJ
         RFEHAxbslJAyADPYcqpdzWrW/n4ck+xKgG6OjjL+p4RUp9k8VaToIFqxfgZKyAs/qWTi
         birB6NQQlOTM/IIxTxCU/5apw4seBlkQQCpzmdh9plg5FWc1vhB7BTbYz3JDZ+Cfk7HP
         uNKqBEXygqpbJ1QKoQiFB88j7cn/hFYzLI82029QYm0rUAQiMkAozVH4ZbgRIkpnAZ/w
         y0V31xDHFKZ2jHGWTkqqyZwWJwXWbnO7jgk1r1MwAZ0tvFfUZXNV4JKV01Nq8/WHe9hL
         8EDQ==
X-Gm-Message-State: AOJu0YwjKMeNNfWfNhKMfp3Cs0DiUphfrvmbTxkybr1qwtloVHZEaG9t
	Omer6W6NfCix74mXyyP6fJifTMbjCJYBDbTRHbWziw==
X-Google-Smtp-Source: AGHT+IGAINCOpkGsPc3uvs2ZEpWeFpMvfdVCBFYuVnESqW6reSzaT/65UX8qv1O7fFgmj6CDl0KATtYMkOA28AXL00I=
X-Received: by 2002:a81:7142:0:b0:583:a3ab:b950 with SMTP id
 m63-20020a817142000000b00583a3abb950mr8261177ywc.50.1699969461031; Tue, 14
 Nov 2023 05:44:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107141044.24058-1-clin@suse.com>
In-Reply-To: <20231107141044.24058-1-clin@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:44:09 +0100
Message-ID: <CACRpkdaPNxRyJDtbEu4DB8SikMtBmr8cOJxOuKPUi6GwcoQtCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: Avoid possible string truncation
To: Chester Lin <clin@suse.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 3:10=E2=80=AFPM Chester Lin <clin@suse.com> wrote:

> With "W=3D1" and "-Wformat-truncation" build options, the kernel test rob=
ot
> found a possible string truncation warning in pinctrl-s32cc.c, which uses
> an 8-byte char array to hold a memory region name "map%u". Since the
> maximum number of digits that a u32 value can present is 10, and the "map=
"
> string occupies 3 bytes with a termination '\0', which means the rest 4
> bytes cannot fully present the integer "X" that exceeds 4 digits.
>
> Here we check if the number >=3D 10000, which is the lowest value that
> contains more than 4 digits.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311030159.iyUGjNGF-lkp@i=
ntel.com/
> Signed-off-by: Chester Lin <clin@suse.com>

Thanks for fixing this!
Patch applied for fixes.

Yours,
Linus Walleij

