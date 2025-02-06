Return-Path: <linux-gpio+bounces-15482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77CBA2B186
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB8F168CD4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB5819D8BE;
	Thu,  6 Feb 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNGfUrI2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD72239587
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867555; cv=none; b=NqwCQ12HJO4LXdo2X4YpeJ+009PGQgVQqG0gw+BUeJ5yZfGKzxYQyxVtKqbITfrq5WM66PDv18sB2aW4er2FPC2sR3Jgf/apS9FLKasIz73eEXVv1GihEXpBVsUnX+cX5UIdJUN+FPv2XExq0agLbcZcm86L/FofCKwnFD3xonI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867555; c=relaxed/simple;
	bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk7tKwEiDVcB4Bi0N3mFqpcbofBKwKbHSY4pquQ/nfv2ZdBO24bd2yPDW3C5wqZ15RnndYxWmwZiO1wq1P8luiKwSbG8gxD9HCjNDhF7CxNUNWIJm60wf0PtEOrK59x/lfwaMYxdScM7xVsQptMynqAsJvQ5iNjtewvFVYa9eDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNGfUrI2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30738a717ffso11472181fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867552; x=1739472352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=MNGfUrI2QJjLfNL7FN95W/o+6bCjZO3TuTVKS0f/h7L8vxqPtufMVpe5cVSGAuFeUC
         XrcTHuvPW4sbPuylvaaCr9QxZWqDxEqJJq1yE51tOHtXCAJPyy1AF9MU7CZl5vX651pe
         KIqV8wLK3LpR83E7O8pmn5TBYQNJl1d6P6HFr0s8TYPMo+rLKRXy564CSNigirwGChsJ
         pEAcAXFTaJ8DQY4yND+4wSyAjp6uaL3UycX9G0ay2pVcBoMz+hFzBRFtIE+1u0q5+0yZ
         rIaqF/Ksa5m/oxkUqW80Srol1Z3ODQUfBcCxh+FxRewuVbqhsMf3cMgciSHN4ooCwjtg
         OOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867552; x=1739472352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjiel0WFtQD9YS5CKTSuxdiX698M0xiSfjn6FPVYi/E=;
        b=In6EgqAP6T4Q/HtXOEC+oCCSzjFq23EBJi3f5/+6lx2YFEZiXEO9o/osKRtGBjP1ko
         7db2VFQRrBCf5iqvg2xolLL+CBifyc7VzSMuQJZqDrxOdHRhPW38DgJlIdjQaEIkP3JX
         BdKU5DtdfOT35Qd27aTLk0wqU1cwYOKtcAaoZ+mq2sMBkPpXgEomtn8aTfTSTHxD99yO
         WLTIYCVW+6q9S44gWa7UlyJZKoBTopVbUspkm8cilOQNoME54wD5t2zaP2d4u7lOx80V
         MGN/HRbXAelYuupiEhoXY98xZsp/Kh12wt1rLsh2qQ17d06/vkqH/qVlN7J45K2AhqEo
         V7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz4R9zSChLWfFHxsprTClp7n46kQiTBRbwedRC2i29YkKbkA09iKC9ExnC4BMt5j2M9m6u+s30RNO9@vger.kernel.org
X-Gm-Message-State: AOJu0YylMug6HaNVpWEhzamRdoepNcrSm318nGVIsOVFBWUGbF4oSXMj
	f0a9yhsVEGZ2xa2Y6O9kh+xCaLuwAPC5w9Cjeh/6lJKITE4/bTe+Qeh+DistQWlCChs4bzkDdXE
	bnSuyl1i0h3OtFZgSWFCYjKhyUCOhUF2SSL0z2A==
X-Gm-Gg: ASbGncuoBaPKmyh4pMuG9JvFWOcVK2kPb7btvzwPbl61gW0Lu0OEtnJjQqB+aCPgXKG
	kRKx7k3jKJxvKKy2cTbBJb6TKBFvbke4IMKQ48vTstZbsppBmiDnk6dPoI9nUHDevjm9MNAE=
X-Google-Smtp-Source: AGHT+IGpDLY6SHQ668oUnbFgq2auSN1gE3jhzoMa4jDVlTNizXykYl/yxJFI/SmN6Q4nixNkxOa7mlXWwfcYQBp4TGg=
X-Received: by 2002:a2e:b16f:0:b0:302:3ff6:c8db with SMTP id
 38308e7fff4ca-307e5a7cf4dmr162071fa.24.1738867551683; Thu, 06 Feb 2025
 10:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-6-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-6-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:45:40 +0100
X-Gm-Features: AWEUYZk2YRZtcaKVdDcLea0eYDsFvswTZJTr6Ycy-zr9WIcLxtUKOfzaSSPbXpw
Message-ID: <CACRpkdaWm7Lo125AsgyU3+p=WB3unVZFqvudVD53SSLESsT0=A@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] pinctrl: baytrail: copy communities using devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Copy communities using devm_kmemdup_array() instead of doing it manually.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

