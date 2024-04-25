Return-Path: <linux-gpio+bounces-5852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3148B22DE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 15:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7F8286112
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B646F149C62;
	Thu, 25 Apr 2024 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f73fmtAn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FCB1494B4
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714051955; cv=none; b=eYKbzxnBO+S9KE1nuKT0RaIAKfOygq7+qhq77J4pEYUiRujNsngYwfsFpvxIomsqdH/zMrlod4Lym8k4ZnKDUvJOH+tkIBDPLxtDBCOGKONUz8M4w2NhOsMfjmrw9DPTRGWleNxUnX+gXEQyuor+Th4K9gZp6CDcP4XLJ/mDccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714051955; c=relaxed/simple;
	bh=/6eKXUAK4EgyhY5+gpkUlOuOYAyN96XyilV5/5P3pfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCWIym6OqeZ+czd3ePZI+5yig78W2xSiyDepyf9ru+6dXXzC1OuDTQy75oMAtgr9VS0/371nGXvLnrAZVsZl6q8doGbVrVQwMvyM7/doj/GMxSvrC37RlLTic+gRrQmhYE9yz6ieGzwdaDzaW207Jk9s0aPkOHYKbNWxc0w3LOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f73fmtAn; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de54c2a4145so1215075276.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714051953; x=1714656753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXCeP1z6jD1p0OdF8g8n7UYe/MRsZT6hAqrfk8EBvac=;
        b=f73fmtAntdx2huHaJefRGk6FzB6aHlHc5jOc7WNIuA6QNXT6OhVND6Rzde1Be7xOiw
         xHozyLMQBpB4iLYwNB/TkDp1iYQU3OeMnOlceJwxFB2TJdEpstVpYkA7X70OA9CyFUwo
         XPP0EPc75XJ3tb+5Cj0m5D4LvwLCw1ykMu43wjz8+D5PTQXS4y1xtoMzIGMnkoZVVMZj
         PLrzSvWC4SE+3ec3biYd12rdzLM/Q3Sgu8iPe9Iumgcz0GkiYWY3YXK6/i+Ep0PIeBJI
         Ybb+kLWDhATBjcU7sxUq7zzmgLj0M+Hn0pHiWTgfKAJzjY70mRbzw5zcNNgEIHuwgKTH
         RpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714051953; x=1714656753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXCeP1z6jD1p0OdF8g8n7UYe/MRsZT6hAqrfk8EBvac=;
        b=ZSY1SLs5QtnGYdxdh3EukPX3d/+RBTpTXOnkAIPgUUfiaqgTthCEUlusXAecpAxbu6
         dp6cs5ODJiUCIR2Z/B2YWpK49FcjGJBBccYWLHJ/U2EHpRyDDKx47ICYnF83u+ygdm3C
         4Jw5bB8vplJLY0wUOdAaMWDFG8MOUHUIDJMThsfA0wLgpNmOEZB0e524EMpZmoqw9V57
         74nRwvREl1gmrjZQemAEovGksC7DJ+UrRmwafO8f2hAnZTdku0ibfTO06y9KNi8rjF5O
         MS2ecHKstouHLNyGB/9nPNG4hqNvW8U6pa4wXlPR1++ZqTc8Qzn96PlHmwcLhzrop2nB
         /uXQ==
X-Gm-Message-State: AOJu0Yx7Ft8Civ0A9USOw5hH7Ie/wLyIOtxK/+2tnuGaVuzJhdzi6gUn
	ssTYbtBmYgdGr+PjCtJ+cVfX8YEAtT22o05ik9c9ZnEb/QfZii9Bu1EmdOkrkOLhRycZCVxb6TQ
	MR+Qt9d91o0RYw+H51FhmykINDvMbJGf2qXDR1gAPLDGopdUS
X-Google-Smtp-Source: AGHT+IG7JqjQ/+60u9ekcuuXFhCYBn1KH86nTu/vAovcQmKmmA7wUu66762JYBxWB3D9I5h3QQxq1tgAmjzyYEFZgfA=
X-Received: by 2002:a25:cece:0:b0:de5:5b9c:4451 with SMTP id
 x197-20020a25cece000000b00de55b9c4451mr5916440ybe.10.1714051952947; Thu, 25
 Apr 2024 06:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZipJDvhxihtpiCgN@black.fi.intel.com>
In-Reply-To: <ZipJDvhxihtpiCgN@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Apr 2024 15:32:20 +0200
Message-ID: <CACRpkdY0uHPeukL+F3tu+-=FEMd4fcbbei0JOiadWchjbr_aHA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.9-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 2:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A couple of GPIO mode fixes for Intel Bay Trail from Hans. This was a few=
 weeks
> in Linux Next without issues reported. Please, pull for v6.9-rcX.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/in=
tel-pinctrl-v6.9-1
>
> for you to fetch changes up to 5d10a157ebe02ac9b8abacfd529f8b045e8aa41b:

Pulled into my fixes branch and pushed out for test.
Hopefully I will send a bunch of fixes upstream tomorrow.

Yours,
Linus Walleij

