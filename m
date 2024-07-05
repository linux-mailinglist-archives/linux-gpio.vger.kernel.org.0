Return-Path: <linux-gpio+bounces-8069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE26928670
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 12:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507A51F22F74
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19155145FF5;
	Fri,  5 Jul 2024 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaRKZUbb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C341422DD
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720174210; cv=none; b=X5hF6UJeZqZFouwRzFaSz8y1iqwcC1vEBZcI96xzwReshuPe5nNhp+A9fKXdGkMWFNzvKK+ETX9NF7xCES8jdD8W8YVNDQ46XqY5FtbKF6NckMmzw57SwEWSwxkKu+xbq4U31fORixRfNuK6ESP548H2PCsBULvhdLq9C2ZDoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720174210; c=relaxed/simple;
	bh=c9HKBSkU881QyZ6TmYsFOtG6cblNGj4kJLXG8VMTfW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZLA90M+rp6gBH+T5CFKeoNZ1scxfPCrbCwciMLRVfdWcxboavR+USoE1WVqNHRzFserdvq1I6mn9rQCXztQJ0wrel7vaBNNqZPE4L1EN4M42gE0DxcCbp3eFfO5HpVWxdaZRkqMBHq4udxMttNoIVdxadACUrcMboO56z9o6Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaRKZUbb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee920b0781so10232031fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720174207; x=1720779007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zL+hYPsUGikEvYevKEPW0lYUrvC/7OhcuhwA43XQsI=;
        b=LaRKZUbbLsN6nBtBs08/oi4/e66nqDUJm5RCrDDHuSzVfxTehC4is227SIX9hKzL9t
         BKavV24PwiB+wVl7OzNxWWfurCcMkx+fTWsfkWgvJYfaMv6nqTTWGXEQDoZWEuGEd0hu
         ct327XeHHFqzQdsPVdcnjD8OqnRlCJMYtp3OrDVa+uhS6AAqU7PVGTkcq17mvplKpO5g
         MpafCBYQqHfeboFzXJBtDvM0csJoVPCvYX18n7o9m+eEERhTiVHsYr7HzQ9rDKBzH2ZF
         jwFClDj15pS0Hy381vTsMLNqCtkvNFU/EN2uDFtaZ3bBq3+h+9Ac+DQf0U7AUFYqMVgD
         tL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720174207; x=1720779007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zL+hYPsUGikEvYevKEPW0lYUrvC/7OhcuhwA43XQsI=;
        b=VrcfxM5cnXnUUFh38i+k8dZn4o21lRlcRiwoRfHnun+RFueV6Rxd+CSs2PBhoGngOR
         Ps+TKoRcWuk+JviMGgtlIHDzN8LfJqXVYYpBegS/7piQAvXFvC8f51XSVuxMXpeGZVeg
         MzXF1VAIFpypMt6P5y++jlJ9ryfIXkeZCd1coPph17K0XHTpm9Sys9IUD9fB0tDgu3T2
         +6kwsSMuGLonAXZIMF4/HSPjwI2VktcjAf+kLr871y2qoX0/oEwTeF6jCGuIULL9jAWY
         1d3sCQeoVxJQINWfDqvwi8ZdHAKQR/4tOo1qmdZTQ7TabTc8fbVe14EsUAuWtf6cMmCl
         NAjw==
X-Gm-Message-State: AOJu0YzItm7MLslrZE+E+48d9AJKtOxFrPSyUMl8cS5E8pcgLCya69ev
	Cu5w9PzpnWSahq+NRf9S72niMMhV9J4rUpuxuzLHNIf/onderWrz06p493ilSj5kxRR42JhXuzq
	wZnhwsJg9HDssp26wDBHFS12utlr+fGhL/zeDAw==
X-Google-Smtp-Source: AGHT+IFv5JfLcSkOP8U2CR1h8+P7JKu8p+xD5A6Q83YEsiD0frFc4MeILWhzwfbxJxNK0TUkLCcP+X9AZOokpyU8KsI=
X-Received: by 2002:a2e:be0f:0:b0:2ee:7b7c:7f6e with SMTP id
 38308e7fff4ca-2ee8ee01a91mr36027841fa.39.1720174207338; Fri, 05 Jul 2024
 03:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720170526.git.geert+renesas@glider.be>
In-Reply-To: <cover.1720170526.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jul 2024 12:09:55 +0200
Message-ID: <CACRpkdbF6w7eJeP6sMFmTBi-7Ud7Ch9EyASAaHmNsxwQvQc1-Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.11 (take three)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 11:15=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 71062e52fc0aea0f3477aaaaa789226388a7ee=
af:
>
>   pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-07-01 11:2=
7:39 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.11-tag3
>
> for you to fetch changes up to 2453e858e945e5e2fa8da9fde8584995e7dd17d1:
>
>   pinctrl: renesas: rzg2l: Support output enable on RZ/G2L (2024-07-04 19=
:22:03 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

