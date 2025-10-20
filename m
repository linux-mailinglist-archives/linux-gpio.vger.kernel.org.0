Return-Path: <linux-gpio+bounces-27324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F4BF3AF3
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A993B861C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC71202961;
	Mon, 20 Oct 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWcWWI0+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F166333454
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994996; cv=none; b=YDnUg627eQwiVBCgYJVWOxRjZYBnRviScVfrPx26QByE6jW9nxCs/yH9ab8ilvi/PLEKBHyc1mHF9hQicShKvPBfSCnXCzluU9pb1W0KmidY0wfR/Sqyqbdqc4uMslg+Es7SBWGBRQIPQPJWuckwaoG+iD0LKa0RxL+9DcIPghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994996; c=relaxed/simple;
	bh=Z39XKUjyZrgm6nEjjbRX8r0IFRUqHZXsDHxC2pIscqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLxiN92N/DHiNceodyY6HhTActkyP+aErv+5LSE1tlkgxdA3qZfFFaFmoRRutFswcZ/N94Fetzx3tO4Kra5a2yRnYrP9nE9HEZ+qlMiu2gbUxUMexHPGOiaOUci1wyyFklHMapwVN4EpKlM4y+ZS7NZi0Mbmm/VXEIm6W/S7JhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWcWWI0+; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63e365693c8so1558016d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760994994; x=1761599794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z39XKUjyZrgm6nEjjbRX8r0IFRUqHZXsDHxC2pIscqc=;
        b=EWcWWI0+/gbrT8Hpb0+MH/d9PDGEwEVbVzq2jJVo7gj5HI2ol1ncyEqfaPdJJguLEE
         G7Gg8sg3QORCxvaULe8AFObISRqPvF2hxXNECs5f6ZoIFIdEY0pk+BeUO9wwsjJpRXhU
         2T4t/VKsLD3Px1XYJEvs5395p7x37NkU+BkUM1377YaHHL6fTp7CMBlWPAdLWYZWLkvc
         8QQqT/Kf/25aNhrupyaKKGdCn4rNGJMVu/APpAqsJgEofjEVtd4cxr3/cJTLCdS4gFZ0
         XCWL/TrrMGALuV0Xxa+mOAUerenLj62dCxzuDMyJal7so3hzmRQnF/o0lRbGZ5jjYl0R
         TqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994994; x=1761599794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z39XKUjyZrgm6nEjjbRX8r0IFRUqHZXsDHxC2pIscqc=;
        b=QwT0iPwLisXNdmsxWpByL3wTDf0GHZ16iMmjB3LAC+vx1VbT5wRM5SM8PCKpGXnY2k
         fNyKOkNKaBl+6tEzPMGQFl3kQQxn1Yb4Y54dFANz35Ax8GYWhSFYUwtQJChY674sUA5j
         2YbqQ9ccz4Fq2KLzz9D7Ged8ONwfDgchII8AXoNeADB5l9d0wXdBqD+mZrRmaBIPHqqH
         bUHb5ZQR5ziv0ghxiLjKFYy1/kczo4CPAotgXcAF7pQiaqiUpcyzLSDkgSP2D5yzqNuP
         WC+WdIuOVpy3/+zSfnQ7x2KqdCV7o6XvtS8tvkgNKorGpE+abVTdYGMgzCPwmNerA3bw
         28Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVL4cXo4usNcv9LKRabfVgQ5V41A6qJvavJTqVKeMdxW9wVbzeOe+6fLlNrzKJNA9F0VAz/DBfeqK1v@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTYeGnAqjN4XmrgSAOHOD60DamwaBqenaTpRG60faL+AXivxc
	VbZ+g/Z7EcYm9rTbcx/fWBidPwTBofVXzLLJT4eN5fPZcnLvqnceyuTBYKgL/pW6wGtWf3CO0Di
	7vBnmUghD0ArQCF++Jkl8bdTkpOul8GPws0DD2RScxQ==
X-Gm-Gg: ASbGncv2T8w3A36Vb1NXM5RKou3Ip+SMxMymVEHLrOIhttuaq71vJKccJZY41ALvD5a
	O5uAp+gficlTfCTjJxOG9j+lvAInaRU4ovopFqAW+miiSfO5uxBeCrufSt3ky1H0GEjk0QteATZ
	Pw7LaPaWFo72GnYWk9WpIA/pYdZ6i6R1K7S963BQyMvi0WnnkHl3Fs9KyViVYgXPEd8dF71qB+v
	0Qj7eA8o+yeuGs0UDD8HYBvv0vo1UlTSWIsFRNgi0z8TUz2jwNOFb7D5KC3ln4ApwXuDrg=
X-Google-Smtp-Source: AGHT+IFgddNnhWh6OKVZ0qTi4mmYoAX0fPulCNpg9r05luMnstiOJYyZQ51cCpijocVdPz93zIwR2zKGF43lIrhanLw=
X-Received: by 2002:a05:690e:408d:b0:63e:30d0:61a0 with SMTP id
 956f58d0204a3-63e30d0632bmr5728377d50.26.1760994994012; Mon, 20 Oct 2025
 14:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
 <176062606134.122017.14455806740339775356.b4-ty@linaro.org>
In-Reply-To: <176062606134.122017.14455806740339775356.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:16:19 +0200
X-Gm-Features: AS18NWCUioZsQP6x4ZemVNFC2EGIJBPA6Sk-XCQsTICPirre3kuANA4BRArrNEg
Message-ID: <CACRpkdZZOWSeG6D49x54QWaVG9=hSVSeAen_qvHhwiDBXSB8=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header
 from GPIO driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 4:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Awesome work! Thanks for doing it, we really need to keep getting rid of =
all
> these legacy intefaces. Queued for v6.19.

+1 on Bartosz comment, you are doing great work with this
Christophe, keep doing it!

Yours,
Linus Walleij

