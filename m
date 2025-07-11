Return-Path: <linux-gpio+bounces-23174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22FB0236D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813B1A62525
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8FD2F1FF1;
	Fri, 11 Jul 2025 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+POjVBR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E206149E17
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257723; cv=none; b=ot5WurOthjgIoxRr80wIpXSsAgB3QGJ6zkdnvahvb0Bztb8Jd5Tgso1qV9UUE2PmKx2MrrQrF0zq7S3VKMLqtWImCiVm5Z3jo2MJ0r/JimTBu1+CxNwc2NLSDagOwow8OI2awL9dSHYd1O4xN7A6k3OAWmml18hdKhuxBpFw1CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257723; c=relaxed/simple;
	bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkGaPvXi77hlSdaAzrzhBUeIIfG9TpokjkoIGFr+ZtHUiO+ngsqnhlMwOgVSPqVPYJvIOjbqpzithC4diYoIZn7VGTpxUw5+3htaaq3dwLr7ue/1CEcZUoas4EPk8OggXTMYUXm3LXqG059CfcJGM55FkDPdIfByj7KE6TK6OWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+POjVBR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b4876dfecso35474631fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257719; x=1752862519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=y+POjVBREK/2j/fBXbbuU78AHzy98MPxVnMfpwLdpp1tT73QnN2I+MSQLSuljMLBBF
         w1aS87Cl0qGbmpQmNjBUBRY8RC0BQCjtyiG3EeVNKm5tiLPizj5BTaz8ohlMtUK7t8If
         XIg6V4rWSzg3sA0vboVNP1OsgMi1KhbRPqTF5LA6dLTPtX2DwwBG1JDR7Zvv2HJ8aCUp
         3P/qG7Xf/Xx6QWwMo8CzqINMyA1ctPO8AViCddyrCkvO+KzXbxdhQZPm50nWFrhqqBmp
         sbNgRJrhGdwefOIuydN2ZHzjDrpXD1pUj+EZKY5xUIGcqtyfw98+o8nBGGC+Eht79TnT
         vQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257719; x=1752862519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=Can0pq6Xvz8u+v4+RIw3Ijnz9dZPvo0LTkNunEeS+BGaj/AcQ5zyuA6A38Ke0XwGBz
         3drrfbDvIGrVDTCNd5iTH6oCcBmsoYJsjgEJa2e4f+SCg5aSwSXddMFL8pr52D/GV0wf
         OSaqrPNmG7xmH1YskZO1FmpcfreTAIaX38vUKnSFtNYkxaI5raoSogsa18Kzs9EEqgFu
         SvSmO2Zd0F1UnLWwiYSTrzmbEfmwpfJTdVnb2yqG7c2uspi6dSI+zLshXneD+Okj20xV
         KtUx2qjxCxyPz0751sKWWK4Rn4LqPtMx2TtcIfqkufcm92fWwrT3H46e6AjOXXJqer8t
         mEhA==
X-Forwarded-Encrypted: i=1; AJvYcCVtEeMZ4GUikZ/+aGGOsnYTTsAaRGxeRhWmQFxIpaRv8kIWsibCKwkuPalWFlqbz9naCCyuYqTbkyQY@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJuUMpFmxK4B4aBaq2S+q6sdQQgnHxoVqt1d2JqbJlOXYQvX4
	9atPea/jBM2CGI/J0f9ODb3g26YcTWKQkSyORynru3M54V9R46HjOLvnsiBRPseuaFpkOxxVNaR
	9fY/kfI320Z97kztJMrcYZF8nZvPY/yHadU26P8Aw6A==
X-Gm-Gg: ASbGncvolwiSVeXeR+mNiBe73UfFPI7J04gUaZ5HUr44TdktaEfOa+gtgwQpKWi98tY
	PxxHWAHsoydbLknY7A/jnNlI7WiNCSPBLtmXIux+lH3dTNEm1X41rgpfWM0MTIHBHb2ziKDJ87d
	HlWB0/VfNKzjiOcVSTafUPlBCFUNIcbK7c5lEyiZuokKn5nSw3IWDqG0wvwQwxaEIOwmaIuFQwb
	pxvgyLGgVOlw/CL2w==
X-Google-Smtp-Source: AGHT+IFtq0bcfpLwnjm7lAoyNxi5hVnB1TfQxkFuJUC5AXv/cwm7YJlwpXzO1clCMxtNVbmVPeTDx2oSZPEXUcqu/sw=
X-Received: by 2002:a05:651c:b0c:b0:32b:968d:2019 with SMTP id
 38308e7fff4ca-330522ae9a3mr17428231fa.18.1752257718550; Fri, 11 Jul 2025
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-2-paulk@sys-base.io>
 <20250708003236.059ba94d@minigeek.lan>
In-Reply-To: <20250708003236.059ba94d@minigeek.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:15:07 +0200
X-Gm-Features: Ac12FXytqUPkCHhoaHentXWpf1pNxNpNZTLS_vr2xp21e1XJ93lgB-y8FM3uD_g
Message-ID: <CACRpkdZjbGLiZYLYxz5UoMXyuhv7vBipy7YRkhMYUfZLgXr_ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin function name"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 1:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> > Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> many thanks for sending this, it looks good to me now. I just wonder if
> the original patch can be still backed out, I think it would be still
> time before the v6.17 PR?

Yeah I just dropped the patch :)

Yours,
Linus Walleij

