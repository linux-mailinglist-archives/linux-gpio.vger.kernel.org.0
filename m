Return-Path: <linux-gpio+bounces-29067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A61C852E6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 14:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1884F4E1E72
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 13:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0785A322C81;
	Tue, 25 Nov 2025 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzTrqQcd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DCD320CC3
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764077390; cv=none; b=TJqOQBbv2XE4RKkebhTXCbhyZw27WvQzZCPs0wupKZfFtiyrzIEntyD65+Ul1tFIlJq4h6EeYQuoPy+6yOYsZktZicn10ja9+MBteJOQKIWr/Qi3R1K+H8/ivRYZwL4CDeBYykYQB2pun+4hWk/N2STSdhddHTBEQLFwdqOqhpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764077390; c=relaxed/simple;
	bh=U1u7advyTA2QhW4vNnfPxRAokN2UT/sybflqwatfzTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmbC48/zt/QkDvlHqIROapZoCKcbSrjw9608+8zJtVvbWq5RCru53GBwZgUUyOWSZ8E9TEvw27Ldg6X1mLIhKxYzpHlqvgVwvXDV7qtIPCHUbRWipojVoz8U+1Jm0rJLNaNMfEddp1kd8ZpHCmz84V65jtQiZIP9TJsZ07OAn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzTrqQcd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAF7C19421
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764077390;
	bh=U1u7advyTA2QhW4vNnfPxRAokN2UT/sybflqwatfzTE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XzTrqQcd4loHALOv0mmCEGkB/3+etNm131pGc8DYbRflcavu7OOqu0wNADDIDmR3M
	 EafYpDD79y7t/IehvpV9SMBbk8bygHtAwqC10Di7jlzIvTEwN4/ofDFnzCK/0DE6wA
	 kqQuWTwr9s9KOQrGr/fxXuNTl5CoD22ifzAWKzAozsLD+gZ+5S2fOgKauYEuZUPjR8
	 lSCRl3jun9y63fCDpjBDKt9TicRSxrJ0QXJ/iTeegE7jNV7wF9SUCTwYCuDm2Xxbrc
	 DONJaFmq+gqTkwqY5Wqx35gI2gm4cR/v8OlhT0axdLn+kfNm1LyWCi114nqMQF+t1T
	 vjyOTuu2/JKxA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-787da30c53dso53327567b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 05:29:50 -0800 (PST)
X-Gm-Message-State: AOJu0Yws7y0hBdUeTdUE5cOmXAwUKGKdgP/5QYxlYMA9RvMpeTC7G8Ub
	R+XPkWd9Icl/JqproIghz0w7HbmAex8+PFmJ9XqgcxfexUXLVrp4QeKebwYHZYGWkaHJGU0JIR5
	2xB5BuRg1ClH6soheIoK+4rWORBrCTuk=
X-Google-Smtp-Source: AGHT+IEHKH1qTGLWQ+Ee2rn0XFglHMDrQcVE87MGoExpmIAteyEdJByIqUuyTdKp05VFG7Y/X3/RtsTfb0DPbNJszKU=
X-Received: by 2002:a05:690c:2701:b0:784:991e:4913 with SMTP id
 00721157ae682-78a8b478de5mr118412317b3.13.1764077389679; Tue, 25 Nov 2025
 05:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSWOPtM70PtydVLg@black.igk.intel.com>
In-Reply-To: <aSWOPtM70PtydVLg@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 14:29:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUQEnL4Ho4StdH9vwsqELum6UydEjKLSBV3BLpTFbXzA@mail.gmail.com>
X-Gm-Features: AWmQ_bl0qD4bxsyD7yacJ5Cv5l1QlmC1szy_CdLWQkJRBd-7sURGeaQ8HX8t1a4
Message-ID: <CAD++jLkUQEnL4Ho4StdH9vwsqELum6UydEjKLSBV3BLpTFbXzA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.19-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 12:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A medium clean up of the Intel pin control drivers. Has been for a few we=
eks
> in Linux Next w.o. any problem reported. Please, pull for v6.19-rc1.

Pulled in!

Thanks for taking care of this Andy!

Yours,
Linus Walleij

