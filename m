Return-Path: <linux-gpio+bounces-30357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07DD0AA53
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2C833054365
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC322BD587;
	Fri,  9 Jan 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEC7I3Sh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A9280A29
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969147; cv=none; b=M+y5ffzBoA5VehKkUjm45upJs1wVzRqgsoY5oxqAyBxcp7ykiTHE+nf8/qiZwc6vtuiAq6YrYMuA1aMPYCUDrpk0dJZ+Ghbd79lArgLzLOQEvKcNInYpDN/MGDCgZIF/nrvHskuyoS0lYxsWbWhZh1QW+idKrV3EglPG6fXO6f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969147; c=relaxed/simple;
	bh=vtDFUmm86DN4JnzuDFq2CcMQ3VGpEUtqZEX5tbHdvFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWqq4GQGUEiDrwIXhccDBkWm0VbcUsPVyLl+MrPXX7w7pvt3iUvbk4vxr+gXdTL7EjyYT0QNGAT9FoN7FIcSrYH9OeLQ4Yd3E+qO8DhrgcxNmVTG5pC1o/sdK2iB8ZIEiEeXce26froDzFq3q2ZMh1YKrVTlLDbxN3YsWenJ0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEC7I3Sh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914C9C4AF0B
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767969146;
	bh=vtDFUmm86DN4JnzuDFq2CcMQ3VGpEUtqZEX5tbHdvFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gEC7I3ShIwTYYd358GsAhNx5+uwxTPleYPVdpbf5EJD9wjn/BRtlsA6TArb6omGrC
	 nZ+enRRVCT8SPmrhUeC3AX2oIwgEEEhIuhMtYGfnEBTQvD5jV1RxiJ/qCkAYuaOhiQ
	 qxIEKAnCOXRnRKFmbbcUXOSdZ2T4WzGxbESZex+uKopabFc7guIilzyyNBSzX98Vpn
	 EJreVAQJAtYOU4MOwdU/givEhOxOqBzam4AkJx9Wj5HjA98H6dUmOZLOIm/Z2/F9yU
	 tF7HIbPjYIWJ5YuK5b+VaEGUU/KCClFUWo34D4YmwrnZw14lOlIRkLIS1VhZDjmQy0
	 z8fUTviqSGOVw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78e7ba9fc29so47834487b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 06:32:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLHHWHYNS4QidYUlQx2pNaKXTW/J5p7FEcMhupWjIdcTBp8yxemkI7tCvS0PKndTeIPEHYgt+WrqxO@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSbGkInSVe5VCw62e/aWSENfZguB4hwbHHJPbetWYEYFn37zk
	4XyqQeZV5vHpzKwMnrRxYoCoxsssEogtbIH9nHAMwVny1Z/y/ctSrbHpTiFKKUmR3VmIDW/Fibn
	y21uJMIvupMOHqCRDP5j1tCWnfDx+QbQ=
X-Google-Smtp-Source: AGHT+IEUT7qG8gBV/OUiHqfQX30EJn7BlwZniv2XIDBSHt6gRUPb1/U8M3FdZBR6ssVKE7VpqSaGaujPEyfQHIFxerA=
X-Received: by 2002:a05:690e:1b55:b0:63f:9db5:3713 with SMTP id
 956f58d0204a3-64716c603damr6893744d50.55.1767969145978; Fri, 09 Jan 2026
 06:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 15:32:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLmVxFq1Dc6T_aR4C3dpcY9cO32jjWj98G_z1U4i0mVqXA@mail.gmail.com>
X-Gm-Features: AZwV_QiKQqIlfZJuYbIQzkCakXIBF-HiDLXmV1n2vhId09QBuzP6tvRmzF5PcIg
Message-ID: <CAD++jLmVxFq1Dc6T_aR4C3dpcY9cO32jjWj98G_z1U4i0mVqXA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:08=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even for fixed-direction controllers.
>
> GPIO core will even emit a warning if the callback is missing, when
> users try to read the direction of a pin.
>
> Implement .get_direction() for gpio-davinci.
>
> Reported-by: Michael Walle <mwalle@kernel.org>
> Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org=
/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

