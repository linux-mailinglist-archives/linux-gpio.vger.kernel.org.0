Return-Path: <linux-gpio+bounces-27008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C460BD278E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91CF3A26CF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1202FE071;
	Mon, 13 Oct 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjsrcUe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F301A3154
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350145; cv=none; b=tk91DOMvxG5E4Ie3h61ALMurHWhF0+48m5LoGusxiSYHSkaaBmCXjckBwHk+8RkiljPiCJOm31jF32BDLyerj+iq9FcIUaqkCh0lXQMd/kgiFJ1O45jpCkgIAmUtZNXKcsX3OrI8cGC41Phltb6nW+AxbBeIgHvtgz2M5dAVy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350145; c=relaxed/simple;
	bh=BziZsaJ29p2j7+qiYkwkwh65tBbEFmB0tndDU4KHhFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fd4qk36Uy/HtxbcW8XXyslT5zKoMgOC2hQq+XP6UKsMOY6UAGDRXirUDDsvXqSFWBY9zbk3f6/lqGpfDaiJVgUo6gDlFaXiOoxOD7udQoUUuGoNO/Uv6jumZkHLAqcK6WWJBNCZz7bgMxijorMFGGXqNXVvQ3cJC2AJjYOW+BIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjsrcUe+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-36c0b946cb5so33080151fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350142; x=1760954942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=DjsrcUe+143ghk582CASiL3M0tTr3lNi/MVxGGQWoDxtntew3wLey6tTHfH5EIVdSk
         Hsw1rjIIbUefcE5YNTwy/XenXF23Usez/ELTaWjBsgvyldnl6mDDu4BXLwCMCJPScdRL
         zn7qG1PG6/Kjs5sgMllzn9+NnsIv0nNdXXJd8eNlPeVxZiGmH/qtNPj7gku7gikaSwyq
         vgdpURq2KyJWnV9TdqWu1aRDIErqP7TkWNms3BHgq7vGD2JBI4OUaJyb9LOh5JDCcQIb
         0NZbjwf6s25DtHvmk7R1eVnBWguBj7P/8L6I0Ifmmcw4FYjAiFkoQLT6P6Go2rq+zRl7
         o77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350142; x=1760954942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdoaiosx8DP44wjr+FKhiex7U2OYK/4Wfm7paNeyJNs=;
        b=UOJViR+8O4VvA9W9Qj0fFH3s4EGJWKrwp52wzu3AICfQSnlehC5MQQ9W++CkLLUHpD
         3AiJIbCVjDTe0zkVAL8UqhLrUHipKYWGsQITbbgiX8drLJUFaIkA42V54dEKEa0Y8LMJ
         N8zYG08sh5Nb5+wsYYv9yqQUa/dUamjni7MuJ3NyD5gS+v+zW9ddyd1ebc57NQEP4LWJ
         l2fxVx1YUwmRU5bPAUxNjZ29BpVxaJaw5gj8aEXxx7B23A/qBQg1w5oAfAGiBgG5/LMf
         d0/j5eEnZrWx+sW+DrG97BR569EY6URvJ5lH3fKc77gmcoZjNMNC5leMkyH4BwxwmjPU
         7jHA==
X-Forwarded-Encrypted: i=1; AJvYcCU9IJKl2h8nGwS99tIR5RieZbKvzIpJFNHxtorPlOncllt6h+Vyb5orK3gHvaY0lP7t20U4KR25aGpb@vger.kernel.org
X-Gm-Message-State: AOJu0YyhG+xSp/Yfgwi6dfGLnxF3LNUg4cPSTk8wkxRBEPQlkWUbuA8X
	Tgikox3AyhN2KwELx9pi0YEguGRHWAuIwPqYL57GUQ5yrgTPthTR9ZNklmvuNPX2EegfgIvbr19
	M+QiCFYx+LFExGMtm/Sd3TNcCh6ImKoSyCKu29R91RA==
X-Gm-Gg: ASbGncvVFnt9v7Oq5HRtajIdVdKIWvId1R5Z0CdLchMLG1d2tFiFtVv7R++WEuSCAfk
	VODWz03p/j5aZL/etk1UZrQTYOwVO2sNSsepgngPZzPi69q/m8desUqJdXqpvYOkCZAoiEfIV5Z
	KO/JPNhhpcpZprLlSQeRJSjWebw4rSGT5cSyDMz3yxWohO50ZwwNC9p8Pk16FIaUqevSjy0B/jV
	tODPlaSb7RMhgiwRIKBfSoa8NZ7WKkAPWzRzWr0
X-Google-Smtp-Source: AGHT+IGw5FBPHMZY98OuHAGpmxfzqUBjohFZCP4Y+3ye7G2Bxk75SIlnTIXF/kp1jPOVfGXssHiDF3M9kkzcVBZy+WM=
X-Received: by 2002:a05:651c:4385:20b0:376:41f5:a709 with SMTP id
 38308e7fff4ca-37641f5d53dmr17660371fa.48.1760350141633; Mon, 13 Oct 2025
 03:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:08:49 +0200
X-Gm-Features: AS18NWBxwqEgY4X_LszokVA-g-bopo-7ZyTrk7rGuaWxNocfJ07lm54aMEbkhdM
Message-ID: <CACRpkdbvTfJOBKOaEjje9dhnnjMXr1NqWpVBspe4Y8_WphaPSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for mt6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

thanks for your patches!

On Mon, Sep 15, 2025 at 2:46=E2=80=AFPM Igor Belwon
<igor.belwon@mentallysanemainliners.org> wrote:

> Igor Belwon (4):
>       dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bind=
ings
>       pinctrl: mediatek: Add debounce times for MT6878
>       pinctrl: mediatek: Add support for MT6878 pinctrl

These three applied to the pin control tree!

>       arm64: dts: mediatek: Add MT6878 pinmux macro header file

Please funnel this patch through the SoC tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
FWIW.

Yours,
Linus Walleij

