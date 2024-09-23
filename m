Return-Path: <linux-gpio+bounces-10362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8197E864
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767DA1C203F8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5A5194A40;
	Mon, 23 Sep 2024 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0aGWe7r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14B194123
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083035; cv=none; b=T04+fXkC5qgRqFOxfatmOJGAo8Nf8vN1n70gPeCXJkWk/loSqZwFzOj3JIc7X+7z3o4jIFWNn54fBQQO/IWOkivYs8YUFbfC6436Ib3Sso965fHOr0Vbz0iSHVYQe5MpLGQQv31m4bQSVJlDySuX8zlBsovdYcM59AsyS/9ee3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083035; c=relaxed/simple;
	bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnJJavJz6Egk7L5nAQDOesd3sC1tZaHFizGv3kXTwdmnr2cOxmTt3TtECyNIge2yZwNwivKAX+WmJh/YXj/dfiv4bqBF2dnat/6m8CfJm62is7Yzvk/PHzcHBucLp37yEiGaD7kRpN79DwpVEZVy1qDqkL09AV/AbfjLk37LkmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0aGWe7r; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so4290502e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727083031; x=1727687831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
        b=P0aGWe7rHFGm9kCI1S9U46WcSoZnr/TLZcYVXhROyGzOC13R7Y37SLKgHR4EhkHGpz
         9JMgP7g6GuEIhJKSD457CJp5uCWkCKAOn+NUjFWGOsD1NaSfFnMrNNC01rRwoKYfPlul
         mRF58XbluHOxJxFu7Psxz4SAATRZ45GQJGHvkoNkxQAtxauOQO4VdsIboPM9YXywt5mY
         OhZolKQ9prXBFp5u1UtLgxNx9240cOqz3UwDO49puuGgOjjcgVxsPp6w/PsTJDJGp/N+
         GdRFYMGLk40B5gVmCYIm8MN6I/JMMdH8f4ldxzNjf3siRSJKPvFkdlREVe12UaWAD2Qu
         yLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083031; x=1727687831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
        b=Pl6/qgmWV0HBP2/C/6zLCuqfcM/R85ETzITzfYw6KY2ZBx2klSvK/FmUR9nj0T3rx1
         oMWCl4cBs9LikW92+FHZopH+JbxP8br92Uxgn9f0pjTFG+TDLl9cNsrzYKsOZTI3390f
         LT/auL3vbDPvPdov3BzUx4xUgudPHKQ6O6I82xX8QtPWeSaEelCSHvp3TwBzDhHoH3KX
         1vo+7XMdV6oLRIfzKKSmXHSztpI92WfMH/G+GypHXCJJnUp/XcXnsjVXxqnLfXmmCX7m
         BK2znWKCeqJf85PTvfGu4sa4bRCkhLO6wXgqdbjSCSwI0a6i4BzpkltpOLIJuc1F4ltX
         9w+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLE95tZ6YF1u7MnLlv2eyLiaLRfNJTKgGe+JZyA/t9WmiT0MTm7eNB3KavxsMVZaQi6gU+8+KGQC2b@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDXVk5V4O4M+KMB6FIppvT4LqGQFbUAXaDzxRI2Xjnr+loJ9K
	RBv9VsW9uxI5d/6jF254fq8gP90Ed/Tgiqu0TOIckwUyG3JqEgGGQPU1fV4Bkff5Pp3Ryw6kVcS
	W8TTpTo/EgFm8fsOFy0k+W01wRT+MRfPe+hq/tA==
X-Google-Smtp-Source: AGHT+IF5N65MAjSl2RI3rZ8tSubimfvrcMOGWwimT6ri/YlzByTwDzfSSqy/Vo/Rn2B5RVjXBogTTQ/dqeeiG1yGEoY=
X-Received: by 2002:a05:6512:e94:b0:536:52da:5183 with SMTP id
 2adb3069b0e04-536ac2e595emr5416859e87.18.1727083031495; Mon, 23 Sep 2024
 02:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905200218.3810712-1-quic_nkela@quicinc.com>
In-Reply-To: <20240905200218.3810712-1-quic_nkela@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:17:00 +0200
Message-ID: <CACRpkdaKNyO9J265AQjDbta108V6Gw+89nDXscMRyvJN611VGQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Add SA8255p TLMM
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 10:02=E2=80=AFPM Nikunj Kela <quic_nkela@quicinc.com=
> wrote:

> Add compatible for TLMM block representing support on SA8255p.
>
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>

Patch applied!

Yours,
Linus Walleij

