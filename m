Return-Path: <linux-gpio+bounces-14713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B8A0B954
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 15:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42073A196D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 14:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A9235BFA;
	Mon, 13 Jan 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0w7TXha"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157EF1CAA6A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778147; cv=none; b=aULmdINc02sLv0WZWZ5YXCjqOTsXibd6gNTssmXyzwh/JQG5+R1i3G9W9u69XxY+r7zS1lzrtP9V7LQ3zLuT6azyAE+eGdfyrY9GzsQVJ1Qb4hoUsE4qTL3gWMw29TroR46/PYwgalPmznE2+46YzDPiF2h0jIvCVgPDVc6KXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778147; c=relaxed/simple;
	bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjI7bi/CKzJw1Sn/TpuYwTizCdX2aUo0DAaCyv+9E5e1x5slPqS2fCV5k6L/X9HdRKgDDvAuRcWbgUhjRongjkX3kTRGnLA7kIHjPHLAhM/0O5oftssByQVUFDNjMGgK2eDf5w+Fo6TMX3CIXzyUbZOJvVxOZxric+ZRU5jtAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0w7TXha; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-305d840926fso32314141fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2025 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778144; x=1737382944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
        b=l0w7TXhaa8QL3ybpFYu/gIbRQ3FnFPB2YmSIf2Bi47P3KzJdxN8LZwCHNX0ZawYLIh
         TQaDsQsvkQG0DsXyyr1KQEUx44yUI1moPwy4+cvbg5iSUBx6yFe0/ySzQ6Eb4780wqTn
         l4KmtdRzjT0qrZ+z0bDJPPeW2fgeGyTTTlKk50hXVxGecfVbwlWRk6QBsFVIdjk9kAx5
         pjUGX9g4gjpfUKYFQnbk3mHcSdYilYacFjpfH2gekCW0MdWzsewLkBhIrufc2+9ARZnc
         0FdGQzrkID9fsi6cHKSSMdWxPOCFIpHLJxn/Icahlm6F4BkNctB309oXCh/dGw8Yow7S
         d0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778144; x=1737382944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVM6Q6nl2z8cXwAn+C0EVV/4XZBLyo2kPcFo1oLs52M=;
        b=WMieRLa1ut1kuIwsS7eZF28/Mm6rNbASOc7xQolyi9D9bRpyV1DPq1SkmQlxx3lPB9
         hFHc7d+f/dPwPisUyV+6ok95K7uOmsrEOdXW9EyZtwmReo28U/QnOcmvKep9jMs3ntHS
         X8FGTsarNdpSPByiDMI9usAP52kAMh1bQ/YIr2nuA71qg9Ja1a8L8cdIZZ/zdK2Hi/CH
         2YfJpxFX9/LtYQBoyshpLKk59GkvE8Q5tWjv/o/GrGGPF1zp74JFpxseBD4JbTaB15SC
         PHmq5oJpsryz1LEVusecTbo3LftfU0/UPQEEbEnn48eCjNiHIGtry0ZQR+27ThcBhcvD
         SCNg==
X-Forwarded-Encrypted: i=1; AJvYcCVuX/RqZ7HMX9K+lZvQ15gvwQHkIOBn4gGKjVOQ4p30nXoQRkV0cfM6v77aCHyVjla67Sq0ZJsqw00W@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMDTp3wLAZDo0PSicbpNcoPAWk6XXHdTiyjS1QO8bMoLzCt9f
	rMhODcxThyNBUAxHsHG4k2WQKVr9bdQBLiXVAVbhHEu7QysOZK8cZbk+aWAIPEiGZceIy3M3xEp
	VoUrmE4vtGw8fd5mnldei0V3xchxJRRvpY7tqig==
X-Gm-Gg: ASbGncs5T+T3pkxbbBb7OpnqSCqAOsZVRhzgLIa563kO/WJRPLV++Ydf0G/v5RA8TcU
	kYoefiHrxP9eyPlvgXXE9283X79AjK9bTBG5v
X-Google-Smtp-Source: AGHT+IGrIp/YeFWUqkZp4mq1epwojwJuO2MFV6BwKUJrwVosj2W4wO5hjnuQkHxGYcHx/sm+Sao3K5qAIcHXELaE4mc=
X-Received: by 2002:a05:651c:a0b:b0:302:40ec:a1b3 with SMTP id
 38308e7fff4ca-305f45a0a29mr66505751fa.21.1736778144142; Mon, 13 Jan 2025
 06:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226215858.397054-1-s-ramamoorthy@ti.com> <20241226215858.397054-3-s-ramamoorthy@ti.com>
In-Reply-To: <20241226215858.397054-3-s-ramamoorthy@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:22:13 +0100
X-Gm-Features: AbW1kvZw-J9T2lbOIdvQTsvnzzUUNu5FkxOd4XaIzoaWKdeSjEblgmM_5TWT_0M
Message-ID: <CACRpkdaszNc-wLj7eztFhhsZi=K3bUqSN=m-ET4sdVdi6ufM7w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: tps65215: Update GPIO0_IDX macro prefix
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, brgl@bgdev.pl, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 10:59=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:

> Updating the macro name to TPS6521X_GPIO0_IDX is meant to indicate this
> macro applies to both PMIC devices.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

