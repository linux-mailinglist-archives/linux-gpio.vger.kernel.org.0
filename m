Return-Path: <linux-gpio+bounces-18683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6EA84FB5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 00:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2C6B4C80E6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 22:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC291EBA03;
	Thu, 10 Apr 2025 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYqxCwHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4B1A5B9B
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744324481; cv=none; b=OzsBSE3FPtfX3LAc66PkombO4qAhTYfuTSBqMAmFtdZY4sLuhxbnw9cU6N8tmt72Lm9VMqi8F0LDEm7hDKywA9DkbXo+O0IaWpH7a/8BxcsZj1zsIyihieunHBPd0MVD7q9TXvDbr8OcCuByZ3HtS3KZ1Phhb69Tn4sgLRZpfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744324481; c=relaxed/simple;
	bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3+tGtnPIgFNd3sEtmrok8i3SLuanq2JFvKFzQ2730gS0fzpHPwWBQYTvPtaOLERoj/FpBGOiIMBsmsMISFc3Jab/+prNhSVbUP38Cc1pA+FEn4UKMXCfoJuH1Tqw2qGus8sg0AMxgLXrCkjf4iEw4+LAJs+NznS81WD4YNYnkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYqxCwHd; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso11135081fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744324477; x=1744929277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=jYqxCwHdHnnqKhroxew6oXqaqFEI2JsfqqI/rdYg3v6VU/L85Hg337AbxJy3m4qhRp
         JP+wPeyXYM2I9lK2hFZvsKRpGH8GlBv2K6zubBKnAMzJTx+IWUm8zcFRUV4HsMAyeAj5
         qd28iTFS/qCksMWxft3xpUEyKfTLdY8hfHDKo0rpG+okX9pK2N1cIienzfwKARr/cbAn
         J1s/Mo7Eez1JAF8Dffr5p0ELBkyHDOjNk8USgmyW1DHCauh53C+zFNY+breMxKq2uzPQ
         SgTiOP8+wxzzsCF7lvGqkfk5kBCOzYxNEE3A698K04LX/d0ZTq9HnLwcfR6YVpDjdjzZ
         H7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744324477; x=1744929277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=V8KErC34iBEbQ/FP0bRH+q5b3/bv/peuahXawmvy3ygpK4WFHf1u0mqNxX6rceHk64
         +XPgnD3rvKRU02eH26aJruNR7yacjO5MPguwms+ZAB9PVOdJiFqhth9Mo+5+vwNMKksB
         WPX84GysgsvjsVjxy942ycg9+Gi7+jZyXATJ4NVsoqcV19rqwjqRjr+yja75p9s5OO4O
         d9l9kO+wG+F1z7jM6jFQfMeYoAfkhM39BQ3SUvrspi3v3GvSDDmgyZ8tWdK6lQpZ+X8x
         +3BeS1T0rfHru0Uwv1HfcqEHrRlSOw3irZWCjDRMS5UIXy/so38szudLTWQ/tjz8qv7L
         1bXg==
X-Forwarded-Encrypted: i=1; AJvYcCWUgO1RgGs/Bb7figsOAzIH1X6tMxSDPQSr9zRRPoupTLcf+zOoDr68Ns2TFBBn89O/eXW915N+Q7D3@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtgeZAtc+aKPBGFs0PQGQupmdUs98R/uj2MPinRvUXoZAZsYS
	2MzyTeSgmm8PFP+YPjTYW+AHKfPd6S4b1uWPSgyUSdFgEbZIpgAP4PZGNUTkp4yPZ8Dmte99cJA
	cDHhbOxWOISuet9pjzfjR8CsZW4lcSRGWitriJA==
X-Gm-Gg: ASbGncuKf4V2kopw2TSkbtGxMWwCAUcSoKVBuZurzD9QlrYyQUXm4Jdfuu5jHWuFXXZ
	DDkHk7TZ2yX54I+16P86GKv46yL/Xi6gIr1zvIb4DsaBbMR4u4qBIuB8gS8F7TDDDf9udQWMIB+
	6XekjQdKizMijiqaCGQV8=
X-Google-Smtp-Source: AGHT+IFQ5X/At+JSFNbUE1xnp5LyBwwxt4xHNs/nHrO41KOgi6pNuGUXCpYt2H8bLi1d5Neb0s+pA/F8NRLAxfh8kDo=
X-Received: by 2002:a2e:ad92:0:b0:30b:d63c:ad20 with SMTP id
 38308e7fff4ca-31049a25e74mr1251291fa.24.1744324477293; Thu, 10 Apr 2025
 15:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318030717.781-1-vulab@iscas.ac.cn>
In-Reply-To: <20250318030717.781-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Apr 2025 00:34:26 +0200
X-Gm-Features: ATxdqUFAOAmsanh_qMDDdICzYFdtcgmjMNVzfkr1X-a4RyLKP9cm2UhbygtlpGw
Message-ID: <CACRpkdZ+VTCXudLC8L0zK6+Pwd+_NpFDfnR7nf16BXgEnXExeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:07=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> In atmel_pctl_dt_subnode_to_map(), the return value of
> pinctrl_utils_add_map_mux() needs to be checked, for the function
> will fail to associate group when the group map is full. Add error
> handling for pinctrl_utils_add_map_mux() to return immediately and
> propagate the error code to caller function when the function fails.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

