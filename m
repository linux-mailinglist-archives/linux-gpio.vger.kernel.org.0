Return-Path: <linux-gpio+bounces-12935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98A9C7078
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21FF2822DF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29A61F4FD4;
	Wed, 13 Nov 2024 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvNNgqQA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095901EF0BB
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504223; cv=none; b=osdy/FUHHWcX1lmsdrxyMH3HEfqxTO/HfaoJO2ADh56UCXYTQp0PYGQtvQHlOalmMI8YJDOVPOc8aMCS9OImR4JuJMooe+atWEckGImlSroR0ukAwDFl7E1VlF6ps05GSra8X12FS5nLJ1PrUw5CmzIuHJIrXGTi1ZPf5G/CZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504223; c=relaxed/simple;
	bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YES9mJDYAxcyVLCs84sY1xMjYvdW69lEsQXPYpB++R0By7eMBu1mGndL4wFJ/RpUyD9NvBOs8l066BN4BWZIRTIC92F1vXHUtY9en8e6mK3Hq3z9+1uFNAUh0PvqQCmq14SaKoDkuqHjk474lrwUAMJidrJfr9YsdT5Gw2Mzijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvNNgqQA; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so59774631fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504220; x=1732109020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=;
        b=TvNNgqQAom4J+vPDsca//Bm+fkLGbkZ3xHJjdOE/KlnpCRdO1GTpMnzfqCzIBEuQRK
         JrdzHjlTbPNBg2IeIZYjt7+Unz0hlAkmWavW3pjVOYup5mnM+YH0OLKBckorMM9HGBMZ
         S18uhbAes37NS+GAX2CkKRqMvXCAYlzVIIr6gfPfcvJKbkCOZfShVJLucHHD5s0RrYz4
         nQutorefTqs4TqaVkfZ4+Mcv1eqEMhKkOuAB3PzmwZDHH1YLyapZVoc16NVZqSXdINkU
         Y4jZ1ohmmNAk66wRwz4sx71ZBXFdYb4YazMD6tSjF1+HeVHTiC9esLIDhn1abBMn26AW
         jHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504220; x=1732109020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuUoL/3Od4PAfLx0IEVL7oxlLvlZraYaALoxt1cPU/4=;
        b=xHsJI85qnYZ5IoC95MDVtNKHSpOamgqXXHrx7CSbM8rwjxlz9dCw+ePJTN0cHHSDkR
         3lyDRMJpFuOfi9tJcn+M7BNmDHjUm+q3kvLhUJ3WisjAuVcMsOhxOWHdtS6ouurE9rSP
         d/AJmmP5mk++CvSRbhfdCzc6JvxEIcl5rF18a2I/cttdruvY/ufBi34wBu8ijZxjGKth
         njrCDP1bmZxC0mx0GVzJiQ5Ym6dIhoNastbYQtbMKqSwi6z/iGAdW9LveRJTYnC4TAx9
         i9RWijlPNsyM2g7J6VQtZsTeHOCaHgNIyK6yz5lN/EKzahgYKeGnVfQQEJBGLH50ROhO
         0Htg==
X-Forwarded-Encrypted: i=1; AJvYcCXFNIBk6B+Mh4GbB/RtXfPo5h8hWk+1a10rajyO7X3Lo90bC/k9JERqDqrhmgsEy6ihxNW8xK96tGMh@vger.kernel.org
X-Gm-Message-State: AOJu0YweTFXbnU6UZl26YtRXkyW+87qJanhhYDRMVQSEQPQoOrG80T6P
	FEJmUawz8lPMrBPpBxfRhfLU+vmotFy+Vidq0xvlr77zqsbeHmhrMRgyb41iLq8jttxKyjWlIwe
	oUQlGPbJfIH5aOrA7sM86ogHGmIc2Xnio86kHyA==
X-Google-Smtp-Source: AGHT+IHPQaK5Q2KrP40p6fsjtBW+uQBglC9BCYxI3zoro/0CrtBDXagUb0BV8QyEJHptozHMaCqcNJb9txvKEMn8wa4=
X-Received: by 2002:a2e:a552:0:b0:2fb:3bc0:9c7c with SMTP id
 38308e7fff4ca-2ff202e135amr113365511fa.25.1731504220103; Wed, 13 Nov 2024
 05:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-2-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:23:29 +0100
Message-ID: <CACRpkdaswgKiFXQMHgAW=eXCw=BG3+2oQTwq4PaAf7--vUiKiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

