Return-Path: <linux-gpio+bounces-29913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80BCDEE08
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 19:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4389A3007954
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 18:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25129239E81;
	Fri, 26 Dec 2025 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0s+bXAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA21448E0
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 18:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772908; cv=none; b=Hrkm0C/I6ZVPGDgNYJw+urJfbq/F38yNZdtZzzdWWMKHCRGtQmX5wZJ5KshGAKVI5RJvqhikrXP8Yl/YKE6brDEeLUxrDS6QbUpbFDLfZ7JJryhST7Gld95voX316+sdjtUBw+eJJnMqN0EKnbkFvIUkiwwub4lh+YaQ3zIuPDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772908; c=relaxed/simple;
	bh=NX6RIM5/8L8qFW+YvFD3wCwe9QDXgdbVg5kkPCGn5CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6c6n6FXtrSP1kJgovqsj3RmYdlBzR3wl+10m+kAtI6JVm0C7dTmRkeWbOO+78GfLDy4iEbA03jnKe1NYBaJGpYcwYcIrrkjiu0vJuyJgcdXvJYldWxa8v0Qn0/d5VCffRFqIpdtaxrCrHBUXwTqG/VPFRjw03GXNdi23co7rCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0s+bXAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162AEC19422
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766772907;
	bh=NX6RIM5/8L8qFW+YvFD3wCwe9QDXgdbVg5kkPCGn5CA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N0s+bXAGNxzxRKjv6pFkLvYrSjV9ypoHkicrHxazdV+q4sKLpR9pHK13MxfltzC50
	 +/pcZql6nTDxImg/U1Yu2IQcrmy61tCJa8jPe/bLRYL/F3+VEqRdQvfqo9R1kmHH5Q
	 KmXW3bBOzNl3CXeugufCjTWx9k3N4JEAFtBqVMVHHor6a7Tsysvu09ck/O357aR/I+
	 o6WTA+A6LDtpYnui6+YYVIT62Nzw2pEj2Iy+ERdWyzut66C1K6wIOz/q45SaVzF4Lz
	 3FgmSkDDKVGRRdkdCQvOJo28xiKki/8aA5cQBK7jfnHOZBHMBB5ZWDuCHnC1Of8DgO
	 OMnNfs/XHJ1Zw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6467c5acb7dso3640757d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 10:15:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHIcRGtPhACiwRIkEh2AhDq5MHJVMEplfqbbBOOdPEvVIVlwnA5j0t01T604x9OIwODv/lCOJ7XzMw@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZR5YzBeY2yiJO9xC5yxIEtp6p6XPCckACdgHWN3WHdtWqMMW
	qZP8ayYUyIqRBE/9YTi7LThO+G/S6JUgu3IWPqhh+RLm6oQp/8t9YB98XQrxcqiaMfH8qjs9kgR
	fmC801wQQzvjrcfTO9QSNUVxQ5zSpH20=
X-Google-Smtp-Source: AGHT+IFL/eFQTSATZ2Bf61DWomlLriB5LN0ipSM+U2txIu61j0knFv4Qg7uMaWLBJDkrxYOknRLWJaCqm2IE7jOc1mY=
X-Received: by 2002:a05:690e:dc4:b0:644:60d9:7531 with SMTP id
 956f58d0204a3-6466a8dec8emr16296223d50.87.1766772906452; Fri, 26 Dec 2025
 10:15:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209100217.167581-1-buaajxlj@163.com>
In-Reply-To: <20251209100217.167581-1-buaajxlj@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 19:14:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHWkmOm9nNbchNNoWG=TYPs3nZmB-fUEwb6fuspiTd7A@mail.gmail.com>
X-Gm-Features: AQt7F2rA_AcCIAiUWMktXnkp-AqA6ONVXV1t7NBRvWnGYZATyRI-vw1nTZCoxHY
Message-ID: <CAD++jLmHWkmOm9nNbchNNoWG=TYPs3nZmB-fUEwb6fuspiTd7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: make devm allocations safer and
 clearer in mtk_eint_do_init()
To: Liang Jie <buaajxlj@163.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, liangjie@lixiang.com, 
	fanggeng <fanggeng@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 11:03=E2=80=AFAM Liang Jie <buaajxlj@163.com> wrote:

> From: Liang Jie <liangjie@lixiang.com>
>
> mtk_eint_do_init() allocates several pointer arrays which are then
> populated in a per-instance loop and freed on error. The arrays are
> currently allocated with devm_kmalloc(), so their entries are left
> uninitialised until the per-instance allocations succeed.
>
> On a failure in the middle of the loop, the error path iterates over
> the full nbase range and calls devm_kfree() on each element. For
> indices which were never initialised, the corresponding array entries
> contain stack garbage. If any of those happen to be non-zero,
> devm_kfree() will pass them to devres_destroy(), which will WARN
> because there is no matching devm_kmalloc() resource for such bogus
> pointers.
>
> Improve the robustness and readability by:
>
>   - Using devm_kcalloc() for the pointer arrays so that all entries
>     start as NULL, ensuring that only genuinely initialised elements
>     may be freed and preventing spurious WARN_ON()s in the error path.
>   - Switching the allocations to sizeof(*ptr) / sizeof(**ptr) forms,
>     avoiding hard-coded element types and making the code more resilient
>     to future type changes.
>   - Dropping the redundant NULL checks before devm_kfree(), as
>     devm_kfree() safely handles NULL pointers.
>
> The functional behaviour in the successful initialisation path remains
> unchanged, while the error handling becomes simpler and less
> error-prone.
>
> Reviewed-by: fanggeng <fanggeng@lixiang.com>
> Signed-off-by: Liang Jie <liangjie@lixiang.com>

This looks reasonable to me, so patch applied.

Yours,
Linus Walleij

