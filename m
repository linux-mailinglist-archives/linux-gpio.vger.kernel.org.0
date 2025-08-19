Return-Path: <linux-gpio+bounces-24544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C83B2C0AD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA13179DF0
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4260F32BF47;
	Tue, 19 Aug 2025 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1hMEJr6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C132BF49
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603472; cv=none; b=RX7m5Y59nk+cd/UXgshaQmU3bTBDwDTUFMnlb8sFLqXPdrTAyrllIdSsBQKpr22A+S6Tf+E7HfMVHqNvaNIydVWyOVnvotcQ2EIjYh+lDmPTF1ds5TO2uE9YMJPmdhBuiccE/Yrf5CHX0g/oHMWmR7ReT9WqZTs1wVeZojRx2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603472; c=relaxed/simple;
	bh=7/eMLKrcLUdl9Xqj8DrJf/+zOwRJvD6WS4ChYsUSVM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FM0BnbZkEFPN1gJahBSjbpNr5Ts/3h4l3a26dA0fNZnwzJo0NuX/iC5nAkzXJZ9RTvYo3dYeXg2u0joh6kgu/PZq+1aFB2uU/7oZhpW6SBKpo74i9gYd1ANJFbqMZRA7gvtv3b8c0/Amu/DPTgTBNrIB/bDqVjQH7QKmMVZLo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1hMEJr6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f8d1cbcdso42564291fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603469; x=1756208269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/eMLKrcLUdl9Xqj8DrJf/+zOwRJvD6WS4ChYsUSVM4=;
        b=K1hMEJr6mnoK24g7g4Pzp4lv/5KQzrZYnAw2L5xw9RbGKVjfKRv5eCdiq6R0ne3DsC
         NfeFhKhn4Xu8XgEY/t4I+ZepDtEUoaXpeh3r56tog89rlK1GQfTgnIRDyxTUsqVM11Qc
         92hX7Uy+W+yXYU0kFVAv7mjhnh7bHbSAt7QLBZY8x4iXJ3UUl90WW6KQqVaC7ygZFEBO
         GuhZsMWlxZXCDNtlu63BhuVskhMlZ1ifsLQb5v2Aixu1PgyltJBdcZ2ShtvYC8yZxxoS
         diRD0MhSdfZXIZSC9Pdp6ZcuYQ1AIEWjnFWoj2w7o+FC6Cu4cQhdk1xykOIOYEvUdn0y
         6Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603469; x=1756208269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/eMLKrcLUdl9Xqj8DrJf/+zOwRJvD6WS4ChYsUSVM4=;
        b=hdoL3gtp6mCLqqHbnCUvoZZpX7CQK3RyK8AEP//tfzPgqooY3eOxj+BrqUvGAbiL6+
         PKjpghbjiqgbDK47vqd8zmPxfy+AG70Goh5kioc9gKZbd3oVBkSS25ysBhqCsgCDcWez
         +fz+y2jm2bXGbRJoN16c3b7wn87jgw36+RcFY5w2TdoiNiyL64kqkA7XwtXhTZnwS1kq
         kYsSgwRt3eG9IcvO/67H/Ha527Zk9q0ydv41QgpJCKmjR2PiYDnCx27eGLZArjKCwiPP
         Y/xeLkUlX7ssqDmzDJpWQy/IZ8q75TaKOQxu2CSrCrAcCERbMOUxn/iQ3kGX/2pIWJZk
         A/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUozSfxJRtH8SBy5USKP/OFc6T8sbclvyHG4dzEX1dzm0LLmeMd36BVxKNdv0jgRit/ZB8PxT+48r4G@vger.kernel.org
X-Gm-Message-State: AOJu0YwvwHD0/TQpXdSv9a8aP3jRXwdLMzZXdfFALiEHfOeJA6hbkwy0
	5As1otKuxfqyFI0CcGhOCYsTXiBhJwWPU9DfUHmmUmPDz2r1lJBur+TNggtHj25jOaP/t2Mc+p/
	fyw2DLVTBw3rVRS9W+ckcYODSM/OBMnIq391yzHMvCmt9nJSXHYam+oY=
X-Gm-Gg: ASbGnct9t4h1vCeUzbyDtAo0pvEpAo0ypZf6/Yzvi0S0aUoTAkZ8IIXlRHGiB6I3vu9
	Em2Ohp16J5vHu6VaVZkP1UA15YWhbHXORMtXfTWdVkYRV9lYS5RZqRsyUAPlQGpfdq/OkG2xhTY
	7XUfbwsJ4hlB1GJ+EEKK/Sfe/R00qNo4BwJKztU0E8KksN5ubxDCCegdORHR/GKo92TnYwRD8Bl
	ggJ24+ETeTbocwspg==
X-Google-Smtp-Source: AGHT+IGOB/HBfYtwdx1tJSfnd8ogKz3lNpvmqr3yKeR29sGeAn5Fs3JN7fK6f/qBLlHS0Ep8kse5cDTuwOrTh6QvnCQ=
X-Received: by 2002:a05:651c:4005:b0:332:6e0b:fe44 with SMTP id
 38308e7fff4ca-335305d3610mr2718781fa.18.1755603468583; Tue, 19 Aug 2025
 04:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812075444.8310-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250812075444.8310-1-liaoyuanhong@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:37:37 +0200
X-Gm-Features: Ac12FXyEWFfBEH_uQgjtsUivAwONC_9h6X_7ZZWepm2Dd3tyjJOIzZHnZxTHxdo
Message-ID: <CACRpkdZALwxz_Unmi15zi1XCody8CjrKKXauQNWB_RTOQnGE7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: equilibrium: Remove redundant semicolons
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 9:54=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.co=
m> wrote:

> Remove unnecessary semicolons.
>
> Fixes: 1948d5c51dba4 ("pinctrl: Add pinmux & GPIO controller driver for a=
 new SoC")
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Patch applied as nonurgent fix, modified to keep as blank
line as suggested by Andy while applying.

Yours,
Linus Walleij

