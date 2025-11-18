Return-Path: <linux-gpio+bounces-28710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7848C6BEE7
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07F174E8F35
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B112DE702;
	Tue, 18 Nov 2025 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGGLYhhv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ADB370304
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506921; cv=none; b=bmAp4Ju/TWwlRtkz4CJAmgmOJLpq7UURLP3j8bUWyRiLFDHG2FwYfNiQkLenVg5rZokaqo97khn8Udtks5CxPn7zBQjgVrrz0nRShlDmjVcG4dtuZIv0EDYfaRiz0ZbA0lp5UW+5Ygpodh7ENGXb1ah6ARD/92par4+PWQVHdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506921; c=relaxed/simple;
	bh=ufxmL3OK02TlwNuKOGsnXESl740fDQGpM2Lz0lmK6tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7AxH3+NRVoMqNBDtKLT8VlLJqXrTFWq0J9ccx1B/k1XVn4Dc0PHT5C9U5o3m5xBVCyAtv9DFiSEEsg1xKL+Xr0eVKwLt3bKu7vXojLQDQmXjLsVDXxT9/sHNUgTFBMsX5FFRjxZbAl57flqkwdvM3XvV51/gOfy2PYTfpXiYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGGLYhhv; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63fca769163so5716811d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506919; x=1764111719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siCp5mFpWwfh1f8xwoxhUJ4/70DgOMe2vhrDsZwypfM=;
        b=TGGLYhhvxJjHKNPvvZWvUcXqXIPwNOJfDl94hvkRR99/WG8zfQPfy53N3grcNIUyB0
         xV7o4ZVfSXl+G8gXdOtiY7Qnnhrp/VpcvksfOXSZ3graTScK7AUTV1RSZXZ4Wp5SS9gY
         W4Gmyu5GWM8sJ2zUjblTa0cfNFMVLV20B8NG4IDnqPSm4nkl26T4uMLCTbadWcuwlmhz
         N5ZsLfDwwDk1kuieoh5knkWZlTCR9wNcE9l3OGWtiQKee86qdqRwEQmiCYfw20hvk1Jg
         Sy0hdqM0Es39DsrNCZ6J4kcyv67vipCR5Q/WqxNF18hHwomwF3k6DZ3bFXQph1TFvcZ3
         ZUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506919; x=1764111719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siCp5mFpWwfh1f8xwoxhUJ4/70DgOMe2vhrDsZwypfM=;
        b=r7bXQvVhVbQq/lgFmVfDbEWhnzdc41bmyInX60YUQ739Z3oiPLVc6EDbKCgNUjbOjy
         l/0uP03mmRBJLygkZ3LtIZVFx5PDfb50/Acouf6ML6LXG8Z26EtuKtd+PFe6wr6AElVM
         DvIEl07Shq6lMkVcsYDynsjHa3GxivkXiO9aXqV5azgBeGNIfvk96vXER4EDznIcyH+G
         V6/nL9shO3UpnqYhMGZ8TkRrRVmN6AkTiXwqZ8hgayFq7/GYsyA/IsnBNgiO5HxCm92q
         53awXDK3b/9YWFS+Xz38hgQqcDXw8kt83N4RA6HJVOyY/YrgbAEXnVt+cnj3CcGN/xYK
         A5bQ==
X-Gm-Message-State: AOJu0Yx/9cI0I+D2qaaG7fy6pN9JbZ0Ht9om6FGrYmv6yF4D5jsO9EzP
	KfXCwcOE6I2fuoHVUQjORhQl/aJUVZGxyyWx9VDX6hgktxkjJUXzU3mn1LFxAtoBtms/XK2oCTM
	dF5CX0YSxVBe0vInSwYeW8G0vu/6/2pHA+YrRuDhFhxX13XhHkvW+VMM=
X-Gm-Gg: ASbGncvivqWkHEFT26qn8YjWv3YmfDOBVDPBnyG47zehO4D9L/YOnJIgFq9EcnFhApM
	Hq8Al/Sg8Ll/O6VwyHR6ibjlJj6CcKmUXDJI64YayyCP9///llaeMKCCAvNx3JgoySK3q755sQH
	pBdzfM3hq2AXWESFv08f7lL5aR4xxd1kFEAzFhr9EQlTZEm8Y1MwKyjYAPuvSkQfeNpXE4yq9RP
	d5eWoUduauuwA/D27n+XlXieOjAPV0umAOnP7EsOmrJx4yiSzMgZq2tBZfXipDOi/doWBk=
X-Google-Smtp-Source: AGHT+IFkIfIZSGXlXoHdIK0KxF1Ui+2gjebf74KqceRqzx5hm1mFEKojViTBDgnakclLb8RLYdMH4dUUBNlg7Kq5u2s=
X-Received: by 2002:a53:acc2:0:20b0:63f:b60b:a90 with SMTP id
 956f58d0204a3-641e74a5310mr12151827d50.11.1763506919194; Tue, 18 Nov 2025
 15:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763115734.git.geert+renesas@glider.be>
In-Reply-To: <cover.1763115734.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:01:29 +0100
X-Gm-Features: AWmQ_bnLRCROBXkURxehco0x0ro3Ovcsqk2h9bGYLa1bbfJsRmYC9f2E24b3xwo
Message-ID: <CACRpkdaozpZdmbN=qYc=Y76TS8o3QMgqb2pYH1k=iqGYMfcYww@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.19 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 11:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a5fad3aeff41f89ac94230d66ee5f9c1526cb3=
ce:
>
>   pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +=
0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.19-tag2
>
> for you to fetch changes up to 3b0cf6ab35909d7ac8d561e18159c62d42d914c2:
>
>   pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling (2025-11-1=
3 21:21:02 +0100)

Pulled in for v6.19!

Thanks Geert!

Yours,
Linus Walleij

