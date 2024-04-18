Return-Path: <linux-gpio+bounces-5657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8498A98C5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 13:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39474B22A04
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 11:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F1516132A;
	Thu, 18 Apr 2024 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X35fjDLz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE691607B2
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713440226; cv=none; b=mgGlsOdBVJCTcM8u1cgzuAftZK8cHqH3W9q5aHJr3tAIEI4nLlPhsYt4sSesPIv7JoUY67yF0vjANRP9W9GwAlDEmOhPsRe/k4/om6SLhX0QtbA7Ed3Xq5VCxgHVYz1RKx7yghqzal/6vskpyxuSbUVfj6T6kKbS7l/7Rhom6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713440226; c=relaxed/simple;
	bh=ZZZeam4pgnqliiYd7rSqCNAXjDr1ZIcR6XnFF+yoxhU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dflg+0nYTJ/11In866UJdyWV5nMDxDo/CgfqApkP/ilYwnNK/ZaLfslBZZfbPWFuq1mtonTZaUxUter6WrVY8kadZdHcmlGsP7wpaR5Ggq2csyu7KO6W19s5YMsWUyJzLWljSCdc5kV3C7uzmDJDfhu01+QWHFIjHQ3djnGTNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=X35fjDLz; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de462f3d992so824842276.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 04:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1713440223; x=1714045023; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZZZeam4pgnqliiYd7rSqCNAXjDr1ZIcR6XnFF+yoxhU=;
        b=X35fjDLziTAlsFGhP+zcL4k7jjS2KQVa/FNoBquCW/6KdJas9Ge1UiSj9cFAraGlBk
         1WPxRm5bvT3x48P5BGW2Y5bd1Mtd+V9n36ie3TYmVm82hAHuL/5ycyZM22sQErnzr3sF
         T/kBIJ5AGfZBLxDxNFAfLMdlc+sFIVFIHfl4weV8K0Qp56heC5s6VbH+kRLr0q6bxsWT
         R/cKX8XMT9XkApu3a9qx41iIyADcqNkCoCx+0chOxo6g1QKWAmMbdwOM8YIIe4gfxlfo
         /eSe6Kyuha9SAb+AXda1fGShpb5ansyRwPZvCasEQG2GUMkbpj3+ARAAMeIY4Aksq3xq
         fb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440223; x=1714045023;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZZeam4pgnqliiYd7rSqCNAXjDr1ZIcR6XnFF+yoxhU=;
        b=wvlGxK+ANBhOeZITovGARwfqozUCWTsazW2aiXirRiUbLEbCOwpAlCUrbdydrxf/y4
         dL4hL6uSGG2Bg7FdMrd6rOE2JKylwUV1B9/N0oSC8/ZDz36Ub54yvgoKqijl+ERtECHa
         fNifP5wdiPBPPfwpwAcNXCda7eTun87DzrdcbrBHFmlU8LkacKZKZOYKZnwOURGMYBKn
         zOuqIQAMzhYh4K+epauTqN7zo20IRyXUNFrmMNmqbhMkZ+LapjBGbpILHgSpb0phvxb4
         iSzxi7emfzsNF9G1AKFIhwcXoA6L3IiL2r4BQPg4DerP7m+nzgjvHRsy54IiEH4xaCeG
         ZQyg==
X-Forwarded-Encrypted: i=1; AJvYcCVI8Y0wJ7ffDL+G7HO0lZWdjSeXpd51WzOQPfzNMI/ijFjFIgveEDO79kWZt/RkaI2R1ed3tcgRGPnQy7NRSpL42lPXgW92vZJRHA==
X-Gm-Message-State: AOJu0YzMVpCmzuSoKCswwdshmTMdcGDbt9tout2p4xCy4Tds2kqGKgJT
	LbM7z/0y/Vm2WwpyfSHD3dudacGViTUD2Fy+xhQ6xX6JpsFYafspe5QpousYczeBaoYVlxEyAH7
	S9uvNhrJ6QlftUgQ6Syk05/2Dsp6DdiED/0EZinhPCkG6rIIE
X-Google-Smtp-Source: AGHT+IEdkW+CyII8z7WZkjodbEgRdb4E6h/kaH7hdjEbG33x+3xhic2q0P7PbB+yCsHetlQWjQ5J6iBWF+0gaeVvTA8=
X-Received: by 2002:a25:3f06:0:b0:dc2:2e01:4ff0 with SMTP id
 m6-20020a253f06000000b00dc22e014ff0mr2548299yba.45.1713440223265; Thu, 18 Apr
 2024 04:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 18 Apr 2024 12:36:52 +0100
Message-ID: <CAMEGJJ3y_A1vtTV1x8836+AMOHs6NnWx_EsLTJMgaR5Fb9fgtQ@mail.gmail.com>
Subject: Advice on using gpio-brcmstb with gpio-ranges
To: Florian Fainelli <florian.fainelli@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm having difficulty using the gpio-brcmstb driver with the
gpio-ranges property. gpio-brcmstb allows multiple banks of up to 32
GPIO lines to be declared using a single DT node. However, if you do
that, any declared gpio-ranges get applied to all banks without any
kind of filtering or adjustment. This is because the gpio-brcmstb
makes use of gpio-mmio, which requires one gpio_chip per bank. These
gpio_chips have the same DT node, hence the same ranges, but are
unaware that only a subset applies to them.

The GPIO<->pinctrl mapping can be configured in driver code, but this
is deprecated (as is forcing global GPIO base numbers to start at
zero, but the driver does it anyway).

What is the best way forward? Does one have to say that in
gpio-brcmstb, gpio-ranges and multiple banks are mutually
incompatible?

Thanks,

Phil

