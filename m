Return-Path: <linux-gpio+bounces-21053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E30ACF0D0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4884F17B56E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D12586FE;
	Thu,  5 Jun 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvNoO3WB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD317257AF3
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130471; cv=none; b=etEUyeFV+yaDsF260/zuqon+BM77oMPK6PR8wALf/vK1A1GZO7QVqE6i+F2gzTNPxRKAEx8xdGhWqbpKy1JneoFlX1j1wtR+AVuVqtvixyrlGAnBZj37uuJcHfz3cwno1QAj3JrP1kefxJ9qe24tVmTwU2yvZYX5X2R2R4UJOpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130471; c=relaxed/simple;
	bh=vOICNqN98USb6CrWzrPe3jO4IKU6MEq8Zi+BY+9xBWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZAlh2msSJ3SWgJ698D9RNEJ8+387yuPSWY3ppGPMy/A4JFgPiBlLBKllJ8jwskopq9+C8Jw0yEVah7mng/7vYP6WjcQGudCwvEDPBa06oIKFzO/Or4s8X5wMYHuk+Bu1hvq8ZT8xMNQ9/kP+bg0OwOBzuQIMvNhFlFF4zPwl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvNoO3WB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55324e35f49so1045316e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130468; x=1749735268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdHw8SajT6NSEOVUedJOLVFr0dcQsp/AO6t3n5ZTzMA=;
        b=GvNoO3WBN74bOe2M7jIYXGBD3D+mzn4Zo82p2SFw1+kJHZuI+IvwJBF7OMQLYoY3pJ
         0sqov6ntD+M1DPT8cTU4EF0GDZTomr+0VtEuMPRmm1A05pyIZW+a8rj1AjTiGt0H+9pJ
         LmI2VUFd4QnaxaeO9cm4AFWG5eE4BDqsxoPWSwK+bpTJvhkUTuM6Md+FNjGHQmEeKP02
         yQe1VWUx2KL4MLa6KeScvYJInlJpoVaOmNrkakjevwoxCXrAVj8ap7lAkkwWmFa5mhtm
         ULYDSJ+Hvj6fU3UqpdFq/JmqoII6pIWaZ8dAG49lMn/sQCcWIPGY0cwiLnG+5DBi2YO0
         ux8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130468; x=1749735268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdHw8SajT6NSEOVUedJOLVFr0dcQsp/AO6t3n5ZTzMA=;
        b=G3uRINuJkmhtQNNuwH14Mpqa0g/PAYDZ9YfQzwrYbP0jbJOBLc8OPo+cVYtvMKMCft
         eF9iR2o2bYmAXECcZqm9RZpz6D4H8ZYn50qKkN+RQMXe2yi4XcbseBJ8if1OMY95uptS
         YxQm3AKJt3smXMrqEEanFC5WMWrMsEHHYWKhwMXLWklSidi8jezJolyShhtUgXS0cADH
         +AgVYTO71NenNXlPB1dfm5YdoL/meyRKdrKUceEyual6IILGnCBea7Lu8JG9xRWId5+R
         puQMrpC8aGcD2l7a8Ny76j7GXXH2d440UDRw6ifIv06a6aPtpkn5pckq2JJGybctIa9Z
         7mvg==
X-Gm-Message-State: AOJu0YwnkSXTMAB/9wP5UYbvvTDGusQK70zlZVNoY5VKg5IxtKiNr7sR
	hkZiQPpH6JnbsCgR2CYA5gwcKaOsUvVYXTEL+vewmjwl2Qtcrlnb+pG1F943zWhBv8i+tX/pFBq
	oF5uK7H0rgD8RXwJYRVPRCo2b/r9gseVyhrohBY+nUg==
X-Gm-Gg: ASbGncvOlJmok4RCLi7BAgbntBxl8gpGatJHkIRH9ZevjiAv84kkrYr9UvedLekm9OP
	G0PMeNGzBnZh14bqkDUAp8SJ3u37P4Q5ScT/RI64ONMv9L93nrWVctlHwmXUeyXq+PgR5+Ax4Gl
	KycbLKk0nRCHvGO8ibdZa7gUnpscxYU7SJ
X-Google-Smtp-Source: AGHT+IGwrsRhcxejm2B7TIv0Jmtzv081ls93xQzgyznzl4hNVDVZDc8rSTwawh7S/z8e7ya3iwoUv7ta05XF2Y24f5U=
X-Received: by 2002:a05:6512:a91:b0:549:38eb:d694 with SMTP id
 2adb3069b0e04-55357bacff5mr1686265e87.26.1749130467806; Thu, 05 Jun 2025
 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:34:16 +0200
X-Gm-Features: AX0GCFumg_yzf47SQes9X-E90Svhn2Zu4LV3i_LqM-EmbGGW0q70i3L_4Gmqvkk
Message-ID: <CACRpkdbbUbydRfm3zDV2xhRa59dw=-KYCANRwpeJOHBCMNB=4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tb10x: Drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 12:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF warning:
>
>   pinctrl-tb10x.c:815:34: warning: unused variable 'tb10x_pinctrl_dt_ids'=
 [-Wunused-const-variable]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505301317.EI1caRC0-lkp@i=
ntel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

