Return-Path: <linux-gpio+bounces-30378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640ED0C87E
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1657530052DD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247EA339B3B;
	Fri,  9 Jan 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipMCKmO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE726E71E
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768001048; cv=none; b=mHDjY+kh1dZzr/B/dPXpgfmEmHIiKfsxedIM5LTAdZw6OFd+KPSEnTovB622xUUmrWyUr1a+WqxSD947IiqBu/D+gLCRqQTysaSxGM1O01H7ywZVLqx2oTbrx4w80FGJmqJAY558HXZJyo9VWVCsvjPiRjukZIemqaTPT0ZEMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768001048; c=relaxed/simple;
	bh=KbRMW2tlh5yM2YZSLOI+7qeRZ1cj3IXXpoFNsQMhquI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlYZUuPwQuAagnSDw406eyCBawIsllgZX7C/KcZ95ZqOeaCyTupSPt8SiMi9iylOSh6SuIFdu9erOKNmNMQzZp+QeqRmN2Iu97CWL38l80oxtTUz8cbqqZAwP4egijJlz6t3vqirhGyIL+Uu5Kx2Jo8ln4M+HNp5QchoYrcFuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipMCKmO0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850A1C4CEF1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768001048;
	bh=KbRMW2tlh5yM2YZSLOI+7qeRZ1cj3IXXpoFNsQMhquI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ipMCKmO0cq9TF93igX4c9EqxW4AKB86GWxjVD0MfFTzAOkkGDYcnEAY7woUvlv0Uq
	 fwFKd2dlQF2DvqVru+EnXA2fvC1FEzdsjT/DcBcNqgeOOqBfJ5x/tt+LGTibop35f0
	 oH2YDXGhwBHdORyTVlERpU5U5y2zQ6U6A7XkVkbVzsd/O6h7aBjucKQCznjSHpq6gZ
	 700ilJlodxTxZDWFFenZ7O9LvgABFNLM1BJY1mppqhhaeVdkMRm9j8g54Xfuqgati+
	 uXioMYyToqztZziAnVUC74sUGxxttv67g4KZbMNe8XFcbQpuazL3pbL1W/Qadi/kA1
	 XR7+5fH0KbGRg==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64472c71fc0so4999080d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 15:24:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXudamvpnhJkmWsFKHXropSE3OMueGMEiIUwBr+zKYHN8j/66hWnkPBdiO1IgcajfzHAU/MbZQZoqhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXb9+zovjS/03p4lLX4q8NYKfa1wySb3fhiJKJf8Szu1IcTJ1l
	UUTDrvoZrPL46jCtvCiH6SIIpTV2rEFznBGX+v3RDMN/Kepe1FIyLgNa9pavXltLXmk2CatOzoC
	Bw5fEiENuwK1l66iNHlJE/veFiM4OZdE=
X-Google-Smtp-Source: AGHT+IE3ZLe2+fYKLuBshK8VGQB4TqN7In8Qtzlfq4viOJYy7f1k7cHLRC9o90lqrmR/9dhh26x+5xl8NDdn8X4trzg=
X-Received: by 2002:a05:690e:12c1:b0:644:71ca:e612 with SMTP id
 956f58d0204a3-64716c5c42fmr9284347d50.54.1768001047921; Fri, 09 Jan 2026
 15:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com> <DFK76D6YF9HK.GCKCRXUU7ZZT@kernel.org>
In-Reply-To: <DFK76D6YF9HK.GCKCRXUU7ZZT@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jL=iZE8uqcDOFSP0GWUCDzSphdQs1h4H_Vt7cKRLiLM7+A@mail.gmail.com>
X-Gm-Features: AZwV_QhsJCimQ5GyDvKjrJQ_E5xSnrLDxMpmaFm87Y_zjh58eBVVCJZ9r5WyNho
Message-ID: <CAD++jL=iZE8uqcDOFSP0GWUCDzSphdQs1h4H_Vt7cKRLiLM7+A@mail.gmail.com>
Subject: Re: [PATCH] driver core: make pinctrl_bind_pins() private
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 5:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
> On Thu Jan 8, 2026 at 1:52 PM CET, Bartosz Golaszewski wrote:

> > pinctrl_bind_pins() is only used by driver core (as it should). Move it
> > out of the public header into base.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
>
> Should this go through the driver-core or pinctrl tree?

pinctrl, but I wanna give Greg a few days to react first.

Yours,
Linus Walleij

