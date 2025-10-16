Return-Path: <linux-gpio+bounces-27226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48377BE5B96
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 00:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA201885DFB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 22:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3618E2E5B0E;
	Thu, 16 Oct 2025 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgWntrFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE592E1F08
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760655081; cv=none; b=bDycjDoTmf9IT7Pm1qcaI5j3Mykx857OEvcaxiaKvkM2qBhqdzRSc77L/b1mHUk7zTXgVyLPnWO2EWOXDafMyJmfj8kMO1bgNp8fMzqi4PtkHk8UkQ7fWKTg+cAJemrZjQwjRxp1swGRVZNunMicKMx9xooJzynltqUTrJgvOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760655081; c=relaxed/simple;
	bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvbqxz7a0mxlqrdpika/FLqUECi4uTUVYRxm4SF8HZ3y0zMVm79vQ5xmiKKUT2CdKTqJt9oBieN91y2hfILvpH9Ae9U7ce/WOt+7uYgysTVuZirgXQOP/b5+rffmCEqQhwNPxq/5hZA70739PtlsXNRb018vAFZA3C5OZo4QUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgWntrFf; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36bf096b092so13611571fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 15:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760655077; x=1761259877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=;
        b=kgWntrFfAfzS4ndV/cr7cLNh88RSLBL19wsltxNBmjtPMXK3QCKbPWcu2wUtsLhz2w
         8CHZ/MQuSCIIG+VtRngZolwKCLnxdob+5bUFvLbj3KAbLNYJhc8b8PWkUKE5xqQLHMKL
         JvHiwWkMO6cgddjkkTGFUJ0DNRCuoLifbH1t78CMQSfQDNLLR14HjDVY4U0vs9DApyVt
         WLWRff6ws2uEH/YzG7Svp2ZT5HJGd8x44D20ZFECG/AOtyZj/dpBM8LUWl2FTJ3MJIYo
         B3m6bf8Nt5kpaxz0x75hvXJp8iqhgsxxDHhh22h0lJyOg5zmksqtcnym+rTjGeHg9Shb
         xhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760655077; x=1761259877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=;
        b=o63yhY41oSzGb6QytTOhI1qkkwTfotqa3uUjcoqhkvoT3KKFda6sI9aizisCM48ThR
         aogwJRfLDiE5v/elw3BGSTwgamzgUTldO6EJRjSbeHBPG+p0mQImcY/HOSR5b82b/WUU
         dZVfQhvb15dd855a/2ankhKGd8Bs3KcDUhZhxLVmQVJZlY+EOLhI69wmjkvcfiebDiAX
         jdwLoaeHV5AEOX9GrAihsi9In7mx3k6HzmxeNtaA94RHF+rfbw0bM318PJwbZ49SNNsx
         VRkw8BvgGHrE+u+B8/8pqleMgOuU+4aMSf6NeblEIHHTEzIJgYJ9S3LCXvg+Rtyer0kr
         12+g==
X-Forwarded-Encrypted: i=1; AJvYcCUG5Ku+TK8DYaT4XKXkckxq/7tY8aRzbtnTv0dH70myKFcoZtpgLxloZ8U6cJGQBxEie6siO4FGoLqm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ssN3RknIJKxdsvR0RqXPhhW9ZrhoR+B9DW4kKu0Qe76RkB7N
	5uL9gaWegowqAsMNmC4Hk8NtTXkRE9zJHRWt12u6mEgu5/mF7DtQ+XG+CnDneWLbbYxCDhm4Csb
	dga0SHSiap97xRc3lvQZ7NAUSdPAaQjjz1Wkc6pFErw==
X-Gm-Gg: ASbGnctZsECnZwy3RzCaia2N0jdMKR4D/ib8Z3maRXHwiSBJa6bpNehta29v0uxoKHH
	Rf9rtFOSbw4sJBuflqeJtOsTQKCEM0GlwkWrN7o3Rj3xKAwkbyvQGCadi7iedaihrWZ0oqCP9V1
	HprZNvNWgQVyxIrhHeosGviptvF4UZi00oeOWDPAjysMOtREVG9dxPiMkfJIef64sXT0l+Qwj/M
	hDJN4fiDaPRqSy4QSgdKmoiCc249rIYDNT8+CN48Ld4CW+fw2PGz0dA2mm4
X-Google-Smtp-Source: AGHT+IF2PsArzf82nnnIcXMKJafhbORBWTmQjtEV2MVSW4tFFx2e5kaE7Rul4euIEnksQA36PN7ysUqEvFRBOXSjgk0=
X-Received: by 2002:a2e:bc85:0:b0:351:8d16:d0bd with SMTP id
 38308e7fff4ca-3779791150fmr6358721fa.19.1760655077092; Thu, 16 Oct 2025
 15:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-3-gary.yang@cixtech.com> <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
 <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:51:06 +0200
X-Gm-Features: AS18NWAn7wwy003ztU4tRuoGojKRToh6fuepHCkeLH2yGuI4i-eeI2-SuJ4p_pg
Message-ID: <CACRpkdaOuih=CVuGVgpfwP921g5KSd1Dm5v8oyyYq0pJdrzgHw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 7:41=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> GPIO IP on Sky1 is Cadence, not Synopsys designware. We wants to do
> it when upstream GPIO driver in the future.
> Are you agree?

Yes no problem. (I misremembered that it was Cadence, not Synopsys...)

When I look at the Cadence driver I see it needs some modifications
if it should work properly with GPIO ranges and interoperate with
pin controllers. It needs to call gpiochip_generic_request() and
gpiochip_generic_free() from its request/free functions, and
preferably also gpiochip_generic_config() which will extend
the gpiolib to call down to the pin controller and take control
over line properties.

But let's do that in a separate patch!

Yours,
Linus Walleij

