Return-Path: <linux-gpio+bounces-30476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F80D17F7E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71F3E30259C1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA4238FEE1;
	Tue, 13 Jan 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVk21W+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320838B7B3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299476; cv=none; b=dHw1IWbiBde5iJ9a7K/OTnE/JknaDZMTmZlNcBLyJhCsckOJIALYSjUJ+67633G2W02dgoPRG4otNgOj/tMLOjL0Cbh40DfcSi0ZPqjit5qvczaGUq0zjzni70DFkIJJtJZgDnZF+cJc55j/d1FWv4JD11ugct6aBlMP/OCUTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299476; c=relaxed/simple;
	bh=R7HcHsozxlVU94ApZPND1fhlC0rs5+QjqeNw57mSFxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nf89lCCj4UwJCju3C025MVI/m+MqHslgwbjenCGzN9i6vEdLerBBqciz8gYVq4RWnR0eefNqIveWV6/ARcRYP0UAw0WOB3pU1DUMMvibAAay+aEEabZRUyg0rotPbpwFq36mzsgwDfA1EunRgz6VwR/OEDkbaqsOgCh11+YjJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVk21W+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4643C19422
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299475;
	bh=R7HcHsozxlVU94ApZPND1fhlC0rs5+QjqeNw57mSFxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NVk21W+hfLLljIfSUUfUWtmnSoCevnMMzZCFjMKTRHCUEec//GSUkVDEjTmdBR/Oy
	 0lmDKotTQ2xPV/0LH54brVxQx06IxfhfBQ2nE5Til7LeIT7ffXD6d9n2X44zJ/TTdL
	 W8D+dQ2UVT6P5xUOxfT5tM/udZd1+mIjZhOYE8JlqabEnCUkrVOvXpk7PtHJlyXlWN
	 DLFDx4cQhVeXLtXa8RgY3oe83PH/BF3iRmfO41WS4/p63c8RPCQaWZdQEHN3W0NKvK
	 9jrb3Bw0nVBdAN5HV9Oz3DGYta3g0YEmHT6UrvrJF8u1Em3aLeevivDQNj3jCf37TL
	 wr+eV76w9D/JQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78f89501423so67444187b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 02:17:55 -0800 (PST)
X-Gm-Message-State: AOJu0YyJQX+I/ej8wUv7ISEGWmPJoiDuoBu4qS00Pp1h3Z/+FTdB+KGJ
	YcS7X01HsKKBH1+LeXIxeqTeYjsnQaX6gji5Rlcsy2L9cv0NvOiR99Zb/yROYEg/t3Xk4fVOHo2
	q5XYH9xK+jTxENVLYl2ioBqsB2YbYGpM=
X-Google-Smtp-Source: AGHT+IH3Z5hPMGzbVCNvGSYYiJH4vhabbl99+8ByOevjiTpx/84RCCdo6U3GIJq/XuWdAvOHz+jP6+6XmFHzgzCwIK4=
X-Received: by 2002:a05:690e:1511:b0:643:6d7:ff9d with SMTP id
 956f58d0204a3-648f6245afbmr2036652d50.18.1768299475340; Tue, 13 Jan 2026
 02:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113100913.136777-1-andriy.shevchenko@linux.intel.com> <20260113100913.136777-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260113100913.136777-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Jan 2026 11:17:44 +0100
X-Gmail-Original-Message-ID: <CAD++jL=LE95QNK+JOxki_jO-jbM7KYFcCJyNFj5qFwT1YP=A1Q@mail.gmail.com>
X-Gm-Features: AZwV_Qg2yzkbuVf_aIF_Fwsm1NOJpbqCHKgf9Zs6R63ds8ey-vLl-nHbiEI1Dno
Message-ID: <CAD++jL=LE95QNK+JOxki_jO-jbM7KYFcCJyNFj5qFwT1YP=A1Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: pca9570: use lock guards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:09=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Shrink the code by a couple lines and improve lock management by using
> lock guards from cleanup.h.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

