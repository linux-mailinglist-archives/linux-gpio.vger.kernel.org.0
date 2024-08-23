Return-Path: <linux-gpio+bounces-9085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42295D2FD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D003B21792
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0DA12B6C;
	Fri, 23 Aug 2024 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeVrAUHt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8173FB3B
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429724; cv=none; b=tYlbTqfsAL8UE4bYBa/vhizxPzwut3YCmxFN6OSWCkLNzOZ37TquJvBr7yJiU8F2OzdnwO5oP0agqxj/lR4u+DCeWxqIgMebbgc2gzsvREQ968JV4gTdvgyq/sylJUiUVVknAxBgDi6cA0IdFNRrmJRTlgOoxifqOrwBO5OaU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429724; c=relaxed/simple;
	bh=C5Gy3ZId6yOjmctbIVasH93MCo94aby8IKwF+9R6dBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSF9KkHtAHFAKdxi0mJrneLzRi88xEyPipi1bulJQvVz/5gAKu09lgryByu3T+dw0Mfjw3k7E0onycfA9/EDtA3y6829/ISY7JHuuCOLTh6ahe/fZr/V9WZf2hvU4FEFB2I5xGvlq0jlQ+AEH4J0nkQKVwXoY/hcRk7cmKEDCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeVrAUHt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5343617fdddso2719602e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429720; x=1725034520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5Gy3ZId6yOjmctbIVasH93MCo94aby8IKwF+9R6dBY=;
        b=zeVrAUHtYNyzCVOhCxPtOx/PFzqms4CRAYeAMWfQJUkSo7cJqHtyXh7i/oE3v+Po5x
         qpeBRPUMWnNwhkmhSW1aeq80/n5yEWDrmulqnyeceJRFkYLBtDYcgoLoQ5ZxjpJWSRaI
         tbhBmr6YJDBOXaVU8MLixHqo0vRJPk0ts1KIxgWYEz+rM1r1/f7St5Wk8HJ+9L5Il9h0
         vasVXLH1bdtnBT38s0wSeObDv805d/v9Fdpb7yQ1nRRxGGCUMJOVuYcrZg5shvT07eC8
         znK9ji7bqVeLElGXb9KY0O0livs+EljLeTA2Ddwg4xXfuhMZtEEUeBMZ79EouPI3z5WU
         ThUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429720; x=1725034520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5Gy3ZId6yOjmctbIVasH93MCo94aby8IKwF+9R6dBY=;
        b=J7XdwuLJyTJJ/STn0vU33ZA3wSGSu8nJe6gwA7yGWmvgL0IEJWgcW+A42O9oxFP7XF
         f/DbLtA+ECh/qUJjuyY4mSOFSVm2RWZ2eX+lO23KulmNeRATUx4TdBKbzADqTwWQKoy8
         IMOuUwOO5jRoM5g3Fua8Yg2MHviXOGK9AxwBfp9VAuZHvP47qCq3M4UzYtAmLspG6z54
         vns7Miy1MvBLc982+jTs3IrT1Y3dI4vKVvFcb0leMemXrZxUhCze4+QV5pfaEH12Cdfs
         zYAcFoTxdMqRzeuEeh/9JFRdxTfJTdScu+N0WANs7m771wpaUGZIwJuTdBMBz4myqLqn
         A9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUjbS05Dq1AbEt8ezB8oqmcP6nsn9RbMXkmYQgRJn065HV25bZ+DURsBGcoFuRe0+M2qLreBJQUZtTp@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMfp3lhvSdN1awOvDWop+UCUNaT8lpu7VOcWRwU81cqpG9oMH
	ppiOLkopx/w7aMwbSTXjDrFskWDxNBAQ0E7d5ogKKq2vbxnUR8WtRtoBxs4CgtRwVxbmKP0u7Cy
	ktUHl6sedM6RZJt72nXVxSXxbjZybtn+wZPtuLg==
X-Google-Smtp-Source: AGHT+IGJPc27ebiUmoATDf9yag8DXGApJ/P5FrQbUYThINyChz3wQOt+1Fq/9yZmuLv1y4j4c8GOPP45gknN67Is4t4=
X-Received: by 2002:a05:6512:68f:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-5343883d67fmr2325707e87.1.1724429720087; Fri, 23 Aug 2024
 09:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812070108.100923-1-hal.feng@starfivetech.com>
In-Reply-To: <20240812070108.100923-1-hal.feng@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:15:09 +0200
Message-ID: <CACRpkdZQGpVusAg3tZ-sNC2WENrBdLhN3SaEYFCbyx_fVmKDrA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: starfive: jh7110: Correct the level trigger
 configuration of iev register
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 9:02=E2=80=AFAM Hal Feng <hal.feng@starfivetech.com=
> wrote:

> A mistake was made in level trigger register configuration. Correct it.
>
> Fixes: 447976ab62c5 ("pinctrl: starfive: Add StarFive JH7110 sys controll=
er driver")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Patch applied for fixes!

Yours,
Linus Walleij

