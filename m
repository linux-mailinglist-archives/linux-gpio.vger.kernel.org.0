Return-Path: <linux-gpio+bounces-15905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FDA33E7A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 12:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19DA4188C1C0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 11:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECF421D3F8;
	Thu, 13 Feb 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xe5GaG9z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0C214A62
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447599; cv=none; b=cGUi8bcHiqAm+a4T9GmNDJHwrAme7O9Cn6CVL3wvwO6L8WMHk11vv184yCI3V+7SIqmRwyIgUSQMctvaOQ0TDPmvbYkXyHmnnlV6/Hbv9Pv/TysI4aHtcofmIioZvCAq9MARV/d8wWuyyZRWg6tcibj3imj46r5o9u/wWSABMr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447599; c=relaxed/simple;
	bh=FBAEzgfozo3sMyPEiMssFYNAXN9icWZt28ooDZsRqQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0sgqsqnPUpnLDUjv7jbyX6QYWXIGLgje2qPzQD+2ScEpdJUpv7FxrlcifggDJ8/KlPDTVTM1VPA3/slRd1qGI6IlhQ9P4h0ue1aUWEQIZ3ciI5j07wEBhicUICrVYidIewly5ohWEqHDGiaiD++0LLV4U5JLIIZQjWNiA8Wbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xe5GaG9z; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450cf0cb07so694950e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 03:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739447594; x=1740052394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBAEzgfozo3sMyPEiMssFYNAXN9icWZt28ooDZsRqQQ=;
        b=Xe5GaG9z8ovLTQZj9Fquy9D/vPxpVaO17WfohTBBdpOW9TGa5WFuAG/HUA0MsEW4OA
         gFvj/ywPu7V8Xs7t+JjoU5jAyJTaymZn/6WrF5mIDB5bqkAeQCtgG1R/ds4XihUhZfL0
         iPMVh/DGb9rW0PMB/dxVtli6/iqHGcSoYI35MvytMQ/41NoEkTs6fM99v6ejuyTMGnxT
         Xu6hvBwrx94qo+mUlfQ9ISovdHuAIsNqXBTWA87qkyB9fUkVHdp0dMSlxv3mCJKene/u
         78fctLVm2CO3oLKgUj7vHinqvoVKwedNJKJdL8YOORF4NvkOgo/zwztfUJfHn3nqZ178
         sC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739447594; x=1740052394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBAEzgfozo3sMyPEiMssFYNAXN9icWZt28ooDZsRqQQ=;
        b=TuWGAUaTJE2AIm81znjeMt/w4Qiw74RinnD0lxy7K8Jt+QNb3xt2TIpdiSXYiARdzP
         VOF/6s/7vAqPrtUbFYvS3vcozdvoWNLooV0xZqiUMfyC8fHCLWFkJ6TBC2GjHC/6sysQ
         Jzamaj1F7yqBdI03KJZs4svOKGF1fRVTYt7POEEM9yGJqhdTGGdxdJQg3cirLF2uWYKC
         L3+yCU0OkH+gDYSE7C7EjkA4V0rLUUXaXW10qClf7oed+HBPxUUtnsr7R6IJRC3C9V2/
         IvJd9ARl+kagCEBoeLJq6XZBJvM91rImvIBHC4vpwTBjuuDiGY0LjrPGWJbDVoKUIFVQ
         5+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX6QJVPzScCbh12926X/1TxLTp+o/fUlQfZJVBO4rWJZ4LINhoXFto7f8VUHHfQlG985T0W2D3kXP8q@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2/WNwdP2xtb9Ojv82W26C56rhevpvKPwihKzTrGQiyvpZ3ho
	AA8HA7vnnNSfeqO3S13wN6Lh+g+pQdV1uC76KBD7zqdS8XuMvolYOPMN5TIQqFF38QTN+IeDIbF
	8w5ZSaNr4ksS1Dphbw17Bnb0u9MAwnU/DN/nLwg==
X-Gm-Gg: ASbGncswE4c2uAtPct6R8tK5cTvP+7RFtV4b7pyyu6qaHjgaS04lsE7m5l9xZzhWD/F
	6C9M0J3H5qj3VQaCSR8Hl+QSCeVEDLPGWxWuhZZTAf93Mf/5nyBEtShoYFk3+jzEWPQU3c8hq
X-Google-Smtp-Source: AGHT+IFrJk2Lgcl9qLARw4zO2zXacUNTi5I8H/0MVApdZGwthvQgZMRi+CUpERAkupPLyPdAt6bDp9Kyi9iApJcwghU=
X-Received: by 2002:a05:6512:3da8:b0:545:c7d:1790 with SMTP id
 2adb3069b0e04-5451810cbbfmr1856800e87.22.1739447593668; Thu, 13 Feb 2025
 03:53:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738328714.git.mazziesaccount@gmail.com>
 <3d85fe979fca352bed4d9841e3233c055dfaf154.1738328714.git.mazziesaccount@gmail.com>
 <6867812e-7269-4686-9fc2-55afd9fa91bf@gmail.com> <CACRpkdaP6biD8ueeezBDw1P3LP6ARoJw0zfkmxC-QKK0fw79YQ@mail.gmail.com>
 <a52933a2-8b87-4e49-a346-91266fe3b675@gmail.com>
In-Reply-To: <a52933a2-8b87-4e49-a346-91266fe3b675@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 12:53:02 +0100
X-Gm-Features: AWEUYZngO0EMbmgu4N_VovTQxYF2iqEGDA2eFPLTfNLuuRjhlejPGJ-q9RrmeE0
Message-ID: <CACRpkdYMytiXoXrjTX3ts6ce1T6Xf4rSyk=sDP9fYz730Q-3bQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] pinctrl: Support ROHM BD79124 pinmux / GPO
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Nuno Sa <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:09=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> I just realized I should've shared the link to the v2 - which may not
> include all the recipients (because it no longer touches all the
> subsystems - and the get_maintainer.pl probably reduced the list of
> recipients). So, for anyone interested, here's the v2:
>
> https://lore.kernel.org/all/cover.1738761899.git.mazziesaccount@gmail.com=
/

Well it touches (uses) the gpio subsystem so the GPIO maintainers
should have been on CC...

This is one of the shortcomings of get_maintainers.pl really (also what
b4 is using): it does not know that if you use some specific APIs from
some specific .h files then some specific maintainers need to be on
CC.

It's because there is no hard rule: <linux/slab.h> - who cares? It's not
like the memory management people want to look at every user of
kmalloc()... <linux/gpio/driver.h> - this is a different story because
it's possible to get the semantics wrong.

That said, I looked at the patch in lore:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
for patch 4/5!

Linus

