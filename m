Return-Path: <linux-gpio+bounces-29871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6423CDBA95
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 09:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAF6E3023916
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 08:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CB2283FE2;
	Wed, 24 Dec 2025 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgRdQHJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CC823DD
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564485; cv=none; b=J7ick14P6XiSMR8B/R69JXn/SpyHL6ZmE77TpyD07IGhVB+MqT/vayftaqtOSqto0MWmDDfpD9orFOsVXjdu1TznAkxSjjqCXmB0C0GT5QkD8TW0tPwKAyEpPr4moRzhBXnqtZjexZVeBM3gN3tFC+OzXBfzxv6IF88i8vFrvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564485; c=relaxed/simple;
	bh=5qi7+urb8ApQ1OoGPL7JlNcsZZ2cJN2bcK262Rg4/P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i79UTqGgcgac5elti5/nvRt9zgUkPy77PcWdpmWIPZt4iehMQH1kjyMwrcdlkUXzfQXNbdoHC/BbwZVrph/HK2r/EeLfEhDySYf98hjgpCyqMVrrH0V7M+Z4yuZCb40RhUs9YJChkGc786DgsOAf2BBZltJ3WBAJ8NVMXCUW51M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgRdQHJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98970C19421
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766564484;
	bh=5qi7+urb8ApQ1OoGPL7JlNcsZZ2cJN2bcK262Rg4/P4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CgRdQHJGgZ65DKJ55DvNTz+vTOMH/qgoP/qd5g/WuCtMwMjPYwEiOfujB/bw4CIyY
	 MkhqDwJpYHbTBXkewVfMQiGt/+wevx9mC2hnbTTNJ7gGuFK8KHBDznH/NPcTEN1c/K
	 0UKu8dszxCZCliP25uPB2/uNSE2n2izMtuHja8nRzzeY+YQqVHSngeTvEEEYXWRvOi
	 IvfF/OaMuA9Q/jiirsIut6F66CA87mSN2LFptK00XjIak6elW4MJRWB+BlN67GmuWs
	 pImKYDdsuSXq/skbMv3bJfd5s5O9cGSc8q2uuCYd+OOgqfJnQvJB2yff0kyuT9Hgop
	 HybYKvW5cq7FQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595819064cdso9258018e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 00:21:24 -0800 (PST)
X-Gm-Message-State: AOJu0YzcSanXgINVu07twBv7/URTuV7tTBmxp1aumlYXQrgOyfIEHQye
	6kN4ne0vCgyHxfjdVW7aBt925kqolgswDW/+PTew7YhQEfy5Rb20clS7qrJ3GcvVo26tTpcEY0h
	TFj4UF5qY06tJ1AdLM7waUmY87rQH4k47CC2cFbum4g==
X-Google-Smtp-Source: AGHT+IFJXSgCq2nEoz3yzgnJVtdhWVjm8IM4xbhdBekEEGhLC2QxYcY4UMzuwv7F5HZ9lIwkBetmK/3CIGanRxrN2xA=
X-Received: by 2002:a05:6512:3f26:b0:598:eb5f:10c0 with SMTP id
 2adb3069b0e04-59a17d64274mr5513279e87.19.1766564483230; Wed, 24 Dec 2025
 00:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223084952.1847489-1-pawel.narewski@nokia.com>
In-Reply-To: <20251223084952.1847489-1-pawel.narewski@nokia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 24 Dec 2025 09:21:09 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdx4k-wqDyk45t8QgTr-3ihueLzYo-prDHBdX9mQhnihg@mail.gmail.com>
X-Gm-Features: AQt7F2qZjy7waWkQ9-Rd-8Y7tDtLwW_xjSSXKz7ssMqqwjRAj5vbL2seDTmesm4
Message-ID: <CAMRc=Mdx4k-wqDyk45t8QgTr-3ihueLzYo-prDHBdX9mQhnihg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix race condition for gdev->srcu
To: =?UTF-8?Q?Pawe=C5=82_Narewski?= <pawel.narewski@nokia.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, 
	Jakub Lewalski <jakub.lewalski@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 9:50=E2=80=AFAM Pawe=C5=82 Narewski <pawel.narewski=
@nokia.com> wrote:
>
> If two drivers were calling gpiochip_add_data_with_key(), one may be
> traversing the srcu-protected list in gpio_name_to_desc(), meanwhile
> other has just added its gdev in gpiodev_add_to_list_unlocked().
> This creates a non-mutexed and non-protected timeframe, when one
> instance is dereferencing and using &gdev->srcu, before the other
> has initialized it, resulting in crash:
>
> [    4.935481] Unable to handle kernel paging request at virtual address =
ffff800272bcc000
> [    4.943396] Mem abort info:
> [    4.943400]   ESR =3D 0x0000000096000005
> [    4.943403]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    4.943407]   SET =3D 0, FnV =3D 0
> [    4.943410]   EA =3D 0, S1PTW =3D 0
> [    4.943413]   FSC =3D 0x05: level 1 translation fault
> [    4.943416] Data abort info:
> [    4.943418]   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> [    4.946220]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [    4.955261]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [    4.955268] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000038e6=
c000
> [    4.961449] [ffff800272bcc000] pgd=3D0000000000000000
> [    4.969203] , p4d=3D1000000039739003
> [    4.979730] , pud=3D0000000000000000
> [    4.980210] phandle (CPU): 0x0000005e, phandle (BE): 0x5e000000 for no=
de "reset"
> [    4.991736] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> ...
> [    5.121359] pc : __srcu_read_lock+0x44/0x98
> [    5.131091] lr : gpio_name_to_desc+0x60/0x1a0
> [    5.153671] sp : ffff8000833bb430
> [    5.298440]
> [    5.298443] Call trace:
> [    5.298445]  __srcu_read_lock+0x44/0x98
> [    5.309484]  gpio_name_to_desc+0x60/0x1a0
> [    5.320692]  gpiochip_add_data_with_key+0x488/0xf00
>     5.946419] ---[ end trace 0000000000000000 ]---
>
> Move initialization code for gdev fields before it is added to
> gpio_devices, with adjacent initialization code.
> Adjust goto statements  to reflect modified order of operations
>
> Fixes: 47d8b4c1d868 ("gpio: add SRCU infrastructure to struct gpio_device=
")
> Reviewed-by: Jakub Lewalski <jakub.lewalski@nokia.com>
> Signed-off-by: Pawe=C5=82 Narewski <pawel.narewski@nokia.com>
> ---

Good catch, there's indeed an optional call to
gpiochip_set_desc_names() that can race. Though I have no idea how you
tested the fix as it can't possibly build - line_state_notifier is a
raw notifier, not blocking.

Let me send a fixed version.

Bart

