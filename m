Return-Path: <linux-gpio+bounces-2788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C73843A4A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 10:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59FC31F2AF51
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855887BB14;
	Wed, 31 Jan 2024 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a6Wgzbq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB17BAE8
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691780; cv=none; b=CGF5uXpaFWGFx8Xnjjhj+4X5F957f5R6VmZhF8uCcrIAQf9bnZN7klMJD0QAm1UMSwvdiDAwEnU7uX8EWRlP73Q7X+4OZHk3JR9YDwm+aIhPmncO1jxIs5dnldtr1HFw6dKGQsOhieAJgGrIH2IS+Zi+q+xUjiwM0pNXKX4WxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691780; c=relaxed/simple;
	bh=lSdWN/jxDJULY0LEtZC+P/VtTmAioLS2PNUhVVLVcQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhWNlWWSZsFSgnZFJNZuO3kvgrEYodcNww+G1p9t3bsVy3+ynT8d9iqBf2CPdhiFtLID++/aDaqI+Pu+Bi6EL695AvVVv+NGZJs1FMFIms9GFqTCeAZhNYrEmDT+NLICYO8QLY0n/OMEhG6PnrWpVI37pLcFC4QK69gAQNb8lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a6Wgzbq5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-604058c081eso7771857b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706691777; x=1707296577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSdWN/jxDJULY0LEtZC+P/VtTmAioLS2PNUhVVLVcQo=;
        b=a6Wgzbq5sWW+EJ2jNQFbMCBGeuViHEzrSPTgEoSxeK3R1EqBCm1ZrfqN0/gWCs4BbA
         x3VbS3xKUdHzroc9M3NGi9WIiK3LhXk3rqp7egATVLktv6fDwLdN7Gi4OVoKSXYKVQC3
         apMoj92yumGs0CV8w/8F11Rrnjbw+42N5ueB9c+yzUXAfVMotqPuXIIGzTjCPorA0Vb4
         Yqu7Okq83aFKKTTOyxMEvvKRG4VuujUcoyV+HVj+OZMMSleGJFv9CvrsIhqlxWZ90U4m
         Momj3Eh9cMgXemGpgGKMTeqXXUGJE7apuLsYVAUTMWliHo8hjG9t8GxXNg1Ryzc23FB0
         uvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691777; x=1707296577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSdWN/jxDJULY0LEtZC+P/VtTmAioLS2PNUhVVLVcQo=;
        b=W6dlPMZEAy9vCFanYBvKRXmGske8zTVJ0BmzNzWMxS2V5AbzQ5xTyJoZbuet51tLbS
         NnYhOOE/M0/srkoQrzhBQJpt9gsSUbMfQ9DbQl5OmOQNc2j6UX65O7uMwnbfY3nbJy8J
         4NSQCXjJYxydxmcj7IcgEiQ3w1+J9JAM8kRrsHXKRoqOsXcW2hALrnni/Kv4iPrU8RXb
         tvMs+t7WbaWzOHjEiwq9QdceC3hCVhOTFKj7aSUVzw1sBcKPhYqaK7/+B/h95e6QlbeK
         5sNTqprWzUZ8SbTEjOLp2p24yztljj8eRxBh6H50TtsDAsrWwKWatnFXzl/STJlnM92E
         twfg==
X-Gm-Message-State: AOJu0YyvMGk51C1lPeUIx0Qj35hO0evDbM499apxnUB/uiqsj1Nyd2mc
	VaHKWglTbYc4FwBAXl7+NVjKYNfnmp1XOLzbfpyyFcGkMR8XucyDODsfFvtZugmEgI0L0Hq0Rzc
	z39s6lIQrHTK4HM9d4P/j/f6tu/RMHstxbFQ4Qw==
X-Google-Smtp-Source: AGHT+IFNu/LhtEPrhOQpwPa0p4PCYkt17hfYf8YDj2gJCGqqf6iDBVUw+ZW9a5aTdlUH3m0t+5dEaWq2PfHLVNOG8U4=
X-Received: by 2002:a81:6c97:0:b0:5ff:956d:8b7f with SMTP id
 h145-20020a816c97000000b005ff956d8b7fmr836491ywc.10.1706691777138; Wed, 31
 Jan 2024 01:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c1307a4dd5e30290acacc786cb2170deb9eaa539.1706087258.git.michal.simek@amd.com>
In-Reply-To: <c1307a4dd5e30290acacc786cb2170deb9eaa539.1706087258.git.michal.simek@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 10:02:46 +0100
Message-ID: <CACRpkdZgPhtgrvYV_aXTVA77VYnzL69_q_P7_iP_2rHRFEm0SA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctr: pinctrl-zynq: Fix compatible string
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:08=E2=80=AFAM Michal Simek <michal.simek@amd.com=
> wrote:

> Compatible string doesn't really match with compatible string listed in t=
he
> driver itself. While binding was converted from txt to yaml
> xlnx,zynq-pinctrl was listed as compatible string but example was using
> xlnx,pinctrl-zynq and also this string is used in all DTSes.
> xlnx,zynq-pinctrl is used only in dt binding and not present in any DT
> which is stable for quite a long time that's why use old compatible strin=
g
> and update binding document instead of starting to use unused compatible
> string.
>
> Fixes: 153df45acda0 ("dt-bindings: pinctrl: pinctrl-zynq: Convert to yaml=
")
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Patch applied!

Yours,
Linus Walleij

