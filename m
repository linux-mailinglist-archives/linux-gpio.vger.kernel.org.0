Return-Path: <linux-gpio+bounces-1091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0114B8084FF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 10:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0F2B283BD3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411753528A;
	Thu,  7 Dec 2023 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muUcdWEd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89377133
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 01:54:48 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5cfc3a48ab2so4651497b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701942887; x=1702547687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=muUcdWEdZBQSHf5DcrG9edy4cYcAeoXc6q+aqt85J0QKd7YubFEQBeH8NDEuJ+o9cM
         PmyB58KDxa3L5atwABY4KZFsSTC8g6xrh/+jkqIpEmfhyjZKdxQS3md8TiQLi7CoI+mo
         LcLTepAFJP1Al5ljPBF0gmPGOzM2IVv2v0SdOTXzTrpl0t5IEXsIJXiGQw1WNTrdiW0+
         W9OgiHfj6yvO5v+80eAX7RqMGSbP8//Ku+aPiP2N1nr7Cp/IQufFnydKOy0+4BZLY40r
         iQDrXVSOeIIgUewAoMzhbQmA48Dpzs+HbYUAxK5Sy9CTrLSFszKyd0C9Uq1kfXNbLo4m
         e3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942887; x=1702547687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE7xYQUlzv02mponHAUbU9YxaUMHPxUWeHaAlOpaiO0=;
        b=CjD8Y2k7QcRmSymhwxNyEaMain68Y+VMkt5o/MrpFy8pzSuh3sYegoo5qbsKC7LDci
         fvhYTc5yTn+t7vmpthZ0O+ULomtWeu3S8TDScwrUMLz11utsHNSlcj61mSbnB3nUjc3W
         WEN9LqKXCKsenddJJRtNJHEwQXCR0icN0HRnYOVWhXXwWwfc4AJFaG6XT3YWjSTCE0DS
         V+kXgkoTXQyq2B2eXpzntRk91hwQfCnRO1FNeKGsdbAI+gTgpHSNcvdfDMJPw+ZCTmIx
         9El9FoKneUX7VP+JdHel0hKFZWfx9jcHZNgrRb/2m/2lIsGcwlrxAo0E+fxSrplUNYJx
         p1eA==
X-Gm-Message-State: AOJu0YymBGux01gGRACh09wkBHk5HFR+i8GWb+zHqL+dbupahMvDFvsj
	O11/2HZrJSbTFIpOVYGX3QAam9ZaP7KkBu2oHURJVg==
X-Google-Smtp-Source: AGHT+IEOjV+e4fO7tLGjEoQWjOkdeRdGdcIMPsTYSMvX6xAX0W3EEwj2XzT9z0JeD0O7EwAjfnACJWMxZ/0hDFeMo1s=
X-Received: by 2002:a81:4515:0:b0:5d4:3596:5ace with SMTP id
 s21-20020a814515000000b005d435965acemr2061763ywa.12.1701942887739; Thu, 07
 Dec 2023 01:54:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:54:58 +0100
Message-ID: <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] pinctrl: Use struct pingroup and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 5:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
> to use struct pingroup" [1]. The series has been compiled with GCC 8
> for ARM64 besides x86_64 GCC 13 and LLVM 16.
>
> Changelog to the mother series [1]:
> - added a new patch against Renesas code, so no warnings will be seen

Patches applied!

Yours,
Linus Walleij

