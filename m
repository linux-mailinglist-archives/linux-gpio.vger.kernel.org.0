Return-Path: <linux-gpio+bounces-27836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9AC1B762
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E2134F9466
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537B1244671;
	Wed, 29 Oct 2025 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fNNBHgiM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D337A3DF
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747489; cv=none; b=p3/fnaW9hwOwb9gd2GhkYMLT8yD9XGArVNOzCQjIX5IJ0LoOaiwT2KNdSe4PmNksg6uo5nJEglJf9FCaHxad6bNFKcZSBZJA/2ivtTsnfOYC25Wrfh0Mlgj2LMHWYUjapp1exeCbZrBC3dDlgDWKiIXY7hmawUYrnq6UIIp5o14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747489; c=relaxed/simple;
	bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2hkwZwMmntRYnu61o5je0pNriJJ/gOrj2hh+5RuAoFLlpnK55npUdc/bmso4xylf4yprsz9TJ9h9bLVWmdvedNpqDCGPBhs6EKlk1tunYqmHBG5/zkTPTjfeBCNadG574i6iVN/cHI/e/U6Bw5MVWL4p26Wu+0ULGIq89qrcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fNNBHgiM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-592f600acb3so4151018e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747486; x=1762352286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=fNNBHgiMNI0TIlvEx6R6wRfbghAfSTazTR3aa08KdX5HGuHK8iWNWJCjUpzUuBXaR6
         yeQjhRM8DHkD+vh4DMZLHWCxMsWrj1twIaM0jL8JmhfpU2WvBpXYXSRWZJrYwgzpoVc2
         7m/Cz0PSY8P/KI/yhSXivQIdTCdLOAzX/vjVKuHaI/nGZ7+riZq6LKuDnwrtH6IK+GAo
         mubYsufFVqczHa5FdZk57qwU+oyQGqsm5pwnNgCxATNyWpro6XFhX8FTfLg5zWlJ0mHU
         ZXRdy0DRfuSxFtLmvXxe8A6Ym4EYdIyPG6mtzFvABxDKnrEu1KGIVju3KeVhi5/TcaIs
         nWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747486; x=1762352286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frTWN0cj1Au3rEU4gpiwgwDW+TjseVAAzDE0208pNEM=;
        b=Lbgm3BDb4HwLlymU0TmvKgVyTIi/YLiXZp4KLcFAtMzNg/KSuWrms8PHVptrszq2DT
         aXuyPn2TMj4oSORn+FpDD+kIXutTGyCTlpSzv+f8TVPzjoqNkQ2nbuoN8vmIAoxMEOJo
         4SrtTY9O2ehR3vd4PZjJP0H6MFa7itbXtbyNXLH3/vMIKK+lpDzfVd+2ebwoczh/Urnr
         oRbyc1iRzB22zU2G5o4qg1Ch1cp9rh0VkVwc3jXO+9o8AyxInC6u32tHGYuuWb5GACkE
         Lj05qMTrdlxz9CdJh/aWEg69yui/auO2DsGNNBdMinv1RM6FgsYtyXM5KlJrNRWt7zM9
         6EJw==
X-Forwarded-Encrypted: i=1; AJvYcCWuYRiL+oHndxnyMEPXit2SB1c6naia6C0Q1jmH3I/ALUKSjCjmSSECgaX66dP6jYy3FNTj59BS1X3F@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiAEyOiX3ppvQyScGaNnDKjwvrq7PjIT9+u5IO9nlkzo1Clpv
	hlbCOZLazPu8/Cw51b8YekbnYpFgdcrVuHH9M/DysW0wjWP8MMxjWD9hX/G//WccP1H4N5RCgiX
	w+UhUQxd7eyTq4KUFdwL8a4h7fNXgHy7QxQseDiec4g==
X-Gm-Gg: ASbGnctxSEMpcTYrs9BExLHgOtlSRppP3dPXAzeltO4rcQ1GbLz14UNVhDWokBXaZIs
	wjgxS2fo1v8YdnNvDsROPuoQhTUfc6RCziGUJFBatpagCXAe9zd/HN5yiTvX3NX6s+uyyNBV1Rm
	WNtQYSlXDNDuUcy9WEtPQDoxCtLdbb1i9U2+sUcrrv5VNEYISODm9A1B6juOHsx8lfPeqnChGsT
	nNenrKQNGwjtnSx22C8OeXqB+0Pqe4WF45EtcQQ3uceGOVyU8QiBdPyT97LGwFAu0xqfNoKdr/y
	Lja/Pw==
X-Google-Smtp-Source: AGHT+IEZ48qPNDXi/VZK0viwyJMlNZCVVeDAAKNtz0dWhXoCt8yrbWYQfSCBbIwkB65d0mwMlwxIaale+Ln0IHl2XVM=
X-Received: by 2002:a05:6512:1253:b0:55f:4efe:42df with SMTP id
 2adb3069b0e04-59412c47659mr1221054e87.40.1761747485600; Wed, 29 Oct 2025
 07:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761576798.git.dan.carpenter@linaro.org> <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
In-Reply-To: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:17:53 +0100
X-Gm-Features: AWmQ_bkpWoC7MJl6ilguYr2pkMyaF1lhvihQmCr9qcCK8P7laPbsgsH7ZdH72KA
Message-ID: <CACRpkdZMQh2ozd_YTjRgUvVwdAwHpDz9G+ZYYHBQ456GLjPZZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-scmi: remove unused struct members
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 4:18=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The ->pins and ->nr_pins members are not used so delete them.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij

