Return-Path: <linux-gpio+bounces-4236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 033ED877488
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 00:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D581F2131F
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 23:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7B342044;
	Sat,  9 Mar 2024 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZwRCWm0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CA5338A
	for <linux-gpio@vger.kernel.org>; Sat,  9 Mar 2024 23:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710027861; cv=none; b=T3p9l8PeadYNdcusPuFhIWaf8bVKnrUzPXlQLeu8JLg7XAPA6erNln8A6K9d7MOxgwLI7ra2zQ0VU1ucOOFim9Q5WhlGQRKjBebXG2KBgfsZKjRZdC/pLsK97aBMuOGA7pq70vXKHlwTYSR+xihqy4diSIqLd1n3ZmIUxUMXf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710027861; c=relaxed/simple;
	bh=op0Qt9OCIGPxK2ftDO9wvFEBViOhpXRW3d7uj0uwz/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UktfKNd8brqshpx1r9CNzut2Y5j4JDVT+L8KVcHRrrMwbFBNlAbfVzbWgRU770ggHqwwIXKEQoAiRqxmfWmtp2LxD0vD1HJV9zA2nO/rlyw/+TLSOFVjw6lCHcZR5cCVkIeiEwtipDlI4yNPA+iJgsijS2JFwqZFQouoLJjJ6QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZwRCWm0; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso2573178276.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Mar 2024 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710027858; x=1710632658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op0Qt9OCIGPxK2ftDO9wvFEBViOhpXRW3d7uj0uwz/s=;
        b=NZwRCWm0wQ0EFQLu2jbWSdvoYzgpkhhhrNN0CK/9AL4p+EcnMQZGEVyUxoAINCgdfS
         NaeXsKlTijotf3F9QQh8p0tDCBUEJVVf7Ti5ccD4sNC4y86KT804dVqMX7MU/p+SpSwS
         vogT4Ct9EKRnMSaV3p2UGvCE3ALl3XYIdYnE4Aesamq0hZMrrxg3VfeJ9KusHFH1EMsB
         vVH4ve3tVpDxn3Q8ubXn693aiBPexcisTzMQyLRMEaAfMt+1mSVV33fCjXGhGqzbDdsV
         bE9m25w6U7L4n7D3spebKexHAb01QI0DKUGhS2/tgrFKQ2wvvqq9dYGeDSMk+CQzE2M8
         5yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710027858; x=1710632658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op0Qt9OCIGPxK2ftDO9wvFEBViOhpXRW3d7uj0uwz/s=;
        b=vj5At1BIxbqrk17ojNIGLEJr/W1z4tqOrrROkYvE+W4KtfIybXuIQXEQKufTKZUyD9
         nC/jIpO24wB27A/sX/+vHM+cgErJx9H9Upf8D6BXNuLg5ja81H/w5ZaT9c+UZNVdFzWq
         Hw4OYruXxmTTzP+F3r7CXVeZkNU6iOGBt90204hOz3yNboLhqA6QNfDnGSp/xyTfrMVd
         bIyBc0shW5vdoehgMsANjjuq03spGqVsioM1lN+MdkRi2/vx7fEvtO/SzeEDln2qNPNi
         Lnry5Kt2no2patwBMavYlNh0TnQ1iousJo9x5J+cVwo8MWlIYrWmW0pjCgET05zADdcB
         UNdw==
X-Forwarded-Encrypted: i=1; AJvYcCXInHNnx3mWRnQtUk3wZL34xOaiIa/LBxPlFfHvcMGnTTqWPPx1N3a6LhSEzkNk3KCVkEavPrHqTs5gqfHvoccT9SnMohsdjfhZdg==
X-Gm-Message-State: AOJu0YwgtqbgKEOLDL+cQdfatFj5IQ85+cw2kiIfxhbc8GhkuQPF8UJz
	O7z+A11ucnEMDZtohicWmQXzDuth6Q4P254DfePVxuq0SSUPjbXlrzQfxhj3Lc16Ft2NoGoZiHs
	eEH5/iNuvcXR3P/Il9dz34vOtS10QWp1iu3E3nQ==
X-Google-Smtp-Source: AGHT+IG/G/2HnmXxlm98q5LWWzZBF4TgRPGOq/HsZonyF8llr7y9Cgv//r5JxaNkjnhcwXZFzlkz895oBDCCxsJd63o=
X-Received: by 2002:a25:6a8b:0:b0:dc6:e1ed:bd1c with SMTP id
 f133-20020a256a8b000000b00dc6e1edbd1cmr3212980ybc.21.1710027858382; Sat, 09
 Mar 2024 15:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129092512.23602-1-quic_tengfan@quicinc.com> <20240129092512.23602-2-quic_tengfan@quicinc.com>
In-Reply-To: <20240129092512.23602-2-quic_tengfan@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Mar 2024 00:44:06 +0100
Message-ID: <CACRpkdZ+n7qeYOSvfWPt2=yfWihY7cGQmnnMyDuB5O3yxmJcbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: update compatible name
 for match with driver
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 10:25=E2=80=AFAM Tengfei Fan <quic_tengfan@quicinc.=
com> wrote:

> Use compatible name "qcom,sm4450-tlmm" instead of "qcom,sm4450-pinctrl"
> to match the compatible name in sm4450 pinctrl driver.
>
> Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

Patch applied.

Yours,
Linus Walleij

