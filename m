Return-Path: <linux-gpio+bounces-18818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C75A895F9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA8E17C14C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BFE27A90B;
	Tue, 15 Apr 2025 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqGsx7RD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4952797A9
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704251; cv=none; b=hnwyRUw0FWdp1h+cXvfRL71m1P2TGLwjMvgsESYz5TSrcoM4KlZpP+3/Nkc7lv0KLIBe6ULkORV/SGBMxcglQEnmNFSYB+0ksdTOp0Sbl4m9OaG+hI815oS90V/62qI/YSlhUQcRzfOfNRb8Z2p03yFOVh/pl8Ae1TjzPCrPeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704251; c=relaxed/simple;
	bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojwtADiBK0llU/uaH24L7F4sSXHO4ZBSSCwnrsqO/N+hhdPVGVlb95iUQm/kVxYQICdzbLree8rdhHbFViRQWA3Y3qdznfTjxh42+P2fUcWR7q36kV+BgLu+3nj/G6PvJtJ0LivwttFWUnBec3cid2CQ6DsK8EHOtIdAPCvJznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqGsx7RD; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30beedb99c9so45945661fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704248; x=1745309048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
        b=ZqGsx7RDfEaJl2LPEJkgVR3es4UItjz2cIGPCEFY38LsKVo+yFkMwBsgr9xwMkHrd6
         JZKs1LAtFM0Vl39XKRgN7tOgBGnPU5Zi0dic6Tjvp4DB23GDHqh18NJBoljFFBOdh9KR
         x45wNPpuJPWosG/fyqWk5eH0GM65rbdOQIl3na0shT5tp45fH6VqH86v8Xjc1WVNsgbj
         HhFtrcGmHUCsRuSF9qTV8YKaPs0acKz49reanDXRFA58ShnbQD/dWIu+wQBYN1iA4MwP
         5aIB0Yfb0zTjabDyxpsnAB1QJ6oAkbzx6jYPYX24Nx42r5Yg+F1EdWlHvmEYTmPz6d0C
         cfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704248; x=1745309048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLWxUOmPYPHLT3lvW8wfZ+nFn5LENG/ShZUKH2xvPcc=;
        b=FmJVZhYMZYNigY7hXkYmk4VKbs3CpX0N8W5pMJzDCJ/LezCh/9GEruQtLEltlNBeOC
         nikqcSR41D96Pbm2be/2etAmfiX8l+riochMsOqY27OvX1EWuk5TtyykDnd908WOQVvZ
         JjzoFz8WSig6NdgHUuVomOZjPjIC/6R+DfaBDZi+AoQrV9GQqh9SVApoB8T0A69oL0Se
         BfV4VLwaKChAMcMc5IIFcNu9EK5oSlhotR+waHhQVMRo6w4Wu4VbrgFIKr/34buNUd/E
         o9EzZOMNEA1qm3V0hAru0AZdo+crtKakOW87VI10e8YPApASP1XutJNPKIauIu4phb7r
         a2Mw==
X-Gm-Message-State: AOJu0Ywv+C0SDz2Cl6LfzV42qnFOnjfOrjJ3DB4ORQI6/YFfEV4c1Dd0
	2cA2Egec+l+pwfDZpHxwLcIKY727g80YyRLn8QqRnIhfLDxW6qFFDNl39vl3WROpwWIvl4XR7Oh
	26Svcnv7ussDeadAqcghu+TVhcVaiU1NlRLnIJg==
X-Gm-Gg: ASbGncshCC63dN5EFrGI9c6cdDAxMnTysVGa8w6s9fImb/XkIfT2Z0hyNTreIziQKlf
	YNklY9t9C7758bL2IRKlaZ6BLble9WJW6qZa/tTsGMcnrxV2hQCmX7xo4KF7qIy2QeRrl+0YhaR
	gS0pDNjBvo8RMe2ltOpa1H3A==
X-Google-Smtp-Source: AGHT+IHqRSr6nFzZBt6p+EtSPOjYAjNfxngoswBHALYRtjtD+v6Yk7+0wKLy00M7hstsxT3H1VFC+s1jS/5ENL4UGx0=
X-Received: by 2002:a2e:b8cc:0:b0:30b:d0d5:1fee with SMTP id
 38308e7fff4ca-310495185e8mr45959991fa.0.1744704247744; Tue, 15 Apr 2025
 01:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402122058.1517393-1-andriy.shevchenko@linux.intel.com> <20250402122058.1517393-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250402122058.1517393-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:03:56 +0200
X-Gm-Features: ATxdqUHJ4G86uxn9sLVjJPZ66qyKYlYFDtxUdQ834bLnwxuZ62-PXoSXYTWfag4
Message-ID: <CACRpkdZYKuzziVdbXzrzj9N7CUhtXKYVCQnvgO-527Xx-N95Pw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: of: Move Atmel HSMCI quirk up out of the
 regulator comment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The regulator comment in of_gpio_set_polarity_by_property()
> made on top of a couple of the cases, while Atmel HSMCI quirk
> is not related to that. Make it clear by moving Atmel HSMCI
> quirk up out of the scope of the regulator comment.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

