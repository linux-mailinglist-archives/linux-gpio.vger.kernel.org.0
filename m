Return-Path: <linux-gpio+bounces-12458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFE9B914D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D125C282420
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF21433B3;
	Fri,  1 Nov 2024 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K5MdyRRX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465C20B22
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465378; cv=none; b=JM7YOvl7x7YAvYulZm5woTTXPYSn254crKfTCAwzlxMCezRptBXfyJnQ8zefVVD6w1oEl/r4q0lRcRu17KdgASJZYbk7ENqBebneC6q/EABeBGdn9x9ni8P+vkxuWn0lK68Cn+laN6qrH6p+1j+PXVKehENVXfwCzFEpdj6IyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465378; c=relaxed/simple;
	bh=zj8nBfC/tfQQqExlVPs/Wlc5ORf4Bl9uV4l3BC26KKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCpj5rT9lZrxxCWp73CTPovhObtz0Tdd6uJlCuFN6uudWSyxn6VDoaTJ/KH3GAfzsJYFtygRpNcGjcZDAx4K2rEioeHD0vj+jQz9UrPANs2MEG/E4ENKGyTdYNiB2DR5eSiGesvpsiA8JRf/CiFWlbdw9S2MlVXeK2NH8DQCEns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K5MdyRRX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso14209711fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730465374; x=1731070174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj8nBfC/tfQQqExlVPs/Wlc5ORf4Bl9uV4l3BC26KKU=;
        b=K5MdyRRX4mh1xa3IsKIwVA0WS4ZdJVijKdf0//CQ1xjKsuUWNqAi88K2pUPXa0UnRu
         IbrG942+MtuOz3HndhpPdxT+zeXkBgcNOclZfOP6aWraEgVuKSVAuTlTCf5A15rFnP81
         iW+F4R6gFNE+hwi3KUThzb0ETSAy4/gQWym9c3lU4geJTEImz57RPmb14sYPt1/B68du
         LT2Ucqo86TZIkRohdTg0jqRdm5BwBcXsp1ewviiVte5X5zcvpndkt/hKCew1vrgsQT7B
         CzjmdbgOOxvQLF2NEfWRaFrGNX5kJBu/Am1sn5jql+0Pe+yczE35JhJMUA2cjS6X61lX
         xHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465374; x=1731070174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj8nBfC/tfQQqExlVPs/Wlc5ORf4Bl9uV4l3BC26KKU=;
        b=sH11M+b8NQjr4RxbRa9a7RGc23PRm0evyQ7n+rcDpXCYpTAA3Asb7D2us4JKQBIUU6
         lHFEQ5/eBX8FPUXwQXh6XrdaZz9S8jVlqr9X71uohvvq8qL9vzVIOMYGuoXDUr5NiFdA
         eyerabZB/x4YCgTJsY9rdr/26t6wU+0kiljWcTfRfTRUe7k8ehUULowKKIaX/DknG36b
         W0FixBA69gYrmEYdiRsZJr1ymLaQxtBmxaG1Ryo8gbQwtE61G8CaVZubi2KLQAQ62pYC
         qtM9ZTqe7i9EgyrMZOjxfQX8muOn7S7z2kVpZqSQf9JGKKP0OQJ0dBy7NMm+vYBUCN9G
         ITPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxkHs/tW1WhFUYOZfRaI8JP/UVjlUO7mcdluHQB4vhn5nzUfPBocDszLlpELKbz7F5g0tdAxRlAQ4e@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdpUsdXFSgJnF8S+4Ps+taLJeyOOiqph344tiMW7OmT8MSSe6
	Zmbd9eVK05du+BSu4uWWCBdt35lYWeJzDzrAQuCllvDjAlvetCo0Hleyyx8rgr4+8e1zkMItzM4
	U6CSRGb4vXw+gQCSv5xbJIa6ti3mxeNn6mDGq90YTHVBXTw4F
X-Google-Smtp-Source: AGHT+IG89FT+sEdQ1htQRFg/WpAQzp10MO14+uz710Q4if13hdsrIZAnlj1uKRp53tvlYrSQCaDJAya5vRYD/3hJuMc=
X-Received: by 2002:a2e:b8c8:0:b0:2fb:628c:2580 with SMTP id
 38308e7fff4ca-2fdec4ca247mr34789211fa.2.1730465374478; Fri, 01 Nov 2024
 05:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031200842.22712-1-brgl@bgdev.pl> <CACRpkdYTLOBtrhmRHjEu4b6tX8ROc6OHd=f1JAROVA9Rz1ngrA@mail.gmail.com>
In-Reply-To: <CACRpkdYTLOBtrhmRHjEu4b6tX8ROc6OHd=f1JAROVA9Rz1ngrA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 13:49:22 +0100
Message-ID: <CAMRc=Mdv9Bw2Y639u3RKWvQh6kitsD9ga3tYZyoFSCNtSFvcOQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: don't report GPIOs requested as interrupts as used
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 11:35=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Oct 31, 2024 at 9:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > GPIOs used as shared irqs can still be requested by user-space (or
> > kernel drivers for that matter) yet we report them as used over the
> > chardev ABI. Drop the test for FLAG_USED_AS_IRQ from
> > gpio_desc_to_lineinfo().
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I think at the time this was added to not let userspace meddle with
> such GPIO lines since they were used for "something" in the kernel.
> (Userspace as second-class citizen.)
>

Well, it wouldn't prohibit it. It would just report it misleadingly.
Since we'll guard the fixed input direction, I think we should be
fine.

Bartosz

> But I guess this is fine:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

